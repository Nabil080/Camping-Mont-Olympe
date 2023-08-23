<?php

namespace App\Service;

use App\Entity\Accomodation;
use App\Entity\Location;
use App\Entity\Reservation;
use App\Repository\AccomodationRepository;
use App\Repository\LocationRepository;
use App\Repository\ReservationRepository;
use Symfony\Component\Validator\Constraints\Date;

class ReservationService
{
    private AccomodationRepository $accomodationRepository;
    private LocationRepository $locationRepository;
    private ReservationRepository $reservationRepository;
    private ConfigService $configService;

    public function __construct(AccomodationRepository $accomodationRepository, LocationRepository $locationRepository, ReservationRepository $reservationRepository, ConfigService $configService)
    {
        $this->accomodationRepository = $accomodationRepository;
        $this->locationRepository = $locationRepository;
        $this->reservationRepository = $reservationRepository;
        $this->configService = $configService;
    }

    public function getReservationsByFormData(array $data): array
    {
        $locations = $this->getAvailableLocationsByPeriod($data['start'], $data['end']);
        $locationsData = $this->getDisplayReservations($locations, $data);


        return $locationsData;
    }

    public function getAvailableLocationsByPeriod(string|Date $start, string|Date $end): array
    {
        $accomList = $this->accomodationRepository->findBy(['available' => true]);
        $locations = array_map(function ($accomodation) use ($start, $end) {
            return $this->isAvailableDuringPeriod($accomodation, $start, $end);
        }, $accomList);


        return array_filter($locations, function ($location) {
            return $location != false;
        });
    }
    public function isAvailableDuringPeriod(Accomodation $accomodation, string|Date $start, string|Date $end): bool|Location
    {
        // Récupère toutes les réservations de l'accomodation dont le séjour chevauche la période voulue
        $reservations = $this->reservationRepository->getReservationsByPeriod($start, $end, $accomodation);
        // Récupère tous les emplacements de l'accomodation qui ne sont pas réservés
        $locations = $this->locationRepository->getAccomodationLocationsByReservations($accomodation, $reservations, true);


        return empty($locations) ? false : $locations[array_rand($locations)];
    }

    public function getDisplayReservations(array $locations, array $data): array
    {
        foreach ($locations as $location) {
            $season = $this->configService->getSeasonByDate($data['start']);
            $accomodation = $location->getAccomodation();
            $reservation = new Reservation();

            $reservation->setLocation($location);
            $reservation->setStart($data['start']);
            $reservation->setEnd($data['end']);
            $reservation->setAdults($data['adults']);
            $reservation->setChilds($data['childs']);

            // Vérifie les règles de réservations
            $error = $this->configService->checkReservationRules($reservation, $season);

            $basePrice = $this->configService->findAccomodationPriceBySeason($accomodation->getId(), $season);
            $reservation->setPrice($basePrice);

            // $finalPrice = $basePrice->applyClients();
            // $finalPrice = $basePrice->applyOffers();
            // $finalPrice = $basePrice->applyTaxes();



            $displayAccomodations[] = [
                'id' => $accomodation->getId(),
                'name' => $accomodation->getName(),
                'description' => $accomodation->getDescription(),
                'price' => $reservation->getPrice(),
                'error' => $error
            ];
        }

        dd($displayAccomodations);
        return $displayAccomodations;
    }

    // public function checkRules(Reservation $reservation)
    // {
    //     // Vérifie le jour d'arrivée
    //     dd($this->configService->checkReservation;

    //     dd($reservation->getStart());

    //     // Vérifie le jour de départ

    //     // Vérifie la durée du séjour


    //     return $error;
    // }
}
