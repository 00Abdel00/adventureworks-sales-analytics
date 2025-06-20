-- top_10_products.sql
-- Returns the top 10 best-selling products by total revenue
-- Tables used:
--   - Sales.SalesOrderDetail
--   - Production.Product

SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS TotalRevenue,
    COUNT(sod.SalesOrderDetailID) AS NumberOfOrders
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC;