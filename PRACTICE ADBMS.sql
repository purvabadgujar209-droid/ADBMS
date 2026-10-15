create database school;
use school;
show databases;
create table student(student_id int, student_name varchar(20),city varchar(20));
desc student;
create table staff(staff_id int, staff_name varchar(20),staff_address varchar(20),department varchar(20));
desc staff;
show tables;
show columns from staff;

alter table student add gender varchar(10);
alter table student modify gender char;
alter table staff add work varchar(20);

create table teacher(teacher_id int not null, teacher_name varchar(20), teacher_division char );
show tables;

desc staff;
alter table staff add (staff_contact int, is_present bool);
alter table staff drop work ;
alter table staff add primary key (staff_id), add staff_salary float ;
alter table staff modify staff_salary int;
alter table student add primary key(student_id);
alter table student add teacher_id int;
alter table teacher add primary key(teacher_id);
alter table student add constraint fk_teacher_student foreign key(teacher_id)references teacher(teacher_id);
desc student;
SHOW CREATE TABLE student;
