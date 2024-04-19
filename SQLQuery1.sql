USE [db_hospital_19.04]
GO

--1. branches located in the same building as Cardiology 
SELECT DISTINCT B1.Name    
FROM Departments B1
INNER JOIN Departments B2 ON B1.Building = B2.Building -- "B1" and "B2" as aliases for the "Departments"
WHERE B2.Name = 'Cardiology';

--2. branches located in the same building as Gastroenterology and General Surgery
SELECT DISTINCT B1.Name
FROM Departments B1
INNER JOIN Departments B2 ON B1.Building = B2.Building  -- 'INNER JOIN' returns only rows from both tables that have matching rows based on the specified condition
WHERE B2.Name IN ('Gastroenterology', 'General Surgery');

--3. branch that received the least donations
SELECT TOP 1 D.Name  
FROM Departments D
LEFT JOIN Donations DN ON D.Id = DN.DepartmentId  -- LEFT JOIN returns all the rows from the left table, and the matched rows from the right table
GROUP BY D.Name
ORDER BY SUM(ISNULL(DN.Amount, 0)) ASC; -- Ordering by the sum of donations in ascending order

--4. doctors whose rate is higher than that of a doctor “Thomas Gerada”
SELECT Name 
FROM Doctors 
WHERE Premium > (SELECT Premium FROM Doctors WHERE Name = 'Thomas Gerada');

--5. chambers whose capacity is greater than the average
SELECT Name
FROM Wards
WHERE Places > (SELECT AVG(Places) FROM Wards WHERE DepartmentId = (SELECT Id FROM Departments WHERE Name = 'Microbiology'));

--6. names of doctors whose salaries exceed by more than 100 
SELECT CONCAT(Name, ' ', Surname) AS FullName
FROM Doctors
WHERE (Salary + Premium) > (SELECT (Salary + Premium) + 100 FROM Doctors WHERE Name = 'Anthony Davis');

--7. departments where the survey is conducted
SELECT D.Name
FROM Departments D
INNER JOIN DoctorsExaminations DE ON D.Id = DE.WardId  -- Joining Departments table with DoctorsExaminations table
INNER JOIN Doctors DR ON DE.DoctorId = DR.Id 
WHERE DR.Name = 'Joshua Bell';

--8. sponsors who did not donate to Department of Neurology and Oncology
SELECT S.Name
FROM Sponsors S
LEFT JOIN Donations D ON S.Id = D.SponsorId
WHERE D.DepartmentId NOT IN (SELECT Id FROM Departments WHERE Name IN ('Neurology', 'Oncology'));

--9. names of doctors conducting examinations in period from 12:00 to 15:00
SELECT DISTINCT D.Name
FROM Doctors D
INNER JOIN DoctorsExaminations DE ON D.Id = DE.DoctorId
WHERE DE.StartTime >= '12:00' AND DE.EndTime <= '15:00';  --"DE" an alias for the "DoctorsExaminations"
