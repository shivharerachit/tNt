-- DDL (Data Definition Language) command (CREATE DATABASE) to create a database
CREATE DATABASE e_commerce;

-- Selecting the database to use 
USE e_commerce;

-- DDL command (CREATE TABLE) to create a table in a database
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    mobile VARCHAR(15)
);

CREATE TABLE Products (
    id INT,
    name VARCHAR(50) NOT NULL, 
    description VARCHAR(200),
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50)
);

-- DDL command (ALTER TABLE) to Modify Tables in the DATABASE
ALTER TABLE Customers
MODIFY name VARCHAR(50) NOT NULL,
MODIFY email VARCHAR(50) NOT NULL;

ALTER TABLE Customers
MODIFY email VARCHAR(50) NOT NULL UNIQUE;

ALTER TABLE Customers
ADD COLUMN age INT;

ALTER TABLE Products
CHANGE id product_id INT;