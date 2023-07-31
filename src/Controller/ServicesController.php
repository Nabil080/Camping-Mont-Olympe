<?php

namespace App\Controller;

use App\Service\ConfigService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ServicesController extends AbstractController
{
    #[Route('/services', name: 'admin_settings_reservations')]
    public function index(ConfigService $configService): Response
    {
        $services = $configService->getServices();

        return $this->render('param/services/index.html.twig', [
            'services' => $services,
        ]);
    }
}
