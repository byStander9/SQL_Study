-- Create database
CREATE DATABASE jdbc_db;

-- Show existing databases
SHOW DATABASES;

-- Delete database
DROP DATABASE jdbc_db;

-- Specify current using database
USE jdbc_db;

-- Create table
CREATE TABLE mem (
	num INT NOT NULL,
    id CHAR(15) NOT NULL,
    name CHAR(10) NOT NULL,
    sex CHAR(1),
    post_num CHAR(8),
	address CHAR(80),
    tel CHAR(20),
    age INT,
    PRIMARY KEY(num)
);

-- Show existing tables in current database
SHOW TABLES;

-- Select all rows&columns in database
SELECT * FROM mem;

CREATE TABLE friend (
	num INT NOT NULL,
    name CHAR(10),
    address CHAR(80),
    tel CHAR(20),
    PRIMARY KEY(num)
);

-- Show parameters of table
DESC friend;

-- Delete table
DROP TABLE friend;


-- Create table using AUTO_INCREMENT
CREATE TABLE friend_auto (
	num INT NOT NULL AUTO_INCREMENT,
    name CHAR(10),
    address CHAR(80),
    tel CHAR(20),
    PRIMARY KEY(num)
);

INSERT INTO friend_auto VALUES (1, '홍길동', '서울', '234-8879');
-- Insert NULL into primary key(automatically insert 2 into primary key(num))book
INSERT INTO friend_auto VALUES (NULL, '정길동', '춘천', '334-7368');

-- Select multiple column
SELECT id, name, age FROM mem;

-- Use 'DISTINCT' to select duplicated column once
SELECT DISTINCT name FROM mem;
