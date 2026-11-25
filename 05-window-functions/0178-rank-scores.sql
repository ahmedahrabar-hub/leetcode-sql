-- 178. Rank Scores (Medium)
-- https://leetcode.com/problems/rank-scores/
-- Topic: window functions, ranking
-- Dialect: MySQL 8+

SELECT score,
       DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`
FROM Scores
ORDER BY score DESC;

-- Interview notes
-- Q: ROW_NUMBER vs RANK vs DENSE_RANK on 90, 90, 80?
-- A: 1,2,3 / 1,1,3 / 1,1,2. "No gap after a tie" means DENSE_RANK.
-- Q: Window function vs GROUP BY?
-- A: GROUP BY merges rows. A window function keeps every row and adds a value
--    computed over a window of rows. The table is never modified.
-- Q: Is the final ORDER BY needed if the output already looks sorted?
-- A: Yes. ORDER BY inside OVER only defines how the rank is computed. MySQL
--    happens to output sorted rows as a side effect; SQL does not guarantee it.
-- Q: Why backticks around rank?
-- A: RANK is a reserved word in MySQL 8.
