-- 1757. Recyclable and Low Fat Products (Easy)
-- https://leetcode.com/problems/recyclable-and-low-fat-products/
-- Topic: SELECT, WHERE
-- Dialect: MySQL

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

-- Interview notes
-- Q: Why use = instead of LIKE here?
-- A: = compares an exact value. LIKE is for patterns using % or _.
-- Q: Why single quotes?
-- A: They are the standard for text. In PostgreSQL and Oracle, double quotes
--    name identifiers such as columns and tables.
-- Q: Would 'y' work instead of 'Y'?
-- A: It depends on the collation. MySQL's usual collations ignore case;
--    PostgreSQL is normally case-sensitive. Use the exact stored value.
