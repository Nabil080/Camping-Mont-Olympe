<?php

namespace App\Repository;

use App\Entity\Accomodation;
use App\Entity\Reservation;
use DateTime;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Validator\Constraints\Date;

/**
 * @extends ServiceEntityRepository<Reservation>
 *
 * @method Reservation|null find($id, $lockMode = null, $lockVersion = null)
 * @method Reservation|null findOneBy(array $criteria, array $orderBy = null)
 * @method Reservation[]    findAll()
 * @method Reservation[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReservationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Reservation::class);
    }

    //    /**
    //     * @return Reservation[] Returns an array of Reservation objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('r.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Reservation
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }

    public function getReservationsByPeriod(string|DateTime $start, string|DateTime $end, Accomodation $accomodation = null,): array
    {
        $start = DateTime::createFromFormat('d/m/Y', $start);
        $end = DateTime::createFromFormat('d/m/Y', $end);

        // Récupère toutes les réservations dont le séjour chevauche la période voulue
        $qb = $this->createQueryBuilder('r')
            ->join('App\Entity\Location', 'l', 'with', 'r.Location = l.id')
            ->andWhere('r.start BETWEEN :start AND :end')
            ->orWhere('r.end BETWEEN :start AND :end')
            ->setParameter('start', $start)
            ->setParameter('end', $end);

        if ($accomodation) {
            $qb->andWhere('l.accomodation = :accomodation')
                ->setParameter('accomodation', $accomodation->getId());
        }

        $reservations = $qb->getQuery()
            ->getResult();

        return $reservations;
    }

    public function findCheckIns($count = null): array|int
    {
        $today = new DateTime('today');

        $qb = $this->createQueryBuilder('r');

        if ($count) $qb->select('count(r.id) as count');

        $query = $qb->andWhere('r.start = :today')
            ->setParameter(':today', $today)
            ->getQuery();

        return $count ? $query->getOneOrNullResult()['count'] : $query->getResult();
    }

    public function findCheckOuts($count = null): array|int
    {
        $today = new DateTime('today');

        $qb = $this->createQueryBuilder('r');

        if ($count) $qb->select('count(r.id) as count');

        $query = $qb->andWhere('r.end = :today')
            ->setParameter(':today', $today)
            ->getQuery();

        return $count ? $query->getOneOrNullResult()['count'] : $query->getResult();
    }
}
