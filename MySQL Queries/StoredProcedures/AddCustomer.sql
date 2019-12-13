DELIMITER //

CREATE PROCEDURE AddCustomer(p_CustomerName VARCHAR(50), p_DOB DATE)
BEGIN
	SELECT
		@customerID:= MAX(customerID)+1
	FROM
		CW_Customers;
		
	INSERT INTO CW_Customers(customerID, customerName, DOB)
		VALUES(@customerID, p_CustomerName, p_DOB);
END;