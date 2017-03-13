/*SHI Cocina by Sofia Cosio, Isabel Esteve and Helena Hernandez*/
CREATE DATABASE SHIdb;
GO

USE SHIdb;
GO

-- Create the customer and order tables
CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  LastName varchar(50) NOT NULL,
  FirstName varchar(50) NOT NULL,
  Email varchar(15),
  PhoneNumber varchar(10) NOT NULL,
  AddressLine1 varchar(50),
  AddressLine2 varchar(20),
  City varchar(10),
  State varchar(10),
  ZipCode bigint(5),
  Country varchar(3)
  );

CREATE TABLE Employees(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  LName varchar(50) NOT NULL,
  FName varchar(50) NOT NULL,
  EmployeeType varchar(8) NOT NULL,
  Email varchar(15),
  PhoneNumber varchar(10) NOT NULL,
  AddressLine1 varchar(50),
  AddressLine2 varchar(20),
  City varchar(10),
  State varchar(10),
  ZipCode bigint(5),
  Country varchar(3),
  LocationID bigint NOT NULL FOREIGN KEY REFERENCES Locations(LocationID) 
  );

CREATE TABLE CourseEnrollment(
  

-- Create the relationship: the first FK in CourseEnrollment
ALTER TABLE CourseEnrollment ADD CONSTRAINT FK_CourseEnrollment_Student 
FOREIGN KEY (StudentId) REFERENCES Student(StudentID);
GO




-- Add a few students
INSERT INTO Student (StudentID, FirstName, LastName) VALUES 
(1, 'Beong Jo', 'Kang'),

(10, 'David', 'Butsko');


-- Add a few courses
INSERT INTO Course(CourseID, CourseTitle, Instuctor) VALUES 
(1, 'MIS3545-BUSINESS INTELLIGENCE AND DATA ANALYTICS', 'Zhi'),

(5, 'SME2012-MANAGING INFORMATION TECH AND SYSTEMS', 'Clare');
GO

-- Delete the SME course
DELETE FROM Course
WHERE CourseTitle like 'SME%';
GO 



SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM CourseEnrollment;

GO

