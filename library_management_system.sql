CREATE DATABASE LibraryDB;

USE LibraryDB;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100),
    author VARCHAR(100),
    available_copies INT
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE IssuedBooks (
    issue_id INT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Books VALUES
(1, 'Java Programming', 'James Gosling', 5),
(2, 'Database Systems', 'Navathe', 3),
(3, 'Operating Systems', 'Galvin', 4);

INSERT INTO Students VALUES
(101, 'Shiva', 'IT'),
(102, 'Arun', 'CSE'),
(103, 'Kavin', 'ECE');

INSERT INTO IssuedBooks VALUES
(1, 101, 1, '2026-05-01', '2026-05-10'),
(2, 102, 2, '2026-05-02', '2026-05-12');

SELECT s.student_name, b.book_name, i.issue_date
FROM IssuedBooks i
JOIN Students s ON i.student_id = s.student_id
JOIN Books b ON i.book_id = b.book_id;

SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department;

SELECT b.book_name, COUNT(i.book_id) AS issued_count
FROM Books b
LEFT JOIN IssuedBooks i ON b.book_id = i.book_id
GROUP BY b.book_name
ORDER BY issued_count DESC;
