/*SHI Cocina by Sofia Cosio, Isabel Esteve and Helena Hernandez*/
/* sources: https://www.w3schools.com/sql/sql_datatypes.asp and dabase creation from*/
/*Made the stuff that I am not sure comments so we can ask Professor Li*/
CREATE DATABASE SHIdbTRIAL;
GO

USE SHIdbTRIAL;
GO

-- Create the customer and order tables
CREATE TABLE Customer(
  CustomerID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
  LastName varchar(50) NOT NULL,
  FirstName varchar(50) NOT NULL,
  Email varchar(50),
  PhoneNumber varchar(10) NOT NULL,
  AddressLine1 varchar(50),
  AddressLine2 varchar(20),
  City varchar(10),
  State varchar(10),
  ZipCode char(5),
  Country varchar(3)
  );
  CREATE TABLE Locations(
LocationID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
  ID AS 'L' + RIGHT('00000000' + CAST(LocationID AS VARCHAR(8)), 8) PERSISTED,
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
  EmployeeID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
   EID AS 'E' + RIGHT('00000000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
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
	OrderID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	OID AS 'OID' + RIGHT('00000000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
	CustomerID  int NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID),
	PaymentType varchar(6),
	AmountDue bigint NOT NULL,
	DateOrder datetime constraint DF_DateOrder DEFAULT (getdate()),
	EmployeeID int NOT NULL FOREIGN KEY REFERENCES Employees(EmployeeID),
	LocationID int NOT NULL FOREIGN KEY REFERENCES Locations(LocationID)
);
  

CREATE TABLE MenuItem(
ItemID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
   IID AS 'SKU' + RIGHT('00000000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
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
INSERT INTO Customer(LastName, FirstName, Email, PhoneNumber, AddressLine1, AddressLine2, City, State, ZipCode, Country) VALUES 
('Hernandez', 'Helena', 'hhernandez@babson.edu', 7868791449, '1 leighton street', 'apt 1607', 'cambrdige', 'MA', 02141, 'US'),
('Esteve', 'Isabel', 'iesteve@babson.edu', 6178347155, '150 Huntington Ave', 'Apt NB3', 'Boston', 'MA', 02115, 'US'),
('Cajigas', 'Alexis', 'acajigas@babson.edu', 305569304, '234 los pinos circle', 'NA', 'Miami', 'FL', 33423, 'US'),
('DiCapua', 'Lydia', 'ldicapua@babson.edu', 6172345678, '150 Huntington Ave', 'Apt KB4', 'Boston', 'MA', 02115, 'US'),
('Baquero', 'Javier', 'jbaquero@babson.edu', 6171237155, '1 leighton street', 'Apt 316', 'Boston', 'MA', 02141, 'US'),
('Michan', 'Carlos', 'cmichan@babson.edu', 6178344555, '1 leighton street', 'Apt 2143', 'Boston', 'MA', 02141, 'US'),
('Ulloa', 'Xime', 'xulloa@babson.edu', 3056727355, '10 museum way', 'Apt 1628', 'Boston', 'MA', 02141, 'US'),
('Bawa', 'Anica', 'abawa@babson.edu', 6172938456, '660 washington street', 'Apt 27F', 'Boston', 'MA', 02115, 'US'),
('Polonsky', 'Edu', 'epolonsky@babson.edu', 6172921956, '1 leighton street', 'Apt 1415', 'Boston', 'MA', 02141, 'US'),
('Sanabria', 'Roberto', 'rsanabria@babson.edu', 6172837167, '1 leighton street', 'Apt 2123', 'Boston', 'MA', 02141, 'US');
GO


INSERT INTO Employees(EmployeeID, FName, LName, EmployeeType, PhoneNumber, EMail, AddressLine1, AddressLine2, City, State, ZipCode, Country, LocationID) VALUES
/*
(1, 'MIS3545-BUSINESS INTELLIGENCE AND DATA ANALYTICS', 'Zhi'),

(5, 'SME2012-MANAGING INFORMATION TECH AND SYSTEMS', 'Clare');
*/
GO

INSERT INTO Orders(OrderID, CustomerID, PaymentType, AmountDue, DateOrder, EmployeeID, LocationID) VALUES
(),
();

INSERT INTO Locations(LocationID, Name, AddressLine1, AddressLine2, City, State, ZipCode, Country, StoreHours, PhoneNumber) VALUES
(),

();

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
