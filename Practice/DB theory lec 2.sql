---database creation
create database lec_6
---create table department
create table Employee(employeeID int not null,
employeeName varchar(50) not null,
City varchar(20) null,
Salary money not null);
select *from Employee
---create table department
create table Department(
DeptName varchar(50) not null,
EmployeeID int not null,
Position varchar(50) not null);
---to shoe both table
select *from Employee
select *from Department
---inner join application
---select table1.column_name, table1.column_name,table2.column_name,table2.column_name
---on table1.common_column = table2.common_column
select Employee.employeeID, Employee.employeeName, Department.DeptName, Department.Position
from Employee
inner join Department on Employee.employeeID = Department.EmployeeID
select *from Employee
select *from Department
---outer join application
---select table1.column_name, table1.column_name,table2.column_name,table2.column_name
---on table1.common_column = table2.common_column
select Employee.employeeID, Employee.employeeName, Department.DeptName, Department.Position
from Employee
full outer join Department on Employee.employeeID = Department.EmployeeID
select *from Employee
select *from Department
---left join application
---select table1.column_name, table1.column_name,table2.column_name,table2.column_name
---on table1.common_column = table2.common_column
select Employee.employeeID, Employee.employeeName, Employee.City, Employee.Salary, Department.DeptName, Department.Position
from Employee
left join Department on Employee.employeeID = Department.EmployeeID
select *from Employee
select *from Department

---elis
---short name use for you table like instead of using 
---EMployee.Name 
---we use 
---e.Name

---right join application
---select table1.column_name, table1.column_name,table2.column_name,table2.column_name
---on table1.common_column = table2.common_column
select Employee.employeeID, Employee.employeeName, Employee.City, Employee.Salary, Department.DeptName, Department.Position
from Employee
right join Department on Employee.employeeID = Department.EmployeeID
select *from Employee
select *from Department

---cross join application
---select table1.column_name, table1.column_name,table2.column_name,table2.column_name
---on table1.common_column = table2.common_column
select Employee.employeeID, Employee.employeeName, Department.DeptName, Department.Position
from Employee
cross join Department;
select *from Employee
select *from Department

---self join home work






