/*
 Navicat Premium Data Transfer

 Source Server         : 134.175.154.93
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 134.175.154.93:3306
 Source Schema         : ej1.0

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 02/01/2020 11:31:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_file
-- ----------------------------
DROP TABLE IF EXISTS `base_file`;
CREATE TABLE `base_file` (
  `id` varchar(255) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `uploadTime` varchar(45) DEFAULT NULL,
  `fileSize` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for base_roles
-- ----------------------------
DROP TABLE IF EXISTS `base_roles`;
CREATE TABLE `base_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_roles
-- ----------------------------
BEGIN;
INSERT INTO `base_roles` VALUES (1, '超级管理员');
INSERT INTO `base_roles` VALUES (2, '普通用户');
COMMIT;

-- ----------------------------
-- Table structure for base_roles_user
-- ----------------------------
DROP TABLE IF EXISTS `base_roles_user`;
CREATE TABLE `base_roles_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`uid`),
  KEY `fk_role_id_idx` (`rid`),
  CONSTRAINT `fk_role_id` FOREIGN KEY (`rid`) REFERENCES `base_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`uid`) REFERENCES `base_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `realname` varchar(64) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `type` varchar(255) DEFAULT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `wxid` varchar(0) DEFAULT NULL,
  `register_time` bigint(20) DEFAULT NULL,
  `last_login_time` bigint(20) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `register_ip` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `id_card` varchar(45) DEFAULT NULL,
  `idcard_photo_positive` varchar(255) DEFAULT NULL,
  `idcard_photo_negative` varchar(255) DEFAULT NULL,
  `bank_card` varchar(45) DEFAULT NULL,
  `bank_card_photo` varchar(255) DEFAULT NULL,
  `forbidden_reason` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user
-- ----------------------------
BEGIN;
INSERT INTO `base_user` VALUES (26, 'customer1', '顾客1', '123321', 1, 'customer', '18812344321', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_user` VALUES (27, 'customer2', '顾客2', '123321', 1, 'customer', '18812344322', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (28, 'customer3', '顾客3', '123321', 1, 'customer', '18812344323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (29, 'waiter1', '员工1', '123321', 1, 'waiter', '18812344324', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (30, 'waiter2', '员工2', '123321', 1, 'waiter', '18812344325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (31, 'waiter3', '员工3', '123321', 1, 'waiter', '18812344326', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (32, 'admin', '超级管理员', '123321', 1, 'manager', '18812344327', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (35, NULL, '王海', NULL, 1, 'customer', '13523573564', NULL, NULL, 1577794954515, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ej_address
-- ----------------------------
DROP TABLE IF EXISTS `ej_address`;
CREATE TABLE `ej_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `fk_customer_user_id` FOREIGN KEY (`customer_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2237 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_address
-- ----------------------------
BEGIN;
INSERT INTO `ej_address` VALUES (2228, '江苏省', '苏州市', '昆山市', '学院路', '18812344321', 26);
INSERT INTO `ej_address` VALUES (2229, '江苏省', '苏州市', '昆山市', '马鞍山西路', '18812344322', 27);
INSERT INTO `ej_address` VALUES (2230, '江苏省', '苏州市', '昆山市', '马鞍山中路', '18812344323', 28);
INSERT INTO `ej_address` VALUES (2231, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_address` VALUES (2235, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_address` VALUES (2236, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ej_category
-- ----------------------------
DROP TABLE IF EXISTS `ej_category`;
CREATE TABLE `ej_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `ej_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ej_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9482 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_category
-- ----------------------------
BEGIN;
INSERT INTO `ej_category` VALUES (9139, '123', 123, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QmGOAdpjQAAASHUVudos614.png', NULL);
INSERT INTO `ej_category` VALUES (9202, '家居养护', 1002, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QmKyACXpOAAAW9HmZnCo866.png', NULL);
INSERT INTO `ej_category` VALUES (9357, NULL, NULL, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QmNOACHQ9AAAXAxWpPOA619.png', 9358);
INSERT INTO `ej_category` VALUES (9358, '洗护服务', 1005, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QmL6ANx4KAAASJN8HeBE728.png', NULL);
INSERT INTO `ej_category` VALUES (9392, '生活急救箱', 1007, 'http://134.175.154.93:8888/group1M00/00/1A/rBAACV25tjqAJTNSAALXgz4M3tw950.jpg', NULL);
INSERT INTO `ej_category` VALUES (9411, 'yyy', 11111, '', 9139);
INSERT INTO `ej_category` VALUES (9451, '水果慢羊羊', 46, '', 9411);
INSERT INTO `ej_category` VALUES (9476, 'wxj', 11, NULL, NULL);
INSERT INTO `ej_category` VALUES (9477, 'www', 2, NULL, NULL);
INSERT INTO `ej_category` VALUES (9478, '123', 1111, NULL, NULL);
INSERT INTO `ej_category` VALUES (9479, '123', 1111, NULL, NULL);
INSERT INTO `ej_category` VALUES (9480, 'www', 21, NULL, NULL);
INSERT INTO `ej_category` VALUES (9481, '澳大利亚袋鼠', 9999, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ej_comment
-- ----------------------------
DROP TABLE IF EXISTS `ej_comment`;
CREATE TABLE `ej_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `comment_time` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `ej_comment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `ej_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=502370 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_comment
-- ----------------------------
BEGIN;
INSERT INTO `ej_comment` VALUES (502326, '啦啦啦为1', 1570511042803, NULL);
INSERT INTO `ej_comment` VALUES (502369, '阿斯顿', 123, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ej_customer
-- ----------------------------
DROP TABLE IF EXISTS `ej_customer`;
CREATE TABLE `ej_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `register_time` bigint(20) DEFAULT NULL,
  `birthday` bigint(20) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1221732 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_customer
-- ----------------------------
BEGIN;
INSERT INTO `ej_customer` VALUES (1221650, '131344441155', '122211111111111', '张辉', '不正常', '未上传', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221668, '18896781234', '123321', '王啸1112222', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221673, '12345678900', '123', '露丝', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221674, '15115112312', NULL, '顾客4', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221675, '55555', NULL, '少打掉', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221676, '555555555', NULL, '顾客4', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221677, '213234', NULL, 'hhh', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221678, '111', NULL, '11', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221679, '123', NULL, '小白', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221680, '25478', NULL, '1245', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221681, '15115164625', NULL, '顾客4', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221682, '15515112332', NULL, '顾客4', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221683, '123456787897', NULL, '顾客 4', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221684, '123', NULL, '123', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221685, '123', NULL, '123', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221686, '1556666324669', NULL, '顾客4', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221687, '133422422233', NULL, '顾客', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221688, '123', NULL, '123', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221689, '555', '555', 'jgh', '正常', NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221690, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221691, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221692, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221693, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221694, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221695, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221696, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221697, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221698, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221699, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221700, '123', '123', '3213', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221701, '123', '123', 'qqq', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221702, '123', '123', 'qqq', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221703, '123', '123', 'qqq', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221704, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221705, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221706, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221707, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221708, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221709, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221710, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221711, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221712, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221713, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221714, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221715, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221716, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221717, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221718, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221719, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221720, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221721, '123', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221722, '12312312312', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221723, '12312312312', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221724, '12312312312', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221725, '12312312312', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221726, '12312312312', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221727, '12312312312', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221728, '12312312312', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221729, '12312312312', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221730, '12312312312', '123', 'sss', '正常', '123', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221731, '17600105677', NULL, '张荣武', '正常', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ej_order
-- ----------------------------
DROP TABLE IF EXISTS `ej_order`;
CREATE TABLE `ej_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_time` bigint(20) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `waiter_id` bigint(20) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `waiter_id` (`waiter_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `ej_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `base_user` (`id`),
  CONSTRAINT `ej_order_ibfk_2` FOREIGN KEY (`waiter_id`) REFERENCES `base_user` (`id`),
  CONSTRAINT `ej_order_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `ej_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1094 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_order
-- ----------------------------
BEGIN;
INSERT INTO `ej_order` VALUES (976, 1572246550663, 98, '已完成', NULL, 26, 30, 2228);
INSERT INTO `ej_order` VALUES (977, 1572248274468, 93, '已完成', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (978, 1572312394688, 98, '待确认', NULL, 26, 30, 2228);
INSERT INTO `ej_order` VALUES (979, 1572313185770, 98, '待确认', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (980, 1572333513835, 116, '已完成', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (981, 1572345254398, 235, '已完成', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (982, 1572345622549, 635, '待确认', NULL, 26, 30, 2228);
INSERT INTO `ej_order` VALUES (983, 1572345685607, 154, '已完成', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (984, 1572346095135, 2356, '已完成', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (985, 1572358062695, 600, '已完成', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (986, 1572398680011, 858, '已完成', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (987, 1572415557562, 120, '已完成', NULL, 26, 31, 2228);
INSERT INTO `ej_order` VALUES (988, 1572415576804, 131, '已完成', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (989, 1572415587242, 166, '已完成', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (990, 1572421844956, 1200, '已完成', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (991, 1572430416385, 70, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (992, 1572432442689, 70, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (993, 1572435076101, 310, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (994, 1572437265964, 200, '已完成', NULL, 26, 30, 2228);
INSERT INTO `ej_order` VALUES (995, 1572488787410, 501, '已完成', NULL, 26, 30, 2228);
INSERT INTO `ej_order` VALUES (996, 1572506497711, 196, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (997, 1572506694743, 285, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (998, 1572506814012, 235, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (999, 1572506879462, 89, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1000, 1572506899422, 35, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1001, 1572506991692, 111, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1002, 1572507908276, 400, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1003, 1572508527392, 400, '待派单', NULL, 27, NULL, 2229);
INSERT INTO `ej_order` VALUES (1004, 1572508789120, 400, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1005, 1572508815045, 35, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1006, 1572509063519, 116, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1007, 1572511060896, 70, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1008, 1572511475078, 48, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1009, 1572512223885, 235, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1010, 1572512489031, 435, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1011, 1572512538079, 435, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1012, 1572512576711, 235, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1013, 1572512743094, 235, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1014, 1572513284306, 600, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1015, 1572519075411, 332, '待派单', NULL, 27, NULL, 2229);
INSERT INTO `ej_order` VALUES (1016, 1572519219802, 400, '待派单', NULL, 28, NULL, 2230);
INSERT INTO `ej_order` VALUES (1017, 1572519230552, 140, '待派单', NULL, 28, NULL, 2230);
INSERT INTO `ej_order` VALUES (1018, 1572519241470, 127, '待派单', NULL, 28, NULL, 2230);
INSERT INTO `ej_order` VALUES (1019, 1572521060194, 0, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1020, 1572521146563, 200, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1021, 1572521178885, 35, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1022, 1572523085829, 58, '待派单', NULL, 28, NULL, 2230);
INSERT INTO `ej_order` VALUES (1023, 1572530420124, 196, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1024, 1572530445743, 470, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1025, 1572531039417, 257, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1026, 1572531387290, 111, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1027, 1572531451134, 22, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1028, 1572532022856, 3370, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1029, 1572532141062, 154, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1030, 1572532175111, 270, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1031, 1572532180440, 270, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1032, 1572532180459, 270, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1033, 1572532180458, 270, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1034, 1572532180460, 270, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1035, 1572532827776, 222, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1036, 1572533413640, 235, '已完成', NULL, 26, 31, 2228);
INSERT INTO `ej_order` VALUES (1037, 1572533613618, 1000, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1038, 1572533653397, 258, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1039, 1572533681905, 11, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1040, 1572533684538, 548, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1041, 1572533700803, 400, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1042, 1572534549451, 358, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1043, 1572534600891, 400, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1044, 1572535011497, 600, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1045, 1572535274933, 22, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1046, 1572535327692, 116, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1047, 1572536029084, 200, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1048, 1572536171419, 200, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1049, 1572537086050, 400, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1050, 1572559146952, 257, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1051, 1572570168832, 22, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1052, 1572570170630, 22, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1053, 1572570171344, 22, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1054, 1572571432925, 200, '待派单', NULL, 28, NULL, 2230);
INSERT INTO `ej_order` VALUES (1055, 1572572815429, 235, '待派单', NULL, 28, NULL, 2230);
INSERT INTO `ej_order` VALUES (1056, 1572574772816, 551, '待派单', NULL, 27, NULL, 2229);
INSERT INTO `ej_order` VALUES (1057, 1572575517330, 200, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1058, 1572576991902, 881, '待派单', NULL, 27, NULL, 2229);
INSERT INTO `ej_order` VALUES (1059, 1572576995846, 881, '待派单', NULL, 27, NULL, 2229);
INSERT INTO `ej_order` VALUES (1060, 1572577023053, 40, '待派单', NULL, 27, NULL, 2229);
INSERT INTO `ej_order` VALUES (1061, 1572578545909, 907, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1062, 1572584604453, 257, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1063, 1572598025537, 40, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1064, 1572604234309, 600, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1065, 1572609606412, 22, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1066, 1572610784826, 435, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1067, 1572610944679, 22, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1068, 1572612827878, 196, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1069, 1572650740193, 1200, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1070, 1572653829013, 7657, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1071, 1572706637588, 22, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1072, 1572767092075, 22, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1073, 1572767141800, 80, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1074, 1572770548771, 89, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1075, 1572839454578, 11, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1076, 1572864832874, 16, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1077, 1573018361616, 98, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1078, 1573085540077, 11, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1079, 1573100567267, 1640, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1080, 1573298902607, 600, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1081, 1573437474227, 678, '待服务', NULL, 26, 30, 2228);
INSERT INTO `ej_order` VALUES (1082, 1573455363816, 235, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1083, 1573641070302, 35, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1084, 1573652712120, 234, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1085, 1573652721842, 43, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1086, 1573825077788, 22, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1087, 1576223309952, 200, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1088, 1576228789531, 316, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1089, 1577624912062, 354, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1090, 1577625388824, 354, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1091, 1577627587132, 11, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (1092, 1577628577549, 211, '待接单', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (1093, 1577757693362, 98, '待派单', NULL, 26, NULL, 2228);
COMMIT;

-- ----------------------------
-- Table structure for ej_order_line
-- ----------------------------
DROP TABLE IF EXISTS `ej_order_line`;
CREATE TABLE `ej_order_line` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `ej_order_line_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ej_product` (`id`),
  CONSTRAINT `ej_order_line_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `ej_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10000000584 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_order_line
-- ----------------------------
BEGIN;
INSERT INTO `ej_order_line` VALUES (10000000372, 1, 58.00, 4195, 976);
INSERT INTO `ej_order_line` VALUES (10000000373, 1, 40.00, 6493, 976);
INSERT INTO `ej_order_line` VALUES (10000000374, 1, 58.00, 4195, 977);
INSERT INTO `ej_order_line` VALUES (10000000375, 1, 35.00, 9074, 977);
INSERT INTO `ej_order_line` VALUES (10000000376, 1, 58.00, 4195, 978);
INSERT INTO `ej_order_line` VALUES (10000000377, 1, 40.00, 6493, 978);
INSERT INTO `ej_order_line` VALUES (10000000378, 1, 58.00, 4195, 979);
INSERT INTO `ej_order_line` VALUES (10000000379, 1, 40.00, 6493, 979);
INSERT INTO `ej_order_line` VALUES (10000000380, 2, 58.00, 4195, 980);
INSERT INTO `ej_order_line` VALUES (10000000381, 1, 200.00, 9056, 981);
INSERT INTO `ej_order_line` VALUES (10000000382, 1, 35.00, 9070, 981);
INSERT INTO `ej_order_line` VALUES (10000000383, 3, 200.00, 9056, 982);
INSERT INTO `ej_order_line` VALUES (10000000384, 1, 35.00, 9070, 982);
INSERT INTO `ej_order_line` VALUES (10000000385, 0, 200.00, 9056, 983);
INSERT INTO `ej_order_line` VALUES (10000000386, 0, 35.00, 9070, 983);
INSERT INTO `ej_order_line` VALUES (10000000387, 7, 22.00, 4192, 983);
INSERT INTO `ej_order_line` VALUES (10000000388, 4, 589.00, 9076, 984);
INSERT INTO `ej_order_line` VALUES (10000000389, 0, 200.00, 9056, 984);
INSERT INTO `ej_order_line` VALUES (10000000390, 3, 200.00, 9056, 985);
INSERT INTO `ej_order_line` VALUES (10000000391, 4, 200.00, 9056, 986);
INSERT INTO `ej_order_line` VALUES (10000000392, 1, 58.00, 4195, 986);
INSERT INTO `ej_order_line` VALUES (10000000393, 3, 40.00, 6493, 987);
INSERT INTO `ej_order_line` VALUES (10000000394, 3, 40.00, 6493, 988);
INSERT INTO `ej_order_line` VALUES (10000000395, 1, 11.00, 9097, 988);
INSERT INTO `ej_order_line` VALUES (10000000396, 3, 40.00, 6493, 989);
INSERT INTO `ej_order_line` VALUES (10000000397, 1, 11.00, 9097, 989);
INSERT INTO `ej_order_line` VALUES (10000000398, 1, 35.00, 9070, 989);
INSERT INTO `ej_order_line` VALUES (10000000399, 6, 200.00, 9056, 990);
INSERT INTO `ej_order_line` VALUES (10000000400, 1, 35.00, 9070, 991);
INSERT INTO `ej_order_line` VALUES (10000000401, 1, 35.00, 9072, 991);
INSERT INTO `ej_order_line` VALUES (10000000402, 0, 58.00, 4195, 992);
INSERT INTO `ej_order_line` VALUES (10000000403, 2, 35.00, 9074, 992);
INSERT INTO `ej_order_line` VALUES (10000000404, 1, 200.00, 9056, 993);
INSERT INTO `ej_order_line` VALUES (10000000405, 1, 35.00, 9070, 993);
INSERT INTO `ej_order_line` VALUES (10000000406, 0, 58.00, 4195, 993);
INSERT INTO `ej_order_line` VALUES (10000000407, 1, 40.00, 6493, 993);
INSERT INTO `ej_order_line` VALUES (10000000408, 1, 35.00, 9072, 993);
INSERT INTO `ej_order_line` VALUES (10000000409, 1, 200.00, 9056, 994);
INSERT INTO `ej_order_line` VALUES (10000000410, 2, 200.00, 9056, 995);
INSERT INTO `ej_order_line` VALUES (10000000411, 1, 35.00, 9070, 995);
INSERT INTO `ej_order_line` VALUES (10000000412, 0, 35.00, 9072, 995);
INSERT INTO `ej_order_line` VALUES (10000000413, 3, 22.00, 9122, 995);
INSERT INTO `ej_order_line` VALUES (10000000414, 2, 58.00, 4195, 996);
INSERT INTO `ej_order_line` VALUES (10000000415, 2, 40.00, 6493, 996);
INSERT INTO `ej_order_line` VALUES (10000000416, 2, 58.00, 4195, 997);
INSERT INTO `ej_order_line` VALUES (10000000417, 2, 40.00, 6493, 997);
INSERT INTO `ej_order_line` VALUES (10000000418, 1, 89.00, 9059, 997);
INSERT INTO `ej_order_line` VALUES (10000000419, 1, 200.00, 9056, 998);
INSERT INTO `ej_order_line` VALUES (10000000420, 1, 35.00, 9070, 998);
INSERT INTO `ej_order_line` VALUES (10000000421, 1, 89.00, 9059, 999);
INSERT INTO `ej_order_line` VALUES (10000000422, 1, 35.00, 9074, 1000);
INSERT INTO `ej_order_line` VALUES (10000000423, 1, 22.00, 4192, 1001);
INSERT INTO `ej_order_line` VALUES (10000000424, 1, 89.00, 9059, 1001);
INSERT INTO `ej_order_line` VALUES (10000000425, 2, 200.00, 9056, 1002);
INSERT INTO `ej_order_line` VALUES (10000000426, 2, 200.00, 9056, 1003);
INSERT INTO `ej_order_line` VALUES (10000000427, 2, 200.00, 9056, 1004);
INSERT INTO `ej_order_line` VALUES (10000000428, 1, 35.00, 9070, 1005);
INSERT INTO `ej_order_line` VALUES (10000000429, 2, 58.00, 4195, 1006);
INSERT INTO `ej_order_line` VALUES (10000000430, 2, 35.00, 9070, 1007);
INSERT INTO `ej_order_line` VALUES (10000000431, 3, 16.00, 9098, 1008);
INSERT INTO `ej_order_line` VALUES (10000000432, 1, 200.00, 9056, 1009);
INSERT INTO `ej_order_line` VALUES (10000000433, 1, 35.00, 9072, 1009);
INSERT INTO `ej_order_line` VALUES (10000000434, 2, 200.00, 9056, 1010);
INSERT INTO `ej_order_line` VALUES (10000000435, 1, 35.00, 9070, 1010);
INSERT INTO `ej_order_line` VALUES (10000000436, 2, 200.00, 9056, 1011);
INSERT INTO `ej_order_line` VALUES (10000000437, 1, 35.00, 9070, 1011);
INSERT INTO `ej_order_line` VALUES (10000000438, 1, 200.00, 9056, 1012);
INSERT INTO `ej_order_line` VALUES (10000000439, 1, 35.00, 9072, 1012);
INSERT INTO `ej_order_line` VALUES (10000000440, 1, 200.00, 9056, 1013);
INSERT INTO `ej_order_line` VALUES (10000000441, 1, 35.00, 9070, 1013);
INSERT INTO `ej_order_line` VALUES (10000000442, 3, 200.00, 9056, 1014);
INSERT INTO `ej_order_line` VALUES (10000000443, 1, 58.00, 4195, 1015);
INSERT INTO `ej_order_line` VALUES (10000000444, 1, 40.00, 6493, 1015);
INSERT INTO `ej_order_line` VALUES (10000000445, 1, 234.00, 9176, 1015);
INSERT INTO `ej_order_line` VALUES (10000000446, 2, 200.00, 9056, 1016);
INSERT INTO `ej_order_line` VALUES (10000000447, 4, 35.00, 9074, 1017);
INSERT INTO `ej_order_line` VALUES (10000000448, 1, 16.00, 9098, 1018);
INSERT INTO `ej_order_line` VALUES (10000000449, 1, 89.00, 9059, 1018);
INSERT INTO `ej_order_line` VALUES (10000000450, 1, 22.00, 4192, 1018);
INSERT INTO `ej_order_line` VALUES (10000000451, 0, 40.00, 6493, 1019);
INSERT INTO `ej_order_line` VALUES (10000000452, 0, 58.00, 4195, 1019);
INSERT INTO `ej_order_line` VALUES (10000000453, 1, 200.00, 9056, 1020);
INSERT INTO `ej_order_line` VALUES (10000000454, 0, 200.00, 9056, 1021);
INSERT INTO `ej_order_line` VALUES (10000000455, 1, 35.00, 9074, 1021);
INSERT INTO `ej_order_line` VALUES (10000000456, 1, 58.00, 4195, 1022);
INSERT INTO `ej_order_line` VALUES (10000000457, 2, 40.00, 6493, 1023);
INSERT INTO `ej_order_line` VALUES (10000000458, 2, 58.00, 4195, 1023);
INSERT INTO `ej_order_line` VALUES (10000000459, 2, 200.00, 9056, 1024);
INSERT INTO `ej_order_line` VALUES (10000000460, 2, 35.00, 9072, 1024);
INSERT INTO `ej_order_line` VALUES (10000000461, 1, 200.00, 9056, 1025);
INSERT INTO `ej_order_line` VALUES (10000000462, 1, 35.00, 9072, 1025);
INSERT INTO `ej_order_line` VALUES (10000000463, 1, 22.00, 9122, 1025);
INSERT INTO `ej_order_line` VALUES (10000000464, 1, 22.00, 4192, 1026);
INSERT INTO `ej_order_line` VALUES (10000000465, 1, 89.00, 9059, 1026);
INSERT INTO `ej_order_line` VALUES (10000000466, 1, 22.00, 4192, 1027);
INSERT INTO `ej_order_line` VALUES (10000000467, 7, 200.00, 9056, 1028);
INSERT INTO `ej_order_line` VALUES (10000000468, 3, 40.00, 6493, 1028);
INSERT INTO `ej_order_line` VALUES (10000000469, 3, 35.00, 9070, 1028);
INSERT INTO `ej_order_line` VALUES (10000000470, 1, 234.00, 9176, 1028);
INSERT INTO `ej_order_line` VALUES (10000000471, 3, 89.00, 9059, 1028);
INSERT INTO `ej_order_line` VALUES (10000000472, 2, 22.00, 9122, 1028);
INSERT INTO `ej_order_line` VALUES (10000000473, 2, 11.00, 9097, 1028);
INSERT INTO `ej_order_line` VALUES (10000000474, 2, 589.00, 9076, 1028);
INSERT INTO `ej_order_line` VALUES (10000000475, 1, 22.00, 4192, 1029);
INSERT INTO `ej_order_line` VALUES (10000000476, 1, 89.00, 9059, 1029);
INSERT INTO `ej_order_line` VALUES (10000000477, 1, 43.00, 9175, 1029);
INSERT INTO `ej_order_line` VALUES (10000000478, 1, 200.00, 9056, 1030);
INSERT INTO `ej_order_line` VALUES (10000000479, 2, 35.00, 9072, 1030);
INSERT INTO `ej_order_line` VALUES (10000000480, 1, 200.00, 9056, 1031);
INSERT INTO `ej_order_line` VALUES (10000000481, 2, 35.00, 9072, 1031);
INSERT INTO `ej_order_line` VALUES (10000000482, 1, 200.00, 9056, 1032);
INSERT INTO `ej_order_line` VALUES (10000000483, 1, 200.00, 9056, 1033);
INSERT INTO `ej_order_line` VALUES (10000000484, 2, 35.00, 9072, 1033);
INSERT INTO `ej_order_line` VALUES (10000000485, 2, 35.00, 9072, 1032);
INSERT INTO `ej_order_line` VALUES (10000000486, 1, 200.00, 9056, 1034);
INSERT INTO `ej_order_line` VALUES (10000000487, 2, 35.00, 9072, 1034);
INSERT INTO `ej_order_line` VALUES (10000000488, 2, 89.00, 9059, 1035);
INSERT INTO `ej_order_line` VALUES (10000000489, 2, 22.00, 4192, 1035);
INSERT INTO `ej_order_line` VALUES (10000000490, 1, 200.00, 9056, 1036);
INSERT INTO `ej_order_line` VALUES (10000000491, 1, 35.00, 9072, 1036);
INSERT INTO `ej_order_line` VALUES (10000000492, 0, 35.00, 9072, 1037);
INSERT INTO `ej_order_line` VALUES (10000000493, 5, 200.00, 9056, 1037);
INSERT INTO `ej_order_line` VALUES (10000000494, 1, 200.00, 9056, 1038);
INSERT INTO `ej_order_line` VALUES (10000000495, 1, 58.00, 4195, 1038);
INSERT INTO `ej_order_line` VALUES (10000000496, 1, 11.00, 9097, 1039);
INSERT INTO `ej_order_line` VALUES (10000000497, 1, 40.00, 6493, 1040);
INSERT INTO `ej_order_line` VALUES (10000000498, 1, 58.00, 4195, 1040);
INSERT INTO `ej_order_line` VALUES (10000000499, 1, 234.00, 9176, 1040);
INSERT INTO `ej_order_line` VALUES (10000000500, 1, 11.00, 9097, 1040);
INSERT INTO `ej_order_line` VALUES (10000000501, 1, 89.00, 9059, 1040);
INSERT INTO `ej_order_line` VALUES (10000000502, 1, 22.00, 4192, 1040);
INSERT INTO `ej_order_line` VALUES (10000000503, 1, 16.00, 9098, 1040);
INSERT INTO `ej_order_line` VALUES (10000000504, 1, 43.00, 9175, 1040);
INSERT INTO `ej_order_line` VALUES (10000000505, 1, 35.00, 9074, 1040);
INSERT INTO `ej_order_line` VALUES (10000000506, 2, 200.00, 9056, 1041);
INSERT INTO `ej_order_line` VALUES (10000000507, 1, 200.00, 9056, 1042);
INSERT INTO `ej_order_line` VALUES (10000000508, 1, 58.00, 4195, 1042);
INSERT INTO `ej_order_line` VALUES (10000000509, 1, 89.00, 9059, 1042);
INSERT INTO `ej_order_line` VALUES (10000000510, 1, 11.00, 9097, 1042);
INSERT INTO `ej_order_line` VALUES (10000000511, 2, 200.00, 9056, 1043);
INSERT INTO `ej_order_line` VALUES (10000000512, 3, 200.00, 9056, 1044);
INSERT INTO `ej_order_line` VALUES (10000000513, 1, 22.00, 4192, 1045);
INSERT INTO `ej_order_line` VALUES (10000000514, 2, 58.00, 4195, 1046);
INSERT INTO `ej_order_line` VALUES (10000000515, 1, 200.00, 9056, 1047);
INSERT INTO `ej_order_line` VALUES (10000000516, 0, 35.00, 9072, 1048);
INSERT INTO `ej_order_line` VALUES (10000000517, 1, 200.00, 9056, 1048);
INSERT INTO `ej_order_line` VALUES (10000000518, 2, 200.00, 9056, 1049);
INSERT INTO `ej_order_line` VALUES (10000000519, 1, 200.00, 9056, 1050);
INSERT INTO `ej_order_line` VALUES (10000000520, 1, 35.00, 9072, 1050);
INSERT INTO `ej_order_line` VALUES (10000000521, 1, 22.00, 9122, 1050);
INSERT INTO `ej_order_line` VALUES (10000000522, 1, 22.00, 9122, 1051);
INSERT INTO `ej_order_line` VALUES (10000000523, 1, 22.00, 9122, 1052);
INSERT INTO `ej_order_line` VALUES (10000000524, 1, 22.00, 9122, 1053);
INSERT INTO `ej_order_line` VALUES (10000000525, 1, 200.00, 9056, 1054);
INSERT INTO `ej_order_line` VALUES (10000000526, 1, 35.00, 9072, 1055);
INSERT INTO `ej_order_line` VALUES (10000000527, 1, 200.00, 9056, 1055);
INSERT INTO `ej_order_line` VALUES (10000000528, 2, 200.00, 9056, 1056);
INSERT INTO `ej_order_line` VALUES (10000000529, 1, 35.00, 9072, 1056);
INSERT INTO `ej_order_line` VALUES (10000000530, 2, 58.00, 4195, 1056);
INSERT INTO `ej_order_line` VALUES (10000000531, 1, 200.00, 9056, 1057);
INSERT INTO `ej_order_line` VALUES (10000000534, 1, 40.00, 6493, 1060);
INSERT INTO `ej_order_line` VALUES (10000000535, 3, 200.00, 9056, 1061);
INSERT INTO `ej_order_line` VALUES (10000000536, 5, 35.00, 9072, 1061);
INSERT INTO `ej_order_line` VALUES (10000000537, 6, 22.00, 9122, 1061);
INSERT INTO `ej_order_line` VALUES (10000000538, 0, 40.00, 6493, 1062);
INSERT INTO `ej_order_line` VALUES (10000000539, 1, 200.00, 9056, 1062);
INSERT INTO `ej_order_line` VALUES (10000000540, 1, 35.00, 9072, 1062);
INSERT INTO `ej_order_line` VALUES (10000000541, 1, 22.00, 9122, 1062);
INSERT INTO `ej_order_line` VALUES (10000000542, 1, 40.00, 6493, 1063);
INSERT INTO `ej_order_line` VALUES (10000000543, 3, 200.00, 9056, 1064);
INSERT INTO `ej_order_line` VALUES (10000000544, 1, 22.00, 9122, 1065);
INSERT INTO `ej_order_line` VALUES (10000000545, 2, 200.00, 9056, 1066);
INSERT INTO `ej_order_line` VALUES (10000000546, 1, 35.00, 9072, 1066);
INSERT INTO `ej_order_line` VALUES (10000000547, 1, 22.00, 4192, 1067);
INSERT INTO `ej_order_line` VALUES (10000000548, 2, 58.00, 4195, 1068);
INSERT INTO `ej_order_line` VALUES (10000000549, 2, 40.00, 6493, 1068);
INSERT INTO `ej_order_line` VALUES (10000000550, 6, 200.00, 9056, 1069);
INSERT INTO `ej_order_line` VALUES (10000000551, 13, 589.00, 9076, 1070);
INSERT INTO `ej_order_line` VALUES (10000000552, 1, 22.00, 9122, 1071);
INSERT INTO `ej_order_line` VALUES (10000000553, 1, 22.00, 4192, 1072);
INSERT INTO `ej_order_line` VALUES (10000000554, 2, 40.00, 6493, 1073);
INSERT INTO `ej_order_line` VALUES (10000000555, 1, 89.00, 9059, 1074);
INSERT INTO `ej_order_line` VALUES (10000000556, 1, 11.00, 9097, 1075);
INSERT INTO `ej_order_line` VALUES (10000000557, 1, 16.00, 9098, 1076);
INSERT INTO `ej_order_line` VALUES (10000000558, 1, 58.00, 4195, 1077);
INSERT INTO `ej_order_line` VALUES (10000000559, 1, 40.00, 6493, 1077);
INSERT INTO `ej_order_line` VALUES (10000000560, 1, 11.00, 9097, 1078);
INSERT INTO `ej_order_line` VALUES (10000000561, 8, 200.00, 9056, 1079);
INSERT INTO `ej_order_line` VALUES (10000000562, 1, 40.00, 6493, 1079);
INSERT INTO `ej_order_line` VALUES (10000000563, 3, 200.00, 9056, 1080);
INSERT INTO `ej_order_line` VALUES (10000000564, 1, 89.00, 9059, 1081);
INSERT INTO `ej_order_line` VALUES (10000000565, 1, 589.00, 9076, 1081);
INSERT INTO `ej_order_line` VALUES (10000000566, 1, 200.00, 9056, 1082);
INSERT INTO `ej_order_line` VALUES (10000000567, 1, 35.00, 9072, 1082);
INSERT INTO `ej_order_line` VALUES (10000000568, 1, 35.00, 9072, 1083);
INSERT INTO `ej_order_line` VALUES (10000000569, 1, 234.00, 9176, 1084);
INSERT INTO `ej_order_line` VALUES (10000000570, 1, 43.00, 9175, 1085);
INSERT INTO `ej_order_line` VALUES (10000000571, 1, 22.00, 9122, 1086);
INSERT INTO `ej_order_line` VALUES (10000000572, 1, 200.00, 9056, 1087);
INSERT INTO `ej_order_line` VALUES (10000000573, 1, 200.00, 9056, 1088);
INSERT INTO `ej_order_line` VALUES (10000000574, 2, 58.00, 4195, 1088);
INSERT INTO `ej_order_line` VALUES (10000000575, 3, 40.00, 6493, 1089);
INSERT INTO `ej_order_line` VALUES (10000000576, 1, 234.00, 9176, 1089);
INSERT INTO `ej_order_line` VALUES (10000000577, 3, 40.00, 6493, 1090);
INSERT INTO `ej_order_line` VALUES (10000000578, 1, 234.00, 9176, 1090);
INSERT INTO `ej_order_line` VALUES (10000000579, 1, 11.00, 9097, 1091);
INSERT INTO `ej_order_line` VALUES (10000000580, 1, 11.00, 9097, 1092);
INSERT INTO `ej_order_line` VALUES (10000000581, 1, 200.00, 9056, 1092);
INSERT INTO `ej_order_line` VALUES (10000000582, 1, 58.00, 4195, 1093);
INSERT INTO `ej_order_line` VALUES (10000000583, 1, 40.00, 6493, 1093);
COMMIT;

-- ----------------------------
-- Table structure for ej_product
-- ----------------------------
DROP TABLE IF EXISTS `ej_product`;
CREATE TABLE `ej_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `ej_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `ej_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9196 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_product
-- ----------------------------
BEGIN;
INSERT INTO `ej_product` VALUES (4192, '清洗油烟机', '11111327777', 11, '9139', 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QnHaAGTC4AADX6uXN4zc85.jpeg', 9358);
INSERT INTO `ej_product` VALUES (4195, '擦玻璃', '8999', 58, '9202', 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QnIyADNivAABJYphN250291.jpg', 9202);
INSERT INTO `ej_product` VALUES (6493, '清洗羊绒大衣', '1231', 40, '0', 'http://134.175.154.93:8888/group1/M00/00/1A/rBAACV25sPiATIjgAACSZ0CW2xA939.jpg', 9202);
INSERT INTO `ej_product` VALUES (9056, '耐克裤子', '质量不错', 200, '', 'http://134.175.154.93:8888/group1/M00/00/1A/rBAACV25sQiADInQAABoE4in_tA429.jpg', 9139);
INSERT INTO `ej_product` VALUES (9059, '上衣', '衣服比较脏', 89, '', 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2K4NyANONPAAHvNkIPys4928.png', 9358);
INSERT INTO `ej_product` VALUES (9070, '衣服1', '需要手洗', 35, '', 'http://134.175.154.93:8888/group1M00/00/1A/rBAACV26X3CAd2UgAALgTbPvSJs838.jpg', 9202);
INSERT INTO `ej_product` VALUES (9072, '衣服', '需要手洗', 35, NULL, NULL, 9139);
INSERT INTO `ej_product` VALUES (9074, '衣服', '需要手洗', 35, NULL, NULL, 9357);
INSERT INTO `ej_product` VALUES (9076, '皮衣', '需要手洗', 589, '', '', 9411);
INSERT INTO `ej_product` VALUES (9097, '若峰测试', '111', 11, NULL, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2MXCmAAWkuAAAIN5sF4jU931.gif', 9392);
INSERT INTO `ej_product` VALUES (9098, '清洗连衣裙', '不可机洗', 16, NULL, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2MXjSAcaAiAAAOGiAaTIE398.png', 9358);
INSERT INTO `ej_product` VALUES (9122, '22', '222', 22, '正常', 'http://134.175.154.93:8888/group1M00/00/1A/rBAACV25stSAIBa0AALgTbPvSJs922.jpg', 9139);
INSERT INTO `ej_product` VALUES (9175, '清洗裤子', '清洗裤子', 43, '正常', 'http://134.175.154.93:8888/group1/M00/00/1B/rBAACV26qVmAYiiAAAB_iHrocNs462.jpg', 9358);
INSERT INTO `ej_product` VALUES (9176, '打扫房间', '打扫房间', 234, '正常', 'http://134.175.154.93:8888/group1/M00/00/1B/rBAACV26qXyAc1swAADWaFFtjmo318.jpg', 9202);
INSERT INTO `ej_product` VALUES (9193, '888', '8888', 8888, '正常', NULL, 9202);
INSERT INTO `ej_product` VALUES (9194, '111', '222', 111, '正常', NULL, 9139);
INSERT INTO `ej_product` VALUES (9195, '123', '11', 12, '正常', NULL, 9139);
COMMIT;

-- ----------------------------
-- Table structure for ej_waiter
-- ----------------------------
DROP TABLE IF EXISTS `ej_waiter`;
CREATE TABLE `ej_waiter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `register_time` bigint(20) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `order_quantity` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `idcard_photo_positive` varchar(255) DEFAULT NULL,
  `idcard_photo_negative` varchar(255) DEFAULT NULL,
  `bank_card` varchar(255) DEFAULT NULL,
  `bank_card_photo` varchar(255) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4489 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_waiter
-- ----------------------------
BEGIN;
INSERT INTO `ej_waiter` VALUES (4453, '18896721234', '1', '刘蝴蝶', NULL, '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_waiter` VALUES (4456, '18896721234', '1', '张涛', NULL, '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_waiter` VALUES (4457, '18896721234', '1', '胡小兰', NULL, '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_waiter` VALUES (4458, '18896721234', '1', '刘爽', NULL, '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_waiter` VALUES (4460, '18896721234', '11', '张欣', NULL, '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_waiter` VALUES (4467, '18896721234', '1', '万方', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_waiter` VALUES (4468, '18896721234', '1111111', '张芳', NULL, 'qq', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_waiter` VALUES (4488, '18896721234', 'aaa', '翠丽', NULL, 'aa', 'C:\\fakepath\\XUESHENGJIEMIAN.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
