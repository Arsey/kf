<?php
namespace BambukCms\PostBundle\Admin;
 
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Gedmo\Translatable\Entity\Repository\TranslationRepository;
use Gedmo\Translatable\TranslatableListener;

class PostAdmin extends Admin
{
	// setup the defaut sort column and order
	protected $datagridValues = array(
			'_sort_order' => 'ASC',
			'_sort_by' => 'sort'
	);
		
	protected function configureFormFields(FormMapper $formMapper)
	{	
		$subject = $formMapper->getAdmin()->getSubject();
		$typeShowPublication=array('0'=>'','1'=>'Акції','2'=>'Новини');
		$formMapper
		->add('active',null,array('label'=>'Активна'))
		->add('image', 'text', array('label'=>'Зображення','attr' => array('class' => 'img_elfinder')))
		->add('slug',null,array('label'=>'Слаг'))
		->add('title',null,array('label'=>'Заголовок'))
		->add('description',null,array('label'=>'Короткий Опис'))
		->add('type','choice', array('choices' => $typeShowPublication, 'required'=>true,'label'=>'Тип'))
		->add('club', null, array('label'=>'Клуби','expanded' => "true", "multiple" => "true"))
		->add('content_code',null,array('attr' => array('class' => 'adaptiveEditor'),'cascade_validation' => false,'required'=>false,'label'=> 'Опис'))
		->add('content','hidden',array('attr' => array('class' => 'adaptiveEditorHtml')))                ->with('Переклади:')
                              ->add('translations', 'translatable_field', array(
                                                    'personal_translation' => 'BambukCms\PostBundle\Entity\PostTranslation',
                                                    'fields' => array('title', 'description','content_code','content'),
                                                    'required_locale'=> array('ru','en'),
                                                    'widgets' => array('title' => 'text', 'description' => 'textarea','content_code' => 'textarea','content'=>'hidden'),
                                                    'field_options'  => array(
                                                    		'title' => array('attr' => array('class' => 'text-field'),'label'=> 'Заголовок'),
                                                    		'description' => array('cascade_validation' => false,'required'=>false,'label'=> 'Короткий Опис'),
 															'content_code' => array('attr' => array('class' => 'adaptiveEditor'),'cascade_validation' => false,'required'=>false,'label'=> 'Опис'),
                            								'content' => array('attr'=>array("hidden" => true,'class' => 'adaptiveEditorHtml'),'label'=> ' ')
                                                    )
                                ))
         ->end();
         $this->setTemplate('edit', 'BambukCmsPostBundle:PostAdmin:edit.html.twig');
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
    	  $emt = $this->modelManager->getEntityManager('BambukCms\PostBundle\Entity\Post');
          $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->orderBy('p.sort', 'ASC')
            ->from('BambukCmsPostBundle:Post', 'p');
           $q = $queryBuilder->getQuery();
           $result = $q->getResult();
        foreach($result as $post){
           	if($post->getId() != $object->getId()){
		    		$postUpdate=$this->modelManager->getEntityManager('BambukCms\PostBundle\Entity\Post')->getRepository('BambukCmsPostBundle:Post')->findOneById($post->getId());
		    		$em = $this->modelManager->getEntityManager('BambukCms\PostBundle\Entity\Post');
		    		$postUpdate->setSort($i);
		    		$em->flush();
		    		$i++;
           	}
	    }
	    $em = $this->modelManager->getEntityManager($object);
        $em->flush();
    }
    
  public function prePersist($object)
    {
           $emt = $this->modelManager->getEntityManager('BambukCms\PostBundle\Entity\Post');
           $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->orderBy('p.sort', 'DESC')
            ->from('BambukCmsPostBundle:Post', 'p');
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
		->add('image', null, array('template' => 'BambukCmsPostBundle:PostAdmin:image.html.twig','label'=>'Зображення'))
		->add('_action', 'actions', array(
				'actions' => array(
						'edit' => array(),
						'delete' => array(),
				)
		))
		;
		$this->setTemplate('list', 'BambukCmsPostBundle:PostAdmin:list.html.twig');
	}

		
}