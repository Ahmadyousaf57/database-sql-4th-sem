---create database
create database School
---create table
create table Result (ID int not null,
S_Name varchar(50) not null,
class varchar(50) not null,
Marks int not null,
Gender varchar(50) not null);
---to view whole table
select * from Result
insert into result values(11, 'Sara Khan', 'Five', 82,' female'); 
---insert three more students into table
insert into result values(12,'Okasha Naeem','Seven',69, 'female'),
(13,'hadia','nine',94, 'female'),
(14,'Usama','Three',46, 'male');
---sql command to display the students who are in four class
select * from result where Class='Four'
---sql command to display the male student who marks are above 80
select * from result where Marks>80 and Gender='Male'
---the students who are either in class three or marks are above 75
select * from result where Marks>75 or Class='Three'
