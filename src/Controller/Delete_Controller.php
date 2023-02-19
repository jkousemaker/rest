<?php


namespace App\Controller;

use App\Entity\Messages;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;

class Delete_Controller extends AbstractController
{
    private $em;
    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    #[Route('/message/{id}', name: 'delete_message')]
    public function delete(Request $request, Messages $message): Response
    {
        $repository = $this->em->getRepository(Messages::class);
        $repository->remove($message);
        $this->em->flush();

        return $this->redirectToRoute('adminpanel', ['page' => 1]);
    }
}
