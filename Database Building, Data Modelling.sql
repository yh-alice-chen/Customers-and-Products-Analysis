--- create database ---
CREATE DATABASE customer_product_analysis;

USE customer_product_analysis;

--- create table and define primary key ---
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

--- data is imported from csv files --- 

--- add foreign key ---
ALTER TABLE products
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
