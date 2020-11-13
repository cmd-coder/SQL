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
--Use Case 9
alter table employee_payroll drop column salary;
alter table employee_payroll add basic_pay money, deduction money, taxable_pay money, income_tax money, net_pay money;
--Use Case 10
insert into employee_payroll(name, start_date, gender, address, department) values('Name1','2015-05-05','M','Adddrresss', 'Sales');

create table employee_details(empid int primary key, name varchar(25) not null, start_date date not null, gender varchar(25), phone varchar(25), salid int not null, address varchar(25));
create table company(department_id int primary key, department_name varchar(25));
create table department(department_id int foreign key references company(department_id));
create table payroll_details(salid int primary key, basic_pay int not null, deduction int not null, taxable int not null, income_tax int not null, net_pay int not null);

alter table employee_details add foreign key(salid) references payroll_details(salid);
alter table department add empid int foreign key references employee_details(empid);

--Use Case 11
insert into payroll_details values(101, 4545,78787,565656,56565,5656);
insert into payroll_details values(102, 454,7877,56556,5656,556);
insert into payroll_details values(103, 455,7887,56656,5656,55656);
insert into payroll_details values(104, 445,7787,55656,5655,56956);

insert into employee_details values(1,'Name1','2000-01-01','M','7889788978',101,'Address1');
insert into employee_details values(2,'Name2','2000-01-02','M','7889788979',102,'Address2');
insert into employee_details values(3,'Name3','2000-01-05','T','7889788970',103,'Address3');
insert into employee_details values(4,'Name4','2000-05-01','F','7889788971',104,'Address4');

select * from employee_details;
select * from payroll_details;

insert into company values(501,'.Net');
insert into company values(502,'Sales');
insert into company values(503,'Marketing');

insert into department values(501,1);
insert into department values(503,2);
insert into department values(502,1);

--Use Case 12
--UC4 Rerun
select e.name, e.start_date, e.gender, e.phone, e.address , c.department_name, p.basic_pay, p.deduction, p.taxable, p.income_tax, p.net_pay from employee_details e inner join payroll_details p on p.salid=e.salid inner join department d on d.empid=e.empid inner join company c on d.department_id=c.department_id;
--UC5 Rerun
select p.basic_pay, p.deduction, p.taxable, p.income_tax, p.net_pay from payroll_details p inner join employee_details e on e.salid=p.salid where e.name='Name1';
--UC7 Rerun
select sum(p.net_pay) from payroll_details p inner join employee_details e on e.salid=p.salid where e.gender='M';