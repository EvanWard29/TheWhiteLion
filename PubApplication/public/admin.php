<?php
include_once 'header.php';
include '../src/model/repository.php';
?>


<body>
    <div class="w3-content" style="max-width:1100px">
        <div class="w3-row w3-padding-64" id="menu">
            <div class="w3-col 20 w3-padding-large">
                <h1 class="w3-center" style="font-size: 40px"><u>Admin Options</u></h1><br>
                <?php
                if(!isset($_SESSION['admin']) || $_SESSION['admin'] != 1)
                {
                    header('Location: login.php');
                    exit();
                }
                ?>

                <h4><a href="alcoholicDrinks.php">Add New Product</a></h4>
                <p class="w3-text-grey">Add a new Drink or Snack to the database to sell.</p><br>
                <hr>
                <h4><a href="softDrinks.php">View Product Details</a></h4>
                <p class="w3-text-grey">View the details of all products currently for sale.</p><br>
                <hr>
                <h4><a href="snacks.php">View Customer Orders</a></h4>
                <p class="w3-text-grey">View past orders of customers.</p><br>
                <hr>
                <h4><a href="snacks.php">Edit Product Details</a></h4>
                <p class="w3-text-grey">Edit the Name, Description or Price of a Product for sale.</p><br>
                <hr>
                <h4><a href="snacks.php">Withdraw Product</a></h4>
                <p class="w3-text-grey">Remove a Product from the database and sale.</p><br>

            </div>
        </div>
    </div>
</body>



<?php include_once 'footer.php'; ?>

<?php


