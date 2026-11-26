-- 176. Second Highest Salary (Medium)
-- https://leetcode.com/problems/second-highest-salary/
-- Topic: scalar subquery, DISTINCT, LIMIT/OFFSET, LEAD, chained CTEs
-- Dialect: MySQL 8+

-- Solution 1 (accepted): LEAD on distinct salaries, inside a scalar subquery
SELECT (
  WITH s AS (SELECT DISTINCT salary FROM Employee),
       t AS (SELECT salary,
                    LEAD(salary) OVER (ORDER BY salary DESC) AS nxt
             FROM s)
  SELECT nxt
  FROM t
  ORDER BY salary DESC
  LIMIT 1
) AS SecondHighestSalary;

-- Solution 2: classic LIMIT/OFFSET
SELECT (
  SELECT DISTINCT salary
  FROM Employee
  ORDER BY salary DESC
  LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

-- Solution 3: DENSE_RANK (extends to the Nth highest)
SELECT (
  SELECT DISTINCT salary
  FROM (SELECT salary,
               DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
        FROM Employee) r
  WHERE rnk = 2
) AS SecondHighestSalary;

-- Interview notes
-- Q: Why DISTINCT?
-- A: With 100, 100 the 2nd row is the same salary; the 2nd highest DISTINCT
--    salary does not exist, so the answer is NULL. (First try failed here.)
-- Q: Why wrap in SELECT ( ... ) with no FROM?
-- A: A SELECT without FROM always returns exactly 1 row. A scalar subquery
--    that finds no row becomes NULL, so an empty table gives 1 row with NULL
--    instead of 0 rows. (Second try failed on the empty table.)
-- Q: Scalar subquery rules?
-- A: 1 value -> that value; 0 rows -> NULL; more than 1 row -> error.
-- Q: Several CTEs?
-- A: One WITH, then CTEs separated by commas; a later CTE can use an earlier one.
-- Q: Why ORDER BY in the outer query and not inside the CTE?
-- A: Only the final ORDER BY guarantees order; the one inside a CTE can be ignored.
