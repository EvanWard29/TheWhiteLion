<?php include_once 'header.php'; include '../src/model/repository.php'?>
<head>
    <link rel="stylesheet" href="../assets/css/typeDropSelect.css">
</head>

<body>
<div class="w3-content" style="max-width:1100px">
    <div class="w3-row w3-padding-64" id="menu">
        <div class="w3-col 20 w3-padding-large">
            <h1 class="w3-center" style="font-size: 40px"><u>View and Edit Products</u></h1><br>
            <p>To add a new product to the database, enter the product details below:</p><br>

            <select id="type" onchange="selectType()" class="form-control">
                <option selected="selected">Select Product Type</option>
            <?php
            $productTypes = ['cider', 'beer', 'gin', 'vodka', 'rum', 'whisky', 'wine', 'champagne', 'fizzy', 'juice', 'mixer', 'crisps', 'nuts', 'biscuits', 'cake'];
            foreach($productTypes as $type)
            {
                ?>
                <option value="<?php echo $type ?>"><?php echo ucfirst($type) ?></option>
                <?php
            }
            ?>
            </select>
            <br>
            <?php
            if(isset($_GET['type']))
            {
                $type = $_GET['type'];
                ?>
                <h3>Product Type: <b><?php echo ucfirst($type) ?></b></h3>
                <table class="table">
                    <tr style="font-size: 18px">
                        <th style="width:25%">Product Name</th>
                        <th style="width:45%">Description</th>
                        <th style="width:10%">Price</th>
                        <th style="width:5%">Edit</th>
                        <th style="width:5%">Remove</th>
                    </tr>
                    <?php
                    $db = new repository();
                    $results = $db->getAll($type);

                    foreach($results as $product)
                    {
                        ?>
                        <form method="post" action="<?php echo basename($_SERVER['PHP_SELF']) . '?type=' . $type . '&action=edit&productID=' . $product['productID']?>" id="<?php echo $product['productID'] ?>">
                            <tr>
                                <td><textarea style="width: 100%" name="name" id="name"><?php echo $product['productName'] ?></textarea></td>
                                <td><textarea style="width: 100%" name="description" id="description"><?php echo $product['productDescription'] ?></textarea></td>
                                <td><label>£<input type="text" style="width: 50%" name="price" id="price" value="<?php echo $product['price'] ?>"></label></td>
                                <td>
                                    <input class="btn btn-primary" type="submit" value="Save" name="save">
                                </td>
                                <td>
                                    <input value="Withdraw" class="btn btn-danger" type="submit" name="delete">
                                </td>
                            </tr>
                        </form>
                        <?php
                    }
                    ?>
                </table>
                <?php
            }
            ?>
        </div>
    </div>
</div>

<script>
    function selectType()
    {
        var x = document.getElementById("type").value;
        window.location.href="<?php echo basename($_SERVER['PHP_SELF'])?>?type=" + x;
    }

    function deleteProduct()
    {
        var x = confirm("Are You Sure You Want To Withdraw This Product From Sale?");
        window.location.href="<?php echo basename($_SERVER['PHP_SELF']) . '?' . $_SERVER['QUERY_STRING']?>&delete=" + x;
    }
</script>
</body>

<?php

if(isset($_GET['action']))
{
    $db = new Repository();

    $id = $_GET['productID'];
    $result = $db->getProduct($id);

    $product = new Product($result['productID'], $result['productName'], $result['productDescription'], $result['productType'], $result['price']);

    if(isset($_POST['save']))
    {

        $name = $_POST['name'];
        $description = $_POST['description'];
        $price = $_POST['price'];

        $product->setName($name);
        $product->setDescription($description);
        $product->setPrice($price);

        $db->editProduct($product);
    }

    if(isset($_POST['delete']))
    {
        echo "<script>deleteProduct()</script>";
        header('Location: '.$_SERVER['REQUEST_URI']);
    }
}
if(isset($_GET['delete']))
{
   if($_GET['delete'] == 'true')
   {
       $db->removeProduct($id);
       echo "<script>alert('Product Removed')</script>";
   }
   else{
       echo "<script>alert('Product Will Not Be Deleted')</script>";
   }
}

