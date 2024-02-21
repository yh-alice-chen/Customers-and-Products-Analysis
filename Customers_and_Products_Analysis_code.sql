-- create database --
CREATE DATABASE Customer_Product_Analysis;

USE Customer_Product_Analysis;

-- create table and define primary key --
CREATE TABLE Customers (
Customer_ID INT NOT NULL PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Contact_Last_Name VARCHAR(50) NOT NULL,
Contact_First_Name VARCHAR(50) NOT NULL,
Phone VARCHAR(50),
Address_Line1 VARCHAR(50),
Address_Line2 VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
Postal_Code VARCHAR(15),
Country VARCHAR(50),
Sales_Rep_Employee_ID INT,
Credit_Limit INT
);

CREATE TABLE Employees (
Employee_ID INT NOT NULL PRIMARY KEY,
Last_Name VARCHAR(50),
First_Name VARCHAR(50),
Extension VARCHAR(10),
Email VARCHAR(50),
Office_ID INT, 
Report_To INT,
Job_Title VARCHAR(50)
);

CREATE TABLE Offices (
Office_ID INT NOT NULL PRIMARY KEY,
City VARCHAR(50),
Phone VARCHAR(50),
Address_Line1 VARCHAR(50),
Address_Line2 VARCHAR(50),
State VARCHAR(30),
Country VARCHAR(30),
Postal_Code VARCHAR(30),
Territory VARCHAR(20)
);

CREATE TABLE Order_Details (
Order_ID INT NOT NULL,
Product_ID VARCHAR(20) NOT NULL, 
Order_qty INT NOT NULL,
Unit_Price FLOAT NOT NULL,
Order_Line_ID INT
);

CREATE TABLE Orders (
Order_ID INT NOT NULL PRIMARY KEY,
Order_Date VARCHAR(30),
Required_Date VARCHAR(30),
Shipped_Date VARCHAR(30),
Status VARCHAR(30),
Comments VARCHAR(1000),
Customer_ID INT
);

CREATE TABLE Payments (
Customer_ID INT,
Check_ID VARCHAR(20) PRIMARY KEY,
Payment_Date VARCHAR(20),
Amount FLOAT
);

CREATE TABLE Product_Lines (
Product_Line VARCHAR(20) PRIMARY KEY,
Description VARCHAR(800),
html_Description VARCHAR(50),
Image VARCHAR(50)
);

CREATE TABLE Products (
Product_ID VARCHAR(200) PRIMARY KEY,
Product_Name VARCHAR(200),
Product_Line VARCHAR(200),
Product_Scale VARCHAR(200),
Product_Vendor VARCHAR(200),
Product_Description VARCHAR(1000),
Inventory INT,
Buy_Price FLOAT,
MSRP FLOAT 
);

-- data is imported from csv files -- 

-- add foreign key --
ALTER TABLE Products
ADD FOREIGN KEY (Product_Line) REFERENCES Product_Lines(Product_Line);

ALTER TABLE Order_Details
ADD FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
ADD FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID);

ALTER TABLE Orders
ADD FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID);

ALTER TABLE Payments
ADD FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID);

ALTER TABLE Customers
ADD FOREIGN KEY (Sales_Rep_Employee_ID) REFERENCES Employees(Employee_ID);

ALTER TABLE Employees
ADD FOREIGN KEY (Report_To) REFERENCES Employees(Employee_ID),
ADD FOREIGN KEY (Office_ID) REFERENCES Offices(Office_ID);

-- table overview --  
SELECT 'Customers' AS table_name, 
       (SELECT COUNT(*) AS Number_Of_Columns
          FROM Information_Schema.Columns
         WHERE Table_Schema = 'Customer_Product_Analysis' AND TABLE_NAME = 'Customers') AS Number_Of_Attributes,
        (SELECT COUNT(*) FROM Customers) AS Number_Of_Rows
 UNION ALL 
SELECT 'Products' AS Table_Name, 
        (SELECT COUNT(*) AS Number_Of_Columns
           FROM Information_Schema.Columns
          WHERE Table_Schema = 'Customer_Product_Analysis' AND TABLE_NAME = 'Products') AS Number_Of_Attributes,
        (SELECT COUNT(*) FROM Products) AS Number_Of_Rows
 UNION ALL 
SELECT 'Product_Lines' AS TABLE_NAME, 
        (SELECT COUNT(*) AS Number_Of_Columns
           FROM Information_Schema.Columns
          WHERE Table_Schema = 'Customer_Product_Analysis' AND TABLE_NAME = 'Product_Lines') AS Number_Of_Attributes,
        (SELECT COUNT(*) FROM Product_Lines) AS Number_Of_Rows
 UNION ALL 
SELECT 'Orders' AS TABLE_NAME, 
        (SELECT COUNT(*) AS Number_Of_Columns
           FROM Information_Schema.Columns
          WHERE Table_Schema = 'Customer_Product_Analysis' AND TABLE_NAME = 'Orders') AS Number_Of_Attributes,
        (SELECT COUNT(*) FROM Orders) AS Number_Of_Rows
 UNION ALL 
SELECT 'Order_details' AS TABLE_NAME, 
         (SELECT COUNT(*) AS Number_Of_Columns
           FROM Information_Schema.Columns
        WHERE Table_Schema = 'Customer_Product_Analysis' AND TABLE_NAME = 'Order_Details') AS Number_Of_Attributes,
         (SELECT COUNT(*) FROM Order_Details) AS Number_Of_Rows
UNION ALL 
SELECT 'Payments' AS TABLE_NAME, 
         (SELECT COUNT(*) AS Number_Of_Columns
            FROM Information_Schema.Columns
           WHERE Table_Schema = 'Customer_Product_Analysis' AND TABLE_NAME = 'Payments') AS Number_Of_Attributes,
         (SELECT COUNT(*) FROM Payments) AS Number_Of_Rows
 UNION ALL 
SELECT 'Employees' AS TABLE_NAME, 
	 (SELECT COUNT(*) AS Number_Of_Columns
            FROM Information_Schema.Columns
           WHERE Table_Schema = 'Customer_Product_Analysis' AND TABLE_NAME = 'Employees') AS Number_Of_Attributes,
         (SELECT COUNT(*) 
	    FROM Employees) AS Number_Of_Rows
 UNION ALL 
SELECT 'Offices' AS TABLE_NAME, 
	 (SELECT COUNT(*) AS Number_Of_Columns
            FROM Information_Schema.Columns
           WHERE Table_Schema = 'Customer_Product_Analysis' AND TABLE_NAME = 'Offices') AS Number_Of_Attributes,
         (SELECT COUNT(*) 
	    FROM Offices) AS Number_Of_Rows;

-- Question 1: Which product line should the company prioritise for restocking? --
-- calculate low stock for each product --
SELECT p.Product_ID, p.Product_Line, p.Product_Name, ROUND(SUM(o.Order_qty/p.Inventory),2) AS Low_Stock
  FROM Products p 
 INNER JOIN Order_Details o
   ON p.Product_ID = o.Product_ID
GROUP BY p.Product_ID
ORDER BY Low_Stock DESC;

-- calculate the product performance --
SELECT p.Product_ID, p.Product_Line, p.Product_Name,ROUND(SUM(o.Order_qty * o.Unit_Price),2) AS Product_Performance
  FROM Order_Details o
 INNER JOIN Products p
    ON p.Product_ID = o.Product_ID
 GROUP BY p.Product_ID
 ORDER BY Product_Performance DESC;

-- using a Common Table Expression (CTE) to display priority products for restocking using the IN operator --
WITH 
Low_Stock AS(
SELECT p.Product_ID, p.Product_Line, p.Product_Name, ROUND(SUM(o.Order_qty/p.Inventory),2) AS Low_Stock
  FROM Products p 
 INNER JOIN Order_Details o
    ON p.Product_ID = o.Product_ID
 GROUP BY p.Product_ID
 ORDER BY Low_Stock
),
Product_Performance AS(
SELECT p.Product_ID, p.Product_Line, p.Product_Name,ROUND(SUM(o.Order_qty * o.Unit_Price),2) AS Product_Performance
  FROM Order_Details o
 INNER JOIN Products p
    ON p.Product_ID = o.Product_ID
 GROUP BY p.Product_ID
 ORDER BY Product_Performance DESC
)
SELECT p.Product_Name, p.Product_Line, p.Product_Performance, l.Low_Stock
  FROM Product_Performance p
INNER JOIN Low_Stock l 
   ON p.Product_ID = l.Product_ID
 WHERE Product_ID IN (SELECT Product_ID
			FROM Low_Stock)
 GROUP BY Product_ID
 ORDER BY Product_Performance DESC
 LIMIT 10;
 
-- Question 2: How should the company tailor marketing and communication strategies to customer behaviours? --
-- Top 5 VIP customer -- 
WITH 
Profit_Table AS(
SELECT o.Customer_ID, od.Order_Qty, od.Unit_Price, p.Buy_Price, c.Contact_First_Name AS First_Name, c.Contact_Last_Name AS Last_Name
  FROM Orders o
 INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
 INNER JOIN Products p
    ON od.Product_ID = p.Product_ID
 INNER JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
)
SELECT Customer_ID, First_Name, Last_Name, ROUND(SUM(Order_Qty * (Unit_Price-Buy_Price)),3) AS Profit
  FROM Profit_Table
 GROUP BY Customer_ID
 ORDER BY Profit DESC
 LIMIT 5;

-- Top 5 least engaging Customer --
WITH 
Profit_Table AS(
SELECT o.Customer_ID, od.Order_Qty, od.Unit_Price, p.Buy_Price, c.Contact_First_Name AS First_Name, c.Contact_Last_Name AS Last_Name
  FROM Orders o
 INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
 INNER JOIN Products p
    ON od.Product_ID = p.Product_ID
INNER JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
)
SELECT Customer_ID, First_Name, Last_Name, ROUND(SUM(Order_Qty * (Unit_Price-Buy_Price)),3) AS Profit
  FROM Profit_Table
 GROUP BY Customer_ID
 ORDER BY Profit 
 LIMIT 5;

-- Question 3: How much can the company spend on acquiring new customers? --
WITH 
Payment_With_Month_Table AS(
SELECT *, CAST(SUBSTRING(Payment_Date,7,10) AS SIGNED) * 100 + CAST(SUBSTRING(Payment_Date,4,5) AS SIGNED) AS `year_month`
  FROM Payments 
),
Customer_Num_Table AS(
SELECT `year_month`, COUNT(*) AS Customer_Number, SUM(Amount) AS Total
  FROM Payment_With_Month_Table p1
 GROUP BY `year_month`
),
New_Customer_Num_Table AS(
SELECT p1.`year_month`, COUNT(*) AS New_Customer_Num, SUM(p1.Amount) AS New_Customer_Total,
       (SELECT Customer_Number
          FROM Customer_Num_Table c
         WHERE p1.`year_month` = c.`year_month`) AS Customer_Number,
	(SELECT Total 
           FROM Customer_Num_Table c
	  WHERE p1.`year_month` = c.`year_month`) AS Customer_Total
  FROM Payment_With_Month_Table p1
 WHERE p1.Customer_ID NOT IN (SELECT Customer_ID
                                FROM Payment_With_Month_Table p2
                               WHERE p1.`year_month` > p2.`year_month`)
GROUP BY P1.`year_month`
)
SELECT `year_month`,ROUND(New_Customer_Num *100 / Customer_Number,1) AS New_Customer_Props, ROUND(New_Customer_Total *100/ Customer_Total,1) AS New_Customer_Total_Props
  FROM New_Customer_Num_Table
 ORDER BY `year_month`;

-- calculate Customer Lifetime Value (LTV) --
WITH 
Money_In_By_Customer_Table AS(
SELECT o.Customer_ID, SUM(od.Order_qty * (od.Unit_Price - p.Buy_Price)) AS Revenue
  FROM Orders o
 INNER JOIN Order_Details od 
    ON o.Order_ID = od.Order_ID
 INNER JOIN Products p 
    ON od.Product_ID = p.Product_ID
 GROUP BY o.Customer_ID
)
SELECT ROUND(AVG(Revenue),2) AS LTV
  FROM Money_In_By_Customer_Table;
