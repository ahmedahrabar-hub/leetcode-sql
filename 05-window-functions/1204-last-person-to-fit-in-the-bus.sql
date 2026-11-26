-- 1204. Last Person to Fit in the Bus (Medium)
-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/
-- Topic: window functions, running total, CTE, LIMIT
-- Dialect: MySQL 8+

WITH t AS (
  SELECT person_name,
         SUM(weight) OVER (ORDER BY turn) AS total
  FROM Queue
)
SELECT person_name
FROM t
WHERE total <= 1000
ORDER BY total DESC
LIMIT 1;

-- Interview notes
-- Q: Why a CTE? Why not WHERE total <= 1000 directly?
-- A: Window functions are computed in SELECT, after WHERE. The CTE computes
--    total first, then the outer query filters it like a normal column.
-- Q: What does SUM() OVER (ORDER BY turn) compute?
-- A: A running total. The default frame is RANGE BETWEEN UNBOUNDED PRECEDING
--    AND CURRENT ROW: each row sums itself and all rows before it.
-- Q: ROWS vs RANGE?
-- A: RANGE treats ties in the ORDER BY column as one block (same total);
--    ROWS counts physical rows one by one. turn is unique, so both match here.
-- Q: ORDER BY total DESC or ORDER BY turn DESC?
-- A: Both work because weights are positive, so total always grows with turn.
--    ORDER BY turn DESC states the intent ("last to board") more directly.
-- Q: Why LIMIT 1 is safe here?
-- A: Sorted DESC, the last person who fits comes first; LIMIT keeps only them.
