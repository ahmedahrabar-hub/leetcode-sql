-- 595. Big Countries (Easy)
-- https://leetcode.com/problems/big-countries/
-- Topic: WHERE, OR
-- Dialect: MySQL

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;

-- Interview notes
-- Q: Why >= and not >?
-- A: "At least" includes the limit itself.
-- Q: Can this be written with UNION?
-- A: Yes, one query per condition. A country meeting both appears once with
--    UNION, but twice with UNION ALL.
-- Q: Which is cheaper, UNION or UNION ALL?
-- A: Usually UNION ALL, because it does not remove duplicates.
