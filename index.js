// Load environment variables from .env file
require('dotenv').config();

// Import dependencies
const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());

// Create MySQL connection using .env variables
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE
});

// Connect to the database
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err.stack);
    return;
  }
  console.log('Connected to the MySQL database as ID ' + db.threadId);
});

// CREATE a book (POST)
app.post('/books', (req, res) => {
  const { title, author_id, published_date, genre } = req.body;
  const query = 'INSERT INTO Books (title, author_id, published_date, genre) VALUES (?, ?, ?, ?)';
  db.query(query, [title, author_id, published_date, genre], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.status(201).json({ message: 'Book created!', bookId: result.insertId });
    }
  });
});

// READ all books (GET)
app.get('/books', (req, res) => {
  const query = 'SELECT * FROM Books';
  db.query(query, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.status(200).json(results);
    }
  });
});

// UPDATE a book (PUT)
app.put('/books/:id', (req, res) => {
  const bookId = req.params.id;
  const { title, author_id, published_date, genre } = req.body;
  const query = 'UPDATE Books SET title = ?, author_id = ?, published_date = ?, genre = ? WHERE book_id = ?';
  db.query(query, [title, author_id, published_date, genre, bookId], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.status(200).json({ message: 'Book updated!' });
    }
  });
});

// DELETE a book (DELETE)
app.delete('/books/:id', (req, res) => {
  const bookId = req.params.id;
  const query = 'DELETE FROM Books WHERE book_id = ?';
  db.query(query, [bookId], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.status(200).json({ message: 'Book deleted!' });
    }
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
