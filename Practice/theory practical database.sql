---DDL Commands
--- 1st 
---database creation
create database J4
---shortcut way to access database by using query
use J4
---table creation
create table cs(Employee_id int not null,
Employee_name varchar(20) not null,
Employee_contact nchar(11) not null,
);
---display the table or anything
select * from cs
--- 2nd 
---alter
alter table cs 
add Employee_address varchar(20) not null;
---3rd
---delete existing table or database but here we drop a cloumn
alter table cs
drop column Employee_address
---4th
---remove all data from table but leave the structure of data
truncate table cs
---5th
---rename table 
exec sp_rename 'cs','css'
select * from css
exec sp_rename 'css','cs'
select * from cs
---rename column
exec sp_rename 'cs.Employee_contact','employeecontact'
select * from cs


---DML Commands
---1st (select)
select * from cs
---2nd insertion
insert into cs
values (1234,'okasha',678925489),
(4567,'hadia',145267834),
(5678,'minahil',567890235);
select * from cs
---update(set name where id is like 1234 or any))here it chngs name
update cs set Employee_name='maheen' where Employee_id=1234
---(set id where name is like maheen)here it chngs id
update cs set Employee_id='678' where Employee_name='maheen'
---delete  row from table
delete from cs where Employee_id=4567
---delete column
alter table cs
drop column employeecontact




--Task
---4 attributes
---5 tupples row
---2tables


---DDL and DML commands

---database creation
create database Home

---table creation
create table Members
(M_Name varchar(20) not null,
M_Id int not null,
M_contact nchar(11) not null,
Gender varchar(20) not null,
height float not null);

---insertion of data
insert into Members
values ('Okasha',10,123456789,'female',5.2),
('Hadia',11,125267834,'female',4.9),
('Usama',12,128767834,'male',5.9),
('Minahil',13,9875267834,'female',5.3),
('Maheen',14,9845327834,'female',5.1);

---display whole table
select * from Members

---alter
alter table Members 
add M_weight int;

---delete existing table
alter table cs
drop column Employee_address

---remove all data from table but leave the structure of data
truncate table Members

---rename table 
exec sp_rename 'Members','Member_Info'
select * from Member_Info
exec sp_rename 'Member_Info','Members'
select * from Members

---rename column
exec sp_rename 'Members.M_contact','membercontact'
select * from Members

---DML
---2nd table 
create table Pay(
E_Name varchar(20) not null,
E_Id int not null,
E_contact nchar(11) not null,
Gender varchar(20) not null,
Pay money not null);

---display whole table
select * from Pay

---2nd insertion
insert into Pay
values ('Okasha',10,123456789,'female',50000),
('Hadia',11,125267834,'female',90000),
('Usama',12,128767834,'male',40000),
('Minahil',13,9875267834,'female',70000),
('Maheen',14,9845327834,'female',10000);

select * from Pay

---update(set name where id is like 1234 or any))here it chngs name
update Pay set E_Name='maheen' where E_Id=14
select * from Pay

---(set id where name is like maheen)here it chngs id
update Pay set E_Id=12 where E_Name='maheen'
select * from Pay

---delete  row from table
delete from Pay where E_Id=11
---delete column
alter table Pay
drop column E_contact


Lec 2

---Inner join 










 
