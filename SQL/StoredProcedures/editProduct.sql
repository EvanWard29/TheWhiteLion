DELIMITER //

CREATE PROCEDURE editProduct(ProductID INT, ProductName VARCHAR(50), ProductDescription VARCHAR(200), Price DECIMAL(10,2))
BEGIN
	UPDATE CW_Products 
		SET 
			CW_Products.productName = ProductName,
			CW_Products.productDescription = ProductDescription,
            CW_Products.price = Price
		WHERE CW_Products.productID = ProductID;
END;