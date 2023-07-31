<?php

namespace App\Controller;

use App\Service\ConfigService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ReservationsController extends AbstractController
{
    #[Route('/reservations', name: 'app_reservations')]
    public function index(ConfigService $configService): Response
    {
        $checkin = $configService->getReservationsRules('checkIn');
        $checkout = $configService->getReservationsRules('checkOut');
        $minstay = $configService->getReservationsRules('minStay');
        $maxstay = $configService->getReservationsRules('maxStay');
        $places = $configService->getReservationsRules('places');

        $reservations = $configService->getReservationsRules();

        return $this->render('param/reservations/index.html.twig', [
            'checkin' => $checkin,
            'checkout' => $checkout,
            'minstay' => $minstay,
            'maxstay' => $maxstay,
            'places' => $places,
            'reservations' => $reservations,
        ]);
    }
}
