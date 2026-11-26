-- 180. Consecutive Numbers (Medium)
-- https://leetcode.com/problems/consecutive-numbers/
-- Topic: window functions, LAG / LEAD, CTE, DISTINCT
-- Dialect: MySQL 8+

WITH t AS (
  SELECT id,
         num,
         LAG(num)  OVER (ORDER BY id) AS prev,
         LEAD(num) OVER (ORDER BY id) AS nxt
  FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM t
WHERE num = prev AND num = nxt;

-- Interview notes
-- Q: What do LAG and LEAD return?
-- A: The value from the previous / next row in the OVER (ORDER BY ...) order.
--    No such row -> NULL (or the 3rd argument: LAG(col, n, default)).
-- Q: Why does WHERE num = prev = next fail?
-- A: It is read as (num = prev) = next. (num = prev) is a boolean, 1 or 0,
--    so -1,-1,-1 gives 1 = -1 -> false. It only passes when the number is 1.
--    First submission: 11/23. Always write separate comparisons with AND.
-- Q: Why DISTINCT?
-- A: A number repeated 4 times in a row matches on 2 middle rows.
-- Q: What about the first and last rows?
-- A: prev or next is NULL, NULL = x is UNKNOWN, so WHERE drops them. Correct,
--    since they cannot be the middle of 3.
-- Q: LAG vs self-join on id - 1?
-- A: The self-join breaks if ids have gaps; LAG uses the real previous row.
