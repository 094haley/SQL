SELECT a.*, b.nick FROM `board_article` AS a
JOIN `board_user` as b
WHERE `parent` = 0
ON a.uid = b.uid
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

