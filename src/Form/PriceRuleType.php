<?php

namespace App\Form;

use App\Service\ConfigService;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class PriceRuleType extends AbstractType
{
    private ConfigService $cs;

    public function __construct(ConfigService $cs)
    {
        $this->cs = $cs;
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('emila', EmailType::class, [
                'constraints' => [
                    new NotBlank,
                    new Length(['min' => 2]),
                    new Email
                ]
            ])
            ->add('amount', NumberType::class, [
                'constraints' => [
                    new NotBlank,
                    new Length(['min' => 2])
                ]
            ])
            ->add('per_days', CheckboxType::class, [
                'required' => false,
            ])
            ->add('per_person', CheckboxType::class, [
                'required' => false,
            ])
            ->add('seasons', ChoiceType::class, [
                'choices' => $this->cs->getSeasonsChoices(),
                'multiple' => true,
                'required' => false,
                'choice_attr' => [
                    'Toutes' => ['selected' => true],
                ],
            ]);
    }
}
