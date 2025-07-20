-- 1.1: Create a new database named school_db and a table called students
CREATE DATABASE school_db;
USE school_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL,
    age INT,
    class VARCHAR(20),
    address VARCHAR(100)
);

-- 1.2: Insert five records and retrieve all records
INSERT INTO students (student_name, age, class, address)
VALUES
    ('Sameer', 12, '7A', 'Ahmadabad'),
    ('Arvind', 11, '6B', 'Ahmadabad'),
    ('Kiran', 13, '8C', 'Ahmadabad'),
    ('Khushi', 10, '5A', 'Ahmadabad'),
    ('Bhoomi', 14, '9B', 'Ahmadabad');

SELECT * FROM students;

-- 2.1: Retrieve specific columns (student_name and age)
SELECT student_name, age FROM students;

-- 2.2: Retrieve students older than 10
SELECT * FROM students WHERE age > 10;

-- 3.1: Create teachers table
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(50) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- 3.2: Add FOREIGN KEY constraint to students
ALTER TABLE students ADD COLUMN teacher_id INT;
ALTER TABLE students ADD FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id);

-- 4.1: Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50),
    course_credits INT
);

-- 4.2: Create university_db database
CREATE DATABASE university_db;

-- 5.1: Add course_duration column
ALTER TABLE courses ADD COLUMN course_duration INT;

-- 5.2: Drop course_credits column
ALTER TABLE courses DROP COLUMN course_credits;

-- 6.2: Drop teachers table
DROP TABLE teachers;

-- 6.3: Drop students table and verify
DROP TABLE students;
SHOW TABLES;

-- 7.1: Insert three courses
INSERT INTO courses (course_name, course_duration)
VALUES
    ('Mathematics', 3),
    ('Physics', 2),
    ('Chemistry', 2);

-- 7.2: Update course duration
UPDATE courses SET course_duration = 4 WHERE course_name = 'Physics';

-- 7.3: Delete a course
DELETE FROM courses WHERE course_id = 3;

-- 8.1: Retrieve all courses
SELECT * FROM courses;

-- 8.2: Sort by course_duration descending
SELECT * FROM courses ORDER BY course_duration DESC;

-- 8.3: Limit results to top 2
SELECT * FROM courses LIMIT 2;

-- 9.1: Create users and grant permissions
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password1';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'password2';
GRANT SELECT ON school_db.courses TO 'user1'@'localhost';

-- 9.2: Revoke and grant permissions
REVOKE INSERT ON school_db.courses FROM 'user1'@'localhost';
GRANT INSERT ON school_db.courses TO 'user2'@'localhost';

-- 10.1: Commit transaction
START TRANSACTION;
INSERT INTO courses (course_name, course_duration) VALUES ('Biology', 3);
COMMIT;

-- 10.2: Rollback transaction
START TRANSACTION;
INSERT INTO courses (course_name, course_duration) VALUES ('History', 2);
ROLLBACK;

-- 10.3: Savepoint example
START TRANSACTION;
SAVEPOINT before_update;
UPDATE courses SET course_duration = 5 WHERE course_name = 'Mathematics';
ROLLBACK TO before_update;
COMMIT;

-- 11.1: Create departments and employees tables
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Inner Join
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- 11.2: Left Join
SELECT d.department_name, e.employee_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;

-- 12.1: Group by department
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 12.2: Average salary
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 13.1: Stored procedure for employees by department
DELIMITER //
CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT * FROM employees WHERE department_id = dept_id;
END //
DELIMITER ;

-- 13.2: Stored procedure for course details
DELIMITER //
CREATE PROCEDURE GetCourseDetails(IN c_id INT)
BEGIN
    SELECT * FROM courses WHERE course_id = c_id;
END //
DELIMITER ;

-- 14.1: Create view for employees with departments
CREATE VIEW employee_department_view AS
SELECT e.employee_name, d.department_name, e.salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- 14.2: Modify view to exclude low salaries
CREATE OR REPLACE VIEW employee_department_view AS
SELECT e.employee_name, d.department_name, e.salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE e.salary >= 50000;

-- 15.1: Trigger for employee audit
CREATE TABLE employee_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    change_date DATETIME,
    action VARCHAR(50)
);

DELIMITER //
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, change_date, action)
    VALUES (NEW.employee_id, NOW(), 'INSERT');
END //
DELIMITER ;

-- 15.2: Trigger for last modified timestamp
ALTER TABLE employees ADD COLUMN last_modified TIMESTAMP;

DELIMITER //
CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.last_modified = NOW();
END //
DELIMITER ;

-- 16.1: PL/SQL block for employee count
DELIMITER //
BEGIN
    DECLARE emp_count INT;
    SELECT COUNT(*) INTO emp_count FROM employees;
    SELECT emp_count AS total_employees;
END //
DELIMITER ;

-- 16.2: PL/SQL block for total sales
-- Assuming orders table exists with a 'total' column
DELIMITER //
BEGIN
    DECLARE total_sales DECIMAL(10,2);
    SELECT SUM(total) INTO total_sales FROM orders;
    SELECT total_sales AS total_sales_amount;
END //
DELIMITER ;

-- 17.1: IF-THEN condition example
DELIMITER //
CREATE PROCEDURE CheckDepartment(IN emp_id INT)
BEGIN
    DECLARE dept_name VARCHAR(50);
    SELECT department_name INTO dept_name
    FROM departments d
    JOIN employees e ON d.department_id = e.department_id
    WHERE e.employee_id = emp_id;
    
    IF dept_name = 'IT' THEN
        SELECT 'IT Department Employee' AS message;
    END IF;
END //
DELIMITER ;

-- 17.2: FOR LOOP example
DELIMITER //
CREATE PROCEDURE DisplayEmployeeNames()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT employee_name FROM employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT emp_name;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- 18.1: Explicit cursor example
DELIMITER //
CREATE PROCEDURE DisplayEmployees()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT employee_id, employee_name FROM employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT emp_id, emp_name;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- 18.2: Course cursor example
DELIMITER //
CREATE PROCEDURE DisplayCourses()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE c_id INT;
    DECLARE c_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT course_id, course_name FROM courses;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO c_id, c_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT c_id, c_name;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- 19.1: Savepoint transaction
START TRANSACTION;
SAVEPOINT sp1;
INSERT INTO courses (course_name, course_duration) VALUES ('Geography', 3);
ROLLBACK TO sp1;
COMMIT;

-- 19.2: Partial commit with savepoint
START TRANSACTION;
INSERT INTO courses (course_name, course_duration) VALUES ('Economics', 3);
SAVEPOINT sp2;
INSERT INTO courses (course_name, course_duration) VALUES ('Philosophy', 2);
ROLLBACK TO sp2;
COMMIT;
