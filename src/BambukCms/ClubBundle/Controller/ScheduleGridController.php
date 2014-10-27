<?php

namespace BambukCms\ClubBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use BambukCms\ContentBundle\Controller\ContentController;
use BambukCms\ClubBundle\Entity\Schedule;

class ScheduleGridController extends Controller
{
	public function getScheduleAction(Request $request){
		$salle=$_GET['salle'];
		$scheduleCrit= $this->getDoctrine()->getRepository('BambukCmsClubBundle:Schedule')->findBy(array('salle'=> $salle));
		
		$arrSchedule=array();
		foreach ($scheduleCrit as $schedule){
			if($schedule->getMonday()){$monday=$schedule->getMonday()->getName();}else{$monday='';}
			if($schedule->getTuesday()){$tuesday=$schedule->getTuesday()->getName();}else{$tuesday='';}
			if($schedule->getWednesday()){$wednesday=$schedule->getWednesday()->getName();}else{$wednesday='';}
			if($schedule->getThursday()){$thursday=$schedule->getThursday()->getName();}else{$thursday='';}
			if($schedule->getFriday()){$friday=$schedule->getFriday()->getName();}else{$friday='';}
			if($schedule->getSaturday()){$saturday=$schedule->getSaturday()->getName();}else{$saturday='';}
			if($schedule->getSunday()){$sunday=$schedule->getSunday()->getName();}else{$sunday='';}
			$arrSchedule[] = array(
				'hour'=> $schedule->getHour(),
		      	'monday'=> $monday,
		      	'tuesday'=>$tuesday,
		      	'wednesday'=>$wednesday,
				'thursday'=> $thursday,
				'friday'=> $friday,
				'saturday'=> $saturday,
				'sunday'=> $sunday
		  	);
		}
		$contentLib = new ContentController();
	    $response = new Response(json_encode($arrSchedule));
    	//$response->headers->set('Content-Type', 'application/json');
    	$response->headers->set('charset', 'utf-8');
		return $response;
	}
	
   public function getScheduleProgramAction()
  {
    $scheduleProgramCrit= $this->getDoctrine()->getRepository('BambukCmsClubBundle:Program')->findBy(array('active'=> 1), array('sort' => 'ASC'));
    $scheduleProgram = array();
    foreach ($scheduleProgramCrit as $program){
    	$scheduleProgram[]=array(
	    	'monday'  =>  $program->getName(),
	    	'tuesday'  =>  $program->getName(),
	    	'wednesday'  =>  $program->getName(),
	    	'thursday'  =>  $program->getName(),
	    	'friday'  =>  $program->getName(),
    	    'saturday'  =>  $program->getName(),
    	    'sunday'    =>  $program->getName(),
       );
    }
	$contentLib = new ContentController();
	$response = new Response(json_encode($scheduleProgram));  	
    $response->headers->set('charset', 'utf-8');
	return $response;

  }

	public function setScheduleAction(Request $request)
	  {
	  	$salle=$_GET['salle'];
	  	/*delete old data*/
	  	$em = $this->getDoctrine()->getManager();
		$query = $em->createQuery('DELETE FROM BambukCms\ClubBundle\Entity\Schedule m WHERE m.salle='.$salle);
		$query->execute();	
		$salle=$this->getDoctrine()->getRepository('BambukCmsClubBundle:Salle')->findOneBy(array('id'=> $salle));
		
	  	$data_obj = json_decode($_POST['data']);
	  	foreach($data_obj as $obj){
	  		$schedule = new Schedule();
			$schedule->setSalle($salle);
			$schedule->setHour($obj->hour);
	  		if($obj->monday){
	  			$monday=$this->getDoctrine()->getRepository('BambukCmsClubBundle:Program')->findOneBy(array('name'=> $obj->monday));
	  			$schedule->setMonday($monday);
	  		} 
			if($obj->tuesday){
			    $tuesday=$this->getDoctrine()->getRepository('BambukCmsClubBundle:Program')->findOneBy(array('name'=> $obj->tuesday));
	  			$schedule->setTuesday($tuesday);
			}
			if($obj->wednesday){
				$wednesday=$this->getDoctrine()->getRepository('BambukCmsClubBundle:Program')->findOneBy(array('name'=> $obj->wednesday));
	  			$schedule->setWednesday($wednesday);
			}
			if($obj->thursday){
				$thursday=$this->getDoctrine()->getRepository('BambukCmsClubBundle:Program')->findOneBy(array('name'=> $obj->thursday));
	  			$schedule->setThursday($thursday);
			}
			if($obj->friday){
				$friday=$this->getDoctrine()->getRepository('BambukCmsClubBundle:Program')->findOneBy(array('name'=> $obj->friday));
	  			$schedule->setFriday($friday);
	  		}
			if($obj->saturday){
				$saturday=$this->getDoctrine()->getRepository('BambukCmsClubBundle:Program')->findOneBy(array('name'=> $obj->saturday));
	  			$schedule->setSaturday($saturday);
			}
			if($obj->sunday){
				$sunday=$this->getDoctrine()->getRepository('BambukCmsClubBundle:Program')->findOneBy(array('name'=> $obj->sunday));
	  			$schedule->setSunday($sunday);
			}
			
		    $em->persist($schedule);
		    $em->flush();
	  	}
		echo 1;  	
	  	die();
	  }
 }  