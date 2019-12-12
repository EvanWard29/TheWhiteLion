<?php include_once 'header.php'; ?>

<body>
<div class="w3-content" style="max-width:1100px">
    <div class="w3-row w3-padding-64" id="menu">
        <div class="w3-col 20 w3-padding-large">
            <h1 class="w3-center" style="font-size: 40px"><u>Alcoholic Drinks</u></h1><br>

            <div class="w3-container">
                <button class="collapsible"><img src="../assets/img/cider.jpg" style="width: 183.75px; height: 120px; border: 5px solid black;">&nbsp;&nbsp; Draught & Bottled Cider</button>
                <div class="content">
                    <?php include 'alcoholicDrinks/cider.php' ?>
                </div>

            </div>

            <hr>

            <div class="w3-container">
                <button class="collapsible"><img src="../assets/img/beer.jpg" style="width: 183.75px; height: 120px; border: 5px solid black;">&nbsp;&nbsp; Beer</button>
                <div class="content">
                    <?php include 'alcoholicDrinks/beer.html' ?>
                </div>
            </div>

            <hr>

            <div class="w3-container">
                <button class="collapsible"><img src="../assets/img/gin.jpg" style="width: 183.75px; height: 120px; border: 5px solid black;">&nbsp;&nbsp; Gin</button>
                <div class="content">
                    <?php include 'alcoholicDrinks/gin.html' ?>
                </div>
            </div>

            <hr>

            <div class="w3-container">
                <button class="collapsible"><img src="../assets/img/vodka.jpg" style="width: 183.75px; height: 120px; border: 5px solid black;">&nbsp;&nbsp; Vodka</button>
                <div class="content">
                    <?php include 'alcoholicDrinks/vodka.html' ?>
                </div>
            </div>

            <hr>

            <div class="w3-container">
                <button class="collapsible"><img src="../assets/img/rum.jpg" style="width: 183.75px; height: 120px; border: 5px solid black;">&nbsp;&nbsp; Rum</button>
                <div class="content">
                    <?php include 'alcoholicDrinks/rum.html' ?>
                </div>
            </div>

            <hr>

            <div class="w3-container">
                <button class="collapsible"><img src="../assets/img/whiskey.jpg" style="width: 183.75px; height: 120px; border: 5px solid black;">&nbsp;&nbsp; Whiskey</button>
                <div class="content">
                    <?php include 'alcoholicDrinks/whiskey.html' ?>
                </div>
            </div>

            <hr>

            <div class="w3-container">
                <button class="collapsible"><img src="../assets/img/wine.jpg" style="width: 183.75px; height: 120px; border: 5px solid black;">&nbsp;&nbsp; Wine</button>
                <div class="content">
                    <?php include 'alcoholicDrinks/wine.html' ?>
                </div>
            </div>

            <div class="w3-container">
                <button class="collapsible"><img src="../assets/img/champagne.jpg" style="width: 183.75px; height: 120px; border: 5px solid black;">&nbsp;&nbsp; Champagne</button>
                <div class="content">
                    <?php include 'alcoholicDrinks/champagne.html' ?>
                </div>
            </div>

        </div>
    </div>
</div>

<?php include_once 'footer.php'; ?>

<script src="../assets/js/collapsibleSections.js"></script>

</body>

</html>
