<?php
include 'product.php';
include 'customer.php';

class Repository
{
    private $db_server = 'proj-mysql.uopnet.plymouth.ac.uk';
    private $dbUser = 'ISAD251_EWard';
    private $dbPassword = 'ISAD251_22215448';
    private $dbDatabase = 'ISAD251_EWard';
    private $dataSourceName;
    private $connection;
    private $id;

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

    public function getLastID()
    {
        $sql = "CALL getLastID()";
        $statement = $this->connection->prepare($sql);
        $statement->execute();

        $result = $statement->fetchColumn();

        $this->id = $result;

        return $result;
    }

    public function getID()
    {
        return $this->id;
    }

    public function insertCustomer($db)
    {
        $customer = new Customer($db->getID(), 'Jack Howells', '2000-05-14');

        $name = $customer->name();
        $DOB = $customer->dob();

        $sql = "CALL AddCustomer(:p_CustomerName,:p_DOB)";
        $statement = $this->connection->prepare($sql);
        $statement->bindParam(':p_CustomerName', $name, PDO::PARAM_STR);
        $statement->bindParam(':p_DOB', $DOB, PDO::PARAM_STR);

        $statement->execute();
        echo 'Maybe Worked?';
    }


}