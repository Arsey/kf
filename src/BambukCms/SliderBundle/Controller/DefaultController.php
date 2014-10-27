<?php

namespace BambukCms\SliderBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('BambukCmsSliderBundle:Default:index.html.twig', array('name' => $name));
    }
}
