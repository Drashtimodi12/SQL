-- Create a new database named school_db and a table called students with the following columns: student_id, student_name, age, class, and address. 
create database school_db;
use school_db;

-- Create a table teachers with the following columns: teacher_id (Primary Key), teacher_name (NOT NULL), subject (NOT NULL), and email (UNIQUE). 
CREATE TABLE students (student_id INT AUTO_INCREMENT PRIMARY KEY, student_name VARCHAR(100) NOT NULL, age INT, class VARCHAR(50), address VARCHAR(255) );

-- Insert five records into the students table and retrieve all records using the SELECT statement. 
INSERT INTO students (student_name, age, class, address)
VALUES 
('Sejal', 14, '8th Grade', 'Kadodara'),
('Drashti', 15, '9th Grade', 'Vesu, surat'),
('Daizy', 13, '7th Grade', 'Rander Road, Surat'),
('Priyanshi', 16, '10th Grade', 'Parvat Patiya, Surat'),
('Dhruvin', 14, '8th Grade', 'Amroli'); 
SELECT * FROM students;

-- Write SQL queries to retrieve specific columns (student_name and age) from the students table. 
select student_name, age from students;

-- Write SQL queries to retrieve all students whose age is greater than 10. 
SELECT * FROM students WHERE age > 10;

ALTER TABLE students ADD teacher_id INT;

-- Implement a FOREIGN KEY constraint to relate the teacher_id from the teachers table with the students table. 
-- Add the foreign key constraint
ALTER TABLE students
ADD CONSTRAINT fk_teacher_id
FOREIGN KEY (teacher_id)
REFERENCES teachers(teacher_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

DESC students;

INSERT INTO students (student_name, age, class, address, teacher_id) VALUES ('Siya', 12, '7th Grade', 'Amroli, Surat', 1);

select * from students;



