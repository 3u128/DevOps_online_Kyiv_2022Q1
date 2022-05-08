## PART 1

1. install MySQL server in Ubuntu
```
yes | sudo apt install mysql-server && sudo mysql_secure_installation
sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'my-secret-password';

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+

mysql> use mysql;
mysql> show tables;
# after that describe one by on etables, like this:
mysql> describe servers;
+-------------+-----------+------+-----+---------+-------+
| Field       | Type      | Null | Key | Default | Extra |
+-------------+-----------+------+-----+---------+-------+
| Server_name | char(64)  | NO   | PRI |         |       |
| Host        | char(255) | NO   |     |         |       |
| Db          | char(64)  | NO   |     |         |       |
| Username    | char(64)  | NO   |     |         |       |
| Password    | char(64)  | NO   |     |         |       |
| Port        | int       | NO   |     | 0       |       |
| Socket      | char(64)  | NO   |     |         |       |
| Wrapper     | char(64)  | NO   |     |         |       |
| Owner       | char(64)  | NO   |     |         |       |
+-------------+-----------+------+-----+---------+-------+
9 rows in set (0.01 sec)
```

4. Create a database on the server through the console. 
5. Fill in tables.

```
mysql> create database epam;
mysql> use epam;
mysql> create table users (id int);
mysql> insert into users (id) values (1), (2), (3);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0
```

6.Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY. 
```
mysql> select * from users where id > 2;
+------+
| id   |
+------+
|    3 |
+------+
1 row in set (0.00 sec)
mysql> alter table users add column name varchar (40);
mysql> describe users;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(40) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> select id from users group by id;
+------+
| id   |
+------+
|    1 |
|    2 |
|    3 |
|    4 |
+------+
4 rows in set (0.00 sec)

mysql> select id from users order by id;
+------+
| id   |
+------+
|    1 |
|    2 |
|    2 |
|    3 |
|    4 |
+------+
5 rows in set (0.00 sec)
```

7.Execute other different SQL queries DDL, DML, DCL.

```
DDL
    CREATE
    DROP
    ALTER
    TRUNCATE
DML
    INSERT
    UPDATE
    DELETE
DCL
    GRANT
    REVOKE
```
8.

```
mysql> CREATE USER 'epam'@'localhost'
    -> IDENTIFIED BY 'password';

sudo mysql -u epam -p

mysql> create database test;
ERROR 1044 (42000): Access denied for user 'epam'@'localhost' to database 'test'
exit & login by root, then:

mysql> GRANT ALL PRIVILEGES ON *.* TO 'epam'@'localhost' WITH GRANT OPTION;
Query OK, 0 rows affected (0.01 sec)

it's not ok, but let's see how it work
more preferred choice:
GRANT PRIVILEGE ON database.table TO 'username'@'host';
```
9. Make a selection from the main table DB MySQL.
```
mysql> select User from db group by User;
+---------------+
| User          |
+---------------+
| mysql.session |
| mysql.sys     |
+---------------+
2 rows in set (0.00 sec)
```

mysql> select * from users where id > 2;
+------+
| id   |
+------+
|    3 |
+------+
1 row in set (0.00 sec)


## PART 2
10. Make backup of your database. 
```
ubuntu@epam:~$ sudo mysqldump -u epam -p epam > epam.sql
Enter password: 
ubuntu@epam:~$ ls
epam.sql
```

11. Delete the table and/or part of the data in the table. 
mysql> delete from users where name = 'Yevhen'; 
Query OK, 1 row affected (0.01 sec) 

mysql> select * from users;
+------+--------------+
| id   | name         |
+------+--------------+
|    2 | Vasyl        |
|    2 | Kotygoroshko |
|    3 | Kotygoroshko |
|    4 | Oleksandra   |
+------+--------------+
4 rows in set (0.00 sec)

12. Restore your database.
```
ubuntu@epam:~$ mysql -u epam -p epam < epam.sql
mysql> select * from users;
+------+--------------+
| id   | name         |
+------+--------------+
|    1 | Yevhen       |
|    2 | Vasyl        |
|    2 | Kotygoroshko |
|    3 | Kotygoroshko |
|    4 | Oleksandra   |
+------+--------------+
5 rows in set (0.00 sec)
```

13. Transfer your local database to RDS AWS. 

version by pipe:

```
sudo mysqldump -u root \
    --databases epam \
    --single-transaction \
    --compress \
    --order-by-primary  \
    --routines=0 \
    --triggers=0 \
    --events=0 \
    -plocalpass | mysql -u admin \
        --port=3306 \
        --host=database-1.c6qiqbkvbq6o.us-east-1.rds.amazonaws.com \
        -prdspass
```
14. Connect to your database.  

```
mysql -h database-1.c6qiqbkvbq6o.us-east-1.rds.amazonaws.com -P 3306 -u admin -p
```

15. repeat task 6 
[img](!)


16. Create the dump of your database.Transfer your local database to RDS AWS. 


```
mysqldump -u admin -p -h database-1.c6qiqbkvbq6o.us-east-1.rds.amazonaws.com epam > epam.sql
```
where

-u master user of rds
-p waiting password
-h rds endpoint
epam - name of remote db (named when create)
> epam.sql - name of backuped db

