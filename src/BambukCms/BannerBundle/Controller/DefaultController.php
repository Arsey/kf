<?php

namespace BambukCms\BannerBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('BambukCmsBannerBundle:Default:index.html.twig', array('name' => $name));
    }
}
