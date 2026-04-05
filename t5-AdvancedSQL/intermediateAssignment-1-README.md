# Intermediate SQL Assignment 1 - Query Documentation

## Overview
This document provides a comprehensive breakdown of all SQL queries in `intermediateAssignment-1.sql`. The file contains 17 queries (labeled a through q) that demonstrate intermediate to advanced SQL concepts including subqueries, stored procedures, triggers, and NULL handling functions.

## Database Tables Used
- **products**: Contains product_id, name, price, category
- **Customers**: Contains customer_id, name, email, mobile, total_spending
- **Orders**: Contains order_id, customer_id, product_id, quantity, order_date, total_amount, discount

---

## Query Breakdown

### Query A: Products Above Category Average (Subquery)
**Purpose**: Find products priced higher than the average price in their category, ordered by category ascending and price descending.

**Key Concepts**:
- Subquery in WHERE clause
- Self-join using table aliases
- ORDER BY with multiple columns

**Output**: product_id, name, price, category

---

### Query B: Products More Expensive Than Any Furniture Item (Subquery)
**Purpose**: Get all products that are more expensive than the maximum price of any 'Furniture' category product.

**Key Concepts**:
- Subquery with MAX aggregate function
- Category-specific filtering
- Comparison with aggregated value

**Output**: product_id, name, price, category

---

### Query C: Stored Procedure - Apply Category Discount
**Purpose**: Create a reusable stored procedure that applies a discount percentage to all products in a specific category.

**Key Concepts**:
- DELIMITER usage for stored procedures
- Parameters (IN): category_name, discount_percentage
- UPDATE statement with calculated values
- Formula: `price = price - ((discount_percentage * price) / 100)`

**Usage**: `CALL ApplyCategoryDiscount('Electronics', 10);`

---

### Query D: Trigger - Update Customer Total Spending
**Purpose**: Automatically update a customer's total spending whenever a new order is placed.

**Operations**:
1. Add `total_spending` column to Customers table
2. Initialize existing customer spending from past orders using COALESCE
3. Create trigger `AfterOrderInsert` that fires after each new order insert
4. Trigger updates total_spending by adding the new order's total_amount

**Key Concepts**:
- TRIGGER with AFTER INSERT event
- NEW keyword to reference newly inserted values
- Automatic data synchronization

---

### Query E: Customers with Latest Order Details (COALESCE)
**Purpose**: Retrieve all customers with their latest order information. Show "No orders placed" if no orders exist.

**Key Concepts**:
- COALESCE function for NULL handling
- Correlated subquery with ORDER BY DESC and LIMIT 1
- CONCAT function for string formatting
- Default text when no orders exist

**Output**: All customer columns + OrderDetails (shows order info or "No orders placed")

---

### Query F: Customers with Duplicate Email/Mobile (CASE)
**Purpose**: Find customers whose email and mobile number are the same. Return NULL for duplicate values instead of showing them.

**Key Concepts**:
- CASE statement for conditional logic
- NULL return when values match
- Data quality check

**Output**: customer_id, name, email (or NULL), mobile (or NULL)

---

### Query G: Categorize Orders by Total Amount (CASE)
**Purpose**: Classify all orders into three value categories:
- Low Value: < $100
- Medium Value: $100 - $500
- High Value: > $500

**Key Concepts**:
- CASE statement with multiple conditions
- BETWEEN operator for range checking
- Business logic implementation

**Output**: order_id, total_amount, order_category

---

### Query H: Count Orders Per Month (GROUP BY, Date Functions)
**Purpose**: Find the total number of orders placed in each month.

**Key Concepts**:
- MONTH() date function to extract month from order_date
- GROUP BY for aggregation
- COUNT aggregate function
- Ordering results chronologically

**Output**: order_month, total_orders

---

### Query I: Replace Zero Values with NULL in Discount Column
**Purpose**: Alter Orders table to add a discount column, then display discount values with zeros converted to NULL.

**Operations**:
1. Add discount column with default value 0.00
2. Use CASE statement to convert 0 to NULL in query results

**Key Concepts**:
- CASE for conditional value replacement
- NULL vs 0 distinction

**Output**: order_id, total_amount, discount (zeros shown as NULL)

---

### Query J: Calculate Price Per Piece Avoiding Division by Zero
**Purpose**: Calculate price per piece by dividing total_amount by quantity, safely handling cases where quantity is 0.

**Key Concepts**:
- Division by zero prevention using CASE
- NULL return when division would be invalid
- Safe arithmetic operations

**Output**: product_id, quantity, total_amount, price_per_piece

---

### Query K: Count Non-Zero Score Values (NULLIF in Aggregation)
**Purpose**: Count how many score values are non-zero in table XYZ.

**Key Concepts**:
- NULLIF function converts 0 to NULL
- COUNT ignores NULL values
- Aggregate function optimization

**Output**: non_zero_score_count

---

### Query L: Average Salary Excluding Zeros (NULLIF with AVG)
**Purpose**: Calculate average salary from employees table, excluding rows where salary = 0.

**Key Concepts**:
- NULLIF(salary, 0) converts 0 values to NULL
- AVG aggregate function ignores NULL values
- Data quality filtering

**Output**: average_salary

---

### Query M: Percentage Contribution with Safe Division (COALESCE + NULLIF)
**Purpose**: Calculate each row's percentage contribution (value / total_value) safely handling cases where total is zero.

**Key Concepts**:
- NULLIF returns NULL when SUM equals 0
- COALESCE replaces NULL with 1 for safe division
- Combined NULL handling functions

**Output**: percentage_contribution

---

### Query N: Convert Empty Strings to NULL (NULLIF)
**Purpose**: Display customer emails as NULL when they are empty strings.

**Key Concepts**:
- NULLIF handles empty string conversion
- Data normalization
- Distinguishing between '' and NULL

**Output**: customer_id, name, email (empty strings shown as NULL)

---

### Query O: Identify Matching Date Columns (NULLIF)
**Purpose**: Identify rows where start_date and end_date are equal, returning NULL when they match.

**Key Concepts**:
- NULLIF for column comparison
- Date matching detection
- Data validation

**Output**: All columns from XYZ + same_dates (NULL when dates match)

---

### Query P: Aggregate Ignoring Specific Values (NULLIF in Aggregation)
**Purpose**: Calculate average of column 'a' while excluding rows where value equals -1.

**Key Concepts**:
- NULLIF converts -1 to NULL
- AVG ignores NULL values
- Filtering aggregation without WHERE clause

**Output**: Average value excluding -1

---

### Query Q: Replace Value When Columns Match (NULLIF + CASE)
**Purpose**: When val1 matches val2, return their sum; otherwise return 0.

**Key Concepts**:
- NULLIF comparison for matching values
- Combined NULLIF and CASE logic
- Conditional value transformation

**Output**: val1, val2, modified_value

---

## Key SQL Concepts Covered

| Concept | Queries | Description |
|---------|---------|-------------|
| **Subquery** | A, B | Nested SELECT statements for filtering |
| **Stored Procedure** | C | Reusable SQL code block with parameters |
| **Trigger** | D | Automatic action on table events |
| **COALESCE** | D, E, M | Replace NULL with alternative value |
| **CASE** | E, F, G, I, J, Q | Conditional logic in SQL |
| **GROUP BY** | H | Aggregate data by categories |
| **Date Functions** | H | MONTH() to extract date parts |
| **NULLIF** | K, L, M, N, O, P, Q | Convert specific values to NULL |
| **Aggregate Functions** | H, K, L, M, P | COUNT, AVG, SUM, MAX |
| **String Functions** | E | CONCAT for string combination |
| **Mathematical Operations** | C, J, M | Calculations in SQL |

---

## Usage Instructions

1. **Setup**: Ensure the database tables (products, Customers, Orders, XYZ) exist with appropriate columns
2. **Execute Queries**: Run individual queries to see results
3. **Call Procedure**: Use `CALL ApplyCategoryDiscount(category, percentage)` to apply discounts
4. **Monitor Trigger**: Query Customers table after inserting new orders to see total_spending update automatically

---

## Best Practices Demonstrated

- Use subqueries for complex filtering logic
- Implement triggers for data consistency and automatic updates
- Use COALESCE and NULLIF for robust NULL handling
- Use CASE statements for business logic and data categorization
- Plan for edge cases (division by zero, missing data)
- Use meaningful column aliases for clarity
- Leverage stored procedures for reusable code

