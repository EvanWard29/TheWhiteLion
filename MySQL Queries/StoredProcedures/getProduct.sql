DELIMITER //

CREATE PROCEDURE getProduct(ProductID INT)
BEGIN
	SELECT * FROM CW_Products
		WHERE CW_Products.productID = ProductID;
END;