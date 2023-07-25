<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CaisseController extends AbstractController
{
    #[Route('/admin/caisse', name: 'caisse')]
    public function index(): Response
    {
        return $this->render('admin/caisse/index.html.twig', [
            'controller_name' => 'CaisseController',
        ]);
    }

    #[Route('/admin/caisse/{id}', name: 'caisse')]
    public function cash($id): Response
    {
        return $this->render('admin/caisse/cash.html.twig', [
            'controller_name' => 'CaisseController',
        ]);
    }
}
