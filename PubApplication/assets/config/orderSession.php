<?php

session_start();
$productsID = array();
//session_destroy();

if(filter_input(INPUT_POST, 'addOrder'))
{
    if(isset($_SESSION['order']))
    {
        $count = count($_SESSION['order']);

        $productsID = array_column($_SESSION['order'], 'productID');

        if(!in_array(filter_input(INPUT_GET, 'productID'), $productsID))
        {
            $_SESSION['order'][$count] = array
            (
                'productID' => filter_input(INPUT_GET, 'productID'),
                'productName' => filter_input(INPUT_POST, 'productName'),
                'quantity' => filter_input(INPUT_POST, 'quantity'),
                'price' => filter_input(INPUT_POST, 'price')
            );
        }
        else
        {
            for($i = 0; $i < count($productsID); $i++)
            {
                if($productsID[$i] == filter_input(INPUT_GET, 'productID'))
                {
                    $_SESSION['order'][$i]['quantity'] += filter_input(INPUT_POST, 'quantity');
                }
            }
        }
    }
    else
    {
        $_SESSION['order'][0] = array
        (
            'productID' => filter_input(INPUT_GET, 'productID'),
            'productName' => filter_input(INPUT_POST, 'productName'),
            'quantity' => filter_input(INPUT_POST, 'quantity'),
            'price' => filter_input(INPUT_POST, 'price')
        );
    }
}

if(filter_input(INPUT_GET, 'action') == 'delete')
{
    foreach($_SESSION['order'] as $key => $product)
    {
        if($product['productID'] == filter_input(INPUT_GET, 'productID'))
        {
            unset($_SESSION['order'][$key]);
        }
    }
    $_SESSION['order'] = array_values($_SESSION['order']);
}
//pre_r($_SESSION);

function pre_r($array)
{
    echo '<pre>';
    print_r($array);
    echo '</pre>';
}?>