SELECT a.*, b.nick FROM `board_article` AS a
JOIN `board_user` as b
WHERE `parent` = 0
ON a.uid = b.uid
WHERE `parent` = 0
ORDER BY NO DESC
LIMIT 0, 10;


INSERT INTO `board_article` (`title`, `content`, `uid`, `regip`, `rdate`)
SELECT `title`, `content`, `uid`, `regip`, `rdate` FROM `board_article`;

SELECT COUNT(`no`) FROM `board_article` WHERE `parent` = 0;

SELECT a.*, b.fno, b.parent AS pno, b.newName, b.oriName, b.download
FROM `board_article` AS a
LEFT JOIN `board_file` AS b
ON a.`no` = b.`parent`
WHERE `no` =1;

UPDATE `board_article` SET `hit` = `hit` + 1 WHERE `no`=1;

SELECT a.*, b.`nick` FROM `board_article` AS a
JOIN `board_user` AS b
ON a.uid = b.uid
WHERE `parent` = 21 ORDER BY `no` ASC;


SELECT a.*, b.nick FROM `board_article` AS a
JOIN `board_user` AS b using(`uid`)
WHERE `parent`!=0 ORDER BY `no` DESC LIMIT 1;



/* Farm story 게시물 복사 쿼리 */
INSERT INTO `board_article` (`cate`, `title`, `content`, `uid`, `regip`, `rdate`)
SELECT `cate`, `title`, `content`, `uid`, `regip`, `rdate` FROM `board_article`
WHERE `cate` = 'story';


ALTER TABLE `board_user` ADD COLUMN `sessId` VARCHAR(100);
ALTER TABLE `board_user` ADD COLUMN `sessjava2_boardjava2_boardLimitDate` DATETIME;

SELECT a.*, b.nick FROM `board_article` AS a
JOIN `board_user` as b
WHERE `parent` = 0
ON a.uid = b.uid
WHERE `parent` = 0 AND `cate`=?
ORDER BY NO DESC
LIMIT 0, 10;


SELECT COUNT(`no`) FROM `board_article` WHERE `parent` = 0 AND `cate`='story';


(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate` = 'grow' ORDER BY `no` DESC LIMIT 5)
UNION
(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate` = 'school' ORDER BY `no` DESC LIMIT 5)
UNION
(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate` = 'story' ORDER BY `no` DESC LIMIT 5);




ALTER TABLE `board_user` ADD COLUMN `sessId` VARCHAR(100) UNIQUE;
ALTER TABLE `board_user` ADD COLUMN `sessLimitDate` DATETIME;

ALTER TABLE `board_user` DROP COLUMN `sessId`;
ALTER TABLE `board_user` DROP COLUMN `sessLimitDate`;

UPDATE `board_user` SET `sessid`=?, `sessLimitDate` = DATE_ADD(NOW(), INTERVAL 3 DAY) WHERE `uid`=?;

SELECT * FROM `board_user` WHERE `sessId`=? AND `sessLimitDate` > NOW();  

