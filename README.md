#Mysql 5.7

```
maas-dev-docekr-V2]$ docker exec -it  mysql /bin/bash
 
bash-4.2# mysql -uroot

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.7.20 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.



mysql> CREATE DATABASE ec CHARACTER SET utf8 COLLATE utf8_general_ci;
mysql> create user "ecuser"@"%" identified by "qazwsx";
mysql> create user "chain"@"%" identified by "qazwsx";
mysql> grant all on  *.* to   "ecuser"@"%" ;
mysql> grant all on  *.* to   "chain"@"%" ;
```
 

#Mysql 8
if you use statement of mysql 5.7, you would discover the account you created were absent of DBA role .

```
maas-dev-docekr-V2]$ docker exec -it  mysql /bin/bash
 
bash-4.2# mysql -uroot

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.7.20 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 

SET  GLOBAL  validate_password.policy=LOW;
SET  GLOBAL  validate_password.special_char_count=0;
SET  GLOBAL  validate_password.number_count =0;
SET  GLOBAL  validate_password.mixed_case_count =0;
SET  GLOBAL  validate_password.length =6;
SET PASSWORD = 'qazwsx';
create user "root"@"172.21.2.134" identified by "qazwsx";
create user "root"@"172.21.2.%" identified by "qazwsx";
create user "chain"@"172.21.2.134" identified by "qazwsx";
create user "root"@"%" identified by "qazwsx";
create user "ecuser"@"%" identified by "qazwsx";
create user "chain"@"%" identified by "qazwsx";
grant all  privileges  on  *.* to   "root"@"%"  with  grant option ;
grant all  privileges   on  *.* to   "ecuser"@"%"  with  grant option ;
grant all  privileges   on  *.* to   "chain"@"%"  with  grant option ;
grant all   privileges  on  *.* to   "root"@"172.21.2.134"  with  grant option ;
grant all   privileges  on  *.* to   "root"@"172.21.2.%"   with  grant option ;
grant all   privileges  on  *.* to   "chain"@"172.21.2.134"   with  grant option ;

```
