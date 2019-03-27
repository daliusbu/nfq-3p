-- Table structure for table `Authors`
-- ----------------------------------

-- DROP TABLE IF EXISTS `Authors`;
CREATE TABLE IF NOT EXISTS `Authors` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;


-- Table structure for table `Books`
-- ---------------------------------

-- DROP TABLE IF EXISTS `Books`;
CREATE TABLE IF NOT EXISTS `Books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `year` year(4) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;


-- Procedure for deleting column if they exist
drop procedure if exists schema_change;

delimiter ';;'
create procedure schema_change() begin
    if exists (select * from information_schema.columns where table_schema = schema() and table_name = 'Books' and column_name = 'authorId') then
        alter table `Books` drop column `authorId`;
    end if;
end;;

delimiter ';'
call schema_change();
drop procedure if exists schema_change;


-- Table structure for table `authors_books`
-- ----------------------------------------

-- DROP TABLE IF EXISTS `authors_books`;
CREATE TABLE IF NOT EXISTS `authors_books` (
  `author_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  KEY `author_id` (`author_id`),
  KEY `authors_books_ibfk_1` (`book_id`),
  CONSTRAINT `authors_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`bookId`) ON UPDATE CASCADE,
  CONSTRAINT `authors_books_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`authorId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
