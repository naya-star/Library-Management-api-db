# Library Management Database

## Overview

This project implements a **Library Management System API** with a MySQL database backend. The system allows you to manage books in a library, providing functionalities to create, read, update, and delete book records. The backend is powered by **Node.js** and **Express**, while the database is managed with **MySQL**.

## Prerequisites

- **Node.js** installed on your system.
- **MySQL** installed and running.
- **cURL** (for API testing).
- A **GitHub account** to push your code.

## Project Structure

The project contains two main components:

1. **API** (Backend) - The Node.js server handling HTTP requests.
   - `index.js`: Main server file.
   - `.env`: Environment variables for database credentials (do not commit).
   - `node_modules/`: Dependencies for the project.
   - `package.json`: Node.js dependencies and scripts.

2. **Database** - SQL scripts to set up the database structure.
   - `db/schema.sql`: SQL file for creating and populating the library database.

### Project Folder Structure:

library-api-db/

│

├── node_modules/ # Installed dependencies

├── db/

│ └── answers.sql # SQL file for creating the database and tables

├── index.js # Main server file (API logic)

├── .env # Environment variables file (for DB connection)

├── .gitignore # Git ignore file to prevent committing sensitive files

├── README.md # Project documentation

├── package.json # Project dependencies and scripts

└── package-lock.json # Lock file for npm dependencies


## Setup Instructions

### 1. Clone the repository

To get started, clone the project repository to your local machine:

```bash
git clone https://github.com/naya-star/Library-Management-api-db.git
cd library-management-api-db

Install dependencies
npm install

Configure environment variables
Create a .env file in the root directory of the project. Add the following variables:

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_DATABASE=LibraryDB

Set up MySQL Database
Open MySQL from your command line (mysql -u root -p).

Use the SQL script to create and set up the database schema:
-- Run schema.sql to create the LibraryDB schema
source /path/to/schema.sql;

Run the application 
node index.js
Your server will now be running on http://localhost:3000.

API Usage (cURL Examples)
Here are cURL examples to interact with your API:

Create a book: curl -X POST http://localhost:3000/books \
  -H "Content-Type: application/json" \
  -d '{"title": "Harry Potter", "author_id": 1, "published_date": "1997-06-26", "genre": "Fantasy"}'

Get All books: curl http://localhost:3000/books

Update a book: curl -X PUT http://localhost:3000/books/1 \
  -H "Content-Type: application/json" \
  -d '{"title": "Harry Potter and the Chamber of Secrets", "author_id": 1, "published_date": "1998-07-02", "genre": "Fantasy"}'

Delete a book: curl -X DELETE http://localhost:3000/books/1

In MySQL Workbench or Command Prompt, you can run the following query to confirm the changes:
SELECT * FROM Books;

Conclusion

This project implements the backend API for managing library data and integrates it with a MySQL database for persistent storage. It provides basic CRUD functionality and can be expanded upon with additional features like user authentication, more advanced queries, or integration with a frontend.

Note: Replace yourpassword with your actual MySQL password in the .env file
