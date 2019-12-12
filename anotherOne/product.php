<?php

class Product extends Dbh
{
    public function getAllProducts()
    {
        $stmt = $this->connect()->prepare("SELECT * FROM CW_Products");
        $stmt->execute();
        while($row = $stmt->fetch())
        {
            echo $productID = $row['productID'];
            echo $productName = $row['productName'];
            echo $productDescription = $row['productDescription'];
            echo $productType = $row['productType'];
            echo $stockAmount = $row['stockAmount'];
            echo $price = $row['price'];
            echo '<br>';
        }
    }
}