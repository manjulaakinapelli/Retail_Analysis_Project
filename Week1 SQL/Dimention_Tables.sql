-- ============================================
-- Dimension Table Creation
-- ============================================

-- Create Product Dimension Table from raw data
CREATE TABLE dim_product AS
SELECT DISTINCT
    ProductCode,  -- Unique product identifier
    ProductName -- Product name
FROM consumer360_raw;

-- Check for duplicate ProductCode entries
SELECT ProductCode, COUNT(*)
FROM dim_product
GROUP BY ProductCode
HAVING COUNT(*) > 1;

-- Drop table to recreate after handling duplicates
DROP TABLE dim_product;

-- Recreate Product Dimension with unique ProductCode
-- Using MAX(ProductName) to resolve duplicate entries

CREATE TABLE dim_product AS
SELECT
    ProductCode,
    MAX(ProductName) AS ProductName
FROM consumer360_raw
WHERE ProductCode IS NOT NULL
GROUP BY ProductCode;

-- Validate row counts
SELECT COUNT(*) FROM dim_product;
SELECT COUNT(DISTINCT ProductCode) FROM dim_product;

-- Add Primary Key to ensure uniqueness
ALTER TABLE dim_product
ADD PRIMARY KEY (ProductCode);


-- ============================================
-- Customer Dimension Table
-- ============================================

-- Create Customer Dimension Table
CREATE TABLE dim_customer AS
SELECT DISTINCT
    CustomerID,  -- Unique customer identifier
    Country,  -- Customer location
    PaymentMethod  -- Preferred payment method
FROM consumer360_raw;

-- Check for duplicate CustomerID entries

SELECT CustomerID, COUNT(*)
FROM dim_customer
GROUP BY CustomerID
HAVING COUNT(*) > 1;

-- Drop table to recreate after handling duplicates
DROP TABLE dim_customer;

-- Recreate Customer Dimension with unique CustomerID
-- Using MAX() to resolve duplicate attribute values

CREATE TABLE dim_customer AS
SELECT
    CustomerID,
    MAX(Country) AS Country,
    MAX(PaymentMethod) AS PaymentMethod
FROM consumer360_raw
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;

-- Validate row counts
SELECT COUNT(*) FROM dim_customer;
SELECT COUNT(DISTINCT CustomerID) FROM dim_customer;

-- Add Primary Key to enforce uniqueness
ALTER TABLE dim_customer
ADD PRIMARY KEY (CustomerID);

