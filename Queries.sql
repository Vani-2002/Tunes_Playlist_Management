https://bit.ly/FLM-Mysql-download



DDL

CRETAE
------

CREATE DATABASE databasename;

CREATE DATABASE testDB;

ALTER
-----

-- ALTER TABLE sales add column (purchase_date date);

-- ALTER TABLE sales MODIFY COLUMN purchase_date DATETIME;

-- ALTER TABLE sales RENAME COLUMN purchase_date  TO purchaseday

-- ALTER TABLE sales  DROP COLUMN purchases;

RENAME
------

-- RENAME TABLE SALES TO SALE;

TRUNCATE
--------

TRUNCATE TABLE sale;

DROP
----

-- DROP TABLE sales

########################################################

DML
---

INSERT
------
INSERT INTO sale VALUES (2,'CAR');

INSERT INTO sale(item) VALUES(3,'GUN');

UPDATE
------

UPDATE SALE SET id=100,item='BOX';

DELETE
------

DELETE FROM sale ;

#############################################

DQL
---

select * from sale;


