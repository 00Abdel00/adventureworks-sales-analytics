-- Returns the top 10 customers by total revenue, showing Store or Person name when available
-- Tables used:
--   - Sales.SalesOrderHeader
--   - Sales.SalesOrderDetail
--   - Sales.Customer
--   - Sales.Store
--   - Person.Person

SELECT TOP 10
    c.CustomerID,
    -- Determine whether it's a Store or Individual, and pull the appropriate name
    CASE 
        WHEN c.StoreID IS NOT NULL THEN s.Name
        ELSE p.FirstName + ' ' + p.LastName
    END AS CustomerName,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.Customer AS c ON soh.CustomerID = c.CustomerID
JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
LEFT JOIN Sales.Store AS s ON c.StoreID = s.BusinessEntityID
LEFT JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID
GROUP BY 
    c.CustomerID,
    CASE 
        WHEN c.StoreID IS NOT NULL THEN s.Name
        ELSE p.FirstName + ' ' + p.LastName
    END
ORDER BY TotalRevenue DESC;