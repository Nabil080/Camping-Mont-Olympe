<?php

namespace App\Controller;

use App\Service\ConfigService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SettingsController extends AbstractController
{
    #[Route('/admin/settings', name: 'admin_settings')]
    public function index(): Response
    {
        return $this->render('admin/settings/index.html.twig');
    }
}
