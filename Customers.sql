CREATE DATABASE CustomerDB;

USE CustomerDB;

CREATE TABLE Customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    place VARCHAR(100) NOT NULL
);

INSERT INTO Customers (id, name, place) VALUES
 
