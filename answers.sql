-- Step 1: Create the Library Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Step 2: Create the Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthdate DATE
);

-- Step 3: Create the Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    published_date DATE,
    genre VARCHAR(50),
    available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Step 4: Create the Members Table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE
);

-- Step 5: Create the Book_Transactions Table
CREATE TABLE Book_Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Step 6: Insert Sample Data

-- Insert some authors
INSERT INTO Authors (name, birthdate) VALUES 
('J.K. Rowling', '1965-07-31'),
('George Orwell', '1903-06-25'),
('J.R.R. Tolkien', '1892-01-03');

-- Insert some books
INSERT INTO Books (title, author_id, published_date, genre) VALUES 
('Harry Potter and the Sorcerer\'s Stone', 1, '1997-06-26', 'Fantasy'),
('1984', 2, '1949-06-08', 'Dystopian'),
('The Hobbit', 3, '1937-09-21', 'Fantasy');

-- Insert some members
INSERT INTO Members (name, email, join_date) VALUES 
('Alice Johnson', 'alice@example.com', '2023-05-01'),
('Bob Smith', 'bob@example.com', '2023-06-15'),
('Charlie Brown', 'charlie@example.com', '2023-07-10');

-- Insert some transactions
INSERT INTO Book_Transactions (book_id, member_id, borrow_date, return_date) VALUES 
(1, 1, '2025-05-01', '2025-05-15'),
(2, 2, '2025-05-03', '2025-05-17');
