CREATE VIEW Sales AS
SELECT sum(CW_OrderItem.quantity * CW_Products.price) as TotalCost,
 CW_Orders.orderID, CW_Customers.customerID
 FROM CW_OrderItem, CW_Products, CW_Orders, CW_Customers
 WHERE CW_Orders.orderID = CW_OrderItem.orderID
 AND CW_OrderItem.productID = CW_Products.productID
 AND CW_Customers.customerID = CW_Orders.customerID 
 GROUP BY CW_Orders.orderID, CW_Customers.customerID;
