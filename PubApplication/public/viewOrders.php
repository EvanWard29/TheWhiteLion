<?php include_once 'header.php'; include '../src/model/repository.php'; include '../src/controller/getOrders.php';?>

<body>
<div class="w3-content" style="max-width:1100px">
    <div class="w3-row w3-padding-64" id="menu">
        <div class="w3-col 20 w3-padding-large">
            <h1 class="w3-center" style="font-size: 40px"><u>View Orders</u></h1><br>
            <label>Select Option:
                <select id="option" class="form-inline" onchange="selectOption()">
                    <option selected="selected">Select Option</option>
                    <option value="customerSearch">Search Customer ID</option>
                    <option value="viewAll">View All</option>
                </select>
            </label>
            <?php
            if(isset($_GET['option']))
            {
                if($_GET['option'] == 'customerSearch')
                {
                    ?>
                    <form method="post" action="<?php echo basename($_SERVER['PHP_SELF']) . '?' . $_SERVER['QUERY_STRING']?>">
                        <label class="form-inline">Search: <input type="number" placeholder="Enter Customer ID" name="searchID" class="form-control"></label>
                        <input class="btn btn-default" type="submit" name="search" value="Search">
                    </form>
                    <?php
                    if(isset($_POST['search']))
                    {
                        $db = new Repository();
                        $orders = getOrders();
                        $customerName = $db->getCustomerName($_POST['searchID']);
                        ?>
                        <h3>Customer Name: <b><?php echo $customerName ?></b></h3>
                        <?php include '../src/view/presentOrders.php' ?>
                        <?php
                    }
                }
                if($_GET['option'] == 'viewAll')
                {
                    $db = new Repository();
                    $orders = getAllorders();
                    ?>
                    <h3>All Orders</h3>
                    <?php include '../src/view/presentOrders.php' ?>
                    <?php
                }
            }
            ?>

        </div>
    </div>
</div>
</body>

<script>
    function selectOption()
    {
        var x = document.getElementById("option").value;
        window.location.href="<?php echo basename($_SERVER['PHP_SELF'])?>?option=" + x;
    }
</script>

<?php
