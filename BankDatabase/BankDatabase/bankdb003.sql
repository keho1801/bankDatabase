drop database bankdb;
create database bankdb;
use bankdb;


create table customer(
id int unsigned not null auto_increment primary key,
name varchar(50) not null,
city varchar(50) not null);

create table worker(
id int unsigned not null auto_increment primary key,
name varchar(30) default null);

create table account(
id int unsigned not null auto_increment primary key,
customerid int unsigned not null,
rate double unsigned default 1.00,
balance double unsigned default 0,
active boolean default 1,
foreign key (customerid) references customer(id) on delete cascade);

create table loan(
id int unsigned not null auto_increment primary key,
amount int unsigned not null,
rate double unsigned not null,
accountid int unsigned not null,
workerid int unsigned default 0,
granted boolean default 0,
created timestamp,
months int default 0,
monthlyPayment double default 0,
foreign key (accountid) references account(id) on delete cascade);

create table history(
id int unsigned not null auto_increment primary key,
created timestamp DEFAULT CURRENT_TIMESTAMP,
accountid int unsigned not null,
amount int default 0,
comment varchar(100) default null);


insert into customer(name, city) values('Kenny','Stockholm'),('Johnny','Stockholm'),('Jesper','Luleå'),('Vincent','Malmö'),('Sins','Göteborg');

insert into worker (name) values('Peter');

insert into account(customerid,balance) values(1,2000),(2,2000),(3,14000),(4,234),(5,543322);

insert into loan(amount,rate,accountid) values (1000,1.02,1);