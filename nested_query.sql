Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
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
6 rows in set (0.01 sec)

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
| student_batch |
+---------------+
5 rows in set (0.01 sec)

mysql> select * from batch;
+-----+------+------------+----------+------+------+
| bid | cid  | startdate  | time     | day  | size |
+-----+------+------------+----------+------+------+
|   1 |    1 | 2023-05-10 | 09:00:00 | mwf  |  100 |
|   2 |    2 | 2023-10-01 | 10:00:00 | tts  |  200 |
|   3 |    1 | 2024-01-20 | 11:00:00 | mwf  |  300 |
|   4 |    3 | 2024-02-20 | 12:00:00 | mwf  |  200 |
+-----+------+------------+----------+------+------+
4 rows in set (0.01 sec)

mysql> select * from course;
+-----+--------+--------------------+
| cid | c_name | duration_in_months |
+-----+--------+--------------------+
|   1 | c      |                  3 |
|   2 | java   |                  4 |
|   3 | python |                  3 |
|   4 | php    |                  3 |
|   5 | html   |                  4 |
+-----+--------+--------------------+
5 rows in set (0.01 sec)

mysql> select * from st_batch;
Empty set (0.01 sec)

mysql> select * from student;
+-----+------+------------+-----------+
| rno | name | email      | mobile    |
+-----+------+------------+-----------+
|   1 | gyan | gyan_gmail | 36756323  |
|   2 | ms   | ms_gmail   | 76132768  |
|   3 | vk   | vk_gmail   | 73287932  |
|   4 | dk   | dk_gmail   | 671783212 |
|   5 | mk   | mk_gmail   | 783219328 |
+-----+------+------------+-----------+
5 rows in set (0.00 sec)

mysql> select * from student_batch;
+------+------+------------+
| rno  | bid  | joindate   |
+------+------+------------+
|    1 |    1 | 2023-05-10 |
+------+------+------------+
1 row in set (0.00 sec)

mysql> describe st_batch;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| id       | int  | NO   | PRI | NULL    |       |
| rno      | int  | YES  | MUL | NULL    |       |
| bid      | int  | YES  | MUL | NULL    |       |
| joindate | date | YES  |     | NULL    |       |
+----------+------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> dropl student_batch;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'dropl student_batch' at line 1
mysql> drop student_batch;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'student_batch' at line 1
mysql> drop table student_batch;
Query OK, 0 rows affected (0.07 sec)

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

mysql> insert into st_batch values
    -> (1,1,1, '2023-05-10' ),
    -> (2,2,1, '2023-05-10' ),
    -> (3,3,1, '2023-05-10' ),
    -> (4,1,2, '2024-01-21' ),
    -> (5,2,3, '2024-01-21' )
    -> ;
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from st_batch;
+----+------+------+------------+
| id | rno  | bid  | joindate   |
+----+------+------+------------+
|  1 |    1 |    1 | 2023-05-10 |
|  2 |    2 |    1 | 2023-05-10 |
|  3 |    3 |    1 | 2023-05-10 |
|  4 |    1 |    2 | 2024-01-21 |
|  5 |    2 |    3 | 2024-01-21 |
+----+------+------+------------+
5 rows in set (0.00 sec)

mysql> select name,email from student;
+------+------------+
| name | email      |
+------+------------+
| gyan | gyan_gmail |
| ms   | ms_gmail   |
| vk   | vk_gmail   |
| dk   | dk_gmail   |
| mk   | mk_gmail   |
+------+------------+
5 rows in set (0.01 sec)

mysql> select name,email from student
    -> where rno;
+------+------------+
| name | email      |
+------+------------+
| gyan | gyan_gmail |
| ms   | ms_gmail   |
| vk   | vk_gmail   |
| dk   | dk_gmail   |
| mk   | mk_gmail   |
+------+------------+
5 rows in set (0.01 sec)

mysql> select * from student;
+-----+------+------------+-----------+
| rno | name | email      | mobile    |
+-----+------+------------+-----------+
|   1 | gyan | gyan_gmail | 36756323  |
|   2 | ms   | ms_gmail   | 76132768  |
|   3 | vk   | vk_gmail   | 73287932  |
|   4 | dk   | dk_gmail   | 671783212 |
|   5 | mk   | mk_gmail   | 783219328 |
+-----+------+------------+-----------+
5 rows in set (0.00 sec)

mysql> select * from batch;
+-----+------+------------+----------+------+------+
| bid | cid  | startdate  | time     | day  | size |
+-----+------+------------+----------+------+------+
|   1 |    1 | 2023-05-10 | 09:00:00 | mwf  |  100 |
|   2 |    2 | 2023-10-01 | 10:00:00 | tts  |  200 |
|   3 |    1 | 2024-01-20 | 11:00:00 | mwf  |  300 |
|   4 |    3 | 2024-02-20 | 12:00:00 | mwf  |  200 |
+-----+------+------------+----------+------+------+
4 rows in set (0.00 sec)

mysql> select * from course;
+-----+--------+--------------------+
| cid | c_name | duration_in_months |
+-----+--------+--------------------+
|   1 | c      |                  3 |
|   2 | java   |                  4 |
|   3 | python |                  3 |
|   4 | php    |                  3 |
|   5 | html   |                  4 |
+-----+--------+--------------------+
5 rows in set (0.00 sec)

mysql> select * from st_batch;
+----+------+------+------------+
| id | rno  | bid  | joindate   |
+----+------+------+------------+
|  1 |    1 |    1 | 2023-05-10 |
|  2 |    2 |    1 | 2023-05-10 |
|  3 |    3 |    1 | 2023-05-10 |
|  4 |    1 |    2 | 2024-01-21 |
|  5 |    2 |    3 | 2024-01-21 |
+----+------+------+------------+
5 rows in set (0.00 sec)

mysql> select name,email from student
    -> where rno IN
    -> (
    -> SELECT rno from st_batch WHERE bid=1)
    -> ;
+------+------------+
| name | email      |
+------+------------+
| gyan | gyan_gmail |
| ms   | ms_gmail   |
| vk   | vk_gmail   |
+------+------------+
3 rows in set (0.01 sec)

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

mysql> ALTER TABLE employee ADD depart varchar(255);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update employee
    -> set depart = 'ds'
    -> where age>18
    -> ;
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> update employee
    -> set depart = 'cse'
    -> where age=18
    -> ;
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> update employee
    -> set depart = 'it'
    -> where age=10 ;
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> update employee
    -> set depart='ece'
    -> where age is null ;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

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

mysql> select * from employee e1
    -> where salery >
    -> (
    -> SELECT AVG (salery)
    -> FROM Employee e2
    -> WHERE e1.depart = e2.depart
    -> );
+-----+-------+------+--------+--------+
| eid | name  | age  | salery | depart |
+-----+-------+------+--------+--------+
|   2 | hello |   18 |  22000 | cse    |
|   3 | done  |   20 |  24000 | ds     |
|   7 | hud   |   10 |  10000 | it     |
+-----+-------+------+--------+--------+
3 rows in set (0.02 sec)