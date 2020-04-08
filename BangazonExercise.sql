
--1
SELECT e.FirstName, e.LastName, e.DepartmentId, e.IsSupervisor, d.[Name] AS DepartmentName FROM Employee e
LEFT JOIN Department d ON e.DepartmentId = d.id
ORDER BY DepartmentName, e.LastName, e.FirstName

--2

SELECT * FROM Department
ORDER BY Budget DESC;

--3

SELECT d.[Name] AS DepartmentName, e.FirstName, e.LastName, e.IsSupervisor
FROM Department d
LEFT JOIN Employee e ON e.DepartmentId = d.Id
WHERE e.IsSupervisor = 1;

--4

SELECT d.[Name], COUNT(e.DepartmentId) as EmployeeCount
FROM Employee e
LEFT JOIN Department d ON e.DepartmentId = d.Id
GROUP BY d.Name

--5
SELECT * FROM Department
UPDATE Department
SET BUDGET = (Budget * 1.20)

--6
SELECT e.FirstName, e.LastName, et.EmployeeId, et.TrainingProgramId, t.[Name]
FROM Employee e
LEFT JOIN EmployeeTraining et ON e.Id = et.EmployeeId
LEFT JOIN TrainingProgram t ON t.Id = et.TrainingProgramId
WHERE et.TrainingProgramId is NULL

--7
SELECT e.FirstName, e.LastName, COUNT(et.TrainingProgramId) as TraningCount
FROM Employee e
LEFT JOIN EmployeeTraining et ON e.Id = et.EmployeeId
WHERE et.TrainingProgramId is NOT NULL
GROUP BY e.FirstName, e.LastName


--8
SELECT t.[Name] AS TrainingProgramName, COUNT(et.EmployeeId) AS AttendeeCount
FROM TrainingProgram t
LEFT JOIN EmployeeTraining et ON t.Id = et.TrainingProgramId
GROUP BY t.[Name]


--9
SELECT t.[Name], t.MaxAttendees, COUNT(et.EmployeeId) as AttendeeCount
FROM TrainingProgram t
LEFT JOIN EmployeeTraining et ON t.Id = et.TrainingProgramId
GROUP By t.[Name], t.MaxAttendees
HAVING COUNT(et.EmployeeId) < t.MaxAttendees


--10
SELECT t.Id, t.[Name] as TrainingProgramName, t.StartDate 
FROM TrainingProgram t
ORDER BY StartDate ASC

--11
INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId)
OUTPUT INSERTED.Id
VALUES (4, 12)

--12
SELECT TOP 3 t.[Name], t.[Id], COUNT(et.EmployeeId) as AttendeeCount
FROM TrainingProgram t
LEFT JOIN EmployeeTraining et ON t.Id = et.TrainingProgramId
GROUP BY t.[Id], t.[Name]
ORDER BY AttendeeCount DESC


--13
SELECT TOP 3 t.[Name], COUNT(et.EmployeeId) as AttendeeCount
FROM TrainingProgram t
LEFT JOIN EmployeeTraining et ON t.Id = et.TrainingProgramId
GROUP BY t.[Name]
ORDER BY AttendeeCount DESC

--14
SELECT e.FirstName, e.LastName, ce.ComputerId
FROM Employee e
LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
WHERE ce.ComputerId IS NULL

--15
SELECT e.FirstName, e.LastName, ce.ComputerId, ISNULL(c.Manufacturer + ' ' + c.Make, 'N/A') as ComputerInfo
FROM Employee e
LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
LEFT JOIN Computer c ON ce.ComputerId = c.Id

--16
SELECT PurchaseDate, DecomissionDate, PurchaseDate, Make
FROM Computer 
WHERE PurchaseDate < '20190701'
AND DecomissionDate IS NULL

--17
SELECT e.FirstName, e.LastName, c.Make, c.Manufacturer, c.DecomissionDate
FROM Employee e
LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
LEFT JOIN Computer c on ce.ComputerId = c.Id
Group By e.FirstName, e.LastName, c.Make, c.Manufacturer, c.DecomissionDate
HAVING c.Make is NOT NULL




























































