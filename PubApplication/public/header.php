<?php include_once '../assets/config/orderSession.php';?>

<head>
    <link rel="stylesheet" href="../assets/css/mainMenu.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<html>
<title>The White Lion Pub</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
        <img class="w3-bar-item" src="../assets/img/whiteLion.png" style="width: 90px; height: 70px" alt="The White Lion">
        <a href="index.php" class="w3-bar-item w3-button">The White Lion</a>
        <!-- Right-sided navbar links. Hide them on small screens -->
        <div class="w3-right w3-hide-small">

            <a href="index.php#menu" class="w3-bar-item w3-button">Menu</a>
            <a href="orderPage.php" class="w3-bar-item w3-button">Order</a>
            <a href="admin.php" class="w3-bar-item w3-button">Admin</a>
            <?php
                if(isset($_SESSION['admin']) && $_SESSION['admin'] == 1)
                {
                    ?>
                    <a href="logout.php" class="w3-bar-item w3-button">Logout</a>
                    <?php
                }
            ?>

        </div>
    </div>
</div>
</html>
