<?php

namespace App\Controller;

use App\Form\CheckRuleType;
use App\Form\StayRuleType;
use App\Service\ConfigService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ReservationsController extends AbstractController
{
    #[Route('/reservations', name: 'admin_settings_reservations')]
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

    #[Route("/reservations/{type}/add", name: "admin_settings_reservations_add")]
    public function add(string $type, Request $request, ConfigService $configService): Response
    {
        $isCheck = str_contains(strtolower($type),'check') ? true : false;
        $isStay = str_contains(strtolower($type),'stay') ? true : false;

        if($isCheck) $form = $this->createForm(CheckRuleType::class);
        if($isStay) $form = $this->createForm(StayRuleType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $lastId = $configService->getLastReservationRule($type);
            $rule = ["id" => $lastId + 1];
            $rule += $form->getData();

            $configService->addReservationRule($type, $rule);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_reservations');
        }

        return $this->render('param/reservations/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route("/reservations/{type}/delete/{ruleId}", name: "admin_settings_reservations_delete")]
    public function delete(string $type,int $ruleId, Request $request, ConfigService $configService): Response
    {
            $configService->deleteReservationRule($type, $ruleId);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_reservations');
    }
}
