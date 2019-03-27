
-- COPYRIGHT: https://stackoverflow.com/questions/46811887/mysql-join-two-tables-and-limit-and-order-both-of-them

SELECT n.newsId, n.text as newsText, n.date as newsDate, p.text as commentText, p.date as commentDate
FROM News n
LEFT JOIN (SELECT c.* FROM Comments C
           LEFT JOIN Comments c1 ON(c.newsId = c1.newsId and c1.date > c.date)
           WHERE c1.date IS NULL) P
 ON (p.newsId = N.newsId)
ORDER BY N.date DESC
LIMIT 10;
