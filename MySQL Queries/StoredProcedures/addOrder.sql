DELIMITER //

CREATE PROCEDURE addOrder(CustomerID INT, TableNo INT)
BEGIN
	SELECT
		@OrderID:= MAX(orderID)+1
	FROM
		CW_Orders;

	INSERT INTO CW_Order(orderItem, customerID, orderStatus, orderDate, tableNo)
		VALUES(@OrderID, CustomerID, 'REQUESTED', Now(), TableNo);
END;
