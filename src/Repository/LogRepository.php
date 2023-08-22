<?php

namespace App\Repository;

use App\Entity\Log;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Log>
 *
 * @method Log|null find($id, $lockMode = null, $lockVersion = null)
 * @method Log|null findOneBy(array $criteria, array $orderBy = null)
 * @method Log[]    findAll()
 * @method Log[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LogRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Log::class);
    }

//    /**
//     * @return Log[] Returns an array of Log objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('l')
//            ->andWhere('l.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('l.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Log
//    {
//        return $this->createQueryBuilder('l')
//            ->andWhere('l.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }

    public function findSearch($search): array
    {
        return $this->createQueryBuilder('p')
        ->andWhere('p.message like :search')
        ->setParameter(':search', "%$search%")
        ->getQuery()
        ->getResult();        
    }

    public function findFilters($limit,$page,$search,$action,$type): array
    {
        $offset = ($page - 1 ) * $limit;

        return $this->createQueryBuilder('p')
        ->andWhere('p.message like :search')
        ->orWhere('p.context like :search')
        ->setParameter(':search', "%$search%")
        ->andWhere('p.context like :action')
        ->setParameter(':action',"%$action%")
        ->andWhere('p.context like :type')
        ->setParameter(':type',"%$type%")
        ->orderBy('p.id', 'DESC')
        ->setMaxResults($limit)
        ->setFirstResult($offset)
        ->getQuery()
        ->getResult();   
    }
}
