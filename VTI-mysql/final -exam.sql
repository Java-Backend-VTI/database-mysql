-- Tạo table với các ràng buộc và kiểu dữ liệu
DROP DATABASE IF EXISTS internship;

DROP TABLE IF EXISTS teachers, students, topics, supervisions;

CREATE DATABASE IF NOT EXISTS internship;

USE internship;

CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    salary DECIMAL(15, 2)
);

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    dob DATE,
    hometown VARCHAR(100)
);

CREATE TABLE topics (
    id INT PRIMARY KEY AUTO_INCREMENT,
    topic_name VARCHAR(200) NOT NULL,
    budget DECIMAL(15, 2),
    internship_place VARCHAR(200)
);

CREATE TABLE supervisions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    topic_id INT NOT NULL,
    teacher_id INT NOT NULL,
    result ENUM(
        'GIOI',
        'TOT',
        'TRUNG BINH',
        'KHA'
    ),
    FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE CASCADE,
    FOREIGN KEY (topic_id) REFERENCES topics (id),
    FOREIGN KEY (teacher_id) REFERENCES teachers (id)
);

-- Thêm ít nhất 3 bản ghi vào table
INSERT INTO
    teachers (full_name, salary)
VALUES ('Nguyen Van A', 15000000),
    ('Nguyen Van B', 18000000),
    ('Nguyen Van C', 20000000);

INSERT INTO
    students (full_name, dob, hometown)
VALUES (
        'Nguyen Thi A',
        '2001-05-12',
        'Ha Noi'
    ),
    (
        'Nguyen Thi B',
        '2000-11-23',
        'Ho Chi Minh'
    ),
    (
        'Nguyen Thi C',
        '2002-03-18',
        'Da Nang'
    ),
    (
        'Nguyen Thi D',
        '2001-07-05',
        'Hue'
    ),
    (
        'Nguyen Thi E',
        '2002-10-14',
        'Gia Lai'
    );

INSERT INTO
    topics (
        topic_name,
        budget,
        internship_place
    )
VALUES (
        'He thong quan ly sinh vien',
        50000000,
        'Cong ty Phan mem ABC'
    ),
    (
        'Website thuong mai dien tu',
        70000000,
        'Cong ty Cong nghe XYZ'
    ),
    (
        'Ung dung dat xe truc tuyen',
        60000000,
        'Startup Giao thong 123'
    );

INSERT INTO
    supervisions (
        student_id,
        topic_id,
        teacher_id,
        result
    )
VALUES (1, 1, 1, 'TOT'),
    (2, 2, 2, 'KHA'),
    (3, 3, 3, 'GIOI'),
    (1, 3, 2, 'KHA'),
    (2, 3, 3, 'TRUNG BINH');

-- Lấy tất cả sinh viên chưa có đề tài hướng dẫn
SELECT *
FROM students
    LEFT JOIN supervisions ON students.id = supervisions.student_id
WHERE
    supervisions.student_id IS NULL;

-- Lấy ra số sinh viên làm đề tài 'Startup Giao thong 123'
SELECT COUNT(*) AS student_count
FROM supervisions
    JOIN topics ON supervisions.topic_id = topics.id
WHERE
    topics.internship_place = 'Startup Giao thong 123';

-- Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900 thì hiện ra thông báo "năm sinh phải > 1900"
DELIMITER $$

CREATE TRIGGER check_birth_year_before_insert
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF YEAR(NEW.dob) <= 1900 THEN
        SIGNAL SQLSTATE '10101'
        SET MESSAGE_TEXT = 'nam sinh phai > 1900';
    END IF;
END;
$$

DELIMITER;

INSERT INTO
    students (full_name, dob, hometown)
VALUES (
        'Le Van Test',
        '1899-05-10',
        'Ha Loi'
    );

-- Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông
DELETE FROM students WHERE id = 1;

SELECT * FROM supervisions;