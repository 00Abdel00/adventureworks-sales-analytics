-- Returns monthly average order value (AOV)
SELECT 
    FORMAT(soh.OrderDate, 'yyyy-MM') AS OrderMonth,
    SUM(sod.LineTotal) / COUNT(DISTINCT sod.SalesOrderID) AS AvgOrderValue
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY FORMAT(soh.OrderDate, 'yyyy-MM')
ORDER BY OrderMonth;