<?php

namespace BambukCms\ClubBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use BambukCms\ContentBundle\Controller\ContentController;
use BambukCms\ClubBundle\Entity\Schedule;

class ScheduleController extends Controller
{
	public function getScheduleTodayAction(Request $request){
		$salles= $this->getDoctrine()->getRepository('BambukCmsClubBundle:Salle')->findBy(array('club'=> 2));
		$today=date('l');
    	return $this->render('BambukCmsClubBundle:Schedule:scheduleToday.html.twig',array('salles'=>$salles,'today'=>$today));
	}
 }  