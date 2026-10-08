-- DDL (Data Defination Language) create, alter,rename,truncate and drop.


create database college;
use college;
show databases;
create table Employee(EmpID int,FirstName varchar(20),LastName varchar(20),EmpAge int, EmpZone varchar(10));
desc Employees;
drop database college;

insert into Employee values(1,"Purva","Badgujar",21,"North");   -- Single Insertion
insert into Employee values(2,"Pooja","Badgujar",23,"North");
insert into Employee values(3,"Jaya","Patil",21,"East");
select * from Employee;

insert into Employee values                  -- Multiple Insertion 
(5,"Om","Badgujar",25,"North"),
(6,"Harsh","Gujar",21,"West"),
(9,"Lina","Gandhi",24,NULL);
select * from Employee;

show tables;
select * from Employee;
update Employee set EmpZone="South" where EmpID=1;        -- Single Updation
update Employee set EmpZone="East" where EmpID=2;
update Employee set EmpZone="west" where EmpID=1;
select * from Employee;
update Employee set EmpAge=23, EmpZone="South" where EmpID=5;     -- Multiple Updation
select * from Employee;

desc Employee;
delete from employee where empID=1;       -- Delete Statement
select * from Employee;
update Employee set FirstName="amit" where EmpID=2;
select * from Employee;
select EmpID, FirstName from Employee;
truncate Employee;
select * from Employee;

--  NOT NULL CONSTRAINTS

create database Company;
use Company;
show databases;
create table Employee(EmpID int ,FirstName varchar(20),LastName varchar(20),EmpAge int);
desc Employee;

-- insert the records

insert into Employee values(NULL,"Ravi","Kumar",25);     -- will show error because EmpID cant be null
insert into Employee values(1, NULL,"Kumar",25); 

-- UNIQUE KEY CONSTARINTS

create table Employee1(EmpID int not null ,FirstName varchar(20),LastName varchar(20), Unique(EmpID));
insert into Employee1 values(NULL, "Rahul","Kumar"); -- error occurs
insert into Employee1 values(1,null,"Kumar");
insert into Employee1 values(1,null,"Kumar"); -- duplicate entry 
insert into Employee1 values(2,null,"Kumar");
select * from Employee1;
desc Employee1;

-- 			Check Constraint while Creating table 

create table Employee2(EmpID int not null ,FirstName varchar(20),LastName varchar(20),EmpAge int, Check(EmpAge>20));
insert into Employee2 values(1,"Mayuri","Patil",29);
insert into Employee2 values(2,"yash","Patil",18);
insert into Employee2 values(3,"yogesh","Patil",20);
insert into Employee2 values(1,"om","Patil",21);
select * from Employee2;

-- add salary column 

alter table Employee2 add column salary int;
select * from Employee2;

-- to drop the salary column

alter table  Employee2  drop salary;
select * from Employee2;

-- add salary column and then add check constraint

alter table Employee2 add column salary int, add check(salary>5000);
select * from Employee2;
insert into Employee2 values(1,"om","Patil",21,7000);
insert into Employee2 values(2,"om","Patil",25,5000);
insert into Employee2 values(3,"om","Patil",19,2000);
select * from Employee2;
show create table Employee2;

alter table Employee2 drop check salary;   -- check the constraint name from show table 
alter table Employee2 drop check employee2_chk_2;  
insert into Employee2 values(3,"om","Patil",45,2000);    -- check if it get executed as we drop the salary check constraint
select * from Employee2;

-- NOT NULL, CHECK AND PRIMARY KEY CONSTARINTS

create table Employee3 (EmpID int not null ,FirstName varchar(20),LastName varchar(20),EmpAge int, check (EmpAge>20),primary key (EmpID));
insert into Employee3 values(3,"om","Patil",60);
insert into Employee3 values(2,"harsh","Patil",35);
insert into Employee3 values(4,"tejas","Gupta",25);
select * from Employee2;


-- applying check constarint in multiple column in single query

create table Employee4 (EmpID int Primary key ,FirstName varchar(20),LastName varchar(20),EmpAge int, salary int);
insert into Employee4 values(NULL,"tejas","Gupta",25);  -- null not allowed
insert into Employee4 values(3,"tejas","Gupta",25,5000);
select * from Employee4;

-- alowing naming and definig a check constraint on multiple column

alter table Employee4 add constraint chk_EmpAge_salary
check(EmpAge>20 AND salary=5000);
 
 show create table Employee4;
 alter table Employee4 drop check chk_EmpAge_salary;  -- removing check constarint
 
 -- DEFAULT CONSTRAINT : set a default value for a column if no other 
 -- value specified 
 
 create table Employee5(EmpID int not null ,FirstName varchar(20),EmpDept varchar(20) Default "Operations");
 desc Employee5;




















