# 24.	Lab 1: Create two tables: departments and employees. Perform an INNER JOIN to display employees along with their respective departments. 
create table departments(dept_id int primary key, dept_name varchar(50)   );
insert into departments (dept_id, dept_name) values
(1, 'HR'), (2, 'IT'), (3, 'Finance');
 

create table employees(emp_id int primary key, emp_name varchar(50), dept_id int,
                       		 foreign key (dept_id) references departments(dept_id)   );
insert into employees (emp_id, emp_name, dept_id) values
(101, 'Alice', 1), (102, 'Bob', 2), (103, 'Charlie', 2), (104, 'David', 3);
 

select employees.emp_id, employees.emp_name, departments.dept_name 
from employees  inner join departments on employees.dept_id = departments.dept_id;

# 25.	Lab 2: Use a LEFT JOIN to show all departments, even those without employees. 
select e.emp_id, e.emp_name, d.dept_name from
employees e join departments d
on e.dept_id = d.dept_id;

# 26.	Lab 1: Group employees by department and count the number of employees in each department using GROUP BY.
select departments.dept_name, 
count(employees.emp_id) AS employees_cout
from employees
inner join departments on employees.dept_id = departments.dept_id
group by departments.dept_name;
 

# 27.	Lab 2: Use the AVG aggregate function to find the average salary of employees in each department. 
alter table employees add emp_salary decimal(10, 2);

update employees set emp_salary = 50000 where emp_id = 101;
update employees set emp_salary = 45000 where emp_id = 102;
update employees set emp_salary = 60000 where emp_id = 103;
update employees set emp_salary = 58000 where emp_id = 104;

select departments.dept_name,
	avg(employees.emp_salary) AS average_salary
from employees
inner join departments on employees.dept_id = departments.dept_id
group by departments.dept_name;


# 28.	Lab 1: Write a stored procedure to retrieve all employees from the employees table based on department. 
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `GetemployeesBydepartment`(In deptName varchar(100))
-- BEGIN
-- 	select emp_id, emp_name, emp_salary
--     from employees
--     inner join departments on employees.dept_id = departments.dept_id
--     where departments.dept_name = deptName;
-- END

CALL GetEmployeesByDepartment('HR');

# 30.	Lab 1: Create a view to show all employees along with their department names. 
select * from school_db.employeedepartmentview
where dept_name = ‘IT’;

# 31.	Lab 2: Modify the view to exclude employees whose salaries are below $50,000. 
select * from empdeptview;

# 32.	Lab 1: Create a trigger to automatically log changes to the employees table when a new employee is added.
CREATE TABLE employees_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    emp_name VARCHAR(50),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

delimiter //

create trigger after_employee_insert
after insert on employees
for each row
begin
    insert into employees_log (emp_id, emp_name)
    values (new.emp_id, new.emp_name);
end;
//
delimiter ;

insert into employees (emp_id, emp_name)
values (1, 'drashti modi');

# 33.	Lab 2: Create a trigger to update the last_modified timestamp whenever an employee record is updated. 
alter table employees 
add last_modified timestamp default current_timestamp on update current_timestamp;

delimiter //

create trigger before_employee_update
before update on employees
for each row
begin
    set new.last_modified = current_timestamp;
end;
//

delimiter ;

update employees 
set emp_salary = emp_salary + 1000 
where emp_id = 101;


-- Start the transaction
START TRANSACTION;

-- Insert first record
INSERT INTO employees (emp_id, emp_name) VALUES (105, 'Alice');

-- Create a savepoint
SAVEPOINT savepoint1;

-- Insert second record
INSERT INTO employees (emp_id, emp_name) VALUES (106, 'Paresh');

-- Oops! Let’s rollback to savepoint
ROLLBACK TO savepoint1;

-- Insert third record
INSERT INTO employees (emp_id, emp_name) VALUES (107, 'Charmi');

-- Commit the transaction
COMMIT;






