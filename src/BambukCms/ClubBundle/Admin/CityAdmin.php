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

class CityAdmin extends Admin
{
	
	protected function configureFormFields(FormMapper $formMapper)
	{	
		$subject = $formMapper->getAdmin()->getSubject();
		$formMapper
				->add('name',null,array('label'=>'Назва','required'=>true))
                ->with('Переклади:')
                              ->add('translations', 'translatable_field', array(
                                                    'personal_translation' => 'BambukCms\ClubBundle\Entity\CityTranslation',
                                                    'fields' => array('name'),
                                                    'required'=>false,
                                                    'required_locale'=> array('ru'),
                                                    'widgets' => array('name' => 'text'),
                                                    'field_options'  => array('name' => array('attr' => array('class' => 'text-field'),'label'=> 'Назва'))
                                ))
         ->end();
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
	}

		
}