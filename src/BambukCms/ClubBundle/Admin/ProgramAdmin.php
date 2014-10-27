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

class ProgramAdmin extends Admin
{
		
	protected function configureFormFields(FormMapper $formMapper)
	{	
		$subject = $formMapper->getAdmin()->getSubject();
		$formMapper
				->add('name',null,array('label'=>'Назва','required'=>true))
		        ->add('image', 'text', array('label'=>'Зображення','attr' => array('class' => 'img_elfinder')))
				->add('active',null,array('label'=>'Активна'))				
				->add('description',null,array('label'=>'Короткий  опис','required'=>true))
				->add('content_code',null,array('attr' => array('class' => 'adaptiveEditor'),'cascade_validation' => false,'required'=>false,'label'=> 'Опис'))
				->add('content','hidden',array('attr' => array('class' => 'adaptiveEditorHtml')))
                ->with('Переклади:')
                              ->add('translations', 'translatable_field', array(
                                                    'personal_translation' => 'BambukCms\ClubBundle\Entity\ProgramTranslation',
                              						'fields' => array('name','description','content_code','content'),
                               						'widgets' => array('name' => 'text','description' => 'textarea', 'content_code' => 'textarea','content'=>'hidden'),
                                                    'required'=>false,
                                                    'required_locale'=> array('ru'),
                                                    'field_options'  => array(
                                                    	'name' => array('attr' => array('class' => 'text-field'),'label'=> 'Назва'),
                                                        'description' => array('label'=> 'Короткий опис'),
                                						'content_code' => array('attr' => array('class' => 'adaptiveEditor'),'cascade_validation' => false,'required'=>false,'label'=> 'Опис'),
                            							'content' => array('attr'=>array("hidden" => true,'class' => 'adaptiveEditorHtml'),'label'=> ' ')
                              		)
                                ))
         ->end();
         $this->setTemplate('edit', 'BambukCmsClubBundle:ProgramAdmin:edit.html.twig');
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
		->add('name',null,array('label'=>'Назва'))
		->add('image', null, array('template' => 'BambukCmsClubBundle:ProgramAdmin:image.html.twig','label'=>'Зображення'))
		->add('_action', 'actions', array(
				'actions' => array(
						'edit' => array(),
						'delete' => array(),
				)
		))
		;
		$this->setTemplate('list', 'BambukCmsClubBundle:ProgramAdmin:list.html.twig');
	}
	 public function preRemove($object)
    {
    	$i=1;
    	  $emt = $this->modelManager->getEntityManager('BambukCms\ClubBundle\Entity\Program');
    	  $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->orderBy('p.sort', 'ASC')
            ->from('BambukCmsClubBundle:Program', 'p');
           $q = $queryBuilder->getQuery();
           $result = $q->getResult();
        foreach($result as $pos){
           	if($pos->getId() != $object->getId()){
		    		$posUpdate=$this->modelManager->getEntityManager('BambukCms\ClubBundle\Entity\Program')->getRepository('BambukCmsClubBundle:Program')->findOneById($pos->getId());
		    		$em = $this->modelManager->getEntityManager('BambukCms\ClubBundle\Entity\Program');
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
        $emt = $this->modelManager->getEntityManager('BambukCms\ClubBundle\Entity\Program');
        $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->orderBy('p.sort', 'DESC')
            ->from('BambukCmsClubBundle:Program', 'p');
        $q = $queryBuilder->getQuery();
        $result = $q->getResult();
        $sort=count($result)+1;
        $object->setSort($sort);
        $em = $this->modelManager->getEntityManager($object);
        $em->flush();
    }				
}