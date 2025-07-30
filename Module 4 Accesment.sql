create database accesment;
use accesment;

CREATE TABLE customer (
  customer_id INT,
  customer_name VARCHAR(255),
  city VARCHAR(255),
  grade INT,
  salesman_id INT primary key
);

insert into customer(customer_id,customer_name,city,salesman_id) values (3001,'Brad Guzan','London',5005);
insert into customer values (3002,'Nick Rimando','New York',100,5001);
insert into customer values (3003,'Jozy Altidor','Moscow',200,5007);
insert into customer values (3004,'Fabian Johnson','Paris',300,5006);
insert into customer values (3005,'Graham Zusi','California',200,5002);
insert into customer values (3006,'Geof Cameron','Berlin',100,5003);
insert into customer values (3007,'Brad Devis','New York',200,5001);
insert into customer values (3008,'Julian Green','London',300,5002);

select * from customer;

CREATE TABLE salesman (
  salesman_id INT,
  name VARCHAR(255),
  city VARCHAR(255),
  commission DECIMAL(10, 2),
  foreign key salesman(salesman_id) REFERENCES customer(salesman_id)
);

insert into salesman values (5001,'James Hoog','New York',0.15);
insert into salesman values (5002,'Nail Knite','Paris',0.13);
insert into salesman values (5003,'Lauson Hen','San Jose',0.12);
insert into salesman values (5005,'Pit Alex','London',0.11);
insert into salesman values (5006,'MC Lyon','Paris',0.14);
insert into salesman values (5007,'Paul Adam','Rome',0.13);

select * from salesman;

SELECT customer.customer_name, customer.city, salesman.name AS Salesman, salesman.commission
FROM Customer JOIN 
Salesman ON customer.salesman_id = salesman.salesman_id;
