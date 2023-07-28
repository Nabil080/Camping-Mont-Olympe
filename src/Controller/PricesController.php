<?php

namespace App\Controller;

use App\Service\ConfigService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PricesController extends AbstractController
{
    #[Route('/prices', name: 'app_prices')]
    public function index(ConfigService $configService): Response
    {
        $placesRules = $configService->getPricesRules('places');
        $servicesRules = $configService->getPricesRules('services');
        // dd($placesRules);

        return $this->render('param/prices.html.twig', [
            'places_rules' => $placesRules,
            'services_rules' => $servicesRules,
        ]);
    }
}
