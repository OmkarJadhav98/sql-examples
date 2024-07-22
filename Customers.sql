CREATE DATABASE CustomerDB;

USE CustomerDB;

CREATE TABLE Customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    place VARCHAR(100) NOT NULL
);

INSERT INTO Customers (id, name, place) VALUES
 (1, 'Alice Johnson', 'New York'),
 (2, 'Bob Smith', 'Los Angeles'),
 (3, 'Charlie Brown', 'Chicago'),
 (4, 'Diana Prince', 'San Francisco'),
 (5, 'Evan Wright', 'Houston'),
 (6, 'Fiona Davis', 'Boston'),
 (7, 'George Harris', 'Seattle'),
 (8, 'Hannah Lee', 'Denver'),
 (9, 'Ian Clark', 'Miami'),
 (10, 'Julia Adams', 'Dallas'),
 (11, 'Kevin Parker', 'Phoenix'),
 (12, 'Laura Scott', 'San Diego'),
 (13, 'Michael Young', 'Las Vegas'),
 (14, 'Nina King', 'Atlanta'),
 (15, 'Oliver Roberts', 'Orlando'),
 (16, 'Paula Green', 'Philadelphia'),
 (17, 'Quentin Turner', 'Portland'),
 (18, 'Rachel Campbell', 'San Antonio'),
 (19, 'Samuel Lewis', 'Austin'),
 (20, 'Tina Walker', 'Columbus');
