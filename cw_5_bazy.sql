
SELECT COUNT(OrderQuantity) AS count, OrderDate FROM dbo.FactInternetSales GROUP BY OrderDate HAVING COUNT(OrderQuantity) < 100 ORDER BY count DESC



SELECT * FROM (SELECT OrderDate, ProductKey, MAX(UnitPrice) AS UnitPrice, ROW_NUMBER() OVER ( PARTITION BY OrderDate ORDER BY MAX(UnitPrice) DESC) AS rn
FROM AdventureWorksDW2019.dbo.FactInternetSales
GROUP BY OrderDate, ProductKey ) AS order_by_price
WHERE rn <= 3
 