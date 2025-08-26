#DQL

select * from emp;
select name, age from emp;
select distinct(dept) from emp;

select * from emp where dept='HR';
select * from emp where dept='HR' or dept='IT';
select * from emp where dept='HR' and salary<50000;

select * from emp where dept in ('IT', 'HR','Marketing');
select * from emp where dept not in ('IT');

select * from emp where name like 'J%';
select * from emp where name like '%e';
select * from emp where name like '%o%';
select * from emp where name like '_o%';

select * from emp order by age;
select * from emp order by age desc;

select * from emp limit 0,5;
select * from emp limit 5,5;

select sum(salary) as totalsalary from emp;
select avg(salary) from emp;
select max(salary) from emp;
select min(salary) from emp;
select count(*) from emp;

select count(distinct dept) as totaldept from emp;

#maxsal
select * from emp where salary=(select max(salary) from emp);
select * from emp order by salary desc limit 0,1;

#second max
select * from emp where salary = (select max(salary) from emp where salary < (select max(salary) from emp));
select * from emp order by salary desc limit 1,1;

select max(salary),dept from emp group by dept;