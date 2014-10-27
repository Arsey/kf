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

class ClubAdmin extends Admin
{
	protected $datagridValues = array(
			'_sort_order' => 'ASC',
			'_sort_by' => 'sort'
	);
		
	protected function configureFormFields(FormMapper $formMapper)
	{	
		$subject = $formMapper->getAdmin()->getSubject();
		$formMapper
				->add('name',null,array('label'=>'Назва','required'=>true))
				->add('phone',null,array('label'=>'Телефон','required'=>true))
				->add('city',null,array('label'=>'Місто','required'=>true))
				->add('active',null,array('label'=>'Активна'))
				->add('content_code',null,array('attr' => array('class' => 'adaptiveEditor'),'cascade_validation' => false,'required'=>false,'label'=> 'Опис'))
				->add('content','hidden',array('attr' => array('class' => 'adaptiveEditorHtml')))
                ->with('Переклади:')
                              ->add('translations', 'translatable_field', array(
                                                    'personal_translation' => 'BambukCms\ClubBundle\Entity\ClubTranslation',
                              						'fields' => array('name','content_code', 'content'),
                               						'widgets' => array('name' => 'text','content_code' => 'textarea','content'=>'hidden'),
                                                    'required'=>false,
                                                    'required_locale'=> array('ru'),
                                                    'field_options'  => array(
                                                    	'name' => array('attr' => array('class' => 'text-field'),'label'=> 'Назва'),
						                                'content_code' => array('attr' => array('class' => 'adaptiveEditor'),'cascade_validation' => false,'required'=>false,'label'=> 'Опис'),
						                            	'content' => array('attr'=>array("hidden" => true,'class' => 'adaptiveEditorHtml'),'label'=> ' '))
                                ))
         ->end();
         $this->setTemplate('edit', 'BambukCmsClubBundle:ClubAdmin:edit.html.twig');
	}
	
	protected function configureDatagridFilters(DatagridMapper $datagridMapper)
	{
		$datagridMapper
			->add('name',null,array('label'=>'Назва'))
			->add('city',null,array('label'=>'Місто'))
		;
	}
	
	protected function configureListFields(ListMapper $listMapper)
	{
		$listMapper
		->addIdentifier('id',null,array('label'=>'№'))      
		->add('name',null,array('label'=>'Назва'))
		->add('city',null,array('label'=>'Місто'))
		->add('salle',null, array('template' => 'BambukCmsClubBundle:ClubAdmin:salle.html.twig','label'=>'Зали'))		
		->add('_action', 'actions', array(
				'actions' => array(
						'edit' => array(),
						'delete' => array(),
				)
		))
		;
	}		
}