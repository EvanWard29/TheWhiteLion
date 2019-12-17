DELIMITER //

CREATE PROCEDURE viewCustomerOrder(CustomerID INT)
BEGIN
	SELECT * FROM CW_Orders, CW_OrderItem
		WHERE CW_Orders.customerID = CustomerID
			ORDER BY CW.Orders.orderID;
END;