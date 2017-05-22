
USE secims ;

/*Table structure for table `t_email` */

DROP TABLE IF EXISTS `t_email`;

CREATE TABLE `t_email` (
  `userId` INT(11) NOT NULL COMMENT '	用户id',
  `receiveId` INT(11) NOT NULL COMMENT '接收者id',
  `type` INT(11) NOT NULL COMMENT '1:发送，2:抄送',
  `sendTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '自动发送时间'
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='邮件信息配置表';

/*Data for the table `t_email` */

INSERT  INTO `t_email`(`userId`,`receiveId`,`type`,`sendTime`) VALUES (1,2,1,'2017-04-20 17:15:50');

/*Table structure for table `t_permission` */

DROP TABLE IF EXISTS `t_permission`;

CREATE TABLE `t_permission` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `permissionName` VARCHAR(20) COLLATE utf8_bin DEFAULT NULL,
  `roleId` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_permission` */

INSERT  INTO `t_permission`(`id`,`permissionName`,`roleId`) VALUES (1,'user:*',1),(2,'teacher:*',2),(3,'student:*',3);

/*Table structure for table `t_project` */

DROP TABLE IF EXISTS `t_project`;

CREATE TABLE `t_project` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `projectName` VARCHAR(50) COLLATE utf8_bin DEFAULT NULL,
  `instruction` LONGTEXT COLLATE utf8_bin,
  `finishDate` DATE DEFAULT NULL,
  `postName` VARCHAR(50) COLLATE utf8_bin DEFAULT NULL,
  `phone` VARCHAR(20) CHARACTER SET dec8 DEFAULT NULL,
  `status` INT(11) DEFAULT '1' COMMENT '1:未开始，2：进行中，3：已完成',
  `receiver` VARCHAR(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_project` */

INSERT  INTO `t_project`(`id`,`projectName`,`instruction`,`finishDate`,`postName`,`phone`,`status`,`receiver`) VALUES (102,'asdf','12123','2017-05-09','zz','123',1,NULL),(105,'校企合作信息管理系统','请尽快完成开发','2017-03-30','测试01','13688396271',2,'jack'),(108,'测试数据1',NULL,'2017-05-01',NULL,NULL,2,NULL),(109,'测试数据2',NULL,'2017-05-01',NULL,NULL,3,NULL),(110,'asdf','asdfsadf','2017-04-17','sdf','13688396271',2,'jack'),(116,'测试项目01','测试项目01说明','2017-04-17','赵小平','13688396271',2,'jack'),(117,'测试项目021','asdf','2017-05-03','xp','1223456',2,'jack'),(118,'测试项目03','测试项目说明','2017-05-09','zhao','13688396271',1,NULL),(119,'测试项目04','测试项目说明','2017-05-09','zhao','13688396271',1,NULL),(120,'测试项目05','测试项目说明','2017-05-09','zhao','13688396271',1,NULL);

/*Table structure for table `t_project_doc` */

DROP TABLE IF EXISTS `t_project_doc`;

CREATE TABLE `t_project_doc` (
  `projectId` INT(11) NOT NULL COMMENT '项目id',
  `documents` VARCHAR(100) NOT NULL COMMENT '项目文档',
  `operator` VARCHAR(20) NOT NULL COMMENT '操作者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='项目文档表';

/*Data for the table `t_project_doc` */

INSERT  INTO `t_project_doc`(`projectId`,`documents`,`operator`,`createTime`) VALUES (116,'测试项目01_企业介绍.docx','赵小平','2017-04-17 15:49:55'),(116,'测试项目01_示例.docx','赵小平','2017-04-17 15:50:10'),(117,'E:/upload/测试项目02/测试项目02_召唤阵.jpg','zz','2017-04-24 15:56:26'),(118,'E:/upload/测试项目03/测试项目03_class.png','zhao','2017-05-09 22:53:13'),(118,'E:/upload/测试项目03/测试项目03_class.png','zhao','2017-05-09 22:55:26'),(119,'E:/upload/测试项目04/测试项目04_class.png','zhao','2017-05-09 22:57:33'),(120,'E:/upload/测试项目05/测试项目05_XQaE5Y7.jpg','zhao','2017-05-09 23:01:54');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`roleName`,`type`) values (1,'admin','企业管理员'),(2,'teacher','学校管理员'),(3,'student','学生'),(4,'tutor','企业导师'),(5,'trainee','实习生');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`userName`,`password`,`roleId`,`createTime`) values (1,'xp','8b8845f00091d92a821bc2e8980b4e11',1,'2017-04-12 10:21:42'),(2,'jack','8b8845f00091d92a821bc2e8980b4e11',2,'2017-04-12 10:21:42'),(3,'marry','e91df793446ee6614a694b57e21ce2b3',3,'2017-04-12 10:21:42'),(12,'cj','d91f52eb52ee88eb65fcc37acaf40a20',3,'2017-04-19 19:58:53'),(13,'tom','d91f52eb52ee88eb65fcc37acaf40a20',3,'2017-04-23 09:56:03'),(15,'test','d91f52eb52ee88eb65fcc37acaf40a20',5,'2017-04-24 16:12:52'),(24,'sd','d91f52eb52ee88eb65fcc37acaf40a20',3,'2017-04-26 21:47:03'),(25,'测试用户','d91f52eb52ee88eb65fcc37acaf40a20',3,'2017-05-06 14:40:03'),(28,'zhaoxiaoping','d91f52eb52ee88eb65fcc37acaf40a20',3,'2017-05-09 20:24:04');

/*Table structure for table `t_user_info` */

DROP TABLE IF EXISTS `t_user_info`;

CREATE TABLE `t_user_info` (
  `id` int(11) NOT NULL COMMENT '用户id',
  `actualName` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phone` bigint(20) DEFAULT NULL COMMENT '联系电话'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `t_user_info` */

insert  into `t_user_info`(`id`,`actualName`,`email`,`phone`) values (1,'赵','1132813751@qq.com',13688396271),(2,'jack',NULL,NULL),(3,'marry',NULL,NULL);

/*Table structure for table `t_user_project_con` */

DROP TABLE IF EXISTS `t_user_project_con`;

CREATE TABLE `t_user_project_con` (
  `userId` int(11) NOT NULL COMMENT '用户id',
  `projectId` int(11) NOT NULL COMMENT '项目id',
  `status` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '状态标识: -1:未开始，0：已完成，1：进行中',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户项目联系表';

/*Data for the table `t_user_project_con` */