-- 1. Total sales per product
SELECT p.ProductName, SUM(od.Price * od.Quantity) AS TotalSales
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;


-- 2. Total sales per category.
SELECT p.Category, SUM(od.Quantity * od.Price) AS TotalSales
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.Category
ORDER BY TotalSales DESC;


-- 3. Find the total revenue generated
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;


-- 4. Find the Top-Selling Products
SELECT p.ProductName, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC; 


-- 5. Find the Top-Selling Categories
SELECT p.Category, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.Category
ORDER BY TotalSold DESC;


-- 6. Average rating per product
SELECT p.ProductName, AVG(r.Rating) AS AverageRating
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
GROUP BY p.ProductName;


-- 7. Top customers by total spending
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSpending
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSpending DESC;


-- 8. Average Order Value per Customer
SELECT c.CustomerName, AVG(o.TotalAmount) AS AvgOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY AvgOrderValue DESC;


-- 9. Product stock levels
SELECT ProductName, Stock
FROM Products
ORDER BY Stock ASC; 


-- 10. Most popular product categories.
SELECT p.Category, SUM(od.Quantity * od.Price) AS TotalSales
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.Category
ORDER BY TotalSales DESC;


-- 11. Products with Low Stock Levels
SELECT ProductID, ProductName, Stock
FROM Products
WHERE Stock < 10
ORDER BY Stock ASC;


-- 12. Personalized Product Recommendations
SELECT c.CustomerName, p.ProductName, r.RecommendedDate
FROM Recommendations r
JOIN Customers c ON r.CustomerID = c.CustomerID
JOIN Products p ON r.ProductID = p.ProductID;


-- 13. Predictive Sales Analysis
SELECT p.ProductName, sf.ForecastDate, sf.PredictedSales
FROM SalesForecasts sf
JOIN Products p ON sf.ProductID = p.ProductID;


-- 14. Monthly Sales Revenue
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS MonthYear, SUM(TotalAmount) AS MonthlyRevenue
FROM Orders
GROUP BY MonthYear
ORDER BY MonthYear DESC;


-- 15. Yearly Sales Revenue
SELECT YEAR(OrderDate) AS Year, SUM(TotalAmount) AS YearlyRevenue
FROM Orders
GROUP BY Year
ORDER BY Year DESC;
