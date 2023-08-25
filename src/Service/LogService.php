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
        $log = new Log;
        $user = $this->security->getUser();
        $log->setUser($user);
        
        $log->setMessage($message);
        $log->setContext($context);

        $this->entityManager->persist($log);
        $this->entityManager->flush();
    }

    public function translate($string):string
    {
        return match ($string) {
            default => '',
            'places' => 'emplacement',
            'offers' => 'offre',
            'locations' => 'emplacement',
            'accomodations' => 'hébérgement'
        };
    }
}