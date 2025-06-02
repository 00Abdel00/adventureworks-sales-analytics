-- Calculates average discount percentage per product
-- Assumes: UnitPrice × OrderQty = full price
-- LineTotal = actual paid after discount

SELECT 
    p.Name AS ProductName,
    AVG(
        CASE 
            WHEN sod.UnitPrice * sod.OrderQty = 0 THEN 0
            ELSE 1 - (sod.LineTotal / (sod.UnitPrice * sod.OrderQty))
        END
    ) AS AverageDiscount
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY AverageDiscount DESC;