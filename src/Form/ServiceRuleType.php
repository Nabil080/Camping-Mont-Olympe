<?php

namespace App\Form;

use App\Service\ConfigService;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ServiceRuleType extends AbstractType
{
    private ConfigService $cs;

    public function __construct(ConfigService $cs){
        $this->cs = $cs;
    }

    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('max', NumberType::class, [
            'required' => true
        ])
        ->add('places', ChoiceType::class, [
            'choices' => $this->cs->getPlacesChoices(),
            'choice_attr' => [
                'Tous' => ['selected' => true],
            ],
            'multiple' => true,
            'required' => false,
        ])
        ;
    }
}
