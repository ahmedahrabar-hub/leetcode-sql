-- 1581. Customer Who Visited but Did Not Make Any Transactions (Easy)
-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
-- Topic: anti join, GROUP BY, COUNT
-- Dialect: MySQL

SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON t.visit_id = v.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- Interview notes
-- Q: Why COUNT(*)?
-- A: Each remaining row is one visit, so we count rows. COUNT(column) skips
--    NULLs: COUNT(t.transaction_id) would return 0 here.
-- Q: Can a visit with several transactions distort the count?
-- A: No. The join repeats it, but WHERE removes all its rows.
-- Q: Why is the NULL test in WHERE and not in HAVING?
-- A: It is a condition on individual rows, so it must run before grouping.
--    HAVING filters whole groups after aggregation.
