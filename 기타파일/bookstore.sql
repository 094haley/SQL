
insert into `Publisher` values ('동아출판사', '홍길동', '051-1234-1001');
insert into `Publisher` values ('그린출판사', '김유신', '051-1234-1002');
insert into `Publisher` values ('행복출판사', '김춘추', '051-1234-1003');
insert into `Publisher` values ('점프출판사', '장보고', '051-1234-1004');

insert into `Book` values (101, '그리스로마신화', '10000', '동아출판사');
insert into `Book` values (102, '공룡백과사전', '8000', '동아출판사');
insert into `Book` values (103, '자바스프링', '7000', '그린출판사');
insert into `Book` values (104, '자바의정석', '13000', '행복출판사');
insert into `Book` values (105, '원피스', '4500', '점프출판사');

insert into `Customer` values ( 001, '최승철', '010-1234-1001', '대구광역시');
insert into `Customer` values ( 002, '홍지수', '010-1234-1002', '서울특별시');
insert into `Customer` values ( 003, '윤정한', '010-1234-1003', '서울특별시');

insert into `Order` values (1, 001, 101, 10000, now());
insert into `Order` values (2, 002, 103, 7000, now());
insert into `Order` values (3, 003, 105, 4500, now());