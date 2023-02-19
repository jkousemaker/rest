<?php

/**
 * Created by PhpStorm.
 * User: Justin
 * Date: 10/02/2023
 * Time: 04:09
 */
namespace App\Controller;


use App\Entity\Messages;
use App\Entity\Products;
use App\Form\ContactFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
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
    public function about(Request $request, EntityManagerInterface $entityManager): Response
    {
        $message = new Messages();
        $form = $this->createForm(ContactFormType::class, $message);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $entityManager->persist($message);
            $entityManager->flush();
            // do anything else you need here, like send an email

            return $this->redirectToRoute('about');
        }

        return $this->render('rest/about.html.twig', [
            'title' => 'About',
            'contactForm' => $form->createView()
        ]);
    }
}