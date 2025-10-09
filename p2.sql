Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 26
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
| new                |
| new db             |
| performance_schema |
| sys                |
+--------------------+
9 rows in set (0.18 sec)

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
4 rows in set (0.04 sec)

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
4 rows in set (0.01 sec)

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
5 rows in set (0.01 sec)

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

mysql> select * from student
    -> INNER JOIN
    -> course
    -> ON student.rno = course.cid;
+-----+------+------------+-----------+-----+--------+--------------------+
| rno | name | email      | mobile    | cid | c_name | duration_in_months |
+-----+------+------------+-----------+-----+--------+--------------------+
|   1 | gyan | gyan_gmail | 36756323  |   1 | c      |                  3 |
|   2 | ms   | ms_gmail   | 76132768  |   2 | java   |                  4 |
|   3 | vk   | vk_gmail   | 73287932  |   3 | python |                  3 |
|   4 | dk   | dk_gmail   | 671783212 |   4 | php    |                  3 |
|   5 | mk   | mk_gmail   | 783219328 |   5 | html   |                  4 |
+-----+------+------------+-----------+-----+--------+--------------------+
5 rows in set (0.00 sec)

mysql> select a.rno,a.name,b.c_name from student a INNER JOIN course b on a.rno = b.cid;
+-----+------+--------+
| rno | name | c_name |
+-----+------+--------+
|   1 | gyan | c      |
|   2 | ms   | java   |
|   3 | vk   | python |
|   4 | dk   | php    |
|   5 | mk   | html   |
+-----+------+--------+
5 rows in set (0.00 sec)

mysql> select a.rno,a.name,b.c_name from student a LEFT JOIN course b on a.rno = b.cid;
+-----+------+--------+
| rno | name | c_name |
+-----+------+--------+
|   1 | gyan | c      |
|   2 | ms   | java   |
|   3 | vk   | python |
|   4 | dk   | php    |
|   5 | mk   | html   |
+-----+------+--------+
5 rows in set (0.00 sec)

mysql> use db3;
Database changed
mysql> show tales;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'tales' at line 1
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
4 rows in set (0.01 sec)

mysql> select * from teacher;
+----+------+----------+------+--------+
| id | name | email    | city | course |
+----+------+----------+------+--------+
|  1 | gyan | gy_gmail | bx   | html   |
|  2 | hey  | hey_gmal | cs   | css    |
|  3 | hlo  | hlo_gmal | ds   | dss    |
|  4 | nnn  | nnn_gmal | jv   | js     |
+----+------+----------+------+--------+
4 rows in set (0.01 sec)

mysql> insert into student
    -> values
    -> (5,'cm','cm_gmail','pnb','c++');
Query OK, 1 row affected (0.05 sec)

mysql> insert into student
    -> (name,email,city,course)
    -> values
    -> ('krk','krk_email','dbi','java'),
    -> ('srk','srk_email','mum','ml');
ERROR 1364 (HY000): Field 'id' doesn't have a default value
mysql> insert into student
    -> values
    -> (6,'krk','krk_email','dbi','java'),
    -> (7,'srk','srk_email','mum','ml');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from student;
+----+------+-----------+---------+--------+
| id | name | email     | city    | course |
+----+------+-----------+---------+--------+
|  1 | gy   | gya_gmail | bxr     | java   |
|  2 | h    | hy_gmal   | nda     | dart   |
|  3 | nav  | nav_gmail | patna   | c++    |
|  4 | php  | php_gmail | philips | php    |
|  5 | cm   | cm_gmail  | pnb     | c++    |
|  6 | krk  | krk_email | dbi     | java   |
|  7 | srk  | srk_email | mum     | ml     |
+----+------+-----------+---------+--------+
7 rows in set (0.00 sec)

mysql> select * from student left join teacher on student.id=teacher.id;
+----+------+-----------+---------+--------+------+------+----------+------+--------+
| id | name | email     | city    | course | id   | name | email    | city | course |
+----+------+-----------+---------+--------+------+------+----------+------+--------+
|  1 | gy   | gya_gmail | bxr     | java   |    1 | gyan | gy_gmail | bx   | html   |
|  2 | h    | hy_gmal   | nda     | dart   |    2 | hey  | hey_gmal | cs   | css    |
|  3 | nav  | nav_gmail | patna   | c++    |    3 | hlo  | hlo_gmal | ds   | dss    |
|  4 | php  | php_gmail | philips | php    |    4 | nnn  | nnn_gmal | jv   | js     |
|  5 | cm   | cm_gmail  | pnb     | c++    | NULL | NULL | NULL     | NULL | NULL   |
|  6 | krk  | krk_email | dbi     | java   | NULL | NULL | NULL     | NULL | NULL   |
|  7 | srk  | srk_email | mum     | ml     | NULL | NULL | NULL     | NULL | NULL   |
+----+------+-----------+---------+--------+------+------+----------+------+--------+
7 rows in set (0.00 sec)

mysql> select a.id,a.name,b.name from student a left join teacher b on a.id=b.id;
+----+------+------+
| id | name | name |
+----+------+------+
|  1 | gy   | gyan |
|  2 | h    | hey  |
|  3 | nav  | hlo  |
|  4 | php  | nnn  |
|  5 | cm   | NULL |
|  6 | krk  | NULL |
|  7 | srk  | NULL |
+----+------+------+
7 rows in set (0.00 sec)

mysql> select a.id,a.name,b.name from student a right join teacher b on a.id=b.id;
+------+------+------+
| id   | name | name |
+------+------+------+
|    1 | gy   | gyan |
|    2 | h    | hey  |
|    3 | nav  | hlo  |
|    4 | php  | nnn  |
+------+------+------+
4 rows in set (0.00 sec)

mysql> select a.id,a.name,b.name from student a left join teacher b on a.id=b.id where b.course is null;
+----+------+------+
| id | name | name |
+----+------+------+
|  5 | cm   | NULL |
|  6 | krk  | NULL |
|  7 | srk  | NULL |
+----+------+------+
3 rows in set (0.01 sec)

mysql> select * from student a left join teacher b on a.id=b.id where b.course is null;
+----+------+-----------+------+--------+------+------+-------+------+--------+
| id | name | email     | city | course | id   | name | email | city | course |
+----+------+-----------+------+--------+------+------+-------+------+--------+
|  5 | cm   | cm_gmail  | pnb  | c++    | NULL | NULL | NULL  | NULL | NULL   |
|  6 | krk  | krk_email | dbi  | java   | NULL | NULL | NULL  | NULL | NULL   |
|  7 | srk  | srk_email | mum  | ml     | NULL | NULL | NULL  | NULL | NULL   |
+----+------+-----------+------+--------+------+------+-------+------+--------+
3 rows in set (0.00 sec)

mysql> -- above problem is left anti join
mysql> insert into teacher
    -> (id,name,email,city)
    -> values
    -> (5,'het','het_email','hetty');
Query OK, 1 row affected (0.01 sec)

mysql> select * from teacher;
+----+------+-----------+-------+--------+
| id | name | email     | city  | course |
+----+------+-----------+-------+--------+
|  1 | gyan | gy_gmail  | bx    | html   |
|  2 | hey  | hey_gmal  | cs    | css    |
|  3 | hlo  | hlo_gmal  | ds    | dss    |
|  4 | nnn  | nnn_gmal  | jv    | js     |
|  5 | het  | het_email | hetty | NULL   |
+----+------+-----------+-------+--------+
5 rows in set (0.00 sec)

mysql> select * from student a left join teacher b on a.id=b.id where b.course is null;
+----+------+-----------+------+--------+------+------+-----------+-------+--------+
| id | name | email     | city | course | id   | name | email     | city  | course |
+----+------+-----------+------+--------+------+------+-----------+-------+--------+
|  5 | cm   | cm_gmail  | pnb  | c++    |    5 | het  | het_email | hetty | NULL   |
|  6 | krk  | krk_email | dbi  | java   | NULL | NULL | NULL      | NULL  | NULL   |
|  7 | srk  | srk_email | mum  | ml     | NULL | NULL | NULL      | NULL  | NULL   |
+----+------+-----------+------+--------+------+------+-----------+-------+--------+
3 rows in set (0.00 sec)

mysql> select * from student a left join teacher b on a.id=b.id;
+----+------+-----------+---------+--------+------+------+-----------+-------+--------+
| id | name | email     | city    | course | id   | name | email     | city  | course |
+----+------+-----------+---------+--------+------+------+-----------+-------+--------+
|  1 | gy   | gya_gmail | bxr     | java   |    1 | gyan | gy_gmail  | bx    | html   |
|  2 | h    | hy_gmal   | nda     | dart   |    2 | hey  | hey_gmal  | cs    | css    |
|  3 | nav  | nav_gmail | patna   | c++    |    3 | hlo  | hlo_gmal  | ds    | dss    |
|  4 | php  | php_gmail | philips | php    |    4 | nnn  | nnn_gmal  | jv    | js     |
|  5 | cm   | cm_gmail  | pnb     | c++    |    5 | het  | het_email | hetty | NULL   |
|  6 | krk  | krk_email | dbi     | java   | NULL | NULL | NULL      | NULL  | NULL   |
|  7 | srk  | srk_email | mum     | ml     | NULL | NULL | NULL      | NULL  | NULL   |
+----+------+-----------+---------+--------+------+------+-----------+-------+--------+
7 rows in set (0.00 sec)

mysql> -- FULLOUTER JOIN
mysql> select * from teacher;
+----+------+-----------+-------+--------+
| id | name | email     | city  | course |
+----+------+-----------+-------+--------+
|  1 | gyan | gy_gmail  | bx    | html   |
|  2 | hey  | hey_gmal  | cs    | css    |
|  3 | hlo  | hlo_gmal  | ds    | dss    |
|  4 | nnn  | nnn_gmal  | jv    | js     |
|  5 | het  | het_email | hetty | NULL   |
+----+------+-----------+-------+--------+
5 rows in set (0.00 sec)

mysql> select * from student;
+----+------+-----------+---------+--------+
| id | name | email     | city    | course |
+----+------+-----------+---------+--------+
|  1 | gy   | gya_gmail | bxr     | java   |
|  2 | h    | hy_gmal   | nda     | dart   |
|  3 | nav  | nav_gmail | patna   | c++    |
|  4 | php  | php_gmail | philips | php    |
|  5 | cm   | cm_gmail  | pnb     | c++    |
|  6 | krk  | krk_email | dbi     | java   |
|  7 | srk  | srk_email | mum     | ml     |
+----+------+-----------+---------+--------+
7 rows in set (0.00 sec)

mysql> select * from student FULL OUTER JOIN teacher where student.id=teacher.id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'OUTER JOIN teacher where student.id=teacher.id' at line 1
mysql> select * from student FULL OUTER JOIN teacher on student.id=teacher.id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'OUTER JOIN teacher on student.id=teacher.id' at line 1
mysql> -- does not support full outer join  directly
mysql> select * from student  LEFT JOIN teacher on student.id=teacher.id
    -> union
    -> select * from student right join teacher on student.id=teacher.id;
+------+------+-----------+---------+--------+------+------+-----------+-------+--------+
| id   | name | email     | city    | course | id   | name | email     | city  | course |
+------+------+-----------+---------+--------+------+------+-----------+-------+--------+
|    1 | gy   | gya_gmail | bxr     | java   |    1 | gyan | gy_gmail  | bx    | html   |
|    2 | h    | hy_gmal   | nda     | dart   |    2 | hey  | hey_gmal  | cs    | css    |
|    3 | nav  | nav_gmail | patna   | c++    |    3 | hlo  | hlo_gmal  | ds    | dss    |
|    4 | php  | php_gmail | philips | php    |    4 | nnn  | nnn_gmal  | jv    | js     |
|    5 | cm   | cm_gmail  | pnb     | c++    |    5 | het  | het_email | hetty | NULL   |
|    6 | krk  | krk_email | dbi     | java   | NULL | NULL | NULL      | NULL  | NULL   |
|    7 | srk  | srk_email | mum     | ml     | NULL | NULL | NULL      | NULL  | NULL   |
+------+------+-----------+---------+--------+------+------+-----------+-------+--------+
7 rows in set (0.02 sec)

mysql> select * from student  LEFT JOIN teacher on student.id=teacher.id
    -> union
    -> select * from student right join teacher on student.id=teacher.id where student.id is null;
+------+------+-----------+---------+--------+------+------+-----------+-------+--------+
| id   | name | email     | city    | course | id   | name | email     | city  | course |
+------+------+-----------+---------+--------+------+------+-----------+-------+--------+
|    1 | gy   | gya_gmail | bxr     | java   |    1 | gyan | gy_gmail  | bx    | html   |
|    2 | h    | hy_gmal   | nda     | dart   |    2 | hey  | hey_gmal  | cs    | css    |
|    3 | nav  | nav_gmail | patna   | c++    |    3 | hlo  | hlo_gmal  | ds    | dss    |
|    4 | php  | php_gmail | philips | php    |    4 | nnn  | nnn_gmal  | jv    | js     |
|    5 | cm   | cm_gmail  | pnb     | c++    |    5 | het  | het_email | hetty | NULL   |
|    6 | krk  | krk_email | dbi     | java   | NULL | NULL | NULL      | NULL  | NULL   |
|    7 | srk  | srk_email | mum     | ml     | NULL | NULL | NULL      | NULL  | NULL   |
+------+------+-----------+---------+--------+------+------+-----------+-------+--------+
7 rows in set (0.00 sec)

mysql> select * from student a
    -> LEFT JOIN teacher
    -> on a.id=teacher.id
    -> UNION
    -> select * from student
    -> RIGHT JOIN teacher
    -> on student.id=teacher.id
    -> where student.id is null;
+------+------+-----------+---------+--------+------+------+-----------+-------+--------+
| id   | name | email     | city    | course | id   | name | email     | city  | course |
+------+------+-----------+---------+--------+------+------+-----------+-------+--------+
|    1 | gy   | gya_gmail | bxr     | java   |    1 | gyan | gy_gmail  | bx    | html   |
|    2 | h    | hy_gmal   | nda     | dart   |    2 | hey  | hey_gmal  | cs    | css    |
|    3 | nav  | nav_gmail | patna   | c++    |    3 | hlo  | hlo_gmal  | ds    | dss    |
|    4 | php  | php_gmail | philips | php    |    4 | nnn  | nnn_gmal  | jv    | js     |
|    5 | cm   | cm_gmail  | pnb     | c++    |    5 | het  | het_email | hetty | NULL   |
|    6 | krk  | krk_email | dbi     | java   | NULL | NULL | NULL      | NULL  | NULL   |
|    7 | srk  | srk_email | mum     | ml     | NULL | NULL | NULL      | NULL  | NULL   |
+------+------+-----------+---------+--------+------+------+-----------+-------+--------+
7 rows in set (0.00 sec)

mysql> -- here don't working
mysql> select * from student a
    -> join
    -> student b
    -> on a.id=b.id;
+----+------+-----------+---------+--------+----+------+-----------+---------+--------+
| id | name | email     | city    | course | id | name | email     | city    | course |
+----+------+-----------+---------+--------+----+------+-----------+---------+--------+
|  1 | gy   | gya_gmail | bxr     | java   |  1 | gy   | gya_gmail | bxr     | java   |
|  2 | h    | hy_gmal   | nda     | dart   |  2 | h    | hy_gmal   | nda     | dart   |
|  3 | nav  | nav_gmail | patna   | c++    |  3 | nav  | nav_gmail | patna   | c++    |
|  4 | php  | php_gmail | philips | php    |  4 | php  | php_gmail | philips | php    |
|  5 | cm   | cm_gmail  | pnb     | c++    |  5 | cm   | cm_gmail  | pnb     | c++    |
|  6 | krk  | krk_email | dbi     | java   |  6 | krk  | krk_email | dbi     | java   |
|  7 | srk  | srk_email | mum     | ml     |  7 | srk  | srk_email | mum     | ml     |
+----+------+-----------+---------+--------+----+------+-----------+---------+--------+
7 rows in set (0.00 sec)

mysql> -- upper one is self join
mysql> select * from teacher a
    -> join
    -> teacher b
    -> on a.id=b.id;
+----+------+-----------+-------+--------+----+------+-----------+-------+--------+
| id | name | email     | city  | course | id | name | email     | city  | course |
+----+------+-----------+-------+--------+----+------+-----------+-------+--------+
|  1 | gyan | gy_gmail  | bx    | html   |  1 | gyan | gy_gmail  | bx    | html   |
|  2 | hey  | hey_gmal  | cs    | css    |  2 | hey  | hey_gmal  | cs    | css    |
|  3 | hlo  | hlo_gmal  | ds    | dss    |  3 | hlo  | hlo_gmal  | ds    | dss    |
|  4 | nnn  | nnn_gmal  | jv    | js     |  4 | nnn  | nnn_gmal  | jv    | js     |
|  5 | het  | het_email | hetty | NULL   |  5 | het  | het_email | hetty | NULL   |
+----+------+-----------+