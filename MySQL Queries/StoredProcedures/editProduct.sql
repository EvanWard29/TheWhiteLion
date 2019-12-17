DELIMITER //

CREATE PROCEDURE editProduct(ProductID INT, ProductDescription VARCHAR(200))
BEGIN
	UPDATE CW_Products SET CW_Products.productDescription = ProductDescription
		WHERE CW_Products.productID = ProductID;
END;