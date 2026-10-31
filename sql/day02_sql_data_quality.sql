/*
RetailOps360 — Day 02
SQL Filtering, Sorting and Data Quality

Read-only learning script.
*/

USE RetailOps360;
GO

-- 01. SELECT with aliases
SELECT
    customer_name AS Customer,
    city AS Customer_City
FROM dbo.customers;
GO

-- 02. WHERE filtering
SELECT *
FROM dbo.customers
WHERE city = N'VIJAYAWADA';
GO

-- 03. Comparison operators
SELECT *
FROM dbo.customers
WHERE customer_id > 101;
GO

-- 04. AND and OR
SELECT *
FROM dbo.customers
WHERE (city = N'GUNTUR'
       OR city = N'VIJAYAWADA')
  AND customer_id > 101;
GO

-- 05. NOT operator
SELECT *
FROM dbo.customers
WHERE NOT (city = N'GUNTUR');
GO

-- 06. ORDER BY
SELECT customer_id, customer_name, city
FROM dbo.customers
ORDER BY city ASC, customer_id DESC;
GO

-- 07. DISTINCT
SELECT DISTINCT city
FROM dbo.customers
ORDER BY city ASC;
GO

-- 08. COUNT DISTINCT
SELECT COUNT(DISTINCT city) AS unique_cities
FROM dbo.customers;
GO

-- 09. Identify actual NULL values
SELECT *
FROM dbo.customers
WHERE city IS NULL;
GO

-- 10. Identify non-NULL values
SELECT *
FROM dbo.customers
WHERE city IS NOT NULL;
GO

-- 11. LEN and DATALENGTH investigation
SELECT
    customer_id,
    customer_name,
    LEN(city) AS character_length,
    DATALENGTH(city) AS bytes_used
FROM dbo.customers
WHERE customer_id IN (107, 108);
GO

-- 12. Data quality counts
SELECT
    COUNT(*) AS total_customers,
    COUNT(city) AS non_null_cities,
    COUNT(DISTINCT city) AS unique_cities
FROM dbo.customers;
GO

-- 13. Final Data Quality Challenge
-- Identify NULL and empty-string cities.
-- Whitespace-only values need additional checks.
SELECT
    customer_id,
    customer_name,
    city
FROM dbo.customers
WHERE city IS NULL
   OR DATALENGTH(city) = 0
ORDER BY customer_id;
GO
