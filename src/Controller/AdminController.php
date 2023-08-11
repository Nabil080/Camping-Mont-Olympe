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
        $search = $request->query->get('search');

        if($search)
            $logs = $lr->findSearch($search);
        else
            $logs = $lr->findBy([],['id' => 'DESC']);

        return $this->render('admin/logs.html.twig', [
            'logs' => $logs,
            'request' => $request
        ]);
    }
}
