<?php
/**
 * Created by PhpStorm.
 * User: Justin
 * Date: 13/02/2023
 * Time: 13:19
 */

namespace App\Controller;


use App\Entity\Categories;
use App\Entity\Order;
use App\Entity\Products;
use App\Entity\User;
use App\Form\OrderFormType;
use App\Form\RegistrationFormType;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Form\CartItemFormType;
use Symfony\Component\HttpFoundation\Request;

class Product_Controller extends AbstractController
{
    private $em;
    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    #[Route('/products/{slug}', name: 'products')]
    public function products(int $slug = null): Response
    {

        $repository = $this->em->getRepository(Categories::class);
        $categories = $repository->findAll();

        return $this->render('rest/products.html.twig', [
            'categories' => $categories,
            'id' => $slug
        ]);
    }

    #[Route('/product/{slug}', name: 'product')]
    public function product(int $slug, Request $request, EntityManagerInterface $entityManager): Response
    {
        $id = $slug;

        $repository = $this->em->getRepository(Products::class);
        $product = $repository->find($id);

        $order = new Order();
        $order->setProductId($product);
        $form = $this->createForm(OrderFormType::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($order);
            $entityManager->flush();
            // do anything else you need here, like send an email

            return $this->redirectToRoute('orderconfirm');
        }

        return $this->render('rest/product.html.twig', [
            'id' => $id,
            'orderForm' => $form->createView(),
            'product' => $product
        ]);
    }

    #[Route('/order-confirm', name: 'orderconfirm')]
    public function orderConfirm(): Response
    {

        return $this->render('rest/confirm.html.twig');
    }
}

