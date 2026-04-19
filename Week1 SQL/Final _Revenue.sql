-- Calculate total revenue grouped by customer country
SELECT
c.Country,  -- Customer's country from dimension table
-- Aggregate total revenue for each country
SUM(f.revenue) AS TotalSales
FROM fact_sales f
JOIN dim_customer c
ON f.CustomerID = c.CustomerID
GROUP BY c.Country;
