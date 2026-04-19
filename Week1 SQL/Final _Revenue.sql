-- Calculate total revenue grouped by customer country
SELECT
 c.Country,  -- Customer's country from dimension table
-- Aggregate total revenue for each country
 SUM(f.revenue) AS TotalSales
FROM fact_sales f
-- Join fact table with customer dimension to get country information
JOIN dim_customer c
ON f.CustomerID = c.CustomerID
-- Group results by country to get country-wise revenue
GROUP BY c.Country;
