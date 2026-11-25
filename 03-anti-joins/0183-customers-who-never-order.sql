-- 183. Customers Who Never Order (Easy)
-- https://leetcode.com/problems/customers-who-never-order/
-- Topic: anti join (LEFT JOIN + IS NULL, NOT EXISTS)
-- Dialect: MySQL

-- Solution 1: LEFT JOIN + IS NULL
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON o.customerId = c.id
WHERE o.id IS NULL;

-- Solution 2: NOT EXISTS
SELECT c.name AS Customers
FROM Customers c
WHERE NOT EXISTS (
  SELECT o.customerId
  FROM Orders o
  WHERE o.customerId = c.id
);

-- Interview notes
-- Q: Why test o.id and not c.id?
-- A: c.id comes from the kept (left) table, so it is never NULL. o.id is NULL
--    exactly when no order matched.
-- Q: Why the primary key of Orders rather than another column?
-- A: A primary key is never NULL in a real row, so NULL can only mean no match.
-- Q: Does it matter what the NOT EXISTS subquery selects?
-- A: No. It only checks whether a row exists. SELECT 1 is the usual convention.
-- Q: Why is NOT IN dangerous for this problem?
-- A: If one customerId in the subquery is NULL, NOT IN is never TRUE, so no
--    customer is returned. NOT EXISTS does not have this problem.
