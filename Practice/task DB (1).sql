---create database
create database Student
---create table 
create table student_details(ID int not null,S_name varchar(50) not null,Father_name varchar(50) not null,Age int not null,Contact nchar(11) not null,city varchar(50) not null);
---display whole data
select * from student_details
---insert data into table
insert into student_details
values (01,'okasha','naeem',19,112,'pindi'),
(02,'sana','zahid',20,67798,'sialkot'),
(03,'ayesha','noman',23,7654,'sahiwal'),
(04,'sobia','fahad',24,78946,'lahore'),
(05,'bilal','afaq',18,3456,'okara'),
(06,'awais','usama',24,890,'bahawalpur'),
(07,'hadia','hussain',17,6788,'multan');


---display data row wise 
select * from student_details where age>18 and city='lahore'

 ---delete data from table
 delete from student_details where ID=4;
 select * from student_details 

 ---update records in table 
 update student_details
 set age=21 where ID=6
 ---display specific column data
 select ID,S_name,Age,Contact from student_details
