-- Pratimas 2

-- 1.
	INSERT INTO Authors (name) VALUES ('Haruki Murakami'), ('Jurga Ivanauskaite');

-- 2.
	INSERT INTO Books (authorId, title, year) VALUES (17, "Placebas", 1998), (16, "Norvegu giria", 2012);
   INSERT INTO Books SET authorId=16, title="1Q84", year=1984;

-- 3.
	UPDATE Books SET authorId=17 WHERE bookId=11;
