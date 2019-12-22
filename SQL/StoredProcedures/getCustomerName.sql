DELIMITER //

CREATE PROCEDURE getCustomerName(CustomerID INT)
BEGIN
	SELECT 
		CW_Customers.customerName
	FROM 
		CW_Customers
	WHERE 
		CW_Customers.customerID = CustomerID;
END;