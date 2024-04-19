CREATE DATABASE [db_hospital_19.04]
GO
USE [db_hospital_19.04]
GO

CREATE TABLE Examination (
    Id INT PRIMARY KEY IDENTITY (1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Doctors (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    Premium MONEY NOT NULL DEFAULT 0 CHECK (Premium >= 0),
    Salary MONEY NOT NULL CHECK (Salary > 0),
    Surname NVARCHAR(MAX) NOT NULL
);

CREATE TABLE Wards (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(20) NOT NULL UNIQUE,
    Places INT NOT NULL CHECK (Places >= 1),
    DepartmentId INT NOT NULL
);

CREATE TABLE DoctorsExaminations (
    Id INT PRIMARY KEY IDENTITY (1,1),
    EndTime TIME NOT NULL,
    StartTime TIME NOT NULL CHECK (StartTime >= '08:00' AND StartTime <= '18:00'),
    DoctorId INT NOT NULL,
    ExaminationId INT NOT NULL,
    WardId INT NOT NULL
);

CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY (1,1),
    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    Name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Sponsors (
    Id int PRIMARY KEY IDENTITY(1,1),
    Name nvarchar(100) NOT NULL UNIQUE
);

CREATE TABLE Donations (
    Id int PRIMARY KEY IDENTITY(1,1),
    Amount money NOT NULL CHECK (Amount > 0),
    Date date DEFAULT GETDATE(),
    DepartmentId int NOT NULL,
    SponsorId int NOT NULL
);