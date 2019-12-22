DELIMITER //

CREATE PROCEDURE withdrawProduct(ProductID INT)
BEGIN
	DELETE FROM CW_Products
		WHERE CW_Products.productID = ProductID;
END;