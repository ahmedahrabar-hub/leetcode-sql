-- 175. Combine Two Tables (Easy)
-- https://leetcode.com/problems/combine-two-tables/
-- Topic: LEFT JOIN
-- Dialect: MySQL

SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;

-- Interview notes
-- Q: Why LEFT JOIN?
-- A: Every person must appear, even without an address.
-- Q: What would WHERE a.city IS NULL do?
-- A: It would keep only rows with no city, removing everyone with a known one.
-- Q: How do you find the people with no address at all?
-- A: Keep WHERE a.addressId IS NULL after the LEFT JOIN. It is the primary key,
--    so it is NULL only when there is no match; city can be NULL in a real row.
-- Q: Is there always one row per person?
-- A: Only if each person has at most one address.
