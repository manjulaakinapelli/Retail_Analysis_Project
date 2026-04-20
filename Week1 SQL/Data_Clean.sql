-- ============================================
-- Data Cleaning & Standardization Script
-- ============================================

-- Disable safe update mode to allow updates without key constraints
SET SQL_SAFE_UPDATES = 0;

-- --------------------------------------------
-- Handle NULL and invalid CustomerID values
-- --------------------------------------------
UPDATE consumer360_raw
SET CustomerID = NULL
WHERE CustomerID = ' ' OR CustomerID = 0;

-- Verify changes
select CustomerID from consumer360_raw;

-- --------------------------------------------
-- Remove invalid transactions (negative/zero quantity)
-- --------------------------------------------
DELETE FROM consumer360_raw
WHERE Quantity <= 0;

-- Verify Quantity
select Quantity from consumer360_raw;

-- --------------------------------------------
-- Handle missing Product Names
-- --------------------------------------------
UPDATE consumer360_raw
SET ProductName = 'Unknown'
WHERE ProductName IS NULL OR ProductName = '';

-- Verify ProductName
select ProductName from consumer360_raw;

-- --------------------------------------------
-- Date Formatting (Convert to ISO DATE format)
-- --------------------------------------------
DESC consumer360_raw;

-- Add new column for formatted date
ALTER TABLE consumer360_raw
ADD InvoiceDate_new DATE;

-- Convert string date to DATE format
UPDATE consumer360_raw
SET InvoiceDate_new =
STR_TO_DATE(InvoiceDate,'%m/%d/%Y');

-- Verify conversion
SELECT InvoiceDate, InvoiceDate_new FROM consumer360_raw
LIMIT 10;

-- Check invalid date formats
SELECT InvoiceDate FROM consumer360_raw
WHERE STR_TO_DATE(InvoiceDate,'%m/%d/%Y') IS NULL;
SELECT DISTINCT InvoiceDate
FROM consumer360_raw
LIMIT 20;

-- --------------------------------------------
-- Revenue Calculation
-- --------------------------------------------
ALTER TABLE consumer360_raw
ADD Revenue DECIMAL(10,2);
UPDATE consumer360_raw
SET Revenue = Quantity * UnitPrice;

select Revenue from consumer360_raw;

-- --------------------------------------------
-- Handle missing Country values
-- --------------------------------------------
UPDATE consumer360_raw
SET Country = 'Unknown'
WHERE Country IS NULL OR Country = '';
select Country from consumer360_raw;

-- --------------------------------------------
-- Handle missing PaymentMethod values
-- --------------------------------------------
UPDATE consumer360_raw
SET PaymentMethod = 'Unknown'
WHERE PaymentMethod IS NULL OR PaymentMethod = '';
select PaymentMethod from consumer360_raw;

-- --------------------------------------------
-- Remove invalid pricing records
-- --------------------------------------------
DELETE FROM consumer360_raw
WHERE UnitPrice <= 0;
select UnitPrice from consumer360_raw;

-- --------------------------------------------
-- Trim extra spaces from text columns
-- --------------------------------------------
UPDATE consumer360_raw
SET
ProductName = TRIM(ProductName),
Country = TRIM(Country),
PaymentMethod = TRIM(PaymentMethod);

-- --------------------------------------------
-- Final cleaned dataset preview
-- --------------------------------------------
select * from consumer360_raw;
