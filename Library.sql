-- Create a database called library_db and a table books with columns: book_id, title, author, publisher, year_of_publication, and price. Insert five records into the table.
CREATE DATABASE library_db;
USE library_db;
CREATE TABLE books (
    Book_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(200) NOT NULL,
    Publisher VARCHAR(50),
    Year_of_publication INT,
    Price DECIMAL(8 , 2 )
);
INSERT INTO books (Title, Author, Publisher, Year_of_publication, Price)
VALUES
('To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', 1960, 15.99),
('1984', 'George Orwell', 'Secker & Warburg', 1949, 12.50),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons', 1925, 10.99),
('Pride and Prejudice', 'Jane Austen', 'T. Egerton', 1813, 9.99),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 1951, 14.95);
SELECT 
    *
FROM
    books;

-- Add a new column genre to the books table. Update the genre for all existing records. 
ALTER TABLE books
ADD COLUMN genre VARCHAR(100);



-- Create a table members in library_db with columns: member_id, member_name, date_of_membership, and email. Insert five records into this table. 
CREATE TABLE members (
    Member_ID INT AUTO_INCREMENT PRIMARY KEY,
    Member_Name VARCHAR(200) NOT NULL,
    Date_of_membership DATE,
    Email VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO members (Member_Name, Date_of_membership, Email)
VALUES
('Deep', '2023-01-15', 'deep12@example.com'),
('Rudra', '2023-02-10', 'rudra98@example.com'),
('Twinkle', '2023-03-05', 'twinkle@example.com'),
('Anjana', '2023-04-20', 'anju@example.com'),
('Daizy', '2023-05-25', 'daizy@example.com');
select * from members;

-- Retrieve all members who joined the library before 2022. Use appropriate SQL syntax with WHERE and ORDER BY. 
SELECT * FROM members WHERE Date_of_membership < '2022-01-01' ORDER BY Date_of_membership ASC;

-- Write SQL queries to display the titles of books published by a specific author. Sort the results by year_of_publication in descending order. 
SELECT Title 
FROM books
WHERE Author = 'Jane Austen'
ORDER BY Year_of_publication DESC;

-- Add a CHECK constraint to ensure that the price of books in the books table is greater than 0. 
select * from books where Price > 10;

-- Modify the members table to add a UNIQUE constraint on the email column, ensuring that each member has a unique email address. 
describe members;
insert into members values ('Usha', 2025-01-01, 'daizy@example.com');

-- Modify the members table to increase the length of the email column to 100 characters. 
ALTER TABLE members
MODIFY COLUMN email VARCHAR(100);
describe members;


-- Create a table courses with columns: course_id, course_name, and course_credits. Set the course_id as the primary key. 
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(200) NOT NULL,
    course_credits INT NOT NULL
);

-- enter 5 data in courses table 
INSERT INTO courses (course_name, course_credits)
VALUES
('Introduction to Programming', 4),
('Data Structures and Algorithms', 3),
('Database Management Systems', 3),
('Web Development Basics', 2),
('Machine Learning Foundations', 5);

-- Modify the courses table by adding a column course_duration using the ALTER command. 
ALTER TABLE courses
ADD COLUMN course_duration VARCHAR(50);
describe courses;

UPDATE courses
SET course_duration = '12 weeks'
WHERE course_id = 1;

UPDATE courses
SET course_duration = '10 weeks'
WHERE course_id = 2;

UPDATE courses
SET course_duration = '8 weeks'
WHERE course_id = 3;

UPDATE courses
SET course_duration = '6 weeks'
WHERE course_id = 4;

UPDATE courses
SET course_duration = '16 weeks'
WHERE course_id = 5;

-- Drop the course_credits column from the courses table. 
alter table courses drop course_credits;
describe courses;
