
--选择数据库
use secims;

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
INSERT INTO SECIMS.`USER`(username,PASSWORD) VALUES('mw','password');

INSERT INTO SECIMS.`USER`(username,PASSWORD) VALUES('xp','password');



--- 周报表 CREATE TABLE

CREATE TABLE `WeekReportWork` (
  `weekRepId` int(10) NOT NULL AUTO_INCREMENT COMMENT '周报ID',
  `sender` varchar(50) DEFAULT NULL COMMENT '发送人',
  `recipient` varchar(50) DEFAULT NULL COMMENT '接受人',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` varchar(5000) DEFAULT NULL COMMENT '内容',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` varchar(10) DEFAULT NULL COMMENT '状态（F:完成、E：保存中）',
  `userid` int(10) DEFAULT NULL COMMENT '发送用户ID',
  PRIMARY KEY (`weekRepId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8



-- 查询
SELECT * FROM SECIMS.`WeekReportWork` ;


-- 插入数据
INSERT INTO SECIMS.`WeekReportWork`(sender,recipient,title,content,createTime,userid) 
VALUES("12345@qq.com","43216@qq.com","weekly work","first weekly report work",NOW(),1);



--修改CreateTime 设置默认时间 CURRENT_TIMESTAMP 
--ALTER TABLE `table_name` MODIFY COLUMN  `CreateTime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;




-- 学习计划 表

CREATE TABLE `studyplan` (
  `planId` int(10) NOT NULL AUTO_INCREMENT COMMENT '学习计划ID',
  `planTitle` varchar(100) DEFAULT NULL COMMENT '学习计划标题',
  `planType` varchar(200) DEFAULT NULL COMMENT '学习计划类型（如web前端/开发技术/网络技术/操作系统/数据库/安全技术）',
  `planContent` varchar(500) DEFAULT NULL COMMENT '学习计划内容',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '学习计划开始时间',
  `finishTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '学习计划结束时间',
  `userid` int(10) DEFAULT NULL COMMENT '学习计划制定人',
  `status` varchar(10) DEFAULT NULL COMMENT '状态 F：完成/ E：正在执行',
  PRIMARY KEY (`planId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8








-- 学习计划详细表  Create Table
CREATE TABLE `studyplandetail` (
  `planDetailId` int(10) NOT NULL AUTO_INCREMENT COMMENT '学习计划详细表ID',
  `planId` int(10) DEFAULT NULL COMMENT '学习计划ID',
  `planDetailTitle` varchar(200) DEFAULT NULL COMMENT '学习计划详细标题',
  `planDetailContent` varchar(500) DEFAULT NULL COMMENT '学习计划详细表内容',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `finishTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '完成时间',
  `status` varchar(10) DEFAULT NULL COMMENT '状态 F：完成 E：正在执行中',
  PRIMARY KEY (`planDetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8




SELECT * FROM SECIMS.`StudyPlanDetail` ;

--改变 自增序列 从1000开始
--ALTER TABLE SECIMS.`StudyPlanDetail` AUTO_INCREMENT = 10000 ;




CREATE TABLE `studyplanscore` (
  `scoreId` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `planId` int(10) DEFAULT NULL COMMENT '学习计划ID',
  `userId` int(10) DEFAULT NULL COMMENT '用户ID',
  `roleType` int(2) DEFAULT NULL COMMENT '角色类型（实习生互评/导师评价/实习生管理员）',
  `score` double(5,2) DEFAULT NULL COMMENT '评定成绩',
  `comment` longtext COMMENT '评语',
  PRIMARY KEY (`scoreId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8





-- Create Table 月评

CREATE TABLE `MonthReview` (
  `reviewId` int(10) NOT NULL AUTO_INCREMENT COMMENT '月评ID',
  `userid` int(10) NOT NULL COMMENT '用户ID',
  `monthTitle` varchar(100) NOT NULL COMMENT '月评PPT标题',
  `monthFileURL` varchar(500) DEFAULT NULL COMMENT 'PPT路径',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8





CREATE TABLE `monthreviewresult` (
  `resultId` int(10) NOT NULL AUTO_INCREMENT COMMENT '月评评论表ID',
  `reviewId` int(10) DEFAULT NULL COMMENT '月评ID',
  `userId` int(10) DEFAULT NULL COMMENT '评论人Id',
  `roleType` int(2) DEFAULT NULL COMMENT '评论人类型/（如：企业导师/企业实习生管理员）',
  `result` double(5,2) DEFAULT NULL COMMENT '分数',
  `comment` text COMMENT '评语',
  PRIMARY KEY (`resultId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8



--select * from emp where deptno = 你要查询的部门ID




--- 学习论坛贴子

-- LearningForumPosts


-- Create Table

CREATE TABLE `LearningForumPosts` (
  `postsId` int(10) NOT NULL AUTO_INCREMENT COMMENT '学习论坛帖子ID',
  `title` varchar(50) DEFAULT NULL COMMENT '论坛帖子标题',
  `type` varchar(100) DEFAULT NULL COMMENT '论坛帖子类型',
  `content` longtext COMMENT '论坛帖子内容',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` int(10) DEFAULT NULL COMMENT '创建人用户ID',
  `browseNum` int(10) DEFAULT NULL COMMENT '浏览数量',
  `answerNum` int(10) DEFAULT NULL COMMENT '回答数量',
  `status` varchar(2) DEFAULT NULL COMMENT '状态（F:完成，E：执行中）',
  PRIMARY KEY (`postsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8



-- 学习论坛聊天信息

CREATE TABLE `LearningForumChatMsg` (
  `msgId` int(10) NOT NULL AUTO_INCREMENT COMMENT '聊天记录ID',
  `postsId` int(10) DEFAULT NULL COMMENT '论坛帖子Id',
  `msgContent` longtext COMMENT '聊天内容',
  `sendTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `userid` int(10) DEFAULT NULL COMMENT '发送人',
  PRIMARY KEY (`msgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8






