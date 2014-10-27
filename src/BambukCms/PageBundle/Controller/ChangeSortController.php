<?php
namespace BambukCms\PageBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class ChangeSortController extends Controller
{
	public function changeSortAction(Request $request){
		$data=json_decode($_POST['arrSortJson'], true);
		foreach($data as $key => $page){
			$position=(int)$key+1;
			$pageUpdate=$this->getDoctrine()->getRepository('BambukCmsPageBundle:Page')->findOneById($page['id']);
			$em = $this->getDoctrine()->getManager();
			$pageUpdate->setPosition($position);
			$pageUpdate->setParent(null);
			$em->flush();
			if(isset($page['children'])){
			 	$this->changeSortChildrenPage($page['children'],(int)$page['id']);
			 }
		}
		echo 1;
		die();
		return true;
	}
	
	public function changeSortChildrenPage($childrens,$parent_id){
		
		foreach($childrens as $key => $page){
				$position=(int)$key+1;
				$em = $this->getDoctrine()->getManager();
				$qb = $em->createQueryBuilder();
				$q = $qb->update('BambukCmsPageBundle:Page', 'u')
				->set('u.position', $position)
				->set('u.parent', $parent_id)
				->where('u.id ='.$page['id'])
				->getQuery();
				$p = $q->execute();
				if(isset($page['children'])){
					$this->changeSortChildrenPage($page['children'],(int)$page['id']);
				}
		}
		echo true;
	}

}

