DELIMITER //

CREATE PROCEDURE getCustomerOrderItems(OrderID INT)
BEGIN
	SELECT 
		*
	FROM 
		CW_OrderItem
	WHERE 
		OrderID = CW_OrderItem.orderID;
END;