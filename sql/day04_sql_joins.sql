/*
Project: RetailOps360
Day 04: SQL JOINs and Data Reconciliation
Environment: Microsoft SQL Server 2025

Read-only reporting and validation exercises.
No INSERT, UPDATE, or DELETE statements.
*/

USE RetailOps360;
GO

-- 01. INNER JOIN: Customer order details
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_amount,
    o.order_status
FROM dbo.customers AS c
INNER JOIN dbo.orders AS o
    ON c.customer_id = o.customer_id
ORDER BY o.order_id;
GO

-- 02. INNER JOIN: Delivered orders only
SELECT
    c.customer_name,
    o.order_id,
    o.order_amount
FROM dbo.customers AS c
INNER JOIN dbo.orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = N'DELIVERED'
ORDER BY o.order_id;
GO

-- 03. LEFT JOIN: All customers
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM dbo.customers AS c
LEFT JOIN dbo.orders AS o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_id;
GO

-- 04. LEFT ANTI JOIN: Customers without orders
SELECT
    c.customer_id,
    c.customer_name
FROM dbo.customers AS c
LEFT JOIN dbo.orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;
GO

-- 05. LEFT JOIN: Delivered filter inside ON
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_status
FROM dbo.customers AS c
LEFT JOIN dbo.orders AS o
    ON c.customer_id = o.customer_id
   AND o.order_status = N'DELIVERED'
ORDER BY c.customer_id;
GO

-- 06. LEFT JOIN: Delivered filter inside WHERE
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_status
FROM dbo.customers AS c
LEFT JOIN dbo.orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = N'DELIVERED'
ORDER BY c.customer_id;
GO

-- 07. RIGHT JOIN: Preserve all customers
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM dbo.orders AS o
RIGHT JOIN dbo.customers AS c
    ON o.customer_id = c.customer_id
ORDER BY c.customer_id, o.order_id;
GO

-- 08. FULL OUTER JOIN: All matching and unmatched rows
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM dbo.customers AS c
FULL OUTER JOIN dbo.orders AS o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_id;
GO

-- 09. FULL OUTER JOIN: Unmatched records
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM dbo.customers AS c
FULL OUTER JOIN dbo.orders AS o
    ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL
   OR o.order_id IS NULL
ORDER BY c.customer_id, o.order_id;
GO

-- 10. CTE + UNION ALL: Simulated orphan order
-- Order 9999 is not inserted into the database.
;WITH sample_orders AS
(
    SELECT order_id, customer_id
    FROM dbo.orders

    UNION ALL

    SELECT 9999, 999
)
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.customer_id AS order_customer_id
FROM dbo.customers AS c
FULL OUTER JOIN sample_orders AS o
    ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL
   OR o.order_id IS NULL
ORDER BY c.customer_id, o.order_id;
GO
