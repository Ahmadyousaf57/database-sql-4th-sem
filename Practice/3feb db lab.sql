select * from patient  where gender='male' and charges>400
---if the datatype is varchar ha to null single quotation ma likh deni ha

select * from patient where age=null
(---1nf
---ik row ky against single value ani chahiya /har cell ma single value ho
---ik chhez ky against ik record hona chahiya no D0uplication
---2nf
---agr kisi par koi nai key nai lagi to or wo kisi primary key par depend kar rahy hain to 2nf ma ha table
---3nf
---non key attributes ka non key attributes par depend karna)



---kisi table par primary key kesy lagaty hain/primary key at creation time
create table tbl_tbl1
(employy_id int not null primary key,
employee_name varchar(50) not null unique,
employee_age int not null,
employee_salary money not null unique,
employee_address varchar(50) not null,
employee_contact nchar(11) null unique
);

create table tbl_tbl2
(employy_id int not null identity (1001,5) primary key,
employee_name varchar(50) not null,
employee_age int not null,
employee_salary money not null,
employee_address varchar(50) not null,
employee_contact nchar(11) null unique
);

create table tbl_tbl3
(employy_id int not null identity (1001,5) primary key,
employee_name varchar(50) not null,
employee_age int not null,
employee_salary money not null,
employee_address varchar(50) not null,
employee_contact nchar(11) null unique,
Manage_Id int foreign key references tbl_tbl1(employy_id)
);

