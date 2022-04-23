create database mysql_assignment;

show databases;

use mysql_assignment;

create table Worker_table(
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
select * from worker_table;
show tables;

# ASSIGNMENT 1
select first_name as fn from worker_table;
select distinct department from worker_table;
select * from worker_table order by worker_id desc limit 5;

select * from worker_table; 
# ASSIGNMENT 2
select left(first_name,3), first_name from worker_table;
select position('a' in first_name), first_name from worker_table where first_name = 'Amitabh';
select first_name, last_name, department, max(salary)   from worker_table group by department ;

select * from worker_table; 
#assignment 3
select rtrim(first_name) from worker_table;
select department, length(department) from worker_table group by department;
select distinct(salary) from worker_table order by salary desc limit 3,1;

select * from worker_table; 
#assignment 4
select replace(first_name, 'a', 'A'), first_name from worker_table ;
select * from worker_table order by first_name asc;
select * from worker_table order by first_name asc, department desc;
select first_name, last_name,salary from worker_table where salary= (select max(salary) from worker_table);

select * from worker_table; 
#assignment 5
select * from worker_table where first_name not in ('Vipul', 'Satish');
select * from worker_table where first_name like '_____h';
select * from worker_table where first_name like '%h%a';

select * from worker_table; 
#assignment 6
select * from worker_table where joining_date like '2014-02%';
select * from worker_table group by department having count(department)>1;
insert into worker_table values (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account');
insert into worker_table values(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account');
insert into worker_table values(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

select *  from worker_table group by  first_name, last_name, salary, joining_date, department having count(*)>1;
delete from worker_table where worker_id not in (select max(worker_id) from worker_table group by first_name, last_name, salary, joining_date, department);


select max(worker_id) from worker_table group by first_name, last_name, salary, joining_date, department;

DELETE t1 FROM worker_table t1  
inner join worker_table t2   
WHERE  
    t1.worker_id < t2.worker_id AND  
    t1.first_name = t2.first_name;  

select * from worker_table where mod(worker_id,2)=1;

create table Clone_Worker_table(
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

insert into Clone_Worker_table select * from Worker_table;

update Clone_Worker_table set worker_id = 6 where worker_id = 9;
update Clone_Worker_table set worker_id = 7 where worker_id = 10;
update Clone_Worker_table set worker_id = 8 where worker_id = 11;

select * from Clone_Worker_table where worker_id not in (select worker_id from worker_table);

select * from worker_table limit 10;

select * from worker_table order by salary desc limit 4,1;

select * from worker_table order by salary desc;

SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY salary DESC) AS R_NUM, first_name, salary FROM worker_table) as HEllO WHERE R_NUM=5;

select * from worker_table group by salary having count(salary)>1;

select * from worker_table where salary in (select salary from worker_table group by salary having count(salary)>1) order by salary;