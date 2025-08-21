-- Active: 1755334685036@@127.0.0.1@3306@assignment_day_1
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

INSERT INTO
    departments (name)
VALUES ('Lap1'),
    ('Lap2'),
    ('Lap3'),
    ('Lap4'),
    ('Lap5'),
    ('Lap6'),
    ('Lap7'),
    ('Lap8'),
    ('Lap9'),
    ('Lap10');

CREATE TABLE positions (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name ENUM(
        'DEV',
        'TEST',
        'SCRUM MASTER',
        'PM'
    ) NOT NULL
);

INSERT INTO
    positions (name)
VALUES ('DEV'),
    ('DEV'),
    ('DEV'),
    ('TEST'),
    ('TEST'),
    ('SCRUM MASTER'),
    ('SCRUM MASTER'),
    ('SCRUM MASTER'),
    ('PM'),
    ('PM');

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

INSERT INTO
    accounts (
        email,
        username,
        fullname,
        created_date,
        position_id,
        department_id
    )
VALUES (
        'nhat.dev@gmail.com',
        'nhat_dev',
        'Nhat Nguyen',
        '2025-08-19',
        1,
        1
    ),
    (
        'nhat.test@gmail.com',
        'nhat_test',
        'Nhat Le',
        '2025-08-19',
        4,
        2
    ),
    (
        'nhat.pm@gmail.com',
        'nhat_pm',
        'Nhat Dinh',
        '2025-08-19',
        9,
        3
    ),
    (
        'na.dev@gmail.com',
        'na_dev',
        'Na Nguyen',
        '2025-08-19',
        2,
        4
    ),
    (
        'na.scrum@gmail.com',
        'na_scrum',
        'Na Tran',
        '2025-08-19',
        6,
        5
    ),
    (
        'alo.dev@gmail.com',
        'alo_dev',
        'Alo Ngo',
        '2025-08-19',
        3,
        6
    ),
    (
        'ka.test@gmail.com',
        'ka_test',
        'Ka Lee',
        '2025-08-19',
        5,
        7
    ),
    (
        'ka.scrum@gmail.com',
        'henry_scrum',
        'Henry Nguyen',
        '2025-08-19',
        7,
        8
    ),
    (
        'oh.pm@gmail.com',
        'isabella_pm',
        'Oh Tran',
        '2025-08-19',
        10,
        9
    ),
    (
        'jack.dev@gmail.com',
        'jack_dev',
        'Jack 97',
        '2025-08-19',
        1,
        10
    );

CREATE TABLE `groups` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    creator_id INT NOT NULL,
    created_at DATE NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES accounts (id)
);

INSERT INTO
    `groups` (name, creator_id, created_at)
VALUES (
        'group lap trinh',
        1,
        '2025-08-20'
    ),
    ('group test', 2, '2025-08-20'),
    (
        'group scrum',
        5,
        '2025-08-20'
    ),
    ('group pm', 3, '2025-08-20'),
    ('group java', 4, '2025-08-20'),
    ('group sql', 6, '2025-08-20'),
    (
        'group react',
        7,
        '2025-08-20'
    ),
    (
        'group python',
        8,
        '2025-08-20'
    ),
    (
        'group docker',
        9,
        '2025-08-20'
    ),
    (
        'group devops',
        10,
        '2025-08-20'
    );

CREATE TABLE group_accounts (
    group_id INT NOT NULL,
    account_id INT NOT NULL,
    join_date DATE,
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `groups` (id),
    FOREIGN KEY (account_id) REFERENCES accounts (id)
);

INSERT INTO
    group_accounts (
        group_id,
        account_id,
        join_date
    )
VALUES (1, 1, '2025-08-20'),
    (1, 2, '2025-08-20'),
    (2, 3, '2025-08-20'),
    (2, 4, '2025-08-20'),
    (3, 5, '2025-08-20'),
    (3, 6, '2025-08-20'),
    (4, 7, '2025-08-20'),
    (5, 8, '2025-08-20'),
    (6, 9, '2025-08-20'),
    (7, 10, '2025-08-20');

CREATE TABLE type_questions (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name ENUM('ESSAY', 'MULTIPLE-CHOICE')
);

INSERT INTO
    type_questions (name)
VALUES ('ESSAY'),
    ('MULTIPLE-CHOICE');

CREATE TABLE category_questions (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

INSERT INTO
    category_questions (name)
VALUES ('java'),
    ('sql'),
    ('html'),
    ('css'),
    ('javascript'),
    ('python'),
    ('docker'),
    ('linux'),
    ('devops'),
    ('network');

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

INSERT INTO
    questions (
        content,
        created_at,
        category_id,
        type_id,
        creator_id
    )
VALUES (
        'cau hoi ve java co ban',
        '2025-08-20',
        1,
        2,
        1
    ),
    (
        'cau hoi ve sql nang cao',
        '2025-08-20',
        2,
        1,
        2
    ),
    (
        'cau hoi ve html co ban',
        '2025-08-20',
        3,
        2,
        3
    ),
    (
        'cau hoi ve css layout',
        '2025-08-20',
        4,
        1,
        4
    ),
    (
        'cau hoi ve javascript function',
        '2025-08-20',
        5,
        2,
        5
    ),
    (
        'cau hoi ve python oop',
        '2025-08-20',
        6,
        1,
        6
    ),
    (
        'cau hoi ve docker image',
        '2025-08-20',
        7,
        2,
        7
    ),
    (
        'cau hoi ve linux command',
        '2025-08-20',
        8,
        1,
        8
    ),
    (
        'cau hoi ve devops cicd',
        '2025-08-20',
        9,
        2,
        9
    ),
    (
        'cau hoi ve network tcp ip',
        '2025-08-20',
        10,
        1,
        10
    );

CREATE TABLE answers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL DEFAULT FALSE,
    question_id INT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions (id)
);

INSERT INTO
    answers (
        content,
        is_correct,
        question_id
    )
VALUES ('dap an 1 dung', TRUE, 1),
    ('dap an 1 sai', FALSE, 1),
    ('dap an 2 dung', TRUE, 2),
    ('dap an 3 sai', FALSE, 3),
    ('dap an 4 dung', TRUE, 4),
    ('dap an 5 dung', TRUE, 5),
    ('dap an 6 sai', FALSE, 6),
    ('dap an 7 dung', TRUE, 7),
    ('dap an 8 sai', FALSE, 8),
    ('dap an 9 dung', TRUE, 9);

CREATE TABLE exams (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code CHAR(30) NOT NULL UNIQUE,
    title VARCHAR(100) NOT NULL,
    duration INT NOT NULL,
    created_at DATE,
    category_id INT NOT NULL,
    creator_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category_questions (id),
    FOREIGN KEY (creator_id) REFERENCES accounts (id)
);

INSERT INTO
    exams (
        code,
        title,
        duration,
        created_at,
        category_id,
        creator_id
    )
VALUES (
        'EX001',
        'de thi java',
        60,
        '2025-08-20',
        1,
        1
    ),
    (
        'EX002',
        'de thi sql',
        45,
        '2025-08-20',
        2,
        2
    ),
    (
        'EX003',
        'de thi html',
        30,
        '2025-08-20',
        3,
        3
    ),
    (
        'EX004',
        'de thi css',
        40,
        '2025-08-20',
        4,
        4
    ),
    (
        'EX005',
        'de thi javascript',
        50,
        '2025-08-20',
        5,
        5
    ),
    (
        'EX006',
        'de thi python',
        55,
        '2025-08-20',
        6,
        6
    ),
    (
        'EX007',
        'de thi docker',
        35,
        '2025-08-20',
        7,
        7
    ),
    (
        'EX008',
        'de thi linux',
        45,
        '2025-08-20',
        8,
        8
    ),
    (
        'EX009',
        'de thi devops',
        60,
        '2025-08-20',
        9,
        9
    ),
    (
        'EX010',
        'de thi network',
        50,
        '2025-08-20',
        10,
        10
    );

CREATE TABLE exam_questions (
    exam_id INT NOT NULL,
    question_id INT NOT NULL,
    PRIMARY KEY (exam_id, question_id),
    FOREIGN KEY (exam_id) REFERENCES exams (id),
    FOREIGN KEY (question_id) REFERENCES questions (id)
);

INSERT INTO
    exam_questions (exam_id, question_id)
VALUES (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);