-- 185. Department Top Three Salaries (Hard)
-- https://leetcode.com/problems/department-top-three-salaries/
-- Topic: window functions, DENSE_RANK, PARTITION BY, top N per group
-- Dialect: MySQL 8+

WITH t AS (
  SELECT name AS Employee,
         salary AS Salary,
         departmentId,
         DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
  FROM Employee
)
SELECT d.name AS Department, t.Employee, t.Salary
FROM Department d
JOIN t ON t.departmentId = d.id
WHERE t.rnk <= 3;

-- Interview notes
-- Q: Difference from 184?
-- A: Two changes: DENSE_RANK instead of RANK, and rnk <= 3 instead of rnk = 1.
-- Q: Why DENSE_RANK for "top 3 unique salaries"?
-- A: On 90, 85, 85, 70: RANK gives 1,2,2,4 (70 lost), DENSE_RANK gives
--    1,2,2,3 (70 kept). DENSE_RANK counts distinct values, with no gaps.
-- Q: Why does GROUP BY + MAX not work here?
-- A: MAX gives only the 1st salary per group. Top N needs a ranking.
-- Q: Solution without window functions (MySQL 5.7)?
-- A: Correlated subquery: keep e if fewer than 3 distinct salaries in its
--    department are higher:
--    WHERE (SELECT COUNT(DISTINCT e2.salary) FROM Employee e2
--           WHERE e2.departmentId = e.departmentId
--             AND e2.salary > e.salary) < 3
