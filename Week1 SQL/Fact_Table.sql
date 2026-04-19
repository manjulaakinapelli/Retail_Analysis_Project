-- Create fact_sales table from raw transactional data (consumer360_raw)
-- This table acts as the central fact table for sales analysis
CREATE TABLE fact_sales AS
SELECT
    InvoiceNo,  -- Unique identifier for each transaction
    ProductName, -- Name of the product sold
    ProductCode,  -- Product identifier (used for joins with product dimension)
    CustomerID, -- Unique customer identifier (used for joins with customer dimension)
    Quantity, -- Number of units sold
    UnitPrice, -- Price per unit
    Revenue,   -- Total revenue (Quantity * UnitPrice)
    PaymentMethod,  -- Mode of payment used by customer
    Country,   -- Customer location
    InvoiceDate -- Date of transaction (used for time-based analysis)
FROM consumer360_raw;

select * from fact_sales;
