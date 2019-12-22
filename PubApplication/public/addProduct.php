<?php include_once 'header.php'; include '../src/model/repository.php'?>

<body>
<div class="w3-content" style="max-width:1100px">
    <div class="w3-row w3-padding-64" id="menu">
        <div class="w3-col 20 w3-padding-large">
            <h1 class="w3-center" style="font-size: 40px"><u>Add Product</u></h1><br>
            <p>To add a new product to the database, enter the product details below:</p><br>
            <form class="form-horizontal" method="post" action="<?php echo basename($_SERVER['PHP_SELF'])?>">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="productName">Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="productName" name="name" placeholder="Enter Product Name" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="description">Description:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="description" id="description" rows="3" placeholder="Enter Product Description"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="type">Type:</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="type" name="type" required>
                            <option selected="selected">Select A Product Type</option>
                            <option value="cider">Cider</option>
                            <option value="beer">Beer</option>
                            <option value="gin">Gin</option>
                            <option value="vodka">Vodka</option>
                            <option value="rum">Rum</option>
                            <option value="whisky">Whisky</option>
                            <option value="wine">Wine</option>
                            <option value="champagne">Champagne</option>
                            <option value="fizzy">Fizzy</option>
                            <option value="juice">Juice</option>
                            <option value="mixer">Mixer</option>
                            <option value="crisps">Crisps</option>
                            <option value="nuts">Nuts</option>
                            <option value="biscuits">Biscuits</option>
                            <option value="cake">Cake</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="price">Price:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="price" name="price" placeholder="Enter Price of Product" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-default" name="addProduct" value="Add Product">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

<?php include_once 'footer.php'; ?>

<?php
$db = new Repository();

if(isset($_POST['addProduct']))
{
    $productName = $_POST['name'];
    $productDescription = $_POST['description'];
    $productType = $_POST['type'];
    $price = $_POST['price'];

    $newProduct = new Product($db->getLastProductID(), $productName, $productDescription, $productType, $price);

    $db->addProduct($newProduct);
}
