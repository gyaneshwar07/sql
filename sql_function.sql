Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
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
10 rows in set (0.04 sec)

mysql> create database fn;
Query OK, 1 row affected (0.04 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| db1                |
| db2                |
| db3                |
| fn                 |
| information_schema |
| mysql              |
| new                |
| new db             |
| object             |
| performance_schema |
| sys                |
+--------------------+
11 rows in set (0.00 sec)

mysql> use fn;
Database changed
mysql> show tables;
Empty set (0.01 sec)

mysql> CREATE TABLE Students (
    ->     student_name VARCHAR(100),
    ->     subject VARCHAR(100),
    ->     marks INT
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql>
mysql>
mysql> INSERT INTO Students (student_name, subject, marks)
    -> VALUES
    -> -- Marks for Alice
    -> ('Alice', 'Math', 85),
    -> ('Alice', 'Science', 88),
    -> ('Alice', 'English', 92),
    ->
    -> -- Marks for Bob
    -> ('Bob', 'Math', 90),
    -> ('Bob', 'Science', 78),
    -> ('Bob', 'English', 85),
    ->
    -> -- Marks for Charlie
    -> ('Charlie', 'Math', 85),
    -> ('Charlie', 'Science', 82),
    -> ('Charlie', 'English', 80),
    ->
    -> -- Marks for David
    -> ('David', 'Math', 92),
    -> ('David', 'Science', 91),
    -> ('David', 'English', 89),
    ->
    -> -- Marks for Eve
    -> ('Eve', 'Math', 90),
    -> ('Eve', 'Science', 85),
    -> ('Eve', 'English', 87),
    ->
    -> -- Marks for Frank
    -> ('Frank', 'Math', 75),
    -> ('Frank', 'Science', 72),
    -> ('Frank', 'English', 78),
    ->
    -> -- Marks for Grace
    -> ('Grace', 'Math', 85),
    -> ('Grace', 'Science', 89),
    -> ('Grace', 'English', 90);
Query OK, 21 rows affected (0.02 sec)
Records: 21  Duplicates: 0  Warnings: 0

mysql> show tables;
+--------------+
| Tables_in_fn |
+--------------+
| students     |
+--------------+
1 row in set (0.00 sec)

mysql> select * from students;
+--------------+---------+-------+
| student_name | subject | marks |
+--------------+---------+-------+
| Alice        | Math    |    85 |
| Alice        | Science |    88 |
| Alice        | English |    92 |
| Bob          | Math    |    90 |
| Bob          | Science |    78 |
| Bob          | English |    85 |
| Charlie      | Math    |    85 |
| Charlie      | Science |    82 |
| Charlie      | English |    80 |
| David        | Math    |    92 |
| David        | Science |    91 |
| David        | English |    89 |
| Eve          | Math    |    90 |
| Eve          | Science |    85 |
| Eve          | English |    87 |
| Frank        | Math    |    75 |
| Frank        | Science |    72 |
| Frank        | English |    78 |
| Grace        | Math    |    85 |
| Grace        | Science |    89 |
| Grace        | English |    90 |
+--------------+---------+-------+
21 rows in set (0.00 sec)

mysql> select *,ROW_NUMBER() over (order by marks desc) as row_num from students;
+--------------+---------+-------+---------+
| student_name | subject | marks | row_num |
+--------------+---------+-------+---------+
| Alice        | English |    92 |       1 |
| David        | Math    |    92 |       2 |
| David        | Science |    91 |       3 |
| Bob          | Math    |    90 |       4 |
| Eve          | Math    |    90 |       5 |
| Grace        | English |    90 |       6 |
| David        | English |    89 |       7 |
| Grace        | Science |    89 |       8 |
| Alice        | Science |    88 |       9 |
| Eve          | English |    87 |      10 |
| Alice        | Math    |    85 |      11 |
| Bob          | English |    85 |      12 |
| Charlie      | Math    |    85 |      13 |
| Eve          | Science |    85 |      14 |
| Grace        | Math    |    85 |      15 |
| Charlie      | Science |    82 |      16 |
| Charlie      | English |    80 |      17 |
| Bob          | Science |    78 |      18 |
| Frank        | English |    78 |      19 |
| Frank        | Math    |    75 |      20 |
| Frank        | Science |    72 |      21 |
+--------------+---------+-------+---------+
21 rows in set (0.01 sec)

mysql> select *,Rank() over (order by marks desc) as rank_fn from students;
+--------------+---------+-------+---------+
| student_name | subject | marks | rank_fn |
+--------------+---------+-------+---------+
| Alice        | English |    92 |       1 |
| David        | Math    |    92 |       1 |
| David        | Science |    91 |       3 |
| Bob          | Math    |    90 |       4 |
| Eve          | Math    |    90 |       4 |
| Grace        | English |    90 |       4 |
| David        | English |    89 |       7 |
| Grace        | Science |    89 |       7 |
| Alice        | Science |    88 |       9 |
| Eve          | English |    87 |      10 |
| Alice        | Math    |    85 |      11 |
| Bob          | English |    85 |      11 |
| Charlie      | Math    |    85 |      11 |
| Eve          | Science |    85 |      11 |
| Grace        | Math    |    85 |      11 |
| Charlie      | Science |    82 |      16 |
| Charlie      | English |    80 |      17 |
| Bob          | Science |    78 |      18 |
| Frank        | English |    78 |      18 |
| Frank        | Math    |    75 |      20 |
| Frank        | Science |    72 |      21 |
+--------------+---------+-------+---------+
21 rows in set (0.00 sec)

mysql> select *,Dense_Rank() over (order by marks desc) as DENSE RANK from students;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'RANK from students' at line 1
mysql> select *,Dense_Rank() over (order by marks desc) as DENSE_RANK from students;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DENSE_RANK from students' at line 1
mysql> select *,DENSE_RANK() over (order by marks desc) as DENSE_RANK from students;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DENSE_RANK from students' at line 1
mysql> select *,DENSE_RANK() over (order by marks desc) as DEN_RANK from students;
+--------------+---------+-------+----------+
| student_name | subject | marks | DEN_RANK |
+--------------+---------+-------+----------+
| Alice        | English |    92 |        1 |
| David        | Math    |    92 |        1 |
| David        | Science |    91 |        2 |
| Bob          | Math    |    90 |        3 |
| Eve          | Math    |    90 |        3 |
| Grace        | English |    90 |        3 |
| David        | English |    89 |        4 |
| Grace        | Science |    89 |        4 |
| Alice        | Science |    88 |        5 |
| Eve          | English |    87 |        6 |
| Alice        | Math    |    85 |        7 |
| Bob          | English |    85 |        7 |
| Charlie      | Math    |    85 |        7 |
| Eve          | Science |    85 |        7 |
| Grace        | Math    |    85 |        7 |
| Charlie      | Science |    82 |        8 |
| Charlie      | English |    80 |        9 |
| Bob          | Science |    78 |       10 |
| Frank        | English |    78 |       10 |
| Frank        | Math    |    75 |       11 |
| Frank        | Science |    72 |       12 |
+--------------+---------+-------+----------+
21 rows in set (0.00 sec)

mysql> select *,DENSE_RANK() over (order by marks desc) as DENSE_RANK from students;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DENSE_RANK from students' at line 1
mysql> select *,DENSE_RANK() over (order by marks desc) as DENSE RANK from students;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'RANK from students' at line 1
mysql> select *,DENSE_RANK() over (order by marks desc) as DENSERANK from students;
+--------------+---------+-------+-----------+
| student_name | subject | marks | DENSERANK |
+--------------+---------+-------+-----------+
| Alice        | English |    92 |         1 |
| David        | Math    |    92 |         1 |
| David        | Science |    91 |         2 |
| Bob          | Math    |    90 |         3 |
| Eve          | Math    |    90 |         3 |
| Grace        | English |    90 |         3 |
| David        | English |    89 |         4 |
| Grace        | Science |    89 |         4 |
| Alice        | Science |    88 |         5 |
| Eve          | English |    87 |         6 |
| Alice        | Math    |    85 |         7 |
| Bob          | English |    85 |         7 |
| Charlie      | Math    |    85 |         7 |
| Eve          | Science |    85 |         7 |
| Grace        | Math    |    85 |         7 |
| Charlie      | Science |    82 |         8 |
| Charlie      | English |    80 |         9 |
| Bob          | Science |    78 |        10 |
| Frank        | English |    78 |        10 |
| Frank        | Math    |    75 |        11 |
| Frank        | Science |    72 |        12 |
+--------------+---------+-------+-----------+
21 rows in set (0.00 sec)

mysql> select *,ROW_NUMBER() over (partition by subject order by marks desc) as row_number from students;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'row_number from students' at line 1
mysql> select *,ROW_NUMBER() over (partition by subject order by marks desc) as row_num from students;
+--------------+---------+-------+---------+
| student_name | subject | marks | row_num |
+--------------+---------+-------+---------+
| Alice        | English |    92 |       1 |
| Grace        | English |    90 |       2 |
| David        | English |    89 |       3 |
| Eve          | English |    87 |       4 |
| Bob          | English |    85 |       5 |
| Charlie      | English |    80 |       6 |
| Frank        | English |    78 |       7 |
| David        | Math    |    92 |       1 |
| Bob          | Math    |    90 |       2 |
| Eve          | Math    |    90 |       3 |
| Alice        | Math    |    85 |       4 |
| Charlie      | Math    |    85 |       5 |
| Grace        | Math    |    85 |       6 |
| Frank        | Math    |    75 |       7 |
| David        | Science |    91 |       1 |
| Grace        | Science |    89 |       2 |
| Alice        | Science |    88 |       3 |
| Eve          | Science |    85 |       4 |
| Charlie      | Science |    82 |       5 |
| Bob          | Science |    78 |       6 |
| Frank        | Science |    72 |       7 |
+--------------+---------+-------+---------+
21 rows in set (0.00 sec)

mysql> select *,ROW_NUMBER() over (partition by student_name order by marks desc) as row_num from students;
+--------------+---------+-------+---------+
| student_name | subject | marks | row_num |
+--------------+---------+-------+---------+
| Alice        | English |    92 |       1 |
| Alice        | Science |    88 |       2 |
| Alice        | Math    |    85 |       3 |
| Bob          | Math    |    90 |       1 |
| Bob          | English |    85 |       2 |
| Bob          | Science |    78 |       3 |
| Charlie      | Math    |    85 |       1 |
| Charlie      | Science |    82 |       2 |
| Charlie      | English |    80 |       3 |
| David        | Math    |    92 |       1 |
| David        | Science |    91 |       2 |
| David        | English |    89 |       3 |
| Eve          | Math    |    90 |       1 |
| Eve          | English |    87 |       2 |
| Eve          | Science |    85 |       3 |
| Frank        | English |    78 |       1 |
| Frank        | Math    |    75 |       2 |
| Frank        | Science |    72 |       3 |
| Grace        | English |    90 |       1 |
| Grace        | Science |    89 |       2 |
| Grace        | Math    |    85 |       3 |
+--------------+---------+-------+---------+
21 rows in set (0.00 sec)

mysql> CREATE  TABLE ProfitData (
    ->     MonthNumber INT,
    ->     MonthName VARCHAR(3),
    ->     Product VARCHAR(50),
    ->     Profit INT
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> -- Insert data into the ProfitData table
mysql> INSERT INTO ProfitData (MonthNumber, MonthName, Product, Profit) VALUES
    -> (1, 'Jan', 'Product A', 1000),
    -> (2, 'Feb', 'Product A', 1500),
    -> (3, 'Mar', 'Product A', 1200),
    -> (4, 'Apr', 'Product A', 1700),
    -> (5, 'May', 'Product A', 1300),
    -> (6, 'Jun', 'Product A', 1600),
    -> (1, 'Jan', 'Product B', 2000),
    -> (2, 'Feb', 'Product B', 2500),
    -> (3, 'Mar', 'Product B', 2200),
    -> (4, 'Apr', 'Product B', 2700),
    -> (5, 'May', 'Product B', 2300),
    -> (6, 'Jun', 'Product B', 2600);
Query OK, 12 rows affected (0.01 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> select * from profitdata;
+-------------+-----------+-----------+--------+
| MonthNumber | MonthName | Product   | Profit |
+-------------+-----------+-----------+--------+
|           1 | Jan       | Product A |   1000 |
|           2 | Feb       | Product A |   1500 |
|           3 | Mar       | Product A |   1200 |
|           4 | Apr       | Product A |   1700 |
|           5 | May       | Product A |   1300 |
|           6 | Jun       | Product A |   1600 |
|           1 | Jan       | Product B |   2000 |
|           2 | Feb       | Product B |   2500 |
|           3 | Mar       | Product B |   2200 |
|           4 | Apr       | Product B |   2700 |
|           5 | May       | Product B |   2300 |
|           6 | Jun       | Product B |   2600 |
+-------------+-----------+-----------+--------+
12 rows in set (0.00 sec)

mysql> select *,LEAD(profit) over(partition by product order by monthName) as next_mn_profit from profitData;
+-------------+-----------+-----------+--------+----------------+
| MonthNumber | MonthName | Product   | Profit | next_mn_profit |
+-------------+-----------+-----------+--------+----------------+
|           4 | Apr       | Product A |   1700 |           1500 |
|           2 | Feb       | Product A |   1500 |           1000 |
|           1 | Jan       | Product A |   1000 |           1600 |
|           6 | Jun       | Product A |   1600 |           1200 |
|           3 | Mar       | Product A |   1200 |           1300 |
|           5 | May       | Product A |   1300 |           NULL |
|           4 | Apr       | Product B |   2700 |           2500 |
|           2 | Feb       | Product B |   2500 |           2000 |
|           1 | Jan       | Product B |   2000 |           2600 |
|           6 | Jun       | Product B |   2600 |           2200 |
|           3 | Mar       | Product B |   2200 |           2300 |
|           5 | May       | Product B |   2300 |           NULL |
+-------------+-----------+-----------+--------+----------------+
12 rows in set (0.01 sec)

mysql> select *,LEAD(profit) over(partition by product order by profit) as next_mn_profit from profitData;
+-------------+-----------+-----------+--------+----------------+
| MonthNumber | MonthName | Product   | Profit | next_mn_profit |
+-------------+-----------+-----------+--------+----------------+
|           1 | Jan       | Product A |   1000 |           1200 |
|           3 | Mar       | Product A |   1200 |           1300 |
|           5 | May       | Product A |   1300 |           1500 |
|           2 | Feb       | Product A |   1500 |           1600 |
|           6 | Jun       | Product A |   1600 |           1700 |
|           4 | Apr       | Product A |   1700 |           NULL |
|           1 | Jan       | Product B |   2000 |           2200 |
|           3 | Mar       | Product B |   2200 |           2300 |
|           5 | May       | Product B |   2300 |           2500 |
|           2 | Feb       | Product B |   2500 |           2600 |
|           6 | Jun       | Product B |   2600 |           2700 |
|           4 | Apr       | Product B |   2700 |           NULL |
+-------------+-----------+-----------+--------+----------------+
12 rows in set (0.00 sec)

mysql> select monthnumber,monthname,sum(profit) from profitData group by monthnumber,monthname;
+-------------+-----------+-------------+
| monthnumber | monthname | sum(profit) |
+-------------+-----------+-------------+
|           1 | Jan       |        3000 |
|           2 | Feb       |        4000 |
|           3 | Mar       |        3400 |
|           4 | Apr       |        4400 |
|           5 | May       |        3600 |
|           6 | Jun       |        4200 |
+-------------+-----------+-------------+
6 rows in set (0.00 sec)

mysql> select monthnumber,monthname,sum(profit) , lead(sum(profit)) over(order by monthnumber) from profitData group by monthnumber,monthname;
+-------------+-----------+-------------+----------------------------------------------+
| monthnumber | monthname | sum(profit) | lead(sum(profit)) over(order by monthnumber) |
+-------------+-----------+-------------+----------------------------------------------+
|           1 | Jan       |        3000 |                                         4000 |
|           2 | Feb       |        4000 |                                         3400 |
|           3 | Mar       |        3400 |                                         4400 |
|           4 | Apr       |        4400 |                                         3600 |
|           5 | May       |        3600 |                                         4200 |
|           6 | Jun       |        4200 |                                         NULL |
+-------------+-----------+-------------+----------------------------------------------+
6 rows in set (0.00 sec)

mysql> select * from profitdata;
+-------------+-----------+-----------+--------+
| MonthNumber | MonthName | Product   | Profit |
+-------------+-----------+-----------+--------+
|           1 | Jan       | Product A |   1000 |
|           2 | Feb       | Product A |   1500 |
|           3 | Mar       | Product A |   1200 |
|           4 | Apr       | Product A |   1700 |
|           5 | May       | Product A |   1300 |
|           6 | Jun       | Product A |   1600 |
|           1 | Jan       | Product B |   2000 |
|           2 | Feb       | Product B |   2500 |
|           3 | Mar       | Product B |   2200 |
|           4 | Apr       | Product B |   2700 |
|           5 | May       | Product B |   2300 |
|           6 | Jun       | Product B |   2600 |
+-------------+-----------+-----------+--------+
12 rows in set (0.00 sec)

mysql> select *,lag(profit) over(partition by product order by monthnumber) as lag_profit from profitData;
+-------------+-----------+-----------+--------+------------+
| MonthNumber | MonthName | Product   | Profit | lag_profit |
+-------------+-----------+-----------+--------+------------+
|           1 | Jan       | Product A |   1000 |       NULL |
|           2 | Feb       | Product A |   1500 |       1000 |
|           3 | Mar       | Product A |   1200 |       1500 |
|           4 | Apr       | Product A |   1700 |       1200 |
|           5 | May       | Product A |   1300 |       1700 |
|           6 | Jun       | Product A |   1600 |       1300 |
|           1 | Jan       | Product B |   2000 |       NULL |
|           2 | Feb       | Product B |   2500 |       2000 |
|           3 | Mar       | Product B |   2200 |       2500 |
|           4 | Apr       | Product B |   2700 |       2200 |
|           5 | May       | Product B |   2300 |       2700 |
|           6 | Jun       | Product B |   2600 |       2300 |
+-------------+-----------+-----------+--------+------------+
12 rows in set (0.00 sec)

mysql> select monthnumber,monthname , sum(profit) from profitData group by monthnumber,monthname;
+-------------+-----------+-------------+
| monthnumber | monthname | sum(profit) |
+-------------+-----------+-------------+
|           1 | Jan       |        3000 |
|           2 | Feb       |        4000 |
|           3 | Mar       |        3400 |
|           4 | Apr       |        4400 |
|           5 | May       |        3600 |
|           6 | Jun       |        4200 |
+-------------+-----------+-------------+
6 rows in set (0.00 sec)

mysql> select monthnumber,monthname , sum(profit) as profit, lag(profit) over(order by monthnumber) as prev_mon_profit from profitData group by monthnumber,monthname;
ERROR 1055 (42000): Expression #4 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'fn.profitData.Profit' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select monthnumber,monthname , sum(profit), lag(sum(profit)) over(order by monthnumber) as prev_mon_profit from profitData group by monthnumber,monthname;
+-------------+-----------+-------------+-----------------+
| monthnumber | monthname | sum(profit) | prev_mon_profit |
+-------------+-----------+-------------+-----------------+
|           1 | Jan       |        3000 |            NULL |
|           2 | Feb       |        4000 |            3000 |
|           3 | Mar       |        3400 |            4000 |
|           4 | Apr       |        4400 |            3400 |
|           5 | May       |        3600 |            4400 |
|           6 | Jun       |        4200 |            3600 |
+-------------+-----------+-------------+-----------------+
6 rows in set (0.00 sec)

mysql> show tables;
+--------------+
| Tables_in_fn |
+--------------+
| profitdata   |
| students     |
+--------------+
2 rows in set (0.00 sec)

mysql> CREATE TABLE Customers (
    ->     CustomerID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Email VARCHAR(100),
    ->     PhoneNumber VARCHAR(20),
    ->     Address VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql>
mysql> INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
    -> VALUES
    -> (1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '123 Elm St'),
    -> (2, 'Bob', 'Smith', NULL, '555-5678', NULL),
    -> (3, 'Charlie', 'Williams', 'charlie.williams@example.com', NULL, '456 Oak St'),
    -> (4, 'Diana', 'Brown', NULL, NULL, '789 Pine St'),
    -> (5, 'Eve', 'Davis', 'eve.davis@example.com', '555-8765', NULL);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+------------+-----------+----------+------------------------------+-------------+-------------+
| CustomerID | FirstName | LastName | Email                        | PhoneNumber | Address     |
+------------+-----------+----------+------------------------------+-------------+-------------+
|          1 | Alice     | Johnson  | alice.johnson@example.com    | 555-1234    | 123 Elm St  |
|          2 | Bob       | Smith    | NULL                         | 555-5678    | NULL        |
|          3 | Charlie   | Williams | charlie.williams@example.com | NULL        | 456 Oak St  |
|          4 | Diana     | Brown    | NULL                         | NULL        | 789 Pine St |
|          5 | Eve       | Davis    | eve.davis@example.com        | 555-8765    | NULL        |
+------------+-----------+----------+------------------------------+-------------+-------------+
5 rows in set (0.00 sec)

mysql> select firstname,lastname,email from customers;
+-----------+----------+------------------------------+
| firstname | lastname | email                        |
+-----------+----------+------------------------------+
| Alice     | Johnson  | alice.johnson@example.com    |
| Bob       | Smith    | NULL                         |
| Charlie   | Williams | charlie.williams@example.com |
| Diana     | Brown    | NULL                         |
| Eve       | Davis    | eve.davis@example.com        |
+-----------+----------+------------------------------+
5 rows in set (0.00 sec)

mysql> select firstnamw,lastname,isnull(email,'email not avail') from customers;
ERROR 1582 (42000): Incorrect parameter count in the call to native function 'isnull'
mysql> select firstnamw,lastname,ifnull(email,'email not avail') from customers;
ERROR 1054 (42S22): Unknown column 'firstnamw' in 'field list'
mysql> select firstname,lastname,ifnull(email,'email not avail') from customers;
+-----------+----------+---------------------------------+
| firstname | lastname | ifnull(email,'email not avail') |
+-----------+----------+---------------------------------+
| Alice     | Johnson  | alice.johnson@example.com       |
| Bob       | Smith    | email not avail                 |
| Charlie   | Williams | charlie.williams@example.com    |
| Diana     | Brown    | email not avail                 |
| Eve       | Davis    | eve.davis@example.com           |
+-----------+----------+---------------------------------+
5 rows in set (0.00 sec)

mysql> select firstname,ifnull(email,'email not avail') as email_replace , ifnull(phonenumber,'not avail') as phn_num from customers;
+-----------+------------------------------+-----------+
| firstname | email_replace                | phn_num   |
+-----------+------------------------------+-----------+
| Alice     | alice.johnson@example.com    | 555-1234  |
| Bob       | email not avail              | 555-5678  |
| Charlie   | charlie.williams@example.com | not avail |
| Diana     | email not avail              | not avail |
| Eve       | eve.davis@example.com        | 555-8765  |
+-----------+------------------------------+-----------+
5 rows in set (0.00 sec)

mysql> select firstname,coalesce(email,'email not avail') as email_replace , coalesce(phonenumber,'not avail') as phn_num from customers;
+-----------+------------------------------+-----------+
| firstname | email_replace                | phn_num   |
+-----------+------------------------------+-----------+
| Alice     | alice.johnson@example.com    | 555-1234  |
| Bob       | email not avail              | 555-5678  |
| Charlie   | charlie.williams@example.com | not avail |
| Diana     | email not avail              | not avail |
| Eve       | eve.davis@example.com        | 555-8765  |
+-----------+------------------------------+-----------+
5 rows in set (0.00 sec)

mysql> CREATE TABLE EmployeeSalaries (
    ->     EmployeeID INT,
    ->     EmployeeName VARCHAR(50),
    ->     Salary INT,
    ->     Department VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql>
mysql> INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Department)
    -> VALUES
    -> (1, 'Alice', 50000, 'HR'),
    -> (2, 'Bob', 60000, 'HR'),
    -> (3, 'Charlie', 55000, 'HR'),
    -> (4, 'David', 75000, 'Finance'),
    -> (5, 'Eve', 80000, 'Finance'),
    -> (6, 'Frank', 72000, 'Finance'),
    -> (7, 'Grace', 90000, 'IT'),
    -> (8, 'Heidi', 95000, 'IT'),
    -> (9, 'Ivan', 87000, 'IT');
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> select * from employeesalaries;
+------------+--------------+--------+------------+
| EmployeeID | EmployeeName | Salary | Department |
+------------+--------------+--------+------------+
|          1 | Alice        |  50000 | HR         |
|          2 | Bob          |  60000 | HR         |
|          3 | Charlie      |  55000 | HR         |
|          4 | David        |  75000 | Finance    |
|          5 | Eve          |  80000 | Finance    |
|          6 | Frank        |  72000 | Finance    |
|          7 | Grace        |  90000 | IT         |
|          8 | Heidi        |  95000 | IT         |
|          9 | Ivan         |  87000 | IT         |
+------------+--------------+--------+------------+
9 rows in set (0.00 sec)

mysql> select employeeId,employeeName,min(salary) as minm_sal from employeesalaries group by employeeId,employeeName;
+------------+--------------+----------+
| employeeId | employeeName | minm_sal |
+------------+--------------+----------+
|          1 | Alice        |    50000 |
|          2 | Bob          |    60000 |
|          3 | Charlie      |    55000 |
|          4 | David        |    75000 |
|          5 | Eve          |    80000 |
|          6 | Frank        |    72000 |
|          7 | Grace        |    90000 |
|          8 | Heidi        |    95000 |
|          9 | Ivan         |    87000 |
+------------+--------------+----------+
9 rows in set (0.00 sec)

mysql> -- want minm salary of all dataset
mysql> select *,first_value(salary) over(order by salary) as minm_sal from employeesalaries;
+------------+--------------+--------+------------+----------+
| EmployeeID | EmployeeName | Salary | Department | minm_sal |
+------------+--------------+--------+------------+----------+
|          1 | Alice        |  50000 | HR         |    50000 |
|          3 | Charlie      |  55000 | HR         |    50000 |
|          2 | Bob          |  60000 | HR         |    50000 |
|          6 | Frank        |  72000 | Finance    |    50000 |
|          4 | David        |  75000 | Finance    |    50000 |
|          5 | Eve          |  80000 | Finance    |    50000 |
|          9 | Ivan         |  87000 | IT         |    50000 |
|          7 | Grace        |  90000 | IT         |    50000 |
|          8 | Heidi        |  95000 | IT         |    50000 |
+------------+--------------+--------+------------+----------+
9 rows in set (0.00 sec)

mysql> select *,first_value(salary) over(order by salary desc) as minm_sal from employeesalaries;
+------------+--------------+--------+------------+----------+
| EmployeeID | EmployeeName | Salary | Department | minm_sal |
+------------+--------------+--------+------------+----------+
|          8 | Heidi        |  95000 | IT         |    95000 |
|          7 | Grace        |  90000 | IT         |    95000 |
|          9 | Ivan         |  87000 | IT         |    95000 |
|          5 | Eve          |  80000 | Finance    |    95000 |
|          4 | David        |  75000 | Finance    |    95000 |
|          6 | Frank        |  72000 | Finance    |    95000 |
|          2 | Bob          |  60000 | HR         |    95000 |
|          3 | Charlie      |  55000 | HR         |    95000 |
|          1 | Alice        |  50000 | HR         |    95000 |
+------------+--------------+--------+------------+----------+
9 rows in set (0.00 sec)

mysql> select *,first_value(employeeName) over(order by salary desc) as maxm_sal from employeesalaries;
+------------+--------------+--------+------------+----------+
| EmployeeID | EmployeeName | Salary | Department | maxm_sal |
+------------+--------------+--------+------------+----------+
|          8 | Heidi        |  95000 | IT         | Heidi    |
|          7 | Grace        |  90000 | IT         | Heidi    |
|          9 | Ivan         |  87000 | IT         | Heidi    |
|          5 | Eve          |  80000 | Finance    | Heidi    |
|          4 | David        |  75000 | Finance    | Heidi    |
|          6 | Frank        |  72000 | Finance    | Heidi    |
|          2 | Bob          |  60000 | HR         | Heidi    |
|          3 | Charlie      |  55000 | HR         | Heidi    |
|          1 | Alice        |  50000 | HR         | Heidi    |
+------------+--------------+--------+------------+----------+
9 rows in set (0.00 sec)

 ysql> select *,LAST_VALUE(employeeId) over(order by salary desc rows between unbounded preceding and unbounded following) as min_sal from employeesalaries;
+------------+--------------+--------+------------+---------+
| EmployeeID | EmployeeName | Salary | Department | min_sal |
+------------+--------------+--------+------------+---------+
|          8 | Heidi        |  95000 | IT         |       1 |
|          7 | Grace        |  90000 | IT         |       1 |
|          9 | Ivan         |  87000 | IT         |       1 |
|          5 | Eve          |  80000 | Finance    |       1 |
|          4 | David        |  75000 | Finance    |       1 |
|          6 | Frank        |  72000 | Finance    |       1 |
|          2 | Bob          |  60000 | HR         |       1 |
|          3 | Charlie      |  55000 | HR         |       1 |
|          1 | Alice        |  50000 | HR         |       1 |
+------------+--------------+--------+------------+---------+
9 rows in set (0.00 sec)