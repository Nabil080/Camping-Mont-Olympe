<?php

namespace App\Controller;

use App\Config\Config;
use App\Config\Repository\CampingRepository;
use App\Config\Repository\SeasonRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class FrontController extends AbstractController
{
    #[Route('/', name: 'app_front')]
    public function homepage(Config $config, SeasonRepository $seasonRepository): Response
    {
        $config->create();


        $seasons = $seasonRepository->getSeasonById(1);
        $seasons->setName('songe');
        $seasonRepository->addSeason($seasons);

        return $this->render('front/index.html.twig', [
            'controller_name' => 'FrontController',
        ]);
    }

    #[Route('/emplacements', name: 'emplacements')]
    public function emplacements(): Response
    {

        return $this->render('front/emplacements.html.twig', [
            'controller_name' => 'FrontController',
        ]);
    }

    #[Route('/emplacement/{id}', name: 'emplacement')]
    public function emplacement($id): Response
    {

        return $this->render('front/emplacement.html.twig', [
            'controller_name' => 'FrontController',
        ]);
    }

    #[Route('/reservation', name: 'reservation')]
    public function reservation(): Response
    {

        return $this->render('front/reservation.html.twig', [
            'controller_name' => 'FrontController',
        ]);
    }

    #[Route('/contact', name: 'contact')]
    public function contact(): Response
    {

        return $this->render('front/contact.html.twig', [
            'controller_name' => 'FrontController',
        ]);
    }
}
