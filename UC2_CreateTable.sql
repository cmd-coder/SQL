--Use Case 1
create database payroll_service;
use payroll_service;
--Use Case 2
create table employee_payroll
(id int identity(1,1),
 name varchar(25) not null,
 salary money not null,
 start_date date not null
);