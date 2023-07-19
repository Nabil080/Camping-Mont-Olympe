<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AdminController',
        ]);
    }

    #[Route('/admin/caisse', name: 'caisse')]
    public function caisse(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'CaisseController',
        ]);
    }

    #[Route('/admin/check', name: 'check')]
    public function check(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'checkController',
        ]);
    }

    #[Route('/admin/planning', name: 'planning')]
    public function planning(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'planningController',
        ]);
    }

    #[Route('/admin/reservation', name: 'reservation')]
    public function reservation(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'reservationController',
        ]);
    }

    #[Route('/admin/users', name: 'users')]
    public function users(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'usersController',
        ]);
    }
}
