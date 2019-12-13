<?php
$i = 0;
while($i < count($productTypes))
{
    ?>
    <div class="w3-container" >
        <button class="collapsible" ><img src = "../assets/img/<?php echo $productTypes[$i] ?>.jpg" alt="<?php echo $productTypes[$i] ?>" style = "width: 183.75px; height: 120px; border: 5px solid black;" >&nbsp;&nbsp; <?php echo ucfirst($productTypes[$i]) ?> </button >
        <div class="content" >
            <?php
            include_once '../src/model/Repository.php';

            $db = new repository();
            $results = $db->getAll(lcfirst($productTypes[$i]));

            foreach($results as $row) {
                ?>
                <div class="w3-row">
                    <form method="post" action="index.php?action=add&id=<?php echo $row['productID'] ?>">
                        <div class="w3-col l9 w3-left">
                            <p><?php echo $row['productName'] ?></p>
                            <p style="font-size: 15px"><?php echo $row['productDescription'] ?></p>
                        </div>
                        <div class="w3-col l1 w3-left"><p><?php echo $row['price'] ?></p></div>
                        <div class="w3-col l2 w3-left">
                            <p>
                                <input type="submit" name="addOrder" class="w3-btn w3-teal w3-round-xlarge>">Add Item</input>
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