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
HAVING  (MIN(b.room_price) BETWEEN 0 AND 50000)


SELECT * FROM `lemo_product_room` WHERE MIN(room_price) BETWEEN 0 AND 50000









