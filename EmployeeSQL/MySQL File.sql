-- DROP DATABASE IF EXISTS sql_challenge;
-- CREATE DATABASE sql_challenge;

-- create one table for each csv file to import into. Order must match import order
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- table for departments. dept_no will be the primary key. 
CREATE TABLE departments (
	dept_no VARCHAR(20)   PRIMARY KEY,
    dept_name VARCHAR(30)
    );
LOAD DATA LOCAL INFILE 'C:/Users/britt/Homeworks/SQL Homework/SQL-Challenge/departments.csv' 
INTO TABLE departments
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

SELECT * from departments;


-- table for department employees
CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(20)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
	);
    
LOAD DATA LOCAL INFILE 'C:/Users/britt/Homeworks/SQL Homework/SQL-Challenge/dept_emp.csv' 
INTO TABLE dept_emp
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

SELECT * from dept_emp;

-- table for department managers
CREATE TABLE dept_manager (
    dept_no VARCHAR(20)   NOT NULL,
    emp_no INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
	);
    
LOAD DATA LOCAL INFILE 'C:/Users/britt/Homeworks/SQL Homework/SQL-Challenge/dept_manager.csv' 
INTO TABLE dept_manager
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\r\n';
SELECT * from dept_manager;

-- table for employees
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    gender VARCHAR(30)   NOT NULL,
    hire_date DATE   NOT NULL
    );
    
LOAD DATA LOCAL INFILE 'C:/Users/britt/Homeworks/SQL Homework/SQL-Challenge/employees.csv' 
INTO TABLE employees
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

SELECT * from employees;
    
-- table for salaries
CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
	);
    
LOAD DATA LOCAL INFILE 'C:/Users/britt/Homeworks/SQL Homework/SQL-Challenge/salaries.csv' 
INTO TABLE salaries
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

SELECT * from salaries;    

-- table for titles    
CREATE TABLE titles (
    emp_no INT   NOT NULL,
    tile VARCHAR(30)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
	);
    
LOAD DATA LOCAL INFILE 'C:/Users/britt/Homeworks/SQL Homework/SQL-Challenge/titles.csv' 
INTO TABLE titles
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

SELECT * from titles;

-- now figure out what the foreign keys are for each table. departments


-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary. 
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.gender,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no