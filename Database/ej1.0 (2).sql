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

 Date: 02/01/2020 10:30:09
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

SET FOREIGN_KEY_CHECKS = 1;
