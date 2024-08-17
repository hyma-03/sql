-- Active: 1722755047352@@127.0.0.1@3306@amma_hotel


create TABLE menu (
    id int primary key AUTO_INCREMENT,
    food_name varchar(30) not null,
    price float not null,
    availability VARCHAR(30),
    food_type varchar(10),
    created_on DATETIME DEFAULT current_timestamp,
    created_by int,
    updated_on DATETIME DEFAULT NULL,
    updated_by int,
    is_deleted int DEFAULT 0
);

CREATE TABLE EMPLOYEE(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(30) NOT NULL,
    AGE INT DEFAULT NULL,
    CONTACT_NUMBER VARCHAR(20),
    ADDRESS VARCHAR(100),
    created_on DATETIME DEFAULT current_timestamp,
    created_by int,
    updated_on DATETIME DEFAULT NULL,
    updated_by int,
    is_deleted int DEFAULT 0
);


CREATE TABLE ORDER_TBL(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TABLE_ID int DEFAULT NULL,
    TOTAL_PRICE FLOAT NOT NULL,
    created_on DATETIME DEFAULT current_timestamp,
    created_by int,
    updated_on DATETIME DEFAULT NULL,
    updated_by int,
    is_deleted int DEFAULT 0
);
drop table order_tbl;


create table order_food_mapping(
    id INT primary key AUTO_INCREMENT,
    food_id int not null,
    order_id int not null,
    qty int default 1,
    Foreign Key (food_id) REFERENCES menu(id),
    Foreign Key (order_id) REFERENCES order_tbl(id)
    );

    drop table order_food_mapping;

CREATE TABLE ORDER_TBL(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TABLE_ID int DEFAULT NULL,
    TOTAL_PRICE FLOAT default 0,
    created_on DATETIME DEFAULT current_timestamp,
    created_by int,
    updated_on DATETIME DEFAULT NULL,
    updated_by int,
    is_deleted int DEFAULT 0
);

    create table order_food_mapping(
    id INT primary key AUTO_INCREMENT,
    food_id int not null,
    order_id int not null,
    qty int default 1,
    Foreign Key (food_id) REFERENCES menu(id),
    Foreign Key (order_id) REFERENCES order_id()
    );

INSERT INTO menu(food_name,price,availability,food_type,created_by)
VALUES  ('pongal',20.0,'morning','veg',1),
        ('idly',10.0,'morning','veg',1),
        ('dosa',25.0,'morning','veg',1),
        ('chappathi',30.0,'morning','veg',1),
        ('coffee',15.0,'morning','veg',1),
        ('bread-omelet',20.0,'morning','non-veg',1);

      INSERT INTO order_tbl(table_id)
VALUES (4),(2),(8),(33);

INSERT INTO  order_food_mapping(food_id,order_id,qty)
VALUES  (1,4,2),
        (2,3,1),
        (3,2,4),
        (4,1,7),
        (2,1,2),
        (3,4,3),
        (1,2,5),
        (6,2,9);


SELECT * FROM menu;

SELECT * FROM order_tbl;

create table order_food_mapping(
    id INT primary key AUTO_INCREMENT,
    food_id int not null,
    order_id int not null,
    qty int default 1,
    Foreign Key (food_id) REFERENCES menu(id),
    Foreign Key (order_id) REFERENCES order_tbl(id)
    );

SELECT m.food_name,sum(ofm.qty) from order_food_mapping ofm
join menu m on m.id = ofm.food_id
GROUP BY m.food_name
ORDER BY sum(ofm.qty)desc; 

SELECT m.food_name as food,m.price  ,
ofm.qty ,ot.table_id,
m.price*ofm].qty as total_price 
from order_tbl ot 
join order_food_mapping ofm on ot.id = ofm.order_id
join menu m on ofm.food_id = m.id

