ALTER TABLE fact_sales
ADD CONSTRAINT fk_product
FOREIGN KEY (ProductCode)
REFERENCES dim_product(ProductCode);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_customer
FOREIGN KEY (CustomerID)
REFERENCES dim_customer(CustomerID);

CREATE INDEX idx_customer
ON fact_sales(CustomerID);

CREATE INDEX idx_product
ON fact_sales(ProductCode);

CREATE INDEX idx_date
ON fact_sales(InvoiceDate);

SHOW TABLES;
