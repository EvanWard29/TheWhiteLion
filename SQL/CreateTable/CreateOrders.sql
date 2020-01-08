CREATE TABLE CW_Orders(
	orderID INT NOT NULL AUTO_INCREMENT,
    customerID INT NOT NULL,
    orderStatus VARCHAR(10) NOT NULL,
    orderDate DATETIME NOT NULL,
    tableNo INT NOT NULL,
    
    CONSTRAINT pk_CW_Orders PRIMARY KEY(orderID),
    CONSTRAINT fk_CW_Orders FOREIGN KEY(customerID) REFERENCES CW_Customers(customerID)
);