create database Project_Retail; --Data base creation
use Project_Retail;
CREATE TABLE consumer360_raw (  --Table Creation
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
