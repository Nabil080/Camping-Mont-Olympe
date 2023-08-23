<?php

namespace App\Controller;

use App\Entity\Reservation;
use App\Form\CheckRuleType;
use App\Form\ReservationType;
use App\Form\StayRuleType;
use App\Repository\AccomodationRepository;
use App\Repository\LocationRepository;
use App\Repository\ReservationRepository;
use App\Service\ConfigService;
use App\Service\LogService;
use App\Service\ReservationService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ReservationsController extends AbstractController
{

    #[Route('admin/reservations', name: 'admin_reservations')]
    public function index(ReservationRepository $rr): Response
    {
        $reservations = $rr->findAll();

        return $this->render('admin/reservations/index.html.twig', [
            'reservations' => $reservations,
        ]);
    }

    #[Route('admin/reservations/add', name: 'admin_reservations_add')]
    public function create(EntityManagerInterface $em, LogService $logService, Request $request): Response
    {
        $reservation = new Reservation;
        $now = new \DateTime('now');

        $form = $this->createForm(ReservationType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $reservation = $form->getData();

            $em->persist($reservation);
            $em->flush();

            $id = $reservation->getId();
            $message = "La réservation N°$id a été créée";
            $context = ['add', 'reservation'];
            $logService->write($message, $context);

            return $this->redirectToRoute('admin_reservations');
        }

        return $this->render('admin/reservations/add.html.twig', [
            'form' => $form
        ]);
    }



    #[Route('/admin/settings/reservations', name: 'admin_settings_reservations')]
    public function settings(ConfigService $configService): Response
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
    public function addRule(string $type, Request $request, ConfigService $configService, LogService $logService): Response
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
            $message = "Une règle de réservation $type a été ajoutée";
            $context = ['add', 'reservation'];
            $logService->write($message, $context);


            return $this->redirectToRoute('admin_settings_reservations');
        }

        return $this->render('admin/settings/reservations/add.html.twig', [
            'form' => $form,
            'type_name' => $type
        ]);
    }

    #[Route("/reservations/{type}/update/{ruleId<\d+>}", name: "admin_settings_reservations_update")]
    public function updateRule(string $type, int $ruleId, Request $request, ConfigService $configService, LogService $logService): Response
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
            $message = "Une règle de réservation $type a été modifiée";
            $context = ['update', 'reservation'];
            $logService->write($message, $context);

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

        return $this->render('admin/settings/reservations/add.html.twig', [
            'form' => $form,
            'type_name' => $type
        ]);
    }

    #[Route("/reservations/{type}/delete/{ruleId<\d+>}", name: "admin_settings_reservations_delete")]
    public function deleteRule(string $type, int $ruleId, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $configService->deleteReservationRule($type, $ruleId);

        $this->addFlash('success', 'New "places" price rule added successfully!');
        $message = "Une règle de réservation $type a été supprimée";
        $context = ['delete', 'reservation'];
        $logService->write($message, $context);

        return $this->redirectToRoute('admin_settings_reservations');
    }


    #[Route('/reservations/find', name: 'reservations_find')]
    public function find(Request $request, ReservationService $rs): Response
    {
        $postData = json_decode($request->getContent(), true);

        $reservations = $rs->getReservationsByFormData($postData);
        $message = $reservations;
        $message['count'] = count($reservations['available']) + count($reservations['unavailable']);

        return $this->json($message, 200);
    }
}
