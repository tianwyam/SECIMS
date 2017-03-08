
--用户表
CREATE TABLE `SECIMS`.`USER`(  
  `userid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` VARCHAR(50) NOT NULL COMMENT '用户名',
  `password` VARCHAR(20) NOT NULL COMMENT '密码',
  PRIMARY KEY (`userid`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;


USE SECIMS;

SELECT * FROM SECIMS.`USER`;

--新增用户
INSERT INTO SECIMS.`USER`(username,PASSWORD) VALUES('马伟','password');

INSERT INTO SECIMS.`USER`(username,PASSWORD) VALUES('赵小平','password');