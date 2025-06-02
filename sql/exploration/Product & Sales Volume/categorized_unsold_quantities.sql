-- Count categorized products that were never sold, grouped by category and subcategory

SELECT 
    pc.Name AS Category,
    ps.Name AS Subcategory,
    COUNT(DISTINCT p.ProductID) AS Unsold_Products
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID
LEFT JOIN Sales.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
WHERE sod.ProductID IS NULL
GROUP BY pc.Name, ps.Name
ORDER BY Unsold_Products DESC;