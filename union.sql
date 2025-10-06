Microsoft Windows [Version 10.0.26100.6725]
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
| db2                |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> create database db3;
Query OK, 1 row affected (0.02 sec)

mysql> use db3;
Database changed
mysql> create table student(
    -> id int primary key,
    -> name varchar(100),
    -> email varchar(100),
    -> city varchar(50),
    -> course varchar(100)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> create table teacher(
    -> id int primary key,
    -> name varchar(100),
    -> email varchar(100),
    -> city varchar(50),
    -> course varchar(100)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> insert into teacher
    -> (id,name,email,city)
    -> values (1 , 'gyan' , 'gy_gmail'  'bx' ,'html );
    '> ;
    '> ggdwg ;
    '> ;
    '> \c
    '> /c
    '> ^C
mysql> insert into teacher
    -> (id,name,email,city)
    -> values (1 , 'gyan' , 'gy_gmail'  'bx' ,);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 3
mysql> insert into teacher
    -> (id,name,email,city,course)
    -> values (1 , 'gyan' , 'gy_gmail'  'bx' , 'html')
    -> (2 , 'hey' , 'hey_gmal'  'cs' , 'css');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(2 , 'hey' , 'hey_gmal'  'cs' , 'css')' at line 4
mysql> insert into teacher
    -> (id,name,email,city,course)
    -> values (1 , 'gyan' , 'gy_gmail'  'bx' , 'html'),
    -> (2 , 'hey' , 'hey_gmal'  'cs' , 'css'),
    -> (3 , 'hlo' , 'hlo_gmal'  'ds' , 'dss'),
    -> (4 , 'nnn' , 'nnn_gmal'  'jv' , 'js');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into teacher
    -> (id,name,email,city,course) values
    -> (1 , 'gyan' , 'gy_gmail'  , 'bx' , 'html'),
    -> (2 , 'hey' , 'hey_gmal'  , 'cs' , 'css'),
    -> (3 , 'hlo' , 'hlo_gmal'  , 'ds' , 'dss'),
    -> (4 , 'nnn' , 'nnn_gmal'  , 'jv' , 'js');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into student
    -> (id,name,email,city,course) values
    -> (1 , 'gy' , 'gya_gmail'  , 'bxr' , 'java'),
    -> (2 , 'h' , 'hy_gmal'  , 'nda' , 'dart'),
    -> (3 , 'nav' , 'nav_gmail'  , 'patna' , 'c++'),
    -> (4 , 'php' , 'php_gmail'  , 'philips' , 'php');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from student;
+----+------+-----------+---------+--------+
| id | name | email     | city    | course |
+----+------+-----------+---------+--------+
|  1 | gy   | gya_gmail | bxr     | java   |
|  2 | h    | hy_gmal   | nda     | dart   |
|  3 | nav  | nav_gmail | patna   | c++    |
|  4 | php  | php_gmail | philips | php    |
+----+------+-----------+---------+--------+
4 rows in set (0.00 sec)

mysql> select * from teacher:
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ':' at line 1
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

mysql> select name,city from teacher;
+------+------+
| name | city |
+------+------+
| gyan | bx   |
| hey  | cs   |
| hlo  | ds   |
| nnn  | jv   |
+------+------+
4 rows in set (0.00 sec)

mysql> select name,city from student;
+------+---------+
| name | city    |
+------+---------+
| gy   | bxr     |
| h    | nda     |
| nav  | patna   |
| php  | philips |
+------+---------+
4 rows in set (0.00 sec)

mysql> select name,city from teacher
    -> UNION
    -> select name,city from student;
+------+---------+
| name | city    |
+------+---------+
| gyan | bx      |
| hey  | cs      |
| hlo  | ds      |
| nnn  | jv      |
| gy   | bxr     |
| h    | nda     |
| nav  | patna   |
| php  | philips |
+------+---------+
8 rows in set (0.01 sec)

mysql> select city from student
    -> UNION
    -> select city from teacher
    -> ;
+---------+
| city    |
+---------+
| bxr     |
| nda     |
| patna   |
| philips |
| bx      |
| cs      |
| ds      |
| jv      |
+---------+
8 rows in set (0.00 sec)

mysql> select city from teacher where course = 'html'
    -> union
    -> select city from student where course = 'java'
    -> ;
+------+
| city |
+------+
| bx   |
| bxr  |
+------+
2 rows in set (0.00 sec)