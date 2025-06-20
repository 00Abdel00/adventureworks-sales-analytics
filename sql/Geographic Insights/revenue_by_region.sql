-- Calculates total revenue grouped by each sales territory
-- Tables used: Sales.SalesOrderHeader, Sales.SalesTerritory

SELECT 
    st.Name AS Territory,
    SUM(soh.TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesTerritory AS st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY TotalRevenue DESC;