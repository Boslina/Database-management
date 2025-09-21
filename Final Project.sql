CREATE DATABASE library;

USE library;

-- creating the members 
CREATE TABLE members (
members_id INT AUTO_INCREMENT PRIMARY KEY,
memberName VARCHAR(100) NOT NULL,
email VARCHAR(50) NOT NULL,
phone VARCHAR(20),
entry_date DATE DEFAULT (CURRENT_DATE)
);

-- Creating table authors
CREATE TABLE authors (
author_id INT AUTO_INCREMENT PRIMARY KEY,
authorName VARCHAR(100) NOT NULL,
country VARCHAR(100)
);

-- creating table book
CREATE TABLE books (
bookId INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(200) NOT NULL,
isbn VARCHAR(30) UNIQUE NOT NULL,
published_year YEAR,
author_id INT,
available_copies INT DEFAULT 1,
FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- create table staff
CREATE TABLE staff (
staffId INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100)  NOT NULL,
role VARCHAR(50),
email VARCHAR(100) UNIQUE NOT NULL
);

-- create table borrowings
CREATE TABLE borrowings (
borrowed_id INT AUTO_INCREMENT PRIMARY KEY,
members_id INT NOT NULL,
bookId INT NOT NULL,
staffId INT NOT NULL,
borrow_date DATE DEFAULT (CURRENT_DATE),
return_date DATE,
FOREIGN KEY (members_id) REFERENCES members(members_id),
FOREIGN KEY (bookId) REFERENCES books(bookId),
FOREIGN KEY (staffId) REFERENCES staff(staffId)
);

-- Inserting data
-- members
INSERT INTO members (memberName,email,phone)
VALUES ('Alice Johnson', 'alice@gmail.com', '080347859023'),
('Jonte Fresh', 'jonte@gmail.com', '08127476390'),
('Peter Babaro', 'peter@gmail.com', '09086532468'),
('Kosoro Fauti', 'kosoro@gmail.com', '08176543256');

-- Insert into authors
INSERT INTO authors(authorName,country)
VALUES ('Chinua Achebe', 'Nigeria'),
('George Orwell', 'UK'),
('Adeola Adegbite', 'Nigeria'),
('Benny Hinn', 'USA');

-- Insert into Books
INSERT INTO books(title,isbn,published_year, author_id, available_copies)
VALUES ('Things Fall Apart', '9781234567890', 1958, 1, 3),
('1984', '9789876543210', 1949, 2, 2),
('Our husband has gone mad again', '37485234567890', 1999, 3, 4),
('Good morning ', '8789876545869', 2001, 4, 2);

-- Insert staff
INSERT INTO staff (name,role,email)
VALUES ('Sarah Admin', 'Librarian', 'sarah@gmail.com'),
('Jane', 'Receptionist', 'Janeh@gmail.com');

-- Insert into borrowings
INSERT INTO borrowings (members_id, bookId, staffId, borrow_date, return_date) 
VALUES (1, 1, 1, '2025-09-10', NULL),
(2, 2, 1, '2025-09-12', '2025-09-16'),
(3, 3, 2, '2025-09-09', NULL),
(4, 4, 1, '2025-09-15', '2025-09-20');



