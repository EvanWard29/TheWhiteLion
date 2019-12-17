<?php

class Product
{
    private $id;
    private $name;
    private $description;
    private $type;
    private $price;

    public function __construct($id,$name,$description,$type,$price)
    {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->type = $type;
        $this->price = $price;
    }

    public function getID()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function getType()
    {
        return $this->type;
    }

    public function getPrice()
    {
        return $this->price;
    }
}