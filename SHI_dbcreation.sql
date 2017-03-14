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
  ID AS 'C' + RIGHT('00000' + CAST(CustomerID AS VARCHAR(8)), 8) PERSISTED,
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
  ID AS 'L' + RIGHT('00000' + CAST(LocationID AS VARCHAR(8)), 8) PERSISTED,
Name varchar(30),
AddressLine1 varchar(50),
 AddressLine2 varchar(20),
 City varchar(15),
 State varchar(10),
 ZipCode char(5),
 Country varchar(3),
 StoreHours varchar(80),
 PhoneNumber varchar(10) NOT NULL
);


CREATE TABLE Employees(
  EmployeeID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
   ID AS 'E' + RIGHT('0000000' + CAST(EmployeeID AS VARCHAR(8)), 8) PERSISTED,
  LName varchar(50) NOT NULL,
  FName varchar(50) NOT NULL,
  EmployeeType varchar(10) NOT NULL,
  Email varchar(50),
  PhoneNumber varchar(10) NOT NULL,
  AddressLine1 varchar(50) NOT NULL,
  AddressLine2 varchar(20),
  City varchar(20) NOT NULL,
  State varchar(10) NOT NULL,
  ZipCode char(5) NOT NULL,
  Country varchar(3) NOT NULL,
  LocationID int NOT NULL FOREIGN KEY REFERENCES Locations(LocationID) 
  );

CREATE TABLE Orders(
	OrderID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	ID AS 'O' + RIGHT('00000' + CAST(OrderID AS VARCHAR(8)), 8) PERSISTED,
	CustomerID  int NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID),
	AmountDue float(5) NOT NULL,
	PaymentType varchar(6),
	DateOrder datetime constraint DF_DateOrder DEFAULT (getdate()),
	EmployeeID int NOT NULL FOREIGN KEY REFERENCES Employees(EmployeeID),
	LocationID int NOT NULL FOREIGN KEY REFERENCES Locations(LocationID)
);
  

CREATE TABLE MenuItem(
	ItemID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	ID AS 'SKU' + RIGHT('00000' + CAST(ItemID AS VARCHAR(8)), 8) PERSISTED,
	ItemName varchar(50) NOT NULL,
	Ingredients varchar(80) NOT NULL,
	Price float(7) NOT NULL,
	Cost float(7),
	ItemType varchar(10) NOT NULL
);

CREATE TABLE OrdersMenuItem(
	OrderItemID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	ID AS 'OI' + RIGHT('00000' + CAST(OrderItemID AS VARCHAR(8)), 8) PERSISTED,
	OrderID int NOT NULL FOREIGN KEY REFERENCES Orders(OrderID),
	ItemID int NOT NULL FOREIGN KEY REFERENCES MenuItem(ItemID),
	Qty int NOT NULL
);

-- Insert data we need min 10 rows!

INSERT INTO Customer(LastName, FirstName, Email, PhoneNumber, AddressLine1, AddressLine2, City, State, ZipCode, Country) VALUES 
('Hernandez', 'Helena', 'hhernandez@babson.edu', 7868791449, '1 leighton street', 'apt 1607', 'Cambridge', 'MA', 02141, 'US'),
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

INSERT INTO Locations(Name, AddressLine1, City, State, ZipCode, Country, StoreHours, PhoneNumber) VALUES
('SHI Cocina BOS', '12 Walnut St', 'Boston', 'MA', 02156, 'US', 'Monday-Sunday 9am-10pm', 6171239871),
('SHI Cocina NY', '101 West 15th St', 'New York', 'NY', 10011, 'US', 'Monday-Sunday 9am-10pm', 2123546374),
('SHI Cocina NJ', '20 S Park St', 'Montclair', 'NJ', 07042, 'US', 'Monday-Sunday 9am-10pm', 9736550157),
('SHI Cocina Norfolk', '271 Granby St',  'Norfolk', 'VA', 23510, 'US', 'Monday-Sunday 9am-10pm', 7574469240),
('SHI Cocina East', '119 E Grand River Ave', 'East Lansing', 'MI', 48823, 'US', 'Monday-Sunday 9am-10pm', 5173243434),
('SHI Cocina Charleston', '371 King St', 'Charleston', 'SC', 29401, 'US', 'Monday-Sunday 9am-10pm', 8437205293),
('SHI Cocina LA', '7650 Melrose Ave', 'Los Angeles', 'CA', 90046, 'US', 'Monday-Sunday 9am-10pm', 3236533231),
('SHI Cocina Oaks', '14608 Ventura Blvd', 'Sherman Oaks', 'CA', 91403, 'US', 'Monday-Sunday 9am-10pm', 8187893604),
('SHI Cocina Dallas', '2735 W 7th St', 'Fort Worth', 'TX', 76107, 'US', 'Monday-Sunday 9am-10pm', 8173340314),
('SHI Cocina Austin', '2406 Guadalupe St', 'Austin', 'TX', 78705, 'US', 'Monday-Sunday 9am-10pm', 5124721621);
GO

INSERT INTO Employees(FName, LName, EmployeeType, PhoneNumber, EMail, AddressLine1, AddressLine2, City, State, ZipCode, Country, LocationID) VALUES
('Sophia','Rodriguez', 'Server', 6172157155, 'srodriguez@gmail.com', '150 Huntington Ave', 'Apt NC1', 'Boston', 'MA', 02115, 'US', 1),
('Isabela', 'Grasso', 'Server', 9172357155, 'igrasso@gmail.com', '145 Boylston St', 'Apt 2', 'Boston', 'MA', 02115, 'US', 2),
('Alexander', 'Yang', 'Server', 6172348734, 'ayang@gmail.com', '15 Newbury St', 'Apt 5a', 'Boston', 'MA', 02115, 'US', 3) ,
('Alexander', 'Yang', 'Server', 6172348734, 'ayang@gmail.com', '15 Newbury St', 'Apt 5a', 'Boston', 'MA', 02115, 'US', 3),
('John', 'Sawyer', 'Server', 6172353455, 'jsawyer@gmail.com', '19 Boylston St', 'Apt 2', 'Jamaica Plain', 'MA', 02130, 'US', 5),
('Emily', 'Cerra', 'Server', 6171112465, 'ecerra@gmail.com', '19 Boylston St', 'Apt 6', 'Jamaica Plain', 'MA', 02130, 'US', 6),
('Emily', 'Mayer', 'Server', 9171122465, 'emayer@gmail.com', '231 Forest St', 'Box #4321', 'Wellesley', 'MA', 02457, 'US', 7),
('Alvaro', 'Rossi', 'Server', 9172345465, 'erossi@gmail.com', '1 leighton street', 'Apt 1703', 'Cambridge', 'MA', 02141, 'US', 8),
('Manuella', 'Macedo', 'Server', 6172346666, 'mmacedo@gmail.com', '22 Boylston St', 'Apt 4', 'Jamaica Plain', 'MA', 02130, 'US', 9),
('Luke', 'Rocker', 'Server', 6175556666, 'lrocker@gmail.com', '231 Forest St', 'Box #5431', 'Wellesley', 'MA', 02457, 'US', 10),
('Elisa', 'Leao', 'Manager', 6171112465, 'eleao@gmail.com', '19 Boylston St', 'Apt 6', 'Jamaica Plain', 'MA', 02130, 'US', 1),
('Joanna', 'Benadrette', 'Manager', 6173332465, 'jbenadrette@gmail.com', '1 leighton street', 'Apt 1801', 'Cambridge', 'MA', 02141, 'US', 2),
('Joseph', 'Grand', 'Manager', 6173337171, 'jgrand@gmail.com', '1 leighton street', 'Apt 1901', 'Cambridge', 'MA', 02141, 'US', 3),
('James', 'Gordon', 'Manager', 6177647171, 'jgordon@gmail.com', '1 leighton street', 'Apt 2345', 'Cambridge', 'MA', 02141, 'US', 4),
('Melissa', 'McCarthy', 'Manager', 9343332465, 'mccarthy@gmail.com', '22 Boylston St', 'Apt 9', 'Jamaica Plain', 'MA', 02130, 'US', 5),
('Rebecca', 'Monroe', 'Manager', 9349854465, 'rmonroe@gmail.com', '26 Boylston St', 'Apt 2a', 'Jamaica Plain', 'MA', 02130, 'US', 6),
('Luis', 'Esteve', 'Manager', 6176786666, 'lesteve@gmail.com', '231 Forest St', 'Box #5631', 'Wellesley', 'MA', 02457, 'US', 7),
('Alejandro', 'Cameo', 'Manager', 6934586666, 'acameo@gmail.com', '150 Huntington Ave', 'Apt SB2', 'Boston', 'MA', 02115, 'US', 8),
('Sofia', 'Castro', 'Manager', 6934583456, 'scastro@gmail.com', '150 Huntington Ave', 'Apt SG8', 'Boston', 'MA', 02115, 'US', 9),
('Walter', 'Torres', 'Manager', 6173459666, 'wtorres@gmail.com', '150 Huntington Ave', 'Apt SJ9', 'Boston', 'MA', 02115, 'US', 10),
('Kyle', 'Bissel', 'Server', 9153457155, 'kbissel@gmail.com', '231 Forest St', 'Box #2391', 'Wellesley', 'MA', 02457, 'US', 4);
GO

INSERT INTO Orders(CustomerID, AmountDue, PaymentType, EmployeeID, LocationID) VALUES
(1, 12,'cash',5,6),
(2, 27, 'cash', 6,7),
(3,30, 'cash',20,4),
(4,30, 'cash',1,1),
(5,42, 'credit',4,5),
(6,4.50, 'credit', 7,8),
(7,24, 'credit',2,2),
(8,10, 'credit', 8,9),
(9,24, 'credit',3,3),
(3,22, 'cash', 9,10);
GO

INSERT INTO MenuItem(ItemName, Ingredients, Price, Cost, ItemType) VALUES
('Chicken Taco', 'Chicken,tortilla,sour cream, rice, salsa, tomatoes, guacamole', 3.50, 2.00, 'food'),
('Steak Taco', 'Steak,tortilla,sour cream, rice, salsa, tomatoes, guacamole', 4.50, 3.00, 'food' ),
('Shrimp Taco', 'Shrimp,tortilla,sour cream, rice, salsa, tomatoes, guacamole', 3.50, 2.00, 'food' ),
('Chicken Burrito', 'Chicken,tortilla,sour cream, rice, salsa, tomatoes, beans, lettuce, guacamole', 6.50, 4.00, 'food'),
('Steak Burrito', 'Steak,tortilla,sour cream, rice, salsa, tomatoes, beans, lettuce, guacamole', 7.50, 4.50, 'food'),
('Mexican Coke', 'Carbonated water, sugar, color, phosphoric acid, natural flavors, caffeine', 2.50, 1.00, 'drink'),
('Jarritos', 'Fruit flavor, Carbonated water, sugar, phosphoric acid, natural flavors, ', 1.50, .50, 'drink'),
('Chili Lolipops', 'Fruit flavor, lemon juice, salt, chili, sugar', 1.00, .30, 'snack'),
('Churrito Chips', 'Puffed wheat, chili, lime, salt', 2.00, .50, 'snack'),
('Tin Larin', 'Wafers, peanut butter, chocolate, salt, sugar', 1.00, .40, 'snack');
GO

INSERT INTO OrdersMenuItem(OrderID, ItemID, Qty)VALUES
(1, 3, 2),
(1, 7, 2),
(1,8,2),
(2,1,4),
(2,4,2),
(3,10,30),
(4,6,2),
(4,5,2),
(4,8,10),
(5,9,15),
(5,10,12),
(6,2,1),
(7, 1,2),
(7,3,1),
(7,7,3),
(7,8,3),
(7,9,3),
(8,5,1),
(8,7,1),
(8,10,1),
(9,3,4),
(9,6,4),
(10,1,2),
(10,5,2);
GO

/*Queries*/

SELECT * FROM Customer;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM Locations;
SELECT * FROM MenuItem;
SELECT * FROM OrdersMenuItem;

<<<<<<< HEAD

/* DONE - Multiple SELECT * queries to display all the records from each table. (Suppose the database has 4 tables, you should create 4 queries for this requirement.)
   DONE - A query that uses aggregate function.
A query that selects records from two (or multiple) tables using INNER JOIN.
A query that selects records from two (or multiple) tables using LEFT OUTER JOIN (or RIGHT OUTER JOIN or FULL OUTER JOIN). Specify why outer join is neccesary in comment block. Make sure your fake data could reflect the necessary. If it could not, you need to go back to part 2 to redo the data insertion, or you can use INSERT INTO, UPDATE or DELETE statements to modify the existing data.
A query that uses subquery.*/
=======

/*a. What is the most common type of payment? */
select PaymentType, COUNT(*) as Popular_Payment_Method
from Orders
group by PaymentType ; 

<<<<<<< HEAD
/*Which employees are underperforming compared to average by orders sold? Bel*/

/*Show the name of the location where the average sold of food is higher than the average sold of drinks. Sofi*/ 
SELECT l.Name
FROM Locations as l inner join Orders as o on l.LocationID = o.LocationID right join OrdersMenuItem as t on o.OrderID= t.OrderID

FROM MenuItem as i right outer join OrdersMenuItem as t on i.ItemID= t.ItemID  inner join Orders as o on o.OrderID = t.OrderID  full join Locations as l on l.LocationID = o.LocationID

/*Who are the best 3 employees by amounts of orders sold? Helena*/
SELECT TOP 3 e.EmployeeID, e.FName, e.LName, e.LocationID, SUM(o.AmountDue) as Total_$_Sold
FROM Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FName, e.LName, e.LocationID
ORDER BY SUM(o.AmountDue) DESC

/*Who are the best customers based on number of visits and total amount spent? Bel*/
=======
/*b. Which employees are underperforming compared to average by orders sold? BEL*/

/*c. Show the name of the location where the average sold of food is higher than the average sold of drinks.HELENA*/

/*d. Who are the best employees by amounts of orders sold?SOFI*/

/*e. Who are the best customers based on number of visits and total amount spent? BEL*/
>>>>>>> origin/master

>>>>>>> origin/master
