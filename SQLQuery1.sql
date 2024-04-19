USE [db_hospital_19.04]
GO

INSERT INTO Examination (Name)
VALUES ('Cardiology'),
       ('Gastroenterology'),
       ('General Surgery'),
       ('Microbiology');

INSERT INTO Doctors (Name, Premium, Salary, Surname)
VALUES ('John Smith', 1000.00, 50000.00, 'Smith'),
       ('Jane Doe', 800.00, 48000.00, 'Doe'),
       ('Michael Johnson', 1200.00, 55000.00, 'Johnson');

INSERT INTO Wards (Name, Places, DepartmentId)
VALUES ('Ward A', 20, 1),
       ('Ward B', 15, 2),
       ('Ward C', 25, 3),
       ('Ward D', 30, 4);

INSERT INTO DoctorsExaminations (StartTime, EndTime, DoctorId, ExaminationId, WardId)
VALUES ('10:00', '12:00', 1, 1, 1),
       ('13:00', '15:00', 2, 2, 2),
       ('09:00', '11:00', 3, 3, 3);

INSERT INTO Departments (Building, Name)
VALUES (1, 'Cardiology Building'),
       (2, 'Gastroenterology Building'),
       (3, 'General Surgery Building'),
       (4, 'Microbiology Building');

INSERT INTO Sponsors (Name)
VALUES ('Sponsor A'),
       ('Sponsor B'),
       ('Sponsor C');

INSERT INTO Donations (Amount, DepartmentId, SponsorId)
VALUES (5000.00, 1, 1),
       (7000.00, 2, 2),
       (3000.00, 3, 3);