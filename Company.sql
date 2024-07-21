-- Creating the database
CREATE DATABASE CompanyDB;

-- Using the newly created database
USE CompanyDB;

-- Creating the department table with primary key constraint
CREATE TABLE department (
    dept_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    building_name VARCHAR(70)
);

-- Inserting records into the department table
INSERT INTO department (dept_id, name, building_name) 
VALUES 
(1, 'Sales', 'Sales Commodity Complex'),
(2, 'Purchase', 'Purchases Commodity Complex'),
(3, 'HR', 'HR Building');

-- Selecting all records from the department table
SELECT * FROM department;

-- Altering the table to add a new column
ALTER TABLE department
ADD COLUMN location VARCHAR(75);

-- Inserting records with the new column
INSERT INTO department (dept_id, name, building_name, location) 
VALUES 
(4, 'Research and Development', 'R&D Building', 'Bangalore'),
(5, 'Support', 'Support Center', 'Chennai');

-- Updating a specific record
UPDATE department
SET location = 'Kolkata'
WHERE dept_id = 4 AND name = 'Research and Development';

-- Selecting records with dept_id 4 and name 'Research and Development'
SELECT * FROM department 
WHERE dept_id = 4 AND name = 'Research and Development';

-- Counting the total number of records in the department table
SELECT count(*) FROM department;

-- Grouping by name and counting total departments, having count greater than 1
SELECT name, count(*) as total_dept_count
FROM department
GROUP BY name
HAVING total_dept_count > 1;

-- Selecting distinct department names
SELECT DISTINCT(name) FROM department;

-- Selecting records with dept_id greater than 2
SELECT * FROM department WHERE dept_id > 2;

-- Deleting a specific record
DELETE FROM department WHERE dept_id = 5;

-- Selecting all records after deletion
SELECT * FROM department;

-- Truncating the table (removing all records)
TRUNCATE TABLE department;

-- Selecting all records after truncation
SELECT * FROM department;

-- Dropping the newly added column
ALTER TABLE department
DROP COLUMN location;

-- Dropping the department table
DROP TABLE department;

-- Recreating the department table
CREATE TABLE department (
    dept_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    building_name VARCHAR(70)
);

-- Re-inserting records into the department table
INSERT INTO department (dept_id, name, building_name) 
VALUES 
(1, 'Sales', 'Sales Commodity Complex'),
(2, 'Purchase', 'Purchases Commodity Complex');

-- Selecting all records from the department table
SELECT * FROM department;

-- Inserting a new record
INSERT INTO department (dept_id, name, building_name) 
VALUES (1001, 'Support 123', 'Northport');