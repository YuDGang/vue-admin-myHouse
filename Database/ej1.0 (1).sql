/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : ej1.0

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 02/01/2020 10:24:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_file
-- ----------------------------
DROP TABLE IF EXISTS `base_file`;
CREATE TABLE `base_file` (
  `id` varchar(256) NOT NULL,
  `fileName` varchar(256) DEFAULT NULL,
  `groupName` varchar(256) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user
-- ----------------------------
BEGIN;
INSERT INTO `base_user` VALUES (26, 'customer1', '顾客1', '123321', 1, 'customer', '18812344321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (27, 'customer2', '顾客2', '123321', 1, 'customer', '18812344322', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (28, 'customer3', '顾客3', '123321', 1, 'customer', '18812344323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (29, 'waiter1', '员工1', '123321', 1, 'waiter', '18812344324', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (30, 'waiter2', '员工2', '123321', 1, 'waiter', '18812344325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (31, 'waiter3', '员工3', '123321', 1, 'waiter', '18812344326', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (32, 'admin', '超级管理员', '123321', 1, 'manager', '18812344327', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (33, 'customer4', '员工4', '123321', 1, 'waiter', NULL, NULL, NULL, 1572658847108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_user` VALUES (34, 'customer4', '顾客4', '123321', 1, 'customer', NULL, NULL, NULL, 1572658847108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2231 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_address
-- ----------------------------
BEGIN;
INSERT INTO `ej_address` VALUES (2228, '江苏省', '苏州市', '昆山市', '学院路828号', NULL, 26);
INSERT INTO `ej_address` VALUES (2229, '江苏省', '苏州市', '昆山市', '马鞍山西路1989号', NULL, 27);
INSERT INTO `ej_address` VALUES (2230, '江苏省', '苏州市', '昆山市', '马鞍山中路', NULL, 28);
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
) ENGINE=InnoDB AUTO_INCREMENT=9413 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_category
-- ----------------------------
BEGIN;
INSERT INTO `ej_category` VALUES (9139, '专业保洁', 1001, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QmGOAdpjQAAASHUVudos614.png', 9139);
INSERT INTO `ej_category` VALUES (9202, '家居养护', 1002, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QmKyACXpOAAAW9HmZnCo866.png', NULL);
INSERT INTO `ej_category` VALUES (9357, '家庭维修', 1004, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QmNOACHQ9AAAXAxWpPOA619.png', NULL);
INSERT INTO `ej_category` VALUES (9358, '洗护服务', 1005, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QmL6ANx4KAAASJN8HeBE728.png', NULL);
INSERT INTO `ej_category` VALUES (9392, '生活急救箱', 1006, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QmL6ANx4KAAASJN8HeBE728.png', NULL);
INSERT INTO `ej_category` VALUES (9411, '厨房高温保洁', 1007, '', 9139);
INSERT INTO `ej_category` VALUES (9412, 'test01', 1, '', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1221674 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_customer
-- ----------------------------
BEGIN;
INSERT INTO `ej_customer` VALUES (1221650, '131344441155', '122211111111111', '张辉', '不正常', '未上传', NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221668, '18896781234', '123321', '王啸1112222', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ej_customer` VALUES (1221673, '12345678900', '123', '露丝', NULL, NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=981 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_order
-- ----------------------------
BEGIN;
INSERT INTO `ej_order` VALUES (975, 1572245336920, 470, '待接单', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (976, 1572246550663, 98, '待接单', NULL, 26, 30, 2228);
INSERT INTO `ej_order` VALUES (977, 1572248274468, 93, '已完成', NULL, 26, 29, 2228);
INSERT INTO `ej_order` VALUES (978, 1572312394688, 98, '已完成', NULL, 26, 31, 2228);
INSERT INTO `ej_order` VALUES (979, 1572313185770, 98, '待派单', NULL, 26, NULL, 2228);
INSERT INTO `ej_order` VALUES (980, 1572319903140, 111, '已完成', NULL, 27, 30, 2229);
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
  CONSTRAINT `ej_order_line_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `ej_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000000382 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_order_line
-- ----------------------------
BEGIN;
INSERT INTO `ej_order_line` VALUES (10000000370, 2, 200.00, 9056, 975);
INSERT INTO `ej_order_line` VALUES (10000000371, 2, 35.00, 9070, 975);
INSERT INTO `ej_order_line` VALUES (10000000372, 1, 58.00, 4195, 976);
INSERT INTO `ej_order_line` VALUES (10000000373, 1, 40.00, 6493, 976);
INSERT INTO `ej_order_line` VALUES (10000000374, 1, 58.00, 4195, 977);
INSERT INTO `ej_order_line` VALUES (10000000375, 1, 35.00, 9074, 977);
INSERT INTO `ej_order_line` VALUES (10000000376, 1, 58.00, 4195, 978);
INSERT INTO `ej_order_line` VALUES (10000000377, 1, 40.00, 6493, 978);
INSERT INTO `ej_order_line` VALUES (10000000378, 1, 58.00, 4195, 979);
INSERT INTO `ej_order_line` VALUES (10000000379, 1, 40.00, 6493, 979);
INSERT INTO `ej_order_line` VALUES (10000000380, 1, 22.00, 4192, 980);
INSERT INTO `ej_order_line` VALUES (10000000381, 1, 89.00, 9059, 980);
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
) ENGINE=InnoDB AUTO_INCREMENT=9123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ej_product
-- ----------------------------
BEGIN;
INSERT INTO `ej_product` VALUES (4192, '清洗油烟机', '11111327777', 22, '9139', 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV25QQOARwoHAADshQCFLZM627.png', 9358);
INSERT INTO `ej_product` VALUES (4195, '擦玻璃', '8999', 58, '9202', 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QnIyADNivAABJYphN250291.jpg', 9202);
INSERT INTO `ej_product` VALUES (6493, '清洗羊绒大衣', '1231', 40, '0', 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2QnKCAPBdQAABzXikw49U598.jpg', 9202);
INSERT INTO `ej_product` VALUES (9009, '白衬衫', '啛啛喳喳', 159, '', 'C:\\fakepath\\XUESHENGJIEMIAN.jpg', 9202);
INSERT INTO `ej_product` VALUES (9056, '耐克裤子', '质量不错', 200, NULL, NULL, 9139);
INSERT INTO `ej_product` VALUES (9059, '上衣', '衣服比较脏', 89, NULL, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2K4NyANONPAAHvNkIPys4928.png', 9358);
INSERT INTO `ej_product` VALUES (9070, '衣服', '需要手洗', 35, NULL, NULL, 9139);
INSERT INTO `ej_product` VALUES (9072, '衣服', '需要手洗', 35, NULL, NULL, 9139);
INSERT INTO `ej_product` VALUES (9074, '衣服', '需要手洗', 35, NULL, NULL, 9357);
INSERT INTO `ej_product` VALUES (9076, '皮衣', '需要手洗', 589, '', '', 9411);
INSERT INTO `ej_product` VALUES (9097, '若峰测试', '111', 11, NULL, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2MXCmAAWkuAAAIN5sF4jU931.gif', 9392);
INSERT INTO `ej_product` VALUES (9098, '清洗连衣裙', '不可机洗', 16, NULL, 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV2MXjSAcaAiAAAOGiAaTIE398.png', 9358);
INSERT INTO `ej_product` VALUES (9119, 'test01', 'test01', 10, '正常', '', 9202);
INSERT INTO `ej_product` VALUES (9120, 'test01', 'hello wrold', 20, '正常', 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV25PkaAVSxbAADshQCFLZM253.png', 9202);
INSERT INTO `ej_product` VALUES (9121, 'test02', 'hell word', 20, '正常', 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV25QJqAJ5n1AADshQCFLZM827.png', 9139);
INSERT INTO `ej_product` VALUES (9122, 'test03', 'hello world', 20, '正常', 'http://134.175.154.93:8888/group1/M00/00/19/rBAACV25PymAcuEpAARMEd1FrYo391.png', 9139);
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
