Microsoft Windows [Version 10.0.26100.6584]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 20
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
5 rows in set (0.19 sec)

mysql> describe db1;
ERROR 1046 (3D000): No database selected
mysql> use db1;
Database changed
mysql> describe db1;
ERROR 1146 (42S02): Table 'db1.db1' doesn't exist
mysql> show tables;
+---------------+
| Tables_in_db1 |
+---------------+
| employee      |
| project       |
+---------------+
2 rows in set (0.03 sec)

mysql> select * from employee;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   1 | hey   |   18 |  20000 |
|   2 | hello |   18 |  22000 |
|   3 | done  |   20 |  24000 |
+-----+-------+------+--------+
3 rows in set (0.04 sec)

mysql> select * from project;
+-----+-------+----------+
| pid | pname | incharge |
+-----+-------+----------+
|   1 | abc   |        2 |
|   4 | def   |        3 |
|  10 | xyz   |        3 |
+-----+-------+----------+
3 rows in set (0.00 sec)

mysql> describe employee;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| eid    | int          | NO   | PRI | NULL    |       |
| name   | varchar(260) | YES  |     | NULL    |       |
| age    | int          | YES  |     | NULL    |       |
| salery | int          | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> describe project;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| pid      | int          | NO   | PRI | NULL    |       |
| pname    | varchar(260) | YES  |     | NULL    |       |
| incharge | int          | NO   | MUL | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
mysql> ALTER TABLE employee
    -> ADD CONSTRAINT c1 CHECK (age>=18);
Query OK, 3 rows affected (0.25 sec)
Records: 3  Duplicates: 0  Warnings: 0

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

mysql> insert into employee
    -> (eid,name,salery)
    -> values (4,'ash',32198);
Query OK, 1 row affected (0.03 sec)

mysql> select * from employee;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   1 | hey   |   18 |  20000 |
|   2 | hello |   18 |  22000 |
|   3 | done  |   20 |  24000 |
|   4 | ash   | NULL |  32198 |
+-----+-------+------+--------+
4 rows in set (0.00 sec)
mysql> insert into employee
    -> (eid,name,age,salery)
    -> values(5,'gds',19,7328);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee;
+-----+-------+------+--------+
| eid | name  | age  | salery |
+-----+-------+------+--------+
|   1 | hey   |   18 |  20000 |
|   2 | hello |   18 |  22000 |
|   3 | done  |   20 |  24000 |
|   4 | ash   | NULL |  32198 |
|   5 | gds   |   19 |   7328 |
+-----+-------+------+--------+
5 rows in set (0.00 sec)

mysql> insert into employee
    -> (eid,name,age,salery)
    -> values(6,
    -> 'eih',10,892);
ERROR 3819 (HY000): Check constraint 'c1' is violated.
mysql> ALTER TABLE employee
    -> DROP CHECK c1;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into employee
    -> (eid,name,age,salery)
    -> values(6,'eih',10,892);
Query OK, 1 row affected (0.01 sec)

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
+-----+-------+------+--------+
6 rows in set (0.00 sec)