CREATE TABLE CW_OrderItem(
	orderID INT NOT NULL,
    itemID INT NOT NULL,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    
    CONSTRAINT pk_CW_OrderItem PRIMARY KEY(orderID, itemID),
    CONSTRAINT fk_CW_OrderItem FOREIGN KEY(orderID) REFERENCES CW_Orders(orderID),
    CONSTRAINT fk_CW_OrderItem_Products FOREIGN KEY(productID) REFERENCES CW_Products(productID)
);