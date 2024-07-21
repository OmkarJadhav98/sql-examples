-- Creating the database
CREATE DATABASE SchoolDB;

-- Using the newly created database
USE SchoolDB;

-- Creating the marks table
CREATE TABLE marks (
    id INTEGER,
    name VARCHAR(120),
    marathi INTEGER,
    english INTEGER,
    maths INTEGER
);

-- Inserting sample data into the marks table
INSERT INTO marks (id, name, marathi, english, maths) VALUES
(1, 'Alice', 85, 90, 95),
(2, 'Bob', 78, 85, 88),
(3, 'Charlie', 92, 88, 84),
(4, 'David', 76, 81, 79),
(5, 'Eve', 89, 94, 91),
(6, 'Frank', 95, 87, 92),
(7, 'Grace', 83, 80, 85),
(8, 'Hank', 77, 75, 78),
(9, 'Ivy', 84, 89, 90),
(10, 'Jack', 91, 86, 83);

-- Selecting all records from the marks table
SELECT * FROM marks;

-- Selecting the maximum value in the marathi column
SELECT max(marathi) FROM marks;

-- Selecting the minimum value in the marathi column
SELECT min(marathi) FROM marks;

-- Selecting the top 3 records with the highest marathi marks
SELECT * FROM marks ORDER BY marathi DESC LIMIT 3;

-- Selecting the record with the lowest marathi marks
SELECT * FROM marks ORDER BY marathi ASC LIMIT 1;

-- Calculating the average marks for marathi, english, and maths
SELECT AVG(marathi), AVG(english), AVG(maths) FROM marks;

-- Selecting all columns and the dense rank based on marathi marks
SELECT *, dense_rank() OVER(ORDER BY marathi DESC)  FROM marks;

-- Selecting records with pagination (25 records starting from the 36th record)
SELECT * FROM marks LIMIT 25 OFFSET 35;