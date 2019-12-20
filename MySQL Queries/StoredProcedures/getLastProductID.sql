DELIMITER //

CREATE PROCEDURE getLastProductID()
BEGIN
	SELECT
		@productID:= MAX(productID)+1
	FROM
		CW_Products;
END;
