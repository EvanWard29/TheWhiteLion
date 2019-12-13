<?php
include '../src/model/repository.php';

$db = new Repository();
$db->getLastID();

$db->insertCustomer($db);