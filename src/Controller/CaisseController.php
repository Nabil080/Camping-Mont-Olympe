<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CaisseController extends AbstractController
{
    #[Route('/admin/caisse', name: 'admin_caisse')]
    public function index(): Response
    {
        return $this->render('admin/caisse/index.html.twig', [
            'controller_name' => 'CaisseController',
        ]);
    }

    #[Route('/admin/caisse/encaisser', name: 'caisse_cash')]
    public function cash(): Response
    {
        return $this->render('admin/caisse/cash.html.twig', [
            'controller_name' => 'CaisseController',
        ]);
    }

    
}