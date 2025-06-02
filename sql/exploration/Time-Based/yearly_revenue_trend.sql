-- Returns yearly revenue and number of orders
SELECT 
    YEAR(soh.OrderDate) AS OrderYear,
    SUM(sod.LineTotal) AS TotalRevenue,
    COUNT(sod.SalesOrderDetailID) AS OrderCount
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY YEAR(soh.OrderDate)
ORDER BY OrderYear;