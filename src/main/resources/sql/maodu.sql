# Host: localhost  (Version 5.0.22-community-nt)
# Date: 2019-05-29 19:16:21
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "admin_info"
#

DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info` (
  `aid` int(6) NOT NULL auto_increment,
  `userName` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `nickName` varchar(20) default NULL,
  `realName` varchar(16) default NULL,
  `sex` varchar(4) default NULL,
  `birthday` date default NULL,
  `address` varchar(250) default NULL,
  `phoneNumber` varchar(11) default NULL,
  `regDate` date default NULL,
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "admin_info"
#


#
# Structure for table "type"
#

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `tid` int(4) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "type"
#


#
# Structure for table "user_info"
#

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `uid` int(6) NOT NULL auto_increment,
  `userName` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `nickName` varchar(20) default NULL,
  `realName` varchar(16) default NULL,
  `sex` varchar(4) default NULL,
  `birthday` date default NULL,
  `address` varchar(250) default NULL,
  `phoneNumber` varchar(11) default NULL,
  `regDate` date default NULL,
  `power` bit(1) default '',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user_info"
#

INSERT INTO `user_info` VALUES (1,'tom','123456','tom','tomy','男','2019-04-03','jijsijsijsi','123456789','2019-04-02',b'1'),(2,'jsjs','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'jsjs','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'你好·','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'张三','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'张三','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'张三','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

#
# Structure for table "product_info"
#

DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `pid` int(6) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `uid` int(6) default NULL,
  `tid` int(4) default NULL,
  `price` decimal(10,0) default NULL,
  `brand` varchar(250) default NULL,
  `picture` varchar(150) default NULL,
  `num` int(8) default NULL,
  `describe` varchar(600) default NULL,
  PRIMARY KEY  (`pid`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `type` (`tid`),
  CONSTRAINT `product_info_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "product_info"
#


#
# Structure for table "problem"
#

DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `id` int(6) NOT NULL auto_increment,
  `uid` int(6) default NULL,
  `time` datetime default NULL,
  `describe` varchar(500) default NULL,
  `status` bit(1) default '\0',
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `problem_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "problem"
#


#
# Structure for table "order_info"
#

DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `oid` int(5) NOT NULL auto_increment,
  `uid` int(6) default NULL,
  `time` datetime default NULL,
  `address` varchar(250) default NULL,
  `status` bit(1) default '\0',
  PRIMARY KEY  (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "order_info"
#


#
# Structure for table "order_detail"
#

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `odid` int(6) NOT NULL auto_increment,
  `oid` int(5) default NULL,
  `pid` int(6) default NULL,
  `num` int(3) default NULL,
  `totalPrice` decimal(10,0) default NULL,
  PRIMARY KEY  (`odid`),
  KEY `oid` (`oid`),
  KEY `pid` (`pid`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `order_info` (`oid`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product_info` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "order_detail"
#

