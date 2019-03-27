-- Pratimas 4

-- 1.
	SELECT Authors.name, COUNT(Books.authorId) FROM Authors LEFT JOIN Books ON Authors.authorId = Books.authorId GROUP BY Authors.name;
	SELECT Authors.authorId, Authors.name, COUNT(Books.authorId) FROM Authors RIGHT JOIN Books ON Authors.authorId = Books.authorId GROUP BY Authors.name ORDER BY authorId;

-- 2.
	DELETE Authors FROM Authors LEFT JOIN Books ON Authors.authorId = Books.authorId WHERE Books.authorId IS NULL;
