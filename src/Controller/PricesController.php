<?php

namespace App\Controller;

use App\Form\OfferRuleType;
use App\Form\PriceRuleType;
use App\Service\ConfigService;
use App\Service\LogService;
use DateTime;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PricesController extends AbstractController
{
    #[Route('/admin/settings/prices', name: 'admin_settings_prices')]
    public function index(ConfigService $configService): Response
    {
        $prices = $configService->getPricesRules();

        return $this->render('admin/settings/prices/index.html.twig', [
            'prices' => $prices,
        ]);
    }

    #[Route("/admin/settings/prices/{type}/{id<\d+>}/rule/add", name: "admin_settings_prices_add_rule")]
    public function add($type, $id, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $isOffer = $type === 'offers' ? true : false;
        $typeName = $configService->getPricesRules($type)[$id]['name'];

        $form = $isOffer ? $this->createForm(OfferRuleType::class) : $this->createForm(PriceRuleType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $lastId = $configService->getLastPricesRules($type, $id);
            $rule = ["id" => $lastId + 1];
            $rule += $form->getData();

            $configService->addPriceRule($type, $id, $rule);

            $this->addFlash('success', 'New "places" price rule added successfully!');

            $message = "Un tarif ".$logService->translate($type)." a été ajouté pour $typeName";
            $context = ["add","price"];
            $logService->write($message, $context);

            return $this->redirectToRoute('admin_settings_prices');
        }

        return $this->render('admin/settings/prices/add.html.twig', [
            'form' => $form,
            'type' => $type,
            'type_name' => $typeName,
        ]);
    }

    #[Route("/prices/update/{type}/{id<\d+>}/{ruleId<\d+>}", name: "admin_settings_prices_update")]
    public function update($type, $id, int $ruleId, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $isOffer = $type === 'offers' ? true : false;
        $typeName = $configService->getPricesRules($type)[$id]['name'];

        $form = $isOffer ? $this->createForm(OfferRuleType::class) : $this->createForm(PriceRuleType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $rule = ["id" => $ruleId];
            $rule += $form->getData();

            $configService->updatePriceRule($type, $id, $rule);
            $this->addFlash('success', 'New "places" price rule added successfully!');

            $message = "Un tarif ".$logService->translate($type)." a été modifié pour $typeName";
            $context = ["update","price"];
            $logService->write($message, $context);


            return $this->redirectToRoute('admin_settings_prices');
        } elseif (!$form->isSubmitted()) {
            $config = $configService->getPricesRules($type);
            foreach ($config[$id]['rules'] as $index => $rule)
                if ($rule['id'] == $ruleId)
                    $oldRule = $config[$id]['rules'][$index];

            if ($isOffer) {
                $form->get('name')->setData($oldRule['name']);
                $form->get('amount')->setData($oldRule['amount']);
                $form->get('type')->setData($oldRule['type']);
                $form->get('uses')->setData($oldRule['uses']);
                $form->get('start')->setData($oldRule['start']);
                $form->get('end')->setData($oldRule['end']);
                $form->get('places')->setData($oldRule['places']);
            } else {
                $form->get('amount')->setData($oldRule['amount']);
                $form->get('per_days')->setData($oldRule['per_days']);
                $form->get('per_person')->setData($oldRule['per_person']);
                $form->get('seasons')->setData($oldRule['seasons']);
            }
        }

        return $this->render('admin/settings/prices/add.html.twig', [
            'form' => $form,
            'type' => $type,
            'type_name' => $typeName
        ]);
    }


    #[Route("/prices/delete/{type}/{id<\d+>}/{ruleId<\d+>}", name: "admin_settings_prices_delete")]
    public function delete($type, $id, $ruleId, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $configService->deletePriceRule($type, $id, $ruleId);

        $typeName = $configService->getPricesRules($type)[$id]['name'];
        $this->addFlash('success', 'New "places" price rule added successfully!');
        $message = "Un tarif ".$logService->translate($type)." a été supprimé pour $typeName";
        $context = ["delete","price"];
        
        $logService->write($message, $context);
        
        
        return $this->redirectToRoute('admin_settings_prices');
    }
}
