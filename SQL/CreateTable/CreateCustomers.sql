CREATE TABLE CW_Customers(
	customerID INT NOT NULL AUTO_INCREMENT,
    customerName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    
    CONSTRAINT pk_CW_Customers PRIMARY KEY(customerID)
);