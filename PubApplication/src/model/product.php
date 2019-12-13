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

    public function id()
    {
        $this->id;
    }

    public function name()
    {
        $this->name;
    }

    public function description()
    {
        $this->description;
    }

    public function type()
    {
        $this->type;
    }

    public function price()
    {
        $this->price;
    }
}