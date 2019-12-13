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

    public function id()
    {
        return $this->id;

    }

    public function name()
    {
        return $this->name;
    }

    public function dob()
    {
        return $this->dob;
    }
}
