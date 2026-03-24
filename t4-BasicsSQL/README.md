1. Installed MYSQL using the following command:

```brew install mysql
```

2. Started MYSQL using the following command:

```brew services start mysql
```

3. Logged into MYSQL using the following command:

```mysql -u root
```

4. Created a database named `e_commerce` using the following command:

```CREATE DATABASE e_commerce;;
```

5. Used the `e_commerce` database using the following command:

```USE e_commerce;
```

6. Created a table named `Customers` with the following columns: `customer_id`, `name`, `email`, and `mobile` using the following command:

```CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    mobile VARCHAR(15)
);
```

7. Created a table named `Products` with the following columns: `id`, `name`, `description`, `price`, and `category` using the following command:

```CREATE TABLE Products (
    id INT,
    name VARCHAR(50) NOT NULL, 
    description VARCHAR(200),
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50)
);
```

8. Modified the `Customers` table to make the `name` and `email` columns not null using the following command:

```ALTER TABLE Customers
MODIFY name VARCHAR(50) NOT NULL,
MODIFY email VARCHAR(50) NOT NULL;
```

9. Modified the `Customers` table to make the `email` column unique using the following command:

```ALTER TABLE Customers
MODIFY email VARCHAR(50) NOT NULL UNIQUE;
```

10. Added a new column named `age` of type `INT` to the `Customers` table using the following command:

```ALTER TABLE Customers
ADD COLUMN age INT;
```

11. Modified the `Products` table to change the `id` column to `product_id` using the following command:

```ALTER TABLE Products
CHANGE id product_id INT;
```