/*SHI Cocina by Sofia Cosio, Isabel Esteve and Helena Hernandez*/
/* sources: https://www.w3schools.com/sql/sql_datatypes.asp*/

USE SHIdb;
GO

SELECT * FROM Customer;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM Locations;
SELECT * FROM MenuItem;
SELECT * FROM OrdersMenuItem;

/*What is the most common type of payment?*/
SELECT PaymentType, COUNT(*) as Popular_Payment_Method
FROM Orders
GROUP BY PaymentType; 

/*Who are the best 3 employees by amounts of orders sold?*/
SELECT TOP 3 e.EmployeeID, e.FName, e.LName, e.LocationID, SUM(o.AmountDue) as Total_$_Sold
FROM Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FName, e.LName, e.LocationID
ORDER BY SUM(o.AmountDue) DESC;

/*Show customers who used cash as payment.  */ 
SELECT CustomerID 
FROM Orders 
WHERE PaymentType= 'cash'; 

/* Show the customer with the most money spent. */ 
SELECT TOP 1 CustomerID, LocationID, SUM(AmountDue) as Largest_AmountDue
FROM Orders
GROUP BY CustomerID, LocationID
ORDER BY SUM(AmountDue) DESC;

/* Write a query to display the Customer ID, First Name and Last Name of all customers and the Quantity of items they ordered in each of their orders.*/
SELECT a.CustomerID, b.FirstName as First_Name, b.LastName as Last_Name, c.Qty as Quantity 
FROM Orders as a 
LEFT JOIN Customer as b
ON a.CustomerID = b.CustomerID
FULL OUTER JOIN OrdersMenuItem as c
ON a.OrderID=c.OrderID;

/* Outer join is used because we wanted to get a union of the data. This query gave me the name of all the customers in union with the quantity of items that they ordered. Essentially it combined the informtion prevenelant in the ordermenuitem table and in the customer table that was being asked for.*/

/*Who are the best customers based on number of visits and total amount spent?*/
SELECT 
	a.CustomerID, 
	a.FirstName,
	a.LastName,
	b. count(OrderID) as Total_Number_of_Visits,
	b. sum(AmountDue) as Total_Amount_Spent
FROM Customer as a
JOIN Orders as b
on a.CustomerID = b.CustomerID
Order By sum(AmountDue) DESC;

/*Which employees are underperforming compared to the average by dollars sold?*/
SELECT e.EmployeeID, FName, LName
FROM Employees as e inner join Orders as o on e.EmployeeID=o.EmployeeID
WHERE AmountDue <
	(SELECT AVG(AmountDue) as CompanyAverage_TotalSold
FROM Orders)
ORDER BY AmountDue; 
