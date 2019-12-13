DELIMITER //

CREATE PROCEDURE Place_Order(p_CustomerID INT, p_ProductID INT, p_Quantity INT, p_TableNo INT)
BEGIN
    START TRANSACTION;
        
        BEGIN TRY
            DECLARE v_Error LONGTEXT;
            DECLARE v_OrderId INT;
            SELECT MAX(OrderID) INTO v_OrderId FROM CW_Orders;

            SET v_OrderId = v_OrderId+1;

            SET v_Error = CONCAT('Max selected =', CAST(v_OrderId as NVARCHAR(1)));

            INSERT INTO CW_Orders(orderID, orderDate, customerID, tableNo)
            VALUES(v_OrderId, NOW(), p_CustomerID, p_TableNo);

            DECLARE v_Price decimal(15,4);
            DECLARE v_Total decimal(15,4);
            
            SELECT price INTO v_Price FROM CW_Products WHERE productID = p_ProductID;
            SET v_Total = v_Price * p_Quantity;

            SET v_Error = CONCAT(v_Error , ' Line Total is ' , CAST(v_Line_Total AS NVARCHAR(1)));

            INSERT INTO CW_OrderItem(orderId, itemID, productId, quantity, total)
            VALUES(v_OrderId, p_ProductId, p_Quantity, v_Total );
            IF @@TRANCOUNT > 0 THEN COMMIT;
            END IF;
        END; TRY
        BEGIN CATCH
            SET v_Error = CONCAT(v_Error,':An error was encountered : Order could not be placed');
            IF @@TRANCOUNT > 0 THEN
                ROLLBACK
            END IF; TRANSACTION;
            SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = v_Error;
        END; CATCH; 
END;
//

DELIMITER ;
 