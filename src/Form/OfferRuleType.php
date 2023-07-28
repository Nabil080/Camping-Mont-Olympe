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
                'choices' => $this->getPlacesChoices(),
                'multiple' => true,
                'required' => false,
            ]);
    }

    private function getPlacesChoices(): array
    {
        // Get all seasons from the config
        $configService = new ConfigService;
        $seasons = $configService->getConfigByName('seasons');

        // Create an array of choices for the seasons select field
        $choices = ["Toutes" => null];
        foreach ($seasons as $season) {
            $choices[$season['name']] = $season['name'];
        }

        return $choices;
    }
}
