<?php

namespace App\Controller;

use App\Form\PriceRuleType;
use App\Service\ConfigService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PricesController extends AbstractController
{
    #[Route('/prices', name: 'admin_settings_prices')]
    public function index(ConfigService $configService): Response
    {
        $places = $configService->getPricesRules('places');
        $services = $configService->getPricesRules('services');
        $ages = $configService->getPricesRules('ages');
        $offers = $configService->getPricesRules('offers');

        $prices = $configService->getPricesRules();

        return $this->render('param/prices/index.html.twig', [
            'places' => $places,
            'services' => $services,
            'ages' => $ages,
            'offers' => $offers,
            'prices' => $prices,
        ]);
    }

    #[Route("/prices/add/{type}/{id}", name: "admin_settings_prices_add")]
    public function add($type, $id, Request $request, ConfigService $configService): Response
    {

        $form = $this->createForm(PriceRuleType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $lastId = $configService->getLastPricesRules($type);
            $rule = ["id" => $lastId + 1];
            $rule += $form->getData();
            

            $configService->addPriceRule($type, $id, $rule);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_prices');
        }

        return $this->render('param/prices/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route("/prices/update/{type}/{id}/{ruleId}", name: "admin_settings_prices_update")]
    public function update($type, $id, int $ruleId, Request $request, ConfigService $configService): Response
    {

        $form = $this->createForm(PriceRuleType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $rule = ["id" => $ruleId];
            $rule += $form->getData();

            $configService->updatePriceRule($type, $id, $rule);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_prices');
        }else{
            $config = $configService->getPricesRules($type);
            foreach($config[$id]['rules'] as $index => $rule)
                if($rule['id'] == $ruleId)
                    $oldRule = $config[$id]['rules'][$index];
            
            $form->get('amount')->setData($oldRule['amount']);
            $form->get('per_days')->setData($oldRule['per_days']);
            $form->get('per_person')->setData($oldRule['per_person']);
            $form->get('seasons')->setData($oldRule['seasons']);
        }
    
        return $this->render('param/prices/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }


    #[Route("/prices/delete/{type}/{id}/{ruleId}", name: "admin_settings_prices_delete")]
    public function delete($type, $id, $ruleId, Request $request, ConfigService $configService): Response
    {
            $configService->deletePriceRule($type, $id, $ruleId);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_prices');
    }
}
