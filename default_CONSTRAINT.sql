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

mysql> ALTER TABLE employee
    -> ALTER salery SET DEFAULT 10000;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into employee
    -> (eid,name,age)
    -> values(7,'hud',10);
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
|   7 | hud   |   10 |  10000 |
+-----+-------+------+--------+
7 rows in set (0.00 sec)

mysql> ALTER TABLE employee
    -> ALTER salery DROP DEFAULT;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into employee
    -> (eid,name,age)
    -> values(8,'uh',28);
ERROR 1364 (HY000): Field 'salery' doesn't have a default value
mysql> ALTER TABLE employee
    -> ALTER salery SET DEFAULT NULL;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into employee
    -> (eid,name,age)
    -> values(8,'uh',28);
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
|   7 | hud   |   10 |  10000 |
|   8 | uh    |   28 |   NULL |
+-----+-------+------+--------+
8 rows in set (0.00 sec)
