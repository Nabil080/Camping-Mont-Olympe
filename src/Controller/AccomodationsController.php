<?php

namespace App\Controller;

use App\Entity\Accomodation;
use App\Entity\Location;
use App\Form\CheckRuleType;
use App\Form\AccomodationType;
use App\Form\LocationType;
use App\Form\StayRuleType;
use App\Repository\AccomodationRepository;
use App\Repository\LocationRepository;
use App\Service\ConfigService;
use App\Service\LogService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;

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
    public function add(EntityManagerInterface $em, LogService $logService, Request $request, SluggerInterface $slugger): Response
    {
        $accomodation = new Accomodation;

        $form = $this->createForm(AccomodationType::class,);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            
            $accomodation = $form->getData();
            
            $imageFile = $form->get('image')->getData();

            $originalFilename = pathinfo($imageFile->getClientOriginalName(), PATHINFO_FILENAME);
            // this is needed to safely include the file name as part of the URL
            $safeFilename = $slugger->slug($originalFilename);
            $newFilename = $safeFilename.'-'.uniqid().'.'.$imageFile->guessExtension();

            // Move the file to the directory where brochures are stored
            try {
                $imageFile->move(
                    $this->getParameter('accomodations_directory'),
                    $newFilename
                );
            } catch (FileException $e) {
                // ... handle exception if something happens during file upload
            }

            // updates the 'brochureFilename' property to store the PDF file name
            // instead of its contents
            $accomodation->setImage($newFilename);


            
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
    public function update(Accomodation $accomodation, Request $request, EntityManagerInterface $em, LogService $ls): Response
    {
        $accomodation->setImage(new File($this->getParameter('accomodations_directory').'/'.$accomodation->getImage()));

        $form = $this->createForm(AccomodationType::class, $accomodation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $accomodation = $form->getData();
            $em->flush();

            $message = "L'accomadation " . $accomodation->getName() . " a été modifiée (N°" . $accomodation->getId() . ")";
            $context = ['update', 'accomodation'];
            $ls->write($message, $context);

            return $this->redirectToRoute('admin_settings_accomodations');
        }

        return $this->render('admin/settings/accomodations/add.html.twig', [
            'form' => $form
        ]);
    }

    #[Route('admin/settings/accomodations/delete/{id}', name: 'admin_settings_accomodations_delete')]
    public function delete(Accomodation $accomodation, EntityManagerInterface $em, LogService $ls): Response
    {
        $message = "L'accomadation " . $accomodation->getName() . " a été supprimée (N°" . $accomodation->getId() . ")";
        $context = ['delete', 'accomodation'];
        $ls->write($message, $context);

        $em->remove($accomodation);
        $em->flush();


        return $this->redirectToRoute('admin_settings_accomodations');
    }

    #[Route('admin/settings/accomodations/{id}/locations', name: 'admin_settings_accomodations_locations')]
    public function locations(Accomodation $accomodation, LocationRepository $lr, EntityManagerInterface $em, LogService $ls): Response
    {
        $locations = $lr->findBy(['accomodation' => $accomodation],['number' => 'ASC']);

        return $this->render('admin/settings/accomodations/locations.html.twig', [
            'locations' => $locations,
            'accomodation' => $accomodation,
        ]);
    }
}
