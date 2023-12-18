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

