
--Create procedures
CREATE PROCEDURE summary_order_status
    @StatusID INT
AS
BEGIN
    SELECT so.OrderID,
		c.CustomerName, 
		p.ProductName,
		so.Quantity,
		sto.StatusOrder
	FROM DWH_Project.dbo.FactSalesOrder as so
	INNER JOIN DWH_Project.dbo.DimCustomer as c ON so.CustomerID = c.CustomerID
	INNER JOIN DWH_Project.dbo.DimProduct as p ON so.ProductID = p.ProductID
	INNER JOIN DWH_Project.dbo.DimStatusOrder as sto ON so.StatusID = sto.StatusID
	WHERE sto.StatusID = @StatusID;
END;

--Run procedures
EXEC summary_order_status @StatusID = 1;

-- checks
select * from FactSalesOrder;

--Delete procedures (if needed)
DROP PROCEDURE summary_order_status;
GO
