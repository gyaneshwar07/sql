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
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.25 sec)

mysql> use db1;
Database changed
mysql> show tables;
+---------------+
| Tables_in_db1 |
+---------------+
| employee      |
| project       |
+---------------+
2 rows in set (0.07 sec)

mysql> describe employee;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| eid    | int          | NO   | PRI | NULL    |       |
| name   | varchar(260) | YES  |     | NULL    |       |
| age    | int          | YES  |     | NULL    |       |
| salery | int          | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

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
8 rows in set (0.19 sec)

mysql> describe project;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| pid      | int          | NO   | PRI | NULL    |       |
| pname    | varchar(260) | YES  |     | NULL    |       |
| incharge | int          | NO   | MUL | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from project;
+-----+-------+----------+
| pid | pname | incharge |
+-----+-------+----------+
|   1 | abc   |        2 |
|   4 | def   |        3 |
|  10 | xyz   |        3 |
+-----+-------+----------+
3 rows in set (0.01 sec)

mysql> ALTER TABLE employee
    -> ADD department varchar(255);
Query OK, 0 rows affected (0.18 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+-----+-------+------+--------+------------+
| eid | name  | age  | salery | department |
+-----+-------+------+--------+------------+
|   1 | hey   |   18 |  20000 | NULL       |
|   2 | hello |   18 |  22000 | NULL       |
|   3 | done  |   20 |  24000 | NULL       |
|   4 | ash   | NULL |  32198 | NULL       |
|   5 | gds   |   19 |   7328 | NULL       |
|   6 | eih   |   10 |    892 | NULL       |
|   7 | hud   |   10 |  10000 | NULL       |
|   8 | uh    |   28 |   NULL | NULL       |
+-----+-------+------+--------+------------+
8 rows in set (0.00 sec)

mysql> ALTER TABLE employee
    -> MODIFY COLUMN department ENUM('IT' , 'CSE' , 'EE' , 'HR' , 'DS' );
Query OK, 8 rows affected (0.23 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> describe employee;
+------------+---------------------------------+------+-----+---------+-------+
| Field      | Type                            | Null | Key | Default | Extra |
+------------+---------------------------------+------+-----+---------+-------+
| eid        | int                             | NO   | PRI | NULL    |       |
| name       | varchar(260)                    | YES  |     | NULL    |       |
| age        | int                             | YES  |     | NULL    |       |
| salery     | int                             | YES  |     | NULL    |       |
| department | enum('IT','CSE','EE','HR','DS') | YES  |     | NULL    |       |
+------------+---------------------------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> ALTER TABLE employee
    -> RENAME COLUMN department TO dept;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe employee;
+--------+---------------------------------+------+-----+---------+-------+
| Field  | Type                            | Null | Key | Default | Extra |
+--------+---------------------------------+------+-----+---------+-------+
| eid    | int                             | NO   | PRI | NULL    |       |
| name   | varchar(260)                    | YES  |     | NULL    |       |
| age    | int                             | YES  |     | NULL    |       |
| salery | int                             | YES  |     | NULL    |       |
| dept   | enum('IT','CSE','EE','HR','DS') | YES  |     | NULL    |       |
+--------+---------------------------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> ALTER TABLE employee
    -> DROP COLUMN dept;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe employee;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| eid    | int          | NO   | PRI | NULL    |       |
| name   | varchar(260) | YES  |     | NULL    |       |
| age    | int          | YES  |     | NULL    |       |
| salery | int          | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)