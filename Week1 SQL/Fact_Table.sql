-- Create fact_sales table from raw transactional data (consumer360_raw)
-- This table acts as the central fact table for sales analysis
CREATE TABLE fact_sales AS
SELECT
    InvoiceNo,  -- Unique identifier for each transaction
    ProductName, -- Name of the product sold
    ProductCode,  -- Product identifier (used for joins with product dimension)
    CustomerID,
    Quantity,
    UnitPrice,
    Revenue,
    PaymentMethod,
    Country,
    InvoiceDate
FROM consumer360_raw;

select * from fact_sales;
