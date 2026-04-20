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
    InvoiceNo     VARCHAR(50),
    ProductCode   VARCHAR(50),
    ProductName   VARCHAR(255),
    Quantity      INT,
    InvoiceDate   VARCHAR(50),   -- keep as text for safe import
    UnitPrice     DECIMAL(18,2),
    CustomerID    INT,
    Country       VARCHAR(100),
    PaymentMethod VARCHAR(50)
);
SELECT * FROM consumer360_raw;
