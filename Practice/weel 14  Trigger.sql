create database _week14
use _week14
--- create main table 
create table Students(
S_ID int not null,
Name Varchar (50),
Grade Varchar (5)
);
truncate table Students
truncate table StudentBackup

insert into students
Values (1,'Ali','A'),
(2,'Sara','B');

select*from Students

create table StudentBackup(
      Student_ID int not null,
	  Name varchar(50),
	  Grade varchar(5));
select*from StudentBackup	  
Create Trigger trr
on Students
After delete
as
begin 
	-- insert the deleted rows into the backup table 'Student'
	insert into StudentBackup(Student_ID,Name,grade)
	--select the data from the special 'DElETED' table which holds the rows beging deleted
	Select S_ID, Name, Grade
	FROM deleted
END;

Create Trigger tri
on Students
After insert
as
begin 
	-- insert the deleted rows into the backup table 'Student'
	insert into StudentBackup(Student_ID,Name,grade)
	--select the data from the special 'DElETED' table which holds the rows beging deleted
	Select S_ID, Name, Grade
	FROM inserted
END;

CREATE TRIGGER truu
ON Students
AFTER UPDATE
AS
BEGIN
    INSERT INTO StudentBackup(Student_ID, Name, Grade)
    SELECT S_ID, Name,Grade
    FROM inserted;
END;

Delete From Students
where S_Id=1;

drop table studentbackup

insert into Students
values(3,'Uzair','C');

select*from StudentBackup
select *from Students

--Update a student grade 
UPDATE students Set Grade ='C' Where S_ID =1;










