Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: *************
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 25
Server version: 8.0.43 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| db1                |
| db2                |
| db3                |
| information_schema |
| mysql              |
| new                |
| performance_schema |
| sys                |
+--------------------+
8 rows in set (0.08 sec)

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
4 rows in set (0.03 sec)

mysql> use db2;
Database changed
mysql> show tables;
+---------------+
| Tables_in_db2 |
+---------------+
| batch         |
| course        |
| st_batch      |
| student       |
+---------------+
4 rows in set (0.00 sec)

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

mysql> select * from student;
+----+------+-----------+---------+--------+
| id | name | email     | city    | course |
+----+------+-----------+---------+--------+
|  1 | gy   | gya_gmail | bxr     | java   |
|  2 | h    | hy_gmal   | nda     | dart   |
|  3 | nav  | nav_gmail | patna   | c++    |
|  4 | php  | php_gmail | philips | php    |
+----+------+-----------+---------+--------+
4 rows in set (0.02 sec)

mysql> select name,email where id=2;
ERROR 1054 (42S22): Unknown column 'name' in 'field list'
mysql> select name,email from student where id = 2;
+------+---------+
| name | email   |
+------+---------+
| h    | hy_gmal |
+------+---------+
1 row in set (0.01 sec)

mysql> select * from teacher;
+----+------+----------+------+--------+
| id | name | email    | city | course |
+----+------+----------+------+--------+
|  1 | gyan | gy_gmail | bx   | html   |
|  2 | hey  | hey_gmal | cs   | css    |
|  3 | hlo  | hlo_gmal | ds   | dss    |
|  4 | nnn  | nnn_gmal | jv   | js     |
+----+------+----------+------+--------+
4 rows in set (0.00 sec)

mysql> use db1;
Database changed
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
8 rows in set (0.01 sec)

mysql> select name,age where depart = 'it' and eid = 7 ;
ERROR 1054 (42S22): Unknown column 'name' in 'field list'
mysql> select name,age from employee where depart = 'it' and eid = 7 ;
+------+------+
| name | age  |
+------+------+
| hud  |   10 |
+------+------+
1 row in set (0.00 sec)

mysql> select name,age from employee where depart = 'ds' and age>10 and eid = 3;
+------+------+
| name | age  |
+------+------+
| done |   20 |
+------+------+
1 row in set (0.00 sec)

mysql> select name from employee where age>20;
+------+
| name |
+------+
| uh   |
+------+
1 row in set (0.00 sec)

mysql> select name from employee where not age>20;
+-------+
| name  |
+-------+
| hey   |
| hello |
| done  |
| ash   |
| gds   |
| eih   |
| hud   |
+-------+
7 rows in set (0.00 sec)

mysql> select name,eid from employee where age between 18 and 20;
+-------+-----+
| name  | eid |
+-------+-----+
| hey   |   1 |
| hello |   2 |
| done  |   3 |
| gds   |   5 |
+-------+-----+
4 rows in set (0.01 sec)

mysql> select name,eid,age from employee where age between 18 and 20;
+-------+-----+------+
| name  | eid | age  |
+-------+-----+------+
| hey   |   1 |   18 |
| hello |   2 |   18 |
| done  |   3 |   20 |
| gds   |   5 |   19 |
+-------+-----+------+
4 rows in set (0.00 sec)

mysql> select * from information_schema.columns
    -> where table_name = 'employee';
+---------------+--------------+------------+-------------+------------------+----------------+-------------+-----------+--------------------------+------------------------+-------------------+---------------+--------------------+--------------------+--------------------+--------------+------------+-------+---------------------------------+----------------+-----------------------+--------+
| TABLE_CATALOG | TABLE_SCHEMA | TABLE_NAME | COLUMN_NAME | ORDINAL_POSITION | COLUMN_DEFAULT | IS_NULLABLE | DATA_TYPE | CHARACTER_MAXIMUM_LENGTH | CHARACTER_OCTET_LENGTH | NUMERIC_PRECISION | NUMERIC_SCALE | DATETIME_PRECISION | CHARACTER_SET_NAME | COLLATION_NAME     | COLUMN_TYPE  | COLUMN_KEY | EXTRA | PRIVILEGES                      | COLUMN_COMMENT | GENERATION_EXPRESSION | SRS_ID |
+---------------+--------------+------------+-------------+------------------+----------------+-------------+-----------+--------------------------+------------------------+-------------------+---------------+--------------------+--------------------+--------------------+--------------+------------+-------+---------------------------------+----------------+-----------------------+--------+
| def           | db1          | employee   | age         |                3 | NULL           | YES         | int       |                     NULL |                   NULL |                10 |             0 |               NULL | NULL               | NULL               | int          |            |       | select,insert,update,references |                |                       |   NULL |
| def           | db1          | employee   | depart      |                5 | NULL           | YES         | varchar   |                      255 |                   1020 |              NULL |          NULL |               NULL | utf8mb4            | utf8mb4_0900_ai_ci | varchar(255) |            |       | select,insert,update,references |                |                       |   NULL |
| def           | db1          | employee   | eid         |                1 | NULL           | NO          | int       |                     NULL |                   NULL |                10 |             0 |               NULL | NULL               | NULL               | int          | PRI        |       | select,insert,update,references |                |                       |   NULL |
| def           | db1          | employee   | name        |                2 | NULL           | YES         | varchar   |                      260 |                   1040 |              NULL |          NULL |               NULL | utf8mb4            | utf8mb4_0900_ai_ci | varchar(260) |            |       | select,insert,update,references |                |                       |   NULL |
| def           | db1          | employee   | salery      |                4 | NULL           | YES         | int       |                     NULL |                   NULL |                10 |             0 |               NULL | NULL               | NULL               | int          |            |       | select,insert,update,references |                |                       |   NULL |
+---------------+--------------+------------+-------------+------------------+----------------+-------------+-----------+--------------------------+------------------------+-------------------+---------------+--------------------+--------------------+--------------------+--------------+------------+-------+---------------------------------+----------------+-----------------------+--------+
5 rows in set (0.04 sec)
       select * from employee;
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

mysql> update employee
    -> set name = 'gyan'
    -> where age = 10
    -> ;
Query OK, 3 rows affected (0.05 sec)
Rows matched: 3  Changed: 3  Warnings: 0

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
8 rows in set (0.00 sec)

mysql> select top 3 * from employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '3 * from employee' at line 1
mysql> select top 3* from employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '3* from employee' at line 1
mysql> select * from employee limit 3;
+-----+-------+------+--------+--------+
| eid | name  | age  | salery | depart |
+-----+-------+------+--------+--------+
|   1 | hey   |   18 |  20000 | cse    |
|   2 | hello |   18 |  22000 | cse    |
|   3 | done  |   20 |  24000 | ds     |
+-----+-------+------+--------+--------+
3 rows in set (0.00 sec)

mysql> select name,age from employee limit 4;
+-------+------+
| name  | age  |
+-------+------+
| hey   |   18 |
| hello |   18 |
| done  |   20 |
| gyan  |   10 |
+-------+------+
4 rows in set (0.00 sec)

mysql> create database [new db];
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '[new db]' at line 1
mysql> create database 'new db' ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''new db'' at line 1
mysql> create database `new db` ;
Query OK, 1 row affected (0.03 sec)

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
| performance_schema |
| sys                |
+--------------------+
9 rows in set (0.00 sec)

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
8 rows in set (0.00 sec)

mysql> ;
ERROR:
No query specified

mysql> -- maxm salery fro each age
mysql> select age,maxm(salery) as maxm_sal from employee group by age;
ERROR 1305 (42000): FUNCTION db1.maxm does not exist
mysql> use db1;
Database changed
mysql> select age,max(salery) as maxm_sal from employee group by age;
+------+----------+
| age  | maxm_sal |
+------+----------+
|   18 |    22000 |
|   20 |    24000 |
|   10 |    32198 |
|   19 |     7328 |
|   28 |     NULL |
+------+----------+
5 rows in set (0.01 sec)