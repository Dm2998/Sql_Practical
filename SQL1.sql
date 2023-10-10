-- Class Sql,labs

-- 1. Create a simple table countries including columns country_id,country_name and region_id.

CREATE TABLE countries (
    country_id INT,
    country_name VARCHAR(50),
    region_id INT
);

-- 2. Create a simple table countries including columns country_id,country_name and region_id which already exist.
CREATE TABLE IF NOT EXISTS countries (
    country_id INT,
    country_name VARCHAR(50),
    region_id INT
);

-- 3. Create the structure of a table dup_countries similar to countries.
CREATE TABLE dup_countries LIKE countries;

-- 4. Create a duplicate copy of countries table including structure and data by name dup_countries.
CREATE TABLE dup_countries AS SELECT * FROM countries;

-- 5. Create a table countries set a constraint NULL.
CREATE TABLE countries (
    country_id INT NOT NULL,
    country_name VARCHAR(50) NULL,
    region_id INT NULL
);

-- 6. Create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
CREATE TABLE jobs (
    job_id INT,
    job_title VARCHAR(50),
    min_salary INT,
    max_salary INT CHECK (max_salary <= 25000)
);

-- 7. Create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.
CREATE TABLE countries (
    country_id INT,
    country_name VARCHAR(50),
    region_id INT,
    CONSTRAINT countries_allowed_countries CHECK (country_name IN ('Italy', 'India', 'China'))
);

-- 8. Create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.
CREATE TABLE countries (
    country_id INT,
    country_name VARCHAR(50),
    region_id INT,
    CONSTRAINT countries_pk PRIMARY KEY (country_id)
);

-- 9. Create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE jobs (
    job_id INT,
    job_title VARCHAR(50) DEFAULT '',
    min_salary INT DEFAULT 8000,
    max_salary INT DEFAULT NULL
);

-- 10. Create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.
CREATE TABLE countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT
);

-- 11. Create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto-incremented value.
CREATE TABLE countries (
    country_id INT AUTO_INCREMENT UNIQUE,
    country_name VARCHAR(50),
    region_id INT
);

-- 12. Create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique.
CREATE TABLE countries (
    country_id INT,
    country_name VARCHAR(50),
    region_id INT,
    CONSTRAINT countries_pk PRIMARY KEY (country_id, region_id)
);

-- 13. Create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key constraint is added to the employee_id column.
CREATE TABLE job_history (
    employee_id INT,
    start_date DATE,
    end_date DATE,
    job_id INT,
    department_id INT,
    CONSTRAINT job_history_pk PRIMARY KEY (employee_id),
    CONSTRAINT job_history_fk FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

-- Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, the salary will be increased by 25% of the department 40, 15% for department 90 and 10% of the department 110 and the rest of the department will remain same.
UPDATE employees
SET salary = CASE
    WHEN department = 40 THEN salary * 1.25
    WHEN department = 90 THEN salary * 1.15
    WHEN department = 110 THEN salary * 1.10
    ELSE salary
END
WHERE department IN (40, 90, 110);


-- Write a SQL statement to change the job ID of the employee which ID is 118 to SH_CLERK if the employee belongs to a department which ID is 30 and the existing job ID does not start with SH.


UPDATE employees
SET job_id = 'SH_CLERK'
WHERE employee_id = 118
AND department_id = 30
AND job_id NOT LIKE 'SH%';



--  Write a SQL statement to change the salary of an employee to 8000 whose ID is 105, if the existing salary is less than 5000.UPDATE employees


SET salary = 8000
WHERE id = 105 AND salary < 5000;

-- Write a SQL statement to change the email and commission_pct column of the employees table with 'not available' and 0.10 for those employees whose department_id is 110.

UPDATE employees
SET email = 'not available', commission_pct = 0.10
WHERE department_id = 110;