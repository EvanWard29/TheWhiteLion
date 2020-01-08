CREATE TABLE CW_AdminUsers(
	adminID INT NOT NULL,
    adminUsername VARCHAR(20) NOT NULL,
    adminPassword VARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_CW_AdminUsers PRIMARY KEY(adminID)
);