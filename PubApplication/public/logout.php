<?php
include_once '../assets/config/orderSession.php';
session_destroy();
header('Location: index.php');