DELIMITER //

CREATE PROCEDURE getCustomerOrders(CustomerID INT)
BEGIN
	SELECT 
		*
	FROM 
		CW_Orders
	WHERE 
		CW_Orders.customerID = CustomerID;
END;