

---

# 📚 Library Management Database – SQL Final Project

## 📖 Project Overview

This project implements a **Library Management System** using SQL.
The database is designed to manage **members, authors, books, staff, and borrowings**, ensuring efficient record-keeping and relationships between entities.

---

## 🏗 Database Schema

### **1. Members Table**

Stores information about library members.

```sql
CREATE TABLE members (
    members_id INT AUTO_INCREMENT PRIMARY KEY,
    memberName VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    entry_date DATE DEFAULT (CURRENT_DATE)
);
```

### **2. Authors Table**

Stores information about book authors.

```sql
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    authorName VARCHAR(100) NOT NULL,
    country VARCHAR(100)
);
```

### **3. Books Table**

Stores details of books, linking each to an author.

```sql
CREATE TABLE books (
    bookId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(30) UNIQUE NOT NULL,
    published_year YEAR,
    author_id INT,
    available_copies INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
```

### **4. Staff Table**

Stores details of staff who manage library operations.

```sql
CREATE TABLE staff (
    staffId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL
);
```

### **5. Borrowings Table**

Tracks which members borrow which books and which staff handled the transaction.

```sql
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
```

---

## 📊 Sample Data

### Members

```sql
INSERT INTO members (memberName,email,phone) VALUES
('Alice Johnson', 'alice@gmail.com', '080347859023'),
('Jonte Fresh', 'jonte@gmail.com', '08127476390'),
('Peter Babaro', 'peter@gmail.com', '09086532468'),
('Kosoro Fauti', 'kosoro@gmail.com', '08176543256');
```

### Authors

```sql
INSERT INTO authors(authorName,country) VALUES
('Chinua Achebe', 'Nigeria'),
('George Orwell', 'UK'),
('Adeola Adegbite', 'Nigeria'),
('Benny Hinn', 'USA');
```

### Books

```sql
INSERT INTO books(title,isbn,published_year, author_id, available_copies) VALUES
('Things Fall Apart', '9781234567890', 1958, 1, 3),
('1984', '9789876543210', 1949, 2, 2),
('Our husband has gone mad again', '37485234567890', 1999, 3, 4),
('Good morning ', '8789876545869', 2001, 4, 2);
```

### Staff

```sql
INSERT INTO staff (name,role,email) VALUES
('Sarah Admin', 'Librarian', 'sarah@gmail.com'),
('Jane', 'Receptionist', 'Janeh@gmail.com');
```

### Borrowings

```sql
INSERT INTO borrowings (members_id, bookId, staffId, borrow_date, return_date) VALUES
(1, 1, 1, '2025-09-10', NULL),
(2, 2, 1, '2025-09-12', '2025-09-16'),
(3, 3, 2, '2025-09-09', NULL),
(4, 4, 1, '2025-09-15', '2025-09-20');
```

---

## ✅ Key Features

* **Normalized Database** (avoids redundancy).
* **Foreign Keys** maintain referential integrity.
* **Tracks book availability** and borrowing history.
* **Manages members, staff, authors, and books efficiently.**

---

## 🔍 Example Queries

📌 Get all borrowed books and their borrowers:

```sql
SELECT m.memberName, b.title, br.borrow_date, br.return_date
FROM borrowings br
JOIN members m ON br.members_id = m.members_id
JOIN books b ON br.bookId = b.bookId;
```

📌 List books by Nigerian authors:

```sql
SELECT b.title, a.authorName
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE a.country = 'Nigeria';
```

📌 Count available copies of each book:

```sql
SELECT title, available_copies
FROM books;
```

---

## 🚀 How to Run

1. Create a database:

   ```sql
   CREATE DATABASE library;
   USE library;
   ```
2. Run the table creation scripts in order.
3. Insert the sample data.
4. Run the example queries to test functionality.

---
## 🛠 Tools & Technologies Used

- **Database System:** MySQL (Relational Database Management System)
- **SQL Features:** DDL (CREATE, ALTER, DROP), DML (INSERT, UPDATE, DELETE), DQL (SELECT, JOIN)
- **Normalization:** Up to 3NF (Third Normal Form)
- **Data Integrity:** Primary Keys, Foreign Keys, Constraints (UNIQUE, NOT NULL, DEFAULT)
- **Environment:** MySQL Workbench / phpMyAdmin / Command Line (depending on your setup)
- **Version Control:** Git & GitHub (for project submission and collaboration)

---

## 📌 Author

**\Abosede Bamidele** – SQL & Database Final Project


