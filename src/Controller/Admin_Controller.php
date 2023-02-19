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

class Admin_Controller extends AbstractController
{
    private $em;
    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    #[Route('/adminpanel/{page}', name: 'adminpanel')]
    public function adminpanel(int $page = null): Response
    {
        /*
         * Save orders in variable and sent to adminpanel
         */
        $repository = $this->em->getRepository(Categories::class);
        $categories = $repository->findAll();

        if($page == null) {
            $page = 0;
        }

        return $this->render('rest/adminpanel.html.twig', [
            'categories' => $categories,
            'page' => $page
        ]);
    }

    #[Route('/admin/{slug}/{type}/{$action}', name: 'admin')]
    public function admin(int $slug, string $type, string $action): Response
    {
        return $this->render('rest/product.html.twig', [

        ]);
    }
}

