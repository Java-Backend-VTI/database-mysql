CREATE DATABASE dtn_2506;

DROP DATABASE `dtn_2506`;

CREATE DATABASE IF NOT EXISTS dtn_2506;

USE dtn_2506;

CREATE TABLE trainees (
    id INT,
    fullname VARCHAR(100),
    date_of_birth DATE,
    gender ENUM('MALE', 'FEMALE', 'UNKNOWN'),
    et_iq TINYINT,
    training_class CHAR(30),
    note TEXT
)