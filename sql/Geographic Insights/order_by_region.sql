-- Counts the number of orders placed per sales territory
-- Tables used: Sales.SalesOrderHeader, Sales.SalesTerritory

SELECT 
    st.Name AS Territory,
    COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesTerritory AS st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY OrderCount DESC;