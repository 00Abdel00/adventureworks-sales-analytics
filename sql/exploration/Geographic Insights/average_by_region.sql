-- Calculates the average order value per sales territory
-- Tables used: Sales.SalesOrderHeader, Sales.SalesTerritory

SELECT 
    st.Name AS Territory,
    AVG(soh.TotalDue) AS AvgOrderValue
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesTerritory AS st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY AvgOrderValue DESC;