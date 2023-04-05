select
 *
FROM(
SELECT a.acc_id, r.room_id, r.room_price, r.room_stock, IFNULL(b.empty_room_stock, r.room_stock) as 'empty_room_stock', 
ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY r.room_price) 'top'
FROM `lemo_product_accommodation` a
JOIN	`lemo_product_room` r ON a.acc_id = r.acc_id
LEFT JOIN (
	SELECT a.acc_id 'acc_id', r.room_id 'room_id', (r.room_stock - COUNT(rero.rero_id)) 'empty_room_stock' FROM	`lemo_product_accommodation` a
	JOIN	`lemo_product_room` r ON a.acc_id = r.acc_id
	JOIN	`lemo_product_reserved_room` rero ON r.room_id = rero.room_id AND r.acc_id = rero.acc_id
	WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000 AND
	 										(rero.rero_checkOut_date > '2023-03-04' AND rero.rero_checkIn_date < '2023-03-07')
	GROUP BY a.`acc_id`, r.room_id
	) b
ON a.acc_id = b.acc_id AND r.room_id = b.room_id
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000  
AND (b.empty_room_stock <> 0 OR b.b.empty_room_stock is NULL) 
ORDER BY a.acc_id) a
WHERE a.top = 1;




select
 *
FROM(
SELECT a.acc_id, r.room_maxNum 'room_maxNum', r.room_id, r.room_price, r.room_stock, IFNULL(b.empty_room_stock, r.room_stock) as 'empty_room_stock',
ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY r.room_price) 'top'
FROM `lemo_product_accommodation` a
JOIN	`lemo_product_room` r ON a.acc_id = r.acc_id
LEFT JOIN (
	SELECT a.acc_id 'acc_id', r.room_id 'room_id', (r.room_stock - COUNT(rero.rero_id)) 'empty_room_stock' FROM	`lemo_product_accommodation` a
	JOIN	`lemo_product_room` r ON a.acc_id = r.acc_id
	JOIN	`lemo_product_reserved_room` rero ON r.room_id = rero.room_id AND r.acc_id = rero.acc_id
	WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000 AND
	 										(rero.rero_checkOut_date > '2023-03-04' AND rero.rero_checkIn_date < '2023-03-07')
	GROUP BY a.`acc_id`, r.room_id
	) b
ON a.acc_id = b.acc_id AND r.room_id = b.room_id
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000
ORDER BY a.acc_id) a




SELECT a.acc_id, r.room_id, r.room_price, r.room_stock, MAX(IFNULL(b.empty_room_stock, r.room_stock)) as 'max',
ROW_NUMBER() OVER(PARTITION BY a.acc_id ORDER BY r.room_price) 'top'
FROM `lemo_product_accommodation` a
JOIN	`lemo_product_room` r ON a.acc_id = r.acc_id
LEFT JOIN (
	SELECT a.acc_id 'acc_id', r.room_id 'room_id', (r.room_stock - COUNT(rero.rero_id)) 'empty_room_stock' FROM	`lemo_product_accommodation` a
	JOIN	`lemo_product_room` r ON a.acc_id = r.acc_id
	JOIN	`lemo_product_reserved_room` rero ON r.room_id = rero.room_id AND r.acc_id = rero.acc_id
	WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000 AND
	 										(rero.rero_checkOut_date > '2023-03-04' AND rero.rero_checkIn_date < '2023-03-07')
	GROUP BY a.`acc_id`, r.room_id
	) b
ON a.acc_id = b.acc_id AND r.room_id = b.room_id
WHERE ST_Distance_Sphere(`acc_xy`, ST_GEOMFROMTEXT('POINT(128.088191820627000 35.190927571862600)')) <= 1000
GROUP BY a.acc_id
ORDER BY a.acc_id;

