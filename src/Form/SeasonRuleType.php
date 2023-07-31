<?php

namespace App\Form;

use App\Service\ConfigService;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SeasonRuleType extends AbstractType
{
    private ConfigService $cs;

    public function __construct(){
        $this->cs = new ConfigService();
    }

    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('start', DateType::class, [
            'input' => 'string'
        ])
        ->add('end', DateType::class, [
            'input' => 'string'
        ])
        ->add('days', ChoiceType::class, [
            'choices' => $this->cs->getDaysChoices(),
            'multiple' => true,
            'required' => false,
        ]);
        ;
    }
}
