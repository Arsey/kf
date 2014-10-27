<?php

namespace BambukCms\ClubBundle\Entity;


use Doctrine\Common\Collections\ArrayCollection;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Translatable\Translatable;
use Gedmo\Translatable\TranslatableListener;

/**
 * @ORM\Entity
 * @ORM\Table(name="program")
 * @Gedmo\TranslationEntity(class="BambukCms\ClubBundle\Entity\ProgramTranslation")
 */

class Program
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
     * @Gedmo\Translatable
     * @ORM\Column(type="text", nullable=true)
     */    
    private $description;
    
    /**
     * @var string
     *
     * @ORM\Column(name="image", type="string", length=255, nullable=true)
     */
    private $image;
    
    /**
     * @ORM\Column(name="active", type="boolean", nullable=true)
     */
    protected $active;
    
    /**
     * @Gedmo\Translatable
     * @ORM\Column(type="text", nullable=true)
     */  
    private $content;

    /**
     * @Gedmo\Translatable
     * @ORM\Column(name="content_code", type="text", nullable=true)
     */
    private $content_code;
        
  
    /**
     * @ORM\Column(name="sort", type="integer")
     */
    private $sort = 0;
    
    /**
     * @ORM\OneToMany(
     *   targetEntity="BambukCms\ClubBundle\Entity\ProgramTranslation",
     *   mappedBy="object",
     *   cascade={"persist", "remove"}
     * )
     */
    private $translations;
    
    /**
     * Initialization properties for new post entity
     */
    public function __construct()
    {
    	$this->translations = new \Doctrine\Common\Collections\ArrayCollection();
    }
    

    public function getTranslations()
    {
        return $this->translations;
    }

    public function addTranslation(ProgramTranslation $t)
    {
        if (!$this->translations->contains($t)) {
            $this->translations[] = $t;
            $t->setObject($this);
        }
    }


    /**
     * Remove translations
     *
     * @param \BambukCms\ClubBundle\Entity\ProgramTranslation $translations
     */
    public function removeTranslation(\BambukCms\ClubBundle\Entity\ProgramTranslation $translations)
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
     * @return Program
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
     * Set description
     *
     * @param string $description
     * @return Program
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set image
     *
     * @param string $image
     * @return Program
     */
    public function setImage($image)
    {
        $this->image = $image;

        return $this;
    }

    /**
     * Get image
     *
     * @return string 
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * Set active
     *
     * @param boolean $active
     * @return Program
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
     * Set content
     *
     * @param string $content
     * @return Program
     */
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Get content
     *
     * @return string 
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Set sort
     *
     * @param integer $sort
     * @return Program
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
     * Set content_code
     *
     * @param string $contentCode
     * @return Program
     */
    public function setContentCode($contentCode)
    {
        $this->content_code = $contentCode;

        return $this;
    }

    /**
     * Get content_code
     *
     * @return string 
     */
    public function getContentCode()
    {
        return $this->content_code;
    }
}
