<?php

namespace App\Repository;

use App\Entity\Accomodation;
use App\Entity\Location;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Validator\Constraints\Date;

/**
 * @extends ServiceEntityRepository<Location>
 *
 * @method Location|null find($id, $lockMode = null, $lockVersion = null)
 * @method Location|null findOneBy(array $criteria, array $orderBy = null)
 * @method Location[]    findAll()
 * @method Location[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LocationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Location::class);
    }


    public function isAccomAvailableDuringPeriod(Accomodation $accomodation, string|Date $start, string|Date $end){
        // Récupère toutes les réservations de l'accomodation dont le séjour chevauche la période voulue
        $qb = $this->createQueryBuilder('l')
        ->join('App\Entity\Reservation','r','with','r.Location = l.id')
        // ->select('r')
        ->andWhere('l.accomodation = :accomodation')
        ->setParameter('accomodation',$accomodation->getId())
        ->getQuery()
        ->getResult();

        dd($qb);
    }
}
