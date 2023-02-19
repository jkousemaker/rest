<?php

/**
 * Created by PhpStorm.
 * User: Justin
 * Date: 10/02/2023
 * Time: 04:09
 */
namespace App\Controller;


use App\Entity\Products;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use function Symfony\Component\String\u;
use App\Entity\Categories;
class Rest_Controller extends AbstractController
{


    #[Route('/', name: 'homepage')]
    public function homepage(): Response
    {
        return $this->render('rest/homepage.html.twig', [
            'title' => 'Home',
        ]);
    }


    #[Route('/about', name: 'about')]
    public function about(): Response
    {
        return $this->render('rest/about.html.twig', [
            'title' => 'About',
        ]);
    }
}