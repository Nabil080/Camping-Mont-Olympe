<?php

namespace App\Repository;

use App\Entity\Accomodation;
use App\Entity\Location;
use DateTime;
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


    public function getAccomodationLocationsByReservations(Accomodation $accomodation, array $reservations, bool $reversed = false): array
    {
        $condition = $reversed ? 'NOT IN' : 'IN';

        $locationIds = array_map(fn ($reservation) => $reservation->getLocation()->getId(), $reservations);

        $qb = $this->createQueryBuilder('l')
            ->andWhere("l.available = true")
            ->andWhere("l.accomodation = :accomodation")
            ->setParameter("accomodation", $accomodation);
        if (!empty($locationIds)) 
            $qb->andWhere("l.id $condition (:ids)")
            ->setParameter('ids', $locationIds);


        return $qb->getQuery()
                ->getResult();
    }
}
