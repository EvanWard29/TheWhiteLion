<?php

class Customer
{
    private $id;
    private $name;
    private $dob;

    public function __construct($id, $name, $dob)
    {
        $this->id = $id;
        $this->name = $name;
        $this->dob = $dob;
    }

    public function getID()
    {
        return $this->id;

    }

    public function getName()
    {
        return $this->name;
    }

    public function getDOB()
    {
        return $this->dob;
    }
}
