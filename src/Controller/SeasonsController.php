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

    #[Route("/seasons/delete/{id}", name: "admin_settings_seasons_delete")]
    public function delete($id, Request $request, ConfigService $configService): Response
    {
            $configService->deleteSeason($id);

            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_seasons');
    }
}