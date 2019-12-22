<table class="table w3-center">
    <colgroup span="2"></colgroup>
    <tr style="font-size: 18px">
        <th style="width:50%" colspan="3"><b>Order Details</b></th>
        <th style="width:50%" colspan="3"><b>Order Items</b></th>
    </tr>
    <tr style="font-size: 18px">
        <td>Order ID</td>
        <td>Order Date</td>
        <td>Table Number</td>
        <td>Item ID</td>
        <td>Product ID</td>
        <td>Product Name</td>
        <td>Quantity</td>
    </tr>
    <?php
    foreach($orders as $order)
    {
        $orderItems = getOrderItems($order->getOrderID());
        $span = count($orderItems) + 1;
        ?>
        <tr>
        <td rowspan="<?php echo $span ?>"><?php echo $order->getOrderID() ?></td>
        <td rowspan="<?php echo $span ?>"><?php echo $order->getOrderDate() ?></td>
        <td rowspan="<?php echo $span ?>"><?php echo $order->getTableNo() ?></td>

        <?php
        foreach($orderItems as $item)
        {
            $productID = $item->getProductID();
            $productName = $db->getProductName($productID);
            ?>
            <tr>
                <td><?php echo $item->getItemID() ?></td>
                <td><?php echo $item->getProductID() ?></td>
                <td><?php echo $productName ?></td>
                <td><?php echo $item->getQuantity() ?></td>
            </tr>
            <?php
        }
        ?>
        </tr>
        <?php
    }
    ?>
</table>