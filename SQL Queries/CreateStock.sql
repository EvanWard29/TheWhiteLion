CREATE TABLE CW_Stock(
    stockType VARCHAR NOT NULL,
    itemID INT NOT NULL,
    amountOfStock INT NOT NULL,
    
    CONSTRAINT pk_CW_Stock PRIMARY KEY(stockType, itemID)
);