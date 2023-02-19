<?php

namespace App\DataFixtures;

use App\Entity\Products;
use App\Entity\Categories;
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
        $product->setDescription('Very delicious pizza with cheese, crunchy pepperoni and seasoning.');
        $manager->persist($product);

        $product2 = new Products();
        $product2->setName('Margharita');
        $product2->setImage('img/margharita.jpg');
        $product2->setPrice(6);
        $product2->setDescription('Very delicious cheese pizza in the traditional Italian way.');
        $manager->persist($product2);

        $product3 = new Products();
        $product3->setName('Funghi');
        $product3->setImage('img/funghi.jpg');
        $product3->setPrice(8);
        $product3->setDescription('Very delicious pizza with cheese and perfectly baked mushrooms.');
        $manager->persist($product3);

        $product4 = new Products();
        $product4->setName('BBQ');
        $product4->setImage('img/bbq.jpg');
        $product4->setPrice(12);
        $product4->setDescription('Very delicious pizza with lots of meat and bbq sauce.');
        $manager->persist($product4);

        $product5 = new Products();
        $product5->setName('Meatlovers');
        $product5->setImage('img/meatlovers.jpg');
        $product5->setPrice(14);
        $product5->setDescription('Very delicious pizza with lots of variety in meat and stringy cheese.');
        $manager->persist($product5);

        $product6 = new Products();
        $product6->setName('Veggie');
        $product6->setImage('img/veggie.jpg');
        $product6->setPrice(6);
        $product6->setDescription('Very delicious pizza with vegetarian cheese and vegetables.');
        $manager->persist($product6);

        $product7 = new Products();
        $product7->setName('Mini calzone');
        $product7->setImage('img/minicalzone.jpg');
        $product7->setPrice(3);
        $product7->setDescription('Small calzone filled with delicious ingredients.');
        $manager->persist($product7);

        $product8 = new Products();
        $product8->setName('Coca Cola');
        $product8->setImage('img/cocacola.jpg');
        $product8->setPrice(2);
        $product8->setDescription('The perfect drink for with your American Pizza.');
        $manager->persist($product8);

        $product9 = new Products();
        $product9->setName('Fanta');
        $product9->setImage('img/fanta.jpg');
        $product9->setPrice(2);
        $product9->setDescription('The perfect drink for with your American Pizza.');
        $manager->persist($product9);

        $product10 = new Products();
        $product10->setName('Full calzone');
        $product10->setImage('img/calzone.jpg');
        $product10->setPrice(7);
        $product10->setDescription('Full calzone filled with delicious ingredients.');
        $manager->persist($product10);

        $this->addReference('product_1', $product);
        $this->addReference('product_2', $product2);
        $this->addReference('product_3', $product3);
        $this->addReference('product_4', $product4);
        $this->addReference('product_5', $product5);
        $this->addReference('product_6', $product6);
        $this->addReference('product_7', $product7);
        $this->addReference('product_8', $product8);
        $this->addReference('product_9', $product9);
        $this->addReference('product_10', $product10);

        $category = new Categories();
        $category->setName('Classics');
        $category->addProduct($this->getReference('product_1'));
        $category->addProduct($this->getReference('product_2'));
        $category->addProduct($this->getReference('product_3'));
        $manager->persist($category);

        $category2 = new Categories();
        $category2->setName('Specials');
        $category2->addProduct($this->getReference('product_4'));
        $category2->addProduct($this->getReference('product_5'));
        $manager->persist($category2);

        $category3 = new Categories();
        $category3->setName('Vegan');
        $category3->addProduct($this->getReference('product_6'));
        $manager->persist($category3);

        $category4 = new Categories();
        $category4->setName('Sides');
        $category4->addProduct($this->getReference('product_7'));
        $category4->addProduct($this->getReference('product_10'));
        $manager->persist($category4);

        $category5 = new Categories();
        $category5->setName('Drinks');
        $category5->addProduct($this->getReference('product_8'));
        $category5->addProduct($this->getReference('product_9'));
        $manager->persist($category5);

        $manager->flush();

    }
}
