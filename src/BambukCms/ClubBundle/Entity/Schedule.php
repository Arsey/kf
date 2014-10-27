<?php

namespace BambukCms\ClubBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Schedule
 *
 * @ORM\Entity
 * @ORM\Table(name="schedule")
 */
class Schedule
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
     *
     * @ORM\Column( type="string", length=255, nullable=true)
     */
    private $hour;
    
	/**
     * @ORM\ManyToOne(targetEntity="BambukCms\ClubBundle\Entity\Salle", inversedBy="salle")
     */
	private $salle;
	
     /**
     * @ORM\ManyToOne(targetEntity="BambukCms\ClubBundle\Entity\Program", inversedBy="program")
     */
	private $monday;
	
	/**
     * @ORM\ManyToOne(targetEntity="BambukCms\ClubBundle\Entity\Program", inversedBy="program")
     */
	private $tuesday;
	
	 /**
     * @ORM\ManyToOne(targetEntity="BambukCms\ClubBundle\Entity\Program", inversedBy="program")
     */
	private $wednesday;
	
	 /**
     * @ORM\ManyToOne(targetEntity="BambukCms\ClubBundle\Entity\Program", inversedBy="program")
     */
	private $thursday ;
	
	/**
     * @ORM\ManyToOne(targetEntity="BambukCms\ClubBundle\Entity\Program", inversedBy="program")
     */
	private $friday ;
	
	/**
     * @ORM\ManyToOne(targetEntity="BambukCms\ClubBundle\Entity\Program", inversedBy="program")
     */
	private $saturday ;
	/**
     * @ORM\ManyToOne(targetEntity="BambukCms\ClubBundle\Entity\Program", inversedBy="program")
     */
	private $sunday;	


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
     * Set hour
     *
     * @param string $hour
     * @return Schedule
     */
    public function setHour($hour)
    {
        $this->hour = $hour;

        return $this;
    }

    /**
     * Get hour
     *
     * @return string 
     */
    public function getHour()
    {
        return $this->hour;
    }

    /**
     * Set salle
     *
     * @param \BambukCms\ClubBundle\Entity\Salle $salle
     * @return Schedule
     */
    public function setSalle(\BambukCms\ClubBundle\Entity\Salle $salle = null)
    {
        $this->salle = $salle;

        return $this;
    }
    
    
    public function setSalleId($salle)
    {
        $this->salle = $salle;

        return $this;
    }
    

    /**
     * Get salle
     *
     * @return \BambukCms\ClubBundle\Entity\Salle 
     */
    public function getSalle()
    {
        return $this->salle;
    }

    /**
     * Set monday
     *
     * @param \BambukCms\ClubBundle\Entity\Program $monday
     * @return Schedule
     */
    public function setMonday(\BambukCms\ClubBundle\Entity\Program $monday = null)
    {
        $this->monday = $monday;

        return $this;
    }

    /**
     * Get monday
     *
     * @return \BambukCms\ClubBundle\Entity\Program 
     */
    public function getMonday()
    {
        return $this->monday;
    }

    /**
     * Set tuesday
     *
     * @param \BambukCms\ClubBundle\Entity\Program $tuesday
     * @return Schedule
     */
    public function setTuesday(\BambukCms\ClubBundle\Entity\Program $tuesday = null)
    {
        $this->tuesday = $tuesday;

        return $this;
    }

    /**
     * Get tuesday
     *
     * @return \BambukCms\ClubBundle\Entity\Program 
     */
    public function getTuesday()
    {
        return $this->tuesday;
    }

    /**
     * Set wednesday
     *
     * @param \BambukCms\ClubBundle\Entity\Program $wednesday
     * @return Schedule
     */
    public function setWednesday(\BambukCms\ClubBundle\Entity\Program $wednesday = null)
    {
        $this->wednesday = $wednesday;

        return $this;
    }

    /**
     * Get wednesday
     *
     * @return \BambukCms\ClubBundle\Entity\Program 
     */
    public function getWednesday()
    {
        return $this->wednesday;
    }

    /**
     * Set thursday
     *
     * @param \BambukCms\ClubBundle\Entity\Program $thursday
     * @return Schedule
     */
    public function setThursday(\BambukCms\ClubBundle\Entity\Program $thursday = null)
    {
        $this->thursday = $thursday;

        return $this;
    }

    /**
     * Get thursday
     *
     * @return \BambukCms\ClubBundle\Entity\Program 
     */
    public function getThursday()
    {
        return $this->thursday;
    }

    /**
     * Set friday
     *
     * @param \BambukCms\ClubBundle\Entity\Program $friday
     * @return Schedule
     */
    public function setFriday(\BambukCms\ClubBundle\Entity\Program $friday = null)
    {
        $this->friday = $friday;

        return $this;
    }

    /**
     * Get friday
     *
     * @return \BambukCms\ClubBundle\Entity\Program 
     */
    public function getFriday()
    {
        return $this->friday;
    }

    /**
     * Set saturday
     *
     * @param \BambukCms\ClubBundle\Entity\Program $saturday
     * @return Schedule
     */
    public function setSaturday(\BambukCms\ClubBundle\Entity\Program $saturday = null)
    {
        $this->saturday = $saturday;

        return $this;
    }

    /**
     * Get saturday
     *
     * @return \BambukCms\ClubBundle\Entity\Program 
     */
    public function getSaturday()
    {
        return $this->saturday;
    }

    /**
     * Set sunday
     *
     * @param \BambukCms\ClubBundle\Entity\Program $sunday
     * @return Schedule
     */
    public function setSunday(\BambukCms\ClubBundle\Entity\Program $sunday = null)
    {
        $this->sunday = $sunday;

        return $this;
    }

    /**
     * Get sunday
     *
     * @return \BambukCms\ClubBundle\Entity\Program 
     */
    public function getSunday()
    {
        return $this->sunday;
    }
}
