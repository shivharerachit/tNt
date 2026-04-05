## Finding Products Above Category Average

**Query:**
```sql
SELECT  name, 
        price, 
        category 
FROM products p1 
WHERE price > (
        SELECT AVG(price) 
        FROM products p2 
        WHERE p2.category = p1.category
    ) 
ORDER BY category ASC, 
        price DESC;
```

**Result:**


**Explanation:**
- Uses a **correlated subquery** to calculate the average price per category
- Returns products that exceed their category's average price
- Ordered by category (ascending) then price (descending)