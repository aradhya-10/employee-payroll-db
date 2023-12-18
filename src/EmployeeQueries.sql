-- UC1: Creating a new database
mysql> CREATE DATABASE payroll_service;
Query OK, 1 row affected (0.02 sec)

-- Viewing the databases
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| addressbookservice |
| mysql              |
| payroll_service    |
| performance_schema |
| test               |
+--------------------+
5 rows in set (0.00 sec)

-- Using the database
mysql> USE payroll_service;
Database changed


-- UC2: Creating Table
mysql> create table employee_payroll (
    ->  emp_id int auto_increment not null,
    ->  name varchar(50) not null,
    ->     salary double,
    ->     start_date date,
    ->     primary key (emp_id)
    -> );
Query OK, 0 rows affected (0.02 sec)


-- UC3: Inserting data into the table
mysql> INSERT INTO employee_payroll (name, salary, start_date) VALUES
    ->     ('Bill', 10000, '2022-10-11'),
    ->     ('Alice', 20000, '2023-05-09'),
    ->     ('Charlie', 35000, '2023-01-01'),
    ->     ('Dave', 25000, '2023-11-01');
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0


-- UC4: Reading all data from the table
mysql> SELECT * FROM employee_payroll;
+--------+---------+--------+------------+
| emp_id | name    | salary | start_date |
+--------+---------+--------+------------+
|      1 | Bill    |  10000 | 2022-10-11 |
|      2 | Alice   |  20000 | 2023-05-09 |
|      3 | Charlie |  35000 | 2023-01-01 |
|      4 | Dave    |  25000 | 2023-11-01 |
+--------+---------+--------+------------+
4 rows in set (0.00 sec)


-- UC5: Getting salary of the employee named 'Bill'
mysql> SELECT salary FROM employee_payroll WHERE name = 'Bill';
+--------+
| salary |
+--------+
|  10000 |
+--------+
1 row in set (0.00 sec)

mysql> SELECT name, start_date FROM employee_payroll WHERE start_date BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
+---------+------------+
| name    | start_date |
+---------+------------+
| Bill    | 2022-10-11 |
| Alice   | 2023-05-09 |
| Charlie | 2023-01-01 |
| Dave    | 2023-11-01 |
+---------+------------+
4 rows in set (0.00 sec)


-- UC6: Adding a column of gender to the table and updating values for gender column in table
mysql> ALTER TABLE employee_payroll ADD COLUMN gender VARCHAR(1) AFTER name;
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> UPDATE employee_payroll SET gender = 'M' WHERE name = 'Bill' OR name = 'Charlie';
Query OK, 2 rows affected (0.00 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> UPDATE employee_payroll SET gender = 'F' WHERE name = 'Alice';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0


-- UC7: Analysis using SUM, AVG, MIN, MAX and COUNT functions
mysql> SELECT SUM(salary) AS total_salary_male FROM employee_payroll WHERE gender = 'M';
+-------------------+
| total_salary_male |
+-------------------+
|             70000 |
+-------------------+
1 row in set (0.00 sec)

mysql> SELECT gender, AVG(salary) AS average_salary FROM employee_payroll GROUP BY gender;
+--------+--------------------+
| gender | average_salary     |
+--------+--------------------+
| F      |              20000 |
| M      | 23333.333333333332 |
+--------+--------------------+
2 rows in set (0.00 sec)

mysql> SELECT MIN(salary) AS min_salary_male, MAX(salary) AS max_salary_male FROM employee_payroll WHERE gender = 'M';
+-----------------+-----------------+
| min_salary_male | max_salary_male |
+-----------------+-----------------+
|           10000 |           35000 |
+-----------------+-----------------+
1 row in set (0.00 sec)

mysql> SELECT gender, COUNT(gender) AS employee_count FROM employee_payroll GROUP BY gender;
+--------+----------------+
| gender | employee_count |
+--------+----------------+
| F      |              1 |
| M      |              3 |
+--------+----------------+
2 rows in set (0.00 sec)


-- UC8: Alter table to add phone, address, and department columns
mysql> ALTER TABLE employee_payroll
    -> ADD COLUMN phone VARCHAR(20),
    -> ADD COLUMN address VARCHAR(50),
    -> ADD COLUMN department VARCHAR(20);
Query OK, 4 rows affected (0.05 sec)
Records: 4  Duplicates: 0  Warnings: 0

-- Update employee data with random values for phone, address, and department
mysql> UPDATE employee_payroll SET phone = '91 9876543210', address = 'Random Street', department = 'IT' WHERE emp_id = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll SET phone = '91 8765432109', address = 'Unknown Lane', department = 'Finance' WHERE emp_id = 2;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll SET phone = '91 7654321098', address = 'Mystery Avenue', department = 'HR' WHERE emp_id = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll SET phone = '91 6543210987', address = 'Secret Square', department = 'IT' WHERE emp_id = 4;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

-- View the updated data
mysql> SELECT * FROM employee_payroll;
+--------+---------+--------+--------+------------+---------------+----------------+------------+
| emp_id | name    | gender | salary | start_date | phone         | address        | department |
+--------+---------+--------+--------+------------+---------------+----------------+------------+
|      1 | Bill    | M      |  10000 | 2022-10-11 | 91 9876543210 | Random Street  | IT         |
|      2 | Alice   | F      |  20000 | 2023-05-09 | 91 8765432109 | Unknown Lane   | Finance    |
|      3 | Charlie | M      |  35000 | 2023-01-01 | 91 7654321098 | Mystery Avenue | HR         |
|      4 | Dave    | M      |  25000 | 2023-11-01 | 91 6543210987 | Secret Square  | IT         |
+--------+---------+--------+--------+------------+---------------+----------------+------------+
4 rows in set (0.00 sec)


-- UC9: Alter table to add deductions, taxable_pay, income_tax, and net_pay columns
mysql> ALTER TABLE employee_payroll
    -> ADD COLUMN deductions INT,
    -> ADD COLUMN taxable_pay INT,
    -> ADD COLUMN income_tax INT,
    -> ADD COLUMN net_pay INT;
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> UPDATE employee_payroll SET deductions = 2500, taxable_pay = 1200, income_tax = 250, net_pay = 8500 WHERE emp_id = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll SET deductions = 3500, taxable_pay = 1800, income_tax = 600, net_pay = 17500 WHERE emp_id = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll SET deductions = 5500, taxable_pay = 3200, income_tax = 1200, net_pay = 29500 WHERE emp_id = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll SET deductions = 3200, taxable_pay = 1600, income_tax = 550, net_pay = 21500 WHERE emp_id = 4;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

-- View the updated data
mysql> SELECT * FROM employee_payroll;
+--------+---------+--------+--------+------------+---------------+----------------+------------+------------+-------------+------------+---------+
| emp_id | name    | gender | salary | start_date | phone         | address        | department | deductions | taxable_pay | income_tax | net_pay |
+--------+---------+--------+--------+------------+---------------+----------------+------------+------------+-------------+------------+---------+
|      1 | Bill    | M      |  10000 | 2022-10-11 | 91 9876543210 | Random Street  | IT         |       2500 |        1200 |        250 |    8500 |
|      2 | Alice   | F      |  20000 | 2023-05-09 | 91 8765432109 | Unknown Lane   | Finance    |       3500 |        1800 |        600 |   17500 |
|      3 | Charlie | M      |  35000 | 2023-01-01 | 91 7654321098 | Mystery Avenue | HR         |       5500 |        3200 |       1200 |   29500 |
|      4 | Dave    | M      |  25000 | 2023-11-01 | 91 6543210987 | Secret Square  | IT         |       3200 |        1600 |        550 |   21500 |
+--------+---------+--------+--------+------------+---------------+----------------+------------+------------+-------------+------------+---------+
4 rows in set (0.00 sec)


-- UC10: Inserting data for Terissa with updated addresses
mysql> INSERT INTO employee_payroll(name, salary, start_date, gender, phone, address, department, deductions, taxable_pay, income_tax, net_pay)
    -> VALUES ("Terissa", 40000, '2023-12-08', 'female', '91 9456314785', 'avenue-405', 'Sales', 5000, 3000, 1000, 35000);

