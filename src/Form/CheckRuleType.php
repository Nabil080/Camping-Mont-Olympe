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

    public function __construct(ConfigService $cs){
        $this->cs = $cs;
    }
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('days', ChoiceType::class, [
            'choices' => $this->cs->getDaysChoices(),
            'multiple' => true,
        ])
        ->add('places', ChoiceType::class, [
            'choices' => $this->cs->getPlacesChoices(),
            'multiple' => true,
        ])
        ->add('seasons', ChoiceType::class, [
            'choices' => $this->cs->getSeasonsChoices(),
            'multiple' => true,
        ])
        ;
    }
}
