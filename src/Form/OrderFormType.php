<?php

namespace App\Form;

use App\Entity\Order;
use App\Entity\Products;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use App\Entity\User;


class OrderFormType extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options): void
    {

        $builder
            ->add('submit', SubmitType::class)
            ->add('size', ChoiceType::class, [
                'choices'  => [
                    '28cm' => '28cm',
                    '35cm' => '35cm',
                    '40cm' => '40cm',
                ],
            ])
            ->add('creditcard')
            ->add('amount')
            ->add('city')
            ->add('zipcode')
            ->add('street')
            ->add('street_number')
            ->add('full_name')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Order::class,
        ]);
    }
}
