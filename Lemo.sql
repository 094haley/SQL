/* lemo 쿼리 */

# 데이터 삽입
# ST_GeomFromText('POINT(경도 위도)')
INSERT INTO `search_by_coordinates` (`xy`) 

VALUES (ST_GeomFromText('POINT(128.88940080059663 35.228550792631175)'));


# 데이터 조회
#  ST_AsText : Binary 데이터로 저장된 POINT 타입을 문자열로 바꿔준다
SELECT 
	`pno` '번호', 
	`name` '장소', 
	`LONGTITUDE` AS '경도', 
	`LATITUDE`  '위도', 
	ST_AsText (`xy`) AS '좌표' 
FROM `search_by_coordinates`;

# 반경으로 검색하기
# WHERE문의 숫자는 기준 좌표로부터의 반경값을 입력(m단위)
SELECT * 
FROM `search_by_coordinates`
WHERE ST_Distance_Sphere(`xy`, ST_GeomFromText('POINT(129.059529 35.157875)')) <= 17000;


# 모서리 좌표 값을 이용한 검색하기
# ST_GeomFromText('LineString(남서좌표, 북동좌표)')
SELECT 
	`pno` '번호', 
	`name` '장소', 
	`LONGTITUDE` AS '경도', 
	`LATITUDE`  '위도', 
	ST_AsText (`xy`) AS '좌표' 
from `search_by_coordinates` 
WHERE MBRContains(ST_GeomFromText('LineString(129.03060372697024 35.13580474054441, 129.11081371521917 35.16456822146159)'), `xy`)


# 경성대
최종 경도 : 129.09738589504354
최종 위도 : 35.1388730416101


# 숙소 반경 검색
SELECT * FROM `lemo_product_accommodation` 
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(129.09738589504354 35.1388730416101)')) <= 50000;

# 숙소 join
SELECT a.*, SUM(b.room_stock) AS 'sum', MIN(b.room_price) AS 'price'   FROM `lemo_product_accommodation` AS a
JOIN `lemo_product_room` AS b 
ON a.acc_id = b.acc_id AND ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(129.09738589504354 35.1388730416101)')) <= 5000
GROUP BY a.acc_id
LIMIT 0, 10;
;



# 랜덤 쿼리 
UPDATE `lemo_product_room` set `room_stock`= CEILING(RAND()*3)+2;
UPDATE `lemo_product_room` set `room_maxNum`= CEILING(RAND()*3)+1;
UPDATE `lemo_product_accommodation` set `acc_review`= CEILING(RAND()*500)+500;
UPDATE `lemo_product_accommodation` set `acc_rate`= CEILING(RAND()*6)+4;

# 기본 목록 검색
SELECT * FROM `lemo_product_accommodation` AS a
JOIN `lemo_product_room` AS b 
on a.acc_id = b.acc_id WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(129.09738589504354 35.1388730416101)')) <= 1000
GROUP BY a.acc_id;

# total 
SELECT COUNT(DISTINCT a.acc_id) FROM `lemo_product_accommodation` AS a
JOIN `lemo_product_room` AS b 
ON a.acc_id = b.acc_id AND ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(129.09738589504354 35.1388730416101)')) <= 5000


SELECT COUNT(a.acc_id) FROM `lemo_product_accommodation` AS a
JOIN `lemo_product_room` AS b
ON a.`acc_id` = b.`acc_id` AND ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(129.09738589504354 35.1388730416101)')) <= 5000
GROUP BY a.`acc_id`

ORDER BY ST_DISTANCE_SPHERE(a.`acc_xy`, ST_GEOMFROMTEXT('POINT(129.09738589504354 35.1388730416101)')) asc



SELECT COUNT(DISTINCT a.acc_id) FROM `lemo_product_accommodation` AS a
JOIN (SELECT * FROM `lemo_product_room` WHERE room_price BETWEEN 0 AND 50000) AS b
ON a.`acc_id` = b.`acc_id`
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(129.09738589504354 35.1388730416101)')) <= 5000


GROUP BY a.`acc_id`
HAVING  (MIN(b.room_price) BETWEEN 0 AND 50000


SELECT * FROM `lemo_product_room` WHERE MIN(room_price) BETWEEN 0 AND 50000



SELECT *
FROM `lemo_product_accommodation` AS a
JOIN `lemo_product_room` AS b
ON a.`acc_id` = b.`acc_id`
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(129.09738589504354 35.1388730416101)')) <= 1000
GROUP BY a.`acc_id`



HAVING  (MIN(b.room_price) BETWEEN 0 AND 50000)



/* 남은 객실 갯수 총합 */
SELECT COUNT(b.room_stock)
FROM `lemo_product_accommodation` AS a
JOIN `lemo_product_room` AS b
ON a.`acc_id` = b.`acc_id`
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(129.09738589504354 35.1388730416101)')) <= 1000
GROUP BY a.`acc_id`

SELECT *
FROM `lemo_product_accommodation` AS a
JOIN `lemo_product_room` AS b
ON a.`acc_id` = b.`acc_id`
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(129.09738589504354 35.1388730416101)')) <= 1000
GROUP BY a.`acc_id`



INSERT INTO `lemo_product_reserved_room` (`res_no`, `room`)



SELECT *
FROM `lemo_product_accommodation` AS a
JOIN `lemo_product_room` AS b
ON a.`acc_id` = b.`acc_id`
WHERE MBRContains(ST_GEOMFROMTEXT('LineString(128.95920227695035 35.00000601703598, 129.25054302968204 35.398653663767334)'), `acc_xy`)
GROUP BY a.`acc_id`

MBRContains(ST_GeomFromText('LineString(129.03060372697024 35.13580474054441, 129.11081371521917 35.16456822146159)'), `xy`)


INSERT INTO `lemo_product_reservation` 
VALUES('2303140000000003', 1004299, 1015514, '1000hyeok0819@naver.com',50000,5000,'김당근','010-1234-1111',1,
NOW(),'2023-03-20','2023-03-27',1,'test')

SELECT a.acc_id, d.room_id
FROM `lemo_product_accommodation` AS a
JOIN (SELECT b.room_stock FROM `lemo_product_room` AS b
		JOIN `lemo_product_reservation` AS c
		ON b.room_id = c.room_id) AS d
ON a.`acc_id` = d.`acc_id`
WHERE MBRContains(ST_GEOMFROMTEXT('LineString(128.95920227695035 35.00000601703598, 129.25054302968204 35.398653663767334)'), `acc_xy`)
GROUP BY a.`acc_id`

14,15,16
SELECT COUNT(b.`room_id`) FROM `lemo_product_room` AS b
JOIN `lemo_product_reservation` AS c
ON b.room_id = c.room_id 
WHERE `res_checkIn` NOT  BETWEEN ('2023-03-16' AND '2023-03-20')
GROUP BY b.room_id; 


/* 룸 아이디별 예약 갯수 */
SELECT b.room_id, COUNT(b.`room_id`) AS rcount 
FROM `lemo_product_room` AS b JOIN `lemo_product_reservation` AS c
ON b.room_id = c.room_id 
WHERE 
(`res_checkIn` BETWEEN '2023-03-20' AND DATE_SUB('2003-03-27', INTERVAL 1 DAY))
Or (DATE_SUB(`res_checkOut`, INTERVAL 1 DAY) BETWEEN '2023-03-20' AND '2023-03-27')
GROUP BY b.room_id;


SELECT * FROM `lemo_product_room` AS d 
OUTER JOIN 
(SELECT b.room_id, COUNT(b.`room_id`) AS rcount 
FROM `lemo_product_room` AS b JOIN `lemo_product_reservation` AS c
ON b.room_id = c.room_id 
WHERE 
(`res_checkIn` BETWEEN '2023-03-20' AND DATE_SUB('2003-03-27', INTERVAL 1 DAY))
Or (DATE_SUB(`res_checkOut`, INTERVAL 1 DAY) BETWEEN '2023-03-20' AND '2023-03-27')
GROUP BY b.room_id) AS e;