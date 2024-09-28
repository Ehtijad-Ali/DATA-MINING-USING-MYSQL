create database company;

use company;

create table department
(
dpt_id int auto_increment primary key not null unique,
dpt_name varchar (100) not null
);

create table employees
(
emp_id int auto_increment primary key not null,
first_name varchar(50) not null unique,
last_name varchar(50) not null unique,
hire_date date,
dpt_id int,
foreign key(dpt_id) REFERENCES department(dpt_id)
);

insert into department VALUES 
(1, 'SALES'),
(2,'MARKETING'),
(3,'HR'),
(4, 'FINANCE'),
(5,'IT'),
(6, 'OPERATIONS');


insert into employees VALUES
(1,'Jhon' ,'Doe', '2023-01-15',1),
(2,'Jane','Smith','2022-05-22',2),
(3,'Michael','Jhonson','2021-09-10',3),
(4,'Alice' ,'Williams', '2023-02-10',4),
(5,'Bob','Dog','2023-03-15',5),
(6,'Charlie' ,'Johnson', '2023-04-20',6),
(7,'David','Brown','2023-05-25',4),
(8,'Eva' ,'Jones', '2023-06-30',5);


select * from department;
select * from employees;

select first_name, last_name from employees where dpt_id = 4;
select first_name, last_name from employees where dpt_id in (4);
select first_name, last_name from employees where dpt_id between 4 and 4;

select first_name, last_name,hire_date from employees where hire_date between '2023-01-15' and '2023-06-30' order by hire_date desc;
select first_name, last_name from employees where hire_date != '2022-05-22' and hire_date != '2021-09-10';
select first_name, last_name from employees where dpt_id not in (2, 3) order by first_name desc, last_name desc;

select * from department order by  dpt_name desc;
select * from employees where dpt_id = 4 order by last_name desc;
select * from employees where dpt_id = 5 order  by first_name asc;

select count(dpt_id) from employees where dpt_id = 4;
select sum(dpt_id) from employees;
select avg(dpt_id) from employees;
select min(dpt_id) from employees;
select max(dpt_id) from employees;

select count(dpt_name) from department;
select * from department order by dpt_name desc;

UPDATE department SET dpt_name = 'Operations and Logistics' where dpt_id = 6;

DELETE from employees where emp_id = 8;

select * from employees where dpt_id = 4;
select * from department where dpt_name = 'FINANCE';


select dpt_id, dpt_name from department where dpt_id = 3 ;

select dpt_id, dpt_name from department where dpt_id in(1 ,3,5) ;

select first_name,last_name from employees where emp_id = 5;

select first_name,last_name from employees where first_name like "j%";

select first_name,last_name from employees where last_name like "%h";

select first_name,last_name, hire_date from employees where last_name like "%_h_%";

select first_name,last_name from employees where last_name != 'MARKETING';

select first_name,last_name from employees where hire_date >  '2020-01-15';

select dpt_id , count(*) as num_employees from employees group by dpt_id;

select min(hire_date) as Hire_Date from employees  group by hire_date;
