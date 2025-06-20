-- Check the maximum discount rate per category to validate the ranges
SELECT 
    pc.Name AS Category,
    MAX(CAST(sod.UnitPriceDiscount AS FLOAT) / NULLIF(sod.UnitPrice + sod.UnitPriceDiscount, 0)) AS MaxDiscountRate
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE sod.UnitPrice + sod.UnitPriceDiscount > 0
GROUP BY pc.Name
ORDER BY MaxDiscountRate DESC;