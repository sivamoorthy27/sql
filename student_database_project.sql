CREATE DATABASE StudentDB;

USE StudentDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(50),
    marks INT
);

INSERT INTO Students VALUES
(101, 'Shiva', 'IT', 85),
(102, 'Arun', 'CSE', 90),
(103, 'Kavin', 'ECE', 78);

SELECT * FROM Students;

UPDATE Students
SET marks = 95
WHERE student_id = 101;

DELETE FROM Students
WHERE student_id = 103;

SELECT * FROM Students;
