<?php

namespace App\Form;

use App\Service\ConfigService;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CheckRuleType extends AbstractType
{
    private ConfigService $cs;

    public function __construct(){
        $this->cs = new ConfigService;
    }
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('days', ChoiceType::class, [
            'choices' => $this->cs->getDaysChoices(),
            'multiple' => true,
            'required' => false,
        ])
        ->add('places', ChoiceType::class, [
            'choices' => $this->cs->getPlacesChoices(),
            'multiple' => true,
            'required' => false,
        ])
        ->add('seasons', ChoiceType::class, [
            'choices' => $this->cs->getSeasonsChoices(),
            'multiple' => true,
            'required' => false,
        ])
        ;
    }
}
