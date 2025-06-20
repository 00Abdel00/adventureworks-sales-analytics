-- Returns all products that never appeared in any sales order
SELECT 
    p.Name AS ProductName,
    p.ProductNumber,
    ps.Name AS Subcategory,
    pc.Name AS Category
FROM Production.Product AS p
LEFT JOIN Sales.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
LEFT JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE sod.ProductID IS NULL
ORDER BY Category, Subcategory, ProductName;