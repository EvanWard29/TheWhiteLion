<?php
    include '../../src/model/Repository.php'
?>

<div class="w3-cell">
    <?php

    if(isset($tablename)) {
        $db = new Repository();
        $results = $db->getAll();

        if ($results) {
            //Hopefully if the results have been the right PDO type we should be able
            //to extract the column names with ease.
            $columns = empty($results) ? array() : array_keys($results[0]);
            $idColumn = $columns[0];
            $tableString = '<table class="w3-table w3-striped w3-bordered"><tr>';
            $inputString = '';
            $insertString = '';
            foreach ($columns as $column) {
                $tableString .= '<th>' . $column . '</th>';
                $inputString .= '<th>' . $column . '</th>';
                $insertString .= '<td><input type=\'text\' name=\'' . $column . '\'/></td>';

            }
            echo $tableString;
            foreach ($results as $row) {
                echo '<tr>';

                foreach ($row as $cell) {
                    echo '<td>' . $cell . '</td>';
                }
            }
            echo '</table>';
        }
    }
    ?>
</div>







<!-- Content for Ciders

<div class="w3-row">
    <div class="w3-col m9 w3-left">
        <p>Kopparberg Strawberry & Lime on Draught</p>
    </div>
    <div class="w3-col m1 w3-left"><p>£2.79</p></div>
    <div class="w3-col m2 w3-left">
        <p><button class="w3-btn w3-teal w3-round-xlarge>">Add Item</button></p>
    </div>
</div>

<div class="w3-row">
    <div class="w3-col m9 w3-left">
        <p>Strongbow Dark Fruits</p>
        <p>Classic </p>
    </div>
    <div class="w3-col m1 w3-left"><p>£2.69</p></div>
    <div class="w3-col m2 w3-left">
        <p><button class="w3-btn w3-teal w3-round-xlarge>">Add Item</button></p>
    </div>
</div>

<div class="w3-row">
    <div class="w3-col m9 w3-left">
        <p>Magners</p>
    </div>
    <div class="w3-col m1 w3-left"><p>£1.99</p></div>
    <div class="w3-col m2 w3-left">
        <p><button class="w3-btn w3-teal w3-round-xlarge>">Add Item</button></p>
    </div>
</div>

<div class="w3-row">
    <div class="w3-col m9 w3-left">
        <p>Strongbow</p>
    </div>
    <div class="w3-col m1 w3-left"><p>£2.65</p></div>
    <div class="w3-col m2 w3-left">
        <p><button class="w3-btn w3-teal w3-round-xlarge>">Add Item</button></p>
    </div>
</div>

<div class="w3-row">
    <div class="w3-col m9 w3-left">
        <p>Thatchers Gold</p>
    </div>
    <div class="w3-col m1 w3-left"><p>£2.69</p></div>
    <div class="w3-col m2 w3-left">
        <p><button class="w3-btn w3-teal w3-round-xlarge>">Add Item</button></p>
    </div>
</div>

<div class="w3-row">
    <div class="w3-col m9 w3-left">
        <p>Kopparberg Mixed Fruit</p>
    </div>
    <div class="w3-col m1 w3-left"><p>£2.45</p></div>
    <div class="w3-col m2 w3-left">
        <p><button class="w3-btn w3-teal w3-round-xlarge>">Add Item</button></p>
    </div>
</div>

<div class="w3-row">
    <div class="w3-col m9 w3-left">
        <p>Kapparberg Strawberry & Lime</p>
    </div>
    <div class="w3-col m1 w3-left"><p>£2.45</p></div>
    <div class="w3-col m2 w3-left">
        <p><button class="w3-btn w3-teal w3-round-xlarge>">Add Item</button></p>
    </div>
</div>

<div class="w3-row">
    <div class="w3-col m9 w3-left">
        <p>Bulmers No 17</p>
    </div>
    <div class="w3-col m1 w3-left"><p>£3.39</p></div>
    <div class="w3-col m2 w3-left">
        <p><button class="w3-btn w3-teal w3-round-xlarge>">Add Item</button></p>
    </div>
</div>-->