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
        return $this->id;
    }

    public function name()
    {
        return $this->name;
    }

    public function description()
    {
        return $this->description;
    }

    public function type()
    {
        return $this->type;
    }

    public function price()
    {
        return $this->price;
    }
}