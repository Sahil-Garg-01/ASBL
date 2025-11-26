
-- Q4. Show each customer’s total number of orders.
SELECT c.CustomerName, COUNT(o.OrderID) as TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;

-- Q5. Find total quantity sold for each product.
SELECT p.ProductName as NameOfProduct, SUM(o.Quantity) as TotalQuantity
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductName;

-- Q6. List customers who haven’t placed any order.
SELECT c.CustomerName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- Q7. Find the total revenue generated from all orders.
SELECT SUM(p.Price * o.Quantity) as TotalRevenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID;


