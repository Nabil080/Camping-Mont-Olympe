<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ParamController extends AbstractController
{
    #[Route('/param', name: 'param')]
    public function index(): Response
    {
        return $this->render('param/index.html.twig', [
            'controller_name' => 'ParamController',
        ]);
    }

    #[Route('/param/camping', name: 'param_camping')]
    public function camping(): Response
    {
        return $this->render('param/camping.html.twig', [
            'controller_name' => 'campingController',
        ]);
    }

    #[Route('/param/emplacements', name: 'emplacements')]
    public function emplacements(): Response
    {
        return $this->render('param/emplacements.html.twig', [
            'controller_name' => 'emplacementsController',
        ]);
    }

    #[Route('/param/services', name: 'services')]
    public function services(): Response
    {
        return $this->render('param/services.html.twig', [
            'controller_name' => 'servicesController',
        ]);
    }

    #[Route('/param/seasons', name: 'seasons')]
    public function seasons(): Response
    {
        return $this->render('param/seasons.html.twig', [
            'controller_name' => 'seasonsController',
        ]);
    }

    #[Route('/param/prices', name: 'prices')]
    public function prices(): Response
    {
        return $this->render('param/prices.html.twig', [
            'controller_name' => 'pricesController',
        ]);
    }

    #[Route('/param/reservations', name: 'reservations')]
    public function reservations(): Response
    {
        return $this->render('param/reservations.html.twig', [
            'controller_name' => 'reservationsController',
        ]);
    }


}
