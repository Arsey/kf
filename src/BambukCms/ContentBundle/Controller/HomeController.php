<?php

namespace BambukCms\ContentBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;

class HomeController extends Controller
{
    public function indexAction()
    {
    	$sliders=$this->getDoctrine()->getRepository('BambukCmsSliderBundle:Slider')->findBy(array('active' => 1),array('sort' => 'ASC'));
    	$section = $this->getDoctrine()->getRepository('BambukCmsClubBundle:Section')->findOneById(1);
		
        return $this->render('BambukCmsContentBundle:Home:layout.html.twig',array('sliders'=>$sliders, 'section'=>$section));
    }

    public function headerAction()
    {
		$menus=$this->getDoctrine()->getRepository('BambukCmsPageBundle:Page')->findBy(array('parent' => NULL,'active'=> 1), array('position' => 'ASC'));
        return $this->render('BambukCmsContentBundle:Home:header.html.twig',array('menus'=>$menus));
    }
    
    public function footerAction()
    {
    	$cities=$this->getDoctrine()->getRepository('BambukCmsClubBundle:City')->findAll();
        $menu=$this->getDoctrine()->getRepository('BambukCmsPageBundle:Page')->findOneBy(array('active'=> 1), array('position' => 'ASC'));
    	return $this->render('BambukCmsContentBundle:Home:footer.html.twig',array('cities'=>$cities,'menu'=>$menu));
    }
       
    public function json_encode_cyr($str)
	  {
			    $arr_replace_utf = array('\u0410', '\u0430', '\u0411', '\u0431', '\u0412', '\u0432', '\u0413', '\u0433', '\u0414', '\u0434', '\u0415', '\u0435', '\u0401', '\u0451', '\u0416', '\u0436', '\u0417', '\u0437', '\u0418', '\u0438', '\u0419', '\u0439', '\u041a', '\u043a', '\u041b', '\u043b', '\u041c', '\u043c', '\u041d', '\u043d', '\u041e', '\u043e', '\u041f', '\u043f', '\u0420', '\u0440', '\u0421', '\u0441', '\u0422', '\u0442', '\u0423', '\u0443', '\u0424', '\u0444', '\u0425', '\u0445', '\u0426', '\u0446', '\u0427', '\u0447', '\u0428', '\u0448', '\u0429', '\u0449', '\u042a', '\u044a', '\u042d', '\u044b', '\u042c', '\u044c', '\u042d', '\u044d', '\u042e', '\u044e', '\u042f', '\u044f', '\u0406', '\u0456', '\u0407', '\u0457', '\u0404', '\u0454');
			    $arr_replace_cyr = array('А', 'а', 'Б', 'б', 'В', 'в', 'Г', 'г', 'Д', 'д', 'Е', 'е', 'Ё', 'ё', 'Ж', 'ж', 'З', 'з', 'И', 'и', 'Й', 'й', 'К', 'к', 'Л', 'л', 'М', 'м', 'Н', 'н', 'О', 'о', 'П', 'п', 'Р', 'р', 'С', 'с', 'Т', 'т', 'У', 'у', 'Ф', 'ф', 'Х', 'х', 'Ц', 'ц', 'Ч', 'ч', 'Ш', 'ш', 'Щ', 'щ', 'Ъ', 'ъ', 'Ы', 'ы', 'Ь', 'ь', 'Э', 'э', 'Ю', 'ю', 'Я', 'я', 'І', 'і', 'Ї', 'ї', 'Є', 'є');
			    $str1 = json_encode($str);
			    $str2 = str_replace($arr_replace_utf, $arr_replace_cyr, $str1);
			    return $str2;
	  }
     public  function encodestring($str)
		  {
				$alphavit = array(
					    /*--*/
					    "а"=>"a","б"=>"b","в"=>"v","г"=>"g","д"=>"d","е"=>"e",
					    "ё"=>"yo","ж"=>"j","з"=>"z","и"=>"i","і"=>"i","й"=>"i","к"=>"k","л"=>"l", "м"=>"m",
					    "н"=>"n","о"=>"o","п"=>"p","р"=>"r","с"=>"s","т"=>"t",
					    "у"=>"y","ф"=>"f","х"=>"h","ц"=>"c","ч"=>"ch", "ш"=>"sh","щ"=>"sh",
					    "ы"=>"i","э"=>"ya","ю"=>"u","ґ"=>"g","є"=>"e","я"=>"ya",
					    /*--*/
					    "А"=>"A","Б"=>"B","В"=>"V","Ґ"=>"G","Є"=>"E","Г"=>"G","Д"=>"D","Е"=>"E", "Ё"=>"Yo",
					    "Ж"=>"J","З"=>"Z","И"=>"I","Й"=>"I","І"=>"I","К"=>"K", "Л"=>"L","М"=>"M",
					    "Н"=>"N","О"=>"O","П"=>"P", "Р"=>"R","С"=>"S","Т"=>"T","У"=>"Y",
					    "Ф"=>"F", "Х"=>"H","Ц"=>"C","Ч"=>"Ch","Ш"=>"Sh","Щ"=>"Sh",
					    "Ы"=>"I","Э"=>"E","Ю"=>"U","Я"=>"Ya",
					    "ь"=>"","Ь"=>"","ъ"=>"","Ъ"=>""
					    );
   			 return strtr($str, $alphavit);
		  }
		  
}