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


-- DATE AND TIME FUNCTION

select now();
select now() as current_datetime;            -- aliase name to the table
alter table customer add column date date;

update customer set date="2024/2/20" where customer_id=1;
update customer set date="2024-5-20" where customer_id=2;
update customer set date="2025-9-8" where customer_id=3;
select* from customer;

-- FILTER DATA FROM TABLE 
-- FILTERING OPERATOR 
-- WHERE , SELECT DISTINCT, AND, OR, NOT, IN, NOT IN, BETWEEN, LIKE, LIMIT, IS NULL

create database organization;
use organization;
create table employee(Empid int not null  primary key, First_name varchar(15),Last_name varchar(15), 
Gender char, Role varchar(20),Dept varchar(15), Manager_id varchar(10));

insert into employee values(1,"Purva","BAdgujar","F","MAnager","Sales","M11");
insert into employee values(2,"Piyush","Patil","M","Head","Sales","M12");
insert into employee values(3,"Om","Gandhi","M","Developer","IT","M13");
insert into employee values(4,"Jaya","BAghul","F","Leader","HR","M14");
insert into employee values(5,"Kavyaa","BAdgujar","F","Manager","Fianace","M15");

select * from employee;



-- DISTINCT KEYWORD
-- THIS IS IN THE SELECT STATEMENT IS USE TO ELIMATE DUPLIICATE ROWS FROM RESULT SET 
-- IT CONSIDER ALL NUULL TO BE SAME 

select distinct Dept from employee order by Dept;         -- to remove the dupkicate values from the table

select distinct Role from employee order by Role;

 -- distinct clause is use to get all the unique values of the column
 
 -- AND OPERATOR :- COMBINES TWO OR MORE BOOLEAN EXPRESSION  AND RETURNS 0,1, NULL 
 -- AND OPEARTOR IS USE FOR FILTERING DATA WITH WHERE CLAUSE
 
 select* from employee where role="Developer" and dept="HR";          -- the combination that are not available in table will return 1, 0 and null
 
 -- OR OPERATOR COMBINES BOTH BOLLEAN EXPRESSION AND RETURN 1 TRUE IF EITHER OF EXPRESSION IS TRUE 
  -- OR OPEARTOR IS USE FOR FILTERING DATA WITH WHERE CLAUSE
  

 select* from employee where role="Developer" OR dept="HR";   -- IF ONE OF THEM IS TRUE IT WILL SHOW BOTH OF THE ROW DATA
 
 
 -- IN OPERATOR
 
 -- IF A VALUE MATCHES WITH ANY VALUES IN A LIST , RETURN 1 OTHERWISE RETURN 0
 
 select * from employee where role in ("Leader","HR");
 
 select * from employee where role in ("Leader","Sales");
 
 -- NOT IN 
 -- FORM BY COMBINE NOT AND IN OPERATOR 
 -- USE TO DETERMINE IF A VALUE DOES NOT MATCH ANY OF THE VALUES IN A LIST
 
 select* from employee where role not in ("Head","Manager");
 
 -- BETWEEN OPERATOR 
 -- DETERMINE WHETHER A VALUE BELONGS IN A RANGE
 -- THE BETWEEN OPERATOR RETURNS NULL IF VALUE , LOW, OR HIGH IS NULL
 
 alter table employee add column Experience int;
select * from employee;
update employee set Experience=8 where Empid=1;
update employee set Experience=10 where Empid=2;
update employee set Experience=2 where Empid=3;
update employee set Experience=5  where Empid=4;
update employee set Experience=6 where Empid=5;


select * from employee where Experience between 11 and 13;           -- Between operator  // not in range 
select * from employee where Experience between 5 and 8;            -- Between operator  // in range
select * from employee where Experience between 5 or 8;       -- wrong syntax
select * from employee where Experience=5 or Experience=7 ;           

-- LIKE OPERATOR 
-- THAT WHETHER OR NOT A STRING CONTAIN SPECIFIC PATTERN  
select * from employee where Last_name like "P%";          -- the last name starts from P shows me result

-- LIMIT OPERATOR
-- LIMIT CALUSE IN SELECT STATEMENT IS USE TO LIMIT THE NUMBER OF ROWS RETURNED 
select* from employee;
select* from employee order by Experience limit 5;
select* from employee order by Experience;


-- IS NULL
-- RETURN TRUE 1 IF VALUE IS NULL OTHERWISE FALSE 

insert into employee values(7,"Asha","Joshi","F","President","HR"," ",null);
insert into employee values(8,"Payal","PAtil","F","Manager","HR"," ",null);
insert into employee values(9,"Usha","Pawar","F","Developer","HR"," ",null);


select * from employee where Manager_id is null;
select * from employee where Experience ;

select * from employee where Manager_id is not null;
select * from employee where Role is not null;



-- AGGREGATE FUNCTION
-- COUNT, SUM, AVG, MIN ,MAX
select count(*) from employee;
select count(empid) from employee where dept="HR";
select Min(Experience) from employee;
select Max(Experience) from employee;
select Sum(Experience) from employee;
select Avg(Experience)as emp_exr from employee;

select* from employee;

-- group by clause 
-- divides a set of rows into subgroups depending on column or expression values.
-- The group by function is used with aggregate functions such as SUM,COUNT,MAX,MIN,AVG

-- find the dept wise employee count
select dept,count(*) as empoyee_count from employee group by dept;

-- find the role wise employee count
select role,count(*) as empoyee_count from employee group by role;

-- find the gender wise employee count
select gender,count(*) as empoyee_count from employee group by gender;

-- HAVING CLAAUSE
-- EACH GROUP PRODUCE BY GROUP BY CLAUSE IS EVALUATED BY HAVING CLAUSE AND IF RESULT IS TRUE THE ROW IS INCLUDED IN THE RESULT SET
-- THE HAVING CLAUSE WAS ADDED TO SQL BECAUSE THE WHERE KEYWORD CANNNOT BE USE WITH AGGREGATE FUNCTION

-- dept wise sum of the experience of the employee 
select * from employee;
select dept,sum(Experience) as total_experience 
from employee group by dept 
having total_experience>=10 and total_experience<=20;

-- fetch dept wise employee count using having clause and sort the data
select dept, count(Empid)
from employee
group by dept
having count(Empid)>=2
order by count(Empid);

select dept,sum(Experience) as total_experience 
from employee group by dept 
having total_experience>=10 or total_experience<=20;
































