<?php

namespace App\Controller;

use App\Entity\Location;
use App\Form\LocationType;
use App\Repository\AccomodationRepository;
use App\Repository\LocationRepository;
use App\Service\LogService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class LocationsController extends AbstractController
{
    #[Route('admin/settings/locations', name: 'admin_settings_locations')]
    public function index(LocationRepository $lr, EntityManagerInterface $em, LogService $ls): Response
    {
        $locations = $lr->findBy([], ['number' => 'ASC']);

        return $this->render('admin/settings/accomodations/locations/index.html.twig', [
            'locations' => $locations,
        ]);
    }

    #[Route('admin/settings/locations/add', name: 'admin_settings_locations_add')]
    public function add(EntityManagerInterface $em, LogService $ls, Request $request, AccomodationRepository $ar): Response
    {
        $location = new Location;
        $id = $request->query->get('id') ?? null;

        $form = $this->createForm(LocationType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $location = $form->getData();
            $em->persist($location);
            $em->flush();

            $message = "L'emplacement " . $location->getNumber() . " a été ajouté (type " . $location->getAccomodation()->getName() . ")";
            $context = ['add', 'location'];
            $ls->write($message, $context);

            return $this->redirectToRoute('admin_settings_accomodations_locations', ['id' => $location->getAccomodation()->getId()]);
        } elseif (!$form->isSubmitted()) {
            if ($id) $form->get('accomodation')->setData($ar->find($id));
        }

        return $this->render('admin/settings/accomodations/add_locations.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('admin/settings/locations/update/{id}', name: 'admin_settings_locations_update')]
    public function update(Location $location, EntityManagerInterface $em, LogService $ls, Request $request, AccomodationRepository $ar): Response
    {
        $form = $this->createForm(LocationType::class, $location);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $oldLocation = $location;
            $location = $form->getData();
            $em->flush();

            $message = "L'emplacement " . $oldLocation->getNumber() . " de " . $oldLocation->getAccomodation()->getName() . " a été modifiée en N°" . $location->getNumber() . " de " . $location->getAccomodation()->getName() . " (ID " . $location->getId() . ")";
            $context = ['update', 'location'];
            $ls->write($message, $context);

            return $this->redirectToRoute('admin_settings_accomodations_locations', ['id' => $location->getAccomodation()->getId()]);
        }

        return $this->render('admin/settings/accomodations/add_locations.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('admin/settings/locations/{id}/delete', name: 'admin_settings_locations_delete')]
    public function delete(Location $location, EntityManagerInterface $em, LogService $ls, Request $request): Response
    {
        $accomodation = $location->getAccomodation();

        $message = "L'emplacement " . $location->getNumber() . " a été supprimée (type " . $accomodation->getName() . ")";
        $context = ['delete', 'location'];
        $ls->write($message, $context);

        $em->remove($location);
        $em->flush();

        $route = $request->headers->get('referer');
        return $this->redirect($route);
    }
}
