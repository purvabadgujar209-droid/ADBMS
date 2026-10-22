create database basicjoin;
use basicjoin;
create table employees(employee_id int primary key, ename varchar(20));
desc employees;

insert into employees (employee_id,ename) values
(101, "Purva"),
(102, "Asha"),
(103, "Megha"),
(104, "Yash");

select* from employees;

create table projects( project_id int primary key , pname varchar(30), employee_id int, 
foreign key(employee_id) references employees(employee_id));

desc projects;

insert into projects(project_id,pname,employee_id)values(1,"PROJECT A",104),(2,"PROJECT b",101),(3,"PROJECT c",102),(4,"PROJECT d",103);


insert into projects values(6,"PROJECT F",104);
insert into projects values(7,"PROJECT F",null);

insert into employees values(105,"Sanjay");
insert into employees values(106,"Sanjay");

select* from projects;


# INNER JOIN 
-- ONLY MATCHING RECORD WILL DISPLAY FROM EMPLOYEES AND PROJECTS TABLE

select* from employees
join projects
on employees.employee_id = projects.employee_id;


#FETCH EMPLOYEE NAME AND THE PROJECT NAME THEY BELONG TO

select ename, p.name from employees e
inner join projects p
on e.employee_id = p.employee_id;


#execute the same query using right join to check whether it execute or not
#right join = inner join + any additional records in the right table
select ename, p.pname from employees e
right join projects p
on e.employee_id = p.employee_id;

# reverse the table sides
select ename, p.name from projects p
right join employees e
on e.employee_id = p.employee_id;


#left join = inner join + any additional records in the left table
select e.employee_id, e.ename, p.pname from employees e 
left join projects p on e.employee_id = p.employee_id;

insert into projects values(7,"PROJECT G",107);
select *from employees;
insert into projects values(6,"PROJECT F",106);


# FULL OUTER JOIN USING UNION 
# display matching and non matching data from both the table 

select * from employees                                                      -- need to display entire table so direct table name is use instead of object
left join projects
on employees.employee_id = projects.employee_id                              -- we use object name when we want to display a certain column 
union
select* from employees
right join projects
on employees.employee_id = projects.employee_id;

# DISPLAY EMPLOYEE NAME WHO HAS BEEN ASSIGNED ANY PROJECT 
select employees.ename,projects.pname
from employees
left join projects
on employees.employee_id = projects.employee_id
where projects.employee_id is not null;


# DISPLAY EMPLOYEE NAME WHO HAS NOT BEEN ASSIGNED ANY PROJECT 
select employees.ename,projects.pname
from employees
left join projects
on employees.employee_id = projects.employee_id
where projects.employee_id is null;

drop database  basicjoin;

drop table employees;





