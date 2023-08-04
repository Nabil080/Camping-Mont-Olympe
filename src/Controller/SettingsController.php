<?php

namespace App\Controller;

use App\Service\ConfigService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SettingsController extends AbstractController
{
    #[Route('/admin/settings', name: 'admin_settings')]
    public function index(ConfigService $configService): Response
    {


        return $this->render('admin/settings/index.html.twig', []);
    }

    #[Route('/admin/settings/camping', name: 'admin_settings_camping')]
    public function camping(ConfigService $configService): Response
    {
        $camping = $configService->getCamping();

        return $this->render('admin/settings/camping.html.twig', [
            'camping' => $camping,
        ]);
    }
}
