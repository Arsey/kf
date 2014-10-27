<?php

namespace BambukCms\ClubBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Translatable\Translatable;
use Gedmo\Translatable\TranslatableListener;

/**
 * @ORM\Entity
 * @ORM\Table(name="salle")
 * @Gedmo\TranslationEntity(class="BambukCms\ClubBundle\Entity\SalleTranslation")
 */
class Salle
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
     * @ORM\Column(length=250)
     */
    private $name;
    
    /**
     * @ORM\Column(name="active", type="boolean", nullable=true)
     */
    protected $active;
        
    /**
     * @ORM\Column(name="sort", type="integer")
     */
    
    private $sort = 0;
    
    /**
     *
     * @ORM\OneToMany(targetEntity="BambukCms\ClubBundle\Entity\Schedule", mappedBy="salle", cascade={"all"})
    */
    
	private $schedules;	
	/**
     * @ORM\ManyToOne(targetEntity="BambukCms\ClubBundle\Entity\Club", inversedBy="club")
     */
    
	private $club;   
   /**
     * @ORM\OneToMany(
     *   targetEntity="BambukCms\ClubBundle\Entity\SalleTranslation",
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

    public function addTranslation(SalleTranslation $t)
    {
        if (!$this->translations->contains($t)) {
            $this->translations[] = $t;
            $t->setObject($this);
        }
    }
    
    public function __toString()
    {
        return $this->getName();
    }

    /**
     * Remove translations
     *
     * @param \BambukCms\ClubBundle\Entity\SalleTranslation $translations
     */
    public function removeTranslation(\BambukCms\ClubBundle\Entity\SalleTranslation $translations)
    {
        $this->translations->removeElement($translations);
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
     * @return Salle
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

    /**
     * Set active
     *
     * @param boolean $active
     * @return Salle
     */
    public function setActive($active)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active
     *
     * @return boolean 
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set sort
     *
     * @param integer $sort
     * @return Salle
     */
    public function setSort($sort)
    {
        $this->sort = $sort;

        return $this;
    }

    /**
     * Get sort
     *
     * @return integer 
     */
    public function getSort()
    {
        return $this->sort;
    }

    /**
     * Set club
     *
     * @param \BambukCms\ClubBundle\Entity\Club $club
     * @return Salle
     */
    public function setClub(\BambukCms\ClubBundle\Entity\Club $club = null)
    {
        $this->club = $club;

        return $this;
    }

    /**
     * Get club
     *
     * @return \BambukCms\ClubBundle\Entity\Club 
     */
    public function getClub()
    {
        return $this->club;
    }

    /**
     * Add schedules
     *
     * @param \BambukCms\ClubBundle\Entity\Schedule $schedules
     * @return Salle
     */
    public function addSchedule(\BambukCms\ClubBundle\Entity\Schedule $schedules)
    {
        $this->schedules[] = $schedules;

        return $this;
    }

    /**
     * Remove schedules
     *
     * @param \BambukCms\ClubBundle\Entity\Schedule $schedules
     */
    public function removeSchedule(\BambukCms\ClubBundle\Entity\Schedule $schedules)
    {
        $this->schedules->removeElement($schedules);
    }

    /**
     * Get schedules
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getSchedules()
    {
        return $this->schedules;
    }
}
