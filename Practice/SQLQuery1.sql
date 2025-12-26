create database lec_6
create table employees(
employee_id int,
name varchar(50),
city varchar(50),
salary float)
INSERT INTO employees (employee_id, name, city, salary) 
VALUES 
(1, 'Ayesha Malik', 'Karachi', 60000),
(2, 'Usman Tariq', 'Islamabad', 70000),
(3, 'Usman Tariq', 'Islamabad', 70000),
(3, 'Usman Tariq', 'Islamabad', 70000),
(4, 'Sara Ahmed', 'Faisalabad', 55000),
(5, 'Sara Ahmed', 'Faisalabad', 55000),
(5, 'Sara Ahmed', null, 55000);
create table Department(
dept_name varchar(50),
employee_id int,
Position varchar(50))
INSERT INTO Department (dept_name,employee_id,Position) 
VALUES('marketing',3,'manager'),
('operations',4,null),
('sale',5,'executive'),
('HR',8,'item'),
('Production',11,'senior');
select *from employees;
select *from Department;
--inner join
select employees.employee_id,employees.name,Department.dept_name,Department.position
from employees
inner join department on employees.employee_id=Department.employee_id;
--full outer join
select employees.employee_id,employees.name,Department.dept_name,Department.position
from employees
full outer join department on employees.employee_id=Department.employee_id;
--left join
select employees.employee_id,employees.name,employees.city,employees.salary,Department.dept_name,Department.position
from employees
left join department on employees.employee_id=Department.employee_id;
--with alice
select e.employee_id,e.name,e.city,e.salary,D.dept_name,D.position
from employees e
left join department D on e.employee_id=D.employee_id;
--with cross join
select employees.employee_id,employees.name,employees.city,employees.salary,Department.dept_name,Department.position
from employees
cross join department;
--self join
