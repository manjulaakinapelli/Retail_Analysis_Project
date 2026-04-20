-- ============================================
-- Database Creation
-- ============================================

-- Create a new database for Retail Analysis Project
CREATE database Project_Retail; 

-- Select the database to work on
use Project_Retail;

-- ============================================
-- Raw Data Table Creation
-- ============================================

-- Create raw table to store unprocessed retail data
-- All columns are initially defined with flexible data types
-- to allow smooth CSV import without errors
CREATE TABLE consumer360_raw (  
    InvoiceNo     VARCHAR(50),  -- Unique invoice/transaction number
    ProductCode   VARCHAR(50),  -- Product identifier
    ProductName   VARCHAR(255),  -- Name of the product
    Quantity      INT,   -- Number of units purchased
    InvoiceDate   VARCHAR(50),   -- Stored as text initially (for safe import)
    UnitPrice     DECIMAL(18,2),  -- Price per unit
    CustomerID    INT,   -- Customer identifier
    Country       VARCHAR(100),  -- Customer location
    PaymentMethod VARCHAR(50)  -- Payment method used
);

-- ============================================
-- Preview Raw Data
-- ============================================

-- View data after import
SELECT * FROM consumer360_raw;
