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