<?php
namespace BambukCms\PageBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {       
        $builder->add('name', 'text', array('label'  => 'Імя'));
        $builder->add('phone', 'text', array('label'  => 'Телефон'));
        $builder->add('email', 'email');
        $builder->add('subject', 'text', array('label'  => 'Тема'));
        $builder->add('body', 'textarea', array('label'  => 'Повідомлення'));
    }
    
	public static function loadValidatorMetadata(ClassMetadata $metadata)
    {
        $metadata->addPropertyConstraint('name', new NotBlank());
        $metadata->addPropertyConstraint('email', new Email());
        $metadata->addPropertyConstraint('subject', new NotBlank());
        $metadata->addPropertyConstraint('subject', new MaxLength(50));
        $metadata->addPropertyConstraint('body', new MinLength(50));
    }
    
    public function getName()
    {
        return 'contact';
    }
}