<?php include_once 'header.php'; include '../src/model/repository.php';?>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
</head>
<style>
    .order{
        font-family: "Playfair Display";
        font-size: 14px;
    }
</style>

<body>
    <div class="w3-content order" style="max-width:1100px">
        <div class="w3-row w3-padding-64" id="menu">
            <div class="w3-col 20 w3-padding-large">
                <h1 class="w3-center" style="font-size: 40px"><u>Checkout</u></h1><br>
                <table class="table">
                    <tr>
                        <th colspan="5"><u><h3>Order Details</h3></u></th>
                    </tr>
                    <tr style="font-size: 18px">
                        <th style="width:40%">Product Name</th>
                        <th style="width:10%">Quantity</th>
                        <th style="width:20%">Price</th>
                        <th style="width:15%">Total</th>
                        <th style="width:5%">Action</th>
                    </tr>
                    <?php
                        if(!empty($_SESSION['order']))
                        {
                            $total = 0;
                            foreach($_SESSION['order'] as $key => $product)
                            {?>

                                <tr>
                                    <td><?php echo $product['productName'] ?></td>
                                    <td><?php echo $product['quantity'] ?></td>
                                    <td>£<?php echo $product['price'] ?></td>
                                    <td>£<?php echo number_format($product['quantity'] * $product['price'], 2) ?></td>
                                    <td>
                                        <a href="<?php echo basename($_SERVER['PHP_SELF'])?>?action=delete&productID=<?php echo $product['productID']?>">
                                            <div class="btn btn-danger">Remove</div>
                                        </a>
                                    </td>
                                </tr>
                                <?php
                                $total = $total + ($product['quantity'] * $product['price']);
                            }?>

                            <tr>
                                <td colspan="3" align="right"><b>Total</b></td>
                                <td align="right"><b>£<?php echo number_format($total, 2) ?></b></td>
                                <td></td>
                            </tr>
                            <?php
                        }?>

                </table>
                <form class="w3-container w3-card-4" style="font-family: 'Playfair Display';" method="post" action="<?php echo basename($_SERVER['PHP_SELF'])?>">
                      <h1 class="w3-text-black">Confirm Order</h1>
                      <p>To Confirm Order, Enter Name and Date of Birth</p>
                      <p>
                          <label class="w3-text-blue"><b>Name</b></label>
                          <input class="w3-input w3-border" id="name" name="name" type="text">
                      </p>
                      <p>
                          <label class="w3-text-blue"><b>Date of Birth</b></label>
                          <input class="w3-input w3-border" id="dob" name="dob" type="text">
                      </p>
                      <p>
                          <label class="w3-text-blue"><b>Table Number</b></label>
                          <input class="w3-input w3-border" id="tableNo" name="tableNo" type="text">
                      </p>
                      <p>
                      <?php
                            if (isset($_SESSION['order'])) {
                                if (count($_SESSION['order']) > 0) {
                                    ?>
                                    <input type="submit" name="checkout" class="btn btn-success" value="Checkout">
                                    <?php
                                }
                            }
                        ?>
                </form>
            </div>
        </div>
    </div>
    <?php include_once 'footer.php';?>
</body>

<?php

if(isset($_POST['checkout']))
{
    while(true)
    {
        $date = validateDate($_POST['dob']);
        if($date === true)
        {
            include '../src/controller/processOrder.php';
            break;
        }
        break;
    }

}

function validateDate($date)
{
    if(date('Y-m-d', strtotime($date)) == $date)
    {
        return true;
    }
    else
    {
        echo "<script type='text/javascript'>alert('Incorrect Date Format, Please Try Again')</script>";
        return false;
    }
}
