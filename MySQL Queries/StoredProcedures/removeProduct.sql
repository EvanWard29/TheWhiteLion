DELIMITER //

CREATE PROCEDURE removeProduct(ProductID INT)
BEGIN
	DELETE FROM CW_Products 
		WHERE CW_Products.productID = ProductID; 
END;