CREATE TABLE CW_Snacks(
    snackID INT NOT NULL,
    snackName VARCHAR NOT NULL,
    snackDescription TEXT NOT NULL,
    snackPrice INT NOT NULL,

    CONSTRAINT pk_CW_Snacks PRIMARY KEY(snackID)
);