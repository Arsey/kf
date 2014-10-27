<?php

namespace BambukCms\ClubBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Translatable\Entity\MappedSuperclass\AbstractPersonalTranslation;

/**
 * @ORM\Entity
 * @ORM\Table(name="command_translations",
 *     uniqueConstraints={@ORM\UniqueConstraint(name="lookup_unique_idx", columns={
 *         "locale", "object_id", "field"
 *     })}
 * )
 */
class CommandTranslation extends AbstractPersonalTranslation
{
	/**
	 * Convenient constructor
	 *
	 * @param string $locale
	 * @param string $field
	 * @param string $value
	 */
	public function __construct($locale, $field, $value)
	{
		$this->setLocale($locale);
		$this->setField($field);
		$this->setContent($value);
	}

	/**
	 * @ORM\ManyToOne(targetEntity="BambukCms\ClubBundle\Entity\Command", inversedBy="translations")
	 * @ORM\JoinColumn(name="object_id", referencedColumnName="id", onDelete="CASCADE")
	 */
	protected $object;
	

     /**
	 * @ORM\Column(name="content", type="text", length=255)
	 */
	
	 protected $content;
         
}