-- Returns the average discount rate applied to each product category
-- Tables used:
--   - Sales.SalesOrderDetail
--   - Production.Product
--   - Production.ProductSubcategory
--   - Production.ProductCategory

SELECT 
    pc.Name AS Category,
    AVG(CAST(sod.UnitPriceDiscount AS FLOAT) / NULLIF(sod.UnitPrice + sod.UnitPriceDiscount, 0)) AS AvgDiscountRate
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE sod.UnitPrice + sod.UnitPriceDiscount > 0
GROUP BY pc.Name
ORDER BY AvgDiscountRate DESC;