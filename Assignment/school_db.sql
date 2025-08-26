#Lab 1: Create a new database named school_db and a table called students with the following columns: student_id, student_name, age, class, and address. 
create database school_db;
use school_db;

create table students(student_id int primary key auto_increment,
					  student_name varchar(50),
                      age int,
                      class varchar(20),
                      address varchar(100)	);

#Lab 2: Insert five records into the students table and retrieve all records using the SELECT statement. 
INSERT INTO students (student_name, age, class, address) VALUES 
('Aarav Mehta', 14, '9A', 'Ahmedabad'),
('Simran Kaur', 13, '8B', 'Chandigarh'),
('Rohan Desai', 15, '10C', 'Mumbai'),
('Anjali Sharma', 12, '7A', 'Delhi'),
('Karan Verma', 14, '9B', 'Jaipur');

SELECT * FROM students;


#Lab 1: Write SQL queries to retrieve specific columns (student_name and age) from the students table. 
select student_name, age from students;

#Lab 2: Write SQL queries to retrieve all students whose age is greater than 13. 
select * from students where age > 13;

#Lab 2: Drop the students table from the school_db database and verify that the table has been removed. 
drop table students;

show tables;


