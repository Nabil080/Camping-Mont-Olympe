<?php

namespace App\Controller;

use App\Repository\LogRepository;
use DateTimeZone;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        $formatter = new \IntlDateFormatter('fr_FR', \IntlDateFormatter::FULL, \IntlDateFormatter::FULL);
        $now = new \DateTime('now', new DateTimeZone('Europe/Paris'));


        return $this->render('admin/index.html.twig', [
            'date' => $now,
        ]);
    }

    #[Route('admin/logs', name: 'logs')]
    public function logs(LogRepository $lr, Request $request): Response
    {
        $page = $request->query->get('page') ?? 1;
        $search = $request->query->get('search');
        $action = $request->query->get('action');
        $type = $request->query->get('type');
        $limit = 50;

        $logs = $lr->findFilters($limit, $page, $search, $action, $type);
        // $logs = $lr->test();
        // dd($logs);

        return $this->render('admin/logs.html.twig', [
            'logs' => $logs,
            'request' => $request,
            'search' => $search,
            'action' => $action,
            'type' => $type,
        ]);
    }
}
