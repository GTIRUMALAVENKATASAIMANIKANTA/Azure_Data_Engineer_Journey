/*
RetailOps360 — Day 01
SQL Server Fundamentals

Day 1 covered database creation, table creation,
INSERT, SELECT, primary keys and data validation.

The setup examples below are historical references.
This runnable script only reads existing data.
*/

-- Original learning examples:
-- CREATE DATABASE RetailOps360;
--
-- CREATE TABLE dbo.customers (
--     customer_id INT NOT NULL PRIMARY KEY,
--     customer_name NVARCHAR(100) NOT NULL,
--     city NVARCHAR(100) NULL
-- );
--
-- INSERT INTO dbo.customers
-- (customer_id, customer_name, city)
-- VALUES (101, N'RAVI', N'MANGALAGIRI');

USE RetailOps360;
GO

-- 01. Verify database
SELECT DB_NAME() AS current_database;
GO

-- 02. Retrieve customers
SELECT customer_id, customer_name, city
FROM dbo.customers
ORDER BY customer_id;
GO

-- 03. Filter customers
SELECT customer_id, customer_name, city
FROM dbo.customers
WHERE city = N'MANGALAGIRI';
GO

-- 04. Pattern matching
SELECT customer_id, customer_name
FROM dbo.customers
WHERE customer_name LIKE N'%A%';
GO

-- 05. Count customers
SELECT COUNT(*) AS total_customers
FROM dbo.customers;
GO

-- 06. Inspect table structure
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = N'dbo'
  AND TABLE_NAME = N'customers'
ORDER BY ORDINAL_POSITION;
GO
