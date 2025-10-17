Microsoft Windows [Version 10.0.26100.6725]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
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
10 rows in set (0.00 sec)

mysql> use db2;
Database changed
mysql> show tables;
+---------------+
| Tables_in_db2 |
+---------------+
| batch         |
| course        |
| customers     |
| orders        |
| products      |
| st_batch      |
| student       |
+---------------+
7 rows in set (0.00 sec)

mysql> select * from customers;
+------------+--------------+-----------+
| CustomerID | CustomerName | Country   |
+------------+--------------+-----------+
|          1 | Alice        | USA       |
|          2 | Bob          | UK        |
|          3 | Charlie      | Canada    |
|          4 | David        | USA       |
|          5 | Eve          | Australia |
+------------+--------------+-----------+
5 rows in set (0.00 sec)

mysql> select * from orders;
+---------+------------+------------+-----------+
| OrderID | CustomerID | OrderDate  | ProductID |
+---------+------------+------------+-----------+
|     101 |          1 | 2024-08-01 |      1001 |
|     102 |          1 | 2024-08-03 |      1002 |
|     103 |          2 | 2024-08-04 |      1001 |
|     104 |          3 | 2024-08-05 |      1003 |
|     105 |          5 | 2024-08-06 |      1004 |
+---------+------------+------------+-----------+
5 rows in set (0.00 sec)

mysql> select * from products;
+-----------+-------------+---------+
| ProductID | ProductName | Price   |
+-----------+-------------+---------+
|      1001 | Laptop      | 1000.00 |
|      1002 | Smartphone  |  700.00 |
|      1003 | Tablet      |  500.00 |
|      1004 | Headphones  |  200.00 |
|      1005 | Smartwatch  |  300.00 |
+-----------+-------------+---------+
5 rows in set (0.00 sec)

mysql> -- customer name have order something
mysql> select a.customername from customers a join orders b on a.customerid = b.customerid;
+--------------+
| customername |
+--------------+
| Alice        |
| Alice        |
| Bob          |
| Charlie      |
| Eve          |
+--------------+
5 rows in set (0.00 sec)

mysql> select distinct a.customername from customers a join orders b on a.customerid = b.customerid;
+--------------+
| customername |
+--------------+
| Alice        |
| Bob          |
| Charlie      |
| Eve          |
+--------------+
4 rows in set (0.00 sec)

mysql> -- customer havn't order anything
mysql> select distinct a.customername from customers a left join orders b on a.customerid = b.customerid where b.orderid is null;
+--------------+
| customername |
+--------------+
| David        |
+--------------+
1 row in set (0.00 sec)

mysql> -- there is concept of anti left join
mysql> -- 3 . all order with product name and price
mysql> select p.productname , p.price from orders o
    -> join
    -> products p on o.productid = p.productid ;
+-------------+---------+
| productname | price   |
+-------------+---------+
| Laptop      | 1000.00 |
| Smartphone  |  700.00 |
| Laptop      | 1000.00 |
| Tablet      |  500.00 |
| Headphones  |  200.00 |
+-------------+---------+
5 rows in set (0.00 sec)

mysql> select distinct p.productname , p.price from orders o
    -> join
    -> products p on o.productid = p.productid ;
+-------------+---------+
| productname | price   |
+-------------+---------+
| Laptop      | 1000.00 |
| Smartphone  |  700.00 |
| Tablet      |  500.00 |
| Headphones  |  200.00 |
+-------------+---------+
4 rows in set (0.00 sec)

mysql> -- find name of customers and their orders incuding customers who haven't placed any order
mysql> select a.customerName , b.productId from customers a left join orders b on a.customerId = b.customerId ;
+--------------+-----------+
| customerName | productId |
+--------------+-----------+
| Alice        |      1001 |
| Alice        |      1002 |
| Bob          |      1001 |
| Charlie      |      1003 |
| David        |      NULL |
| Eve          |      1004 |
+--------------+-----------+
6 rows in set (0.00 sec)

mysql> -- list of product that never been ordered
mysql> select p.productname from products p left join orders o on p.productId = o.productId where o.orderId is null;
+-------------+
| productname |
+-------------+
| Smartwatch  |
+-------------+
1 row in set (0.00 sec)

mysql> -- total number of order placed by each customer
mysql> select customerId,count(*) as total_order from customers c join orders o on c.customerId = o.customerId group by customerId;
ERROR 1052 (23000): Column 'customerId' in field list is ambiguous
mysql> select customername,count(orderId) as total_order from customers c join orders o on c.customerId = o.customerId group by customername;
+--------------+-------------+
| customername | total_order |
+--------------+-------------+
| Alice        |           2 |
| Bob          |           1 |
| Charlie      |           1 |
| Eve          |           1 |
+--------------+-------------+
4 rows in set (0.00 sec)

mysql> select customerId,count(orderId) as total_order from customers c join orders o on c.customerId = o.customerId group by customerId;
ERROR 1052 (23000): Column 'customerId' in field list is ambiguous
mysql> select customername,count(orderId) as total_order from customers c join orders o on c.customerId = o.customerId group by customername;
+--------------+-------------+
| customername | total_order |
+--------------+-------------+
| Alice        |           2 |
| Bob          |           1 |
| Charlie      |           1 |
| Eve          |           1 |
+--------------+-------------+
4 rows in set (0.00 sec)

mysql> select customername,count(orderId) as total_order from customers c left join orders o on c.customerId = o.customerId group by customername;
+--------------+-------------+
| customername | total_order |
+--------------+-------------+
| Alice        |           2 |
| Bob          |           1 |
| Charlie      |           1 |
| David        |           0 |
| Eve          |           1 |
+--------------+-------------+
5 rows in set (0.00 sec)

mysql> -- display customers , product they have ordered and the order date . Include customer who haven't placed any order
mysql> select c.customerName , o.orderDate , o.orderId  from customers c left join orders o on c.customerId = o.customerId;
+--------------+------------+---------+
| customerName | orderDate  | orderId |
+--------------+------------+---------+
| Alice        | 2024-08-01 |     101 |
| Alice        | 2024-08-03 |     102 |
| Bob          | 2024-08-04 |     103 |
| Charlie      | 2024-08-05 |     104 |
| David        | NULL       |    NULL |
| Eve          | 2024-08-06 |     105 |
+--------------+------------+---------+
6 rows in set (0.00 sec)

mysql> select c.customerName , o.orderDate , o.orderId , p.productname , p.price  from customers c left join orders o on c.customerId = o.customerId left join products p on p.productId = o.productId;
+--------------+------------+---------+-------------+---------+
| customerName | orderDate  | orderId | productname | price   |
+--------------+------------+---------+-------------+---------+
| Alice        | 2024-08-01 |     101 | Laptop      | 1000.00 |
| Alice        | 2024-08-03 |     102 | Smartphone  |  700.00 |
| Bob          | 2024-08-04 |     103 | Laptop      | 1000.00 |
| Charlie      | 2024-08-05 |     104 | Tablet      |  500.00 |
| David        | NULL       |    NULL | NULL        |    NULL |
| Eve          | 2024-08-06 |     105 | Headphones  |  200.00 |
+--------------+------------+---------+-------------+---------+
6 rows in set (0.00 sec)

mysql> -- identify pairs customers live in same country
mysql> select * from customers x join customers y on x.country = y.country and x.customerId <> y.customerId ;
+------------+--------------+---------+------------+--------------+---------+
| CustomerID | CustomerName | Country | CustomerID | CustomerName | Country |
+------------+--------------+---------+------------+--------------+---------+
|          4 | David        | USA     |          1 | Alice        | USA     |
|          1 | Alice        | USA     |          4 | David        | USA     |
+------------+--------------+---------+------------+--------------+---------+
2 rows in set (0.01 sec)

mysql> select * from customers x join customers y on x.country = y.country and x.customerId <> y.customerId and x.customerId>y.customerId;
+------------+--------------+---------+------------+--------------+---------+
| CustomerID | CustomerName | Country | CustomerID | CustomerName | Country |
+------------+--------------+---------+------------+--------------+---------+
|          4 | David        | USA     |          1 | Alice        | USA     |
+------------+--------------+---------+------------+--------------+---------+
1 row in set (0.01 sec)

mysql> select x.name from customers x join customers y on x.country = y.country and x.customerId <> y.customerId and x.customerId>y.customerId;
ERROR 1054 (42S22): Unknown column 'x.name' in 'field list'
mysql> select x.Customername from customers x join customers y on x.country = y.country and x.customerId <> y.customerId and x.customerId>y.customerId;
+--------------+
| Customername |
+--------------+
| David        |
+--------------+
1 row in set (0.00 sec)

mysql> select x.Customername , y.customerName from customers x join customers y on x.country = y.country and x.customerId <> y.customerId and x.customerId>y.customerId;
+--------------+--------------+
| Customername | customerName |
+--------------+--------------+
| David        | Alice        |
+--------------+--------------+
1 row in set (0.00 sec)

mysql> -- customer spent most on their spent
mysql> select * from customers c join orders o on c.customerId = o.customerId join products p on p.productId = o.productId;
+------------+--------------+-----------+---------+------------+------------+-----------+-----------+-------------+---------+
| CustomerID | CustomerName | Country   | OrderID | CustomerID | OrderDate  | ProductID | ProductID | ProductName | Price   |
+------------+--------------+-----------+---------+------------+------------+-----------+-----------+-------------+---------+
|          1 | Alice        | USA       |     101 |          1 | 2024-08-01 |      1001 |      1001 | Laptop      | 1000.00 |
|          1 | Alice        | USA       |     102 |          1 | 2024-08-03 |      1002 |      1002 | Smartphone  |  700.00 |
|          2 | Bob          | UK        |     103 |          2 | 2024-08-04 |      1001 |      1001 | Laptop      | 1000.00 |
|          3 | Charlie      | Canada    |     104 |          3 | 2024-08-05 |      1003 |      1003 | Tablet      |  500.00 |
|          5 | Eve          | Australia |     105 |          5 | 2024-08-06 |      1004 |      1004 | Headphones  |  200.00 |
+------------+--------------+-----------+---------+------------+------------+-----------+-----------+-------------+---------+
5 rows in set (0.00 sec)

mysql> select customerName , sum(price) from customers c join orders o on c.customerId = o.customerId join products p on p.productId = o.productId group by customerName;
+--------------+------------+
| customerName | sum(price) |
+--------------+------------+
| Alice        |    1700.00 |
| Bob          |    1000.00 |
| Charlie      |     500.00 |
| Eve          |     200.00 |
+--------------+------------+
4 rows in set (0.00 sec)

mysql> select customerName , sum(price) as amount_spent , DENSE_RANK() over (order by sum(price) desc as DR from customers c join orders o on c.customerId = o.customerId join products p on p.productId = o.productId group by customerName ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as DR from customers c join orders o on c.customerId = o.customerId join product' at line 1
mysql> select customerName from (
    -> select customerName , sum(price) as amount_spent , DENSE_RANK() over (order by sum(price) desc) as DR from customers c join orders o on c.customerId = o.customerId join products p on p.productId = o.productId group by customerName ) m where dr = 1;
+--------------+
| customerName |
+--------------+
| Alice        |
+--------------+
1 row in set (0.01 sec)

mysql> -- customers who have order more than one type of product
mysql>  select * from customers c join orders o on c.customerId = o.customerId ;
+------------+--------------+-----------+---------+------------+------------+-----------+
| CustomerID | CustomerName | Country   | OrderID | CustomerID | OrderDate  | ProductID |
+------------+--------------+-----------+---------+------------+------------+-----------+
|          1 | Alice        | USA       |     101 |          1 | 2024-08-01 |      1001 |
|          1 | Alice        | USA       |     102 |          1 | 2024-08-03 |      1002 |
|          2 | Bob          | UK        |     103 |          2 | 2024-08-04 |      1001 |
|          3 | Charlie      | Canada    |     104 |          3 | 2024-08-05 |      1003 |
|          5 | Eve          | Australia |     105 |          5 | 2024-08-06 |      1004 |
+------------+--------------+-----------+---------+------------+------------+-----------+
5 rows in set (0.00 sec)

mysql>  select customerName , sum(orderId) as res from customers c join orders o on c.customerId = o.customerId group by customerName;
+--------------+------+
| customerName | res  |
+--------------+------+
| Alice        |  203 |
| Bob          |  103 |
| Charlie      |  104 |
| Eve          |  105 |
+--------------+------+
4 rows in set (0.00 sec)

mysql>  select customerName , count(productId) as res from customers c join orders o on c.customerId = o.customerId group by customerName;
+--------------+-----+
| customerName | res |
+--------------+-----+
| Alice        |   2 |
| Bob          |   1 |
| Charlie      |   1 |
| Eve          |   1 |
+--------------+-----+
4 rows in set (0.00 sec)

mysql>  select customerName , count(productId) as res from customers c join orders o on c.customerId = o.customerId group by customerName where res>1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where res>1' at line 1
mysql>  select customerName , count(productId) as res from customers c join orders o on c.customerId = o.customerId group by customerName where res > 1 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where res > 1' at line 1
mysql>  select customerName , count(productId) as res from customers c join orders o on c.customerId = o.customerId group by customerName where count(productId) > 1 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where count(productId) > 1' at line 1
mysql>  select customerName , count(productId) as res from customers c join orders o on c.customerId = o.customerId group by customerName having res > 1 ;
+--------------+-----+
| customerName | res |
+--------------+-----+
| Alice        |   2 |
+--------------+-----+
1 row in set (0.01 sec)

mysql> -- list all products and their corresponding orders  , using right join , include product that has never been ordered
mysql> select p.productname , o.orderId from orders o right join products p on p.productId = o.productId ;
+-------------+---------+
| productname | orderId |
+-------------+---------+
| Laptop      |     103 |
| Laptop      |     101 |
| Smartphone  |     102 |
| Tablet      |     104 |
| Headphones  |     105 |
| Smartwatch  |    NULL |
+-------------+---------+
6 rows in set (0.00 sec)

mysql> -- retive all order placed by customer of usa
mysql> select * from customers c join orders o on c.customerId = o.customerId;
+------------+--------------+-----------+---------+------------+------------+-----------+
| CustomerID | CustomerName | Country   | OrderID | CustomerID | OrderDate  | ProductID |
+------------+--------------+-----------+---------+------------+------------+-----------+
|          1 | Alice        | USA       |     101 |          1 | 2024-08-01 |      1001 |
|          1 | Alice        | USA       |     102 |          1 | 2024-08-03 |      1002 |
|          2 | Bob          | UK        |     103 |          2 | 2024-08-04 |      1001 |
|          3 | Charlie      | Canada    |     104 |          3 | 2024-08-05 |      1003 |
|          5 | Eve          | Australia |     105 |          5 | 2024-08-06 |      1004 |
+------------+--------------+-----------+---------+------------+------------+-----------+
5 rows in set (0.00 sec)

mysql> select * from customers c join orders o on c.customerId = o.customerId where c.country = 'USA' ;
+------------+--------------+---------+---------+------------+------------+-----------+
| CustomerID | CustomerName | Country | OrderID | CustomerID | OrderDate  | ProductID |
+------------+--------------+---------+---------+------------+------------+-----------+
|          1 | Alice        | USA     |     101 |          1 | 2024-08-01 |      1001 |
|          1 | Alice        | USA     |     102 |          1 | 2024-08-03 |      1002 |
+------------+--------------+---------+---------+------------+------------+-----------+
2 rows in set (0.00 sec)

mysql> select orderId from customers c join orders o on c.customerId = o.customerId where c.country = 'USA' ;
+---------+
| orderId |
+---------+
|     101 |
|     102 |
+---------+
2 rows in set (0.00 sec)

mysql> -- find name of customers who have ordered a product more than 500
mysql> select c.customername from customer c join order o on c.customerId = o.customerId join products p on o.productId = p.productId where p.price>500;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order o on c.customerId = o.customerId join products p on o.productId = p.produc' at line 1
mysql> select c.customername from customers c join orders o on c.customerId = o.customerId join products p on o.productId = p.productId where p.price>500;
+--------------+
| customername |
+--------------+
| Alice        |
| Alice        |
| Bob          |
+--------------+
3 rows in set (0.00 sec)

mysql> select distinct c.customername from customers c join orders o on c.customerId = o.customerId join products p on o.productId = p.productId where p.price>500;
+--------------+
| customername |
+--------------+
| Alice        |
| Bob          |
+--------------+
2 rows in set (0.00 sec)

mysql> -- find customers who have ordered same produtct more than once
mysql> select customerName , productId , count(orderId) as res from customers c join orders o on c.customerId = o.customerId group by customername, productId having res>1;
Empty set (0.00 sec)