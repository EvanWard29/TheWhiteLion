<?php include_once 'header.php'; include '../src/model/repository.php';?>
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
                            <tr>
                                <td colspan="5">
                                    <?php
                                    if (isset($_SESSION['order'])) {
                                        if (count($_SESSION['order']) > 0) {
                                            ?>
                                            <a href="#" class="btn btn-success">Checkout</a>
                                            <?php
                                        }
                                    }
                                    ?>
                                </td>
                            </tr>
                            <?php
                        }?>

                </table>
            </div>
        </div>
    </div>
    <?php include_once 'footer.php';?>
</body>


