-- 577. Employee Bonus (Easy)
-- https://leetcode.com/problems/employee-bonus/
-- Topic: LEFT JOIN, ON vs WHERE, NULL
-- Dialect: MySQL

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;

-- Interview notes
-- Q: What happens if b.bonus < 1000 is moved into ON?
-- A: An employee with a bonus of 2000 has no match, but LEFT JOIN keeps the
--    employee with NULL. The result is wrong: they look like they have no bonus.
-- Q: What happens with WHERE b.bonus < 1000 alone?
-- A: Employees with no bonus are lost: NULL < 1000 is UNKNOWN, and WHERE keeps
--    only TRUE.
-- Q: Does moving the filter from ON to WHERE change an INNER JOIN?
-- A: No. INNER JOIN does not keep unmatched rows, so both give the same result.
-- Q: Which is processed first, ON or WHERE?
-- A: Logically, the join and its ON, then WHERE.
