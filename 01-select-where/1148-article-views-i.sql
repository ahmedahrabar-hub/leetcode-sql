-- 1148. Article Views I (Easy)
-- https://leetcode.com/problems/article-views-i/
-- Topic: WHERE, DISTINCT, ORDER BY
-- Dialect: MySQL

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id ASC;
