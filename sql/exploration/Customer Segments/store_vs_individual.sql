-- Calculates total revenue and number of unique customers by inferred customer type (Individual vs Store)
-- Purpose: Identify which customer segment generates the most value
-- Tables used:
--   - Sales.SalesOrderHeader
--   - Sales.Customer
--   - Sales.SalesOrderDetail

SELECT
    -- Infer customer type from presence of StoreID or PersonID
    CASE 
        WHEN c.StoreID IS NOT NULL THEN 'Store'
        WHEN c.PersonID IS NOT NULL THEN 'Individual'
        ELSE 'Unknown'
    END AS CustomerType,
    SUM(sod.LineTotal) AS TotalRevenue,
    COUNT(DISTINCT soh.CustomerID) AS UniqueCustomers
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.Customer AS c ON soh.CustomerID = c.CustomerID
JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY 
    CASE 
        WHEN c.StoreID IS NOT NULL THEN 'Store'
        WHEN c.PersonID IS NOT NULL THEN 'Individual'
        ELSE 'Unknown'
    END
ORDER BY TotalRevenue DESC;
