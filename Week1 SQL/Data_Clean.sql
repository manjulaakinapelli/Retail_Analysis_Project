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

-- Handle negative quantities 
DELETE FROM consumer360_raw
WHERE Quantity <= 0;
select Quantity from consumer360_raw;

-- Fix inconsistent product names (missing values)
UPDATE consumer360_raw
SET ProductName = 'Unknown'
WHERE ProductName IS NULL OR ProductName = '';
select ProductName from consumer360_raw;

-- Date formatting (convert to ISO standard)
DESC consumer360_raw;
ALTER TABLE consumer360_raw
ADD InvoiceDate_new DATE;
UPDATE consumer360_raw
SET InvoiceDate_new =
STR_TO_DATE(InvoiceDate,'%m/%d/%Y');
SELECT InvoiceDate, InvoiceDate_new
FROM consumer360_raw
LIMIT 10;
SELECT InvoiceDate
FROM consumer360_raw
WHERE STR_TO_DATE(InvoiceDate,'%m/%d/%Y') IS NULL;
SELECT DISTINCT InvoiceDate
FROM consumer360_raw
LIMIT 20;

-- Revenue calculation
ALTER TABLE consumer360_raw
ADD Revenue DECIMAL(10,2);
UPDATE consumer360_raw
SET Revenue = Quantity * UnitPrice;

select Revenue from consumer360_raw;

-- Updated empty values with unknown
UPDATE consumer360_raw
SET Country = 'Unknown'
WHERE Country IS NULL OR Country = '';
select Country from consumer360_raw;

UPDATE consumer360_raw
SET PaymentMethod = 'Unknown'
WHERE PaymentMethod IS NULL OR PaymentMethod = '';
select PaymentMethod from consumer360_raw;

DELETE FROM consumer360_raw
WHERE UnitPrice <= 0;
select UnitPrice from consumer360_raw;

UPDATE consumer360_raw
SET
ProductName = TRIM(ProductName),
Country = TRIM(Country),
PaymentMethod = TRIM(PaymentMethod);

--CLeaned csv file
select * from consumer360_raw;
