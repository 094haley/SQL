
SELECT * FROM `km_member_terms`;


CREATE TABLE `km_cs_qna_board` (
	`no` 			INT AUTO_INCREMENT PRIMARY KEY,
	`parent` 	INT DEFAULT 0,
	`comment` 	INT DEFAULT 0,
	`cate1` 		VARCHAR(20),
	`cate2` 		VARCHAR(20),
	`title` 		VARCHAR(255),
	`content` 	TEXT NOT NULL,
	`uid` 		VARCHAR(20) NOT NULL, 
	`regip` 		VARCHAR(100) NOT NULL,
	`rdate` 		DATETIME NOT null
);

CREATE TABLE `km_cs_notice_board` (
	`no` 			INT AUTO_INCREMENT PRIMARY KEY,
	`cate` 		TINYINT,
	`title` 		VARCHAR(255),
	`content` 	TEXT NOT NULL,
	`uid` 		VARCHAR(20) NOT NULL, 
	`regip` 		VARCHAR(100) NOT NULL,
	`rdate` 		DATETIME NOT null
);


CREATE TABLE `km_cs_qna_cate` (
	`cate1` TINYINT,
	`cate2` TINYINT,
	`c2Name` VARCHAR(20)
);

ALTER TABLE `km_cs_qna_cate` ADD COLUMN `c1Name` VARCHAR(20);
ALTER TABLE `km_cs_qna_cate` MODIFY COLUMN `c1Name` VARCHAR(20) AFTER `cate1`;

SELECT COUNT(`no`) FROM `km_cs_qna_board` WHERE `parent` = 0 AND `cate1`=1; 

INSERT INTO `km_cs_qna_board` (`cate1`,`cate2`, `title`, `content`, `uid`, `regip`, `rdate`)
SELECT `cate1`, `cate2`, `title`, `content`, `uid`, `regip`, `rdate` FROM `km_cs_qna_board`
WHERE `cate1` = 1;

SELECT * FROM `km_cs_qna_cate` WHERE `cate1`=2;


SELECT COUNT(`prodNo`) FROM `km_product` WHERE `prodCate1`=18 AND `prodCate2`=10;



SELECT a.*, b.c2Name  FROM `km_cs_qna_board` AS a 
JOIN `km_cs_qna_cate` AS b
ON a.cate1 = b.cate1 AND a.cate2 = b.cate2
WHERE `parent`= 0 AND a.`cate1`=1 ORDER BY `no` DESC LIMIT 0,10;


JOIN (SELECT * FROM `km_cs_qna_cate` WHERE `cate1`=2) AS b 
ON a.cate2 = b.`cate2`
WHERE `parent`=0 AND a.`cate1`=2 ORDER BY `no` DESC LIMIT 1,10;


SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice`
FROM `km_product` AS a WHERE `prodCate1`=18 AND `prodCate2`=10 
ORDER BY `price` ASC LIMIT 0, 10;


SELECT * FROM `km_product` WHERE `prodCate1`=18 AND `prodCate2`=10 ORDER BY `price` ASC;
SELECT * FROM `km_product` WHERE `prodCate1`=18 AND `prodCate2`=10 ORDER BY `price` DESC;
SELECT * FROM `km_product` WHERE `prodCate1`=18 AND `prodCate2`=10 ORDER BY `score` DESC;
SELECT * FROM `km_product` WHERE `prodCate1`=18 AND `prodCate2`=10 ORDER BY `review` DESC;
SELECT * FROM `km_product` WHERE `prodCate1`=18 AND `prodCate2`=10 ORDER BY `rdate` DESC;


SELECT a.c1Name, b.c2Name FROM `km_product_cate1` AS a
JOIN `km_product_cate2` AS b
ON a.cate1 = b.cate1 WHERE b.cate1 = 10 AND b.cate2 = 10;


SELECT * FROM `km_product` WHERE `prodCate1`=18 AND `prodCate2`=10 ORDER BY `sold` DESC;

SELECT a.c1Name, b.c2Name FROM `km_product_cate1` AS a
JOIN `km_product_cate2` AS b
ON a.cate1 = b.cate1 WHERE b.cate1=10 AND b.cate2=11

SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice` FROM `km_product` AS a WHERE `prodCate1`=18 AND `prodCate2`=14 ORDER BY 'rdate' DESC LIMIT 0, 10
SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice` FROM `km_product` AS a WHERE `prodCate1`=18 AND `prodCate2`=14 ORDER BY 'lowprice' DESC LIMIT 0, 10
SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice` FROM `km_product` AS a WHERE `prodCate1`=18 AND `prodCate2`=14 ORDER BY `price` DESC LIMIT 0, 10


/* 쿼리 복사 */

INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`)
SELECT (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) FROM `km_product`
WHERE `prodCate1` = 18 AND `prodCate2` = 14;

INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) VALUES (18, 14, '한국 닌텐도 선불카드 30000원', '닌텐도 선불카드', '코드바이', 'carrot112', 30000, 10, 300, 555, 46, 0, 66, 1, 6, '4c9bdaa3-eab1-46f2-95fe-8bd3ab81e816.png', '9ff28cc6-02a0-4078-8780-176b9d95f413.png', '234886b9-faeb-45c0-ba86-50e703291ed7.png', '8790d95e-c933-4f09-9762-a3e02ed47801.png', '새상품', '과세상품', '발행가능', '사업자 판매자', '국내산', '61.34.107.92', '2022-12-15 05:52:55', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) VALUES (18, 14, '코스트코상품권 10만원권/회원대용/배송비 1번만 부과', '코스트코 상품권', '(주)엑스솔루션', 'carrot112', 100000, 10, 1000, 400, 87, 0, 39, 5, 94, 'f0115786-b19f-4d37-9e59-974c8f82e617.png', 'b5da111b-26bb-4d39-8d71-9e0933f3b717.png', '761c2aef-0d7a-4392-8b12-fa18f2470e65.png', 'ef09e785-80b5-4d85-8178-86f910ea8f05.png', '새상품', '과세상품', '발행가능', '사업자 판매자', '국내산', '61.34.107.92', '2022-12-15 05:53:37', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) VALUES (18, 14, '신용카드/신세계백화점상품권/롯데/현대 10만원권', '신세계 상품권', '세일티켓', 'carrot112', 100000, 10, 1000, 500, 94, 0, 96, 5, 53, 'ac0d7d59-b521-4875-9497-988261487787.jpg', 'de754ea1-5103-474d-875a-73912f60cd5b.jpg', 'dace732f-4cf6-4600-83bd-28d58f595634.jpg', '6e185502-feb4-4b12-a223-4644abc5b99a.png', '새상품', '과세상품', '발행가능', '사업자 판매자', '국내산', '61.34.107.92', '2022-12-15 05:54:40', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) VALUES (18, 14, 'CJ 기프트카드 5만원 (CJONE 앱전용) 핀번호 문자전송', 'CJ 기프트카드', 'EARLYSOFT', 'carrot112', 50000, 5, 500, 300, 10, 0, 61, 5, 80, '5a0fcfc3-a031-4e84-8c45-790859665311.jpg', 'd6bc678b-8aba-46e0-82b0-92d418882149.jpg', '126f14c2-e1aa-4d48-ad99-76718a7e9b77.jpg', '02584f84-8f4a-40cc-b6b5-d26f90d90c1f.jpg', '새상품', '과세상품', '발행가능', '사업자 판매자', '국내산', '61.34.107.92', '2022-12-15 05:55:25', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) VALUES (18, 14, '신용카드/현대/롯데/신세계/백화점상품권/10만원', '백화점 상품권', '에누리티켓', 'carrot112', 100000, 10, 1000, 980, 69, 0, 15, 4, 44, '25940344-abbc-4624-a577-e956ac48aed0.jpg', 'af9dd3c2-b6c2-4374-8b08-6ea30f2ec687.jpg', '59643dde-3f17-42ab-902b-6975df5c4ed6.jpg', '55a03235-c502-45bc-bda3-f1f50516ab6c.jpg', '새상품', '과세상품', '발행가능', '사업자 판매자', '국내산', '61.34.107.92', '2022-12-15 05:56:10', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) VALUES (18, 14, '(10만)갤러리아/국민관광/이랜드백화점상품권', '백화점/마트 상품권', '(주)엑스솔루션', 'carrot112', 100000, 10, 1000, 357, 13, 0, 95, 5, 77, '09356883-27e8-42e8-97ef-07e4e231762e.png', 'c5686b58-1047-47e7-bbfc-b2e7dbce5966.png', 'f60fbc86-45e9-4a58-a02b-4fba68ff0630.png', '516ab6f9-1233-45eb-a812-a2570554a11f.png', '새상품', '과세상품', '발행가능', '사업자 판매자', '국내산', '61.34.107.92', '2022-12-15 05:56:49', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) VALUES (18, 14, '일본 아이튠즈 기프트 카드 10000엔', '아이튠즈 기프트카드', '코드바이', 'carrot112', 100000, 0, 1000, 400, 58, 0, 29, 4, 53, '3830682c-1fd6-457c-b0ab-4e3d87cb8b9a.png', '6cf62bb1-066d-476a-a2d7-e5349b9a8925.png', 'a3dd41d8-9830-4d70-b947-7d4a68ac7a13.png', 'db851e81-de4d-4b0a-a20f-d8171e90d0cb.png', '새상품', '과세상품', '발행가능', '사업자 판매자', '국내산', '61.34.107.92', '2022-12-15 05:57:39', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) VALUES (18, 14, '신용카드/기프트카드 상품권 /기프트카드/국민/BC/비씨/50만', '기프트카드 상품권', '에누리티켓', 'carrot112', 500000, 10, 5000, 999, 50, 0, 60, 5, 34, '1821e4cf-d7e1-47c2-b198-85870d98acde.jpg', '456adc2e-1b86-4553-bfdc-944e6896dfb2.jpg', '35d7b534-0fbf-4aa8-aa76-42605b8a5fe2.jpg', '3a0549c4-8e5d-45dd-b60f-8e4dc606eb7c.jpg', '새상품', '과세상품', '발행가능', '사업자 판매자', '국내산', '61.34.107.92', '2022-12-15 05:58:26', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) VALUES (18, 14, '바이킹스워프 식사권/1인식사권(110달러)/씨푸드', '식사이용권', '제일티켓', 'carrot112', 137000, 15, 1370, 999, 75, 0, 13, 5, 11, '8000bb8c-1caa-4d43-9040-dc5027060a6c.jpg', 'b6a084d1-beca-4406-ab42-a6d4312f8708.jpg', '46196d6e-ffe5-4042-8343-6b7fbdbe816d.jpg', 'afbdd4f2-ad14-4b5d-8ce4-597b44eafb6a.png', '새상품', '과세상품', '발행가능', '사업자 판매자', '국내산', '61.34.107.92', '2022-12-15 05:59:09', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `km_product` (`prodCate1`, `prodCate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`, `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`, `etc1`, `etc2`, `etc3`, `etc4`, `etc5`) VALUES (18, 14, 'SK주유권/GS/현대오일/주유권/주유상품권/5만원', 'SK주유이용권', '세일티켓', 'carrot112', 50000, 10, 500, 500, 23, 0, 84, 2, 53, '0a9ee126-0cb3-4f5b-b912-60a0f067dfc5.jpg', '7ca2749a-3609-4aa4-a268-b1b102cba6f7.jpg', 'cce188be-204c-48ef-bec7-91337c9a5978.jpg', '0c650f71-5f16-44ca-8f68-78cb14b3e88b.png', '새상품', '과세상품', '발행가능', '사업자 판매자', '국내산', '61.34.107.92', '2022-12-15 06:00:07', NULL, NULL, NULL, NULL, NULL);


SELECT *, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice`,
DATE_ADD(NOW(), INTERVAL 3 DAY) AS `deliveryDate`
FROM `km_product` WHERE `prodNo` = 1000375;
