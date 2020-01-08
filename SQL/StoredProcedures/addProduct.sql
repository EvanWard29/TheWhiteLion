DELIMITER //

CREATE PROCEDURE addProduct(ProductID INT, ProductName VARCHAR(50), ProductDescription VARCHAR(200), ProductType VARCHAR(10), Price DECIMAL(10, 2))
BEGIN
	INSERT INTO CW_Products(productID, productName, productDescription, productType, price)
		VALUES(ProductID, ProductName, ProductDescription, ProductType, Price);
END;