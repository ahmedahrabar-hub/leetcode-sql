-- 1148. Article Views I (Easy)
-- https://leetcode.com/problems/article-views-i/
-- Topic: WHERE, DISTINCT, ORDER BY
-- Dialect: MySQL

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id ASC;

-- Interview notes
-- Q: Why is DISTINCT needed?
-- A: An author can view their own articles several times.
-- Q: Can it be done without DISTINCT?
-- A: Yes, with GROUP BY author_id. Prefer it when a calculation such as
--    COUNT(*) is also needed.
-- Q: Can ORDER BY use the alias id? Can WHERE?
-- A: ORDER BY can, because it is processed after SELECT. WHERE cannot,
--    because it is processed before SELECT.
-- Q: What does SELECT DISTINCT a, b remove?
-- A: Duplicate (a, b) pairs: DISTINCT applies to the whole result row.
