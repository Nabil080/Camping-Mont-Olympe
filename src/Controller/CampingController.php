<?php

namespace App\Controller;

use App\Service\ConfigService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CampingController extends AbstractController
{

    #[Route('/admin/settings/camping', name: 'admin_settings_camping')]
    public function index(ConfigService $configService): Response
    {
        $camping = $configService->getCamping();

        return $this->render('admin/settings/camping.html.twig', [
            'camping' => $camping,
        ]);
    }

    #[Route('/admin/settings/camping/update', name: 'admin_settings_camping_update')]
    public function update(ConfigService $configService, Request $request): Response
    {
        $camping = $configService->getCamping();

        dd($request);

        return $this->render('admin/settings/camping.html.twig', [
            'camping' => $camping,
        ]);
    }
}
