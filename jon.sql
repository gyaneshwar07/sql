Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ***************
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
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

mysql> select * from batch
    -> INNER JOIN course
    -> on batch.cid = course.cid ;
+-----+------+------------+----------+------+------+-----+--------+--------------------+
| bid | cid  | startdate  | time     | day  | size | cid | c_name | duration_in_months |
+-----+------+------------+----------+------+------+-----+--------+--------------------+
|   1 |    1 | 2023-05-10 | 09:00:00 | mwf  |  100 |   1 | c      |                  3 |
|   2 |    2 | 2023-10-01 | 10:00:00 | tts  |  200 |   2 | java   |                  4 |
|   3 |    1 | 2024-01-20 | 11:00:00 | mwf  |  300 |   1 | c      |                  3 |
|   4 |    3 | 2024-02-20 | 12:00:00 | mwf  |  200 |   3 | python |                  3 |
+-----+------+------------+----------+------+------+-----+--------+--------------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM COURSE
    -> INNER JOIN BATCH
    -> WHERE COURSE.CID=BATCH.CID;
+-----+--------+--------------------+-----+------+------------+----------+------+------+
| cid | c_name | duration_in_months | bid | cid  | startdate  | time     | day  | size |
+-----+--------+--------------------+-----+------+------------+----------+------+------+
|   1 | c      |                  3 |   1 |    1 | 2023-05-10 | 09:00:00 | mwf  |  100 |
|   2 | java   |                  4 |   2 |    2 | 2023-10-01 | 10:00:00 | tts  |  200 |
|   1 | c      |                  3 |   3 |    1 | 2024-01-20 | 11:00:00 | mwf  |  300 |
|   3 | python |                  3 |   4 |    3 | 2024-02-20 | 12:00:00 | mwf  |  200 |
+-----+--------+--------------------+-----+------+------------+----------+------+------+
4 rows in set (0.00 sec)

mysql> SELECT * from batch
    -> LEFT JOIN COURSE
    -> ON COURSE.ID=BATCH.ID;
ERROR 1054 (42S22): Unknown column 'COURSE.ID' in 'on clause'
mysql> SELECT * from batch
    -> INNER JOIN course
    -> ON COURSE.CID=BATCH.CID;
+-----+------+------------+----------+------+------+-----+--------+--------------------+
| bid | cid  | startdate  | time     | day  | size | cid | c_name | duration_in_months |
+-----+------+------------+----------+------+------+-----+--------+--------------------+
|   1 |    1 | 2023-05-10 | 09:00:00 | mwf  |  100 |   1 | c      |                  3 |
|   2 |    2 | 2023-10-01 | 10:00:00 | tts  |  200 |   2 | java   |                  4 |
|   3 |    1 | 2024-01-20 | 11:00:00 | mwf  |  300 |   1 | c      |                  3 |
|   4 |    3 | 2024-02-20 | 12:00:00 | mwf  |  200 |   3 | python |                  3 |
+-----+------+------------+----------+------+------+-----+--------+--------------------+
4 rows in set (0.00 sec)

mysql> SELECT * from COURSE
    -> LEFT JOIN BATCH
    -> ON COURSE.CID=BATCH.CID;
+-----+--------+--------------------+------+------+------------+----------+------+------+
| cid | c_name | duration_in_months | bid  | cid  | startdate  | time     | day  | size |
+-----+--------+--------------------+------+------+------------+----------+------+------+
|   1 | c      |                  3 |    3 |    1 | 2024-01-20 | 11:00:00 | mwf  |  300 |
|   1 | c      |                  3 |    1 |    1 | 2023-05-10 | 09:00:00 | mwf  |  100 |
|   2 | java   |                  4 |    2 |    2 | 2023-10-01 | 10:00:00 | tts  |  200 |
|   3 | python |                  3 |    4 |    3 | 2024-02-20 | 12:00:00 | mwf  |  200 |
|   4 | php    |                  3 | NULL | NULL | NULL       | NULL     | NULL | NULL |
|   5 | html   |                  4 | NULL | NULL | NULL       | NULL     | NULL | NULL |
+-----+--------+--------------------+------+------+------------+----------+------+------+
6 rows in set (0.00 sec)

mysql> SELECT * from COURSE
    -> LEFT JOIN COURSE
    -> ON COURSE.CID=BATCH.CID;
ERROR 1066 (42000): Not unique table/alias: 'COURSE'
mysql> SELECT * from BATCH
    -> LEFT JOIN COURSE
    -> ON COURSE.CID=BATCH.CID;
+-----+------+------------+----------+------+------+------+--------+--------------------+
| bid | cid  | startdate  | time     | day  | size | cid  | c_name | duration_in_months |
+-----+------+------------+----------+------+------+------+--------+--------------------+
|   1 |    1 | 2023-05-10 | 09:00:00 | mwf  |  100 |    1 | c      |                  3 |
|   2 |    2 | 2023-10-01 | 10:00:00 | tts  |  200 |    2 | java   |                  4 |
|   3 |    1 | 2024-01-20 | 11:00:00 | mwf  |  300 |    1 | c      |                  3 |
|   4 |    3 | 2024-02-20 | 12:00:00 | mwf  |  200 |    3 | python |                  3 |
+-----+------+------------+----------+------+------+------+--------+--------------------+
4 rows in set (0.00 sec)

mysql> SELECT * from COURSE
    -> RIGHT JOIN BATCH
    -> ON COURSE.CID=BATCH.CID;
+------+--------+--------------------+-----+------+------------+----------+------+------+
| cid  | c_name | duration_in_months | bid | cid  | startdate  | time     | day  | size |
+------+--------+--------------------+-----+------+------------+----------+------+------+
|    1 | c      |                  3 |   1 |    1 | 2023-05-10 | 09:00:00 | mwf  |  100 |
|    2 | java   |                  4 |   2 |    2 | 2023-10-01 | 10:00:00 | tts  |  200 |
|    1 | c      |                  3 |   3 |    1 | 2024-01-20 | 11:00:00 | mwf  |  300 |
|    3 | python |                  3 |   4 |    3 | 2024-02-20 | 12:00:00 | mwf  |  200 |
+------+--------+--------------------+-----+------+------------+----------+------+------+
4 rows in set (0.00 sec)

mysql> SELECT * from BATCH
    -> RIGHT JOIN COURSE
    -> ON COURSE.CID=BATCH.CID;
+------+------+------------+----------+------+------+-----+--------+--------------------+
| bid  | cid  | startdate  | time     | day  | size | cid | c_name | duration_in_months |
+------+------+------------+----------+------+------+-----+--------+--------------------+
|    3 |    1 | 2024-01-20 | 11:00:00 | mwf  |  300 |   1 | c      |                  3 |
|    1 |    1 | 2023-05-10 | 09:00:00 | mwf  |  100 |   1 | c      |                  3 |
|    2 |    2 | 2023-10-01 | 10:00:00 | tts  |  200 |   2 | java   |                  4 |
|    4 |    3 | 2024-02-20 | 12:00:00 | mwf  |  200 |   3 | python |                  3 |
| NULL | NULL | NULL       | NULL     | NULL | NULL |   4 | php    |                  3 |
| NULL | NULL | NULL       | NULL     | NULL | NULL |   5 | html   |                  4 |
+------+------+------------+----------+------+------+-----+--------+--------------------+
6 rows in set (0.00 sec)

mysql> SELECT * from COURSE
    -> RIGHT JOIN BATCH
    -> ON COURSE.CID=BATCH.CID;
+------+--------+--------------------+-----+------+------------+----------+------+------+
| cid  | c_name | duration_in_months | bid | cid  | startdate  | time     | day  | size |
+------+--------+--------------------+-----+------+------------+----------+------+------+
|    1 | c      |                  3 |   1 |    1 | 2023-05-10 | 09:00:00 | mwf  |  100 |
|    2 | java   |                  4 |   2 |    2 | 2023-10-01 | 10:00:00 | tts  |  200 |
|    1 | c      |                  3 |   3 |    1 | 2024-01-20 | 11:00:00 | mwf  |  300 |
|    3 | python |                  3 |   4 |    3 | 2024-02-20 | 12:00:00 | mwf  |  200 |
+------+--------+--------------------+-----+------+------------+----------+------+------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM course t1 , course t2;
+-----+--------+--------------------+-----+--------+--------------------+
| cid | c_name | duration_in_months | cid | c_name | duration_in_months |
+-----+--------+--------------------+-----+--------+--------------------+
|   5 | html   |                  4 |   1 | c      |                  3 |
|   4 | php    |                  3 |   1 | c      |                  3 |
|   3 | python |                  3 |   1 | c      |                  3 |
|   2 | java   |                  4 |   1 | c      |                  3 |
|   1 | c      |                  3 |   1 | c      |                  3 |
|   5 | html   |                  4 |   2 | java   |                  4 |
|   4 | php    |                  3 |   2 | java   |                  4 |
|   3 | python |                  3 |   2 | java   |                  4 |
|   2 | java   |                  4 |   2 | java   |                  4 |
|   1 | c      |                  3 |   2 | java   |                  4 |
|   5 | html   |                  4 |   3 | python |                  3 |
|   4 | php    |                  3 |   3 | python |                  3 |
|   3 | python |                  3 |   3 | python |                  3 |
|   2 | java   |                  4 |   3 | python |                  3 |
|   1 | c      |                  3 |   3 | python |                  3 |
|   5 | html   |                  4 |   4 | php    |                  3 |
|   4 | php    |                  3 |   4 | php    |                  3 |
|   3 | python |                  3 |   4 | php    |                  3 |
|   2 | java   |                  4 |   4 | php    |                  3 |
|   1 | c      |                  3 |   4 | php    |                  3 |
|   5 | html   |                  4 |   5 | html   |                  4 |
|   4 | php    |                  3 |   5 | html   |                  4 |
|   3 | python |                  3 |   5 | html   |                  4 |
|   2 | java   |                  4 |   5 | html   |                  4 |
|   1 | c      |                  3 |   5 | html   |                  4 |
+-----+--------+--------------------+-----+--------+--------------------+
25 rows in set (0.00 sec)

mysql> select * from course t1 , course t2 where t1.cid<t2.cid;
+-----+--------+--------------------+-----+--------+--------------------+
| cid | c_name | duration_in_months | cid | c_name | duration_in_months |
+-----+--------+--------------------+-----+--------+--------------------+
|   1 | c      |                  3 |   2 | java   |                  4 |
|   1 | c      |                  3 |   3 | python |                  3 |
|   1 | c      |                  3 |   4 | php    |                  3 |
|   1 | c      |                  3 |   5 | html   |                  4 |
|   2 | java   |                  4 |   3 | python |                  3 |
|   2 | java   |                  4 |   4 | php    |                  3 |
|   2 | java   |                  4 |   5 | html   |                  4 |
|   3 | python |                  3 |   4 | php    |                  3 |
|   3 | python |                  3 |   5 | html   |                  4 |
|   4 | php    |                  3 |   5 | html   |                  4 |
+-----+--------+--------------------+-----+--------+--------------------+
10 rows in set (0.00 sec)

mysql> select * from course t1 , course t2 where t2.cid<t1.cid;
+-----+--------+--------------------+-----+--------+--------------------+
| cid | c_name | duration_in_months | cid | c_name | duration_in_months |
+-----+--------+--------------------+-----+--------+--------------------+
|   2 | java   |                  4 |   1 | c      |                  3 |
|   3 | python |                  3 |   1 | c      |                  3 |
|   3 | python |                  3 |   2 | java   |                  4 |
|   4 | php    |                  3 |   1 | c      |                  3 |
|   4 | php    |                  3 |   2 | java   |                  4 |
|   4 | php    |                  3 |   3 | python |                  3 |
|   5 | html   |                  4 |   1 | c      |                  3 |
|   5 | html   |                  4 |   2 | java   |                  4 |
|   5 | html   |                  4 |   3 | python |                  3 |
|   5 | html   |                  4 |   4 | php    |                  3 |
+-----+--------+--------------------+-----+--------+--------------------+
10 rows in set (0.00 sec)