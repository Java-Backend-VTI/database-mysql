-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT *
FROM accounts
    LEFT JOIN departments ON accounts.department_id = departments.id;

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT *
FROM accounts
    RIGHT JOIN positions ON accounts.position_id = positions.id
WHERE
    name = 'DEV';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có &gt;3 nhân viên
SELECT *
FROM departments
WHERE (
        SELECT COUNT(*)
        FROM accounts
        WHERE
            accounts.department_id = departments.id
    ) >= 2;

SELECT departments.id, departments.name, COUNT(accounts.department_id)
FROM departments
    INNER JOIN accounts ON departments.id = accounts.department_id
GROUP BY
    departments.id
HAVING
    COUNT(accounts.department_id) >= 2;

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu QUEstion
SELECT category_questions.name, COUNT(questions.id)
FROM
    category_questions
    LEFT JOIN questions ON category_questions.id = questions.category_id
GROUP BY
    category_questions.id;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT questions.id, questions.content, COUNT(*) AS total_number
FROM questions
    LEFT JOIN answers on questions.id = answers.question_id
GROUP BY
    questions.id
HAVING
    COUNT(answers.question_id) = (
        SELECT MAX(temp_number)
        FROM (
                SELECT question_id, COUNT(*) AS temp_number
                FROM answers
                GROUP BY
                    question_id
            ) AS temp_table
    );

-- Question 10: Tìm chức vụ có ít người nhất
SELECT positions.id, positions.name, COUNT(*)
FROM positions
    LEFT JOIN accounts ON positions.id = accounts.position_id
GROUP BY
    positions.id
HAVING
    COUNT(accounts.position_id) = (
        SELECT MIN(temp_number)
        FROM (
                SELECT position_id, COUNT(*) AS temp_number
                FROM accounts
                GROUP BY
                    position_id
            ) AS temp_table
    );