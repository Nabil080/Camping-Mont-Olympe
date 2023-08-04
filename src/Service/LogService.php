<?php

namespace App\Service;

use App\Entity\Log;
use DateTimeZone;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\SecurityBundle\Security;

class LogService
{
    private EntityManagerInterface $entityManager;
    private Security $security;

    public function __construct(EntityManagerInterface $entityManager, Security $security)
    {
        $this->entityManager = $entityManager;
        $this->security = $security;
    }

    public function write(string $message, array $context):void
    {
        $user = $this->security->getUser();
        $now = new \DateTime('now', new DateTimeZone('Europe/Paris'));
        $log = new Log;
        $log->setUser($user);
        $log->setDate($now);

        $log->setMessage($message);
        $log->setContext($context);

        $this->entityManager->persist($log);
        $this->entityManager->flush();
    }

    public function translate($string):string
    {
        if($string === "places") return "emplacement";
        if($string === "services") return "service";
        if($string === "ages") return "age";
        if($string === "offers") return "offre";

        return "";
    }
}