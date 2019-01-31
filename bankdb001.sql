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
duedate timestamp,
foreign key (accountid) references account(id) on delete cascade,
foreign key (workerid) references worker(id) on delete set null);


create table history(
id int unsigned not null auto_increment primary key,
created timestamp DEFAULT CURRENT_TIMESTAMP,
accountid int unsigned not null,
amount int default 0,
comment varchar(100) default null);



