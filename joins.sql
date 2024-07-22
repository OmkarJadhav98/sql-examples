-- Use the database
USE CompanyDB;

-- Drop the department table if it already exists
DROP TABLE IF EXISTS department;

-- Create the department table
CREATE TABLE department (
    dept_id INTEGER PRIMARY KEY,
    name VARCHAR(128)
);

-- Insert sample data into the department table
INSERT INTO department (dept_id, name)
VALUES 
    (1, 'HR'),
    (3, 'Finance'),
    (5, 'IT'),
    (7, 'Marketing'),
    (15, 'Sales'),
    (365, 'Engineering'),
    (87, 'Operations'),
    (100, 'Support');

-- Drop the employee table if it already exists
DROP TABLE IF EXISTS employee;

-- Create the employee table
CREATE TABLE employee (
    emp_id INTEGER PRIMARY KEY,
    name VARCHAR(128),
    city VARCHAR(56),
    dept_id INTEGER,
    manager_id INTEGER,
    FOREIGN KEY(dept_id) REFERENCES department(dept_id),
    FOREIGN KEY(manager_id) REFERENCES employee(emp_id)
);

-- Insert sample data into the employee table with Indian names
INSERT INTO employee (emp_id, name, city, dept_id)
VALUES 
    (1, 'Rajesh', 'Pune', 1);

INSERT INTO employee (emp_id, name, city, dept_id, manager_id)
VALUES 
    (2, 'Deepak', 'Mumbai', 3, 1),
    (3, 'Sunita', 'Pune', 100, 1),
    (4, 'Anjali', 'Delhi', 7, 1),
    (5, 'Karan', 'Kolkata', 15, 1),
    (6, 'Ravi', 'Bengaluru', 365, 1),
    (7, 'Meera', 'Ahmedabad', 87, 1);

-- Select all records from the department table
SELECT * FROM department;

-- Select all records from the employee table
SELECT * FROM employee;

-- Fetch list of employees where employee id is less than 5 and working in Pune and working in department named 'Support'
SELECT e.emp_id, e.name, e.city, d.name AS 'Department Name'
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE e.emp_id < 5 AND e.city = 'Pune' AND d.name = 'Support';

-- CROSS JOIN
SELECT * FROM department CROSS JOIN employee;

-- INNER JOIN
SELECT e.emp_id, e.name AS 'Employee Name', e.city, d.name AS 'Department Name'
FROM department d
JOIN employee e ON d.dept_id = e.dept_id
WHERE e.city = 'Mumbai';

-- LEFT JOIN
SELECT e.emp_id, e.name AS 'EmpName', e.city, d.name AS 'Dept Name'
FROM department d
LEFT JOIN employee e ON d.dept_id = e.dept_id;

-- RIGHT JOIN
SELECT e.emp_id, e.name AS 'EmpName', e.city, d.name AS 'Dept Name'
FROM department d
RIGHT JOIN employee e ON d.dept_id = e.dept_id;
