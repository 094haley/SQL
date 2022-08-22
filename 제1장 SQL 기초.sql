#날짜 : 2022/08/22
#이름 : 이해빈
#내용 : 제1장 SQL 기초

#실습1-1
create database `UserDB`;
drop database `UserDB`;

#실습1-2
create table `User1` (
	`uid`  varchar(10),
    `name` varchar(10),
    `hp`   char(13),
    `age`  int
);

drop table `User1`;

#실습1-3
insert into `User1` values ('A101', '김유신', '010-1234-1111', 25);
insert into `User1` values ('A102', '김춘추', '010-1234-2222', 23);
insert into `User1` values ('A103', '장보고', '010-1234-3333', 32);
insert into `User1` (`uid`, `name`, `age`) values ('A104', '강감찬', 45);
insert into `User1` set
                   `uid`='A105',
                   `name`='이순신',
                   `hp`='010-1234-5555';

#실습1-4
select * from `User1`;
select * from `User1` where `uid`='A101';
select * from `User1` where `name`='김춘추';
select * from `User1` where `age` < 30;
select * from `User1` where `age` >= 30;
select `uid`, `name`, `age` from `User1`;

#실습1-5
update `User1` set `hp`='010-1234-4444' where `uid`='A104';
update `User1` set `age`=51 where `uid`='A105';
update `User1` set
				`hp`='010-1234-1001',
				`age`=27
			where
				`uid`='A101';   
                
#실습1-6
delete from `User1` where `uid`='A101';
delete from `User1` where `uid`='A102' and `age`=23;
delete from `User1` where `age`>=30;

#실습1-7
#실습1-8
#실습1-9