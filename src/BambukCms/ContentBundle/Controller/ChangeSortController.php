<?php
namespace BambukCms\ContentBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class ChangeSortController extends Controller
{
	public function changeSortAction(Request $request){
		$mod=$_POST['mode'];
		$data=json_decode($_POST['arrSortJson'], true);
		foreach($data as $key => $pos){
			$position=(int)$key+1;
			$posUpdate=$this->getDoctrine()->getRepository($mod)->findOneById($pos['id']);
			$em = $this->getDoctrine()->getManager();
			$posUpdate->setSort($position);
			$em->flush();
		}
		echo 1;
		die();
		return true;
	}

}