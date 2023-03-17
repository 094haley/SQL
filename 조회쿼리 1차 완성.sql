
SELECT * FROM (
SELECT *, ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY a.room_price, IFNULL(a.empty_room_stock, a.room_stock) desc) 'top1'
FROM(
SELECT a.acc_id 'acc_id', a.acc_name, a.accType_no ,a.acc_addr, a.acc_addrDetail, a.acc_longtitude, a.acc_lattitude,
 a.acc_xy, a.acc_mainInfo, a.acc_info, a.acc_comment, a.acc_thumbs, a.acc_rate, a.acc_review,
r.room_maxNum 'room_maxNum', r.room_id, r.room_price 'room_price', r.room_stock 'room_stock', IFNULL(b.empty_room_stock, r.room_stock) as 'empty_room_stock',
ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY r.room_price, IFNULL(b.empty_room_stock, r.room_stock) desc) 'top',
SUM(IFNULL(b.empty_room_stock, r.room_stock)) OVER(PARTITION BY a.acc_id) 'sum_room_stock'
FROM `lemo_product_accommodation` a
JOIN    `lemo_product_room` r ON a.acc_id = r.acc_id
LEFT JOIN (
    SELECT a.acc_id 'acc_id', r.room_id 'room_id', (r.room_stock - COUNT(rero.rero_id)) 'empty_room_stock' FROM `lemo_product_accommodation` a
    JOIN    `lemo_product_room` r ON a.acc_id = r.acc_id
    JOIN    `lemo_product_reserved_room` rero ON r.room_id = rero.room_id AND r.acc_id = rero.acc_id
    WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000 AND
                                            (rero.rero_checkOut_date > '2023-03-04' AND rero.rero_checkIn_date < '2023-03-07')
    GROUP BY a.`acc_id`, r.room_id
    ) b
ON a.acc_id = b.acc_id AND r.room_id = b.room_id
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000
ORDER BY a.acc_id) a
WHERE a.empty_room_stock <>0 OR (a.sum_room_stock = 0 AND a.top = 1)
) a
WHERE a.top1 = 1;



SELECT *, ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY a.room_price, IFNULL(a.empty_room_stock, a.room_stock) desc) 'top1'
FROM(
SELECT a.acc_id 'acc_id', a.acc_name, a.accType_no ,a.acc_addr, a.acc_addrDetail, a.acc_longtitude, a.acc_lattitude,
 a.acc_xy, a.acc_mainInfo, a.acc_info, a.acc_comment, a.acc_thumbs, a.acc_rate, a.acc_review,
r.room_maxNum 'room_maxNum', r.room_id, r.room_price 'room_price', r.room_stock 'room_stock', IFNULL(b.empty_room_stock, r.room_stock) as 'empty_room_stock',
ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY r.room_price, IFNULL(b.empty_room_stock, r.room_stock) desc) 'top',
SUM(IFNULL(b.empty_room_stock, r.room_stock)) OVER(PARTITION BY a.acc_id) 'sum_room_stock'
FROM `lemo_product_accommodation` a
JOIN    `lemo_product_room` r ON a.acc_id = r.acc_id
LEFT JOIN (
    SELECT a.acc_id 'acc_id', r.room_id 'room_id',(r.room_stock - COUNT(rero.rero_id)) 'empty_room_stock' FROM `lemo_product_accommodation` a
    JOIN    `lemo_product_room` r ON a.acc_id = r.acc_id
    JOIN    `lemo_product_reserved_room` rero ON r.room_id = rero.room_id AND r.acc_id = rero.acc_id
    WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000 AND
                                            (rero.rero_checkOut_date > '2023-03-04' AND rero.rero_checkIn_date < '2023-03-07')
    GROUP BY a.`acc_id`, r.room_id
    ) b
ON a.acc_id = b.acc_id AND r.room_id = b.room_id
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000
ORDER BY a.acc_id) a
WHERE a.empty_room_stock <>0 OR (a.sum_room_stock = 0 AND a.top = 1)



#####################################################################################


SELECT a.*, t.accType_type, c.rp_offSeason_weekday, c.rp_offSeason_weekend, c.rp_peakSeason_weekday, c.rp_peakSeason_weekend FROM (
SELECT *, ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY a.room_price, IFNULL(a.empty_room_stock, a.room_stock) desc) 'order'
FROM(
SELECT a.acc_id 'acc_id', a.user_id, a.acc_name, a.accType_no, a.province_no, a.acc_city, a.acc_zip, a.acc_addr, a.acc_addrDetail, a.acc_longtitude, a.acc_lattitude,
 a.acc_xy, a.acc_mainInfo, a.acc_info, a.acc_comment, a.acc_thumbs, a.acc_rate, a.acc_review, a.acc_season
r.room_maxNum 'room_maxNum', r.room_id, r.room_price 'room_price', r.room_stock 'room_stock', IFNULL(b.empty_room_stock, r.room_stock) as 'empty_room_stock',
ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY r.room_price, IFNULL(b.empty_room_stock, r.room_stock) desc) 'top',
SUM(IFNULL(b.empty_room_stock, r.room_stock)) OVER(PARTITION BY a.acc_id) 'sum_room_stock'
FROM `lemo_product_accommodation` a
JOIN    `lemo_product_room` r ON a.acc_id = r.acc_id
LEFT JOIN (
    SELECT a.acc_id 'acc_id', r.room_id 'room_id', (r.room_stock - COUNT(rero.rero_id)) 'empty_room_stock' FROM `lemo_product_accommodation` a
    JOIN    `lemo_product_room` r ON a.acc_id = r.acc_id
    JOIN    `lemo_product_reserved_room` rero ON r.room_id = rero.room_id AND r.acc_id = rero.acc_id
    WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000 AND
                                            (rero.rero_checkOut_date > null AND rero.rero_checkIn_date < null)
    GROUP BY a.`acc_id`, r.room_id
    ) b
ON a.acc_id = b.acc_id AND r.room_id = b.room_id
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 5000
ORDER BY a.acc_id) a 
WHERE (a.empty_room_stock != 0 OR (a.sum_room_stock = 0 AND a.top = 1))
) a 
JOIN `lemo_product_accommodationtype` t ON a.accType_no = t.accType_no
LEFT JOIN `lemo_product_ratepolicy` c ON a.acc_id = c.acc_id 
WHERE a.order = 1




SELECT *, ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY a.room_price, IFNULL(a.empty_room_stock, a.room_stock) desc) 'top1'
FROM(
SELECT a.acc_id 'a.acc_id', a.acc_name, a.accType_no ,a.acc_addr, a.acc_addrDetail, a.acc_longtitude, a.acc_lattitude,
 a.acc_xy, a.acc_mainInfo, a.acc_info, a.acc_comment, a.acc_thumbs, a.acc_rate, a.acc_review,
r.room_maxNum 'room_maxNum', r.room_id, r.room_price 'room_price', r.room_stock 'room_stock', IFNULL(b.empty_room_stock, r.room_stock) as 'empty_room_stock',
ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY r.room_price, IFNULL(b.empty_room_stock, r.room_stock) desc) 'top',
SUM(IFNULL(b.empty_room_stock, r.room_stock)) OVER(PARTITION BY a.acc_id) 'sum_room_stock', c.*
FROM `lemo_product_accommodation` a
JOIN    `lemo_product_room` r ON a.acc_id = r.acc_id
LEFT JOIN (
    SELECT a.acc_id 'acc_id', r.room_id 'room_id',(r.room_stock - COUNT(rero.rero_id)) 'empty_room_stock' FROM `lemo_product_accommodation` a
    JOIN    `lemo_product_room` r ON a.acc_id = r.acc_id
    JOIN    `lemo_product_reserved_room` rero ON r.room_id = rero.room_id AND r.acc_id = rero.acc_id
    WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000 AND
                                            (rero.rero_checkOut_date > '2023-03-18' AND rero.rero_checkIn_date < '2023-03-20')
    GROUP BY a.`acc_id`, r.room_id
    ) b
ON a.acc_id = b.acc_id AND r.room_id = b.room_id
LEFT JOIN `lemo_product_ratepolicy` c ON a.acc_id = c.acc_id
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000
ORDER BY a.acc_id) a
WHERE a.empty_room_stock <>0 OR (a.sum_room_stock = 0 AND a.top = 1);