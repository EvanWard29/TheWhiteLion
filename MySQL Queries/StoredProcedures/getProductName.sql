DELIMITER //

CREATE PROCEDURE getProductName(ProductID INT)
BEGIN
	SELECT 
		CW_Products.productName
	FROM 
		CW_Products
	WHERE 
		ProductID = CW_Products.productID;
END;