--Join the tables
SELECT
c.Country,
SUM(f.revenue) AS TotalSales
FROM fact_sales f
JOIN dim_customer c
ON f.CustomerID = c.CustomerID
GROUP BY c.Country;
