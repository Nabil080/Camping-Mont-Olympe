<?php

namespace App\Controller;

use App\Service\ConfigService;
use DateTimeZone;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class FrontController extends AbstractController
{
    #[Route('/', name: 'homepage')]
    public function homepage(ConfigService $configService): Response
    {
        $camping = $configService->getCamping();
        $now = new \DateTime('now', new DateTimeZone('Europe/Paris'));

        return $this->render('front/index.html.twig', [
            'camping' => $camping,
            'date' => $now
        ]);
    }
}
