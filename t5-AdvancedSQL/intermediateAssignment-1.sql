-- a. Find products priced higher than the average price in their category. Order By category ascending and price descending using Subquery.
SELECT  product_id,
        name,
        price,
        category
FROM products p1
WHERE price > (
    SELECT AVG(price)
    FROM products p2
    WHERE p2.category = p1.category
)
ORDER BY category ASC, price DESC;

-- b. Get products that are more expensive than any 'Furniture' category product using Subquery.
SELECT  product_id,
        name,
        price,
        category
FROM products p1
WHERE price > (
    SELECT MAX(price)
    FROM products p2
    WHERE p2.category = 'Furniture'
);

-- c. Create a stored procedure to apply a discount on a specific category of products.
DELIMITER //
CREATE PROCEDURE ApplyCategoryDiscount(IN category_name VARCHAR(255), IN discount_percentage DECIMAL(5,2))
BEGIN
    UPDATE products
    SET price = price - ((discount_percentage * price) / 100)
    WHERE category = category_name;
END //
DELIMITER ;

-- d. Create a trigger to update a customer's total spending whenever they place a new order.
ALTER TABLE Customers
ADD COLUMN total_spending DECIMAL(10,2)
DEFAULT 0.00;

UPDATE Customers c
SET total_spending = ( 
    SELECT COALESCE(SUM(total_amount), 0)
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);

DELIMITER //

CREATE TRIGGER AfterOrderInsert
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    UPDATE Customers
    SET total_spending = total_spending + NEW.total_amount
    WHERE customer_id = NEW.customer_id;
END //

DELIMITER ;

-- e. Retrieve all customers along with their latest order details, showing "No orders placed" if no orders exist. Using COALESCE.
SELECT * , COALESCE((
    SELECT CONCAT('Order ID: ', o.order_id, ', Product ID: ', o.product_id, ', Quantity: ', o.quantity, ', Order Date: ', o.order_date)
    FROM Orders o
    WHERE o.customer_id = c.customer_id
    ORDER BY order_date DESC
    LIMIT 1
), 'No orders placed') AS OrderDetails
FROM Customers c
ORDER BY c.customer_id; 

-- f. Find customers whose email and mobile number are the same. If they are the same, return NULL instead of duplicate values.
SELECT 
    customer_id,
    name,
    CASE
        WHEN email = mobile THEN NULL
        ELSE email
    END AS email,
    CASE
        WHEN email = mobile THEN NULL
        ELSE mobile
    END AS mobile
FROM Customers;

-- g. Categorize orders based on total amount spent:
    -- i. Low Value: Less than $100
    -- ii. Medium Value: $100 - $500
    -- iii. High Value: More than $500
SELECT  
    order_id,
    total_amount,
    CASE 
        WHEN total_amount < 100 THEN 'Low Value'
        WHEN total_amount BETWEEN 100 AND 500 THEN 'Medium Value'
        ELSE 'High Value'
    END AS order_category
FROM Orders;

-- h. Find the number of orders placed per month.
SELECT 
    MONTH(order_date) AS order_month,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY MONTH(order_date)
ORDER BY order_month;

-- i. Replace all 0 values in a column discount with NULL.
ALTER TABLE Orders
ADD COLUMN discount DECIMAL(10,2)
DEFAULT 0.00;

SELECT 
    order_id,
    total_amount,
    CASE 
        WHEN discount = 0 THEN NULL 
        ELSE discount 
    END AS discount
FROM Orders;

-- j. Divide total_amount by quantity but avoid division by zero using NULLIF.
SELECT 
    product_id,
    quantity,
    total_amount,
    CASE
        WHEN quantity = 0 THEN NULL
        ELSE total_amount / quantity
    END AS price_per_piece
FROM Orders;

-- k. Count non-zero values in a column score.
SELECT COUNT(NULLIF(score, 0)) AS non_zero_score_count
FROM XYZ;

-- l. Calculate average salary excluding rows where salary = 0.
SELECT AVG(NULLIF(salary, 0)) AS average_salary
FROM employees;

-- m. Find percentage contribution of each row (value / total_value) safely handling zero totals.
SELECT value/COALESCE(NULLIF(SUM(total_value), 0), 1) AS percentage_contribution
FROM XYZ;

-- n. Convert empty strings ('') in a column email to NULL.
SELECT 
    customer_id,
    name,
    NULLIF(email, '') AS email
FROM Customers;

-- o. Identify rows where two columns start_date and end_date are equal using NULLIF.
SELECT *, NULLIF(start_date, end_date) AS same_dates
FROM XYZ;

-- p. Use NULLIF inside an aggregation to ignore specific values (e.g., exclude -1 from avg).
SELECT AVG(NULLIF(a, -1))
FROM xyz;

-- q. Replace a value only when two columns match (hint: combine NULLIF + CASE).
SELECT 
    val1,
    val2,
    CASE 
        WHEN NULLIF(val1, val2) = NULL THEN val1 + val2
        ELSE 0
    END AS modified_value
FROM xyz;