-- This query calculates the percentage of uncategorized products that were never sold.

SELECT 
    -- Count of DISTINCT uncategorized products that do not appear in any sales orders
    COUNT(DISTINCT CASE 
        WHEN sod.ProductID IS NULL THEN p.ProductID 
    END) * 1.0 /
    
    -- Total number of uncategorized products
    COUNT(*) AS Share_Never_Sold_Uncategorized

FROM Production.Product AS p

-- Perform a LEFT JOIN with sales data to retain all products (even if unsold)
LEFT JOIN Sales.SalesOrderDetail AS sod 
    ON p.ProductID = sod.ProductID

-- Filter to only products with no assigned subcategory
WHERE p.ProductSubcategoryID IS NULL;