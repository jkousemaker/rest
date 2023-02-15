<?php

namespace App\DataFixtures;

use App\Entity\Products;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class ProductFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $product = new Products();
        $product->setName('Pepperoni');
        $product->setImage('img/pepperoni.jpg');
        $product->setPrice(8);
        $product->setDescription('Very delicious pepperoni pizza');
        $manager->persist($product);

        $product2 = new Products();
        $product2->setName('Margharita');
        $product2->setImage('img/margharita.jpg');
        $product2->setPrice(6);
        $product2->setDescription('Very delicious margharita pizza');
        $manager->persist($product2);

        $manager->flush();

        $this->addReference('product_1', $product);
        $this->addReference('product_2', $product2);
    }
}

namespace App\DataFixtures;

use App\Entity\Categories;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class CategoryFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $category = new Categories();
        $category->setName('Classics');
        $category->addProduct($this->getReference('product_1'));
        $category->addProduct($this->getReference('product_2'));
        $manager->persist($category);

        $manager->flush();
    }
}