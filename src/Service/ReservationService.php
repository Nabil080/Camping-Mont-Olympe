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
    public function __construct(private AccomodationRepository $accomodationRepository, private LocationRepository $locationRepository, private ReservationRepository $reservationRepository, private ConfigService $configService)
    {
        $this->accomodationRepository = $accomodationRepository;
        $this->locationRepository = $locationRepository;
        $this->reservationRepository = $reservationRepository;
        $this->configService = $configService;
    }

    public function getReservationsByFormData(array $data): array
    {
        $locations = $this->getAvailableLocationsByPeriod($data['start'], $data['end']);
        $reservationsData = $this->getDisplayReservations($locations, $data);

        return $reservationsData;
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
        $season = $this->configService->getSeasonByDate($data['start']);
        $displayReservations = ['available' => [], 'unavailable' => [], 'full' => []];

        foreach ($locations as $location) {
            $reservation = new Reservation();

            $reservation->setLocation($location);
            $reservation->setStart($data['start']);
            $reservation->setEnd($data['end']);
            $reservation->setAdults($data['adults']);
            $reservation->setChilds($data['childs']);

            // Vérifie les règles de réservations
            $error = $this->configService->checkReservationRules($reservation, $season);

            // Ajoute la card dans un array selon les erreurs
            $displayReservations[$error ? 'unavailable' : 'available'][] = [
                'accomodation' => $location->getAccomodation()->getDisplayArray(),
                'location' => $location->getDisplayArray(),
                'price' => $this->getReservationPrices($reservation, $season),
                'error' => $error,
                'reservation' => [
                    'start' => $data['start'],
                    'end' => $data['end'],
                    'adults' => $reservation->getAdults(),
                    'childs' => $reservation->getChilds(),
                    'stay' => $reservation->getStart()->diff($reservation->getEnd())->format('%a%'),
                ],
            ];
        }

        return $displayReservations ?? [];
    }

    public function getReservationPrices(Reservation $reservation, array $season)
    {
        $accomodation = $reservation->getLocation()->getAccomodation();

        $basePrice = $this->configService->getAccomodationPriceBySeason($accomodation->getId(), $season);
        $adultPrice = $this->configService->getAdultPriceBySeason($season);
        $childPrice = $this->configService->getChildPriceBySeason($season);

        $stay = $reservation->getStart()->diff($reservation->getEnd())->format('%a%');
        $totalAdult = $adultPrice * $reservation->getAdults();
        $totalChild = $childPrice * $reservation->getChilds();
        $totalPrice = ($basePrice + $totalAdult + $totalChild) * $stay;

        return [
            'accomodation' => $basePrice,
            'adult' => $adultPrice,
            'child' => $childPrice,
            'total' => $totalPrice,
        ];
    }
}
