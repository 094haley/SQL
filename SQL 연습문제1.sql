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
	`orderNo`       int auto_increment primary key,
    `orderId`       varchar(10) not null,
    `orderProduct`  int not null,
    `orderCount`    int default 1,
    `orderDate`     datetime not null
);

#실습1-3

insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도균 청산면', '2022-01-03');
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `Customer`(`custId`, `name`, `rdate`) values ('c105', '이성계', '2022-01-05');
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `Customer`(`custId`, `name`, `rdate`) values ('c107', '허준', '2022-01-07');
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');


insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('새우깡', 5000, 1500, '농심');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('초코파이', 2500, 2500, '오리온');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('포카칩', 3600, 1700, '오리온');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('양파링', 1250, 1800, '농심');
insert into `Product` (`prodName`, `stock`, `company`) values ('죠리퐁', 2200, '크라운');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('마가렛트', 3500, 3500, '롯데');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('뿌셔뿌셔', 1650, 1200, '오뚜기');


insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 3, 2, '2022-07-01 13:15:10');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', 4, 1, '2022-07-01 14:16:11');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c108', 1, 1, '2022-07-01 17:23:18');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c109', 6, 5, '2022-07-02 10:46:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 2, 1, '2022-07-03 09:15:37');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', 7, 3, '2022-07-03 12:35:12');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c110', 1, 2, '2022-07-03 16:55:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c104', 2, 4, '2022-07-04 14:23:23');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 1, 3, '2022-07-04 21:54;34');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c107', 6, 1, '2022-07-05 14:21:03');


#실습1-4
select * from `Customer`;

#실습1-5
select `custId`, `name`, `hp` from `Customer`;

#실습1-6
select * from `Product`;

#실습1-7
select `company` from `Product`;

#실습1-8
select distinct `company` from `Product`;

#실습1-9
select `prodName`, `price` from `Product`;

#실습1-10
select `prodName`, `price` + 500 as `조정단가` from `Product`;

#실습1-11
select `prodName`, `stock`, `price` from `Product` where `company` = '오리온';

#실습1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102';

#실습1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102' and `orderCount` >= 2; 

#실습1-14
select * from `Product` where `price` >= 1000 and `price` <= 2000; 

#실습1-15
select `custId`, `name`, `hp`, `addr` from `Customer` where `name` like '김%';

#실습1-16
select `custId`, `name`, `hp`, `addr` from `Customer` where `name` like '__';

#실습1-17
select * from `Customer` where `hp` is null;

#실습1-18
select * from `Customer` where `addr` is not null;

#실습1-19
select * from `Customer` order by `rdate` desc;

#실습1-20
select * from `Order` where `orderCount` >= 3 order by `orderCount` desc, `orderProduct` asc;

#실습1-21
select AVG(`price`) as `AVG(price)` from `Product`;

#실습1-22
select SUM(`stock`) as `재고량 합계` from `Product` where `company` = '농심';

#실습1-23
select count(`custId`) as `고객수` from `Customer`;

#실습1-24
select count(distinct `company`) as `제조업체 수` from `Product`;

#실습1-25
select `orderProduct` as `주문 상품번호`, sum(`orderCount`) as `총 주문수량` from `Order` group by `orderProduct` order by `orderProduct`;

#실습1-26
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` from `Product` group by `company`;

#실습1-27
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` from `Product` group by `company` having `제품수` >= 2;

#실습1-28
select  `orderProduct`, `orderId`, sum(`orderCount`) as `총 주문수량` from `Order` group by `orderProduct`, `orderID` order by `orderProduct`;

#실습1-29
select a.`orderId`, b.`prodName`
from `Order` as a 
join `Product` as b 
on a.orderProduct = b.prodNo 
where `orderId` = 'c102';

#실습1-30
select `orderId`, `name`, `prodname`, `orderdate`
from `Order` as a 
join `Customer` as b on a.`orderId` = b.`custId`
join `Product` as c on a.`orderProduct` = c.`prodNo`
where substr(`orderDate`, 1, 10) = '2022-07-03';
