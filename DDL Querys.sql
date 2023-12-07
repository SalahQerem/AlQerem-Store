create table sm_user(
 ID int primary key,
 f_name varchar(45),
 l_name varchar(45),
 address varchar(145) not null,
 DOB date);

create table employee(
ID int primary key references sm_user (ID),
salary int,
hire_date date,
manager_id int references employee(ID));
ALTER TABLE employee
MODIFY salary int NOT NULL;
ALTER TABLE employee
MODIFY hire_date date NOT NULL;

create table customer(
ID int primary key references sm_user (ID),
points int,
discount number(3,2));

create table sm_order(
ID int primary key,
total_price number(10,5),
date_time timestamp not null,
state varchar(45) default('NO'),
customer_id int references customer(ID),
employee_id int references employee(ID));

create table brand(
ID int primary key,
name varchar(45),
description varchar(145));

create table product(
ID int primary key,
name varchar(45),
barcode varchar(45),
description varchar(145),
price number(10,5) not null,
brand_id int references brand(ID));

create table order_item(
ID int primary key,
order_id int references sm_order(ID),
quantity int not null,
product_id int references product(ID));

create table imports(
ID int primary key,
quantity int not null,
import_date date,
product_id int references product(ID));

create table product_discount(
ID int primary key,
start_date date not null,
end_date date,
discount_percentage number(3,2) not null,
product_id int references product(ID));

















