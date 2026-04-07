CREATE DATABASE IF NOT EXISTS sportswear;
USE sportswear;

-- The color table contains the following columns:
-- id stores the unique ID for each color.
-- name stores the name of the color.
-- extra_fee stores the extra charge (if any) added for clothing ordered in this color

CREATE TABLE IF NOT EXISTS Color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    extra_fee DECIMAL(10, 2) DEFAULT 0.00
);

-- In the customer table, you'll find the following columns:
-- ● id stores customer IDs.
-- ● first_name stores the customer's first name.
-- ● last_name stores the customer's last name.
-- ● favorite_color_id stores the ID of the customer's favorite color (references the color table).
-- ● city stores the city of the customer where he/she’s staying.

CREATE TABLE IF NOT EXISTS Customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    favorite_color_id INT,
    city VARCHAR(100),
    FOREIGN KEY (favorite_color_id) REFERENCES Color(id)
);

-- The category table contains these columns:
-- ● id stores the unique ID for each category.
-- ● name stores the name of the category. Ex: ‘mens_jeans’, ‘mens_tshirt’..
-- ● parent_id stores the ID of the main category for this category (if it's a subcategory). If this value is NULL, it denotes that this category is a main category. Note: Values are related to those in the id column in this table.

CREATE TABLE IF NOT EXISTS Category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES Category(id)
);

-- The item table stores data in the following columns:
-- ● id stores the unique ID for each item.
-- ● name stores the name of that item.
-- ● size stores the size of that clothing: S, M, L, XL, 2XL, or 3XL.
-- ● price stores the item's selling price
-- ● margin stores the margin on the item. Gives the margin amount on the buying price. (margin = buying price - price)
-- ● color_id stores the item's color (references the color table).
-- ● category_id stores the item's category (references the category table).

CREATE TABLE IF NOT EXISTS Item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    size ENUM('S', 'M', 'L', 'XL', '2XL', '3XL') NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    margin DECIMAL(10, 2) NOT NULL,
    color_id INT,
    category_id INT,
    FOREIGN KEY (color_id) REFERENCES Color(id),
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

-- The order table contains the following columns:
-- ● id stores the order ID. A person can order multiple items in a single order.
-- ● customer_id stores the ID of the customer ordering the clothes (references the customer table).
-- ● item_id stores the ID of the item ordered (references the clothing table).
-- ● item_cnt stores how many of that clothing item the customer ordered.
-- ● store_id stores the id of the city where the item is bought by the customer.
-- ● order_channel tells if the order is through online or store based. Can be ‘Online’ or ‘Store’
-- ● day_dt stores the date of the order.

CREATE TABLE IF NOT EXISTS Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    item_id INT,
    item_cnt INT,
    store_id INT,
    order_channel ENUM('Online', 'Store') NOT NULL,
    day_dt DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (item_id) REFERENCES Item(id)
);

-- The store table contains the following columns:
-- ● id stores the unique store ID.
-- ● city stores the city where the store is present

CREATE TABLE IF NOT EXISTS Store (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) NOT NULL
);


-- INSERTING DUMY DATA TO EACH TABLE
INSERT INTO Color (id, name, extra_fee) VALUES
(1, 'Blue', 0.00),
(2, 'Black', 5.00),
(3, 'Red', 7.50);

INSERT INTO Customer (id, first_name, last_name, favorite_color_id, city) VALUES
(1, 'Aarav', 'Sharma', 1, 'Mumbai'),
(2, 'Neha', 'Patel', 3, 'Mumbai'),
(3, 'Vikram', 'Singh', 2, 'Pune');

INSERT INTO Category (id, name, parent_id) VALUES
(1, 'mens_jeans', NULL),
(2, 'mens_shirts', NULL),
(3, 'slim_fit', 1),
(4, 'casual', 2);

INSERT INTO Item (id, name, size, price, margin, color_id, category_id) VALUES
(1, 'Blue Denim Jeans', 'L', 1999.00, 700.00, 1, 1),
(2, 'Black Formal Shirt', 'M', 1499.00, 500.00, 2, 2),
(3, 'Red Slim Fit Jeans', 'XL', 1799.00, 650.00, 3, 1);

INSERT INTO Store (id, city) VALUES
(1, 'Mumbai'),
(2, 'Pune');

INSERT INTO Orders (id, customer_id, item_id, item_cnt, store_id, order_channel, day_dt) VALUES
(1, 1, 1, 1, 1, 'Store', '2026-04-01'),
(2, 3, 2, 2, 2, 'Online', '2026-04-02');


-- Exercise 1 : Display the name of clothing items ( item name ), their color (color name), and the last name and first name of the customer(s) who bought the apparel in their favorite color in ‘Mumbai’ city through store transactions in the ‘mens_jeans’ category. Sort rows according to color, in ascending order.
SELECT
    i.name AS item_name,
    c.name AS color_name,
    cu.last_name,
    cu.first_name
FROM Orders o
JOIN Customer cu ON cu.id = o.customer_id
JOIN Item i ON i.id = o.item_id
JOIN Color c ON c.id = i.color_id
JOIN Category cat ON cat.id = i.category_id
JOIN Store s ON s.id = o.store_id
WHERE cu.city = 'Mumbai'
AND o.order_channel = 'Store'
AND cat.name = 'mens_jeans'
AND i.color_id = cu.favorite_color_id
ORDER BY c.name ASC;

-- Exercise 2 : Select the last name and first name of customers and the name of their favorite color for customers with no purchases.
SELECT
    cu.last_name,
    cu.first_name,
    c.name AS favorite_color
FROM Customer cu
LEFT JOIN Color c ON c.id = cu.favorite_color_id
LEFT JOIN Orders o ON o.customer_id = cu.id
WHERE o.id IS NULL;

-- Exercise 3 : Select the name of the main categories (which have a NULL in the parent_id column) and the name of their direct subcategory (if one exists). Name the first column category and the second column subcategory.
SELECT
    p.name AS category,
    c.name AS subcategory
FROM Category p
LEFT JOIN Category c ON c.parent_id = p.id
WHERE p.parent_id IS NULL;