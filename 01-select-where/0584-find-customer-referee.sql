-- 584. Find Customer Referee (Easy)
-- https://leetcode.com/problems/find-customer-referee/
-- Topic: WHERE, NULL
-- Dialect: MySQL

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;
