-- 1378. Replace Employee ID With The Unique Identifier (Easy)
-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
-- Topic: LEFT JOIN
-- Dialect: MySQL

SELECT u.unique_id, i.name
FROM Employees i
LEFT JOIN EmployeeUNI u ON u.id = i.id;

-- Interview notes
-- Q: Why LEFT JOIN?
-- A: Every employee must appear, including those without a unique ID, who get
--    NULL. INNER JOIN would remove them.
-- Q: Does the order inside ON matter?
-- A: No. u.id = i.id and i.id = u.id are the same condition.
-- Q: Can the LEFT JOIN return more rows than Employees?
-- A: Yes, if an employee matches several rows in EmployeeUNI.
