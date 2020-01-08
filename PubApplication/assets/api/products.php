<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../../src/Model/Repository.php';
include_once '../../src/Model/product.php';

$db = new Repository();

$response = $db->getProducts();

if($response)
{
    $code = 200;
    echo returnJSON($response, $code);
}
else{

    // set response code - 404 Not found
    http_response_code(404);

    // tell the user no products found
    echo json_encode(
        array("message" => "No products found.")
    );
}

function returnJSON($response, $code)
{
    header_remove();
    http_response_code($code);
    header('Content-Type: application/json');
    header('Status: '.$code);
    return json_encode(array('status' => $code, 'message' => $response));
}



