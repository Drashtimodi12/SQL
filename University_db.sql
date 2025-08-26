-- Use the CREATE command to create a database university_db. 
CREATE DATABASE university_db;
USE university_db;

-- Create a table authors with the following columns: author_id, first_name, last_name, and country. Set author_id as the primary key. 
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    country VARCHAR(100)
);

-- Create a table publishers with columns: publisher_id, publisher_name, contact_number, and address. Set publisher_id as the primary key and contact_number as unique. 
CREATE TABLE publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(200) NOT NULL,
    contact_number VARCHAR(15) UNIQUE NOT NULL,
    address VARCHAR(300)
);