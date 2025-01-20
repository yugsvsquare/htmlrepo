-- Database schema (DDL)
CREATE DATABASE MyDatabase; 
USE MyDatabase; 

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Data manipulation (DML)
INSERT INTO Customers (CustomerName, Email, PhoneNumber) 
VALUES 
    ('John Doe', 'john.doe@email.com', '123-456-7890'),
    ('Jane Smith', 'jane.smith@email.com', '987-654-3210'); 

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) 
VALUES 
    (1, '2023-01-15', 100.50), 
    (2, '2023-02-01', 50.25); 

-- Stored Procedure
CREATE PROCEDURE GetCustomerOrders(
    IN customerID INT
)
BEGIN
    SELECT o.OrderID, o.OrderDate, o.TotalAmount
    FROM Orders o
    WHERE o.CustomerID = customerID;
END; 

-- Example execution of stored procedure
CALL GetCustomerOrders(1); 
