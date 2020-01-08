DELIMITER //

CREATE PROCEDURE getLastOrderID()
BEGIN
	SELECT
		@orderID:= MAX(orderID)+1
	FROM
		CW_Orders;
END;
