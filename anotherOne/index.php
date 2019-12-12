<?php
include_once 'dbConnection.php';
include_once 'product.php';

$object = new Product();
$object->getAllProducts();