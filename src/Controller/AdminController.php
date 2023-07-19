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

    #[Route('/caisse', name: 'caisse')]
    public function caisse(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'CaisseController',
        ]);
    }

    #[Route('/check', name: 'check')]
    public function check(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'checkController',
        ]);
    }

    #[Route('/planning', name: 'planning')]
    public function planning(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'planningController',
        ]);
    }

    #[Route('/reservation', name: 'reservation')]
    public function reservation(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'reservationController',
        ]);
    }

    #[Route('/users', name: 'users')]
    public function users(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'usersController',
        ]);
    }
}
