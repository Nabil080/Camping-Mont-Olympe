<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SeasonRuleType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('start', DateType::class, [
            // 'widget' => 'single_text',
            'input' => 'string'
        ])
        ->add('end', DateType::class, [
            // 'widget' => 'single_text',
            'input' => 'string'
        ])
        ->add('days', ChoiceType::class, [
            'choices' => [
                "Tous" => null,
                "Lundi" => 1,
                "Mardi" => 2,
                "Mercredi" => 3,
                "Jeudi" => 4,
                "Vendredi" => 5,
                "Samedi" => 6,
                "Dimanche" => 7,
            ],
            'multiple' => true,
            'required' => false,
        ]);
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
