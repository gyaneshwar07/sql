Microsoft Windows [Version 10.0.26100.6584]
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
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

mysql> use db1;
Database changed
mysql> status;
--------------
mysql  Ver 8.0.43 for Win64 on x86_64 (MySQL Community Server - GPL)

Connection id:          17
Current database:       db1
Current user:           root@localhost
SSL:                    Cipher in use is TLS_AES_256_GCM_SHA384
Using delimiter:        ;
Server version:         8.0.43 MySQL Community Server - GPL
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    cp850
Conn.  characterset:    cp850
TCP port:               3306
Binary data as:         Hexadecimal
Uptime:                 3 days 13 hours 27 min 48 sec

Threads: 2  Questions: 371  Slow queries: 0  Opens: 262  Flush tables: 3  Open tables: 176  Queries per second avg: 0.001
--------------

mysql> show tables;
+---------------+
| Tables_in_db1 |
+---------------+
| t1            |
| t2            |
+---------------+
2 rows in set (0.03 sec)

mysql> select * from t2;
Empty set (0.02 sec)

mysql> insert into t2
    -> (id , name , ps)
    -> values(1,'hey',100);
Query OK, 1 row affected (0.02 sec)

mysql> insert into t2
    -> (id,name,ps)
    -> values(2,'etdf',200);
Query OK, 1 row affected (0.01 sec)

mysql> select * from t2;
+----+------+-----+
| id | name | ps  |
+----+------+-----+
|  1 | hey  | 100 |
|  2 | etdf | 200 |
+----+------+-----+
2 rows in set (0.00 sec)

mysql> describe t2;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | NO   | PRI | NULL    |       |
| name  | varchar(255) | YES  |     | NULL    |       |
| ps    | int          | NO   |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE t1
    -> ADD PRIMARY KEY (eid);
Query OK, 0 rows affected (0.24 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from t1;
+-----+------+--------+------+
| eid | name | salery | age  |
+-----+------+--------+------+
|   1 | gyan |  20000 |   22 |
+-----+------+--------+------+
1 row in set (0.00 sec)

mysql> describe t1;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| eid    | int          | NO   | PRI | NULL    |       |
| name   | varchar(255) | YES  |     | NULL    |       |
| salery | float        | YES  |     | NULL    |       |
| age    | int          | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into t1
    -> (eid , name , age)
    -> values (2,'gde',18);
Query OK, 1 row affected (0.01 sec)

mysql> insert into t1
    -> (eid , name , salery , age)
    -> values (3,'hewdv',20000,20);
Query OK, 1 row affected (0.01 sec)

mysql> select * from t1;
+-----+-------+--------+------+
| eid | name  | salery | age  |
+-----+-------+--------+------+
|   1 | gyan  |  20000 |   22 |
|   2 | gde   |   NULL |   18 |
|   3 | hewdv |  20000 |   20 |
+-----+-------+--------+------+
3 rows in set (0.00 sec)

mysql> describe t1;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| eid    | int          | NO   | PRI | NULL    |       |
| name   | varchar(255) | YES  |     | NULL    |       |
| salery | float        | YES  |     | NULL    |       |
| age    | int          | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe t2;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | NO   | PRI | NULL    |       |
| name  | varchar(255) | YES  |     | NULL    |       |
| ps    | int          | NO   |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE t1
    -> DROP PRIMARY KEY;
Query OK, 3 rows affected (0.19 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE T2
    -> DROP PRIMARY KEY;
Query OK, 2 rows affected (0.15 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> DESCRIBE t1;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| eid    | int          | NO   |     | NULL    |       |
| name   | varchar(255) | YES  |     | NULL    |       |
| salery | float        | YES  |     | NULL    |       |
| age    | int          | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> DESCRIBE t2;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | NO   |     | NULL    |       |
| name  | varchar(255) | YES  |     | NULL    |       |
| ps    | int          | NO   |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)