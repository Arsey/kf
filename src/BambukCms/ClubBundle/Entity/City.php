<?php

namespace BambukCms\ClubBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Translatable\Translatable;
use Gedmo\Translatable\TranslatableListener;

/**
 * @ORM\Entity
 * @ORM\Table(name="city")
 * @Gedmo\TranslationEntity(class="BambukCms\ClubBundle\Entity\CityTranslation")
 */
class City
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @Gedmo\Translatable
     * @ORM\Column(type="string", length=255)
     */
    private $name;
    
   /**
     *
     * @ORM\OneToMany(targetEntity="BambukCms\ClubBundle\Entity\Club", mappedBy="city", cascade={"all"})
     * @ORM\OrderBy({"sort" = "ASC"})
    */
    
	private $clubs;
	/**
     * @ORM\OneToMany(
     *   targetEntity="BambukCms\ClubBundle\Entity\CityTranslation",
     *   mappedBy="object",
     *   cascade={"persist", "remove"}
     * )
     */
    private $translations;

    public function __construct()
    {
        $this->translations = new ArrayCollection();
    }

    public function getTranslations()
    {
        return $this->translations;
    }

    public function addTranslation(CityTranslation $t)
    {
        if (!$this->translations->contains($t)) {
            $this->translations[] = $t;
            $t->setObject($this);
        }
    }
    
    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set name
     *
     * @param string $name
     * @return City
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }
    
    
    public function __toString()
    {
        return $this->getName();
    }

    /**
     * Remove translations
     *
     * @param \BambukCms\ClubBundle\Entity\CityTranslation $translations
     */
    public function removeTranslation(\BambukCms\ClubBundle\Entity\CityTranslation $translations)
    {
        $this->translations->removeElement($translations);
    }

    /**
     * Add clubs
     *
     * @param \BambukCms\ClubBundle\Entity\Club $clubs
     * @return City
     */
    public function addClub(\BambukCms\ClubBundle\Entity\Club $clubs)
    {
        $this->clubs[] = $clubs;

        return $this;
    }

    /**
     * Remove clubs
     *
     * @param \BambukCms\ClubBundle\Entity\Club $clubs
     */
    public function removeClub(\BambukCms\ClubBundle\Entity\Club $clubs)
    {
        $this->clubs->removeElement($clubs);
    }

    /**
     * Get clubs
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getClubs()
    {
        return $this->clubs;
    }
}
