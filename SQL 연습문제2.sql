#날짜 : 2022/08/30
#이름 : 이해빈
#내용 : SQL 연습문제2

#실습2-1
create database `java2_Bank`;
create user 'java2_admin2'@'%' identified by '1234';
grant all privileges on `java2_Bank`.* to 'java2_admin2'@'%';
flush privileges;

#실습2-2
create table `bank_customer`(
	`c_no`     varchar(14) primary key, 
    `c_name`   varchar(20) not null,
    `c_dist`   tinyint not null default 0,
    `c_phone`  varchar(20) unique not null, 
	`c_addr`   varchar(100)
); 

create table `bank_account`(
	`a_no`           varchar(11) primary key default '000-00-0000',
    `a_item_dist`    char(2) not null,
    `a_item_name`    varchar(20) not null,
    `a_c_no`         char(14) not null,
    `a_balance`      int not null default 0,
    `a_open_date`    date not null
);

create table `bank_transaction`(
	`t_no`         int auto_increment primary key,
    `t_a_no`       char(11) not null,
    `t_dist`       tinyint not null,
    `t_amount`     int not null default 0,
    `t_datetime`   datetime not null 
);

#실습2-3
insert into `bank_customer` values ('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구');
insert into `bank_customer` values ('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구');
insert into `bank_customer` values ('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시');
insert into `bank_customer` values ('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시');
insert into `bank_customer` values ('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시');
insert into `bank_customer` values ('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구');
insert into `bank_customer` values ('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구');
insert into `bank_customer` values ('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시');
insert into `bank_customer` values ('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

insert into `bank_account` values('101-11-1001', 'S1', '자유저축예금', '730423-1000001', '420000', '2005-07-21');
insert into `bank_account` values('101-11-1003', 'S1', '자유저축예금', '870830-1000004', '53000', '2007-02-17');
insert into `bank_account` values('101-11-2001', 'S1', '자유저축예금', '220-82-52237', '23000000', '2003-04-14');
insert into `bank_account` values('101-11-2002', 'S1', '자유저축예금', '361-22-42687', '4201000', '2008-12-30');
insert into `bank_account` values('101-11-2003', 'S1', '자유저축예금', '102-22-51094', '8325010', '2010-06-07');
insert into `bank_account` values('101-12-1002', 'S2', '정기적립예금', '830513-200003', '1020000', '2011-05-13');
insert into `bank_account` values('101-13-1005', 'S3', '주택청약예금', '941127-100006', '720800', '2012-10-15');
insert into `bank_account` values('101-21-1004', 'L1', '고객신용대출', '910912-100005', '1200500', '2009-08-25');
insert into `bank_account` values('101-22-1006', 'L2', '예금담보대출', '730423-100001', '25000', '2013-12-11');
insert into `bank_account` values('101-23-1007', 'L3', '주택담보대출', '750210-100002', '2700000', '2020-09-23');

insert into `bank_transaction`(`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) values('101-11-1001', 1, 50000, '2022-08-21 04:26:52');
insert into `bank_transaction`(`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) values('101-11-1003', 2, 120000, '2022-08-21 04:26:52');
insert into `bank_transaction`(`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) values('101-11-2001', 2, 300000, '2022-08-21 04:26:52');
insert into `bank_transaction`(`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) values('101-12-1002', 1, 1000000, '2022-08-21 04:26:52');
insert into `bank_transaction`(`t_a_no`, `t_dist`, `t_datetime`) values('101-11-1001', 3, '2022-08-21 04:26:52');
insert into `bank_transaction`(`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) values('101-13-1005', 1, 200000, '2022-08-21 04:26:52');
insert into `bank_transaction`(`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) values('101-11-1001', 1, 450000, '2022-08-21 04:26:52');
insert into `bank_transaction`(`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) values('101-11-2002', 2, 32000, '2022-08-21 04:26:52');
insert into `bank_transaction`(`t_a_no`, `t_dist`, `t_datetime`) values('101-11-2003', 3, '2022-08-21 04:26:52');
insert into `bank_transaction`(`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) values('101-11-1003', 1, 75000, '2022-08-21 04:26:52');

#실습2-4
select * from `bank_account`;

#실습2-5
select * from `bank_customer`;

#실습2-6
select * from `bank_transaction`;

#실습2-7
select `c_name`, `c_no` from `bank_customer`;

#실습2-8
select `a_item_dist`, `a_item_name` from `bank_account`;

#실습2-9
select distinct `a_item_dist`, `a_item_name` from `bank_account`;

#실습2-10
select * from `bank_account` where `a_item_name` = '자유저축예금' and `a_balance` >= 1000000;

#실습2-11
select * from `bank_customer` where `c_addr` like '경기도%';

#실습2-12
select * from `bank_customer` where `c_dist` = 2;

#실습2-13
select * from `bank_transaction` where `t_dist` = 1;

#실습2-14
select * from `bank_transaction` where `t_dist` = 2 order by `t_amount` desc;

#실습2-15
select
	sum(`t_amount`) as `입금총합`,
    avg(`t_amount`) as `입금평균`
from `bank_transaction`
where `t_dist` = 1;

#실습2-16
select 
	max(`t_amount`) as `큰 금액`,
    min(`t_amount`) as `작은 금액`
from `bank_transaction`
where `t_dist` = 2;

#실습2-17
select * from `bank_account` where `a_item_dist` = 'S1' order by `a_balance` desc;

#실습2-18
select * from `bank_account` where `a_item_dist` = 'S1' order by `a_balance` desc limit 1;

#실습2-19
select * from `bank_transaction` where `t_dist` = 1 or `t_dist` = 2 order by `t_dist`, `t_amount` desc;

#실습2-20
select 
	count(case when `t_dist` = 1 then 1 end) as `입금 건수`,
    count(case when `t_dist` = 2 then 1 end) as `출금 건수`,
    count(case when `t_dist` = 3 then 1 end) as `조회 건수`
from `bank_transaction`;

#실습2-21
select 
	`t_dist`,
    case 
		when `t_dist` = 1 then '입금' 
		when `t_dist` = 2 then '출금'
		when `t_dist` = 3 then '조회'
    end as 'type',
    `t_a_no`,
    `t_amount`
from `bank_transaction`;
    
#실습2-22
select `t_dist`, count(`t_no`) from `bank_transaction` group by `t_dist`;

#실습2-23
select `t_a_no`, `t_dist`, sum(`t_amount`)
from `bank_transaction`
where `t_dist` = 1
group by `t_a_no` order by `t_a_no`;

#실습2-24
select 
	`t_a_no`, 
    `t_dist`,
    sum(`t_amount`) as `합계`
from `bank_transaction`
where `t_dist` = 1 and `t_amount` >= 100000
group by `t_a_no`
order by `합계` desc;

#실습2-25


#실습2-26


#실습2-27
#실습2-28
#실습2-29
#실습2-30
