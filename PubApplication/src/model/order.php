<?php

class Order
{
    private $orderID;
    private $customerID;
    private $orderDate;
    private $tableNo;

    public function __construct($OrderID, $CustomerID, $OrderDate, $TableNo)
    {
        $this->orderID = $OrderID;
        $this->customerID = $CustomerID;
        $this->orderDate = $OrderDate;
        $this->tableNo = $TableNo;
    }

    public function getOrderID()
    {
        return $this->orderID;
    }

    public function getCustomerID()
    {
        return $this->customerID;
    }

    public function getOrderDate()
    {
        return $this->orderDate;
    }

    public function getTableNo()
    {
        return $this->tableNo;
    }

    public function setOrderID($id)
    {
        $this->orderID = $id;
    }

    public function setCustomerID($id)
    {
        $this->customerID = $id;
    }

    public function setOrderDate($date)
    {
        $this->orderDate = $date;
    }

    public function setTableNo($tableNo)
    {
        $this->tableNo = $tableNo;
    }
}