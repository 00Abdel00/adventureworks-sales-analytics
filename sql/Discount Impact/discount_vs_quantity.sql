-- Calculates the average quantity ordered for different discount ranges ("bins")
-- Purpose: Understand how increasing discount rates affect average quantity ordered
-- Tables used:
--   - Sales.SalesOrderDetail

SELECT 
    CASE 
        WHEN DiscountRate = 0 THEN '0%'
        WHEN DiscountRate > 0 AND DiscountRate <= 0.01 THEN '0–1%'
        WHEN DiscountRate > 0.01 AND DiscountRate <= 0.02 THEN '1–2%'
        WHEN DiscountRate > 0.02 AND DiscountRate <= 0.05 THEN '2–5%'
        WHEN DiscountRate > 0.05 AND DiscountRate <= 0.10 THEN '5–10%'
        WHEN DiscountRate > 0.10 THEN '10%+'
    END AS DiscountBin,
    COUNT(*) AS OrdersInBin,
    AVG(OrderQty) AS AvgQuantity
FROM (
    SELECT 
        OrderQty,
        CAST(UnitPriceDiscount AS FLOAT) / NULLIF(UnitPrice + UnitPriceDiscount, 0) AS DiscountRate
    FROM Sales.SalesOrderDetail
    WHERE UnitPrice + UnitPriceDiscount >= 0
) AS DiscountData
GROUP BY 
    CASE 
        WHEN DiscountRate = 0 THEN '0%'
        WHEN DiscountRate > 0 AND DiscountRate <= 0.01 THEN '0–1%'
        WHEN DiscountRate > 0.01 AND DiscountRate <= 0.02 THEN '1–2%'
        WHEN DiscountRate > 0.02 AND DiscountRate <= 0.05 THEN '2–5%'
        WHEN DiscountRate > 0.05 AND DiscountRate <= 0.10 THEN '5–10%'
        WHEN DiscountRate > 0.10 THEN '10%+'
    END
ORDER BY DiscountBin;