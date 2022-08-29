#날짜 : 2022/08/29
#이름 : 이해빈
#내용 : SQL 연습문제1

#실습1-1
create database `java2_shop`;
create user 'java2_admin1'@'%' identified by '1234';
grant all privileges on `java2_shop`.* to 'java2_admin1'@'%';
flush privileges;

#실습1-2
create table `Customer` (
	`custId`  varchar(10) primary key,
    `name`    varchar(10) not null,
    `hp`      char(13) default null unique,
    `addr`    varchar(100) default null,
    `rdate`   date not null
);

create table `Product` (
	`prodNO`    int auto_increment primary key,
    `prodName`  varchar(10) not null,
    `stock`     int default 0,
    `price`     int default null,
    `company`   varchar(20) not null
);

create table `Order` (
	`orderNo`       Int auto_increment primary key,
    `orderId`       varchar(10) not null,
    `orderProduct`  int not null,
    `orderCount`    int default 1,
    `orderDate`     datetime not null
);

#실습1-3

insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', now());
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', now());
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도균 청산면', now());
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', now());
insert into `Customer`(`custId`, `name`, `rdate`) values ('c105', '이성계', now());
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', now());
insert into `Customer`(`custId`, `name`, `rdate`) values ('c107', '허준', now());
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', now());
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', now());
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', now());

#실습1-4
#실습1-5
#실습1-6
#실습1-7
#실습1-8
#실습1-9
#실습1-10
#실습1-11
#실습1-12
#실습1-13
#실습1-14
#실습1-15
#실습1-16
#실습1-17
#실습1-18
#실습1-19
#실습1-20
#실습1-21
#실습1-22
#실습1-23
#실습1-24
#실습1-25
#실습1-26
#실습1-27
#실습1-29
#실습1-29
#실습1-30