#Lab 1: Create a table teachers with the following columns: teacher_id (Primary Key), teacher_name (NOT NULL), subject (NOT NULL), and email (UNIQUE). 
create table teachers(teacher_id int primary key auto_increment,
					  teacher_name varchar(50) not null,
                      subject varchar(50) not null,
                      email varchar(100) unique
                      );
                      
                      
#Lab 2: Implement a FOREIGN KEY constraint to relate the teacher_id from the teachers table with the students table. 
ALTER TABLE students ADD teacher_id INT;

ALTER TABLE students
ADD CONSTRAINT fk_teacher
FOREIGN KEY (teacher_id)
REFERENCES teachers(teacher_id);

#Lab 1: Drop the teachers table from the school_db database. 
drop table teachers; 

