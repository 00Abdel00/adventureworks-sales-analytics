-- Calculates the average order value grouped by customer type
-- Purpose: Compare average order value for Stores vs Individuals
-- Tables used: Sales.SalesOrderHeader, Sales.SalesOrderDetail, Sales.Customer

SELECT 
    CASE 
        WHEN c.StoreID IS NOT NULL THEN 'Store'
        ELSE 'Individual'
    END AS CustomerType,
    AVG(sod.LineTotal) AS AvgOrderValue
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.Customer AS c ON soh.CustomerID = c.CustomerID
JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY 
    CASE 
        WHEN c.StoreID IS NOT NULL THEN 'Store'
        ELSE 'Individual'
    END
ORDER BY AvgOrderValue DESC;