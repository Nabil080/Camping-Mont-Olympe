<?php

namespace App\Controller;

use App\Form\OfferRuleType;
use App\Form\PriceRuleType;
use App\Service\ConfigService;
use DateTime;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SeasonsController extends AbstractController
{
    #[Route('/seasons', name: 'admin_settings_seasons')]
    public function index(ConfigService $configService): Response
    {
        $seasons = $configService->getSeasonsRules();


        return $this->render('param/seasons/index.html.twig', [
            'seasons' => $seasons,
        ]);
    }
}