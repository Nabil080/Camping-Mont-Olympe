<?php

namespace App\Form;

use App\Service\ConfigService;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class StayRuleType extends AbstractType
{
    private ConfigService $cs;

    public function __construct(ConfigService $cs){
        $this->cs = $cs;
    }

    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('amount', IntegerType::class, [
            'label' => 'montant',
        ])
        ->add('places', ChoiceType::class, [
            'label' => 'emplacements',
            'choices' => $this->cs->getPlacesChoices(),
            'multiple' => true,
        ])
        ->add('seasons', ChoiceType::class, [
            'label' => 'saisons',
            'choices' => $this->cs->getSeasonsChoices(),
            'multiple' => true,
        ])
        ;
    }
}
