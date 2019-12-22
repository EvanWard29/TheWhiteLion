<?php
function getOrders()
{
    $id = $_POST['searchID'];
    $db = new repository();

    $orders = [];
    $getOrders = $db->getCustomerOrders($id);

    foreach($getOrders as $order)
    {
        $orderID = $order['orderID'] . ' ';
        $customerID = $order['customerID'] . ' ';
        $orderDate = $order['orderDate'] . ' ';
        $tableNo = $order['tableNo'] . ' ' . '<br>';

        $newOrder = new Order($orderID, $customerID, $orderDate, $tableNo);
        $orders[] = $newOrder;
    }

    return $orders;
}

function getAllOrders()
{
    $db = new repository();

    $orders = [];
    $getOrders = $db->getallOrders();

    foreach($getOrders as $order)
    {
        $orderID = $order['orderID'] . ' ';
        $customerID = $order['customerID'] . ' ';
        $orderDate = $order['orderDate'] . ' ';
        $tableNo = $order['tableNo'] . ' ' . '<br>';

        $newOrder = new Order($orderID, $customerID, $orderDate, $tableNo);
        $orders[] = $newOrder;
    }

    return $orders;
}

function getOrderItems($orderID)
{
    $db = new Repository();
    $orderItems = [];

    $results = $db->getCustomerOrderItems($orderID);

    foreach($results as $item)
    {
        $orderID = $item['orderID'];
        $itemID = $item['itemID'];
        $productID = $item['productID'];
        $quantity = $item['quantity'];

        $newItem = new OrderItem($orderID, $itemID, $productID, $quantity);
        $orderItems[] = $newItem;
    }

    return $orderItems;
}