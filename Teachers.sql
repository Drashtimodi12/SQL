use school_db;

-- Create a table teachers with the following columns: teacher_id (Primary Key), teacher_name (NOT NULL), subject (NOT NULL), and email (UNIQUE). 
CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,   
    teacher_name VARCHAR(150) NOT NULL,         
    subject VARCHAR(100) NOT NULL,               
    email VARCHAR(100) UNIQUE NOT NULL           
);

-- Implement a FOREIGN KEY constraint to relate the teacher_id from the teachers table with the students table. 
INSERT INTO teachers (teacher_name, subject, email) VALUES ('Priti', 'Mathematics', 'pritima@example.com');

-- Drop the teachers table from the school_db database. 
drop table teachers;