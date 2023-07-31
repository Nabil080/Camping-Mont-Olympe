<?php

namespace App\Controller;

use App\Form\OfferRuleType;
use App\Form\PriceRuleType;
use App\Form\SeasonType;
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
        $seasons = $configService->getSeasons();


        return $this->render('param/seasons/index.html.twig', [
            'seasons' => $seasons,
        ]);
    }

    #[Route("/seasons/add", name: "admin_settings_seasons_add")]
    public function add(Request $request, ConfigService $configService): Response
    {

        $form = $this->createForm(SeasonType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $lastId = $configService->getLastSeason();
            $name = $form->getData()['name'];
            $season = ["id" => $lastId + 1, "name" => $name, "rules" => [] ];

            $configService->addSeason($season);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_seasons');
        }

        return $this->render('param/seasons/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route("/seasons/update/{id}", name: "admin_settings_seasons_update")]
    public function update(int $id, Request $request, ConfigService $configService): Response
    {
        $oldSeason = $configService->getSeasons()[$id];

        $form = $this->createForm(SeasonType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $name = $form->getData()['name'];
            $season = ["id" => $oldSeason['id'], "name" => $name, "rules" => $oldSeason['rules'] ];

            $configService->updateSeason($id, $season);

            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_seasons');
        }else{
            $form->get('name')->setData($oldSeason['name']);
        }

        return $this->render('param/seasons/add.html.twig', [
            'form' => $form->createView(),
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