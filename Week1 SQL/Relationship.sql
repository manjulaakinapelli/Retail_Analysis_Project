-- Create relationships between fact_slaes and dimention tables
-- Link ProductCode in fact_sales to dim_product table

ALTER TABLE fact_sales
ADD CONSTRAINT fk_product
FOREIGN KEY (ProductCode)
REFERENCES dim_product(ProductCode);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_customer
FOREIGN KEY (CustomerID)
REFERENCES dim_customer(CustomerID);

--Create index on CustomerID to imrove quality performance
CREATE INDEX idx_customer
ON fact_sales(CustomerID);

--Create index on ProductCode to imrove quality performance
CREATE INDEX idx_product
ON fact_sales(ProductCode);

--Create index on InvoiceDate to improvr speed up date based queries
CREATE INDEX idx_date
ON fact_sales(InvoiceDate);

SHOW TABLES;
