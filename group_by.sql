Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 21
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
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.01 sec)

mysql> use db1;
Database changed
mysql> show tables;
+---------------+
| Tables_in_db1 |
+---------------+
| book          |
| employee      |
| project       |
| team          |
+---------------+
4 rows in set (0.01 sec)

mysql> select * from employee;
+-----+-------+------+--------+--------+
| eid | name  | age  | salery | depart |
+-----+-------+------+--------+--------+
|   1 | hey   |   18 |  20000 | cse    |
|   2 | hello |   18 |  22000 | cse    |
|   3 | done  |   20 |  24000 | ds     |
|   4 | ash   | NULL |  32198 | ece    |
|   5 | gds   |   19 |   7328 | ds     |
|   6 | eih   |   10 |    892 | it     |
|   7 | hud   |   10 |  10000 | it     |
|   8 | uh    |   28 |   NULL | ds     |
+-----+-------+------+--------+--------+
8 rows in set (0.00 sec)

mysql> MODIFY TABLE employee
    -> set age = 10
    -> where age is null
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'MODIFY TABLE employee
set age = 10
where age is null' at line 1
mysql> update employee set age = 10 where age is null;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee;
+-----+-------+------+--------+--------+
| eid | name  | age  | salery | depart |
+-----+-------+------+--------+--------+
|   1 | hey   |   18 |  20000 | cse    |
|   2 | hello |   18 |  22000 | cse    |
|   3 | done  |   20 |  24000 | ds     |
|   4 | ash   |   10 |  32198 | ece    |
|   5 | gds   |   19 |   7328 | ds     |
|   6 | eih   |   10 |    892 | it     |
|   7 | hud   |   10 |  10000 | it     |
|   8 | uh    |   28 |   NULL | ds     |
+-----+-------+------+--------+--------+
8 rows in set (0.00 sec)

mysql> select count(eid),depart from employee group by depart;
+------------+--------+
| count(eid) | depart |
+------------+--------+
|          2 | cse    |
|          3 | ds     |
|          1 | ece    |
|          2 | it     |
+------------+--------+
4 rows in set (0.01 sec)

mysql> select sum(salery),depart from employee group by depart;
+-------------+--------+
| sum(salery) | depart |
+-------------+--------+
|       42000 | cse    |
|       31328 | ds     |
|       32198 | ece    |
|       10892 | it     |
+-------------+--------+
4 rows in set (0.00 sec)

mysql> select sum(salery) as total_expenses,depart from employee group by depart;
+----------------+--------+
| total_expenses | depart |
+----------------+--------+
|          42000 | cse    |
|          31328 | ds     |
|          32198 | ece    |
|          10892 | it     |
+----------------+--------+
4 rows in set (0.00 sec)

mysql> select sum(salery) as total_expenses,depart from employee group by depart order by depart total_expenses;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'total_expenses' at line 1
mysql> select sum(salery) as total_expenses,depart from employee group by depart order by depart desc;
+----------------+--------+
| total_expenses | depart |
+----------------+--------+
|          10892 | it     |
|          32198 | ece    |
|          31328 | ds     |
|          42000 | cse    |
+----------------+--------+
4 rows in set (0.00 sec)