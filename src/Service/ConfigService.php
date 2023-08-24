<?php

namespace App\Service;

use App\Entity\Reservation;
use DateTime;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ConfigService
{
    private string $configFilePath;

    public function __construct(ParameterBagInterface $parameterBag)
    {
        $this->configFilePath = $parameterBag->get('config_directory');
    }

    // ! --------------- CONFIG

    public function getConfigByName(string $name = null): array
    {
        $config = $this->getConfigData();

        if ($name === null) return $config;

        return $config[$name] ?? [];
    }

    private function getConfigData(): array
    {
        $json = file_get_contents($this->configFilePath);
        return json_decode($json, true);
    }

    private function saveConfigData(array $data): void
    {
        $newJson = json_encode($data, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
        file_put_contents($this->configFilePath, $newJson);
    }

    // ! ----------------- CAMPING

    public function getCamping(): array
    {
        $config = $this->getConfigData();

        return $config['camping'];
    }

    public function updateCamping(array $camping): void
    {
        $config = $this->getConfigData();

        $config['camping'] = $camping;

        $this->saveConfigData($config);
    }

    // ! ----------------- PRICES RULES

    public function getPricesRules(string $type = null): array
    {
        $config = $this->getConfigData();

        if ($type === null) return $config['prices'];

        return $config['prices'][$type] ?? [];
    }

    public function getLastPricesRules(string $type, int|string $id): int
    {
        $lastId = $this->getPricesRules($type)[$id]['rules'];
        $lastId = end($lastId);

        return $lastId ? $lastId['id'] : 0;
    }

    public function addPriceRule(string $type, int|string $typeId, array $rule): void
    {
        $config = $this->getConfigData();
        $config['prices'][$type][$typeId]['rules'][] = $rule;
        $this->saveConfigData($config);
    }

    public function updatePriceRule(string $type, int|string $typeId, array $rule): void
    {
        $config = $this->getConfigData();
        foreach ($config['prices'][$type][$typeId]['rules'] as $index => $oldRule)
            if ($oldRule['id'] === $rule['id'])
                $config['prices'][$type][$typeId]['rules'][$index] = $rule;

        $this->saveConfigData($config);
    }

    public function deletePriceRule(string $type, int|string $id, int $ruleId): void
    {
        $config = $this->getConfigData();
        foreach ($config['prices'][$type][$id]['rules'] as $index => $rule)
            if ($rule['id'] === $ruleId)
                unset($config['prices'][$type][$id]['rules'][$index]);

        $this->saveConfigData($config);
    }

    public function getAccomodationPriceBySeason(int $accomodationId, array $seasonConfig)
    {
        $priceConfig = $this->getPricesRules('places')[$accomodationId];

        foreach ($priceConfig['rules'] as $index => $priceRule)
            if (in_array($seasonConfig['name'], $priceRule['seasons']))
                $price = $priceConfig['rules'][$index]['amount'];
            elseif (in_array(null, $priceRule['seasons']))
                $price2 = $priceConfig['rules'][$index]['amount'];


        return $price ?? $price2;
    }

    public function getAdultPriceBySeason(array $seasonConfig)
    {
        $priceConfig = $this->getPricesRules('ages')['adult']['rules'];

        foreach ($priceConfig as $index => $priceRule)
            if (in_array($seasonConfig['name'], $priceRule['seasons']))
                $price = $priceConfig[$index]['amount'];
            elseif (in_array(null, $priceRule['seasons']))
                $price2 = $priceConfig[$index]['amount'];


        return $price ?? $price2;
    }

    public function getChildPriceBySeason(array $seasonConfig)
    {
        $priceConfig = $this->getPricesRules('ages')['children']['rules'];

        foreach ($priceConfig as $index => $priceRule)
            if (in_array($seasonConfig['name'], $priceRule['seasons']))
                $price = $priceConfig[$index]['amount'];
            elseif (in_array(null, $priceRule['seasons']))
                $price2 = $priceConfig[$index]['amount'];


        return $price ?? $price2;
    }

    // ! ----------------- SEASON

    public function getSeasons(): array
    {
        $config = $this->getConfigData();

        return $config['seasons'] ?? [];
    }

    public function getLastSeason(): int
    {
        $lastId = $this->getSeasons();
        $lastId = end($lastId);

        return $lastId ? $lastId['id'] : 0;
    }

    public function addSeason($season): void
    {
        $config = $this->getConfigData();
        $config['seasons'][$season['id']] = $season;
        $this->saveConfigData($config);
    }

    public function updateSeason(int $id, array $season): void
    {
        $config = $this->getConfigData();
        $config['seasons'][$id] = $season;
        $this->saveConfigData($config);
    }

    public function deleteSeason(int $seasonId): void
    {
        $config = $this->getConfigData();
        unset($config['seasons'][$seasonId]);
        $this->saveConfigData($config);
    }

    public function getSeasonByDate(string $date): array
    {
        $seasons = $this->getSeasons();

        foreach ($seasons as $seasonId => $seasonValue)
            foreach ($seasonValue['rules'] as $seasonRule)
                if ($this->isDateRangeMatching($seasonRule['start'], $seasonRule['end'], $date))
                    $season = $seasons[$seasonId];

        return $season ?? ['name' => null];
    }

    // ! ------------ SEASON Rules

    public function getLastSeasonRule(int $seasonId): int
    {
        $lastId = $this->getSeasons()[$seasonId]['rules'];
        $lastId = end($lastId);

        return $lastId ? $lastId['id'] : 0;
    }

    public function addSeasonRule(int $seasonId, array $rule): void
    {
        $config = $this->getConfigData();
        $config['seasons'][$seasonId]['rules'][] = $rule;
        $this->saveConfigData($config);
    }

    public function updateSeasonRule(int $seasonId, array $rule): void
    {
        $config = $this->getConfigData();
        foreach ($config['seasons'][$seasonId]['rules'] as $index => $oldRule)
            if ($oldRule['id'] === $rule['id'])
                $config['seasons'][$seasonId]['rules'][$index] = $rule;

        $this->saveConfigData($config);
    }

    public function deleteSeasonRule(int $seasonId, int $ruleId): void
    {
        $config = $this->getConfigData();

        foreach ($config['seasons'][$seasonId]['rules'] as $index => $rule)
            if ($rule['id'] === $ruleId)
                unset($config['seasons'][$seasonId]['rules'][$index]);

        $this->saveConfigData($config);
    }

    // ! RESERVATIONS RULES

    public function getReservationsRules(string $type = null): array
    {
        $config = $this->getConfigData();

        if ($type === null) return $config['reservations'];

        return $config['reservations'][$type] ?? [];
    }

    public function getLastReservationRule(string $type): int
    {
        $lastId = $this->getReservationsRules($type);
        $lastId = end($lastId);

        return $lastId ? $lastId['id'] : 0;
    }

    public function addReservationRule(string $type, array $rule): void
    {
        $config = $this->getConfigData();
        $config['reservations'][$type][] = $rule;
        $this->saveConfigData($config);
    }

    public function updateReservationRule(string $type, array $rule): void
    {
        $config = $this->getConfigData();
        foreach ($config['reservations'][$type] as $index => $oldRule)
            if ($oldRule['id'] === $rule['id'])
                $config['reservations'][$type][$index] = $rule;

        $this->saveConfigData($config);
    }

    public function deleteReservationRule(string $type, int $ruleId): void
    {
        $config = $this->getConfigData();
        foreach ($config['reservations'][$type] as $index => $rule)
            if ($rule['id'] === $ruleId)
                unset($config['reservations'][$type][$index]);

        $this->saveConfigData($config);
    }

    public function checkReservationRules(Reservation $reservation, array $season)
    {
        $startDay = $reservation->getStart()->format('N');
        $endDay = $reservation->getEnd()->format('N');
        $numberOfDays = $reservation->getStart()->diff($reservation->getEnd())->format('%a%');

        $checkInDays = $this->getReservationCheckIn($reservation, $season);

        if (!in_array($startDay, $checkInDays) && !in_array(null, $checkInDays))
            return $error = ['rule' => 'checkIn', 'value' => $checkInDays];

        $checkOutDays = $this->getReservationCheckOut($reservation, $season);

        if (!in_array($endDay, $checkOutDays) && !in_array(null, $checkOutDays))
            return $error = ['rule' => 'checkOut', 'value' => $checkOutDays];


        $minStay = $this->getReservationMinStay($reservation, $season);
        if ($minStay && $minStay > $numberOfDays)
            return $error = ['rule' => 'minStay', 'value' => $minStay];


        $maxStay = $this->getReservationMaxStay($reservation, $season);
        if ($maxStay && $maxStay < $numberOfDays)
            return $error = ['rule' => 'maxStay', 'value' => $maxStay];


        return null;
    }

    public function getReservationCheckIn(Reservation $reservation, array $season)
    {
        $rules = $this->getReservationsRules()['checkIn'];
        $accomodation = $reservation->getLocation()->getAccomodation();

        foreach ($rules as $checkIn) {
            if (in_array($accomodation->getName(), $checkIn['places'])) {

                if (in_array($season['name'], $checkIn['seasons']))
                    $rule = $checkIn['days'];
                elseif (in_array(null, $checkIn['seasons']))
                    $rule2 = $checkIn['days'];
            } elseif (in_array(null, $checkIn['places'])) {

                if (in_array($season['name'], $checkIn['seasons']))
                    $rule3 = $checkIn['days'];
                elseif (in_array(null, $checkIn['seasons']))
                    $rule4 = $checkIn['days'];
            }
        }

        return $rule ?? $rule2 ?? $rule3 ?? $rule4 ?? false;
    }

    public function getReservationCheckOut(Reservation $reservation, array $season)
    {
        $rules = $this->getReservationsRules()['checkOut'];
        $accomodation = $reservation->getLocation()->getAccomodation();

        foreach ($rules as $checkOut) {
            if (in_array($accomodation->getName(), $checkOut['places'])) {

                if (in_array($season['name'], $checkOut['seasons']))
                    $rule = $checkOut['days'];
                elseif (in_array(null, $checkOut['seasons']))
                    $rule2 = $checkOut['days'];
            } elseif (in_array(null, $checkOut['places'])) {

                if (in_array($season['name'], $checkOut['seasons']))
                    $rule3 = $checkOut['days'];
                elseif (in_array(null, $checkOut['seasons']))
                    $rule4 = $checkOut['days'];
            }
        }

        return $rule ?? $rule2 ?? $rule3 ?? $rule4 ?? false;
    }

    public function getReservationMinStay(Reservation $reservation, array $season)
    {
        $rules = $this->getReservationsRules()['minStay'];
        $accomodation = $reservation->getLocation()->getAccomodation();

        foreach ($rules as $minStay) {
            if (in_array($accomodation->getName(), $minStay['places'])) {

                if (in_array($season['name'], $minStay['seasons']))
                    $rule = $minStay['amount'];
                elseif (in_array(null, $minStay['seasons']))
                    $rule2 = $minStay['amount'];
            } elseif (in_array(null, $minStay['places'])) {

                if (in_array($season['name'], $minStay['seasons']))
                    $rule3 = $minStay['amount'];
                elseif (in_array(null, $minStay['seasons']))
                    $rule4 = $minStay['amount'];
            }
        }

        return $rule ?? $rule2 ?? $rule3 ?? $rule4 ?? false;
    }

    public function getReservationMaxStay(Reservation $reservation, array $season)
    {
        $rules = $this->getReservationsRules()['maxStay'];
        $accomodation = $reservation->getLocation()->getAccomodation();

        foreach ($rules as $maxStay) {
            if (in_array($accomodation->getName(), $maxStay['places'])) {

                if (in_array($season['name'], $maxStay['seasons']))
                    $rule = $maxStay['amount'];
                elseif (in_array(null, $maxStay['seasons']))
                    $rule2 = $maxStay['amount'];
            } elseif (in_array(null, $maxStay['places'])) {

                if (in_array($season['name'], $maxStay['seasons']))
                    $rule3 = $maxStay['amount'];
                elseif (in_array(null, $maxStay['seasons']))
                    $rule4 = $maxStay['amount'];
            }
        }

        return $rule ?? $rule2 ?? $rule3 ?? $rule4 ?? false;
    }

    // ! ------------ SERVICES 

    public function getServices(int $id = null): array
    {
        $config = $this->getConfigData();

        if ($id === null) return $config['services'];

        return $config['services'][$id] ?? [];
    }


    public function getLastService(): int
    {
        $lastId = $this->getServices();
        $lastId = end($lastId);

        return $lastId ? $lastId['id'] : 0;
    }

    public function addService($service): void
    {
        $config = $this->getConfigData();
        $config['services'][$service['id']] = $service;
        $this->saveConfigData($config);
    }

    public function updateService(int $id, array $service): void
    {
        $config = $this->getConfigData();
        $config['services'][$id] = $service;
        $this->saveConfigData($config);
    }

    public function deleteService(int $serviceId): void
    {
        $config = $this->getConfigData();
        unset($config['services'][$serviceId]);
        $this->saveConfigData($config);
    }


    public function getLastServicesRule(int $serviceId): int
    {
        $lastId = $this->getServices($serviceId)['rules'];
        $lastId = end($lastId);

        return $lastId ? $lastId['id'] : 0;
    }

    public function addServiceRule(int $serviceId, array $rule): void
    {
        $config = $this->getConfigData();
        $config['services'][$serviceId]['rules'][] = $rule;
        $this->saveConfigData($config);
    }

    public function updateServiceRule(int $serviceId, array $rule): void
    {
        $config = $this->getConfigData();
        foreach ($config['services'][$serviceId]['rules'] as $index => $oldRule)
            if ($oldRule['id'] === $rule['id'])
                $config['services'][$serviceId]['rules'][$index] = $rule;

        $this->saveConfigData($config);
    }

    public function deleteServiceRule(int $serviceId, int $ruleId): void
    {
        $config = $this->getConfigData();

        foreach ($config['services'][$serviceId]['rules'] as $index => $rule)
            if ($rule['id'] === $ruleId)
                unset($config['services'][$serviceId]['rules'][$index]);

        $this->saveConfigData($config);
    }

    // ! ---------------- MONEY

    public function getTaxes(int $taxId = null): array
    {
        $config = $this->getConfigData();

        if ($taxId === null) return $config['taxes'];

        return $config['taxes'][$taxId] ?? [];
    }

    public function getLastTaxes(): int
    {
        $lastId = $this->getTaxes();
        $lastId = end($lastId);

        return $lastId ? $lastId['id'] : 0;
    }

    public function addTax(array $tax): void
    {
        $config = $this->getConfigData();
        $config['taxes'][$tax['id']] = $tax;
        $this->saveConfigData($config);
    }

    public function updateTax(int $taxId, array $tax): void
    {
        $config = $this->getConfigData();
        $config['taxes'][$taxId] = $tax;
        $this->saveConfigData($config);
    }

    public function deleteTax(int $taxId): void
    {
        $config = $this->getConfigData();
        unset($config['taxes'][$taxId]);
        $this->saveConfigData($config);
    }

    public function getPaiements(): array
    {
        $config = $this->getConfigData();

        return $config['taxes'];
    }

    public function updatePaiements(string $type, bool $bool): void
    {
        $config = $this->getConfigData();
        $config['paiements'][$type] = $bool;
        $this->saveConfigData($config);
    }

    // ! ---------------- TOOLS

    public function getPlacesChoices(): array
    {
        // TODO: fetch la bdd pour les emplacements
        $seasons = $this->getConfigByName('seasons');

        $choices = ["Tous" => null, "Camping-car" => "Camping Car"];

        return $choices;
    }

    public function getSeasonsChoices(): array
    {
        $seasons = $this->getConfigByName('seasons');

        $choices = ["Toutes" => null];
        foreach ($seasons as $season) {
            $choices[$season['name']] = $season['name'];
        }

        return $choices;
    }

    public function getDaysChoices(): array
    {
        return [
            "Tous" => null,
            "Lundi" => 1,
            "Mardi" => 2,
            "Mercredi" => 3,
            "Jeudi" => 4,
            "Vendredi" => 5,
            "Samedi" => 6,
            "Dimanche" => 7,
        ];
    }

    public function getServicesChoices(): array
    {
        $services = $this->getServices();
        $choices = [];
        foreach ($services as $service) {
            $choices += [$service['name'] => $service['id']];
        }

        return $choices;
    }

    public function isDateRangeMatching(string $start, string $end, string $date): bool
    {
        $startValue = new DateTime($start);
        $endValue = new DateTime($end);
        $dateValue = !str_contains($date, '/') ? new DateTime($date) : new DateTime(join("-", array_reverse(explode("/", $date))));

        return $dateValue >= $startValue && $dateValue <= $endValue;
    }
}
