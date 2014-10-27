<?php
namespace BambukCms\ClubBundle\Admin;
 
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Gedmo\Translatable\Entity\Repository\TranslationRepository;
use Gedmo\Translatable\TranslatableListener;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;
use Sonata\AdminBundle\Route\RouteCollection;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\RedirectResponse;

class SalleAdmin extends Admin
{
	protected $datagridValues = array(
			'_sort_order' => 'ASC',
			'_sort_by' => 'sort'
	);
	
	public function createQuery($context = 'list')
	{	
		$session = $this->getRequest()->getSession();
		$session->start();
		if(!isset($_GET['club']) && !$session->get('club')){
	    	header('Location: /admin/bambukcms/club/club/list', true, 302);
			exit;
	    	die();
		}
		if(isset($_GET['club'])){
			$session->set('club', $_GET['club']);	
		}
	    if(isset($_GET['club_name'])){
			$session->set('club_name', $_GET['club_name']);	
		}

		$em = $this->modelManager->getEntityManager('BambukCms\ClubBundle\Entity\Salle');
	
		$queryBuilder = $em
		->createQueryBuilder('p')
		->select('p')
        ->where('p.club='.$session->get('club'))
		->orderBy('p.sort', 'ASC')
		->from('BambukCmsClubBundle:Salle', 'p');
		$query = new ProxyQuery($queryBuilder);
		return $query;
	}
		
	protected function configureFormFields(FormMapper $formMapper)
	{	
		$subject = $formMapper->getAdmin()->getSubject();
		$formMapper
				->add('name',null,array('label'=>'Назва','required'=>true))
                ->with('Переклади:')
                              ->add('translations', 'translatable_field', array(
                                                    'personal_translation' => 'BambukCms\ClubBundle\Entity\SalleTranslation',
                                                    'fields' => array('name'),
                                                    'required'=>false,
                                                    'required_locale'=> array('ru'),
                                                    'widgets' => array('name' => 'text'),
                                                    'field_options'  => array('name' => array('attr' => array('class' => 'text-field'),'label'=> 'Назва'))
                                ))
         ->end();
         $this->setTemplate('edit', 'BambukCmsClubBundle:SalleAdmin:edit.html.twig');		
	}
	
	protected function configureDatagridFilters(DatagridMapper $datagridMapper)
	{
		$datagridMapper
		->add('name',null,array('label'=>'Назва'))
		;
	}
	
	protected function configureListFields(ListMapper $listMapper)
	{
		$listMapper
		->addIdentifier('id',null,array('label'=>'№'))      
		->add('name','null',array('label'=>'Назва'))
		->add('_action', 'actions', array(
				'actions' => array(
						'edit' => array(),
						'delete' => array(),
				)
		))
		;
       $this->setTemplate('list', 'BambukCmsClubBundle:SalleAdmin:list.html.twig');		
	}
    public function preRemove($object)
    {
    	$i=1;
    	  $emt = $this->modelManager->getEntityManager('BambukCms\ClubBundle\Entity\Salle');
    	  $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->where('p.club='.$object->getClub()->getId())
            ->orderBy('p.sort', 'ASC')
            ->from('BambukCmsClubBundle:Salle', 'p');
           $q = $queryBuilder->getQuery();
           $result = $q->getResult();
        foreach($result as $pos){
           	if($pos->getId() != $object->getId()){
		    		$posUpdate=$this->modelManager->getEntityManager('BambukCms\ClubBundle\Entity\Salle')->getRepository('BambukCmsClubBundle:Salle')->findOneById($pos->getId());
		    		$em = $this->modelManager->getEntityManager('BambukCms\ClubBundle\Entity\Salle');
		    		$posUpdate->setSort($i);
		    		$em->flush();
		    		$i++;
           	}
	    }
	    $em = $this->modelManager->getEntityManager($object);
        $em->flush();
    }
    public function prePersist($object)
    {
       
    	$session = $this->getRequest()->getSession();
		$session->start();
		$clubCrit=$this->modelManager->getEntityManager('BambukCms\ClubBundle\Entity\Club')->getRepository('BambukCmsClubBundle:Club')->findOneById($session->get('club'));        
        $emt = $this->modelManager->getEntityManager('BambukCms\ClubBundle\Entity\Salle');
        $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->where('p.club='.$session->get('club'))
            ->orderBy('p.sort', 'DESC')
            ->from('BambukCmsClubBundle:Salle', 'p');
        $q = $queryBuilder->getQuery();
        $result = $q->getResult();
        $sort=count($result)+1;
        $object->setSort($sort);
		$object->setClub($clubCrit);
        $em = $this->modelManager->getEntityManager($object);
        $em->flush();
    }		
}