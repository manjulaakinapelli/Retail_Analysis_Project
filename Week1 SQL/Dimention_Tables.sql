--Dimention table Creation
--Product Table
CREATE TABLE dim_product AS
SELECT DISTINCT
    ProductCode,
    ProductName
FROM consumer360_raw;

SELECT ProductCode, COUNT(*)
FROM dim_product
GROUP BY ProductCode
HAVING COUNT(*) > 1;

DROP TABLE dim_product;

CREATE TABLE dim_product AS
SELECT
    ProductCode,
    MAX(ProductName) AS ProductName
FROM consumer360_raw
WHERE ProductCode IS NOT NULL
GROUP BY ProductCode;
SELECT COUNT(*) FROM dim_product;
SELECT COUNT(DISTINCT ProductCode) FROM dim_product;


ALTER TABLE dim_product
ADD PRIMARY KEY (ProductCode);

--Customer Table
CREATE TABLE dim_customer AS
SELECT DISTINCT
    CustomerID,
    Country,
    PaymentMethod
FROM consumer360_raw;

SELECT CustomerID, COUNT(*)
FROM dim_customer
GROUP BY CustomerID
HAVING COUNT(*) > 1;

DROP TABLE dim_customer;

CREATE TABLE dim_customer AS
SELECT
    CustomerID,
    MAX(Country) AS Country,
    MAX(PaymentMethod) AS PaymentMethod
FROM consumer360_raw
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;
SELECT COUNT(*) FROM dim_customer;
SELECT COUNT(DISTINCT CustomerID) FROM dim_customer;
ALTER TABLE dim_customer
ADD PRIMARY KEY (CustomerID);

