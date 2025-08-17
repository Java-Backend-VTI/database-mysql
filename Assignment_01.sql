DROP DATABASE IF EXISTS assignment_day_1;

DROP TABLE IF EXISTS exam_questions,
exams,
answers,
questions,
category_questions,
type_questions,
group_accounts,
`groups`,
accounts,
positions,
departments;

CREATE DATABASE IF NOT EXISTS assignment_day_1;

USE assignment_day_1;

CREATE TABLE departments (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE positions (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name ENUM(
        'DEV',
        'TEST',
        'SCRUM MASTER',
        'PM'
    ) NOT NULL
);

CREATE TABLE accounts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    fullname VARCHAR(50) NOT NULL,
    created_date DATE NOT NULL,
    position_id INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (position_id) REFERENCES positions (id),
    FOREIGN KEY (department_id) REFERENCES departments (id)
);

CREATE TABLE `groups` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    creator_id INT NOT NULL,
    created_at DATE NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES accounts (id)
);

CREATE TABLE group_accounts (
    group_id INT NOT NULL,
    account_id INT NOT NULL,
    join_date DATE,
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `groups` (id),
    FOREIGN KEY (account_id) REFERENCES accounts (id)
);

CREATE TABLE type_questions (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name ENUM('ESSAY', 'MULTIPLE-CHOICE')
);

CREATE TABLE category_questions (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE questions (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    created_at DATE,
    category_id INT NOT NULL,
    type_id INT NOT NULL,
    creator_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category_questions (id),
    FOREIGN KEY (type_id) REFERENCES type_questions (id),
    FOREIGN KEY (creator_id) REFERENCES accounts (id)
);

CREATE TABLE answers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    isCorrect BOOLEAN NOT NULL DEFAULT FALSE,
    question_id INT NOT NULL REFERENCES questions (id)
);

CREATE TABLE exams (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code CHAR(30) NOT NULL UNIQUE,
    title VARCHAR(100) NOT NULL,
    duration INT NOT NULL,
    created_at DATE,
    category_id INT NOT NULL REFERENCES category_questions (id),
    creator_id INT NOT NULL REFERENCES accounts (id)
);

CREATE TABLE exam_questions (
    exam_id INT NOT NULL REFERENCES exams (id),
    question_id INT NOT NULL REFERENCES questions (id),
    PRIMARY KEY (exam_id, question_id)
);