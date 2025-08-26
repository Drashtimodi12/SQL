CREATE DATABASE product_app;
USE product_app;

create table product_manager(
	id int primary key auto_increment,
	username varchar(50),
    password varchar(50)
    );
    
create table customer(
	id int primary key auto_increment,
	username varchar(50),
    password varchar(50)
	);
    
create table products(
	id int primary key auto_increment,
	name varchar(50),
    quantity int,
    price float
    );
    
create table orders(
	id int primary key auto_increment,
    customer_id int,
    product_id int,
    foreign key (customer_id) references customer(id),
    foreign key (product_id) references products(id)
    );