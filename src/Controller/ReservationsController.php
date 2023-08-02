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
    #[Route('/admin/settings/reservations', name: 'admin_settings_reservations')]
    public function index(ConfigService $configService): Response
    {
        $checkin = $configService->getReservationsRules('checkIn');
        $checkout = $configService->getReservationsRules('checkOut');
        $minstay = $configService->getReservationsRules('minStay');
        $maxstay = $configService->getReservationsRules('maxStay');
        $places = $configService->getReservationsRules('places');

        $reservations = $configService->getReservationsRules();

        return $this->render('admin/settings/reservations/index.html.twig', [
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
        $isCheck = str_contains(strtolower($type), 'check') ? true : false;
        $isStay = str_contains(strtolower($type), 'stay') ? true : false;

        if ($isCheck) $form = $this->createForm(CheckRuleType::class);
        if ($isStay) $form = $this->createForm(StayRuleType::class);

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

    #[Route("/reservations/{type}/update/{ruleId<\d+>}", name: "admin_settings_reservations_update")]
    public function update(string $type, int $ruleId, Request $request, ConfigService $configService): Response
    {
        $oldReservation = $configService->getReservationsRules($type);
        foreach ($oldReservation as $index => $rule) {
            if ($rule['id'] === $ruleId)
                $oldRule = $oldReservation[$index];
        }

        $isCheck = str_contains(strtolower($type), 'check') ? true : false;
        $isStay = str_contains(strtolower($type), 'stay') ? true : false;

        if ($isCheck) $form = $this->createForm(CheckRuleType::class);
        if ($isStay) $form = $this->createForm(StayRuleType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $rule = ["id" => $ruleId];
            $rule += $form->getData();


            $configService->updateReservationRule($type, $rule);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_reservations');
        } else {
            if ($isCheck) {
                $form->get('days')->setData($oldRule['days']);
            } elseif ($isStay) {
                $form->get('amount')->setData($oldRule['amount']);
            }
            $form->get('places')->setData($oldRule['places']);
            $form->get('seasons')->setData($oldRule['seasons']);
        }

        return $this->render('param/reservations/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route("/reservations/{type}/delete/{ruleId<\d+>}", name: "admin_settings_reservations_delete")]
    public function delete(string $type, int $ruleId, Request $request, ConfigService $configService): Response
    {
        $configService->deleteReservationRule($type, $ruleId);
        $this->addFlash('success', 'New "places" price rule added successfully!');
        return $this->redirectToRoute('admin_settings_reservations');
    }
}
