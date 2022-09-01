#날짜 : 2022/09/01
#이름 : 이해빈
#내용 : SQL 연습문제4

#실습4-1
create database `java2_BookStore`;
create user 'java2_admin4'@'%' identified by '1234';
grant all privileges on `java2_BookStore`.* to 'java2_admin4'@'%';
flush privileges;

#실습4-2

create table `Customer` (
	`custId`    int auto_increment primary key,
    `name`      varchar(10) not null,
    `address`   varchar(20) not null,
    `phone`     char(13)
);

create table `Book` (
	`bookId`     int primary key,
    `bookName`   varchar(20) not null,
    `publisher`  varchar(20) not null,
    `price`      int
);

create table `Order` (
	`orderId`	 int auto_increment primary key,
	`custId`     int not null,
	`bookId`     int not null,
	`salePrice`  int not null,
	`orderDate`  date not null
);

#실습4-3
insert into `Customer`(`name`, `address`, `phone`) values('박지성', '영국 맨체스터', '000-5000-0001');
insert into `Customer`(`name`, `address`, `phone`) values('김연아', '대한민국 서울', '000-6000-0001');
insert into `Customer`(`name`, `address`, `phone`) values('장미란', '대한민국 강원도', '000-7000-0001');
insert into `Customer`(`name`, `address`, `phone`) values('추신수', '미국 클리블랜드', '000-8000-0001');
insert into `Customer`(`name`, `address`) values('박세리', '대한민국 대전');

insert into `Book` values( 1, '축구의 역사', '굿스포츠', 7000);
insert into `Book` values( 2, '축구아는 여자', '나무수', 13000);
insert into `Book` values( 3, '축구의 이해', '대한미디어', 22000);
insert into `Book` values( 4, '골프 바이블', '대한미디어', 35000);
insert into `Book` values( 5, '피겨 교본', '굿스포츠', 8000);
insert into `Book` values( 6, '역도 단계별기술', '굿스포츠', 6000);
insert into `Book` values( 7, '야구의 추억', '이상미디어', 20000);
insert into `Book` values( 8, '야구를 부탁해', '이상미디어', 13000);
insert into `Book` values( 9, '올림픽 이야기', '삼성당', 7500);
insert into `Book` values( 10, 'Olympic Champions', 'Pearson', 13000);

insert into `Order`(`custId`,`bookId`,`salePrice`, `orderDate`) values( 1, 1, 6000,'2014-07-01');
insert into `Order`(`custId`,`bookId`,`salePrice`, `orderDate`) values( 1, 3, 21000,'2014-07-03');
insert into `Order`(`custId`,`bookId`,`salePrice`, `orderDate`) values( 2, 5, 8000,'2014-07-03');
insert into `Order`(`custId`,`bookId`,`salePrice`, `orderDate`) values( 3, 6, 6000,'2014-07-04');
insert into `Order`(`custId`,`bookId`,`salePrice`, `orderDate`) values( 4, 7, 20000,'2014-07-05');
insert into `Order`(`custId`,`bookId`,`salePrice`, `orderDate`) values( 1, 2, 12000,'2014-07-07');
insert into `Order`(`custId`,`bookId`,`salePrice`, `orderDate`) values( 4, 8, 13000,'2014-07-07');
insert into `Order`(`custId`,`bookId`,`salePrice`, `orderDate`) values( 3, 10, 12000,'2014-07-08');
insert into `Order`(`custId`,`bookId`,`salePrice`, `orderDate`) values( 2, 10, 7000,'2014-07-09');
insert into `Order`(`custId`,`bookId`,`salePrice`, `orderDate`) values( 3, 8, 13000,'2014-07-10');

#실습4-4
select `custId`, `name`, `address` from `Customer`;

#실습4-5
select `bookName`, `price` from `Book`;

#실습4-6
select `price`, `bookName` from `Book`;

#실습4-7
select * from `Book`;

#실습4-8
select `publisher` from `Book`;

#실습4-9
select distinct `publisher` from `Book`;

#실습4-10
select * from `Book` where `price` >= 20000;

#실습4-11
select * from `Book` where `price` < 20000;

#실습4-12
select * from `Book` where `price` >= 10000 and `price` <= 20000;

#실습4-13
select `bookId`, `bookName`, `price` from `Book` where `price` >= 15000 and `price` <= 30000;

#실습4-14
select * from `Book` where `bookId` in (2,3,5);

#실습4-15
select * from `Book` where `bookId`% 2 = 0;

#실습4-16
select * from `Customer` where `name` like '박%';

#실습4-17
select * from `Customer` where `address` like '대한민국%';

#실습4-18
select * from `Customer` where `phone` is not null;

#실습4-19
select * from `Book` where `publisher` in ('굿스포츠','대한미디어');

#실습4-20
select `publisher` from `Book` where `bookName` = '축구의 역사';

#실습4-21
select `publisher` from `Book` where `bookName` like '%축구%';

#실습4-22
select * from `Book` where substr(`bookName`,2,1) = '구';
select * from `Book` where `bookName` like '_구%';

#실습4-23
select * from `Book` where `bookName` like '%축구%' and `price` >= 20000;

#실습4-24
select * from `Book` order by `bookName` asc;

#실습4-25
select * from `Book` order by `price`, `bookName`;

#실습4-26
select * from `Book` order by `price` desc, `publisher` asc;

#실습4-27
select * from `Book` order by `price` desc limit 3;

#실습4-28
select * from `Book` order by `price` asc limit 3;

#실습4-29
select sum(`salePrice`) as `총판매액` from `Order`;

#실습4-30
select
	sum(`salePrice`) as `총판매액`,
    avg(`salePrice`) as `평균값`,
    min(`salePrice`) as `최저가`,
    max(`salePrice`) as `최고가`
from `Order`;

#실습4-31
select count(`orderId`) as `판매건수` from `Order`;

#실습4-32
select `bookId`,
replace(`bookName`,'야구','농구') as `bookName`,
`publisher`,
`price`
from `Book`;

#실습4-33
select 
	`custId`,
	count(`orderId`) as `수량`
from `Order` where `salePrice` >= 8000 group by `custId` having `수량`>=2; 

#실습4-34
select * from `Customer` as a 
join `Order` as b on a.`custId` = b.`custId` order by a.`custId`;

#실습4-35
select * from `Customer` as a 
join `Order` as b on a.`custId` = b.`custId`;

#실습4-36
select `name`, `salePrice` from `Customer` as a 
join `Order` as b on a.`custId` = b.`custId` order by a.`custId`;

#실습4-37
select `name`, sum(`salePrice`) from `Customer` as a 
join `Order` as b on a.`custId` = b.`custId` group by `name` order by `name`;

#실습4-38
select `name`, `bookName` 
from `Customer` as a 
join `Order` as b on a.`custId` = b.`custId`
join `Book` as c on b.`bookId`= c.`bookId` order by a.`custId`;

#실습4-39
select `name`, `bookName` 
from `Customer` as a 
join `Order` as b on a.`custId` = b.`custId`
join `Book` as c on b.`bookId`= c.`bookId` 
where `price` = 20000
order by a.`custId`;

#실습4-40
select `name`, `saleprice` 
from `Customer` as a 
left join `Order` as b on a.`custId` = b.`custId`;

#실습4-41
select `bookName` from `Book` where `price` = (select max(`price`) from `Book`);

#실습4-42
select `name` 
from `Customer` as a
left join `Order` as b on a.`custId` = b.`custId` where b.`custId` is null;

select `name` from `Customer` where `custId` not in(select distinct `custId` from `Order`);

#실습4-43
select sum(`salePrice`) as `총매출` from `Customer` as a
left join `Order` as b on a.`custId` = b.`custId` where `name`='김연아';

select sum(`salePrice`) as `총매출` from `Order` where `custId` = (select `custId`from `Customer` where `name` = '김연아');

#실습4-44
insert into `Book`(`bookId`, `bookName`, `publisher`) values (11,'스포츠의학', '한솔의학서적');

#실습4-45
update `Customer` set `address` = '대한민국 부산' where `custId` = 5;

#실습4-46
delete from `Customer` where `custId`= 5;

