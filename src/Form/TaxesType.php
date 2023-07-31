<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TaxesType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class)
            ->add('amount', NumberType::class)
            ->add('type', ChoiceType::class, [
                'choices' => ["%" => "percentage", "€" => "devise"],
            ])
            ->add('per_days', CheckboxType::class, [
                'required' => false,
            ])
            ->add('per_person', CheckboxType::class, [
                'required' => false,
            ])
        ;
    }
}
