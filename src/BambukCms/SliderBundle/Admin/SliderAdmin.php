<?php
namespace BambukCms\SliderBundle\Admin;
 
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Gedmo\Translatable\Entity\Repository\TranslationRepository;
use Gedmo\Translatable\TranslatableListener;

class SliderAdmin extends Admin
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
		->add('description',null,array('attr' => array('class' => 'tinymce','data-theme' => 'advanced'),'label'=>'Короткий Опис'))
                ->with('Переклади:')
                              ->add('translations', 'translatable_field', array(
                                                    'personal_translation' => 'BambukCms\SliderBundle\Entity\SliderTranslation',
                                                    'fields' => array('title', 'description'),
                                                    'required_locale'=> array('ru'),
                                                    'widgets' => array('title' => 'text', 'description' => 'textarea'),
                                                    'field_options'  => array(
                                                    		'title' => array('attr' => array('class' => 'text-field'),'label'=> 'Заголовок'),
                                                    		'description' => array('attr' => array('class' => 'tinymce','data-theme' => 'advanced'),'cascade_validation' => false,'required'=>false,'label'=> 'Текст на слайдері')
                                                    )
                                ))
         ->end();
         $this->setTemplate('edit', 'BambukCmsSliderBundle:SliderAdmin:edit.html.twig');
	}
	
	protected function configureDatagridFilters(DatagridMapper $datagridMapper)
	{
		$datagridMapper
		->add('title',null,array('label'=>'Заголовок'))
		->add('description',null,array('label'=>'Опис'))
		;
	}


  public function preRemove($object)
    {
    	$i=1;
    	  $emt = $this->modelManager->getEntityManager('BambukCms\SliderBundle\Entity\Slider');
          $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->orderBy('p.sort', 'ASC')
            ->from('BambukCmsSliderBundle:Slider', 'p');
           $q = $queryBuilder->getQuery();
           $result = $q->getResult();
        foreach($result as $slider){
           	if($slider->getId() != $object->getId()){
		    		$sliderUpdate=$this->modelManager->getEntityManager('BambukCms\SliderBundle\Entity\Slider')->getRepository('BambukCmsSliderBundle:Slider')->findOneById($slider->getId());
		    		$em = $this->modelManager->getEntityManager('BambukCms\SliderBundle\Entity\Slider');
		    		$sliderUpdate->setSort($i);
		    		$em->flush();
		    		$i++;
           	}
	    }
	    $em = $this->modelManager->getEntityManager($object);
        $em->flush();
    }
    
  public function prePersist($object)
    {
           $emt = $this->modelManager->getEntityManager('BambukCms\SliderBundle\Entity\Slider');
           $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->orderBy('p.sort', 'DESC')
            ->from('BambukCmsSliderBundle:Slider', 'p');
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
		->add('image', null, array('template' => 'BambukCmsSliderBundle:SliderAdmin:image.html.twig','label'=>'Зображення'))
		->add('_action', 'actions', array(
				'actions' => array(
						'edit' => array(),
						'delete' => array(),
				)
		))
		;
		$this->setTemplate('list', 'BambukCmsSliderBundle:SliderAdmin:list.html.twig');
	}

		
}