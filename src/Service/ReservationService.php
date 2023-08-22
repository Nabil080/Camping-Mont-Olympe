<?php

namespace App\Service;

use App\Entity\Accomodation;
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
        $accomodations = $this->getAvailableAccomodationsByPeriod($data['start'], $data['end']);
        $accomodationsData = $this->getDisplayAccomodations($accomodations, $data);


        return $accomodationsData;
    }

    public function getAvailableAccomodationsByPeriod(string|Date $start, string|Date $end): array
    {
        $accomList = $this->accomodationRepository->findBy(['available' => true]);
        $accomodations = array_filter($accomList, function ($accomodation) use ($start, $end) {
            return $this->isAvailableDuringPeriod($accomodation, $start, $end);
        });

        return $accomodations;
    }
    public function isAvailableDuringPeriod(Accomodation $accomodation, string|Date $start, string|Date $end): bool
    {
        // Récupère toutes les réservations de l'accomodation dont le séjour chevauche la période voulue
        $reservations = $this->reservationRepository->getReservationsByPeriod($start, $end, $accomodation);
        // Récupère tous les emplacements de l'accomodation qui ne sont pas réservés
        $locations = $this->locationRepository->getAccomodationLocationsByReservations($accomodation, $reservations, true);


        return !empty($locations);
    }

    public function getDisplayAccomodations(array $accomodations, array $data): array
    {
        foreach ($accomodations as $accomodation) {

            $season = $this->configService->getSeasonByDate($data['start']);
            $basePrice = $this->configService->findAccomodationPriceBySeason($accomodation->getId(), $season);

            $finalPrice = $basePrice;
            // $finalPrice = $basePrice->applyNight();
            // $finalPrice = $basePrice->applyClients();
            // $finalPrice = $basePrice->applyOffers();
            // $finalPrice = $basePrice->applyTaxes();


            $displayAccomodations[] = [
                'id' => $accomodation->getId(),
                'name' => $accomodation->getName(),
                'description' => $accomodation->getDescription(),
                'price' => $finalPrice,
            ];
        }

        return $displayAccomodations;
    }
}
