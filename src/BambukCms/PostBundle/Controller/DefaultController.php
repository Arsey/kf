<?php

namespace BambukCms\PostBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('BambukCmsPostBundle:Default:index.html.twig', array('name' => $name));
    }
}
