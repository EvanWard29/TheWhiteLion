<?php
class OrderItem
{
    private $orderID;
    private $itemID;
    private $productID;
    private $quantity;

    public function __construct($OrderID, $ItemID, $ProductID, $Quantity)
    {
        $this->orderID = $OrderID;
        $this->itemID = $ItemID;
        $this->productID = $ProductID;
        $this->quantity = $Quantity;
    }

    public function getOrderID()
    {
        return $this->orderID;
    }

    public function getItemID()
    {
        return $this->itemID;
    }

    public function getProductID()
    {
        return $this->productID;
    }

    public function getQuantity()
    {
        return $this->quantity;
    }
}