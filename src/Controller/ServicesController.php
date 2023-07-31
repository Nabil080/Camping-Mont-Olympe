<?php

namespace App\Controller;

use App\Form\ServiceRuleType;
use App\Service\ConfigService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ServicesController extends AbstractController
{
    #[Route('/services', name: 'admin_settings_services')]
    public function index(ConfigService $configService): Response
    {
        $services = $configService->getServices();

        return $this->render('param/services/index.html.twig', [
            'services' => $services,
        ]);
    }

    #[Route('/services/{serviceId}/add', name: 'admin_settings_services_add')]
    public function add(int $serviceId, ConfigService $configService, Request $request): Response
    {
        $form = $this->createForm(ServiceRuleType::class);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) { 
            $lastId = $configService->getLastServicesRule($serviceId);
            $rule = ["id" => $lastId + 1];
            $rule += $form->getData();

            $configService->addServiceRule($serviceId, $rule);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_services');
        }

        return $this->render('param/services/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }


    #[Route('/services/{serviceId}/update/{ruleId}', name: 'admin_settings_services_update')]
    public function update(int $serviceId, int $ruleId, ConfigService $configService, Request $request): Response
    {
        $oldService = $configService->getServices($serviceId);
        foreach($oldService['rules'] as $index => $rule){
            if($rule['id'] === $ruleId)
                $oldRule = $oldService['rules'][$index];
        }

        $form = $this->createForm(ServiceRuleType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $rule = ["id" => $ruleId];
            $rule += $form->getData();

            $configService->updateServiceRule($serviceId, $rule);
            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_services');
        }else{
                $form->get('max')->setData($oldRule['max']);
                $form->get('places')->setData($oldRule['places']);
        }

        return $this->render('param/services/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route("/services/{serviceId}/delete/{ruleId}", name: "admin_settings_services_delete")]
    public function deleteRule(int $serviceId, int $ruleId, Request $request, ConfigService $configService): Response
    {
            $configService->deleteserviceRule($serviceId, $ruleId);

            $this->addFlash('success', 'New "places" price rule added successfully!');
            return $this->redirectToRoute('admin_settings_services');
    }
}
