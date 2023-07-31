<?php

namespace App\Form;

use App\Service\ConfigService;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\OptionsResolver\OptionsResolver;

class OfferRuleType extends AbstractType
{
    private ConfigService $cs;

    public function __construct(){
        $this->cs = new ConfigService;
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class, [
                'required' => true
            ])
            ->add('amount', NumberType::class)
            ->add('type', ChoiceType::class, [
                'choices' => ["%" => "percentage", "€" => "devise"],
            ])
            ->add('uses', IntegerType::class, [
                'required' => false
            ])
            ->add('start', DateType::class, [
                // 'widget' => 'single_text',
                'input' => 'string'
            ])
            ->add('end', DateType::class, [
                // 'widget' => 'single_text',
                'input' => 'string'
            ])
            ->add('places', ChoiceType::class, [
                'choices' => $this->cs->getPlacesChoices(),
                'multiple' => true,
                'required' => false,
            ]);
    }
}
