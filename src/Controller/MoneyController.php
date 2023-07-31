<?php

namespace App\Controller;

use App\Form\TaxesType;
use App\Service\ConfigService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MoneyController extends AbstractController
{
    #[Route('/money', name: 'admin_settings_money')]
    public function index(ConfigService $configService): Response
    {
        $paiements = $configService->getPaiements();
        $taxes = $configService->getTaxes();

        return $this->render('param/money/index.html.twig', [
            'paiements' => $paiements,
            'taxes' => $taxes,
        ]);
    }

    #[Route('/money/{type}/{bool}', name: 'admin_settings_paiements_add')]
    public function updatePaiements(string $type, string $bool, ConfigService $configService): Response
    {
        $configService->updatePaiements($type, $bool === "true" ? true : false);

        return $this->redirectToRoute('admin_settings_money');
    }

    #[Route('/taxes/add', name: 'admin_settings_taxes_add')]
    public function addTax(ConfigService $configService, Request $request): Response
    {

        $form = $this->createForm(TaxesType::class);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) { 
            $lastId = $configService->getLastTaxes();

            $tax = ["id" => $lastId + 1];
            $tax += $form->getData();

            $configService->addTax($tax);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_money');
        }

        return $this->render('param/money/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/taxes/update/{taxId}', name: 'admin_settings_taxes_update')]
    public function updateTax(int $taxId, ConfigService $configService, Request $request): Response
    {
        $oldTax = $configService->getTaxes($taxId);

        $form = $this->createForm(TaxesType::class);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) { 
            $tax = ["id" => $taxId];
            $tax += $form->getData();

            $configService->updateTax($taxId, $tax);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_money');
        }else{
            $form->get('name')->setData($oldTax['name']);
            $form->get('amount')->setData($oldTax['amount']);
            $form->get('type')->setData($oldTax['type']);
            $form->get('per_days')->setData($oldTax['per_days']);
            $form->get('per_person')->setData($oldTax['per_person']);
        }

        return $this->render('param/money/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route("/taxes/delete/{taxId}", name: "admin_settings_seasons_tax_delete")]
    public function deleteTax(int $taxId, Request $request, ConfigService $configService): Response
    {
            $configService->deleteTax($taxId);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_money');
    }
}
