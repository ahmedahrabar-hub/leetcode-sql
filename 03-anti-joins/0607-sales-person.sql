-- 607. Sales Person (Easy)
-- https://leetcode.com/problems/sales-person/
-- Topic: anti join (NOT EXISTS, correlated subquery)
-- Dialect: MySQL

SELECT s.name
FROM SalesPerson s
WHERE NOT EXISTS (
  SELECT 1
  FROM Orders o
  JOIN Company c ON c.com_id = o.com_id
  WHERE c.name = 'RED'
    AND o.sales_id = s.sales_id
);

-- Interview notes
-- Q: Why does LEFT JOIN + WHERE c.name <> 'RED' fail?
-- A: WHERE filters one row at a time. Pam has a RED order and a YELLOW order:
--    the RED row is removed but the YELLOW row keeps her. "Never sold to RED"
--    is about all of a person's rows, so it needs an anti join.
-- Q: What happens without AND o.sales_id = s.sales_id?
-- A: The subquery asks "is there any RED order at all?". The answer is yes for
--    everyone, so NOT EXISTS is always false and the result is empty.
-- Q: Why is Amy (no orders) returned without a LEFT JOIN?
-- A: Her subquery finds 0 rows, so NOT EXISTS is true.
-- Q: NOT IN version?
-- A: WHERE s.sales_id NOT IN (SELECT o.sales_id ... WHERE c.name = 'RED') works
--    here, but returns nothing if the list contains a NULL. NOT EXISTS is safe.
