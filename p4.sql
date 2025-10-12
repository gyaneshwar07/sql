Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 31
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
| object             |
| performance_schema |
| sys                |
+--------------------+
10 rows in set (0.02 sec)

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

mysql> use db1;
Database changed
mysql> show tables;
+---------------+
| Tables_in_db1 |
+---------------+
| book          |
| employee      |
| products      |
| project       |
| team          |
+---------------+
5 rows in set (0.01 sec)

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

mysql> -- copy data from existing table to new tables
mysql> select * into new_table from products;
ERROR 1327 (42000): Undeclared variable: new_table
mysql> -- this syntax didn't support in mysql
mysql> CREATE TABLE new_table as
    -> select * from products;
Query OK, 10 rows affected (0.30 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from new_table;
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

mysql> create table tb_1 as
    -> select * from products where 1 = 0;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from tb_1;
Empty set (0.00 sec)

mysql> insert into tb_1
    -> values
    -> (11,'cofee','eating',26.26,321,'nasta',6.6);
Query OK, 1 row affected (0.01 sec)

mysql> select * from tb_1;
+-----------+-------------+----------+-------+---------------+----------+--------+
| ProductID | ProductName | Category | Price | StockQuantity | Supplier | Rating |
+-----------+-------------+----------+-------+---------------+----------+--------+
|        11 | cofee       | eating   | 26.26 |           321 | nasta    |    6.6 |
+-----------+-------------+----------+-------+---------------+----------+--------+
1 row in set (0.00 sec)

mysql> -- want specific row and column
mysql> create table tb_2 as
    -> select productname , price from products;
Query OK, 10 rows affected (0.07 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from tb_2;
+-------------------+--------+
| productname       | price  |
+-------------------+--------+
| Wireless Mouse    |  25.99 |
| Office Chair      | 120.00 |
| Water Bottle      |  15.00 |
| Laptop Backpack   |  45.99 |
| Gaming Laptop     | 999.99 |
| Desk Lamp         |  35.00 |
| Bluetooth Speaker |  59.99 |
| Standing Desk     | 250.00 |
| Fitness Tracker   | 129.99 |
| Coffee Mug        |   9.99 |
+-------------------+--------+
10 rows in set (0.00 sec)

mysql> create table tb_3 as
    -> select productname , price from products where price>150;
Query OK, 2 rows affected (0.06 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from tb_3;
+---------------+--------+
| productname   | price  |
+---------------+--------+
| Gaming Laptop | 999.99 |
| Standing Desk | 250.00 |
+---------------+--------+
2 rows in set (0.00 sec)

mysql> -- insert data into existing table tb_2
mysql> insert into tb_2
    -> select * from products;
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into tb_1
    -> select * from products;
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from tb_1;
+-----------+-------------------+-------------+--------+---------------+---------------+--------+
| ProductID | ProductName       | Category    | Price  | StockQuantity | Supplier      | Rating |
+-----------+-------------------+-------------+--------+---------------+---------------+--------+
|        11 | cofee             | eating      |  26.26 |           321 | nasta         |    6.6 |
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
11 rows in set (0.00 sec)

mysql> CREATE TABLE Customers (
    ->     customer_id INT PRIMARY KEY,
    ->     customer_name VARCHAR(100),
    ->     email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql>
mysql>
mysql> CREATE TABLE Orders (
    ->     order_id INT PRIMARY KEY,
    ->     customer_id INT,
    ->     order_date DATE,
    ->     amount DECIMAL(10, 2),
    ->     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql>
mysql>
mysql>
mysql> -- Insert data into Customers table
mysql> INSERT INTO Customers (customer_id, customer_name, email)
    -> VALUES
    -> (1, 'Alice Smith', 'alice@example.com'),
    -> (2, 'Bob Johnson', 'bob@example.com'),
    -> (3, 'Charlie Brown', 'charlie@example.com');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert data into Orders table
mysql> INSERT INTO Orders (order_id, customer_id, order_date, amount)
    -> VALUES
    -> (101, 1, '2024-07-15', 250.00),
    -> (102, 1, '2024-08-05', 300.00),
    -> (103, 2, '2024-08-10', 150.00),
    -> (104, 3, '2024-06-25', 100.00);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+-------------+---------------+---------------------+
| customer_id | customer_name | email               |
+-------------+---------------+---------------------+
|           1 | Alice Smith   | alice@example.com   |
|           2 | Bob Johnson   | bob@example.com     |
|           3 | Charlie Brown | charlie@example.com |
+-------------+---------------+---------------------+
3 rows in set (0.00 sec)

mysql> select * from orders;
+----------+-------------+------------+--------+
| order_id | customer_id | order_date | amount |
+----------+-------------+------------+--------+
|      101 |           1 | 2024-07-15 | 250.00 |
|      102 |           1 | 2024-08-05 | 300.00 |
|      103 |           2 | 2024-08-10 | 150.00 |
|      104 |           3 | 2024-06-25 | 100.00 |
+----------+-------------+------------+--------+
4 rows in set (0.00 sec)

mysql> -- fetch the data of costomer who have order in august month
mysql> select * from customers
    -> where customer id in (
    -> select distinct customer_id where order_date between '2024-08-01' and '2024-08-31'
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'id in (
select distinct customer_id where order_date between '2024-08-01' and '2' at line 2
mysql> select * from customers
    -> where customer id in (
    -> select distinct customer_id from orders where order_date between '2024-08-01' and '2024-08-31'
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'id in (
select distinct customer_id from orders where order_date between '2024-0' at line 2
mysql> select * from customers
    -> where customer id in (
    -> select distinct customer_id from orders where order_date between '2024-08-01' and '2024-08-31'
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'id in (
select distinct customer_id from orders where order_date between '2024-0' at line 2
mysql> select * from customers
    -> where customer_id in (
    -> select distinct customer_id from orders where order_date between '2024-08-01' and '2024-08-31'
    -> );
+-------------+---------------+-------------------+
| customer_id | customer_name | email             |
+-------------+---------------+-------------------+
|           1 | Alice Smith   | alice@example.com |
|           2 | Bob Johnson   | bob@example.com   |
+-------------+---------------+-------------------+
2 rows in set (0.03 sec)

mysql> -- place order other than aug month
mysql> select * from customers
    -> where customer_id in(
    -> select distinct id from orders where order_date not between '2024-08-01' and '2024-08-31'
    -> );
ERROR 1054 (42S22): Unknown column 'id' in 'field list'
mysql> select * from customers
    -> where customer_id in(
    -> select distinct customer_id from orders where order_date not between '2024-08-01' and '2024-08-31'
    -> );
+-------------+---------------+---------------------+
| customer_id | customer_name | email               |
+-------------+---------------+---------------------+
|           1 | Alice Smith   | alice@example.com   |
|           3 | Charlie Brown | charlie@example.com |
+-------------+---------------+---------------------+
2 rows in set (0.00 sec)
