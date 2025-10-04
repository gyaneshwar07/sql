Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
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
5 rows in set (0.01 sec)

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

mysql> select * from employee
    -> order by salery;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   8 | uh    |   28 |   NULL |
|   6 | eih   |   10 |    892 |
|   5 | gds   |   19 |   7328 |
|   7 | hud   |   10 |  10000 |
|   1 | hey   |   18 |  20000 |
|   2 | hello |   18 |  22000 |
|   3 | done  |   20 |  24000 |
|   4 | ash   | NULL |  32198 |
+-----+-------+------+--------+
8 rows in set (0.00 sec)

mysql> select * from employee order by agw;
ERROR 1054 (42S22): Unknown column 'agw' in 'order clause'
mysql> select * from employee order by age;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   4 | ash   | NULL |  32198 |
|   6 | eih   |   10 |    892 |
|   7 | hud   |   10 |  10000 |
|   1 | hey   |   18 |  20000 |
|   2 | hello |   18 |  22000 |
|   5 | gds   |   19 |   7328 |
|   3 | done  |   20 |  24000 |
|   8 | uh    |   28 |   NULL |
+-----+-------+------+--------+
8 rows in set (0.00 sec)

mysql> select * from employee order by age desc;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   8 | uh    |   28 |   NULL |
|   3 | done  |   20 |  24000 |
|   5 | gds   |   19 |   7328 |
|   1 | hey   |   18 |  20000 |
|   2 | hello |   18 |  22000 |
|   6 | eih   |   10 |    892 |
|   7 | hud   |   10 |  10000 |
|   4 | ash   | NULL |  32198 |
+-----+-------+------+--------+
8 rows in set (0.00 sec)

mysql> select * from employee order by age,salery;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   4 | ash   | NULL |  32198 |
|   6 | eih   |   10 |    892 |
|   7 | hud   |   10 |  10000 |
|   1 | hey   |   18 |  20000 |
|   2 | hello |   18 |  22000 |
|   5 | gds   |   19 |   7328 |
|   3 | done  |   20 |  24000 |
|   8 | uh    |   28 |   NULL |
+-----+-------+------+--------+
8 rows in set (0.00 sec)

mysql> select * from employee order by age asc , salery desc;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   4 | ash   | NULL |  32198 |
|   7 | hud   |   10 |  10000 |
|   6 | eih   |   10 |    892 |
|   2 | hello |   18 |  22000 |
|   1 | hey   |   18 |  20000 |
|   5 | gds   |   19 |   7328 |
|   3 | done  |   20 |  24000 |
|   8 | uh    |   28 |   NULL |
+-----+-------+------+--------+
8 rows in set (0.00 sec)

mysql> select * from employee where age>10 order by salery;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   8 | uh    |   28 |   NULL |
|   5 | gds   |   19 |   7328 |
|   1 | hey   |   18 |  20000 |
|   2 | hello |   18 |  22000 |
|   3 | done  |   20 |  24000 |
+-----+-------+------+--------+
5 rows in set (0.00 sec)

mysql> select * from employee where age>10 order by age;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   1 | hey   |   18 |  20000 |
|   2 | hello |   18 |  22000 |
|   5 | gds   |   19 |   7328 |
|   3 | done  |   20 |  24000 |
|   8 | uh    |   28 |   NULL |
+-----+-------+------+--------+
5 rows in set (0.00 sec)

mysql> select * from employee where name like '%e' order by age;
+-----+------+------+--------+
| eid | name | age  | salery |
+-----+------+------+--------+
|   3 | done |   20 |  24000 |
+-----+------+------+--------+
1 row in set (0.00 sec)