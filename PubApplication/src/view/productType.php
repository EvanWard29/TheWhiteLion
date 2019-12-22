<?php
$i = 0;
while($i < count($productTypes))
{
    ?>
    <div class="w3-container" >
        <button class="collapsible" ><img src = "../assets/img/<?php echo $productTypes[$i] ?>.jpg" alt="<?php echo $productTypes[$i] ?>" style = "width: 183.75px; height: 120px; border: 5px solid black;" >&nbsp;&nbsp; <?php echo ucfirst($productTypes[$i]) ?> </button >
        <div class="content" >
            <?php
            include_once '../model/repository.php';

            $db = new repository();
            $results = $db->getAll(lcfirst($productTypes[$i]));

            foreach($results as $product) {
                ?>
                <div class="w3-row">
                    <form method="post" action="<?php echo basename($_SERVER['PHP_SELF'])?>?action=add&productID=<?php echo $product['productID'] ?>">
                        <div class="w3-col l9 w3-left">
                            <p><?php echo $product['productName'] ?></p>
                            <p style="font-size: 15px"><?php echo $product['productDescription'] ?></p>
                        </div>
                        <div class="w3-col l1 w3-left"><p>£<?php echo $product['price'] ?></p></div>
                        <div class="w3-col l2 w3-left">
                            <p>
                                <input type="hidden" name="productName" value="<?php echo $product['productName'] ?>">
                                <input type="hidden" name="price" value="<?php echo $product['price'] ?>">
                                <label>Quantity:<input type="text" name="quantity" style="width:19%" value="1"></label>
                                <input type="submit" name="addOrder" style="margin-top:5px" value="Add Item" class="w3-btn w3-teal w3-round-xlarge>">

                            </p>
                        </div>
                    </form>
                </div>
                <?php
            }

            ?>
        </div >

    </div >

    <hr>
    <?php
    $i = $i + 1;
}
?>