/*SHI Cocina by Sofia Cosio, Isabel Esteve and Helena Hernandez*/
/* sources: https://www.w3schools.com/sql/sql_datatypes.asp and dabase creation from*/
/*Made the stuff that I am not sure comments so we can ask Professor Li*/
CREATE DATABASE SHIdbTRIAL;
GO

USE SHIdbTRIAL;
GO

-- Create the customer and order tables
CREATE TABLE Customer(
  ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
  CustomerID AS 'C' + RIGHT('00000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
  LastName varchar(50) NOT NULL,
  FirstName varchar(50) NOT NULL,
  Email varchar(15),
  PhoneNumber varchar(10) NOT NULL,
  AddressLine1 varchar(50),
  AddressLine2 varchar(20),
  City varchar(10),
  State varchar(10),
  ZipCode char(5),
  Country varchar(3)
  );
  CREATE TABLE Locations(
ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
  LocationID AS 'L' + RIGHT('00000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
Name varchar(30),
AddressLine1 varchar(50),
 AddressLine2 varchar(20),
 City varchar(10),
 State varchar(10),
 ZipCode char(5),
 Country varchar(3),
 StoreHours varchar(40),
 PhoneNumber varchar(10) NOT NULL
);


CREATE TABLE Employees(
  ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
  EmployeeID AS 'E' + RIGHT('00000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
  LName varchar(50) NOT NULL,
  FName varchar(50) NOT NULL,
  EmployeeType varchar(8) NOT NULL,
  Email varchar(15),
  PhoneNumber varchar(10) NOT NULL,
  AddressLine1 varchar(50),
  AddressLine2 varchar(20),
  City varchar(10),
  State varchar(10),
  ZipCode char(5),
  Country varchar(3),
  LocationID int NOT NULL FOREIGN KEY REFERENCES Locations(LocationID) 
  );

CREATE TABLE Orders(
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
  OrderID AS 'O' + RIGHT('00000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
	CustomerID  int NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID),
	PaymentType varchar(6),
	AmountDue bigint NOT NULL,
	DateOrder datetime constraint DF_DateOrder DEFAULT (getdate()),
	EmployeeID int NOT NULL FOREIGN KEY REFERENCES Employees(EmployeeID),
	LocationID int NOT NULL FOREIGN KEY REFERENCES Locations(LocationID)
);
  

CREATE TABLE MenuItem(
ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
  ItemID AS 'SKU' + RIGHT('00000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
   ItemName varchar(20),
   Ingredients varchar(50),
   Price float(5),
   Cost float(5),
   ItemType varchar(10)
);

CREATE TABLE OrdersMenuItem(
	OrderID int NOT NULL PRIMARY KEY REFERENCES Orders(OrderID),
	ItemID int NOT NULL PRIMARY KEY REFERENCES MenuItem(ItemID)
);

-- Insert data we need min 10 rows!
INSERT INTO Customer (LastName, FirstName, Email, PhoneNumber, AddressLine1, AddressLine2, City, State, ZipCode, Country) VALUES 

('Hernandez', 'Helena', 'NA', 7868791449, '1 leighton street', 'apt 1607', 'cambrdige', 'MA', 02141, 'US'),
('Esteve', 'Isabel', 'NA', 6178347155, '150 Huntington Ave', 'Apt NB3', 'Boston', 'MA', 02115, 'US'); 
GO
/*
(10, 'David', 'Butsko');
*/

INSERT INTO Employees(EmployeeID, FName, LName, EmployeeType, PhoneNumber, EMail, AddressLine1, AddressLine2, City, State, ZipCode, Country, LocationID) VALUES
/*
(1, 'MIS3545-BUSINESS INTELLIGENCE AND DATA ANALYTICS', 'Zhi'),

(5, 'SME2012-MANAGING INFORMATION TECH AND SYSTEMS', 'Clare');
*/
GO

INSERT INTO Orders(OrderID, CustomerID, PaymentType, AmountDue, DateOrder, EmployeeID, LocationID) VALUES
(),
();

INSERT INTO Locations(Name, AddressLine1, AddressLine2, City, State, ZipCode, Country, StoreHours, PhoneNumber) VALUES
('Store', '12 Walnut St', '', 'Boston', 'MA', 02156, 'US', 'Monday-Sunday 9am-10pm', 6171239871);

INSERT INTO MenuItem(ItemID, ItemName, Ingredients, Price, Cost, ItemType) VALUES
(),
();

/*-- Delete example: Delete the SME course
DELETE FROM Course
WHERE CourseTitle like 'SME%';
GO 
*/

/*Queries*/
SELECT * FROM Customer;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM Locations;
SELECT * FROM MenuItem;
SELECT * FROM OrdersMenuItem;
