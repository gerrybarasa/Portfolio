CREATE TABLE Departments (
	DepartmentID INT NOT NULL,
	DepartmentName VARCHAR(20) NOT NULL,
	Block VARCHAR(10) NOT NULL,
	HOD VARCHAR(20) NOT NULL,
	PRIMARY KEY (departmentID)
	);

INSERT INTO Departments VALUES
	(1, 'ICT', 'A', 'Jeremy Munene'),
	(2, 'EDA', 'B', 'Bernice Njagi'),
	(3, 'EDS', 'B', 'Cloudias Kemunto'),
	(4, 'OS', 'C', 'Steve Biko'),
	(5, 'MATHS', 'D', 'Faith Mideva');


	

CREATE TABLE Trainee_Details (
	TraineeID INT NOT NULL,
	Name VARCHAR(20) NOT NULL,
	DateOfBirth CHAR(20) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	Address CHAR(20) NOT NULL,
	PRIMARY KEY (TraineeID)
	);

INSERT INTO Trainee_Details VALUES
	(1, 'Ramesh', '03/02/2001', 'Male', 'Ahmedbad'),
	(2, 'Khilan', '25/01/2004', 'Male', 'Delhi'),
	(3, 'Mwende', '23/07/2003', 'Female', 'Kota'),
	(4, 'Chaitali', '25/03/2002', 'Male', 'Mumbai'),
	(5, 'Jane', '27/04/2001', 'Female', 'Bhopal'),
	(6, 'Komal', '22/11/2003', 'Female', 'Hyderabad'),
	(7, 'Mary', '24/10/2000', 'Female', 'Indore'),
	(8, 'George', '22/12/2003', 'Male', 'Kitui'),
	(9, 'Oscar', '20/12/2004', 'Male', 'Kisii'),
	(10, 'Wanjiru', '21/6/2004', 'Female', 'Makueni'),
	(11, 'Gramoh', '19/5/2001', 'Female', 'Mombasa'),
	(12, 'Oleh', '01/01/2004', 'Male', 'Busia'),
	(13, 'Jack', '02/6/2004', 'Male', 'Busia'),
	(14, 'Grace', '11/5/2001', 'Female', 'Mogadishu'),
	(15, 'Fatso', '01/12/2004', 'Male', 'Vihiga');





CREATE TABLE Course (
	CourseID INT NOT NULL,
	CourseName VARCHAR(20) NOT NULL,
	CourseLevel VARCHAR(10) NOT NULL,
	DepartmentID INT NOT NULL,
	DepartmentName VARCHAR(20) NOT NULL,
	PRIMARY KEY(CourseID)
	);

INSERT INTO Course VALUES
	(1, 'Computer Science', 'L6', 1, 'ICT'),
	(2, 'Education Science', 'L5', 3, 'EDS'),
	(3, 'Education Arts', 'L5', 2, 'EDA'),
	(4, 'Cybersecurity', 'L4', 4, 'OS'),
	(5, 'Mathematics', 'L4', 5, 'MATHS');





CREATE TABLE Trainee_Course (
	TraineeID INT NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	CourseID INT NOT NULL,
	CourseName VARCHAR(20) NOT NULL,
	CourseLevel VARCHAR(10) NOT NULL,
	EnrollmentStatus VARCHAR(25) NOT NULL,
	DepartmentID INT NOT NULL,
	Total_Fee DECIMAL(18,2),
	Amount_Paid DECIMAL(18,2),
	PRIMARY KEY(TraineeID)
	);

INSERT INTO Trainee_Course VALUES
	(1, 'Ramesh', 'Male', 1, 'Computer Science', 'L6', 'In Session', 1, 25000, 7500),
	(2, 'Khilan', 'Male', 2, 'Education Science', 'L5', 'In Session', 3, 23000, 12000),
	(3, 'Mwende', 'Female', 4, 'Cybersecurity', 'L4', 'In Session', 4, 20000, 10000),
	(4, 'Chaitali', 'Male', 4, 'Cybersecurity', 'L4', 'In Session', 4, 20000, 12500),
	(5, 'Jane', 'Female', 1, 'Computer Science', 'L6', 'In Session', 1, 25000, 15000),
	(6, 'Komal', 'Female', 3, 'Education Arts', 'L5', 'In Session', 2, 18000, 5500),
	(7, 'Mary', 'Female', 2, 'Education Science', 'L5', 'In Session', 3, 23000, 4500),
	(8, 'George', 'Male', 1, 'Computer Science', 'L6', 'In Session', 1, 25000, 12500),
	(9, 'Oscar', 'Male', 4, 'Cybersecurity', 'L4', 'In Session', 4, 20000, 5000),
	(10, 'Wanjiru', 'Female', 1, 'Computer Science', 'L6', 'In Session', 1, 25000, 6500),
	(11, 'Gramoh', 'Female', 3, 'Education Arts', 'L4', 'In Session', 2, 18000, 11000),
	(12, 'Oleh', 'Male', 2, 'Education Science', 'L6', 'In Session', 3, 23000, 10500),
	(13, 'Jack', 'Male', 5, 'Mathematics', 'L4', 'In Session', 5, 27000, 13000),
	(14, 'Grace', 'Female', 5, 'Mathematics', 'L4', 'In Session', 5, 27000, 8500),
	(15, 'Fatso', 'Male', 5, 'Mathematics', 'L4', 'In Session', 5, 27000, 14000);

	



CREATE TABLE Trainee_Marks (
	TraineeID INT NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	CourseID INT NOT NULL,
	CourseName VARCHAR(20) NOT NULL,
	CatScore INT NOT NULL,
	ExamScore INT NOT NULL,
	Grade INT NOT NULL,
	PRIMARY KEY(TraineeID)
	);

INSERT INTO Trainee_Marks VALUES
	(1, 'Ramesh', 'Male', 1, 'Computer Science', 16, 55, 71),
	(2, 'Khilan', 'Male', 2, 'Education Science', 10, 50, 60),
	(3, 'Mwende', 'Female', 4, 'Cybersecurity', 12, 45, 57),
	(4, 'Chaitali', 'Male', 4, 'Cybersecurity', 19, 59, 78),
	(5, 'Jane', 'Female', 1, 'Computer Science', 15, 35, 50),
	(6, 'Komal', 'Female', 3, 'Education Arts', 11, 49, 60),
	(7, 'Mary', 'Female', 2, 'Education Science', 09, 55, 64),
	(8, 'George', 'Male', 1, 'Computer Science', 13, 54, 67),
	(9, 'Oscar', 'Male', 4, 'Cybersecurity', 17, 50, 67),
	(10, 'Wanjiru', 'Female', 1, 'Computer Science', 14, 53, 67),
	(11, 'Gramoh', 'Female', 3, 'Education Arts', 20, 45, 65),
	(12, 'Oleh', 'Male', 2, 'Education Science', 15, 50, 65),
	(13, 'Jack', 'Male', 5, 'Mathematics', 12, 53, 65),
	(14, 'Grace', 'Female', 5, 'Mathematics', 16, 44, 60),
	(15, 'Fatso', 'Male', 5, 'Mathematics', 18, 57, 75);





CREATE TABLE Trainers (
	TrainerID INT NOT NULL,
	TrainerName VARCHAR(20) NOT NULL,
	Contacts CHAR(10),
	CourseID VARCHAR(20) NOT NULL,
	CourseName VARCHAR(20) NOT NULL,
	DepartmentName VARCHAR(20) NOT NULL,
	PRIMARY KEY(TrainerID)
	);

INSERT INTO Trainers VALUES
	(1, 'Nyachae', '0768070764', 2, 'Education Science', 'EDS'),
	(2, 'Meshack', '0789675432', 4, 'Cybersecurity', 'OS'),
	(3, 'Macdyy', '0705454633', 1, 'Computer Science', 'ICT'),
	(4, 'Alex', '0112344522', 3, 'Education Arts', 'EDA'),
	(5, 'Elly', '0768954430', 4, 'Cybersecurity', 'OS'),
	(6, 'Timothy', '0788009954', 1, 'Computer Science', 'ICT'),
	(7, 'Nelly', '0752424264',  2, 'Education Science', 'EDS'),
	(8, 'Sos', '0760054430', 4, 'Cybersecurity', 'OS'),
	(9, 'Mutunga', '0711009954', 1, 'Computer Science', 'ICT'),
	(10, 'Seth', '0751124264',  3, 'Education Arts', 'EDA'),
	(11, 'Moseti', '0711003654', 1, 'Computer Science', 'ICT'),
	(12, 'Shabir', '0751104264',  3, 'Mathematics', 'MATHS');





CREATE TABLE Attachment (
	TraineeID INT NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	CourseID INT NOT NULL,
	CourseName VARCHAR(20) NOT NULL,
	CourseLevel VARCHAR(10) NOT NULL,
	DepartmentID INT NOT NULL,
	EnrollmentStatus VARCHAR(25) NOT NULL,
	AttachmentPeriod VARCHAR(25) NOT NULL,
	PRIMARY KEY(TraineeID)
	);

INSERT INTO Attachment VALUES
	(1, 'Ramesh', 'Male', 1, 'Computer Science', 'L6', 1, 'On attachment', '3 Months'),
	(2, 'Khilan', 'Male', 2, 'Education Science', 'L5', 3, 'On attachment', '4 Months'),
	(4, 'Chaitali', 'Male', 4, 'Cybersecurity', 'L4', 4, 'On attachment', '3 Months'),
	(6, 'Komal', 'Female', 3, 'Education Arts', 'L5', 2, 'On attachment', '4 Months'),
	(7, 'Mary', 'Female', 2, 'Education Science', 'L5', 3, 'On attachment', '3 Months'),
	(8, 'George', 'Male', 1, 'Computer Science', 'L6', 1, 'On attachment', '4 Months'),
	(9, 'Oscar', 'Male', 4, 'Cybersecurity', 'L4', 4, 'On attachment', '4 Months'),
	(10, 'Wanjiru', 'Female', 1, 'Computer Science', 'L6', 1, 'On attachment', '5 Months'),
	(11, 'Gramoh', 'Female', 3, 'Education Arts', 'L4', 2, 'On attachment', '3 Months'),
	(12, 'Oleh', 'Male', 2, 'Education Science', 'L6', 3, 'On attachment', '4 Months'),
	(13, 'Jack', 'Male', 5, 'Mathematics', 'L4', 5, 'On Session', '5 Months'),
	(14, 'Grace', 'Female', 5, 'Mathematics', 'L4', 5, 'On Session', '5 Months'),
	(15, 'Fatso', 'Male', 5, 'Mathematics', 'L4', 5, 'On Session', '5 Months');





SELECT * FROM Departments;
DROP TABLE Departments;


SELECT * FROM Trainee_Details;

ALTER TABLE Trainee_Details ADD Phone_Number VARCHAR(20)

DROP TABLE Trainee_Details;

SELECT * FROM Course;
DROP TABLE Course;

SELECT * FROM Trainee_Course;
DROP TABLE Trainee_Course;

SELECT * FROM Trainee_Marks;
DROP TABLE Trainee_Marks;

SELECT * FROM Trainers;
DROP TABLE Trainers;

SELECT * FROM Attachment;
DROP TABLE Attachment;


SELECT * FROM Trainee_Details WHERE Name LIKE 'M%';
SELECT * FROM Trainee_Marks WHERE Name LIKE 'K%';


SELECT Departments.Block, COUNT(DepartmentID) AS Total_department FROM Departments WHERE Block = 'B' GROUP BY Departments.Block;


SELECT * FROM Trainee_Course WHERE CourseName = 'Computer Science';


UPDATE Trainers SET Contacts = '0113455200' WHERE TrainerID = 7;
UPDATE Trainee_Course SET EnrollmentStatus = 'On attachment' WHERE TraineeID = 2;

DELETE FROM Trainee_Course WHERE TraineeID = 5;


SELECT Trainers.TrainerID, Trainers.TrainerName, Course.CourseName FROM Trainers INNER JOIN Course ON Trainers.CourseID = Course.CourseID;



SELECT Trainee_Course.TraineeID, Trainee_Course.Name, Attachment.EnrollmentStatus 
FROM Trainee_Course INNER JOIN Attachment ON Trainee_Course.TraineeID = Attachment.TraineeID;



SELECT Trainee_Course.TraineeID, Trainee_Course.Name, Trainee_Course.CourseName, 
Attachment.EnrollmentStatus, Attachment.AttachmentPeriod 
FROM Trainee_Course INNER JOIN Attachment ON Trainee_Course.TraineeID = Attachment.TraineeID 
WHERE Attachment.CourseName = 'Computer Science';



SELECT Trainee_Course.TraineeID, Trainee_Course.Name, Trainee_Course.CourseName, 
Attachment.EnrollmentStatus, Attachment.AttachmentPeriod 
FROM Trainee_Course INNER JOIN Attachment ON Trainee_Course.TraineeID = Attachment.TraineeID 
WHERE Attachment.AttachmentPeriod = '4 Months';



SELECT Trainee_Course.TraineeID, Trainee_Course.Name, Trainee_Course.CourseName,
Attachment.EnrollmentStatus, Attachment.AttachmentPeriod 
FROM Trainee_Course INNER JOIN Attachment ON Trainee_Course.TraineeID = Attachment.TraineeID 
WHERE Attachment.AttachmentPeriod = '4 Months' AND Attachment.CourseName = 'Education Science';



SELECT Course.CourseName, COUNT(Trainee_Course.TraineeID) AS Total_Trainees 
FROM Course INNER JOIN Trainee_Course ON Course.CourseID = Trainee_Course.CourseID
GROUP BY Course.CourseName;



SELECT Departments.DepartmentName, AVG(Trainee_Marks.Grade) AS Average_Grade 
FROM Trainee_Marks INNER JOIN Trainee_Course
ON Trainee_Marks.CourseID = Trainee_Course.CourseID 
INNER JOIN Departments ON Trainee_Course.DepartmentID = Departments.DepartmentID 
GROUP BY Departments.DepartmentName;



SELECT Trainee_Details.Name AS Trainee_Name, Course.CourseName,
SUM(Trainee_Marks.CatScore) AS Total_Marks 
FROM Trainee_Marks INNER JOIN Trainee_Details 
ON Trainee_Marks.TraineeID = Trainee_Details.TraineeID 
INNER JOIN Course ON Trainee_Marks.CourseID = Course.CourseID
GROUP BY Trainee_Details.Name, Course.CourseName;



SELECT Departments.DepartmentName,
COUNT(Attachment.TraineeID) AS Total_Attachees 
FROM Departments INNER JOIN Attachment
ON Departments.DepartmentID = Attachment.DepartmentID
GROUP BY Departments.DepartmentName;




CREATE VIEW All_Trainees_With_Courses AS
SELECT Trainee_Course.TraineeID AS Trainee_ID, Trainee_Course.Name
AS Trainee_Name, Trainee_Course.Gender, Course.CourseName 
FROM Trainee_Course INNER JOIN Course
ON Trainee_Course.CourseID = Course.CourseID;

SELECT * FROM All_Trainees_With_Courses;


CREATE VIEW All_HOD_with_Departments AS
SELECT Departments.DepartmentName AS Department_Name,
Departments.HOD AS H_O_Ds, Course.DepartmentID 
FROM Departments INNER JOIN Course
ON Departments.DepartmentID = Course.DepartmentID; 

SELECT * FROM All_HOD_with_Departments;


CREATE VIEW Courses_Registered AS
SELECT Trainee_Course.CourseID AS Course_ID,
Trainee_Course.Name AS Course_Name, Course.DepartmentName 
FROM Trainee_Course INNER JOIN Course
ON Trainee_Course.DepartmentID = Course.DepartmentID;

SELECT * FROM Courses_Registered;


CREATE VIEW All_Trainers_training AS
SELECT Trainers.TrainerID AS Trainer_ID,
Trainers.TrainerName AS Trainer_Name, Course.CourseName 
FROM Trainers INNER JOIN Course
ON Trainers.CourseID = Course.CourseID;

SELECT * FROM All_Trainers_training;

CREATE VIEW Trainee_Grade AS
SELECT Trainee_Course.Name AS Trainee_Name,
Trainee_Course.Gender AS Trainee_Gender, Trainee_Marks.Grade 
FROM Trainee_Course INNER JOIN Trainee_Marks
ON Trainee_Course.CourseID = Trainee_Marks.CourseID;

SELECT * FROM Trainee_Grade;
DROP VIEW Trainee_Grade;

CREATE VIEW Trainee_Fee_Balance AS
SELECT Trainee_Details.Name AS Trainee_Name,
Trainee_Course.Total_Fee, Trainee_Course.Amount_Paid,
(Trainee_Course.Total_Fee - Trainee_Course.Amount_Paid)
AS Fee_balance 
FROM Trainee_Details INNER JOIN Trainee_Course
ON Trainee_Details.TraineeID = Trainee_Course.TraineeID;

SELECT * FROM Trainee_Fee_Balance;
DROP VIEW Trainee_Fee_Balance;

CREATE VIEW View_Exam_department AS 
SELECT Departments.DepartmentName, Trainee_Marks.Grade 
FROM Trainee_Marks INNER JOIN Course
ON Trainee_Marks.CourseID = Course.CourseID INNER JOIN Departments
ON Course.DepartmentID = Departments.DepartmentID;

SELECT * FROM View_Exam_department;
DROP VIEW View_Exam_department;

CREATE VIEW Trainees_On_Attachment AS
SELECT Trainee_Details.Name AS Trainee_Name,
Trainee_Details.Gender AS Trainee_Gender, Attachment.EnrollmentStatus 
FROM Trainee_Details INNER JOIN Attachment
ON Trainee_Details.TraineeID = Attachment.TraineeID;

SELECT * FROM Trainees_on_Attachment;

DROP VIEW Trainees_On_Attachment;

DROP VIEW All_Trainees_With_Courses;

DROP VIEW All_HOD_with_Departments;