<?php
namespace BambukCms\PageBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use BambukCms\PageBundle\Entity\Contact;
use BambukCms\PageBundle\Form\ContactType;
use BambukCms\ContentBundle\Controller\ContentController;

class PageController extends Controller
{
   
	public function indexAction()
    {
        return $this->render('BambukCmsPageBundle:Page:home.html.twig');
    }
    
    public function listPageAction()
    {
    	$pages=$this->getDoctrine()->getRepository('BambukCmsPageBundle:Page')->findAll();
    	return $this->render('BambukCmsPageBundle:Page:list.html.twig',array('pages'=>$pages));
    }
    public function showPageAction($slug)
    {
    	$contentLib = new ContentController();
    	$page=$this->getDoctrine()->getRepository('BambukCmsPageBundle:Page')->findOneBySlug($slug);
    	return $this->render('BambukCmsPageBundle:Page:show.html.twig',array('page'=>$page));
    }
    public function contactAction()
    {
    	 $enquiry = new Contact();
         $form = $this->createForm(new ContactType(), $enquiry);

    $request = $this->getRequest();
    if ($request->getMethod() == 'POST') {
        $form->bind($request);
        if ($form->isValid()) {
        $message = \Swift_Message::newInstance()
            ->setSubject('Форма зворотнього звязку з сайту bambukCms')
            ->setFrom('slfedyna@gmail.com')
            ->setTo('slfedyna@gmail.com')
            ->setBody($this->renderView('BambukCmsPageBundle:Page:contactEmail.txt.twig', array('enquiry' => $enquiry)));
	        $this->get('mailer')->send($message);
	        $this->get('session')->getFlashBag()->add('blogger-notice','Ваш запит був успішно відправлений і буде переглянутий наближчим часом. Дякую!');
            return $this->redirect($this->generateUrl('bambuk_cms_page_contact'));
        }
    }

    return $this->render('BambukCmsPageBundle:Page:contact.html.twig', array('form' => $form->createView()));
    }
    
	
}