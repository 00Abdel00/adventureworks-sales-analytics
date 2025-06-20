-- Counts total number of orders placed by customer type
-- Purpose: Understand ordering behavior of Individuals vs Stores
-- Tables used: Sales.SalesOrderHeader, Sales.Customer

SELECT 
    CASE 
        WHEN c.StoreID IS NOT NULL THEN 'Store'
        ELSE 'Individual'
    END AS CustomerType,
    COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.Customer AS c ON soh.CustomerID = c.CustomerID
GROUP BY 
    CASE 
        WHEN c.StoreID IS NOT NULL THEN 'Store'
        ELSE 'Individual'
    END
ORDER BY OrderCount DESC;