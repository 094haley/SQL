#날짜 : 2022/08/31
#이름 : 이해빈
#내용 : SQL 연습문제3

#실습3-1
create database `java2_College`;
create user 'java2_admin3'@'%' identified by '1234';
grant all privileges on `java2_College`.* to 'java2_admin3'@'%';
flush privileges;

#실습3-2

create table `Student` (
	`stdNo`       char(8) primary key,
    `stdName`     varchar(20) not null,
    `stdHp`       char(13) unique not null,
    `stdYear`     tinyint not null,
    `stdAddress`  varchar(100)
); 

create table `Lecture` (
	`lecNo`       int primary key,
    `lecName`     varchar(20) not null,
    `lecCredit`   tinyint not null,
    `lecTime`     int not null,
    `lecClass`    varchar(10) default null
);

create table `Register` (
	`regStdNo`        char(8) not null,
    `regLecNo`        decimal(5) not null,
    `regMidScore`     tinyint, 
    `regFinalScore`   tinyint,
    `regTotalScore`   tinyint,
    `regGrade`        char(1)
);

#실습3-3
insert into `Student`(`stdNo`, `stdName`, `stdHp`,`stdYear`) values (20201016, '김유신', '010-1234-1001', 3);
insert into `Student` values(20201126, '김춘추', '010-1234-1002', 3, '경상남도 경주시');
insert into `Student` values(20210216, '장보고', '010-1234-1003', 2, '전라남도 완도시');
insert into `Student` values(20210326, '강감찬', '010-1234-1004', 2, '서울시 영등포구');
insert into `Student` values(20220416, '이순신', '010-1234-1005', 1, '부산시 부산진구');
insert into `Student` values(20220521, '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `Lecture` values ( 159, '인지행동심리학', 3, 40, '본304');
insert into `Lecture` values ( 167, '운영체제론', 3, 25, '본B05');
insert into `Lecture` values ( 234, '중급 영문법', 3, 20, '본201');
insert into `Lecture` values ( 239, '세법개론', 3, 40, '본204');
insert into `Lecture` values ( 248, '빅데이터 개론', 3, 20, '본B01');
insert into `Lecture` values ( 253, '컴퓨팅사고와 코딩', 2, 10, '본B02');
insert into `Lecture` values ( 349, '사회복지 마케팅', 2, 50, '본301');

insert into `Register`(`regStdNo`, `regLecNo`) values ( 20201126, 234);
insert into `Register`(`regStdNo`, `regLecNo`) values ( 20201016, 248);
insert into `Register`(`regStdNo`, `regLecNo`) values ( 20201016, 253);
insert into `Register`(`regStdNo`, `regLecNo`) values ( 20201126, 239);
insert into `Register`(`regStdNo`, `regLecNo`) values ( 20210216, 349);
insert into `Register`(`regStdNo`, `regLecNo`) values ( 20210326, 349);
insert into `Register`(`regStdNo`, `regLecNo`) values ( 20201016, 167);
insert into `Register`(`regStdNo`, `regLecNo`) values ( 20220416, 349);

#실습3-4
select * from `Lecture`;

#실습3-5
select * from `Student`;

#실습3-6
select * from `Register`;

#실습3-7
select * from `Student` where `stdYear` = 3;

#실습3-8
select * from `Lecture` where `lecCredit` = 2;

#실습3-9
update `Register` set `regMidScore` = 36, `regFinalScore` = 42 where `regStdNo` = '20201126' and `regLecNo` =234;
update `Register` set `regMidScore` = 24, `regFinalScore` = 62 where `regStdNo` = '20201016' and `regLecNo` =248;
update `Register` set `regMidScore` = 28, `regFinalScore` = 40 where `regStdNo` = '20201016' and `regLecNo` =253;
update `Register` set `regMidScore` = 37, `regFinalScore` = 57 where `regStdNo` = '20201126' and `regLecNo` =239;
update `Register` set `regMidScore` = 28, `regFinalScore` = 68 where `regStdNo` = '20210216' and `regLecNo` =349;
update `Register` set `regMidScore` = 16, `regFinalScore` = 65 where `regStdNo` = '20210326' and `regLecNo` =349;
update `Register` set `regMidScore` = 18, `regFinalScore` = 38 where `regStdNo` = '20201016' and `regLecNo` =167;
update `Register` set `regMidScore` = 25, `regFinalScore` = 58 where `regStdNo` = '20220416' and `regLecNo` =349;

#실습3-10
update `Register` 
set 
	`regTotalScore` = `regMidScore` + `regFinalScore`,
	`regGrade` = if(`regTotalScore` >=90, 'A', 
				 if(`regTotalScore` >=80, 'B', 
                 if(`regTotalScore` >=70, 'C', 
                 if(`regTotalScore` >=60, 'D', 'F'))));

select * from `Register`;

#실습3-11
select * from `Register` order by `regTotalScore` desc;

#실습3-12
select * from `Register` where `regLecNO` = 349 order by `regMidScore` desc;

#실습3-13
select * from `Lecture` where `lecTime` >= 30;

#실습3-14
select `lecName`, `lecClass` from `Lecture`;

#실습3-15
select `stdNo`, `stdName` from `Student`;

#실습3-16
select * from `Student` where `stdAddress` is null;

#실습3-17
select * from `Student` where `stdAddress` like '부산시%';

#실습3-18
select * from `Student` as a 
left join `Register` as b on a.stdNo = b.regStdNo;

#실습3-19
select 
	`stdNo`,
    `stdName`,
    `regLecNo`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Student` as a, `Register` as b 
where a.stdNo = b.regStdNo order by `stdNo`;

#실습3-20
select `stdName`, `stdNo`, `regLecNo`
from `Student` as a
join `Register` as b on a.stdNO = b.regStdNo
where `reglecNo` = 349;

#실습3-21
select 
	`stdNo`,
    `stdName`,
    count(`stdNo`) as `수강신청건수`,
    sum(`regTotalScore`) as `종합점수`,
    sum(`regTotalScore`) / count(`stdNo`) as `평균`
from `Student` as a
join `Register` as b
on a.stdNo = b.regStdNo 
group by `stdNo` order by `stdNo`;

#실습3-22
select * from `Register` as a
join `Lecture` as b on a.regLecNO = b.lecNo;

#실습3-23
select 
	`regStdNo`,
    `regLecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Register` as a
join `Lecture` as b on a.regLecNO = b.lecNo;

#실습3-24
select 
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
from `Register` as a join `Lecture` as b on a.regLecNO = b.lecNo
where `regLecNo` = 349;

#실습3-25
select 
	`regStdNo`,
    `lecName`
from `Register`as a join `Lecture` as b on a.regLecNO = b.lecNo
where `regGrade` = 'A';

#실습3-26
select * from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo order by stdNo;

#실습3-27
select
	`stdNo`,
    `stdName`,
    `lecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
order by `regTotalScore` desc;

#실습3-28
select 
	`stdNo`,
    `stdName`,
    `lecName`,
    `regTotalScore`,
    `regGrade`
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
where `regGrade` = 'F';

#실습3-29
select
	`stdNo`,
    `stdName`,
    sum(`lecCredit`) as `이수학점`
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
where `regTotalScore` >= 60
group by `stdNo` order by `stdNo`;


#실습3-30
select 
	`stdNo`,
    `stdName`,
    group_concat(`lecName`) as `신청과목`,
    group_concat(if(`regTotalScore` >= 60, `lecName`, null)) as `이수과목`
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
group by `stdNo`;
