create database funfit_db;

use funfit_db;

create table batch(bid int primary key auto_increment, typeofbatch enum('morning','evening'), time varchar(10));

create table participants(pid int primary key auto_increment, fname varchar(30), age int, phonenumber varchar(10)
, bid int, foreign key(bid) references batch(bid) on delete set null);

