<?php

namespace App\Form;

use App\Entity\Accomodation;
use App\Entity\Image;
use App\Entity\Tag;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\Validator\Constraints\NotBlank;

class AccomodationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, [
                'label' => 'Nom',
                'constraints' => [
                    new NotBlank
                ],
            ])
            ->add('description', TextType::class, [
                'constraints' => [
                    new NotBlank
                ], 
            ])
            ->add('available', CheckboxType::class,[
                'label' => 'disponible',
                'attr' => [
                    'checked' => true,
                ]
            ])
            ->add('image', FileType::class, [
                'constraints' => [
                    new File([
                        'maxSize' => '8M', 
                        'mimeTypes' => [
                            'image/jpg',
                            'image/jpeg',
                            'image/png',
                        ],
                        'maxSizeMessage' => 'Fichier trop volumineux (8Mo maximum)',
                        'mimeTypesMessage' => 'Formats autorisées : jpg, jpeg, png.',
                    ]),
                    new NotBlank,
                ],
            ])
            ->add('tags', EntityType::class, [
                'class' => Tag::class,
                'choice_label' => 'name',
                'multiple' => true,
                'required' => false
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Accomodation::class,
        ]);
    }
}
