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

