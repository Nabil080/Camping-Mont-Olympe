<?php

namespace App\Controller;

use App\Entity\Accomodation;
use App\Form\CheckRuleType;
use App\Form\AccomodationType;
use App\Form\StayRuleType;
use App\Repository\AccomodationRepository;
use App\Service\ConfigService;
use App\Service\LogService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccomodationsController extends AbstractController
{

    #[Route('admin/settings/accomodations', name: 'admin_settings_accomodations')]
    public function index(AccomodationRepository $ar): Response
    {
        $accomodations = $ar->findAll();

        return $this->render('admin/settings/accomodations/index.html.twig', [
            'accomodations' => $accomodations,
        ]);
    }

    #[Route('admin/settings/accomodations/add', name: 'admin_settings_accomodations_add')]
    public function create(EntityManagerInterface $em, LogService $logService, Request $request): Response
    {
        $accomodation = new Accomodation;

        $form = $this->createForm(AccomodationType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $accomodation = $form->getData();

            $em->persist($accomodation);
            $em->flush();

            $name = $accomodation->getName();
            $id = $accomodation->getId();
            $message = "L'accomadation $name a été créée (N°$id)";
            $context = ['add', 'accomodation'];
            $logService->write($message, $context);

            return $this->redirectToRoute('admin_settings_accomodations');
        }

        return $this->render('admin/settings/accomodations/add.html.twig', [
            'form' => $form
        ]);
    }

    #[Route('admin/settings/accomodations/update/{id}', name: 'admin_settings_accomodations_update')]
    public function update(Accomodation $accomodation, AccomodationRepository $ar): Response
    {
        dd($accomodation);

        return $this->render('admin/settings/accomodations/index.html.twig', [
            'accomodations' => $accomodations,
        ]);
    }

    #[Route('admin/settings/accomodations/delete/{id}', name: 'admin_settings_accomodations_delete')]
    public function delete(AccomodationRepository $ar): Response
    {
        $accomodations = $ar->findAll();

        return $this->render('admin/settings/accomodations/index.html.twig', [
            'accomodations' => $accomodations,
        ]);
    }

}