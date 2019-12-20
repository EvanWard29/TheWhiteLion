<?php
include 'product.php';
include 'customer.php';
include 'orderItem.php';
include 'order.php';


class Repository
{
    private $db_server = 'proj-mysql.uopnet.plymouth.ac.uk';
    private $dbUser = 'ISAD251_EWard';
    private $dbPassword = 'ISAD251_22215448';
    private $dbDatabase = 'ISAD251_EWard';
    private $dataSourceName;
    private $connection;

    public function __construct(PDO $connection = null)
    {
        $this->connection = $connection;
        try {
            if ($this->connection === null) {
                $this->dataSourceName = 'mysql:dbname=' . $this->dbDatabase . ';host=' . $this->db_server;
                $this->connection = new PDO($this->dataSourceName, $this->dbUser, $this->dbPassword);
                $this->connection->setAttribute(
                    PDO::ATTR_ERRMODE,
                    PDO::ERRMODE_EXCEPTION
                );
            }
        }catch (PDOException $err)
        {
            echo 'Connection failed: ', $err->getMessage();
        }
    }
    public function getAll($type)
    {
        $sql = "SELECT * FROM CW_Products WHERE productType = ?";

        $statement = $this->connection->prepare($sql);
        $statement->execute([$type]);

        $resultSet = $statement->fetchAll(PDO::FETCH_ASSOC);

        return $resultSet;
    }

    public function getLastOrderID()
    {
        $sql = "CALL getLastOrderID()";
        $statement = $this->connection->prepare($sql);
        $statement->execute();

        $result = $statement->fetchColumn();
        return $result;
    }

    public function getLastCustomerID()
    {
        $sql = "CALL getLastCustomerID()";
        $statement = $this->connection->prepare($sql);
        $statement->execute();

        $result = $statement->fetchColumn();
        return $result;
    }

    public function insertCustomer($customer)
    {
        $name = $customer->getName();
        $DOB = $customer->getDOB();

        $sql = "CALL AddCustomer(:p_CustomerName,:p_DOB)";
        $statement = $this->connection->prepare($sql);
        $statement->bindParam(':p_CustomerName', $name, PDO::PARAM_STR);
        $statement->bindParam(':p_DOB', $DOB, PDO::PARAM_STR);

        $statement->execute();
    }

    public function getCustomer($name, $dob)
    {
        $sql = "CALL getCustomer(:CustomerName, :dob)";

        $statement = $this->connection->prepare($sql);
        $statement->bindParam(':CustomerName', $name, PDO::PARAM_STR);
        $statement->bindParam(':dob', $dob, PDO::PARAM_STR);

        $statement->execute();
        $result = $statement->fetchAll();

        return $result;
    }

    public function insertOrder($order)
    {
        $sql = "CALL addOrder(:CustomerID, :TableNo)";

        $customerID = $order->getCustomerID();
        $tableNo = $order->getTableNo();

        $statement = $this->connection->prepare($sql);
        $statement->bindParam(':CustomerID', $customerID, PDO::PARAM_INT);
        $statement->bindParam(':TableNo', $tableNo, PDO::PARAM_INT);

        $statement->execute();
    }

    public function insertOrderItem($orderItem)
    {
        $sql = "CALL addOrderItem(:OrderID, :ItemID, :ProductID, :Quantity)";

        $orderID = $orderItem->getOrderID();
        $itemID = $orderItem->getItemID();
        $productID = $orderItem->getProductID();
        $quantity = $orderItem->getQuantity();

        $statement = $this->connection->prepare($sql);
        $statement->bindParam(':OrderID', $orderID, PDO::PARAM_INT);
        $statement->bindParam(':ItemID', $itemID, PDO::PARAM_INT);
        $statement->bindParam(':ProductID', $productID, PDO::PARAM_INT);
        $statement->bindParam(':Quantity', $quantity, PDO::PARAM_INT);

        $statement->execute();
    }

    public function addProduct($product)
    {
        $sql = "CALL addProduct(:ProductID, :ProductName, :ProductDescription, :ProductType, :Price)";

        $productID = $product->getID();
        $productName = $product->getName();
        $productDescription = $product->getDescription();
        $productType = $product->getType();
        $price = $product->getPrice();

        $statement = $this->connection->prepare($sql);
        $statement->bindParam(':ProductID', $productID, PDO::PARAM_INT);
        $statement->bindParam(':ProductName', $productName, PDO::PARAM_STR);
        $statement->bindParam(':ProductDescription', $productDescription, PDO::PARAM_STR);
        $statement->bindParam(':ProductType', $productType, PDO::PARAM_STR);
        $statement->bindParam(':Price', $price, PDO::PARAM_STR);

        $statement->execute();
    }

    public function adminLogin($username)
    {
        $sql = "CALL getAdmin(:AdminUsername)";

        $statement = $this->connection->prepare($sql);
        $statement->bindParam(':AdminUsername', $username, PDO::PARAM_STR);

        $statement->execute();

        $result = $statement->fetchColumn();

        return $result;
    }
}