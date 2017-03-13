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
<<<<<<< HEAD
   EmployeeID AS 'E' + RIGHT('00000000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
=======
  EmployeeID AS 'E' + RIGHT('00000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
>>>>>>> origin/master
  LName varchar(50) NOT NULL,
  FName varchar(50) NOT NULL,
  EmployeeType varchar(8) NOT NULL,
  Email varchar(50),
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
<<<<<<< HEAD
	OrderID AS 'OID' + RIGHT('00000000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
=======
  OrderID AS 'O' + RIGHT('00000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED,
>>>>>>> origin/master
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
=======
<<<<<<< HEAD
INSERT INTO Customer (LastName, FirstName, Email, PhoneNumber, AddressLine1, AddressLine2, City, State, ZipCode, Country) VALUES 

('Hernandez', 'Helena', 'NA', 7868791449, '1 leighton street', 'apt 1607', 'cambrdige', 'MA', 02141, 'US'),
('Esteve', 'Isabel', 'NA', 6178347155, '150 Huntington Ave', 'Apt NB3', 'Boston', 'MA', 02115, 'US'); 

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
>>>>>>> origin/master

INSERT INTO Employees(FName, LName, EmployeeType, PhoneNumber, EMail, AddressLine1, AddressLine2, City, State, ZipCode, Country) VALUES
('Sophia', 'Rodriguez', 'Server', 6172157155, 'srodriguez@gmail.com', '150 Huntington Ave', 'Apt NC1', 'Boston', 'MA', 02115, 'US'),
('Isabela', 'Grasso', 'Server', 9172357155, 'igrasso@gmail.com', '145 Boylston St', 'Apt 2', 'Boston', 'MA', 02115, 'US'),
('Alexander', 'Yang', 'Server', 6172348734, 'ayang@gmail.com', '15 Newbury St', 'Apt 5a', 'Boston', 'MA', 02115, 'US'),
('Kyle', 'Bissel', 'Server', 9153457155, 'kbissel@gmail.com', '231 Forest St', 'Box #2391', 'Wellesley', 'MA', 02457, 'US'),
('John', 'Sawyer', 'Server', 6172353455, 'jsawyer@gmail.com', '19 Boylston St', 'Apt 2', 'Jamaica Plain', 'MA', 02130, 'US'),
('Emily', 'Cerra', 'Server', 6171112465, 'ecerra@gmail.com', '19 Boylston St', 'Apt 6', 'Jamaica Plain', 'MA', 02130, 'US'),
('Emily', 'Mayer', 'Server', 9171122465, 'emayer@gmail.com', '231 Forest St', 'Box #4321', 'Wellesley', 'MA', 02457, 'US'),
('Alvaro', 'Rossi', 'Server', 9172345465, 'erossi@gmail.com', '1 leighton street', 'Apt 1703', 'Cambridge', 'MA', 02141, 'US'),
('Manuella', 'Macedo', 'Server', 6172346666, 'mmacedo@gmail.com', '22 Boylston St', 'Apt 4', 'Jamaica Plain', 'MA', 02130, 'US'),
('Luke', 'Rocker', 'Server', 6175556666, 'lrocker@gmail.com', '231 Forest St', 'Box #5431', 'Wellesley', 'MA', 02457, 'US'),
('Elisa', 'Leao', 'Manager', 6171112465, 'eleao@gmail.com', '19 Boylston St', 'Apt 6', 'Jamaica Plain', 'MA', 02130, 'US'),
('Joanna', 'Benadrette', 'Manager', 6173332465, 'jbenadrette@gmail.com', '1 leighton street', 'Apt 1801', 'Cambridge', 'MA', 02141, 'US'),
('Joseph', 'Grand', 'Manager', 6173337171, 'jgrand@gmail.com', '1 leighton street', 'Apt 1901', 'Cambridge', 'MA', 02141, 'US'),
('James', 'Gordon', 'Manager', 6177647171, 'jgordon@gmail.com', '1 leighton street', 'Apt 2345', 'Cambridge', 'MA', 02141, 'US'),
('Melissa', 'McCarthy', 'Manager', 9343332465, 'mccarthy@gmail.com', '22 Boylston St', 'Apt 9', 'Jamaica Plain', 'MA', 02130, 'US'),
('Rebecca', 'Monroe', 'Manager', 9349854465, 'rmonroe@gmail.com', '26 Boylston St', 'Apt 2a', 'Jamaica Plain', 'MA', 02130, 'US'),
('Luis', 'Esteve', 'Manager', 6176786666, 'lesteve@gmail.com', '231 Forest St', 'Box #5631', 'Wellesley', 'MA', 02457, 'US'),
('Alejandro', 'Cameo', 'Manager', 6934586666, 'acameo@gmail.com', '150 Huntington Ave', 'Apt SB2', 'Boston', 'MA', 02115, 'US'),
('Sofia', 'Castro', 'Manager', 6934583456, 'scastro@gmail.com', '150 Huntington Ave', 'Apt SG8', 'Boston', 'MA', 02115, 'US'),
('Walter', 'Torres', 'Manager', 6173459666, 'wtorres@gmail.com', '150 Huntington Ave', 'Apt SJ9', 'Boston', 'MA', 02115, 'US');
GO

/*
(1, 'MIS3545-BUSINESS INTELLIGENCE AND DATA ANALYTICS', 'Zhi'),

(5, 'SME2012-MANAGING INFORMATION TECH AND SYSTEMS', 'Clare');
*/
GO

INSERT INTO Orders(OrderID, PaymentType, AmountDue, DateOrder, EmployeeID, LocationID) VALUES
('12 Walnut St', '', 'Boston', 'MA', 02156, 'US', 'Monday-Sunday 9am-10pm', 6171239871);
(),
();

<<<<<<< HEAD
INSERT INTO Locations(Name, AddressLine1, AddressLine2, City, State, ZipCode, Country, StoreHours, PhoneNumber) VALUES
('Store 1'),

=======

INSERT INTO Locations(Name, AddressLine1, AddressLine2, City, State, ZipCode, Country, StoreHours, PhoneNumber) VALUES
=======
<<<<<<< HEAD
INSERT INTO Locations(Name, AddressLine1, AddressLine2, City, State, ZipCode, Country, StoreHours, PhoneNumber) VALUES
('Store', '12 Walnut St', '', 'Boston', 'MA', 02156, 'US', 'Monday-Sunday 9am-10pm', 6171239871);

INSERT INTO Locations(LocationID, Name, AddressLine1, AddressLine2, City, State, ZipCode, Country, StoreHours, PhoneNumber) VALUES
>>>>>>> origin/master
(),

();


INSERT INTO MenuItem(ItemID, ItemName, Ingredients, Price, Cost, ItemType) VALUES
(),
>>>>>>> origin/master
();

INSERT INTO MenuItem(ItemName, Ingredients, Price, Cost, ItemType) VALUES
('Chicken Taco', 'Chicken,tortilla,sour cream, rice, salsa, tomatoes, guacamole', 3.50, 2.00, 'food'),
('Steak Taco', 'Steak,tortilla,sour cream, rice, salsa, tomatoes, guacamole', 4.50, 3.00, 'food' ),
('Shrimp Taco', 'Shrimp,tortilla,sour cream, rice, salsa, tomatoes, guacamole', 3.50, 2.00, 'food' ),
('Chicken Burrito', 'Chicken,tortilla,sour cream, rice, salsa, tomatoes, beans, lettuce, guacamole', 6.50, 4.00, 'food'),
('Steak Burrito', 'Steak,tortilla,sour cream, rice, salsa, tomatoes, beans, lettuce, guacamole', 7.50, 4.50, 'food'),
('Mexican Coke', 'Carbonated water, sugar, caramel color, phosphoric acid, natural flavors, caffeine', 2.50, 1.00, 'drink'),
('Jarritos', 'Fruit flavor, Carbonated water, sugar, phosphoric acid, natural flavors, ', 1.50, .50, 'drink'),
('Chili Lolipops', 'Fruit flavor, lemon juice, salt, chili, sugar', 1.00, .30, 'snack'),
('Churrito Chips', 'Puffed wheat, chili, lime, salt', 2.00, .50, 'snack'),
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
