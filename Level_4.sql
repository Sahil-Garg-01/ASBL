
-- Q11. Find which city has generated the highest total revenue.
SELECT c.City, SUM(p.Price * o.Quantity) as TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.City
ORDER BY TotalRevenue DESC
LIMIT 1;

-- Q12. Identify the most popular product (highest total quantity sold).
SELECT p.ProductName, SUM(o.Quantity) as TotalQuantity
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantity DESC
LIMIT 1;

-- Q13. For each category, find the most sold product.
-- Using Window Functions (Standard SQL)
SELECT Category, ProductName, TotalQuantity
FROM (
    SELECT p.Category, p.ProductName, SUM(o.Quantity) as TotalQuantity,
           RANK() OVER (PARTITION BY p.Category ORDER BY SUM(o.Quantity) DESC) as Rank
    FROM Products p
    JOIN Orders o ON p.ProductID = o.ProductID
    GROUP BY p.Category, p.ProductName
) ranked
WHERE Rank = 1;

-- Q14. Find month-wise total revenue trend.
-- Note: Date extraction syntax varies by SQL dialect. 
-- Below uses standard EXTRACT, but for SQLite use strftime('%Y-%m', OrderDate), for MySQL DATE_FORMAT(OrderDate, '%Y-%m')
SELECT EXTRACT(YEAR FROM OrderDate) as Year, EXTRACT(MONTH FROM OrderDate) as Month, SUM(p.Price * o.Quantity) as MonthlyRevenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY Year, Month
ORDER BY Year, Month;

-- Q15. Find customers whose total spending is above the average customer spending.
WITH CustomerSpending AS (
    SELECT c.CustomerID, c.CustomerName, SUM(p.Price * o.Quantity) as TotalSpent
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN Products p ON o.ProductID = p.ProductID
    GROUP BY c.CustomerID, c.CustomerName
)
SELECT CustomerName, TotalSpent
FROM CustomerSpending
WHERE TotalSpent > (SELECT AVG(TotalSpent) FROM CustomerSpending);
