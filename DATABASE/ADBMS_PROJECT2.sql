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
 
--- Insert query 



-- indexing
-- INDEX IN MYSQL 
select * from Employee5;
create index demoindex on Employee5(FirstName);
show indexes from Employee5;

create index demoindex2 on Employee5(FirstName,EmpDept);
show indexes from Employee5;
drop index demoindex2 on Employee5;
show indexes from Employee5;

-- AUTO INCREMENT
create table Persons(
 Personid int not null auto_increment, 
 LastName varchar(40) not null,
 Firstname varchar(40),
 age int,
 primary key(Personid));
 
 desc Persons;
 
 insert into Persons(Lastname, FirstName,Age)values("Patil","Jyoti",35);
 insert into Persons(Lastname, FirstName,Age)values("Badgujar","Purva",45);
 insert into Persons(Lastname, FirstName,Age)values("Patil","Om",15);
 
 select * from Persons;



-- TCL




create database TCL;
use TCL;
create table orders
(
order_id int primary key , customer_name varchar(100),
status varchar(50)
);
desc orders;

-- autocommit=0;
/* in mysl auto commit mode is enable by default. so in such cases succeded  
transactions are automatically commited.to disable the auto commit mode we are using this.
 also we can not  disable the auto commit mode using DDL command.*/


set autocommit=0;
-- Use Start transition or Begin 
Begin;

insert into orders value(101,"Geet","Pending");
insert into orders value(102,"Bob","Pending");
desc orders;
select* from orders;
update orders set customer_name="Raj" where order_id=102;
select* from orders;
rollback;
commit;


-- for commit
insert into orders value(101,"Geet","Pending");
insert into orders value(102,"Bob","Pending");
select* from orders;
commit;
update orders set customer_name="Raj" where order_id=102;
rollback;
select* from orders;

-- insert a few orders
insert into orders value( 103,"Purva","Pensding");
insert into orders value( 104,"Piyush","Pending");
savepoint sp;
select* from orders;

-- update one order
update orders set status="shipped" where order_id=103;
savepoint sp2;
rollback to savepoint sp;

-- delete another order
delete from orders where order_id=103;
savepoint sp3;

-- we want to undo the delete but keep the update
rollback to savepoint sp2;
select * from orders;
rollback;
truncate table orders;


-- DQL (DATA QUERY LANGUAGE)

 
create database User;
use User;
create table customer(customer_id int, customer_name varchar(20),city varchar(20), Product varchar(20), Prize int);
desc customer;
insert into customer value(1,"Piyush","Jalgaon","Laptop",5000);
insert into customer value(2,"Om","Nashik","Phone",4000);
insert into customer value(3,"Purva","Pune","TV",1000);

select* from customer;
alter table customer add primary key(customer_id);
select customer_id,customer_name,city from customer; 
select * from customer where customer_id=3;               -- # use * because we want row 3 but all the columns of the table
select * from customer where customer_id=3 or customer_id=1 ;  
select * from customer where customer_id=3 and customer_id=1 ;         -- null is showing   


-- CLONE TABLE

create table Clonetable as select * from customer;
select * from Clonetable;
drop table Clonetable;

-- WHERE CLAUSE

select customer_name,city from customer;
select customer_name,city from customer where customer_id=1;
select customer_name, Product, Prize from customer where Prize>15000;

select * from customer where city="Jalgaon";



-- SORTING DATA USING ORDER BY SINGLE COLUMN

select*from customer order by Prize;        -- asc for ascending ording but it is Bydefault
select*from customer order by Prize desc;  -- for descending order

-- SORTING DATA USING ORDER BY MULTIPLE COLUMN

select*from customer order by Prize,city;   -- first preference should be mentioned  
select*from customer order by city,Prize;     -- first preference should be mentioned 

select*from customer order by city desc,Prize asc; 


-- SINGLE ROW FUNCTION 
-- CASE CONVERSION FUNCTION ( MEANS FROM LOWERCASE TO UPPER , UPPER TO LOWER)

select upper(customer_name), lower(product) from customer where customer_id<3;  -- case conversion

select upper(customer_name), lower(product) from customer ;  -- to get this effect on all records no need of where clause

alter table customer add column last_name varchar(20);  -- to add one more column
select*from customer;

update customer set last_name="sharma" where customer_id =1 ;
update customer set last_name="patil" where customer_id =2 ;
update customer set last_name="jain" where customer_id =3 ;

-- CONCATE TWO COLUMN
select concat(customer_name," ",last_name) from customer; -- combine name of column

select concat(customer_name," ",last_name)as FullName from customer; -- as aliase name 



-- USE OF SUBSTR AND INSTR FUNCTION

-- SUBSTRING QUERY 
select substr(customer_name,1,3) from customer;
select substr(customer_name,0,3) from customer;        -- nothing because has 0 starting point
select substr(customer_name,1,0) from customer;        -- nothing because has 0 ending point



-- INSTRING QUERY 
select instr(customer_name,"a") as position from customer;

insert into customer values(4,'Ankita','pune','iot', 15000, 'verma');
select*from customer;


select substr(customer_name,1,2),instr(customer_name,"a")from customer;    -- both substr and instr at a time

select substr(customer_name,1,2)as Substring,instr(customer_name,"y")as Instring from customer;    -- both substr and instr at a time as alianse name


select substr(customer_name,1,2),instr(customer_name,"y")from customer where customer_id<3;


































