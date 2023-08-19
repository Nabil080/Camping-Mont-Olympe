<?php

namespace App\Controller;

use App\Config\SeasonRule;
use App\Form\OfferRuleType;
use App\Form\PriceRuleType;
use App\Form\SeasonRuleType;
use App\Form\SeasonType;
use App\Service\ConfigService;
use App\Service\LogService;
use DateTime;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SeasonsController extends AbstractController
{
    #[Route('/admin/settings/seasons', name: 'admin_settings_seasons')]
    public function index(ConfigService $configService): Response
    {
        $seasons = $configService->getSeasons();


        return $this->render('admin/settings/seasons/index.html.twig', [
            'seasons' => $seasons,
        ]);
    }

    #[Route("/admin/settings/seasons/add", name: "admin_settings_seasons_add")]
    public function add(Request $request, ConfigService $configService, LogService $logService): Response
    {

        $form = $this->createForm(SeasonType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $lastId = $configService->getLastSeason();
            $name = $form->getData()['name'];
            $season = ["id" => $lastId + 1, "name" => $name, "rules" => []];

            $configService->addSeason($season);
            $this->addFlash('success', 'New "places" price rule added successfully!');

            $message = "Une saison '" . $season['name'] . "' a été ajoutée";
            $context = ["add", "season"];
            $logService->write($message, $context);

            return $this->redirectToRoute('admin_settings_seasons');
        }

        return $this->render('admin/settings/seasons/add.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route("/admin/settings/seasons/update/{seasonId<\d+>}", name: "admin_settings_seasons_update")]
    public function update(int $seasonId, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $oldSeason = $configService->getSeasons()[$seasonId];

        $form = $this->createForm(SeasonType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $name = $form->getData()['name'];
            $season = ["id" => $oldSeason['id'], "name" => $name, "rules" => $oldSeason['rules']];

            $configService->updateSeason($seasonId, $season);

            $this->addFlash('success', 'New "places" price rule added successfully!');

            $message = "La saison '" . $oldSeason['name'] . "' a été renommée en '$name'";
            $context = ["update", "season"];
            $logService->write($message, $context);

            return $this->redirectToRoute('admin_settings_seasons');
        } else {
            $form->get('name')->setData($oldSeason['name']);
        }

        return $this->render('admin/settings/seasons/add.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route("/admin/settings/seasons/delete/{seasonId<\d+>}", name: "admin_settings_seasons_delete")]
    public function delete($seasonId, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $oldSeason = $configService->getSeasons()[$seasonId];
        $configService->deleteSeason($seasonId);

        $message = "La saison '" . $oldSeason['name'] . "' a été supprimée";
        $context = ["delete", "season"];
        $logService->write($message, $context);

        $this->addFlash('success', 'New "places" price rule added successfully!');
        return $this->redirectToRoute('admin_settings_seasons');
    }

    #[Route("/admin/settings/seasons/{seasonId<\d+>}/rule/add", name: "admin_settings_seasons_rule_add")]
    public function addRule(int $seasonId, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $oldSeason = $configService->getSeasons()[$seasonId];

        $form = $this->createForm(SeasonRuleType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $lastId = $configService->getLastSeasonRule($seasonId);
            $rule = ["id" => $lastId + 1];
            $rule += $form->getData();

            $configService->addSeasonRule($seasonId, $rule);

            $this->addFlash('success', 'New "places" price rule added successfully!');
            $message = "Une période a été ajoutée pour la saison '".$oldSeason['name'];
            $context = ["add", "season"];
            $logService->write($message, $context);


            return $this->redirectToRoute('admin_settings_seasons');
        }

        return $this->render('admin/settings/seasons/add_rule.html.twig', [
            'form' => $form,
            'season_name' => $oldSeason['name']
        ]);
    }

    #[Route("/admin/settings/seasons/{seasonId<\d+>}/rule/update/{ruleId<\d+>}", name: "admin_settings_seasons_rule_update")]
    public function updateRule(int $seasonId, int $ruleId, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $oldSeason = $configService->getSeasons()[$seasonId];
        foreach ($oldSeason['rules'] as $index => $rule) {
            if ($rule['id'] === $ruleId)
                $oldRule = $oldSeason['rules'][$index];
        }

        $form = $this->createForm(SeasonRuleType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $rule = ["id" => $ruleId];
            $rule += $form->getData();

            $configService->updateSeasonRule($seasonId, $rule);
            $this->addFlash('success', 'New "places" price rule added successfully!');

            $message = "Une période a été modifiée pour la saison '".$oldSeason['name'];
            $context = ["update", "season"];
            $logService->write($message, $context);


            return $this->redirectToRoute('admin_settings_seasons');
        } else {
            $form->get('start')->setData($oldRule['start']);
            $form->get('end')->setData($oldRule['end']);
            $form->get('days')->setData($oldRule['days']);
        }

        return $this->render('admin/settings/seasons/add_rule.html.twig', [
            'form' => $form,
            'season_name' => $oldSeason['name']
        ]);
    }

    #[Route("/admin/settings/seasons/{seasonId<\d+>}/rule/delete/{ruleId<\d+>}", name: "admin_settings_seasons_rule_delete")]
    public function deleteRule(int $seasonId, int $ruleId, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $oldSeason = $configService->getSeasons()[$seasonId];
        $configService->deleteSeasonRule($seasonId, $ruleId);

        $this->addFlash('success', 'New "places" price rule added successfully!');
        $message = "Une période a été supprimée pour la saison '".$oldSeason['name'];
        $context = ["delete", "season"];
        $logService->write($message, $context);


        return $this->redirectToRoute('admin_settings_seasons');
    }
}
