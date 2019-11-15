CREATE TABLE CW_Drinks(
    drinkID INT NOT NULL,
    drinkName VARCHAR NOT NULL,
    drinkDescription TEXT NOT NULL,
    drinkPrice DECIMAL NOT NULL,

    CONSTRAINT pk_CW_Drinks PRIMARY KEY(drinkID)
);