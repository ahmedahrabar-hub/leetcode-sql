-- 184. Department Highest Salary (Medium)
-- https://leetcode.com/problems/department-highest-salary/
-- Topic: window functions, PARTITION BY, top N per group, CTE
-- Dialect: MySQL 8+

WITH t AS (
  SELECT name AS Employee,
         salary AS Salary,
         departmentId,
         RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
  FROM Employee
)
SELECT d.name AS Department, t.Employee, t.Salary
FROM Department d
JOIN t ON t.departmentId = d.id
WHERE t.rnk = 1;

-- Interview notes
-- Q: GROUP BY departmentId vs PARTITION BY departmentId?
-- A: GROUP BY merges each department into one row (names are lost).
--    PARTITION BY restarts the window per department but keeps every row.
-- Q: Why RANK/DENSE_RANK and not ROW_NUMBER?
-- A: Ties must all be returned (Jim and Max both earn 90000). ROW_NUMBER
--    would give them 1 and 2 and drop one of them.
-- Q: Why a CTE?
-- A: The rank is computed in SELECT, after WHERE, so it can only be filtered
--    in an outer query.
-- Q: Quoting a column named rank?
-- A: RANK is reserved in MySQL 8. Use backticks (`rank`), not double quotes
--    (a string in default MySQL), or pick a safe name such as rnk. After a
--    qualifier, t.rank is accepted, but a safe name avoids the question.
-- Pattern: "top N per group" = rank with PARTITION BY in a CTE, then
--    WHERE rnk <= N.
