<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ReservationController extends AbstractController
{
    #[Route('/admin/reservation', name: 'admin_reservation')]
    public function index(): Response
    {
        return $this->render('admin/reservation/index.html.twig', [
            'controller_name' => 'ReservationController',
        ]);
    }

    #[Route('/admin/reservation/ajouter', name: 'reservation_add')]
    public function add(): Response
    {
        return $this->render('admin/reservation/add.html.twig', [
            'controller_name' => 'ReservationController',
        ]);
    }

    #[Route('/admin/reservation/modifier', name: 'reservation_update')]
    public function update(): Response
    {
        return $this->render('admin/reservation/update.html.twig', [
            'controller_name' => 'ReservationController',
        ]);
    }

    #[Route('/admin/reservation/facture', name: 'reservation_bill')]
    public function bill(): Response
    {
        return $this->render('admin/reservation/bill.html.twig', [
            'controller_name' => 'ReservationController',
        ]);
    }
}
