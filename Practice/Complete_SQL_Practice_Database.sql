
-- Create all necessary tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Age INT CHECK (Age >= 18),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    TotalAmount DECIMAL(10,2),
    OrderDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT DEFAULT 1,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    HolderName VARCHAR(100),
    Balance DECIMAL(10,2)
);

CREATE TABLE Orders_Audit (
    OrderID INT,
    DeletedAt DATETIME
);

-- Insert sample data
INSERT INTO Customers (Name, Email, Age) VALUES ('Alice', 'alice@gmail.com', 25);
INSERT INTO Customers (Name, Email, Age) VALUES ('Bob', 'bob@gmail.com', 32);

INSERT INTO Products (Name, Price) VALUES ('Laptop', 1200.00);
INSERT INTO Products (Name, Price) VALUES ('Mouse', 25.00);

INSERT INTO Orders (CustomerID, TotalAmount) VALUES (1, 1225.00);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (1, 1, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (1, 2, 1);

-- Join and View
CREATE VIEW CustomerOrdersView AS
SELECT c.Name, o.OrderID, o.TotalAmount, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Scalar Function
CREATE FUNCTION GetCustomerAgeGroup (@Age INT)
RETURNS VARCHAR(20)
AS
BEGIN
    RETURN (
        CASE
            WHEN @Age < 30 THEN 'Young'
            WHEN @Age BETWEEN 30 AND 50 THEN 'Adult'
            ELSE 'Senior'
        END
    );
END;

-- Table-Valued Function
CREATE FUNCTION GetOrdersByCustomer (@cust_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT OrderID, TotalAmount, OrderDate
    FROM Orders
    WHERE CustomerID = @cust_id
);

-- Stored Procedure
CREATE PROCEDURE GetCustomerOrders @CustomerID INT
AS
BEGIN
    SELECT * FROM Orders WHERE CustomerID = @CustomerID;
END;

-- Trigger
CREATE TRIGGER trg_AuditOrderDelete
ON Orders
AFTER DELETE
AS
BEGIN
    INSERT INTO Orders_Audit (OrderID, DeletedAt)
    SELECT OrderID, GETDATE() FROM deleted;
END;

-- Indexing
CREATE INDEX idx_Email ON Customers(Email);

-- Transaction Procedure
CREATE PROCEDURE TransferMoney
    @sender_id INT,
    @receiver_id INT,
    @amount DECIMAL(10,2)
AS
BEGIN
    BEGIN TRANSACTION;

    DECLARE @sender_balance DECIMAL(10,2);

    SELECT @sender_balance = Balance FROM Accounts WHERE AccountID = @sender_id;

    IF @sender_balance >= @amount
    BEGIN
        UPDATE Accounts SET Balance = Balance - @amount WHERE AccountID = @sender_id;
        UPDATE Accounts SET Balance = Balance + @amount WHERE AccountID = @receiver_id;

        COMMIT;
    END
    ELSE
    BEGIN
        ROLLBACK;
        PRINT 'Insufficient balance!';
    END
END;

-- EXISTS / ANY / ALL / SUBQUERY Examples
-- Subquery for customers with high orders
SELECT * FROM Customers WHERE CustomerID IN (
    SELECT CustomerID FROM Orders WHERE TotalAmount > 500
);

-- EXISTS example
SELECT Name FROM Customers c WHERE EXISTS (
    SELECT 1 FROM Orders o WHERE o.CustomerID = c.CustomerID
);

-- ANY example
SELECT * FROM Products WHERE Price > ANY (
    SELECT Price FROM Products WHERE Price < 1000
);

-- ALL example
SELECT * FROM Products WHERE Price < ALL (
    SELECT Price FROM Products WHERE Name LIKE '%top%'
);
