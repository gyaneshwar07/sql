Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
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
| employee      |
| project       |
+---------------+
2 rows in set (0.01 sec)

mysql> CREATE TABLE team(
    -> name varchar(255),
    -> tid int,
    -> pnam varchar(255),
    -> perform varchar(255)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> describe team;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| name    | varchar(255) | YES  |     | NULL    |       |
| tid     | int          | YES  |     | NULL    |       |
| pnam    | varchar(255) | YES  |     | NULL    |       |
| perform | varchar(255) | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into team
    -> (name , tid,pnam,perform)
    -> values ('yeey' , 1 , 'match' , 'good');
Query OK, 1 row affected (0.03 sec)

mysql> insert into team
    -> (name,tid,pnam,perform)
    -> values('gdd' , 2 , 'dis' , 'good');
Query OK, 1 row affected (0.01 sec)

mysql> insert into team
    -> (name , tid , perform)
    -> values ('eiu' , 4 , 'not very well');
Query OK, 1 row affected (0.01 sec)

mysql> select * from team;
+------+------+-------+---------------+
| name | tid  | pnam  | perform       |
+------+------+-------+---------------+
| yeey |    1 | match | good          |
| gdd  |    2 | dis   | good          |
| eiu  |    4 | NULL  | not very well |
+------+------+-------+---------------+
3 rows in set (0.00 sec)

mysql> insert into employee
    -> (name , tid , pnam , perform )
    -> values
    -> ('uef' , 32 , 'nf' , 'well'),
    -> ('udde' , 7 , 'hjefb' , 'good'),
    -> ('kjfne' , 65 , 'kjfr' , 'prety well' );
ERROR 1054 (42S22): Unknown column 'tid' in 'field list'
mysql> insert into team
    -> (name , tid , pnam , perform)
    -> values
    -> ('uf' , 5 , 'jnrf' , 'well'),
    -> ('njew' , 6 , 'jndw' ,'good'),
    -> ('moewf' , 65 , 'kmfe' , 'prety well');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from team;
+-------+------+-------+---------------+
| name  | tid  | pnam  | perform       |
+-------+------+-------+---------------+
| yeey  |    1 | match | good          |
| gdd   |    2 | dis   | good          |
| eiu   |    4 | NULL  | not very well |
| uf    |    5 | jnrf  | well          |
| njew  |    6 | jndw  | good          |
| moewf |   65 | kmfe  | prety well    |
+-------+------+-------+---------------+
6 rows in set (0.00 sec)

mysql> select perfrom , tid from team;
ERROR 1054 (42S22): Unknown column 'perfrom' in 'field list'
mysql> select perform,tid from team;
+---------------+------+
| perform       | tid  |
+---------------+------+
| good          |    1 |
| good          |    2 |
| not very well |    4 |
| well          |    5 |
| good          |    6 |
| prety well    |   65 |
+---------------+------+
6 rows in set (0.00 sec)

mysql> select tid,perform from team;
+------+---------------+
| tid  | perform       |
+------+---------------+
|    1 | good          |
|    2 | good          |
|    4 | not very well |
|    5 | well          |
|    6 | good          |
|   65 | prety well    |
+------+---------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM team WHERE tid=5;
+------+------+------+---------+
| name | tid  | pnam | perform |
+------+------+------+---------+
| uf   |    5 | jnrf | well    |
+------+------+------+---------+
1 row in set (0.00 sec)

mysql> SELECT * FROM team WHERE tid<4;
+------+------+-------+---------+
| name | tid  | pnam  | perform |
+------+------+-------+---------+
| yeey |    1 | match | good    |
| gdd  |    2 | dis   | good    |
+------+------+-------+---------+
2 rows in set (0.00 sec)

mysql> select * from team where tid>65 and tid<5;
Empty set (0.00 sec)

mysql> select * from team where tid>65 or tid<5;
+------+------+-------+---------------+
| name | tid  | pnam  | perform       |
+------+------+-------+---------------+
| yeey |    1 | match | good          |
| gdd  |    2 | dis   | good          |
| eiu  |    4 | NULL  | not very well |
+------+------+-------+---------------+
3 rows in set (0.00 sec)

mysql> select * from team where tid>5 and tid<65;
+------+------+------+---------+
| name | tid  | pnam | perform |
+------+------+------+---------+
| njew |    6 | jndw | good    |
+------+------+------+---------+
1 row in set (0.00 sec)

mysql> select perform from team where tid>2;
+---------------+
| perform       |
+---------------+
| not very well |
| well          |
| good          |
| prety well    |
+---------------+
4 rows in set (0.00 sec)

mysql> select name,perform where tid>2;
ERROR 1054 (42S22): Unknown column 'name' in 'field list'
mysql> select name,perform from team where tid>2;
+-------+---------------+
| name  | perform       |
+-------+---------------+
| eiu   | not very well |
| uf    | well          |
| njew  | good          |
| moewf | prety well    |
+-------+---------------+
4 rows in set (0.00 sec)

mysql> select * from team where tid between 4 and 65;
+-------+------+------+---------------+
| name  | tid  | pnam | perform       |
+-------+------+------+---------------+
| eiu   |    4 | NULL | not very well |
| uf    |    5 | jnrf | well          |
| njew  |    6 | jndw | good          |
| moewf |   65 | kmfe | prety well    |
+-------+------+------+---------------+
4 rows in set (0.00 sec)

mysql> select * from team where tid != 65;
+------+------+-------+---------------+
| name | tid  | pnam  | perform       |
+------+------+-------+---------------+
| yeey |    1 | match | good          |
| gdd  |    2 | dis   | good          |
| eiu  |    4 | NULL  | not very well |
| uf   |    5 | jnrf  | well          |
| njew |    6 | jndw  | good          |
+------+------+-------+---------------+
5 rows in set (0.00 sec)

mysql> select name from team where LIKE 'u%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'LIKE 'u%'' at line 1
mysql> select tid from team where name like 'u%';
+------+
| tid  |
+------+
|    5 |
+------+
1 row in set (0.01 sec)

mysql> select * from team where perform like 'g%';
+------+------+-------+---------+
| name | tid  | pnam  | perform |
+------+------+-------+---------+
| yeey |    1 | match | good    |
| gdd  |    2 | dis   | good    |
| njew |    6 | jndw  | good    |
+------+------+-------+---------+
3 rows in set (0.00 sec)