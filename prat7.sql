-- Pratimas 7

-- 1.
	-- Pakoreguoti Book_v2.sql faila, kad Books ir Authors lenteles butu:
            ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE utf8_lithuanian_ci;
    -- Is naujo sukurti abi lenteles su teisingais nustatytmais:
            mysql> SOURCE /home/dalius/NFQ/Paskaitos/p3-sql/Book_v2.sql;
    -- Sukurti nauja tarpine lentele:
            CREATE TABLE authors_books(author_id INT, book_id INT, FOREIGN KEY(author_id) REFERENCES Author(authorId)  ON            DELETE RESTRICT ON UPDATE CASCADE , FOREIGN KEY (book_id) REFERENCES Books(bookId) ON DELETE RESTRICT ON                UPDATE CASCADE  ) ENGINE InnoDB;
    -- Suvesti jungiamuosius duomenis i tarpine lentele ivedant pasikartojanciu id:
            INSERT INTO authors_books (author_id, book_id) VALUES (1,1), (2,2), (4,3), (6,4), (7,5), (8,9), (1,14),                 (2,14), (7,4);
    -- Pabandymui gauti irasus su pasikartojanciais autoriais/knygomis:
            SELECT Authors.*, Books.* FROM Authors LEFT JOIN authors_books ON Authors.authorId = authors_books.author_id LEFT JOIN Books ON authors_books.book_id = Books.bookId WHERE Books.bookId = 4;
            SELECT Authors.*, Books.* FROM Authors LEFT JOIN authors_books ON Authors.authorId = authors_books.author_id LEFT JOIN Books ON authors_books.book_id = Books.bookId WHERE Authors.authorId = 1;

-- 2.
    -- Istrinti nereikalinga stulpeli:
        ALTER TABLE Books DROP COLUMN authorId;

-- 3.
	SELECT Books.*, GROUP_CONCAT(name) as Authors FROM Books LEFT JOIN authors_books ON Books.bookId = authors_books.book_id LEFT JOIN Authors ON Authors.authorId = authors_books.author_id GROUP BY bookId;

-- 4. 
	-- Atlikta punkte 1.
