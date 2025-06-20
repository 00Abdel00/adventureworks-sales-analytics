-- Shows how orders vary by weekday
SELECT 
    DATENAME(WEEKDAY, soh.OrderDate) AS DayOfWeek,
    COUNT(DISTINCT sod.SalesOrderID) AS OrderCount
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY DATENAME(WEEKDAY, soh.OrderDate);