<?php

namespace App\Controller;

use App\Form\ServiceRuleType;
use App\Form\ServiceType;
use App\Service\ConfigService;
use App\Service\LogService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ServicesController extends AbstractController
{
    #[Route('/admin/settings/services', name: 'admin_settings_services')]
    public function index(ConfigService $configService): Response
    {
        $services = $configService->getServices();

        return $this->render('admin/settings/services/index.html.twig', [
            'services' => $services,
        ]);
    }

    #[Route('/services/add', name: 'admin_settings_services_add')]
    public function add(ConfigService $configService, Request $request, LogService $logService): Response
    {
        $form = $this->createForm(ServiceType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $lastId = $configService->getLastService();
            $name = $form->getData()['name'];
            $season = ["id" => $lastId + 1, "name" => $name, "rules" => []];

            $configService->addService($season);
            $this->addFlash('success', 'New "places" price rule added successfully!');

            $message = "Un service '" . $season['name'] . "' a été ajouté";
            $context = ["add", "service"];
            $logService->write($message, $context);

            return $this->redirectToRoute('admin_settings_services');
        }

        return $this->render('admin/settings/services/add.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route("/services/update/{serviceId<\d+>}", name: "admin_settings_services_update")]
    public function update(int $serviceId, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $oldService = $configService->getServices()[$serviceId];

        $form = $this->createForm(ServiceType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $name = $form->getData()['name'];
            $service = ["id" => $oldService['id'], "name" => $name, "rules" => $oldService['rules']];

            $configService->updateService($serviceId, $service);

            $this->addFlash('success', 'New "places" price rule added successfully!');

            $message = "Le service '" . $oldService['name'] . "' a été renommé en '$name'";
            $context = ["update", "service"];
            $logService->write($message, $context);

            return $this->redirectToRoute('admin_settings_services');
        } else {
            $form->get('name')->setData($oldService['name']);
        }

        return $this->render('admin/settings/services/add.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route("/services/delete/{serviceId<\d+>}", name: "admin_settings_services_delete")]
    public function delete($serviceId, Request $request, ConfigService $configService, LogService $logService): Response
    {
        $oldService = $configService->getServices()[$serviceId];
        $configService->deleteService($serviceId);

        $message = "Le service '" . $oldService['name'] . "' a été supprimé";
        $context = ["delete", "service"];
        $logService->write($message, $context);

        $this->addFlash('success', 'New "places" price rule added successfully!');
        return $this->redirectToRoute('admin_settings_services');
    }

    #[Route('/services/{serviceId}/rule/add', name: 'admin_settings_services_rule_add')]
    public function addRule(int $serviceId, ConfigService $configService, Request $request): Response
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

        return $this->render('param/services/add_rule.html.twig', [
            'form' => $form->createView(),
        ]);
    }


    #[Route('/services/{serviceId}/update/{ruleId<\d+>}', name: 'admin_settings_services_rule_update')]
    public function updateRule(int $serviceId, int $ruleId, ConfigService $configService, Request $request): Response
    {
        $oldService = $configService->getServices($serviceId);
        foreach ($oldService['rules'] as $index => $rule) {
            if ($rule['id'] === $ruleId)
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
        } else {
            $form->get('max')->setData($oldRule['max']);
            $form->get('places')->setData($oldRule['places']);
        }

        return $this->render('param/services/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route("/services/{serviceId}/delete/{ruleId<\d+>}", name: "admin_settings_services_rule_delete")]
    public function deleteRule(int $serviceId, int $ruleId, Request $request, ConfigService $configService): Response
    {
        $configService->deleteserviceRule($serviceId, $ruleId);

        $this->addFlash('success', 'New "places" price rule added successfully!');
        return $this->redirectToRoute('admin_settings_services');
    }
}
