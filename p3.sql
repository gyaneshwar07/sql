
Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 27
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
4 rows in set (0.04 sec)

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
5 rows in set (0.02 sec)

mysql> select * from student where name like '_y%';
+-----+------+------------+----------+
| rno | name | email      | mobile   |
+-----+------+------------+----------+
|   1 | gyan | gyan_gmail | 36756323 |
+-----+------+------------+----------+
1 row in set (0.00 sec)

mysql> select * from student where name like '[aeiou]%';
Empty set (0.00 sec)

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

mysql> use `new db`;
Database changed
mysql> show tables;l
Empty set (0.00 sec)

    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'l' at line 1
mysql> show tables;
Empty set (0.00 sec)

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
6 rows in set (0.02 sec)

mysql> select * from team where perform like '[gp]%';
Empty set (0.00 sec)

mysql> select * from team where perform like 'g%';
+------+------+-------+---------+
| name | tid  | pnam  | perform |
+------+------+-------+---------+
| yeey |    1 | match | good    |
| gdd  |    2 | dis   | good    |
| njew |    6 | jndw  | good    |
+------+------+-------+---------+
3 rows in set (0.00 sec)

mysql> select * from team where perform regexp '[gp]%';
Empty set (0.05 sec)

mysql> select * from team where name regexp '[aeiou]%';
Empty set (0.00 sec)

mysql> select * from team where name regexp '[aeiou]';
+-------+------+-------+---------------+
| name  | tid  | pnam  | perform       |
+-------+------+-------+---------------+
| yeey  |    1 | match | good          |
| eiu   |    4 | NULL  | not very well |
| uf    |    5 | jnrf  | well          |
| njew  |    6 | jndw  | good          |
| moewf |   65 | kmfe  | prety well    |
+-------+------+-------+---------------+
5 rows in set (0.00 sec)

mysql> select * from team where name REGEXP '^[^aeiou]';
+-------+------+-------+------------+
| name  | tid  | pnam  | perform    |
+-------+------+-------+------------+
| yeey  |    1 | match | good       |
| gdd   |    2 | dis   | good       |
| njew  |    6 | jndw  | good       |
| moewf |   65 | kmfe  | prety well |
+-------+------+-------+------------+
4 rows in set (0.00 sec)

mysql> select * from team where name REGEXP '[aeiou]';
+-------+------+-------+---------------+
| name  | tid  | pnam  | perform       |
+-------+------+-------+---------------+
| yeey  |    1 | match | good          |
| eiu   |    4 | NULL  | not very well |
| uf    |    5 | jnrf  | well          |
| njew  |    6 | jndw  | good          |
| moewf |   65 | kmfe  | prety well    |
+-------+------+-------+---------------+
5 rows in set (0.00 sec)

mysql> select * from team where name REGEXP '^[aeiou]';
+------+------+------+---------------+
| name | tid  | pnam | perform       |
+------+------+------+---------------+
| eiu  |    4 | NULL | not very well |
| uf   |    5 | jnrf | well          |
+------+------+------+---------------+
2 rows in set (0.00 sec)

mysql>
mysql> -- Create the Products table
mysql> CREATE TABLE Products (
    ->     ProductID INT PRIMARY KEY,
    ->     ProductName VARCHAR(50),
    ->     Category VARCHAR(20),
    ->     Price DECIMAL(10, 2),
    ->     StockQuantity INT,
    ->     Supplier VARCHAR(50),
    ->     Rating DECIMAL(3, 1)
    -> );
Query OK, 0 rows affected (0.21 sec)

mysql>
mysql> -- Insert data into the Products table
mysql> INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity, Supplier, Rating) VALUES
    -> (1, 'Wireless Mouse', 'Electronics', 25.99, 150, 'Tech Supplies', 4.5),
    -> (2, 'Office Chair', 'Furniture', 120.00, 85, 'Comfort Co', 4.7),
    -> (3, 'Water Bottle', 'Accessories', 15.00, 250, 'AquaGear', 4.3),
    -> (4, 'Laptop Backpack', 'Accessories', 45.99, 200, 'GearUp', 4.6),
    -> (5, 'Gaming Laptop', 'Electronics', 999.99, 45, 'Tech Supplies', 4.8),
    -> (6, 'Desk Lamp', 'Furniture', 35.00, 120, 'LightHouse', 4.2),
    -> (7, 'Bluetooth Speaker', 'Electronics', 59.99, 95, 'SoundWave', 4.4),
    -> (8, 'Standing Desk', 'Furniture', 250.00, 50, 'Comfort Co', 4.9),
    -> (9, 'Fitness Tracker', 'Electronics', 129.99, 180, 'FitTech', 4.7),
    -> (10, 'Coffee Mug', 'Accessories', 9.99, 300, 'MugMasters', 4.1);
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from products;
+-----------+-------------------+-------------+--------+---------------+---------------+--------+
| ProductID | ProductName       | Category    | Price  | StockQuantity | Supplier      | Rating |
+-----------+-------------------+-------------+--------+---------------+---------------+--------+
|         1 | Wireless Mouse    | Electronics |  25.99 |           150 | Tech Supplies |    4.5 |
|         2 | Office Chair      | Furniture   | 120.00 |            85 | Comfort Co    |    4.7 |
|         3 | Water Bottle      | Accessories |  15.00 |           250 | AquaGear      |    4.3 |
|         4 | Laptop Backpack   | Accessories |  45.99 |           200 | GearUp        |    4.6 |
|         5 | Gaming Laptop     | Electronics | 999.99 |            45 | Tech Supplies |    4.8 |
|         6 | Desk Lamp         | Furniture   |  35.00 |           120 | LightHouse    |    4.2 |
|         7 | Bluetooth Speaker | Electronics |  59.99 |            95 | SoundWave     |    4.4 |
|         8 | Standing Desk     | Furniture   | 250.00 |            50 | Comfort Co    |    4.9 |
|         9 | Fitness Tracker   | Electronics | 129.99 |           180 | FitTech       |    4.7 |
|        10 | Coffee Mug        | Accessories |   9.99 |           300 | MugMasters    |    4.1 |
+-----------+-------------------+-------------+--------+---------------+---------------+--------+
10 rows in set (0.00 sec)

mysql> select * from products
    -> select * from products;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select * from products' at line 2
mysql> select * from products;
+-----------+-------------------+-------------+--------+---------------+---------------+--------+
| ProductID | ProductName       | Category    | Price  | StockQuantity | Supplier      | Rating |
+-----------+-------------------+-------------+--------+---------------+---------------+--------+
|         1 | Wireless Mouse    | Electronics |  25.99 |           150 | Tech Supplies |    4.5 |
|         2 | Office Chair      | Furniture   | 120.00 |            85 | Comfort Co    |    4.7 |
|         3 | Water Bottle      | Accessories |  15.00 |           250 | AquaGear      |    4.3 |
|         4 | Laptop Backpack   | Accessories |  45.99 |           200 | GearUp        |    4.6 |
|         5 | Gaming Laptop     | Electronics | 999.99 |            45 | Tech Supplies |    4.8 |
|         6 | Desk Lamp         | Furniture   |  35.00 |           120 | LightHouse    |    4.2 |
|         7 | Bluetooth Speaker | Electronics |  59.99 |            95 | SoundWave     |    4.4 |
|         8 | Standing Desk     | Furniture   | 250.00 |            50 | Comfort Co    |    4.9 |
|         9 | Fitness Tracker   | Electronics | 129.99 |           180 | FitTech       |    4.7 |
|        10 | Coffee Mug        | Accessories |   9.99 |           300 | MugMasters    |    4.1 |
+-----------+-------------------+-------------+--------+---------------+---------------+--------+
10 rows in set (0.00 sec)

mysql> select
    -> *
    -> case
    -> when price>500 then 'high'
    -> when price>=300 and price<500 then 'medium'
    -> else 'low'
    -> end as category
    -> from products;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'case
when price>500 then 'high'
when price>=300 and price<500 then 'medium'
else' at line 3
mysql> select
    -> *,
    -> case
    -> when price>500 then 'high'
    -> when price>=300 and price<500 then 'medium'
    -> else 'low'
    -> end as category
    -> from products;
+-----------+-------------------+-------------+--------+---------------+---------------+--------+----------+
| ProductID | ProductName       | Category    | Price  | StockQuantity | Supplier      | Rating | category |
+-----------+-------------------+-------------+--------+---------------+---------------+--------+----------+
|         1 | Wireless Mouse    | Electronics |  25.99 |           150 | Tech Supplies |    4.5 | low      |
|         2 | Office Chair      | Furniture   | 120.00 |            85 | Comfort Co    |    4.7 | low      |
|         3 | Water Bottle      | Accessories |  15.00 |           250 | AquaGear      |    4.3 | low      |
|         4 | Laptop Backpack   | Accessories |  45.99 |           200 | GearUp        |    4.6 | low      |
|         5 | Gaming Laptop     | Electronics | 999.99 |            45 | Tech Supplies |    4.8 | high     |
|         6 | Desk Lamp         | Furniture   |  35.00 |           120 | LightHouse    |    4.2 | low      |
|         7 | Bluetooth Speaker | Electronics |  59.99 |            95 | SoundWave     |    4.4 | low      |
|         8 | Standing Desk     | Furniture   | 250.00 |            50 | Comfort Co    |    4.9 | low      |
|         9 | Fitness Tracker   | Electronics | 129.99 |           180 | FitTech       |    4.7 | low      |
|        10 | Coffee Mug        | Accessories |   9.99 |           300 | MugMasters    |    4.1 | low      |
+-----------+-------------------+-------------+--------+---------------+---------------+--------+----------+
10 rows in set (0.00 sec)
