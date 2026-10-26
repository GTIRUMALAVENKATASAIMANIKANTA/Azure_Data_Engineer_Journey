/*
Project: RetailOps360
Module: SQL and Database Development
Day 03: SQL Aggregations and Sales Reporting

Environment: Local Microsoft SQL Server
Purpose: Reusable, read-only retail sales reporting queries

Note:
Order amount totals are not necessarily recognized revenue.
Financial reporting requires approved business rules.
*/

USE RetailOps360;
GO

-- 01. Total orders and total order amount
SELECT
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_order_amount
FROM dbo.orders;
GO

-- 02. Delivered orders summary
SELECT
    COUNT(*) AS delivered_orders,
    SUM(order_amount) AS delivered_order_amount,
    AVG(order_amount) AS avg_delivered_amount
FROM dbo.orders
WHERE order_status = N'DELIVERED';
GO

-- 03. Minimum and maximum order amounts
SELECT
    MIN(order_amount) AS lowest_order_amount,
    MAX(order_amount) AS highest_order_amount
FROM dbo.orders;
GO

-- 04. Status-wise order report
SELECT
    order_status,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_amount
FROM dbo.orders
GROUP BY order_status
ORDER BY order_status ASC;
GO

-- 05. Customer-wise status report
SELECT
    customer_id,
    order_status,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_amount
FROM dbo.orders
GROUP BY customer_id, order_status
ORDER BY customer_id, order_status;
GO

-- 06. Statuses with multiple orders
SELECT
    order_status,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_amount
FROM dbo.orders
GROUP BY order_status
HAVING COUNT(*) > 1
ORDER BY order_status;
GO

-- 07. Final challenge DE-206
-- Customers with non-cancelled order totals >= 1000
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_amount
FROM dbo.orders
WHERE order_status <> N'CANCELLED'
GROUP BY customer_id
HAVING SUM(order_amount) >= 1000
ORDER BY customer_id ASC;
GO
