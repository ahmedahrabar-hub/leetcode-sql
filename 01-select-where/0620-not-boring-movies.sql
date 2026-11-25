-- 620. Not Boring Movies (Easy)
-- https://leetcode.com/problems/not-boring-movies/
-- Topic: WHERE, NULL-safe comparison, MOD, ORDER BY
-- Dialect: MySQL

SELECT *
FROM Cinema
WHERE NOT (description <=> 'boring')
  AND MOD(id, 2) = 1
ORDER BY rating DESC;

-- Interview notes
-- Q: Why <=> instead of description <> 'boring'?
-- A: If description is NULL, <> gives UNKNOWN and the row is lost. With <=>,
--    the comparison is FALSE and NOT makes it TRUE, so the row is kept.
-- Q: Is <=> portable?
-- A: Not everywhere. PostgreSQL uses description IS DISTINCT FROM 'boring'.
--    Portable form: (description IS NULL OR description <> 'boring').
-- Q: Why are the parentheses needed in the portable form?
-- A: AND is evaluated before OR.
-- Q: Why avoid SELECT * in a pipeline?
-- A: Columns may be added or reordered, and reading unused ones can cost more.
--    Naming columns makes the expected output explicit.
-- Q: Is MOD(id, 2) = 1 always enough to find odd numbers?
-- A: Not for negative ones in MySQL: MOD(-7, 2) is -1. Use <> 0.
