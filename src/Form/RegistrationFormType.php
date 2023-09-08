<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, ['label' => 'Email', 'attr' => ['placeholder' => 'Email ', 'autocomplete' => 'false'],
            'constraints' => [
                new NotBlank
            ],
            'help' => 'Un mail de vérification sera envoyé à cette adresse'
            ])
            ->add('first_name', TextType::class, ['label' => 'Prénom', 'attr' => ['placeholder' => 'Nom ']])
            ->add('last_name', TextType::class, ['label' => 'Nom', 'attr' => ['placeholder' => 'Prenom ']])
            ->add('phone', TelType::class, ['label' => 'Téléphone', 'attr' => ['placeholder' => 'Téléphone ']])
            ->add('plainPassword', PasswordType::class, [
                'label' => 'Mot de passe', 'attr' => ['placeholder' => 'Mots de passe '],
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Vous devez entrer un mot de passe.',
                    ]),
                    // new Regex([
                    //     'message' => 'Votre mot de passe doit comporter minimum un caractère en majuscule, un caractère en minuscule, un chiffre et un caractère spécial.',
                    //     'pattern' => "/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/",
                    // ]),
                    new Length([
                        'min' => 2,
                        'minMessage' => 'Votre mot de passe doit comporter au minimum {{ limit }} caractères',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
