<?php

namespace App\Controller;

use DateTimeZone;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        $formatter = new \IntlDateFormatter('fr_FR', \IntlDateFormatter::FULL, \IntlDateFormatter::FULL);
        $now = new \DateTime('now', new DateTimeZone('Europe/Paris'));


        return $this->render('admin/index.html.twig', [
            'date' => $now,
        ]);
    }

    #[Route('/admin/check', name: 'admin_check')]
    public function check(): Response
    {
        return $this->render('admin/check.html.twig', [
            'controller_name' => 'checkController',
        ]);
    }

    #[Route('/admin/planning', name: 'admin_planning')]
    public function planning(): Response
    {
        return $this->render('admin/planning.html.twig', [
            'controller_name' => 'planningController',
        ]);
    }

    #[Route('/admin/users', name: 'admin_users')]
    public function users(): Response
    {
        return $this->render('admin/users.html.twig', [
            'controller_name' => 'usersController',
        ]);
    }
}
