
-- Q8. Find total revenue per product category.
SELECT p.Category, SUM(p.Price * o.Quantity) as TotalRevenue
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Category;

-- Q9. Show top 5 customers who spent the most.
SELECT c.CustomerName, SUM(p.Price * o.Quantity) as TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 5;

-- Q10. Find the most recent order date for each customer.
SELECT c.CustomerName, MAX(o.OrderDate) as MostRecentOrder
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
