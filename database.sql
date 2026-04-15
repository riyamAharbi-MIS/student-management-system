-- Create Database
CREATE DATABASE StudentDB;
USE StudentDB;

-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    major VARCHAR(50),
    enrollment_year INT
);

-- Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);

-- Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert Data
INSERT INTO Students VALUES
(1, 'Ali', 'IT', 2022),
(2, 'Sara', 'MIS', 2021);

INSERT INTO Courses VALUES
(101, 'Database Systems', 3),
(102, 'Networking', 3);

INSERT INTO Enrollments VALUES
(1, 1, 101, 'A'),
(2, 2, 102, 'B');

-- Queries
SELECT * FROM Students;

SELECT Students.name, Courses.course_name, Enrollments.grade
FROM Enrollments
JOIN Students ON Students.student_id = Enrollments.student_id
JOIN Courses ON Courses.course_id = Enrollments.course_id;
