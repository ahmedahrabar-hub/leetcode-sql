-- 584. Find Customer Referee (Easy)
-- https://leetcode.com/problems/find-customer-referee/
-- Topic: WHERE, NULL
-- Dialect: MySQL

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;

-- Interview notes
-- Q: Why is referee_id != 2 not enough alone?
-- A: When referee_id is NULL, NULL != 2 is UNKNOWN, and WHERE keeps only TRUE.
-- Q: Why does the OR version keep NULL rows?
-- A: IS NULL is TRUE, and TRUE OR UNKNOWN is TRUE.
-- Q: Is there another way in MySQL?
-- A: WHERE NOT (referee_id <=> 2). The NULL-safe operator <=> never returns
--    UNKNOWN. PostgreSQL equivalent: referee_id IS DISTINCT FROM 2.
-- Q: Does NOT (referee_id = 2) work?
-- A: No. For NULL it gives NOT UNKNOWN, which is still UNKNOWN.
