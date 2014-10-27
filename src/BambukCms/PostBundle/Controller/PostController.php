<?php
namespace BambukCms\PostBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use BambukCms\PostBundle\Entity\Contact;
use Symfony\Component\HttpFoundation\Response;
use BambukCms\ContentBundle\Controller\ContentController;

class PostController extends Controller
{   
    public function listPostAction()
    {
    	$posts=$this->getDoctrine()->getRepository('BambukCmsPostBundle:Post')->findBy(array('active'=> 1), array('sort' => 'ASC'));
    	return $this->render('BambukCmsPostBundle:Post:list.html.twig',array('posts'=>$posts));
    }
    public function showPostAction($slug)
    {   
    	$post=$this->getDoctrine()->getRepository('BambukCmsPostBundle:Post')->findOneBy(array('slug' => $slug));
    	$arrTag=array();
    	foreach($post->getTags() as $tag){
    		$arrTag[$tag->getId()]=$tag->getName();
    	}
    	$contentLib = new ContentController();
	    $response = new Response($contentLib->json_encode_cyr(array('title' => $post->getTitle(),'img' => $post->getImage(),'slug' => $post->getSlug(),'content' => $post->getContent(),'type' => $post->getType(),'tags'=> $arrTag)));
    	$response->headers->set('Content-Type', 'application/json');
    	$response->headers->set('charset', 'utf-8');
		return $response;
    	//return $this->render('BambukCmsPostBundle:Post:show.html.twig',array('post'=>$post));
    }    
    
    public function showPostTagAction($id)
    {   

		$tags = $this->getDoctrine()->getRepository('BambukCmsShowRoomBundle:Tags')->findOneById($id);
		$posts = $tags->getPosts();
    	$arrPostIds=array();
    	foreach($posts as $post){
    		$arrPostIds[$post->getId()]=$post->getId();
    	}
    	$posts=$this->getDoctrine()->getRepository('BambukCmsPostBundle:Post')->findById($arrPostIds);
    	//return $this->render('BambukCmsPostBundle:Post:showPostTag.html.twig',array('posts'=>$posts));
    	$arrAnswerAll=array();
     	foreach($posts as $post){
     		$arrAnswer=array();
     		$arrTag=array();
	     	foreach($post->getTags() as $tag){
	    		$arrTag[$tag->getId()]=$tag->getName();
	    	}
     		$arrAnswer['id']= $post->getId();
     		$arrAnswer['title']= $post->getTitle();
     		$arrAnswer['img']= $post->getImage();
     		$arrAnswer['slug']= $post->getSlug();
     		$arrAnswer['content']= $post->getContent();
     		$arrAnswer['type']= $post->getType();
     		$arrAnswer['tags']= $arrTag;
     		array_push($arrAnswerAll,$arrAnswer);
    	}
    	
    	$contentLib = new ContentController();
	    $response = new Response($contentLib->json_encode_cyr($arrAnswerAll));
    	$response->headers->set('Content-Type', 'application/json');
    	$response->headers->set('charset', 'utf-8');
		return $response;
    }   

}