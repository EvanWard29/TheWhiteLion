DELIMITER //

CREATE PROCEDURE getLastCustomerID()
BEGIN
	SELECT
		@CustomerID:= MAX(customerID)+1
	FROM
		CW_Customers;
END;
