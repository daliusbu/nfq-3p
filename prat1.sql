-- 1.
SELECT Authors.* FROM Authors;

-- 2.
SELECT title FROM Books ORDER BY title;

-- 3.
SELECT authorId, COUNT(*) FROM Books GROUP BY authorId;
