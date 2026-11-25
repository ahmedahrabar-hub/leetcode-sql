-- 181. Employees Earning More Than Their Managers (Easy)
-- https://leetcode.com/problems/employees-earning-more-than-their-managers/
-- Topic: self join
-- Dialect: MySQL

SELECT e.name AS Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE m.salary < e.salary;

-- Interview notes
-- Q: What is a self join?
-- A: A normal join of a table to itself, using two different aliases.
-- Q: INNER JOIN or LEFT JOIN?
-- A: INNER JOIN: an employee without a manager has nobody to compare with.
--    LEFT JOIN gives the same result here, because comparing a salary with
--    NULL is UNKNOWN and WHERE removes the row.
-- Q: What would ON e.id = m.id do?
-- A: Match each employee with themselves, so nobody would earn more.
-- Q: Can the salary condition go in ON?
-- A: Yes, with INNER JOIN the result is the same. ON for the link and WHERE
--    for the filter is easier to read.
