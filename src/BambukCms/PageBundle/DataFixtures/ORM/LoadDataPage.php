<?php
namespace BambukCms\PageBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use BambukCms\PageBundle\Entity\Page;

class LoadDataPage implements FixtureInterface
{
	public function load(ObjectManager $manager)
	{				
		/*$page1 = new Page();
		$page1->setTitle('Головна сторінка');
		$page1->setContent('Головна сторінка');
		$page2 = new Page();
		$page2->setTitle('Сторінка 2');
		$page2->setContent('Сторінка 2');
		
		$manager->persist($page1);
		$manager->persist($page2);
		$manager->flush();*/
		
		/*$page1->setTranslatableLocale('de_DE');
		$page1->setTitle('ComedyDE');
		$page1->setContent('ComedyDE');
		$page2->setTranslatableLocale('de_DE');
		$page1->setTitle('ComedyDE');
		$page1->setContent('ComedyDE');
		$manager->flush();*/
		
		

	}

}