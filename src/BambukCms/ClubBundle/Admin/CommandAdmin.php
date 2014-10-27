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

class CommandAdmin extends Admin
{
protected function configureFormFields(FormMapper $formMapper)
	{	
		$subject = $formMapper->getAdmin()->getSubject();
		$groupTitle=array('1'=>'Тренери','2'=>'Адміністратори','3'=>'Релакс зона');
		$formMapper
		->add('active',null,array('label'=>'Активна'))
		->add('image', 'text', array('label'=>'Зображення','attr' => array('class' => 'img_elfinder')))
		->add('name',null,array('label'=>'Назва'))
		->add('type','choice', array('choices' => $groupTitle, 'required'=>true,'label'=>'Група'))
		->add('content_code',null,array('attr' => array('class' => 'adaptiveEditor'),'cascade_validation' => false,'required'=>false,'label'=> 'Опис'))
		->add('content','hidden',array('attr' => array('class' => 'adaptiveEditorHtml')))                
		->with('Переклади:')
                              ->add('translations', 'translatable_field', array(
                                                    'personal_translation' => 'BambukCms\ClubBundle\Entity\CommandTranslation',
                                                    'fields' => array('name','content_code','content'),
                                                    'required_locale'=> array('ru'),
                                                    'widgets' => array('name' => 'text', 'content_code' => 'textarea','content'=>'hidden'),
                                                    'field_options'  => array(
                                                    		'name' => array('attr' => array('class' => 'text-field'),'label'=> 'Назва'),
                                							'content_code' => array('attr' => array('class' => 'adaptiveEditor'),'cascade_validation' => false,'required'=>false,'label'=> 'Опис'),
                            								'content' => array('attr'=>array("hidden" => true,'class' => 'adaptiveEditorHtml'),'label'=> ' ')
                                                    )
                                ))
         ->end();
         $this->setTemplate('edit', 'BambukCmsClubBundle:CommandAdmin:edit.html.twig');
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
		->add('image', null, array('template' => 'BambukCmsClubBundle:CommandAdmin:image.html.twig','label'=>'Зображення'))
		->add('_action', 'actions', array(
				'actions' => array(
						'edit' => array(),
						'delete' => array(),
				)
		))
		;
	}
	

		
}