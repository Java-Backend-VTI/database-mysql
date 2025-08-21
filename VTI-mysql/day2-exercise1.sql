-- Active: 1755334685036@@127.0.0.1@3306@quick-db
DROP DATABASE IF EXISTS library_management;

DROP TABLE IF EXISTS borrowings, readers, books, genres, authors;

CREATE DATABASE IF NOT EXISTS library_management;

USE library_management;

CREATE TABLE authors (
    author_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    full_name NVARCHAR (100) NOT NULL,
    date_of_birth DATE,
    nationality NVARCHAR (50) NOT NULL
);

CREATE TABLE genres (
    genre_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    genre_name NVARCHAR (50) NOT NULL UNIQUE
);

CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title NVARCHAR (200) NOT NULL,
    publication_year INT NOT NULL,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES authors (author_id),
    FOREIGN KEY (genre_id) REFERENCES genres (genre_id),
    CHECK (publication_year >= 1900),
    CHECK (stock_quantity >= 0)
);

CREATE TABLE readers (
    reader_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    reader_name NVARCHAR (100) NOT NULL,
    email NVARCHAR (100) NOT NULL UNIQUE,
    registration_date DATE NOT NULL
);

CREATE TABLE borrowings (
    borrowing_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    reader_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books (book_id),
    FOREIGN KEY (reader_id) REFERENCES readers (reader_id),
    CHECK (
        return_date IS NULL
        OR return_date >= borrow_date
    )
);