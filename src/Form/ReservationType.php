<?php

namespace App\Form;

use App\Entity\Location;
use App\Entity\Reservation;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ReservationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('start')
            ->add('end')
            ->add('adults')
            ->add('childs')
            ->add('comment')
            ->add('price')
            ->add('paid')
            ->add('phone')
            ->add('first_name')
            ->add('last_name')
            ->add('email')
            ->add('location', EntityType::class, [
                'class' => Location::class,
                'choice_label' => 'number',
            ]);
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Reservation::class,
        ]);
    }
}
