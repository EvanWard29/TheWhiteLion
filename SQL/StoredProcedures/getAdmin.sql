DELIMITER //

CREATE PROCEDURE getAdmin(AdminUsername VARCHAR(20))
BEGIN
	SELECT
		adminPassword
	FROM
		CW_AdminUsers
	WHERE
		AdminUsername = CW_AdminUsers.adminUsername;
END;
