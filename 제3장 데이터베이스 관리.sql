#날짜 : 2022/08/25
#이름 : 이해빈
#내용 : 제3장 데이터베이스 관리

#실습 3-1
create database `java2_Test_db`;
create user 'java2_tester'@'%' identified by '1234';
grant all privileges on `java2_test_db`.* to 'java2_tester'@'%';
flush privileges;

#실습 3-2
alter user 'java2_tester'@'%' identified by '12345';

drop user 'java2_tester'@'%';

flush privileges;

