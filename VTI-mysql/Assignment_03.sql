--  Question 1: Thêm ít nhất 10 record vào mỗi table
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

INSERT INTO
    type_questions (name)
VALUES ('ESSAY'),
    ('MULTIPLE-CHOICE');

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
        '2025-08-10',
        7,
        7
    ),
    (
        'EX008',
        'de thi linux',
        45,
        '2025-08-10',
        8,
        8
    ),
    (
        'EX009',
        'de thi devops',
        60,
        '2025-08-10',
        9,
        9
    ),
    (
        'EX010',
        'de thi network',
        50,
        '2025-08-10',
        10,
        10
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

-- 5: UPDATE & DELETE
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE accounts
SET
    fullname = 'Nguyễn Bá Lộc',
    email = 'loc.nguyenba@vti.com.vn'
WHERE
    id = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE group_accounts SET group_id = 4 WHERE account_id = 5;

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM exams WHERE created_at = '2025-08-10';

-- Question 13:
DELETE FROM questions WHERE content LIKE 'cauhoi%';

-- 6: SELECT DỮ LIỆU KIỂM TRA
-- Question 2: lấy ra tất cả các phòng ban
SELECT * FROM departments;

-- Question 3: lấy ra id của phòng ban "Lap1"
SELECT id FROM departments WHERE name = 'Lap1';
-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT *
FROM accounts
WHERE
    LENGTH(username) = (
        SELECT MAX(LENGTH(username))
        FROM accounts
    );

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *
FROM accounts
WHERE
    LENGTH(username) = (
        SELECT MAX(LENGTH(username))
        FROM accounts
    )
    AND department_id = 3;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 2025-08-20
SELECT name FROM `groups` WHERE created_at < '2025-08-20';

-- Question 7: Lấy ra ID của question có >= 2 câu trả lời
SELECT question_id
FROM answers
GROUP BY
    question_id
HAVING
    COUNT(id) >= 2;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 2025-08-20
SELECT code
FROM exams
WHERE
    duration >= 60
    AND created_at < '2025-08-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT * FROM `groups` ORDER BY created_at DESC LIMIT 5;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "n" và kết thúc bằng chữ "v"
SELECT username FROM accounts WHERE username LIKE 'n%v';

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(id) FROM accounts WHERE department_id = '2';