
-- Q1. Fetch all customers who live in Mumbai.
SELECT * 
FROM Customers 
WHERE City = 'Mumbai';

-- Q2. Get all products that cost more than ₹20,000.
SELECT * 
FROM Products 
WHERE Price > 20000;

-- Q3. List all orders placed after January 1st, 2024.
SELECT * 
FROM Orders 
WHERE OrderDate > '2024-01-01';
