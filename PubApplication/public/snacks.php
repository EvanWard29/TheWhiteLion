<?php include_once 'header.php';?>

<body>
<div class="w3-content" style="max-width:1100px">
    <div class="w3-row w3-padding-64" id="menu">
        <div class="w3-col 20 w3-padding-large">
            <h1 class="w3-center" style="font-size: 40px"><u>Snacks</u></h1><br>
            <?php
            $productTypes = ['crisps', 'nuts', 'biscuits', 'cake'];
            include '../src/view/productType.php';
            ?>
            <script src="../assets/js/getProducts.js"></script>
        </div>
    </div>
</div>


<?php include_once 'footer.php'; ?>
<script src="../assets/js/collapsibleSections.js"></script>

</body>

</html>