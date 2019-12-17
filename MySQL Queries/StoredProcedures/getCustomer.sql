DELIMITER //

CREATE PROCEDURE getCustomer(CustomerName VARCHAR(40), dob DATE)
BEGIN
	SELECT
		customerID
	FROM
		CW_Customers
	WHERE
		CustomerName = CW_Customers.customerName && dob = CW_Customers.DOB;
END;
