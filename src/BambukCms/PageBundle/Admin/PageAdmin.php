<?php
namespace BambukCms\PageBundle\Admin;
 
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use BambukCms\PageBundle\Form\PageType;
use Gedmo\Translatable\Entity\Repository\TranslationRepository;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;

class PageAdmin extends Admin
{
	
	protected $maxPerPage = 2500;
	protected $maxPageLinks = 2500;
	
	// setup the defaut sort column and order
	protected $datagridValues = array(
			'_sort_order' => 'DESC',
			'_sort_by' => 'position'
	);
	
	public function createQuery($context = 'list')
	{
		$em = $this->modelManager->getEntityManager('BambukCms\PageBundle\Entity\Page');
	
		$queryBuilder = $em
		->createQueryBuilder('p')
		->select('p')
        ->where('p.parent IS NULL')
		->orderBy('p.position', 'ASC')
		->from('BambukCmsPageBundle:Page', 'p');
		$query = new ProxyQuery($queryBuilder);
		
		return $query;
	}
	
		
	protected function configureFormFields(FormMapper $formMapper)
	{	
		$subject = $this->getSubject();
		$id = $subject->getId();
		$tree_page_array = $this->getTreePageArray();

		$formMapper
		->add('slug',null,array('label'=>'Назва в URL'))
		->add('parent_id','choice', array('choices' => $tree_page_array, 'required'=>false,'label'=>'Батьківська сторінка'))
		->add('active',null,array('label'=>'Активна'))
		->add('show_menu',null,array('label'=>'Показувати в меню'))
		->add('title',null,array('label'=>'Заголовок'))
	    ->add('icon',null,array('label'=>'Іконка','attr' => array('class' => 'img_elfinder')))
		->add('icon_color',null,array('label'=>'Кольорова іконка','attr' => array('class' => 'img_elfinder')))
		->add('url',null,array('label'=>'Лінк'))
		->add('meta_keywords',null,array('label'=>'Мета теги'))
		->add('meta_description',null,array('label'=>'Ключові слова'))
		->add('content_code',null,array('attr' => array('class' => 'adaptiveEditor'),'cascade_validation' => false,'required'=>false,'label'=> 'Опис'))
		->add('content','hidden',array('attr' => array('class' => 'adaptiveEditorHtml')))
                ->with('Переклади')
                            ->add('translations', 'translatable_field', array(
                                'personal_translation' => 'BambukCms\PageBundle\Entity\PageTranslation',
                                'fields' => array('title','url','meta_keywords','meta_description','content_code', 'content'),
                                'widgets' => array('title' => 'text','url' => 'text','meta_keywords' => 'textarea', 'meta_description' => 'textarea','content_code' => 'textarea','content'=>'hidden'),
                                'field_options'  => array(
                                'title' => array('attr' => array('class' => 'text-field'),'label'=> 'Заголовок'),
                                'url' => array('cascade_validation' => false,'required'=>false, 'label'=> 'Лінк'),
                                'meta_keywords' => array('cascade_validation' => false,'required'=>false,'label'=> 'Мета теги'),
                                'meta_description' => array('cascade_validation' => false,'required'=>false,'label'=> 'Ключові слова'),
                                'content_code' => array('attr' => array('class' => 'adaptiveEditor'),'cascade_validation' => false,'required'=>false,'label'=> 'Опис'),
                            	'content' => array('attr'=>array("hidden" => true,'class' => 'adaptiveEditorHtml'),'label'=> ' ')
                           		 )
                            ))
             ->end();
        $this->setTemplate('edit', 'BambukCmsPageBundle:PageAdmin:edit.html.twig');
	}
	
	protected function configureDatagridFilters(DatagridMapper $datagridMapper)
	{
		$datagridMapper
		->add('title',null,array('label'=>'Назва'))
		->add('active',null,array('label'=>'Активна'))
		;
	}
	
	protected function configureListFields(ListMapper $listMapper)
	{
	
		$listMapper
		->add('id', null, array('sortable'=>false))
		->addIdentifier('title', null, array('sortable'=>false, 'label'=>'Назва сторінки'))
		->add('slug',null,array('sortable'=>false,'label'=>'Назва в URL'))
		->add('active',null,array('sortable'=>false,'label'=>'Активна'))
		->add('created','datetime',array('sortable'=>false,'label'=>'Дата створення','format' => "d-m-Y H:m"))
		->add('_action', 'actions', array(
				'actions' => array(
						'edit' => array(),
						'delete' => array(),
				)
		))
		;
		$this->setTemplate('list', 'BambukCmsPageBundle:PageAdmin:list.html.twig');
	}


  public function preRemove($object)
    {
    	$i=1;
    	if($object->getParent()){
	    	foreach($object->getParent()->getChildren() as $page){
	    		if($object->getId() != $page->getId()){
		    		$pageUpdate=$this->modelManager->getEntityManager('BambukCms\PageBundle\Entity\Page')->getRepository('BambukCmsPageBundle:Page')->findOneById($page->getId());
		    		$em = $this->modelManager->getEntityManager('BambukCms\PageBundle\Entity\Page');
		    		$pageUpdate->setPosition($i);
		    		$em->flush();
		    		$i++;
	    		}
	    	}
    	};
        $em = $this->modelManager->getEntityManager($object);
        $em->flush();
    }
    
  public function prePersist($object)
    {
       if($object->getParent()){
           $parent=$this->modelManager->getEntityManager('BambukCms\PageBundle\Entity\Page')->getRepository('BambukCmsPageBundle:Page')->findOneById($object->getParent());
           $object->setParent($parent);
           $position=count($parent->getChildren())+1;
         }else{
           $emt = $this->modelManager->getEntityManager('BambukCms\PageBundle\Entity\Page');
           $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->where('p.parent IS NULL')
            ->orderBy('p.position', 'DESC')
            ->from('BambukCmsPageBundle:Page', 'p');
           $q = $queryBuilder->getQuery();
           $result = $q->getResult();
           $position=count($result)+1;
           
        }
        $object->setPosition($position);
        $em = $this->modelManager->getEntityManager($object);
        $em->flush();
    }
    
    
	public function preUpdate($object)
	{
     $em = $this->getModelManager()->getEntityManager($this->getClass());
     $original = $em->getUnitOfWork()->getOriginalEntityData($object);
     if(gettype($original['parent']) == 'object'){$parentOldId=$original['parent']->getId();}else{$parentOldId=$original['parent'];}
      if($parentOldId != $object->getParent()){
        if($object->getParent()){
          $parent=$this->modelManager->getEntityManager('BambukCms\PageBundle\Entity\Page')->getRepository('BambukCmsPageBundle:Page')->findOneById($object->getParent());
          $position=count($parent->getChildren())+1;
        }else{
          $parent=NULL;
          $emt = $this->modelManager->getEntityManager('BambukCms\PageBundle\Entity\Page');
          $queryBuilder = $emt
            ->createQueryBuilder('p')
            ->select('p')
            ->where('p.parent IS NULL')
            ->orderBy('p.position', 'DESC')
            ->from('BambukCmsPageBundle:Page', 'p');
           $q = $queryBuilder->getQuery();
           $result = $q->getResult();
           $position=count($result)+1;
        }
        $object->setPosition($position);
        $object->setParent($parent);
       }else{
        $parent=$this->modelManager->getEntityManager('BambukCms\PageBundle\Entity\Page')->getRepository('BambukCmsPageBundle:Page')->findOneById($object->getParent());
        $object->setParent($parent);
       }
		$em = $this->modelManager->getEntityManager($object);
		$em->flush();
	}
   
    public function getTreePageArray(){
      $em = $this->modelManager->getEntityManager('BambukCms\PageBundle\Entity\Page');
      $queryBuilder = $em
		->createQueryBuilder('p')
		->select('p')
        ->where('p.parent IS NULL')
		->orderBy('p.position', 'ASC')
		->from('BambukCmsPageBundle:Page', 'p');
        $q = $queryBuilder->getQuery();
        $result = $q->getResult();
        $arrayTreePage=array();
       foreach($result as $page){
         $arrayTreePage[$page->getId()]=$page->getTitle();
         foreach($page->getChildren()as $childPage){
           $arrayTreePage[$childPage->getId()]=' - '.$childPage->getTitle();
         }
       }
      return $arrayTreePage;
    }
}