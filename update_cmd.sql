Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
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
| employee      |
| project       |
| team          |
+---------------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE book(
    -> bid int PRIMARY KEY,
    -> bname varchar(280),
    -> price float(7,2),
    -> publisher varchar(280)
    -> );
Query OK, 0 rows affected, 1 warning (0.08 sec)

mysql> describe book;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| bid       | int          | NO   | PRI | NULL    |       |
| bname     | varchar(280) | YES  |     | NULL    |       |
| price     | float(7,2)   | YES  |     | NULL    |       |
| publisher | varchar(280) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into book
    -> values
    -> (1,'java',200,'mhm'),
    -> (2,'php',400,'phn'),
    -> (3,'python',500,'abba')
    -> ;
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from book;
+-----+--------+--------+-----------+
| bid | bname  | price  | publisher |
+-----+--------+--------+-----------+
|   1 | java   | 200.00 | mhm       |
|   2 | php    | 400.00 | phn       |
|   3 | python | 500.00 | abba      |
+-----+--------+--------+-----------+
3 rows in set (0.00 sec)

mysql> insert into book
    -> (bid,bname,price)
    -> values(4,'js',800);
Query OK, 1 row affected (0.01 sec)

mysql> select  * from book;
+-----+--------+--------+-----------+
| bid | bname  | price  | publisher |
+-----+--------+--------+-----------+
|   1 | java   | 200.00 | mhm       |
|   2 | php    | 400.00 | phn       |
|   3 | python | 500.00 | abba      |
|   4 | js     | 800.00 | NULL      |
+-----+--------+--------+-----------+
4 rows in set (0.00 sec)

mysql> UPDATE book
    -> set publisher='tpt'
    -> where bid=3
    -> ;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from book;
+-----+--------+--------+-----------+
| bid | bname  | price  | publisher |
+-----+--------+--------+-----------+
|   1 | java   | 200.00 | mhm       |
|   2 | php    | 400.00 | phn       |
|   3 | python | 500.00 | tpt       |
|   4 | js     | 800.00 | NULL      |
+-----+--------+--------+-----------+
4 rows in set (0.00 sec)

mysql> UPDATE book
    -> set publisher = 'txt'
    -> where publisher is null;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from book;
+-----+--------+--------+-----------+
| bid | bname  | price  | publisher |
+-----+--------+--------+-----------+
|   1 | java   | 200.00 | mhm       |
|   2 | php    | 400.00 | phn       |
|   3 | python | 500.00 | tpt       |
|   4 | js     | 800.00 | txt       |
+-----+--------+--------+-----------+
4 rows in set (0.00 sec)

mysql> UPDATE book
    -> set price = 600
    -> where bname = 'php'
    -> ;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from book;
+-----+--------+--------+-----------+
| bid | bname  | price  | publisher |
+-----+--------+--------+-----------+
|   1 | java   | 200.00 | mhm       |
|   2 | php    | 600.00 | phn       |
|   3 | python | 500.00 | tpt       |
|   4 | js     | 800.00 | txt       |
+-----+--------+--------+-----------+
4 rows in set (0.00 sec)