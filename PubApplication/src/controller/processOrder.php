<?php
$db = new Repository();


$getCustomer = $db->getCustomer($_POST['name'], $_POST['dob']);
$customer = null;
$customerID = null;
foreach($getCustomer as $data)
{
    $customerID = $data['customerID'];
    $customerName = $data['customerName'];
    $DOB = $data['DOB'];
}

if($customerID === null)
{
    //echo "<script type='text/javascript'>alert('NEW CUSTOMER')</script>";

    $customerID = $db->getLastCustomerID();
    $customer = new Customer($customerID, $_POST['name'], $_POST['dob']);
    $db->insertCustomer($customer);
    insertOrder($db, $customer);
}
else
{
    //echo "<script type='text/javascript'>alert('EXISTING CUSTOMER')</script>";
    $customer = new Customer($customerID, $customerName, $DOB);
    insertOrder($db, $customer);
}

session_destroy();

function insertOrder($db, $customer)
{
    $itemID = 1;

    $orderID = $db->getLastOrderID();
    $customerID = $customer->getID();
    $date = date("Y-m-d H:i:s");

    $newOrder = new Order($orderID, $customerID, $date, $_POST['tableNo']);
    $db->insertOrder($newOrder);

    foreach($_SESSION['order'] as $item)
    {
        $orderItem = new OrderItem($orderID, $itemID, $item['productID'], $item['quantity']);
        $db->insertOrderItem($orderItem);
        $itemID += 1;

    }
}