-- 596. Classes With at Least 5 Students (Easy)
-- https://leetcode.com/problems/classes-with-at-least-5-students/
-- Topic: GROUP BY, HAVING
-- Dialect: MySQL

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;

-- Interview notes
-- Q: Why not WHERE COUNT(*) >= 5?
-- A: Logical order is FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY.
--    WHERE runs before groups exist, so it cannot count. HAVING filters groups.
-- Q: "at least 5" vs "more than 5"?
-- A: >= 5 vs > 5. A first try with > 5 passed the example (Math has 6) but
--    would drop a class with exactly 5.
-- Q: COUNT(*) or COUNT(DISTINCT student)?
-- A: (student, class) is the primary key, so no duplicates: COUNT(*) is safe.
--    With possible duplicates, use COUNT(DISTINCT student).
