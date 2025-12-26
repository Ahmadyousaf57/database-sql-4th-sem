-- single line comment
/*multiple line comment
------------------------
*/
--create database
create database BSCS_4J_DB_LAB

create DATABASE BSCS_4J_DB_Temp
--delete database
Drop database BSCS_4J_DB_Temp

--create table 
create table Fee_Details 
(Student_ID int not null,
Invoice_No nchar(10) not null,
Fine money ,
Fee money not null);

 
 -- create database Hospital Management System
 create database HMS
 --create table login detail
 create table login_detail
 (patient_Name varchar(100) not null ,
 Age int not null,
 Phone_Number nchar(11) not null,
 Email varchar(50) not null, 
 user_password int not null);
 --create table doctor
 create table doctor_detail
 (doctor_Name varchar(100) not null,
 doctor_specialization varchar(50) null ,
 office_detail  varchar(100) not null,
 doctor_Id int not null)
 --create table doctor
 create table patient_detail
 (Patient_Name varchar(100) not null,
 Patient_ward_number int not null ,
 Patient_age  int not null,
 Patient_Id int not null);
 create table Appointment_details
 (Appointment_Number int not null,
 Appointment_date_time datetime not null ,
 doctor  int not null );
 --delete table
 drop table Fee_Details
 --alter table/update Table structure
 alter table Fee_Details 
 add S_Name varchar(50) null;
 --delete column from existing table
 alter table Fee_Details drop column S_Name