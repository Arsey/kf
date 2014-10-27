<?php
namespace BambukCms\BannerBundle\Admin;
 
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Gedmo\Translatable\Entity\Repository\TranslationRepository;
use Gedmo\Translatable\TranslatableListener;

class BannerAdmin extends Admin
{
	// setup the defaut sort column and order
	protected $datagridValues = array(
			'_sort_order' => 'ASC',
			'_sort_by' => 'sort'
	);
		
	protected function configureFormFields(FormMapper $formMapper)
	{	
		$subject = $formMapper->getAdmin()->getSubject();
		$formMapper
		->add('image', 'text', array('label'=>'Зображення','attr' => array('class' => 'img_elfinder')))
		->add('image_min', 'text', array('label'=>'Зображення(мале)','attr' => array('class' => 'img_elfinder')))
		->add('active',null,array('label'=>'Активна'))
		->add('title',null,array('label'=>'Заголовок'))
		->add('link',null,array('label'=>'Лінк'))
		->add('sections', null, array('label'=>'Розділи','expanded' => "true", "multiple" => "true"))
                ->with('Переклади:')
                              ->add('translations', 'translatable_field', array(
                                                    'personal_translation' => 'BambukCms\BannerBundle\Entity\BannerTranslation',
                                                    'fields' => array('title', 'image','image_min','link'),
                                                    'required_locale'=> array('ru'),
                                                    'widgets' => array('title' => 'text', 'image' => 'text','image_min' => 'text','link' => 'text'),
                                                    'field_options'  => array(
                                                    		'title' => array('attr' => array('class' => 'text-field'),'label'=> 'Заголовок'),
                                                    		'image' =>array('attr' => array('class' => 'img_elfinder'),'required'=>false,'label'=> 'Зображення'),
                              								'image_min' =>array('attr' => array('class' => 'img_elfinder'),'required'=>false,'label'=> 'Зображення(мале)'),
                              								'link' => array('attr' => array('class' => 'text-field'),'label'=> 'Лінк')
                                                    )
                                ))
         ->end();
         $this->setTemplate('edit', 'BambukCmsBannerBundle:BannerAdmin:edit.html.twig');
	}
	
	protected function configureDatagridFilters(DatagridMapper $datagridMapper)
	{
		$datagridMapper
		->add('title',null,array('label'=>'Заголовок'))
		;
	}


  public function preRemove($object)
    {
    	$i=1;
    	  $emt = $this->modelManager->getEntityManager('BambukCms\BannerBundle\Entity\Banner');
          $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->orderBy('p.sort', 'ASC')
            ->from('BambukCmsBannerBundle:Banner', 'p');
           $q = $queryBuilder->getQuery();
           $result = $q->getResult();
        foreach($result as $banner){
           	if($banner->getId() != $object->getId()){
		    		$bannerUpdate=$this->modelManager->getEntityManager('BambukCms\BannerBundle\Entity\Banner')->getRepository('BambukCmsBannerBundle:Banner')->findOneById($banner->getId());
		    		$em = $this->modelManager->getEntityManager('BambukCms\BannerBundle\Entity\Banner');
		    		$bannerUpdate->setSort($i);
		    		$em->flush();
		    		$i++;
           	}
	    }
	    $em = $this->modelManager->getEntityManager($object);
        $em->flush();
    }
    
  public function prePersist($object)
    {
           $emt = $this->modelManager->getEntityManager('BambukCms\BannerBundle\Entity\Banner');
           $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->orderBy('p.sort', 'DESC')
            ->from('BambukCmsBannerBundle:Banner', 'p');
           $q = $queryBuilder->getQuery();
           $result = $q->getResult();
           $sort=count($result)+1;
           
        $object->setSort($sort);
        $em = $this->modelManager->getEntityManager($object);
        $em->flush();
    }
    
	protected function configureListFields(ListMapper $listMapper)
	{
		$listMapper
		->addIdentifier('id',null,array('label'=>'№'))
		->add('title',null,array('label'=>'Заголовок'))		      
		->add('image', null, array('template' => 'BambukCmsBannerBundle:BannerAdmin:image.html.twig','label'=>'Зображення'))
		->add('_action', 'actions', array(
				'actions' => array(
						'edit' => array(),
						'delete' => array(),
				)
		))
		;
		$this->setTemplate('list', 'BambukCmsBannerBundle:BannerAdmin:list.html.twig');
	}

		
}