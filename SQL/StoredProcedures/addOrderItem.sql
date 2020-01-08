DELIMITER //

CREATE PROCEDURE addOrderItem(OrderID INT, ItemID INT, ProductID INT, Quantity INT)
BEGIN
	INSERT INTO CW_OrderItem(orderID, itemID, productID, quantity)
		VALUES(OrderID, ItemID, ProductID, Quantity);
END;
