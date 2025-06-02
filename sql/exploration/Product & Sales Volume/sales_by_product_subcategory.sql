-- sales_by_product_category.sql
-- Returns total revenue grouped by product category
-- Tables used:
--   - Sales.SalesOrderDetail
--   - Production.Product
--   - Production.ProductSubcategory

SELECT 
    ps.Name AS Category,
    SUM(sod.LineTotal) AS TotalRevenue,
    COUNT(sod.SalesOrderDetailID) AS OrderCount
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.Name
ORDER BY TotalRevenue DESC;