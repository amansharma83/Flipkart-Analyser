CREATE DATABASE FlipkartAnalytics;

USE FlipkartAnalytics;

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE,
    Country VARCHAR(50)
);

-- Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT,
    Description TEXT
);

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Reviews table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    ReviewDate DATE,
    Rating INT, -- e.g., 1 to 5
    Comments TEXT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- InventoryAlerts table
CREATE TABLE InventoryAlerts (
    AlertID INT PRIMARY KEY,
    ProductID INT,
    AlertDate DATE,
    StockLevel INT,
    AlertType VARCHAR(50), -- e.g., Low Stock, Overstock
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- SalesForecasts table
CREATE TABLE SalesForecasts (
    ForecastID INT PRIMARY KEY,
    ProductID INT,
    ForecastDate DATE,
    PredictedSales INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Recommendations table
CREATE TABLE Recommendations (
    RecommendationID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    RecommendedDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);





-- SAMPLE DATA FOR ANALYSIS

INSERT INTO Customers (CustomerID, CustomerName, Email, JoinDate, Country) VALUES
(1, 'Aman', 'aman@example.com', '2024-01-01', 'India'),
(2, 'Harsh', 'harsh@example.com', '2024-01-05', 'India'),
(3, 'Ravi', 'ravi@example.com', '2024-02-10', 'India'),
(4, 'Meera', 'meera@example.com', '2024-03-15', 'India'),
(5, 'Sita', 'sita@example.com', '2024-04-20', 'India'),
(6, 'John', 'john@example.com', '2024-05-25', 'USA'),
(7, 'Jane', 'jane@example.com', '2024-06-30', 'USA'),
(8, 'Paul', 'paul@example.com', '2024-07-05', 'UK');

  
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock, Description) VALUES
(1, 'Laptop', 'Electronics', 50000 , 50, 'High-performance laptop'),
(2, 'Shirt', 'Clothes', 1000, 200, 'Good-Fabric shirt'),
(3, 'Smartphone', 'Electronics', 30000, 100, 'Latest model smartphone'),
(4, 'Headphones', 'Electronics', 1500, 150, 'Noise-cancelling headphones'),
(5, 'Sneakers', 'Footwear', 2500, 80, 'Comfortable running shoes'),
(6, 'Watch', 'Accessories', 5000, 60, 'Stylish wrist watch'),
(7, 'Bag', 'Accessories', 2000, 120, 'Durable travel bag'),
(8, 'Jacket', 'Clothes', 3000, 70, 'Winter jacket');

  
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-03-01', 51000),
(2, 2, '2024-03-02', 1000),
(3, 3, '2024-03-15', 30000),
(4, 4, '2024-04-05', 5000),
(5, 5, '2024-05-10', 2500),
(6, 6, '2024-06-20', 15000),
(7, 7, '2024-07-25', 10000),
(8, 8, '2024-08-05', 4000);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 1, 50000),
(2, 1, 2, 1, 1000),
(3, 2, 2, 1, 1000),
(4, 3, 3, 1, 30000),
(5, 4, 4, 1, 1500),
(6, 5, 5, 1, 2500),
(7, 6, 6, 1, 5000),
(8, 7, 7, 1, 2000),
(9, 8, 8, 1, 3000);


INSERT INTO Reviews (ReviewID, ProductID, CustomerID, ReviewDate, Rating, Comments) VALUES
(1, 1, 1, '2024-03-05', 5, 'Excellent product!'),
(2, 2, 2, '2024-03-06', 4, 'Very good quality.'),
(3, 3, 3, '2024-03-20', 5, 'Amazing smartphone!'),
(4, 4, 4, '2024-04-10', 3, 'Good but a bit expensive.'),
(5, 5, 5, '2024-05-15', 4, 'Comfortable for running.'),
(6, 6, 6, '2024-06-25', 5, 'Stylish and durable.'),
(7, 7, 7, '2024-07-30', 4, 'Perfect for travel.'),
(8, 8, 8, '2024-08-10', 4, 'Keeps me warm.');


INSERT INTO InventoryAlerts (AlertID, ProductID, AlertDate, StockLevel, AlertType) VALUES
(1, 1, '2024-03-10', 10, 'Low Stock'),
(2, 2, '2024-03-15', 300, 'Overstock'),
(3, 3, '2024-04-10', 20, 'Low Stock'),
(4, 4, '2024-05-10', 50, 'Normal Stock'),
(5, 5, '2024-06-15', 5, 'Low Stock'),
(6, 6, '2024-07-20', 30, 'Normal Stock'),
(7, 7, '2024-08-15', 70, 'Normal Stock'),
(8, 8, '2024-09-10', 15, 'Low Stock');


INSERT INTO SalesForecasts (ForecastID, ProductID, ForecastDate, PredictedSales) VALUES
(1, 1, '2024-04-01', 100),
(2, 2, '2024-04-01', 150),
(3, 3, '2024-05-01', 200),
(4, 4, '2024-06-01', 120),
(5, 5, '2024-07-01', 180),
(6, 6, '2024-08-01', 90),
(7, 7, '2024-09-01', 110),
(8, 8, '2024-10-01', 140);


INSERT INTO Recommendations (RecommendationID, CustomerID, ProductID, RecommendedDate) VALUES
(1, 1, 2, '2024-03-20'),
(2, 2, 1, '2024-03-21'),
(3, 3, 3, '2024-04-10'),
(4, 4, 4, '2024-05-15'),
(5, 5, 5, '2024-06-20'),
(6, 6, 6, '2024-07-25'),
(7, 7, 7, '2024-08-30'),
(8, 8, 8, '2024-09-15');


















