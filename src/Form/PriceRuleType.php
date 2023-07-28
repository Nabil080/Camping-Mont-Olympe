<?php

namespace App\Form;

use App\Service\ConfigService;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PriceRuleType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('amount', IntegerType::class)
            ->add('per_days', CheckboxType::class, [
                'required' => false,
            ])
            ->add('per_person', CheckboxType::class, [
                'required' => false,
            ])
            ->add('seasons', ChoiceType::class, [
                'choices' => $this->getSeasonChoices(),
                'multiple' => true,
                'required' => false,
            ]);
    }

    private function getSeasonChoices(): array
    {
        // Get all seasons from the config
        $configService = new ConfigService;
        $seasons = $configService->getConfigByName('seasons');

        // Create an array of choices for the seasons select field
        $choices = [];
        foreach ($seasons as $season) {
            $choices[$season['name']] = $season['name'];
        }

        return $choices;
    }
}
