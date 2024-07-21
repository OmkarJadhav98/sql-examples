-- Create the database
CREATE DATABASE CompanyDB;

-- Use the created database
USE CompanyDB;

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
    (87, 'Operations');

-- Insert sample data into the employee table with Indian names
INSERT INTO employee (emp_id, name, city, dept_id)
VALUES 
    (1, 'Rajesh', 'Pune', 1);

INSERT INTO employee (emp_id, name, city, dept_id, manager_id)
VALUES 
    (2, 'Deepak', 'Mumbai', 3, 1),
    (3, 'Sunita', 'Pune', 5, 1),
    (4, 'Anjali', 'Delhi', 7, 1),
    (5, 'Karan', 'Kolkata', 15, 1),
    (6, 'Ravi', 'Bengaluru', 365, 1),
    (7, 'Meera', 'Ahmedabad', 87, 1);

-- Select employees along with their managers
SELECT emp.emp_id, emp.name AS 'Employee Name', emp.city, manager.name AS 'Manager' 
FROM employee emp
JOIN employee manager ON manager.emp_id = emp.manager_id;

-- Select employees with their departments and managers
SELECT emp.emp_id, emp.name AS 'Employee Name', emp.city, dept.name AS 'Department Name', manager.name AS 'Manager'
FROM department dept
JOIN employee emp ON dept.dept_id = emp.dept_id
JOIN employee manager ON manager.emp_id = emp.manager_id;