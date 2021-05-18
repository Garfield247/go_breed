/*
 Navicat Premium Data Transfer

 Source Server         : Darsing2.100
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 192.168.2.100:3306
 Source Schema         : darsing_test

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 17/05/2021 11:30:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for extends_agreement
-- ----------------------------
DROP TABLE IF EXISTS `extends_agreement`;
CREATE TABLE `extends_agreement` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `armor_name` varchar(8) CHARACTER SET utf8mb4 NOT NULL COMMENT '甲方',
  `renter_name` varchar(8) CHARACTER SET utf8mb4 NOT NULL COMMENT '乙方',
  `content` longtext CHARACTER SET utf8mb4 NOT NULL COMMENT '租赁协议',
  `seal` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `state` tinyint(1) NOT NULL COMMENT '状态',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_agreement
-- ----------------------------
BEGIN;
INSERT INTO `extends_agreement` VALUES (47, '123', '123', '<p>123</p>', '123', 1, '2021-05-07 10:35:22', '2021-05-07 10:35:22');
INSERT INTO `extends_agreement` VALUES (48, '1', '2', '<p>3</p>', '4', 0, '2021-05-08 13:36:13', '2021-05-08 13:36:13');
INSERT INTO `extends_agreement` VALUES (49, '3', '4', '<p>5</p>', '6', 1, '2021-05-08 13:53:10', '2021-05-08 13:53:10');
COMMIT;

-- ----------------------------
-- Table structure for extends_bill
-- ----------------------------
DROP TABLE IF EXISTS `extends_bill`;
CREATE TABLE `extends_bill` (
  `id` int(13) unsigned NOT NULL AUTO_INCREMENT,
  `bill_num` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账单号',
  `money` decimal(10,2) unsigned zerofill NOT NULL COMMENT '金额',
  `payee` int(8) unsigned NOT NULL COMMENT '收款人',
  `payer` int(8) unsigned NOT NULL COMMENT '付款人',
  `model` tinyint(2) NOT NULL COMMENT '交易类型',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_bill
-- ----------------------------
BEGIN;
INSERT INTO `extends_bill` VALUES (1, '444', 00002131.00, 37, 1, 1, '2021-04-29 16:15:31');
INSERT INTO `extends_bill` VALUES (2, '33', 00000033.00, 37, 2, 1, '2021-04-29 16:14:41');
INSERT INTO `extends_bill` VALUES (3, '2313', 00009999.00, 37, 37, 2, '2021-04-29 16:15:22');
INSERT INTO `extends_bill` VALUES (4, 'dxsa162063428012978265737', 00001990.00, 37, 1, 3, '2021-05-10 16:11:20');
INSERT INTO `extends_bill` VALUES (5, 'dxsa162063429253678790037', 00001990.00, 37, 1, 3, '2021-05-10 16:11:33');
INSERT INTO `extends_bill` VALUES (6, 'dxsa162089712332027338337', 00000199.00, 37, 1, 3, '2021-05-13 17:12:03');
INSERT INTO `extends_bill` VALUES (7, 'dxsa162089713988939719137', 00000199.00, 37, 1, 3, '2021-05-13 17:12:20');
INSERT INTO `extends_bill` VALUES (8, 'dxsa162089732088262398037', 00000199.00, 37, 1, 3, '2021-05-13 17:15:21');
INSERT INTO `extends_bill` VALUES (9, 'dxsa162089738202136935737', 00000199.00, 37, 1, 3, '2021-05-13 17:16:22');
INSERT INTO `extends_bill` VALUES (10, 'dxsa1620897570309512949237', 00000199.00, 37, 1, 3, '2021-05-13 17:19:30');
COMMIT;

-- ----------------------------
-- Table structure for extends_breed_category
-- ----------------------------
DROP TABLE IF EXISTS `extends_breed_category`;
CREATE TABLE `extends_breed_category` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(8) CHARACTER SET utf8mb4 NOT NULL COMMENT '分类名称',
  `sort` int(8) unsigned NOT NULL COMMENT '排序',
  `isdel` tinyint(1) unsigned zerofill NOT NULL COMMENT '删除状态',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_breed_category
-- ----------------------------
BEGIN;
INSERT INTO `extends_breed_category` VALUES (1, '家禽', 1, 0, '2021-04-28 09:49:03', '2021-04-28 09:49:07');
INSERT INTO `extends_breed_category` VALUES (2, '家畜', 2, 0, '2021-04-28 09:49:23', '2021-04-28 09:49:27');
INSERT INTO `extends_breed_category` VALUES (3, '水果', 3, 0, '2021-04-28 09:49:53', '2021-04-28 09:50:00');
INSERT INTO `extends_breed_category` VALUES (4, '蔬菜', 4, 0, '2021-04-28 09:50:19', '2021-04-28 09:50:23');
INSERT INTO `extends_breed_category` VALUES (5, '鱼类', 5, 0, '2021-04-28 13:06:25', '2021-04-28 13:06:29');
COMMIT;

-- ----------------------------
-- Table structure for extends_breed_item
-- ----------------------------
DROP TABLE IF EXISTS `extends_breed_item`;
CREATE TABLE `extends_breed_item` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `extends_farm_id` int(8) unsigned NOT NULL COMMENT '农场ID',
  `extends_breed_category_id` int(8) unsigned NOT NULL COMMENT '分类ID',
  `name` varchar(8) CHARACTER SET utf8mb4 NOT NULL COMMENT '项目名称',
  `cycle` int(4) unsigned zerofill NOT NULL COMMENT '认养周期',
  `yields` int(4) unsigned zerofill NOT NULL COMMENT '理论产量',
  `unit` varchar(8) CHARACTER SET utf8mb4 NOT NULL COMMENT '产量单位',
  `img` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目图片',
  `video` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目视频',
  `desc` longtext COLLATE utf8mb4_unicode_ci COMMENT '项目详情',
  `price` decimal(10,2) NOT NULL COMMENT '项目单价',
  `price_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单价说明',
  `sort` int(8) unsigned NOT NULL COMMENT '排序',
  `ishot` tinyint(1) unsigned NOT NULL,
  `isdel` tinyint(1) unsigned zerofill NOT NULL COMMENT '删除标识',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_breed_item
-- ----------------------------
BEGIN;
INSERT INTO `extends_breed_item` VALUES (4, 1, 3, '芬皇后西红柿', 0150, 0500, 'g', 'static/upload/91620624143_.pic.jpg', NULL, NULL, 999.00, NULL, 4, 0, 0, '2021-05-12 17:15:57', '2021-05-12 17:15:57');
INSERT INTO `extends_breed_item` VALUES (5, 1, 4, '金品西红柿', 0010, 0003, 'kg', 'static/upload/111620624143_.pic.jpg', NULL, NULL, 8.00, NULL, 5, 0, 0, '2021-05-12 17:16:13', '2021-05-12 17:16:13');
INSERT INTO `extends_breed_item` VALUES (6, 1, 1, '西红柿', 0321, 0222, 'kg', 'static/upload/111620624143_.pic.jpg', NULL, NULL, 99.80, NULL, 6, 0, 0, '2021-05-11 09:30:22', '2021-05-11 09:30:22');
INSERT INTO `extends_breed_item` VALUES (7, 1, 1, '小西红柿', 2131, 0312, 'kg', 'static/upload/111620624143_.pic.jpg', NULL, NULL, 31.45, NULL, 7, 0, 0, '2021-05-11 09:30:28', '2021-05-11 09:30:28');
INSERT INTO `extends_breed_item` VALUES (38, 1, 1, 'T粉86番茄', 0077, 2359, 'kg', 'static/upload/131620624144_.pic.jpg', NULL, NULL, 277.86, NULL, 44, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (39, 1, 1, '粉皇后', 0098, 2348, 'g', 'static/upload/111620624143_.pic.jpg', NULL, NULL, 729.99, NULL, 83, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (40, 1, 1, '大红一号', 0069, 2650, 'g', 'static/upload/131620624144_.pic.jpg', NULL, NULL, 0.07, NULL, 31, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (41, 1, 1, '粉皇后', 0001, 1096, 'kg', 'static/upload/91620624143_.pic.jpg', NULL, NULL, 237.12, NULL, 73, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (42, 1, 1, 'T粉86番茄', 0025, 0347, 'g', 'static/upload/131620624144_.pic.jpg', NULL, NULL, 191.01, NULL, 55, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (43, 1, 1, '大红一号', 0006, 1306, 'kg', 'static/upload/91620624143_.pic.jpg', NULL, NULL, 573.57, NULL, 39, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (45, 1, 1, 'T粉86番茄', 0067, 1422, 'g', 'static/upload/131620624144_.pic.jpg', NULL, NULL, 104.53, NULL, 60, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (46, 1, 1, '大红一号', 0064, 2495, 'g', 'static/upload/141620624144_.pic.jpg', NULL, NULL, 440.28, NULL, 75, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (47, 1, 1, 'T粉86番茄', 0011, 2581, 'kg', 'static/upload/131620624144_.pic.jpg', NULL, NULL, 762.26, NULL, 78, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (48, 1, 1, 'T粉86番茄', 0035, 1641, 'g', 'static/upload/131620624144_.pic.jpg', NULL, NULL, 954.90, NULL, 89, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (49, 1, 1, '霞粉', 0089, 0175, 'g', 'static/upload/141620624144_.pic.jpg', NULL, NULL, 571.41, NULL, 44, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (50, 1, 1, '粉皇后', 0076, 2165, 'kg', 'static/upload/81620624143_.pic.jpg', NULL, NULL, 171.56, NULL, 35, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (51, 1, 1, '皖粉2号', 0072, 0884, 'kg', 'static/upload/141620624144_.pic.jpg', NULL, NULL, 35.98, NULL, 97, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (52, 1, 1, '霞粉', 0043, 0145, 'g', 'static/upload/111620624143_.pic.jpg', NULL, NULL, 654.01, NULL, 21, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (53, 1, 1, '粉皇后', 0042, 0389, 'g', 'static/upload/101620624143_.pic.jpg', NULL, NULL, 420.37, NULL, 40, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (54, 1, 1, '粉皇后', 0026, 1912, 'g', 'static/upload/101620624143_.pic.jpg', NULL, NULL, 378.48, NULL, 10, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (55, 1, 1, '皖粉2号', 0039, 0688, 'g', 'static/upload/141620624144_.pic.jpg', NULL, NULL, 17.86, NULL, 94, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (56, 1, 1, '粉皇后', 0066, 0421, 'kg', 'static/upload/141620624144_.pic.jpg', NULL, NULL, 291.82, NULL, 61, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (57, 1, 1, '皖粉2号', 0041, 1524, 'g', 'static/upload/111620624143_.pic.jpg', NULL, NULL, 806.61, NULL, 47, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (59, 1, 1, '霞粉', 0100, 0653, 'g', 'static/upload/101620624143_.pic.jpg', NULL, NULL, 98.41, NULL, 58, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (60, 1, 1, '粉皇后', 0086, 0677, 'kg', 'static/upload/141620624144_.pic.jpg', NULL, NULL, 533.03, NULL, 44, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (61, 1, 1, '大红一号', 0082, 1087, 'g', 'static/upload/111620624143_.pic.jpg', NULL, NULL, 300.27, NULL, 61, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (62, 1, 1, '皖粉2号', 0052, 2411, 'g', 'static/upload/81620624143_.pic.jpg', NULL, NULL, 853.12, NULL, 38, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (63, 1, 1, '大红一号', 0058, 2174, 'kg', 'static/upload/91620624143_.pic.jpg', NULL, NULL, 413.39, NULL, 81, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (64, 1, 1, '霞粉', 0001, 2002, 'kg', 'static/upload/111620624143_.pic.jpg', NULL, NULL, 561.42, NULL, 47, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (65, 1, 1, '霞粉', 0025, 2762, 'g', 'static/upload/111620624143_.pic.jpg', NULL, NULL, 438.54, NULL, 61, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (66, 1, 1, '大红一号', 0016, 0062, 'g', 'static/upload/101620624143_.pic.jpg', NULL, NULL, 177.27, NULL, 11, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
INSERT INTO `extends_breed_item` VALUES (67, 1, 1, '霞粉', 0066, 2172, 'g', 'static/upload/111620624143_.pic.jpg', NULL, NULL, 855.04, NULL, 78, 0, 0, '2021-05-11 10:04:30', '2021-05-11 10:04:30');
COMMIT;

-- ----------------------------
-- Table structure for extends_breed_item_harvest
-- ----------------------------
DROP TABLE IF EXISTS `extends_breed_item_harvest`;
CREATE TABLE `extends_breed_item_harvest` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `extends_breed_item_id` int(8) unsigned NOT NULL COMMENT '项目id',
  `img` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收获图片',
  `info` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for extends_breed_item_stocks
-- ----------------------------
DROP TABLE IF EXISTS `extends_breed_item_stocks`;
CREATE TABLE `extends_breed_item_stocks` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `extends_breed_item_id` int(8) unsigned NOT NULL COMMENT '项目ID',
  `stocks` int(8) unsigned zerofill NOT NULL COMMENT '项目数量',
  `sales` int(8) unsigned zerofill NOT NULL COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_breed_item_stocks
-- ----------------------------
BEGIN;
INSERT INTO `extends_breed_item_stocks` VALUES (1, 1, 09999846, 00032296);
INSERT INTO `extends_breed_item_stocks` VALUES (2, 2, 03214342, 00034434);
INSERT INTO `extends_breed_item_stocks` VALUES (3, 3, 00006626, 00000373);
INSERT INTO `extends_breed_item_stocks` VALUES (4, 4, 00234237, 00033222);
INSERT INTO `extends_breed_item_stocks` VALUES (5, 5, 00021783, 00000212);
INSERT INTO `extends_breed_item_stocks` VALUES (6, 6, 00009877, 00001113);
INSERT INTO `extends_breed_item_stocks` VALUES (7, 7, 324327846, 00007462);
INSERT INTO `extends_breed_item_stocks` VALUES (8, 38, 00000304, 00000258);
INSERT INTO `extends_breed_item_stocks` VALUES (9, 39, 00000514, 00000360);
INSERT INTO `extends_breed_item_stocks` VALUES (10, 40, 00000832, 00000200);
INSERT INTO `extends_breed_item_stocks` VALUES (11, 41, 00000675, 00000526);
INSERT INTO `extends_breed_item_stocks` VALUES (12, 42, 00000153, 00000003);
INSERT INTO `extends_breed_item_stocks` VALUES (13, 43, 00000193, 00000149);
INSERT INTO `extends_breed_item_stocks` VALUES (14, 44, 00000994, 00000976);
INSERT INTO `extends_breed_item_stocks` VALUES (15, 45, 00000770, 00000675);
INSERT INTO `extends_breed_item_stocks` VALUES (16, 46, 00000309, 00000052);
INSERT INTO `extends_breed_item_stocks` VALUES (17, 47, 00000357, 00000347);
INSERT INTO `extends_breed_item_stocks` VALUES (18, 48, 00000177, 00000085);
INSERT INTO `extends_breed_item_stocks` VALUES (19, 49, 00000869, 00000088);
INSERT INTO `extends_breed_item_stocks` VALUES (20, 50, 00000778, 00000232);
INSERT INTO `extends_breed_item_stocks` VALUES (21, 51, 00000139, 00000036);
INSERT INTO `extends_breed_item_stocks` VALUES (22, 52, 00000693, 00000210);
INSERT INTO `extends_breed_item_stocks` VALUES (23, 53, 00000842, 00000665);
INSERT INTO `extends_breed_item_stocks` VALUES (24, 54, 00000315, 00000018);
INSERT INTO `extends_breed_item_stocks` VALUES (25, 55, 00000281, 00000191);
INSERT INTO `extends_breed_item_stocks` VALUES (26, 56, 00000651, 00000458);
INSERT INTO `extends_breed_item_stocks` VALUES (27, 57, 00000352, 00000340);
INSERT INTO `extends_breed_item_stocks` VALUES (28, 58, 00000877, 00000058);
INSERT INTO `extends_breed_item_stocks` VALUES (29, 59, 00000881, 00000576);
INSERT INTO `extends_breed_item_stocks` VALUES (30, 60, 00000999, 00000766);
INSERT INTO `extends_breed_item_stocks` VALUES (31, 61, 00000702, 00000345);
INSERT INTO `extends_breed_item_stocks` VALUES (32, 62, 00000868, 00000803);
INSERT INTO `extends_breed_item_stocks` VALUES (33, 63, 00000532, 00000310);
INSERT INTO `extends_breed_item_stocks` VALUES (34, 64, 00000651, 00000331);
INSERT INTO `extends_breed_item_stocks` VALUES (35, 65, 00000371, 00000109);
INSERT INTO `extends_breed_item_stocks` VALUES (36, 66, 00000451, 00000226);
INSERT INTO `extends_breed_item_stocks` VALUES (37, 67, 00000458, 00000021);
COMMIT;

-- ----------------------------
-- Table structure for extends_breed_logistics
-- ----------------------------
DROP TABLE IF EXISTS `extends_breed_logistics`;
CREATE TABLE `extends_breed_logistics` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `extends_breed_item_id` int(8) unsigned NOT NULL COMMENT '认养项目ID',
  `mode` tinyint(1) unsigned zerofill NOT NULL COMMENT '配送方式',
  `cycle` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '配送周期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for extends_breed_order
-- ----------------------------
DROP TABLE IF EXISTS `extends_breed_order`;
CREATE TABLE `extends_breed_order` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `extends_breed_item_id` int(8) unsigned NOT NULL COMMENT '认养的项目ID',
  `price` decimal(10,2) NOT NULL COMMENT '单价',
  `amount` int(8) unsigned NOT NULL DEFAULT '1' COMMENT '数量',
  `money` decimal(10,2) NOT NULL COMMENT '订单价格',
  `extends_user_id` int(8) NOT NULL COMMENT '认养人ID',
  `extends_bill_id` int(12) DEFAULT NULL COMMENT '交易流水ID',
  `state` tinyint(1) unsigned zerofill NOT NULL COMMENT '订单状态',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `arrive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `completed_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `order_num` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_breed_order
-- ----------------------------
BEGIN;
INSERT INTO `extends_breed_order` VALUES (1, 1, 0.00, 1, 0.00, 37, 1, 1, '2021-05-13 10:31:26', '2021-04-29 16:12:29', NULL, '');
INSERT INTO `extends_breed_order` VALUES (2, 2, 0.00, 3, 0.00, 37, 2, 4, '2021-04-29 16:13:00', NULL, NULL, '');
INSERT INTO `extends_breed_order` VALUES (3, 3, 0.00, 91, 0.00, 37, 3, 2, '2021-04-29 16:13:28', NULL, NULL, '');
INSERT INTO `extends_breed_order` VALUES (4, 1, 199.00, 10, 0.00, 37, 1, 1, '2021-05-13 10:31:27', NULL, NULL, 'dxbr1620633421870488297237');
INSERT INTO `extends_breed_order` VALUES (5, 1, 199.00, 10, 0.00, 37, 1, 1, '2021-05-13 10:31:28', NULL, NULL, 'dxbr162063342342403293437');
INSERT INTO `extends_breed_order` VALUES (6, 1, 199.00, 10, 0.00, 37, 5, 2, '2021-05-10 16:11:32', NULL, NULL, 'dxbr16206334240667576337');
INSERT INTO `extends_breed_order` VALUES (7, 1, 199.00, 10, 0.00, 37, 1, 1, '2021-05-13 10:31:30', NULL, NULL, 'dxbr1620633517233936817037');
INSERT INTO `extends_breed_order` VALUES (8, 1, 199.00, 10, 0.00, 37, 4, 3, '2021-05-13 10:30:01', NULL, NULL, 'dxbr162069572481739637437');
INSERT INTO `extends_breed_order` VALUES (9, 1, 199.00, 10, 0.00, 37, 4, 3, '2021-05-13 10:30:02', NULL, NULL, 'dxbr1620695725983174856637');
INSERT INTO `extends_breed_order` VALUES (10, 1, 199.00, 10, 0.00, 37, 4, 3, '2021-05-13 10:30:05', NULL, NULL, 'dxbr162069572687526372937');
INSERT INTO `extends_breed_order` VALUES (11, 1, 199.00, 10, 0.00, 37, 4, 1, '2021-05-13 10:30:04', NULL, NULL, 'dxbr1620695727686108869937');
INSERT INTO `extends_breed_order` VALUES (12, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:25:09', NULL, NULL, 'dxbr162089070834495840137');
INSERT INTO `extends_breed_order` VALUES (13, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:25:25', NULL, NULL, 'dxbr162089072442395718937');
INSERT INTO `extends_breed_order` VALUES (14, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:26:59', NULL, NULL, 'dxbr162089081931675244537');
INSERT INTO `extends_breed_order` VALUES (15, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:32:01', NULL, NULL, 'dxbr1620891121014989126037');
INSERT INTO `extends_breed_order` VALUES (16, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:32:07', NULL, NULL, 'dxbr162089112669021733137');
INSERT INTO `extends_breed_order` VALUES (17, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:34:28', NULL, NULL, 'dxbr1620891268270696934537');
INSERT INTO `extends_breed_order` VALUES (18, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:37:04', NULL, NULL, 'dxbr162089142383937644037');
INSERT INTO `extends_breed_order` VALUES (19, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:38:24', NULL, NULL, 'dxbr162089150347046138537');
INSERT INTO `extends_breed_order` VALUES (20, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:41:48', NULL, NULL, 'dxbr162089170819474559637');
INSERT INTO `extends_breed_order` VALUES (21, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:42:01', NULL, NULL, 'dxbr162089172092194326437');
INSERT INTO `extends_breed_order` VALUES (22, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:53:19', NULL, NULL, 'dxbr162089239882389829237');
INSERT INTO `extends_breed_order` VALUES (23, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:53:22', NULL, NULL, 'dxbr162089240185132191537');
INSERT INTO `extends_breed_order` VALUES (24, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:54:03', NULL, NULL, 'dxbr162089244242402847637');
INSERT INTO `extends_breed_order` VALUES (25, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:54:35', NULL, NULL, 'dxbr162089247467543145337');
INSERT INTO `extends_breed_order` VALUES (26, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:55:06', NULL, NULL, 'dxbr162089250544650626237');
INSERT INTO `extends_breed_order` VALUES (27, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:55:11', NULL, NULL, 'dxbr162089251080750422237');
INSERT INTO `extends_breed_order` VALUES (28, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 15:55:37', NULL, NULL, 'dxbr1620892536838106984837');
INSERT INTO `extends_breed_order` VALUES (29, 6, 99.80, 1, 0.00, 37, NULL, 1, '2021-05-13 16:09:25', NULL, NULL, 'dxbr162089336511440241537');
INSERT INTO `extends_breed_order` VALUES (30, 6, 99.80, 1, 0.00, 37, NULL, 1, '2021-05-13 16:26:16', NULL, NULL, 'dxbr162089437575176213937');
INSERT INTO `extends_breed_order` VALUES (31, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 16:43:28', NULL, NULL, 'dxbr16208954081239220637');
INSERT INTO `extends_breed_order` VALUES (32, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 16:57:55', NULL, NULL, 'dxbr162089627503567411137');
INSERT INTO `extends_breed_order` VALUES (33, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:00:52', NULL, NULL, 'dxbr1620896451514927116337');
INSERT INTO `extends_breed_order` VALUES (34, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:01:03', NULL, NULL, 'dxbr162089646251182156337');
INSERT INTO `extends_breed_order` VALUES (35, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:01:05', NULL, NULL, 'dxbr1620896465052178957437');
INSERT INTO `extends_breed_order` VALUES (36, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:02:40', NULL, NULL, 'dxbr162089655968851914237');
INSERT INTO `extends_breed_order` VALUES (37, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:05:02', NULL, NULL, 'dxbr1620896701226405116937');
INSERT INTO `extends_breed_order` VALUES (38, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:05:44', NULL, NULL, 'dxbr162089674339541784637');
INSERT INTO `extends_breed_order` VALUES (39, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:05:54', NULL, NULL, 'dxbr1620896754344996261137');
INSERT INTO `extends_breed_order` VALUES (40, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:06:06', NULL, NULL, 'dxbr162089676565857245537');
INSERT INTO `extends_breed_order` VALUES (41, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:06:29', NULL, NULL, 'dxbr162089678856289797037');
INSERT INTO `extends_breed_order` VALUES (42, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:07:38', NULL, NULL, 'dxbr162089685765758751537');
INSERT INTO `extends_breed_order` VALUES (43, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:10:41', NULL, NULL, 'dxbr162089704115495466937');
INSERT INTO `extends_breed_order` VALUES (44, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:10:54', NULL, NULL, 'dxbr16208970542584974337');
INSERT INTO `extends_breed_order` VALUES (45, 1, 199.00, 1, 0.00, 37, 6, 2, '2021-05-13 17:12:03', NULL, NULL, 'dxbr1620897067571622863637');
INSERT INTO `extends_breed_order` VALUES (46, 1, 199.00, 1, 0.00, 37, 7, 2, '2021-05-13 17:12:20', NULL, NULL, 'dxbr1620897130129829213137');
INSERT INTO `extends_breed_order` VALUES (47, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:15:05', NULL, NULL, 'dxbr162089730469860572837');
INSERT INTO `extends_breed_order` VALUES (48, 1, 199.00, 1, 0.00, 37, 8, 2, '2021-05-13 17:15:21', NULL, NULL, 'dxbr162089731211431421737');
INSERT INTO `extends_breed_order` VALUES (49, 1, 199.00, 1, 0.00, 37, 9, 2, '2021-05-13 17:16:22', NULL, NULL, 'dxbr162089737183357323537');
INSERT INTO `extends_breed_order` VALUES (50, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:17:53', NULL, NULL, 'dxbr162089747284048986737');
INSERT INTO `extends_breed_order` VALUES (51, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:19:17', NULL, NULL, 'dxbr162089755690219671737');
INSERT INTO `extends_breed_order` VALUES (52, 1, 199.00, 1, 0.00, 37, 10, 2, '2021-05-13 17:19:30', NULL, NULL, 'dxbr1620897566167858880937');
INSERT INTO `extends_breed_order` VALUES (53, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:21:25', NULL, NULL, 'dxbr162089768521143329137');
INSERT INTO `extends_breed_order` VALUES (54, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:25:03', NULL, NULL, 'dxbr16208979023908970537');
INSERT INTO `extends_breed_order` VALUES (55, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:25:26', NULL, NULL, 'dxbr162089792543690775237');
INSERT INTO `extends_breed_order` VALUES (56, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:25:29', NULL, NULL, 'dxbr162089792854840592437');
INSERT INTO `extends_breed_order` VALUES (57, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:25:51', NULL, NULL, 'dxbr162089795100561341337');
INSERT INTO `extends_breed_order` VALUES (58, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:28:28', NULL, NULL, 'dxbr16208981079062650737');
INSERT INTO `extends_breed_order` VALUES (59, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:31:16', NULL, NULL, 'dxbr1620898276058255288937');
INSERT INTO `extends_breed_order` VALUES (60, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:35:28', NULL, NULL, 'dxbr162089852811037344237');
INSERT INTO `extends_breed_order` VALUES (61, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:37:10', NULL, NULL, 'dxbr162089862969067790937');
INSERT INTO `extends_breed_order` VALUES (62, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:37:33', NULL, NULL, 'dxbr1620898652523260864637');
INSERT INTO `extends_breed_order` VALUES (63, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:38:29', NULL, NULL, 'dxbr162089870870420563437');
INSERT INTO `extends_breed_order` VALUES (64, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:45:44', NULL, NULL, 'dxbr162089914353051754937');
INSERT INTO `extends_breed_order` VALUES (65, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:47:06', NULL, NULL, 'dxbr162089922605751556637');
INSERT INTO `extends_breed_order` VALUES (66, 1, 199.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:47:38', NULL, NULL, 'dxbr162089925780368683237');
INSERT INTO `extends_breed_order` VALUES (67, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:48:52', NULL, NULL, 'dxbr1620899331662562176337');
INSERT INTO `extends_breed_order` VALUES (68, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:50:41', NULL, NULL, 'dxbr162089944068394434937');
INSERT INTO `extends_breed_order` VALUES (69, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:50:52', NULL, NULL, 'dxbr162089945139398463037');
INSERT INTO `extends_breed_order` VALUES (70, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:51:15', NULL, NULL, 'dxbr1620899475090973933137');
INSERT INTO `extends_breed_order` VALUES (71, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:53:42', NULL, NULL, 'dxbr162089962222864531137');
INSERT INTO `extends_breed_order` VALUES (72, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:55:00', NULL, NULL, 'dxbr162089970022189222537');
INSERT INTO `extends_breed_order` VALUES (73, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:55:22', NULL, NULL, 'dxbr162089972009876760837');
INSERT INTO `extends_breed_order` VALUES (74, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:58:52', NULL, NULL, 'dxbr162089993168781587937');
INSERT INTO `extends_breed_order` VALUES (75, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 17:59:21', NULL, NULL, 'dxbr162089996136844792237');
INSERT INTO `extends_breed_order` VALUES (76, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:01:25', NULL, NULL, 'dxbr1620900085136900281937');
INSERT INTO `extends_breed_order` VALUES (77, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:02:21', NULL, NULL, 'dxbr162090014114916263637');
INSERT INTO `extends_breed_order` VALUES (78, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:03:28', NULL, NULL, 'dxbr162090020750527957037');
INSERT INTO `extends_breed_order` VALUES (79, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:04:14', NULL, NULL, 'dxbr16209002542602739737');
INSERT INTO `extends_breed_order` VALUES (80, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:06:00', NULL, NULL, 'dxbr162090035956259320337');
INSERT INTO `extends_breed_order` VALUES (81, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:07:28', NULL, NULL, 'dxbr162090044775330215537');
INSERT INTO `extends_breed_order` VALUES (82, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:08:12', NULL, NULL, 'dxbr16209004920200361537');
INSERT INTO `extends_breed_order` VALUES (83, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:09:32', NULL, NULL, 'dxbr162090057161430415437');
INSERT INTO `extends_breed_order` VALUES (84, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:10:42', NULL, NULL, 'dxbr16209006419890344837');
INSERT INTO `extends_breed_order` VALUES (85, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:11:41', NULL, NULL, 'dxbr162090070096999540237');
INSERT INTO `extends_breed_order` VALUES (86, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:11:50', NULL, NULL, 'dxbr1620900709776934970937');
INSERT INTO `extends_breed_order` VALUES (87, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:12:01', NULL, NULL, 'dxbr1620900721145594193837');
INSERT INTO `extends_breed_order` VALUES (88, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:12:23', NULL, NULL, 'dxbr1620900743120174272837');
INSERT INTO `extends_breed_order` VALUES (89, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:13:37', NULL, NULL, 'dxbr162090081716120987237');
INSERT INTO `extends_breed_order` VALUES (90, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:13:45', NULL, NULL, 'dxbr162090082457056696137');
INSERT INTO `extends_breed_order` VALUES (91, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:14:12', NULL, NULL, 'dxbr162090085157234263437');
INSERT INTO `extends_breed_order` VALUES (92, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:14:22', NULL, NULL, 'dxbr162090086222220759937');
INSERT INTO `extends_breed_order` VALUES (93, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:15:56', NULL, NULL, 'dxbr162090095540958548537');
INSERT INTO `extends_breed_order` VALUES (94, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:15:57', NULL, NULL, 'dxbr162090095712322959737');
INSERT INTO `extends_breed_order` VALUES (95, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:16:12', NULL, NULL, 'dxbr162090097155891976237');
INSERT INTO `extends_breed_order` VALUES (96, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:16:20', NULL, NULL, 'dxbr1620900980188656842637');
INSERT INTO `extends_breed_order` VALUES (97, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:16:22', NULL, NULL, 'dxbr162090098182679717737');
INSERT INTO `extends_breed_order` VALUES (98, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:16:23', NULL, NULL, 'dxbr162090098312897339937');
INSERT INTO `extends_breed_order` VALUES (99, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:17:14', NULL, NULL, 'dxbr162090103415481821737');
INSERT INTO `extends_breed_order` VALUES (100, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-13 18:17:27', NULL, NULL, 'dxbr1620901046904976869037');
INSERT INTO `extends_breed_order` VALUES (101, 3, 638.00, 1, 0.00, 66, NULL, 1, '2021-05-13 18:21:50', NULL, NULL, 'dxbr162090130952820677166');
INSERT INTO `extends_breed_order` VALUES (102, 3, 638.00, 1, 0.00, 66, NULL, 1, '2021-05-13 18:21:54', NULL, NULL, 'dxbr162090131399911899966');
INSERT INTO `extends_breed_order` VALUES (103, 3, 638.00, 1, 0.00, 66, NULL, 1, '2021-05-13 18:21:55', NULL, NULL, 'dxbr162090131507079796366');
INSERT INTO `extends_breed_order` VALUES (104, 66, 177.27, 1, 0.00, 67, NULL, 1, '2021-05-14 13:22:28', NULL, NULL, 'dxbr162096974755463170667');
INSERT INTO `extends_breed_order` VALUES (105, 66, 177.27, 1, 0.00, 67, NULL, 1, '2021-05-14 13:22:37', NULL, NULL, 'dxbr1620969757202093648667');
INSERT INTO `extends_breed_order` VALUES (106, 66, 177.27, 1, 0.00, 67, NULL, 1, '2021-05-14 13:22:44', NULL, NULL, 'dxbr1620969763474288599767');
INSERT INTO `extends_breed_order` VALUES (107, 66, 177.27, 1, 0.00, 64, NULL, 1, '2021-05-14 17:54:21', NULL, NULL, 'dxbr1620986060848526585064');
INSERT INTO `extends_breed_order` VALUES (108, 66, 177.27, 1, 0.00, 64, NULL, 1, '2021-05-14 17:55:39', NULL, NULL, 'dxbr1620986138663419565564');
INSERT INTO `extends_breed_order` VALUES (109, 66, 177.27, 1, 0.00, 64, NULL, 1, '2021-05-14 17:55:50', NULL, NULL, 'dxbr1620986150145345723164');
INSERT INTO `extends_breed_order` VALUES (110, 66, 177.27, 1, 0.00, 64, NULL, 1, '2021-05-14 17:55:53', NULL, NULL, 'dxbr1620986152970299219664');
INSERT INTO `extends_breed_order` VALUES (111, 66, 177.27, 1, 0.00, 64, NULL, 1, '2021-05-14 17:57:26', NULL, NULL, 'dxbr1620986246108900857064');
INSERT INTO `extends_breed_order` VALUES (112, 66, 177.27, 1, 0.00, 64, NULL, 1, '2021-05-14 17:58:21', NULL, NULL, 'dxbr1620986301113518592964');
INSERT INTO `extends_breed_order` VALUES (113, 66, 177.27, 1, 0.00, 64, NULL, 1, '2021-05-14 17:59:25', NULL, NULL, 'dxbr162098636513739444464');
INSERT INTO `extends_breed_order` VALUES (114, 3, 638.00, 1, 0.00, 74, NULL, 1, '2021-05-14 18:16:16', NULL, NULL, 'dxbr1620987375629001664174');
INSERT INTO `extends_breed_order` VALUES (115, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-14 18:17:32', NULL, NULL, 'dxbr1620987451445068496237');
INSERT INTO `extends_breed_order` VALUES (116, 3, 638.00, 1, 0.00, 37, NULL, 1, '2021-05-14 18:17:44', NULL, NULL, 'dxbr1620987463932991322237');
INSERT INTO `extends_breed_order` VALUES (117, 4, 999.00, 1, 999.00, 64, NULL, 1, '2021-05-17 09:59:45', NULL, NULL, 'dxbr1621216785271285362964');
COMMIT;

-- ----------------------------
-- Table structure for extends_breed_shipment
-- ----------------------------
DROP TABLE IF EXISTS `extends_breed_shipment`;
CREATE TABLE `extends_breed_shipment` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `extends_breed_order_id` int(8) NOT NULL COMMENT '订单ID',
  `extends_user_address_id` int(8) DEFAULT NULL COMMENT '订单ID',
  `mode` tinyint(1) NOT NULL COMMENT '发货方式',
  `trackingnum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '运单号',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发货时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_breed_shipment
-- ----------------------------
BEGIN;
INSERT INTO `extends_breed_shipment` VALUES (1, 4, 1, 1, NULL, '2021-05-10 15:57:02');
INSERT INTO `extends_breed_shipment` VALUES (2, 5, 1, 1, NULL, '2021-05-10 15:57:03');
INSERT INTO `extends_breed_shipment` VALUES (3, 6, 1, 1, NULL, '2021-05-10 15:57:04');
INSERT INTO `extends_breed_shipment` VALUES (4, 7, 1, 1, NULL, '2021-05-10 15:58:37');
INSERT INTO `extends_breed_shipment` VALUES (5, 8, 1, 1, NULL, '2021-05-11 09:15:25');
INSERT INTO `extends_breed_shipment` VALUES (6, 9, 1, 1, NULL, '2021-05-11 09:15:26');
INSERT INTO `extends_breed_shipment` VALUES (7, 10, 1, 1, NULL, '2021-05-11 09:15:27');
INSERT INTO `extends_breed_shipment` VALUES (8, 11, 1, 1, NULL, '2021-05-11 09:15:28');
INSERT INTO `extends_breed_shipment` VALUES (9, 19, NULL, 1, NULL, '2021-05-13 15:38:24');
INSERT INTO `extends_breed_shipment` VALUES (10, 20, NULL, 1, NULL, '2021-05-13 15:41:48');
INSERT INTO `extends_breed_shipment` VALUES (11, 21, NULL, 1, NULL, '2021-05-13 15:42:01');
INSERT INTO `extends_breed_shipment` VALUES (12, 22, NULL, 1, NULL, '2021-05-13 15:53:19');
INSERT INTO `extends_breed_shipment` VALUES (13, 23, NULL, 1, NULL, '2021-05-13 15:53:22');
INSERT INTO `extends_breed_shipment` VALUES (14, 24, NULL, 1, NULL, '2021-05-13 15:54:03');
INSERT INTO `extends_breed_shipment` VALUES (15, 25, NULL, 1, NULL, '2021-05-13 15:54:35');
INSERT INTO `extends_breed_shipment` VALUES (16, 26, NULL, 1, NULL, '2021-05-13 15:55:06');
INSERT INTO `extends_breed_shipment` VALUES (17, 27, NULL, 1, NULL, '2021-05-13 15:55:11');
INSERT INTO `extends_breed_shipment` VALUES (18, 28, NULL, 1, NULL, '2021-05-13 15:55:37');
INSERT INTO `extends_breed_shipment` VALUES (19, 29, NULL, 1, NULL, '2021-05-13 16:09:25');
INSERT INTO `extends_breed_shipment` VALUES (20, 30, NULL, 1, NULL, '2021-05-13 16:26:16');
INSERT INTO `extends_breed_shipment` VALUES (21, 31, NULL, 1, NULL, '2021-05-13 16:43:28');
INSERT INTO `extends_breed_shipment` VALUES (22, 32, NULL, 1, NULL, '2021-05-13 16:57:55');
INSERT INTO `extends_breed_shipment` VALUES (23, 33, NULL, 1, NULL, '2021-05-13 17:00:52');
INSERT INTO `extends_breed_shipment` VALUES (24, 34, NULL, 1, NULL, '2021-05-13 17:01:03');
INSERT INTO `extends_breed_shipment` VALUES (25, 35, NULL, 1, NULL, '2021-05-13 17:01:05');
INSERT INTO `extends_breed_shipment` VALUES (26, 36, NULL, 1, NULL, '2021-05-13 17:02:40');
INSERT INTO `extends_breed_shipment` VALUES (27, 37, NULL, 1, NULL, '2021-05-13 17:05:02');
INSERT INTO `extends_breed_shipment` VALUES (28, 38, NULL, 1, NULL, '2021-05-13 17:05:44');
INSERT INTO `extends_breed_shipment` VALUES (29, 39, NULL, 1, NULL, '2021-05-13 17:05:55');
INSERT INTO `extends_breed_shipment` VALUES (30, 40, NULL, 1, NULL, '2021-05-13 17:06:06');
INSERT INTO `extends_breed_shipment` VALUES (31, 41, NULL, 1, NULL, '2021-05-13 17:06:29');
INSERT INTO `extends_breed_shipment` VALUES (32, 42, NULL, 1, NULL, '2021-05-13 17:07:38');
INSERT INTO `extends_breed_shipment` VALUES (33, 43, NULL, 1, NULL, '2021-05-13 17:10:41');
INSERT INTO `extends_breed_shipment` VALUES (34, 44, NULL, 1, NULL, '2021-05-13 17:10:54');
INSERT INTO `extends_breed_shipment` VALUES (35, 45, NULL, 1, NULL, '2021-05-13 17:11:08');
INSERT INTO `extends_breed_shipment` VALUES (36, 46, NULL, 1, NULL, '2021-05-13 17:12:10');
INSERT INTO `extends_breed_shipment` VALUES (37, 47, NULL, 1, NULL, '2021-05-13 17:15:05');
INSERT INTO `extends_breed_shipment` VALUES (38, 48, NULL, 1, NULL, '2021-05-13 17:15:12');
INSERT INTO `extends_breed_shipment` VALUES (39, 49, NULL, 1, NULL, '2021-05-13 17:16:12');
INSERT INTO `extends_breed_shipment` VALUES (40, 50, NULL, 1, NULL, '2021-05-13 17:17:53');
INSERT INTO `extends_breed_shipment` VALUES (41, 51, NULL, 1, NULL, '2021-05-13 17:19:17');
INSERT INTO `extends_breed_shipment` VALUES (42, 52, NULL, 1, NULL, '2021-05-13 17:19:26');
INSERT INTO `extends_breed_shipment` VALUES (43, 53, NULL, 1, NULL, '2021-05-13 17:21:25');
INSERT INTO `extends_breed_shipment` VALUES (44, 54, NULL, 1, NULL, '2021-05-13 17:25:03');
INSERT INTO `extends_breed_shipment` VALUES (45, 55, NULL, 1, NULL, '2021-05-13 17:25:26');
INSERT INTO `extends_breed_shipment` VALUES (46, 56, NULL, 1, NULL, '2021-05-13 17:25:29');
INSERT INTO `extends_breed_shipment` VALUES (47, 57, NULL, 1, NULL, '2021-05-13 17:25:51');
INSERT INTO `extends_breed_shipment` VALUES (48, 58, NULL, 1, NULL, '2021-05-13 17:28:28');
INSERT INTO `extends_breed_shipment` VALUES (49, 59, NULL, 1, NULL, '2021-05-13 17:31:16');
INSERT INTO `extends_breed_shipment` VALUES (50, 60, NULL, 1, NULL, '2021-05-13 17:35:28');
INSERT INTO `extends_breed_shipment` VALUES (51, 61, NULL, 1, NULL, '2021-05-13 17:37:10');
INSERT INTO `extends_breed_shipment` VALUES (52, 62, NULL, 1, NULL, '2021-05-13 17:37:33');
INSERT INTO `extends_breed_shipment` VALUES (53, 63, NULL, 1, NULL, '2021-05-13 17:38:29');
INSERT INTO `extends_breed_shipment` VALUES (54, 64, NULL, 1, NULL, '2021-05-13 17:45:44');
INSERT INTO `extends_breed_shipment` VALUES (55, 65, NULL, 1, NULL, '2021-05-13 17:47:06');
INSERT INTO `extends_breed_shipment` VALUES (56, 66, NULL, 1, NULL, '2021-05-13 17:47:38');
INSERT INTO `extends_breed_shipment` VALUES (57, 67, NULL, 1, NULL, '2021-05-13 17:48:52');
INSERT INTO `extends_breed_shipment` VALUES (58, 68, NULL, 1, NULL, '2021-05-13 17:50:41');
INSERT INTO `extends_breed_shipment` VALUES (59, 69, NULL, 1, NULL, '2021-05-13 17:50:52');
INSERT INTO `extends_breed_shipment` VALUES (60, 70, NULL, 1, NULL, '2021-05-13 17:51:15');
INSERT INTO `extends_breed_shipment` VALUES (61, 71, NULL, 1, NULL, '2021-05-13 17:53:42');
INSERT INTO `extends_breed_shipment` VALUES (62, 72, NULL, 1, NULL, '2021-05-13 17:55:00');
INSERT INTO `extends_breed_shipment` VALUES (63, 73, NULL, 1, NULL, '2021-05-13 17:55:22');
INSERT INTO `extends_breed_shipment` VALUES (64, 74, NULL, 1, NULL, '2021-05-13 17:58:52');
INSERT INTO `extends_breed_shipment` VALUES (65, 75, NULL, 1, NULL, '2021-05-13 17:59:22');
INSERT INTO `extends_breed_shipment` VALUES (66, 76, NULL, 1, NULL, '2021-05-13 18:01:25');
INSERT INTO `extends_breed_shipment` VALUES (67, 77, NULL, 1, NULL, '2021-05-13 18:02:21');
INSERT INTO `extends_breed_shipment` VALUES (68, 78, NULL, 1, NULL, '2021-05-13 18:03:28');
INSERT INTO `extends_breed_shipment` VALUES (69, 79, NULL, 1, NULL, '2021-05-13 18:04:14');
INSERT INTO `extends_breed_shipment` VALUES (70, 80, NULL, 1, NULL, '2021-05-13 18:06:00');
INSERT INTO `extends_breed_shipment` VALUES (71, 81, NULL, 1, NULL, '2021-05-13 18:07:28');
INSERT INTO `extends_breed_shipment` VALUES (72, 82, NULL, 1, NULL, '2021-05-13 18:08:12');
INSERT INTO `extends_breed_shipment` VALUES (73, 83, NULL, 1, NULL, '2021-05-13 18:09:32');
INSERT INTO `extends_breed_shipment` VALUES (74, 84, NULL, 1, NULL, '2021-05-13 18:10:42');
INSERT INTO `extends_breed_shipment` VALUES (75, 85, NULL, 1, NULL, '2021-05-13 18:11:41');
INSERT INTO `extends_breed_shipment` VALUES (76, 86, NULL, 1, NULL, '2021-05-13 18:11:50');
INSERT INTO `extends_breed_shipment` VALUES (77, 87, NULL, 1, NULL, '2021-05-13 18:12:01');
INSERT INTO `extends_breed_shipment` VALUES (78, 88, NULL, 1, NULL, '2021-05-13 18:12:23');
INSERT INTO `extends_breed_shipment` VALUES (79, 89, NULL, 1, NULL, '2021-05-13 18:13:37');
INSERT INTO `extends_breed_shipment` VALUES (80, 90, NULL, 1, NULL, '2021-05-13 18:13:45');
INSERT INTO `extends_breed_shipment` VALUES (81, 91, NULL, 1, NULL, '2021-05-13 18:14:12');
INSERT INTO `extends_breed_shipment` VALUES (82, 92, NULL, 1, NULL, '2021-05-13 18:14:22');
INSERT INTO `extends_breed_shipment` VALUES (83, 93, NULL, 1, NULL, '2021-05-13 18:15:56');
INSERT INTO `extends_breed_shipment` VALUES (84, 94, NULL, 1, NULL, '2021-05-13 18:15:57');
INSERT INTO `extends_breed_shipment` VALUES (85, 95, NULL, 1, NULL, '2021-05-13 18:16:12');
INSERT INTO `extends_breed_shipment` VALUES (86, 96, NULL, 1, NULL, '2021-05-13 18:16:20');
INSERT INTO `extends_breed_shipment` VALUES (87, 97, NULL, 1, NULL, '2021-05-13 18:16:22');
INSERT INTO `extends_breed_shipment` VALUES (88, 98, NULL, 1, NULL, '2021-05-13 18:16:23');
INSERT INTO `extends_breed_shipment` VALUES (89, 99, NULL, 1, NULL, '2021-05-13 18:17:14');
INSERT INTO `extends_breed_shipment` VALUES (90, 100, NULL, 1, NULL, '2021-05-13 18:17:27');
INSERT INTO `extends_breed_shipment` VALUES (91, 101, NULL, 1, NULL, '2021-05-13 18:21:50');
INSERT INTO `extends_breed_shipment` VALUES (92, 102, NULL, 1, NULL, '2021-05-13 18:21:54');
INSERT INTO `extends_breed_shipment` VALUES (93, 103, NULL, 1, NULL, '2021-05-13 18:21:55');
INSERT INTO `extends_breed_shipment` VALUES (94, 104, NULL, 1, NULL, '2021-05-14 13:22:28');
INSERT INTO `extends_breed_shipment` VALUES (95, 105, NULL, 1, NULL, '2021-05-14 13:22:37');
INSERT INTO `extends_breed_shipment` VALUES (96, 106, NULL, 1, NULL, '2021-05-14 13:22:44');
INSERT INTO `extends_breed_shipment` VALUES (97, 107, NULL, 1, NULL, '2021-05-14 17:54:21');
INSERT INTO `extends_breed_shipment` VALUES (98, 108, NULL, 1, NULL, '2021-05-14 17:55:39');
INSERT INTO `extends_breed_shipment` VALUES (99, 109, NULL, 1, NULL, '2021-05-14 17:55:50');
INSERT INTO `extends_breed_shipment` VALUES (100, 110, NULL, 1, NULL, '2021-05-14 17:55:53');
INSERT INTO `extends_breed_shipment` VALUES (101, 111, NULL, 1, NULL, '2021-05-14 17:57:26');
INSERT INTO `extends_breed_shipment` VALUES (102, 112, NULL, 1, NULL, '2021-05-14 17:58:21');
INSERT INTO `extends_breed_shipment` VALUES (103, 113, NULL, 1, NULL, '2021-05-14 17:59:25');
INSERT INTO `extends_breed_shipment` VALUES (104, 114, NULL, 1, NULL, '2021-05-14 18:16:16');
INSERT INTO `extends_breed_shipment` VALUES (105, 115, NULL, 1, NULL, '2021-05-14 18:17:32');
INSERT INTO `extends_breed_shipment` VALUES (106, 116, NULL, 1, NULL, '2021-05-14 18:17:44');
INSERT INTO `extends_breed_shipment` VALUES (107, 117, NULL, 1, NULL, '2021-05-17 09:59:45');
COMMIT;

-- ----------------------------
-- Table structure for extends_daw
-- ----------------------------
DROP TABLE IF EXISTS `extends_daw`;
CREATE TABLE `extends_daw` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `extends_bill_id` int(12) unsigned DEFAULT NULL COMMENT '账单ID',
  `order_num` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '订单号',
  `state` tinyint(1) NOT NULL COMMENT '订单状态',
  `mode` tinyint(1) NOT NULL COMMENT '充值提现',
  `method` tinyint(1) NOT NULL COMMENT '充值提现方法',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '订单创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for extends_distr
-- ----------------------------
DROP TABLE IF EXISTS `extends_distr`;
CREATE TABLE `extends_distr` (
  `id` int(10) NOT NULL COMMENT '分销奖励ID',
  `mode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分销奖励方式',
  `d1` float(4,2) unsigned DEFAULT NULL COMMENT '一级代理奖励',
  `d2` float(4,2) unsigned DEFAULT NULL COMMENT '二级代理奖励',
  `t1` float(4,2) unsigned DEFAULT NULL COMMENT '一级团队奖励',
  `t2` float(4,2) unsigned DEFAULT NULL COMMENT '二级团队奖励',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for extends_farm
-- ----------------------------
DROP TABLE IF EXISTS `extends_farm`;
CREATE TABLE `extends_farm` (
  `id` int(8) NOT NULL COMMENT 'id',
  `extends_user_id` int(8) unsigned NOT NULL,
  `name` varchar(16) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_farm
-- ----------------------------
BEGIN;
INSERT INTO `extends_farm` VALUES (1, 1, 'A农场');
INSERT INTO `extends_farm` VALUES (2, 2, 'B农场');
INSERT INTO `extends_farm` VALUES (3, 4, 'C庄园');
INSERT INTO `extends_farm` VALUES (4, 7, 'D生态基地');
COMMIT;

-- ----------------------------
-- Table structure for extends_land
-- ----------------------------
DROP TABLE IF EXISTS `extends_land`;
CREATE TABLE `extends_land` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '土地地块ID',
  `name` varchar(16) CHARACTER SET utf8mb4 NOT NULL COMMENT '土地地块名称',
  `extends_land_category_id` int(4) unsigned NOT NULL COMMENT '土地分类ID',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '土地地块价格',
  `rent_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '土地地块租赁状态',
  `sort` int(8) unsigned NOT NULL COMMENT '排序',
  `cover` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地块封面',
  `state` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `isdel` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '逻辑删除标志位',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `extends_land_category_id` (`extends_land_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_land
-- ----------------------------
BEGIN;
INSERT INTO `extends_land` VALUES (2, '土地001', 1, 99.80, 0, 1, '', 0, 0, '2021-05-07 10:33:48', '2021-05-07 10:33:48');
INSERT INTO `extends_land` VALUES (3, '土地001', 1, 99.80, 0, 1, '', 0, 0, '2021-05-07 10:34:42', '2021-05-07 10:34:42');
INSERT INTO `extends_land` VALUES (4, '土地0077', 1, 99.80, 0, 1, '', 0, 0, '2021-05-07 10:39:32', '2021-05-07 10:39:32');
INSERT INTO `extends_land` VALUES (5, '土地21312', 1, 32.43, 0, 1, ' ', 0, 0, '2021-05-11 14:00:53', '2021-05-11 14:01:01');
COMMIT;

-- ----------------------------
-- Table structure for extends_land_category
-- ----------------------------
DROP TABLE IF EXISTS `extends_land_category`;
CREATE TABLE `extends_land_category` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '土地分类ID\n',
  `name` varchar(16) CHARACTER SET utf8mb4 NOT NULL COMMENT '土地分类名称',
  `sort` int(4) unsigned NOT NULL COMMENT '排序',
  `isdel` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_land_category
-- ----------------------------
BEGIN;
INSERT INTO `extends_land_category` VALUES (1, '分类一', 1, 0, '2021-04-27 17:57:38', '2021-04-27 17:57:46');
INSERT INTO `extends_land_category` VALUES (2, '分类2', 2, 0, '2021-04-27 17:58:18', '2021-04-27 17:58:23');
INSERT INTO `extends_land_category` VALUES (3, '2', 1, 0, '2021-05-06 11:16:30', '2021-05-06 11:16:30');
INSERT INTO `extends_land_category` VALUES (4, '测试农场一', 1, 0, '2021-05-06 11:16:48', '2021-05-06 11:16:48');
INSERT INTO `extends_land_category` VALUES (5, '测试农场二', 5, 0, '2021-05-06 11:27:20', '2021-05-06 11:27:20');
COMMIT;

-- ----------------------------
-- Table structure for extends_land_info
-- ----------------------------
DROP TABLE IF EXISTS `extends_land_info`;
CREATE TABLE `extends_land_info` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '地块详情ID',
  `extends_land_id` int(8) unsigned NOT NULL COMMENT '地块ID',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '地块简介',
  `freight` decimal(10,2) unsigned zerofill NOT NULL COMMENT '地块运费',
  `lon` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地块经度',
  `lat` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地块纬度',
  `service` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地块纬度',
  `point` int(8) unsigned zerofill NOT NULL DEFAULT '00000000' COMMENT '积分赠送',
  `disc` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '是否参加会员折扣',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_land_info
-- ----------------------------
BEGIN;
INSERT INTO `extends_land_info` VALUES (1, 2, '测试数据土地01', 00000009.90, '99.321', '43.3232', NULL, 00000200, 0);
INSERT INTO `extends_land_info` VALUES (2, 3, '测试数据土地01', 00000009.90, '99.321', '43.3232', NULL, 00000200, 0);
INSERT INTO `extends_land_info` VALUES (3, 4, '测试数据土地01', 00000009.90, '99.321', '43.3232', NULL, 00000200, 0);
COMMIT;

-- ----------------------------
-- Table structure for extends_land_rent
-- ----------------------------
DROP TABLE IF EXISTS `extends_land_rent`;
CREATE TABLE `extends_land_rent` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '地块租赁id',
  `extends_land_id` int(8) unsigned NOT NULL COMMENT '地块ID',
  `extends_user_id` int(8) unsigned NOT NULL COMMENT '会员ID',
  `extend_rent_state` tinyint(1) unsigned NOT NULL COMMENT '租赁状态',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `extends_service_id` int(8) unsigned DEFAULT NULL COMMENT '服务ID',
  `isdel` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '逻辑删除标识位',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for extends_land_seed
-- ----------------------------
DROP TABLE IF EXISTS `extends_land_seed`;
CREATE TABLE `extends_land_seed` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '土地种子关联表ID',
  `extends_land_id` int(8) unsigned NOT NULL COMMENT '土地ID',
  `extends_seed_id` int(8) unsigned NOT NULL COMMENT '种子ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for extends_seed
-- ----------------------------
DROP TABLE IF EXISTS `extends_seed`;
CREATE TABLE `extends_seed` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '种子ID',
  `extends_seed_category_id` int(4) unsigned NOT NULL COMMENT '种子分类ID',
  `name` varchar(16) CHARACTER SET utf8mb4 NOT NULL COMMENT '种子名称',
  `price` decimal(10,2) unsigned zerofill NOT NULL COMMENT '种子单价',
  `yields` int(4) unsigned zerofill DEFAULT '0000' COMMENT '种子理论产量',
  `livespan` int(3) unsigned zerofill DEFAULT '000' COMMENT '种子生长周期',
  `pickcyle` int(3) unsigned zerofill DEFAULT NULL COMMENT '种子采摘周期',
  `sort` int(8) unsigned NOT NULL COMMENT '排序',
  `isdel` tinyint(1) unsigned zerofill NOT NULL COMMENT '逻辑删除标识位',
  `ishot` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否热门识位',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_seed
-- ----------------------------
BEGIN;
INSERT INTO `extends_seed` VALUES (2, 1, '秋小麦', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:06:31', '2021-05-08 14:06:31');
INSERT INTO `extends_seed` VALUES (3, 1, '玉米', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:03:25', '2021-05-08 14:03:25');
INSERT INTO `extends_seed` VALUES (4, 1, '大豆', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:03:35', '2021-05-08 14:03:35');
INSERT INTO `extends_seed` VALUES (5, 1, '红薯', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:03:42', '2021-05-08 14:03:42');
INSERT INTO `extends_seed` VALUES (6, 2, '油菜', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:03:54', '2021-05-08 14:03:54');
INSERT INTO `extends_seed` VALUES (7, 2, '番茄', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:04:01', '2021-05-08 14:04:01');
INSERT INTO `extends_seed` VALUES (8, 2, '黄瓜', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:04:07', '2021-05-08 14:04:07');
INSERT INTO `extends_seed` VALUES (9, 2, '白菜', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:04:17', '2021-05-08 14:04:17');
INSERT INTO `extends_seed` VALUES (10, 2, '芹菜', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:04:30', '2021-05-08 14:04:30');
INSERT INTO `extends_seed` VALUES (11, 2, '韭菜', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:04:35', '2021-05-08 14:04:35');
INSERT INTO `extends_seed` VALUES (12, 2, '莴笋', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:04:43', '2021-05-08 14:04:43');
INSERT INTO `extends_seed` VALUES (13, 3, '西瓜', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:05:04', '2021-05-08 14:05:04');
INSERT INTO `extends_seed` VALUES (14, 3, '大西瓜', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:05:10', '2021-05-08 14:05:10');
INSERT INTO `extends_seed` VALUES (15, 3, '甜瓜', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:05:19', '2021-05-08 14:05:19');
INSERT INTO `extends_seed` VALUES (16, 3, '哈密瓜', 00000012.89, 0100, 088, 007, 1, 0, 1, '2021-05-08 14:05:34', '2021-05-08 14:05:34');
COMMIT;

-- ----------------------------
-- Table structure for extends_seed_category
-- ----------------------------
DROP TABLE IF EXISTS `extends_seed_category`;
CREATE TABLE `extends_seed_category` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '种子分类ID',
  `name` varchar(8) CHARACTER SET utf8mb4 NOT NULL COMMENT '种子分类名称',
  `icon` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '种子分类图标',
  `sort` int(4) unsigned NOT NULL COMMENT '排序',
  `isdel` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '逻辑删除标识位',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_seed_category
-- ----------------------------
BEGIN;
INSERT INTO `extends_seed_category` VALUES (1, '种子分类1', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:45:02', '2021-05-08 13:45:02');
INSERT INTO `extends_seed_category` VALUES (2, '种子分类2', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:45:09', '2021-05-08 13:45:09');
INSERT INTO `extends_seed_category` VALUES (3, '种子分类3', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:45:16', '2021-05-08 13:45:16');
INSERT INTO `extends_seed_category` VALUES (5, '种子分类5', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:45:27', '2021-05-08 13:45:27');
INSERT INTO `extends_seed_category` VALUES (6, '种子分类6', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:45:31', '2021-05-08 13:45:31');
INSERT INTO `extends_seed_category` VALUES (7, '种子分类7', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:45:39', '2021-05-08 13:45:39');
INSERT INTO `extends_seed_category` VALUES (8, '种子分类8', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:45:43', '2021-05-08 13:45:43');
INSERT INTO `extends_seed_category` VALUES (9, '种子分类9', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:45:48', '2021-05-08 13:45:48');
INSERT INTO `extends_seed_category` VALUES (10, '种子分类10', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:45:56', '2021-05-08 13:45:56');
INSERT INTO `extends_seed_category` VALUES (11, '种子分类11', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:46:00', '2021-05-08 13:46:00');
INSERT INTO `extends_seed_category` VALUES (12, '种子分类12', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:46:03', '2021-05-08 13:46:03');
INSERT INTO `extends_seed_category` VALUES (13, '种子分类13', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:46:07', '2021-05-08 13:46:07');
INSERT INTO `extends_seed_category` VALUES (14, '种子分类14', 'ddwqdasdasd.png', 1, 0, '2021-05-08 13:46:11', '2021-05-08 13:46:11');
COMMIT;

-- ----------------------------
-- Table structure for extends_seed_info
-- ----------------------------
DROP TABLE IF EXISTS `extends_seed_info`;
CREATE TABLE `extends_seed_info` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '种子详情ID',
  `extends_seed_id` int(8) unsigned NOT NULL COMMENT '种子ID',
  `carousel` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '种子封面图',
  `img1` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '幼苗期图',
  `img2` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '生长期图',
  `img3` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '成熟图',
  `season` varchar(8) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '适宜播种季节',
  `minplant` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '最少种植面积',
  `desc` text CHARACTER SET utf8mb4 COMMENT '种子详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_seed_info
-- ----------------------------
BEGIN;
INSERT INTO `extends_seed_info` VALUES (1, 2, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (2, 3, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (3, 4, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (4, 5, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (5, 6, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (6, 7, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (7, 8, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (8, 9, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (9, 10, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (10, 11, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (11, 12, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (12, 13, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (13, 14, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (14, 15, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
INSERT INTO `extends_seed_info` VALUES (15, 16, 'a.png', 'xx.png', 'xx.png', 'xx.png', '秋', 10, '简介');
COMMIT;

-- ----------------------------
-- Table structure for extends_user
-- ----------------------------
DROP TABLE IF EXISTS `extends_user`;
CREATE TABLE `extends_user` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '邮箱',
  `passwd` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '密码',
  `paypwd` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '支付密码',
  `lastlogin` datetime DEFAULT NULL COMMENT '最后登录时间',
  `identity` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '身份',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态标识位',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_user
-- ----------------------------
BEGIN;
INSERT INTO `extends_user` VALUES (37, '18866668888', NULL, 'pbkdf2:sha256:50000$4RKJk0GW$11949368f9a19dcf98f3619084b2802a7c46a51a0b062463712ec088f43a8b15', NULL, '2021-05-17 11:11:23', 0, 0, '2021-05-10 10:46:57', '2021-05-17 11:11:23');
INSERT INTO `extends_user` VALUES (75, '18899999999', NULL, 'pbkdf2:sha256:50000$BQhAmynH$01bd66da393fc1afad1e5365db726f4399655d00c83ca8ef5025f51684db65e4', NULL, NULL, 0, 0, '2021-05-17 10:44:11', '2021-05-17 10:44:11');
INSERT INTO `extends_user` VALUES (76, '18888888888', NULL, 'pbkdf2:sha256:50000$ydy79KcQ$07b239c2b0a2401468a7d3c8cf606a650ad59b11221e2c043746f32fadb90653', NULL, '2021-05-17 10:48:55', 0, 0, '2021-05-17 10:45:07', '2021-05-17 10:48:55');
COMMIT;

-- ----------------------------
-- Table structure for extends_user_address
-- ----------------------------
DROP TABLE IF EXISTS `extends_user_address`;
CREATE TABLE `extends_user_address` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `extends_user_id` int(8) unsigned NOT NULL COMMENT '用户ID',
  `province` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省份',
  `city` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市',
  `street` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '乡镇、街道',
  `address` varchar(128) CHARACTER SET utf8mb4 NOT NULL COMMENT '详细地址',
  `zipcode` varchar(6) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '邮编',
  `name` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收件人姓名',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收件人电话',
  `isdel` tinyint(1) unsigned zerofill NOT NULL COMMENT '逻辑删除标识',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_user_address
-- ----------------------------
BEGIN;
INSERT INTO `extends_user_address` VALUES (1, 37, '安徽省', '合肥市', '高新区', '中安创谷科技园', '230000', '吕先生', '18832430076', 0, '2021-05-10 14:20:29', '2021-05-10 14:20:34');
INSERT INTO `extends_user_address` VALUES (2, 37, '安徽省', '合肥市', '高新区', '中安创谷科技园', '230000', '张先生', '18652435678', 0, '2021-05-10 14:21:45', '2021-05-10 14:21:50');
COMMIT;

-- ----------------------------
-- Table structure for extends_user_asset
-- ----------------------------
DROP TABLE IF EXISTS `extends_user_asset`;
CREATE TABLE `extends_user_asset` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `extends_user_id` int(8) unsigned NOT NULL,
  `balance` decimal(10,2) unsigned zerofill NOT NULL COMMENT '余额',
  `point` int(10) unsigned zerofill NOT NULL COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_user_asset
-- ----------------------------
BEGIN;
INSERT INTO `extends_user_asset` VALUES (1, 1, 00005063.00, 0000008888);
INSERT INTO `extends_user_asset` VALUES (2, 2, 00000004.00, 0000044433);
INSERT INTO `extends_user_asset` VALUES (3, 3, 04374236.00, 0000004237);
INSERT INTO `extends_user_asset` VALUES (4, 4, 00534543.00, 0000042342);
INSERT INTO `extends_user_asset` VALUES (5, 5, 00056556.00, 0000000088);
INSERT INTO `extends_user_asset` VALUES (6, 6, 00034372.00, 0000003442);
INSERT INTO `extends_user_asset` VALUES (7, 7, 00003423.00, 0000003424);
INSERT INTO `extends_user_asset` VALUES (8, 8, 00000432.00, 0000004324);
INSERT INTO `extends_user_asset` VALUES (37, 37, 00000024.99, 0000000022);
INSERT INTO `extends_user_asset` VALUES (38, 75, 00000000.00, 0000000000);
INSERT INTO `extends_user_asset` VALUES (39, 76, 00000000.00, 0000000000);
COMMIT;

-- ----------------------------
-- Table structure for extends_user_info
-- ----------------------------
DROP TABLE IF EXISTS `extends_user_info`;
CREATE TABLE `extends_user_info` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `extends_user_id` int(8) NOT NULL COMMENT '用户ID',
  `name` varchar(16) CHARACTER SET utf8mb4 NOT NULL COMMENT '昵称',
  `icon` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '头像',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '生日',
  `level` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级',
  `default_address_id` int(8) unsigned DEFAULT NULL COMMENT '默认收货地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of extends_user_info
-- ----------------------------
BEGIN;
INSERT INTO `extends_user_info` VALUES (1, 1, 'sadsad', NULL, 1, '2021-04-27 10:53:00', 1, NULL);
INSERT INTO `extends_user_info` VALUES (2, 2, '551231', NULL, 1, '2021-04-27 10:53:49', 0, NULL);
INSERT INTO `extends_user_info` VALUES (3, 3, '22', NULL, 1, '2021-04-27 10:53:59', 0, NULL);
INSERT INTO `extends_user_info` VALUES (4, 4, 'XIAOMING', NULL, 1, '2021-04-27 11:19:03', 0, NULL);
INSERT INTO `extends_user_info` VALUES (5, 5, 'SAM', NULL, 1, '2021-04-27 11:19:22', 0, NULL);
INSERT INTO `extends_user_info` VALUES (6, 6, 'LINGL', NULL, 1, '2021-04-27 11:19:35', 0, NULL);
INSERT INTO `extends_user_info` VALUES (7, 7, 'SADSA', NULL, 1, '2021-04-22 11:19:45', 0, NULL);
INSERT INTO `extends_user_info` VALUES (8, 8, 'ASS', NULL, 1, '2021-04-27 11:19:58', 0, NULL);
INSERT INTO `extends_user_info` VALUES (9, 24, 'asd123', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (10, 37, '测试用户001', 'static/upload/37.jpeg', 1, '0199-05-10 14:22:22', 0, 1);
INSERT INTO `extends_user_info` VALUES (12, 39, 'qwer', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (13, 40, 'admin', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (14, 41, '', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (15, 42, '', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (16, 43, '', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (17, 49, '234', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (18, 50, 'wewe', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (19, 51, '345', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (20, 52, '345', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (21, 53, '345', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (22, 54, '345', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (23, 55, '', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (24, 56, '789', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (25, 57, '123', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (26, 58, '303030', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (27, 59, 'fbfbfbf', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (28, 60, '123123123', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (29, 61, '234234', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (30, 62, '123123', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (31, 63, '123123', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (32, 64, '花仔', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (33, 65, '567', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (34, 66, 'spring', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (35, 67, 'dasingxz', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (36, 68, 'darsingx', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (37, 69, 'darsing', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (38, 70, 'darsing', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (39, 71, 'catrman', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (40, 72, '123', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (41, 73, '56555555', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (42, 74, 'huazai', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (43, 75, '花仔', NULL, 1, NULL, 0, NULL);
INSERT INTO `extends_user_info` VALUES (44, 76, 'huazai', NULL, 1, NULL, 0, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;