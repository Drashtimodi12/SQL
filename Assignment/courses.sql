#Lab 1: Create a table courses with columns: course_id, course_name, and course_credits. Set the course_id as the primary key. 
create table courses(course_id int primary key,
					 course_name varchar(50),
                     course_credits int
                     );

#Lab 1: Modify the courses table by adding a column course_duration using the ALTER command. 
alter table courses add course_duration varchar(50);

#Lab 2: Drop the course_credits column from the courses table. 
alter table courses drop column course_credits;

#Lab 1: Insert three records into the courses table using the INSERT command. 
insert into courses (course_id, course_name, course_duration) values 
(101, 'Mathematics', '3 Months'),
(102, 'Physics', '4 Months'),
(103, 'Computer Science', '6 Months');

INSERT INTO courses (course_id, course_name, course_duration) VALUES
(104, 'Mathematics', '3 Months'),
(105, 'Physics', '4 Months'),
(106, 'Computer Science', '6 Months'),
(107, 'English Literature', '2 Months'),
(108, 'Data Science', '5 Months');

#Lab 2: Update the course duration of a specific course using the UPDATE command. 
update courses set course_duration = '5 Month' where course_id = 102;

#Lab 3: Delete a course with a specific course_id from the courses table using the DELETE command. 
delete from courses where course_id = 101;

#Lab 1: Retrieve all courses from the courses table using the SELECT statement. 
select * from courses;

#Lab 2: Sort the courses based on course_duration in descending order using ORDER BY.
select * from courses order by course_duration desc;

#Lab 3: Limit the results of the SELECT query to show only the top two courses using LIMIT. 
select * from courses limit 2;

#Lab 1: Create two new users user1 and user2 and grant user1 permission to SELECT from the courses table. 
-- Create two new users
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password1';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'password2';

-- Grant SELECT permission on the `courses` table to user1
GRANT SELECT ON school_db.courses TO 'user1'@'localhost';


#Lab 2: Revoke the INSERT permission from user1 and give it to user2. 
-- Revoke INSERT permission from user1 (if it was previously granted)
REVOKE INSERT ON school_db.courses FROM 'user1'@'localhost';

-- Grant INSERT permission to user2
GRANT INSERT ON school_db.courses TO 'user2'@'localhost';



#Lab 1: Insert a few rows into the courses table and use COMMIT to save the changes. 
start transaction;

INSERT INTO courses (course_id, course_name, course_duration) VALUES
(109, 'Biology', '4 Months'),
(110, 'Economics', '3 Months');

commit;

#Lab 2: Insert additional rows, then use ROLLBACK to undo the last insert operation.
start transaction;

INSERT INTO courses (course_id, course_name, course_duration) VALUES
(11, 'Geography', '3 Months'),
(12, 'Artificial Intelligence', '6 Months');

rollback;

#Lab 3: Create a SAVEPOINT before updating the courses table, and use it to roll back specific changes. 
start transaction;

insert into courses (course_id, course_name, course_duration)
values (10, 'History', '4 Months');

savepoint abc;

update courses set course_duration = '10 Months' where course_id = 10;

rollback to abc;

commit;


# 29.	Lab 2: Write a stored procedure that accepts course_id as input and returns the course details. 
call GetCoursesDetails(10);


