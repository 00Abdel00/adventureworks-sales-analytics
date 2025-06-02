-- monthly_revenue_trend.sql
-- Shows total revenue per month over time
-- Tables used:
--   - Sales.SalesOrderDetail
--   - Sales.SalesOrderHeader

SELECT 
    FORMAT(soh.OrderDate, 'yyyy-MM') AS Month,
    SUM(sod.LineTotal) AS TotalRevenue,
    COUNT(sod.SalesOrderDetailID) AS OrderCount
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY FORMAT(soh.OrderDate, 'yyyy-MM')
ORDER BY Month;