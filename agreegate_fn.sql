Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
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
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use dbq;
ERROR 1049 (42000): Unknown database 'dbq'
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
4 rows in set (0.00 sec)

mysql> select * from employee;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   1 | hey   |   18 |  20000 |
|   2 | hello |   18 |  22000 |
|   3 | done  |   20 |  24000 |
|   4 | ash   | NULL |  32198 |
|   5 | gds   |   19 |   7328 |
|   6 | eih   |   10 |    892 |
|   7 | hud   |   10 |  10000 |
|   8 | uh    |   28 |   NULL |
+-----+-------+------+--------+
8 rows in set (0.00 sec)

mysql> SELECT MIN(salery) FROM EMPLOYEE;
+-------------+
| MIN(salery) |
+-------------+
|         892 |
+-------------+
1 row in set (0.01 sec)

mysql> SELECT MIN(AGE) FROM EMPLOYEE;
+----------+
| MIN(AGE) |
+----------+
|       10 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT MAX(salery) from employee;
+-------------+
| MAX(salery) |
+-------------+
|       32198 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(age) from employee;
+----------+
| MAX(age) |
+----------+
|       28 |
+----------+
1 row in set (0.00 sec)

mysql> select count(*) from employee;
+----------+
| count(*) |
+----------+
|        8 |
+----------+
1 row in set (0.01 sec)

mysql> select count(age) from employee;
+------------+
| count(age) |
+------------+
|          7 |
+------------+
1 row in set (0.00 sec)

mysql> select count(salery) from employee;
+---------------+
| count(salery) |
+---------------+
|             7 |
+---------------+
1 row in set (0.00 sec)

mysql> select count(*) from employee where age>10;
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)

mysql> select count(age) from employee;
+------------+
| count(age) |
+------------+
|          7 |
+------------+
1 row in set (0.00 sec)

mysql> select count(DISTINCT age) from employee;
+---------------------+
| count(DISTINCT age) |
+---------------------+
|                   5 |
+---------------------+
1 row in set (0.01 sec)

mysql> select sum(salery) from employee where name like '%h';
+-------------+
| sum(salery) |
+-------------+
|       33090 |
+-------------+
1 row in set (0.00 sec)

mysql> select avg(salery) from employee where name like '%h';
+-------------+
| avg(salery) |
+-------------+
|  16545.0000 |
+-------------+
1 row in set (0.00 sec)