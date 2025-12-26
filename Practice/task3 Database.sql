create database hospital_details
---Patient Information
create table Patient_Information(Patient_Id Int not null, 
FirstName varchar(50) not null,
LastName varchar(50) not null, 
Gender Char not null, 
DOB datetime not null,
ContactNumber nchar(11) not null);
---Doctor's Information
create table Doctor_information(Doctor_ID int not null,
FirstName varchar(50) not null,
LastName varchar(50) not null,
Specialaization varchar(50) not null,
contactNumber nchar(11) not null);
---Nurses history
create table Nurses(NurseID int not null,
FirstName varchar(50) not null,
LastName varchar(50) not null,
Nurse_shift varchar(50) not null,
ContactNumber nchar(11) not null);
---Department
create table Department(Depatment_Id int not null,
Depatment_Name varchar(50) not null,
Head_Doctor_ID int not null);
---Appointments
create table Appointments( Appointment_Id int not null,
Appointment_Date datetime not null,
Appointment_Time datetime not null,
Patient_Id int not null,
Dostor_ID int not null);
---ward information
create table Ward( WardType varchar(50) not null,
Ward_Name varchar(50) not null,
Ward_Capacity nchar(10) not null);

drop table Nurses
drop table Department 
drop table Patient_Information
select * from Patient_Information
---addition of column middle name
alter table Patient_Information
add middle_Name varchar(50) not null;
---addition of column consultationFee 
alter table Doctor_information
add consultationFee nchar(10) not null;
---addition of column wardfloor
alter table Ward
add WardFloor varchar(50) not null;
---addition of column Qualification
alter table Nurses
add Qualification varchar(50) not null;
---remove capacity column
alter table Ward
drop column Ward_capacity;
---remove Appointment time from appointment table
alter table Appointments
drop column Appointment_Time;
---drop head doctor column
alter table Department
drop column Head_Doctor_ID;