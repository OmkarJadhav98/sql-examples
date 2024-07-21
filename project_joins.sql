-- Create Tables

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Insert Sample Data

INSERT INTO Customers (customer_id, name, email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Sam Brown', 'sam@example.com');

INSERT INTO Orders (order_id, customer_id, order_date) VALUES
(1, 1, '2024-07-01'),
(2, 1, '2024-07-02'),
(3, 2, '2024-07-03'),
(4, 3, '2024-07-04');

INSERT INTO Products (product_id, name, price) VALUES
(1, 'Pizza', 10.99),
(2, 'Burger', 7.99),
(3, 'Soda', 1.99),
(4, 'Pasta', 12.99);

INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 3, 1, 1),
(5, 4, 4, 2);

-- INNER JOIN Example
-- Retrieve a list of customers and their orders.
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- LEFT JOIN Example
-- Retrieve a list of all customers and their orders, including customers who haven't placed any orders.
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- RIGHT JOIN Example
-- Retrieve a list of all orders and their associated customers, including orders without customers.
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- FULL OUTER JOIN Example
-- Retrieve a list of all customers and their orders, including customers without orders and orders without customers.
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- Complex Join Example
-- Retrieve detailed order information including customer name, order date, product name, and quantity.
SELECT Customers.name AS customer_name, Orders.order_date, Products.name AS product_name, OrderDetails.quantity
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
INNER JOIN OrderDetails ON Orders.order_id = OrderDetails.order_id
INNER JOIN Products ON OrderDetails.product_id = Products.product_id;

-- CROSS JOIN Example
-- Retrieve a list of all possible combinations of customers and products.
SELECT Customers.name AS customer_name, Products.name AS product_name
FROM Customers
CROSS JOIN Products;

-- SELF JOIN Example
-- Retrieve a list of customers who have the same email domain.
SELECT C1.name AS customer1, C2.name AS customer2, C1.email
FROM Customers C1
INNER JOIN Customers C2 ON C1.customer_id != C2.customer_id AND 
                           SUBSTRING_INDEX(C1.email, '@', -1) = SUBSTRING_INDEX(C2.email, '@', -1);

-- NATURAL JOIN Example
-- Retrieve a list of orders and their details, assuming column names are consistent across tables.
-- Note: This example assumes that Orders and OrderDetails have a common column name, e.g., "order_id".
SELECT *
FROM Orders
NATURAL JOIN OrderDetails;

-- OUTER JOIN with COALESCE Example
-- Retrieve a list of all orders with their products, including orders with no products, and show 'No Product' if none.
SELECT Orders.order_id, COALESCE(Products.name, 'No Product') AS product_name
FROM Orders
LEFT JOIN OrderDetails ON Orders.order_id = OrderDetails.order_id
LEFT JOIN Products ON OrderDetails.product_id = Products.product_id;
