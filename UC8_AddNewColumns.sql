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
--Use Case 3
insert into employee_payroll values('Name1',454545,'2015-4-8');
--Use case 4
select * from employee_payroll;
--Use Case 5
insert into employee_payroll values('Name2',788787,'2045-4-7');
insert into employee_payroll values('Name3',565656,'2016-5-04');
select salary from employee_payroll where name='Name2';
select * from employee_payroll where start_date between '2000-01-01' and GETDATE();
--Use Case 6
alter table employee_payroll add gender varchar(1);
update employee_payroll set gender='M' where name='Name1';
update employee_payroll set gender='F' where name='Name2';
update employee_payroll set gender='T' where name='Name3';
select * from employee_payroll;
--Use Case 7
insert into employee_payroll values('Name4',56523,'2016-5-07','M');
select sum(salary) from employee_payroll where gender='M' group by gender;
select avg(salary) from employee_payroll where gender='M' group by gender;
select min(salary) from employee_payroll where gender='M' group by gender;
select max(salary) from employee_payroll where gender='M' group by gender;
select count(salary) as 'No. of employees' from employee_payroll where gender='M' group by gender;
--Use Case 8
alter table employee_payroll add address varchar(50);
alter table employee_payroll add constraint df_address default 'Milky Way Galaxy' for address;
insert into employee_payroll(name, salary, start_date, gender) values('Name5',523,'2016-5-07','F');
alter table employee_payroll add phone varchar(25);
alter table employee_payroll add department varchar(25);
update employee_payroll set department='.Net';
alter table employee_payroll alter column department varchar(50) not null;
