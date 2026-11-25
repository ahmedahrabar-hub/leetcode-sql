-- 1683. Invalid Tweets (Easy)
-- https://leetcode.com/problems/invalid-tweets/
-- Topic: WHERE, string functions
-- Dialect: MySQL

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;

-- Interview notes
-- Q: LENGTH or CHAR_LENGTH?
-- A: In MySQL, LENGTH counts bytes and CHAR_LENGTH counts characters. In
--    UTF-8, a character takes 1 to 4 bytes. In PostgreSQL, LENGTH on text
--    counts characters.
-- Q: Can a normal index on content help?
-- A: Not to search by length: the index is organized by the text itself. An
--    indexed generated column storing the length can help.
-- Q: What if content is NULL?
-- A: CHAR_LENGTH(NULL) is NULL, and NULL > 15 is UNKNOWN, so WHERE removes
--    the row.
