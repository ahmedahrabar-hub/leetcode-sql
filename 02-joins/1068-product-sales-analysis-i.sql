-- 1068. Product Sales Analysis I (Easy)
-- https://leetcode.com/problems/product-sales-analysis-i/
-- Topic: JOIN, foreign key
-- Dialect: MySQL

SELECT p.product_name, s.year, s.price
FROM Sales s
LEFT JOIN Product p ON p.product_id = s.product_id;

-- Interview notes
-- Q: INNER JOIN or LEFT JOIN?
-- A: With an enforced, non-null foreign key, every sale has a product, so both
--    give the same rows and INNER JOIN states that more clearly. Without that
--    guarantee, LEFT JOIN keeps the sales whose product is missing.
-- Q: Can this join duplicate sales?
-- A: No, if product_id is unique in Product: each sale matches at most one.
-- Q: When can USING (product_id) replace ON?
-- A: When the linking column has the same name in both tables.
