CREATE TABLE fact_sales AS
SELECT
    InvoiceNo,
    ProductName,
    ProductCode,
    CustomerID,
    Quantity,
    UnitPrice,
    Revenue,
    PaymentMethod,
    Country,
    InvoiceDate
FROM consumer360_raw;

select * from fact_sales;