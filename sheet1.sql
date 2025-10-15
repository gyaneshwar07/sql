Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.43 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| db1                |
| db2                |
| db3                |
| information_schema |
| mysql              |
| new                |
| new db             |
| object             |
| performance_schema |
| sys                |
+--------------------+
10 rows in set (0.17 sec)

mysql> use db1;
Database changed
mysql> show tables;
+---------------+
| Tables_in_db1 |
+---------------+
| book          |
| customers     |
| employee      |
| new_table     |
| orders        |
| parent        |
| products      |
| project       |
| tb_1          |
| tb_2          |
| tb_3          |
| team          |
+---------------+
12 rows in set (0.02 sec)

mysql> select * from employee;
+-----+-------+------+--------+--------+
| eid | name  | age  | salery | depart |
+-----+-------+------+--------+--------+
|   1 | hey   |   18 |  20000 | cse    |
|   2 | hello |   18 |  22000 | cse    |
|   3 | done  |   20 |  24000 | ds     |
|   4 | gyan  |   10 |  32198 | ece    |
|   5 | gds   |   19 |   7328 | ds     |
|   6 | gyan  |   10 |    892 | it     |
|   7 | gyan  |   10 |  10000 | it     |
|   8 | uh    |   28 |   NULL | ds     |
+-----+-------+------+--------+--------+
8 rows in set (0.04 sec)

mysql> use db3;
Database changed
mysql> show tables;
+---------------+
| Tables_in_db3 |
+---------------+
| student       |
| teacher       |
+---------------+
2 rows in set (0.00 sec)

mysql> CREATE TABLE Employees (
    ->     EmployeeID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Department VARCHAR(50),
    ->     Salary DECIMAL(10, 2)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql>
mysql> INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
    -> (1, 'John', 'Doe', 'HR', 55000.00),
    -> (2, 'Jane', 'Smith', 'IT', 75000.00),
    -> (3, 'Emily', 'Jones', 'Finance', 65000.00),
    -> (4, 'Michael', 'Brown', 'IT', 80000.00),
    -> (5, 'Sarah', 'Davis', 'HR', 60000.00),
    -> (6, 'David', 'Wilson', 'Finance', 70000.00),
    -> (7, 'Laura', 'Garcia', 'IT', 72000.00),
    -> (8, 'Robert', 'Miller', 'HR', 58000.00),
    -> (9, 'Sophia', 'Martinez', 'Finance', 67000.00),
    -> (10, 'James', 'Anderson', 'IT', 81000.00);
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql>
mysql> select * from employees;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          1 | John      | Doe      | HR         | 55000.00 |
|          2 | Jane      | Smith    | IT         | 75000.00 |
|          3 | Emily     | Jones    | Finance    | 65000.00 |
|          4 | Michael   | Brown    | IT         | 80000.00 |
|          5 | Sarah     | Davis    | HR         | 60000.00 |
|          6 | David     | Wilson   | Finance    | 70000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
|          8 | Robert    | Miller   | HR         | 58000.00 |
|          9 | Sophia    | Martinez | Finance    | 67000.00 |
|         10 | James     | Anderson | IT         | 81000.00 |
+------------+-----------+----------+------------+----------+
10 rows in set (0.00 sec)

mysql> --select all column from table
    -> select * from employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--select all column from table
select * from employee' at line 1
mysql> -- select all col from table
mysql> select * from employee;
ERROR 1146 (42S02): Table 'db3.employee' doesn't exist
mysql> select * from employees;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          1 | John      | Doe      | HR         | 55000.00 |
|          2 | Jane      | Smith    | IT         | 75000.00 |
|          3 | Emily     | Jones    | Finance    | 65000.00 |
|          4 | Michael   | Brown    | IT         | 80000.00 |
|          5 | Sarah     | Davis    | HR         | 60000.00 |
|          6 | David     | Wilson   | Finance    | 70000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
|          8 | Robert    | Miller   | HR         | 58000.00 |
|          9 | Sophia    | Martinez | Finance    | 67000.00 |
|         10 | James     | Anderson | IT         | 81000.00 |
+------------+-----------+----------+------------+----------+
10 rows in set (0.00 sec)

mysql> -- select firstname and lastname
mysql> select firstname,lastname from employees;
+-----------+----------+
| firstname | lastname |
+-----------+----------+
| John      | Doe      |
| Jane      | Smith    |
| Emily     | Jones    |
| Michael   | Brown    |
| Sarah     | Davis    |
| David     | Wilson   |
| Laura     | Garcia   |
| Robert    | Miller   |
| Sophia    | Martinez |
| James     | Anderson |
+-----------+----------+
10 rows in set (0.00 sec)

mysql> select * from employees where department = 'IT' ;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          2 | Jane      | Smith    | IT         | 75000.00 |
|          4 | Michael   | Brown    | IT         | 80000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
|         10 | James     | Anderson | IT         | 81000.00 |
+------------+-----------+----------+------------+----------+
4 rows in set (0.00 sec)

mysql> -- an other option
mysql> select * from employees where department in 'IT';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''IT'' at line 1
mysql> select * from employees where department in ('IT');
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          2 | Jane      | Smith    | IT         | 75000.00 |
|          4 | Michael   | Brown    | IT         | 80000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
|         10 | James     | Anderson | IT         | 81000.00 |
+------------+-----------+----------+------------+----------+
4 rows in set (0.00 sec)

mysql> -- select employee having salery greater than 70,000
mysql> select * from employee where salery > 70000;
ERROR 1146 (42S02): Table 'db3.employee' doesn't exist
mysql> select * from employees where salery > 70000;
ERROR 1054 (42S22): Unknown column 'salery' in 'where clause'
mysql> select * from employees where salary > 70000;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          2 | Jane      | Smith    | IT         | 75000.00 |
|          4 | Michael   | Brown    | IT         | 80000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
|         10 | James     | Anderson | IT         | 81000.00 |
+------------+-----------+----------+------------+----------+
4 rows in set (0.00 sec)

mysql> -- sort result by name in ascending order
mysql> select * from employees order by lastname;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|         10 | James     | Anderson | IT         | 81000.00 |
|          4 | Michael   | Brown    | IT         | 80000.00 |
|          5 | Sarah     | Davis    | HR         | 60000.00 |
|          1 | John      | Doe      | HR         | 55000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
|          3 | Emily     | Jones    | Finance    | 65000.00 |
|          9 | Sophia    | Martinez | Finance    | 67000.00 |
|          8 | Robert    | Miller   | HR         | 58000.00 |
|          2 | Jane      | Smith    | IT         | 75000.00 |
|          6 | David     | Wilson   | Finance    | 70000.00 |
+------------+-----------+----------+------------+----------+
10 rows in set (0.00 sec)

mysql> select distinct department from employees;
+------------+
| department |
+------------+
| HR         |
| IT         |
| Finance    |
+------------+
3 rows in set (0.01 sec)

mysql> -- count number of employees in each department
mysql> select department , count(*) from employees group by department ;
+------------+----------+
| department | count(*) |
+------------+----------+
| HR         |        3 |
| IT         |        4 |
| Finance    |        3 |
+------------+----------+
3 rows in set (0.01 sec)

mysql> -- find maxm salery in table
mysql> select max(salery) from employees;
ERROR 1054 (42S22): Unknown column 'salery' in 'field list'
mysql> select max(salary) from employees;
+-------------+
| max(salary) |
+-------------+
|    81000.00 |
+-------------+
1 row in set (0.00 sec)

mysql> -- avg salery in finance depart
mysql> select department , avg(salary) from employees group by department in ('finance') ;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'db3.employees.Department' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select avg(salary) from employees where department in ('finance') ;
+--------------+
| avg(salary)  |
+--------------+
| 67333.333333 |
+--------------+
1 row in set (0.00 sec)

mysql> -- last name start with M
mysql> select * from employees where lastname like 'M%';
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          8 | Robert    | Miller   | HR         | 58000.00 |
|          9 | Sophia    | Martinez | Finance    | 67000.00 |
+------------+-----------+----------+------------+----------+
2 rows in set (0.01 sec)

mysql> -- select employee who work in it depart and have salary greater than75000
mysql> select * from employees where salary>75000 and department = 'it' ;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          4 | Michael   | Brown    | IT         | 80000.00 |
|         10 | James     | Anderson | IT         | 81000.00 |
+------------+-----------+----------+------------+----------+
2 rows in set (0.00 sec)

mysql> -- find employee work in hr depart or salary less than 60k
mysql> select * from employee where department = 'hr' or salary < 60000 ;
ERROR 1146 (42S02): Table 'db3.employee' doesn't exist
mysql> select * from employees where department = 'hr' or salary < 60000 ;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          1 | John      | Doe      | HR         | 55000.00 |
|          5 | Sarah     | Davis    | HR         | 60000.00 |
|          8 | Robert    | Miller   | HR         | 58000.00 |
+------------+-----------+----------+------------+----------+
3 rows in set (0.00 sec)

mysql> -- select employyee don't work in it depart
mysql> select * from employees where department not in ('it');
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          1 | John      | Doe      | HR         | 55000.00 |
|          3 | Emily     | Jones    | Finance    | 65000.00 |
|          5 | Sarah     | Davis    | HR         | 60000.00 |
|          6 | David     | Wilson   | Finance    | 70000.00 |
|          8 | Robert    | Miller   | HR         | 58000.00 |
|          9 | Sophia    | Martinez | Finance    | 67000.00 |
+------------+-----------+----------+------------+----------+
6 rows in set (0.00 sec)

mysql> -- employee salary between 60000 and 70000 work in it depart
mysql> select * from employees where salary between (60000 and 70000) and department = 'it';
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          1 | John      | Doe      | HR         | 55000.00 |
|          2 | Jane      | Smith    | IT         | 75000.00 |
|          3 | Emily     | Jones    | Finance    | 65000.00 |
|          4 | Michael   | Brown    | IT         | 80000.00 |
|          5 | Sarah     | Davis    | HR         | 60000.00 |
|          6 | David     | Wilson   | Finance    | 70000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
|          8 | Robert    | Miller   | HR         | 58000.00 |
|          9 | Sophia    | Martinez | Finance    | 67000.00 |
|         10 | James     | Anderson | IT         | 81000.00 |
+------------+-----------+----------+------------+----------+
10 rows in set, 4 warnings (0.01 sec)

mysql> select * from employees where department = 'it' and (salary between 60000 and 70000);
Empty set (0.00 sec)

mysql> select * from employees where department = 'it' and (salary between 70000 and 90000);
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          2 | Jane      | Smith    | IT         | 75000.00 |
|          4 | Michael   | Brown    | IT         | 80000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
|         10 | James     | Anderson | IT         | 81000.00 |
+------------+-----------+----------+------------+----------+
4 rows in set (0.00 sec)

mysql> select * from employees where (salary between 60000 and 70000) and department = 'it';
Empty set (0.00 sec)

mysql> select * from employees where (salary between 70000 and 90000) and department = 'it';
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          2 | Jane      | Smith    | IT         | 75000.00 |
|          4 | Michael   | Brown    | IT         | 80000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
|         10 | James     | Anderson | IT         | 81000.00 |
+------------+-----------+----------+------------+----------+
4 rows in set (0.00 sec)

mysql> -- work in it dept and salery is not greater than 80000
mysql> select * from employees where department in ('it') and salary<80000;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          2 | Jane      | Smith    | IT         | 75000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
+------------+-----------+----------+------------+----------+
2 rows in set (0.00 sec)

mysql> work in hr or finance and sALARY > 65000
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'work in hr or finance and sALARY > 65000' at line 1
mysql> -- work in hr or finance and sALARY > 65000
mysql> select * from employees where department in ('hr' , 'finance') and salary>65000;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          6 | David     | Wilson   | Finance    | 70000.00 |
|          9 | Sophia    | Martinez | Finance    | 67000.00 |
+------------+-----------+----------+------------+----------+
2 rows in set (0.00 sec)

mysql> select * from employees where department in ('hr' , 'finance') and salary<65000;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          1 | John      | Doe      | HR         | 55000.00 |
|          5 | Sarah     | Davis    | HR         | 60000.00 |
|          8 | Robert    | Miller   | HR         | 58000.00 |
+------------+-----------+----------+------------+----------+
3 rows in set (0.00 sec)

mysql> -- last name start with d and don't work in HR depart
mysql> select * from employees where lastname like 'd%' and department not in ('hr');
Empty set (0.00 sec)

mysql> -- don't work in it depart and salary>70000
mysql> select * from employees where department not in ('it') and salary>70000;
Empty set (0.00 sec)

mysql> select * from employees where department not in ('it') and salary<70000;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          1 | John      | Doe      | HR         | 55000.00 |
|          3 | Emily     | Jones    | Finance    | 65000.00 |
|          5 | Sarah     | Davis    | HR         | 60000.00 |
|          8 | Robert    | Miller   | HR         | 58000.00 |
|          9 | Sophia    | Martinez | Finance    | 67000.00 |
+------------+-----------+----------+------------+----------+
5 rows in set (0.00 sec)

mysql> -- work in it depart and either salary>75000 or  firstname start with L
mysql> select * from employees where department in ('it') and (salary>75000 or firstname like 'l%');
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          4 | Michael   | Brown    | IT         | 80000.00 |
|          7 | Laura     | Garcia   | IT         | 72000.00 |
|         10 | James     | Anderson | IT         | 81000.00 |
+------------+-----------+----------+------------+----------+
3 rows in set (0.00 sec)

mysql> select * from employees where department not in ('it' , 'hr');
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          3 | Emily     | Jones    | Finance    | 65000.00 |
|          6 | David     | Wilson   | Finance    | 70000.00 |
|          9 | Sophia    | Martinez | Finance    | 67000.00 |
+------------+-----------+----------+------------+----------+
3 rows in set (0.00 sec)