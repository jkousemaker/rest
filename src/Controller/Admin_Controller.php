<?php
/**
 * Created by PhpStorm.
 * User: Justin
 * Date: 13/02/2023
 * Time: 13:19
 */

namespace App\Controller;


use App\Entity\Categories;
use App\Entity\Products;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

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

        $repository2 = $this->em->getRepository(Products::class);
        $products = $repository2->findAll();

        return $this->render('rest/products.html.twig', [
            'categories' => $categories,
            'id' => $slug
        ]);
    }

    #[Route('/product/{slug}', name: 'product')]
    public function product(int $slug): Response
    {
        $id = $slug;

        $repository = $this->em->getRepository(Products::class);
        $product = $repository->find($id);

        return $this->render('rest/product.html.twig', [
            'id' => $id,
            'product' => $product
        ]);
    }

    #[Route('/api/product/{id<\d+>}', methods: ['GET'])]
    public function getProduct(int $id): Response
    {
        $product = [
            'id' => $id,
            'name' => 'pepperoni',
            'price' => 13,
        ];

        return $this->json($product);
    }
}
