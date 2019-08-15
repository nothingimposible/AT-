/*
Navicat MySQL Data Transfer

Source Server         : asd
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : mybatis1

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-07-13 10:19:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `vote_commit`
-- ----------------------------
DROP TABLE IF EXISTS `vote_commit`;
CREATE TABLE `vote_commit` (
  `VC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `VS_ID` int(11) DEFAULT NULL,
  `VU_USER_NAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `VC_COMMIT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `VC_TIME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`VC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of vote_commit
-- ----------------------------
INSERT INTO `vote_commit` VALUES ('1', '49', '姚凯', '乌卡拉卡', '2019年07月09日 10:37');
INSERT INTO `vote_commit` VALUES ('2', '49', '姚凯', '巴啦啦小魔仙', '2019年07月09日 10:40');
INSERT INTO `vote_commit` VALUES ('3', '49', '姚凯', '张星傻猪', '2019年07月09日 10:41');
INSERT INTO `vote_commit` VALUES ('4', '49', '姚凯', '张星最帅！！！！！！！！！Q!QQ!Q!\n', '2019年07月09日 10:42');
INSERT INTO `vote_commit` VALUES ('5', '47', '王五', '1111111111', '2019年07月09日 16:29');
INSERT INTO `vote_commit` VALUES ('6', '50', '王五', '1', '2019年07月09日 16:43');
INSERT INTO `vote_commit` VALUES ('7', '50', '王五', '噢噢噢噢噢噢噢噢哦哦哦', '2019年07月09日 16:49');
INSERT INTO `vote_commit` VALUES ('8', '50', '王五', '滴滴哒哒咚咚哒哒', '2019年07月10日 09:47');
INSERT INTO `vote_commit` VALUES ('9', '59', '王五', '切格瓦拉', '2019年07月10日 09:48');
INSERT INTO `vote_commit` VALUES ('10', '60', '王五', '请问请问', '2019年07月10日 10:12');
INSERT INTO `vote_commit` VALUES ('11', '61', '王五', '在星辰之赐', '2019年07月10日 10:31');
INSERT INTO `vote_commit` VALUES ('12', '61', '王五', '阿萨德', '2019年07月10日 10:31');
INSERT INTO `vote_commit` VALUES ('13', '44', '姚凯', '11111111111', '2019年07月11日 10:17');

-- ----------------------------
-- Table structure for `vote_item`
-- ----------------------------
DROP TABLE IF EXISTS `vote_item`;
CREATE TABLE `vote_item` (
  `VI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `VO_ID` int(11) DEFAULT NULL,
  `VS_ID` int(11) DEFAULT NULL,
  `VU_USER_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`VI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of vote_item
-- ----------------------------
INSERT INTO `vote_item` VALUES ('12', '22', '44', '10085');
INSERT INTO `vote_item` VALUES ('13', '23', '44', '10085');
INSERT INTO `vote_item` VALUES ('14', '22', '44', '10085');
INSERT INTO `vote_item` VALUES ('15', '23', '44', '10085');
INSERT INTO `vote_item` VALUES ('16', '23', '44', '10085');
INSERT INTO `vote_item` VALUES ('17', '26', '47', '10085');
INSERT INTO `vote_item` VALUES ('18', '28', '47', '10085');
INSERT INTO `vote_item` VALUES ('19', '30', '47', '10085');
INSERT INTO `vote_item` VALUES ('20', '31', '47', '10085');
INSERT INTO `vote_item` VALUES ('22', '28', '47', null);
INSERT INTO `vote_item` VALUES ('23', '29', '47', null);
INSERT INTO `vote_item` VALUES ('26', '21', '44', null);
INSERT INTO `vote_item` VALUES ('27', '24', '44', null);
INSERT INTO `vote_item` VALUES ('28', '21', '44', null);
INSERT INTO `vote_item` VALUES ('29', '24', '44', null);
INSERT INTO `vote_item` VALUES ('30', '22', '44', null);
INSERT INTO `vote_item` VALUES ('31', '22', '44', null);
INSERT INTO `vote_item` VALUES ('32', '22', '44', null);
INSERT INTO `vote_item` VALUES ('33', '22', '44', null);
INSERT INTO `vote_item` VALUES ('34', '24', '44', null);
INSERT INTO `vote_item` VALUES ('35', '22', '44', null);
INSERT INTO `vote_item` VALUES ('36', '22', '44', null);
INSERT INTO `vote_item` VALUES ('37', '22', '44', null);
INSERT INTO `vote_item` VALUES ('38', '22', '44', null);
INSERT INTO `vote_item` VALUES ('39', '24', '44', null);
INSERT INTO `vote_item` VALUES ('40', '24', '44', null);
INSERT INTO `vote_item` VALUES ('41', '21', '44', null);
INSERT INTO `vote_item` VALUES ('52', '54', '50', null);
INSERT INTO `vote_item` VALUES ('53', '55', '50', null);
INSERT INTO `vote_item` VALUES ('54', '52', '50', '10086');
INSERT INTO `vote_item` VALUES ('55', '54', '50', '10086');
INSERT INTO `vote_item` VALUES ('56', '77', '59', '10086');
INSERT INTO `vote_item` VALUES ('57', '81', '60', '10086');
INSERT INTO `vote_item` VALUES ('58', '84', '61', '10086');

-- ----------------------------
-- Table structure for `vote_option`
-- ----------------------------
DROP TABLE IF EXISTS `vote_option`;
CREATE TABLE `vote_option` (
  `VO_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '鎶曠エ閫夐」鏍囪瘑',
  `VO_OPTION` varchar(100) DEFAULT NULL,
  `VS_ID` int(11) DEFAULT NULL,
  `NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`VO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of vote_option
-- ----------------------------
INSERT INTO `vote_option` VALUES ('22', '迪迦', '44', '0');
INSERT INTO `vote_option` VALUES ('23', '盖亚', '44', '0');
INSERT INTO `vote_option` VALUES ('24', '赛文', '44', '0');
INSERT INTO `vote_option` VALUES ('26', '钱', '47', '0');
INSERT INTO `vote_option` VALUES ('28', '李', '47', '0');
INSERT INTO `vote_option` VALUES ('29', '周', '47', '0');
INSERT INTO `vote_option` VALUES ('30', '吴', '47', '0');
INSERT INTO `vote_option` VALUES ('31', '郑', '47', '0');
INSERT INTO `vote_option` VALUES ('32', '王', '47', '0');
INSERT INTO `vote_option` VALUES ('47', '海鲜', '49', '0');
INSERT INTO `vote_option` VALUES ('48', '麻辣烫', '49', '0');
INSERT INTO `vote_option` VALUES ('49', '小米粥', '49', '0');
INSERT INTO `vote_option` VALUES ('50', '糯米鸡', '49', '0');
INSERT INTO `vote_option` VALUES ('51', '福建人', '49', '0');
INSERT INTO `vote_option` VALUES ('52', '买猪', '50', '0');
INSERT INTO `vote_option` VALUES ('53', '买羊', '50', '0');
INSERT INTO `vote_option` VALUES ('54', '买鸡', '50', '0');
INSERT INTO `vote_option` VALUES ('55', '包红波', '50', '0');
INSERT INTO `vote_option` VALUES ('56', '包绿波', '50', '0');
INSERT INTO `vote_option` VALUES ('57', '艾斯', '44', '0');
INSERT INTO `vote_option` VALUES ('75', '摩托车', '59', '0');
INSERT INTO `vote_option` VALUES ('76', '四级', '59', '0');
INSERT INTO `vote_option` VALUES ('77', '电瓶车', '59', '0');
INSERT INTO `vote_option` VALUES ('78', '驱蚊器翁群二', '60', '0');
INSERT INTO `vote_option` VALUES ('79', '阿达', '60', '0');
INSERT INTO `vote_option` VALUES ('80', '自学成才', '60', '0');
INSERT INTO `vote_option` VALUES ('81', '阿达大大', '60', '0');
INSERT INTO `vote_option` VALUES ('82', '自行车自行车', '61', '0');
INSERT INTO `vote_option` VALUES ('83', '十点多', '61', '0');
INSERT INTO `vote_option` VALUES ('84', 'www', '61', '0');
INSERT INTO `vote_option` VALUES ('85', '少时诵诗书', '62', '0');
INSERT INTO `vote_option` VALUES ('86', '柔柔弱弱若', '62', '0');
INSERT INTO `vote_option` VALUES ('87', '重中之重', '62', '0');
INSERT INTO `vote_option` VALUES ('88', '11111', '63', '0');
INSERT INTO `vote_option` VALUES ('89', '222222', '63', '0');
INSERT INTO `vote_option` VALUES ('90', '3333333', '63', '0');
INSERT INTO `vote_option` VALUES ('91', '2222222', '64', '0');
INSERT INTO `vote_option` VALUES ('92', '11111111', '64', '0');
INSERT INTO `vote_option` VALUES ('93', '电瓶车', '64', '0');
INSERT INTO `vote_option` VALUES ('100', '1111', '67', '0');
INSERT INTO `vote_option` VALUES ('101', '222222', '67', '0');
INSERT INTO `vote_option` VALUES ('102', '33333333', '67', '0');

-- ----------------------------
-- Table structure for `vote_subject`
-- ----------------------------
DROP TABLE IF EXISTS `vote_subject`;
CREATE TABLE `vote_subject` (
  `VS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '投票内容标识',
  `VS_TITLE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '鎶曠エ鍐呭鏍囬',
  `VS_TYPE` int(11) DEFAULT NULL,
  `VU_USER_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `VS_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of vote_subject
-- ----------------------------
INSERT INTO `vote_subject` VALUES ('44', '哪个奥特曼最牛逼', '1', '10085', '2019-07-13 13:59');
INSERT INTO `vote_subject` VALUES ('47', '百家姓', '2', '10085', '2019-07-08 13:59');
INSERT INTO `vote_subject` VALUES ('49', '广东人喜欢吃啥', '1', '10085', '2019-07-10 13:59');
INSERT INTO `vote_subject` VALUES ('50', '这期六合彩买什么', '2', '10086', '2019-07-12 13:59');
INSERT INTO `vote_subject` VALUES ('59', '自行车自行车', '1', '10086', '2019-07-10 13:59');
INSERT INTO `vote_subject` VALUES ('60', '叭叭叭叭叭', '1', '10086', '2019-07-11 13:59');
INSERT INTO `vote_subject` VALUES ('61', '大叔大婶多', '1', '10086', '2019-07-12 13:59');
INSERT INTO `vote_subject` VALUES ('62', '球球求求群群群群', '2', '10086', '2019-07-10 13:59');
INSERT INTO `vote_subject` VALUES ('63', '驱蚊器翁群翁', '1', '10086', '2019-07-12 13:59');
INSERT INTO `vote_subject` VALUES ('64', '驱蚊器翁群翁', '1', '10086', '2019-07-13 13:59');
INSERT INTO `vote_subject` VALUES ('67', 'qweqweq', '1', '10086', '2019-07-19 13:59');

-- ----------------------------
-- Table structure for `vote_user`
-- ----------------------------
DROP TABLE IF EXISTS `vote_user`;
CREATE TABLE `vote_user` (
  `VU_USER_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '鐢ㄦ埛鏍囪瘑',
  `VU_USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账户',
  `VU_PASSWORD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '登录密码',
  `VU_STATUS` int(11) DEFAULT NULL COMMENT '用户状态',
  `VU_VERSION` int(11) DEFAULT NULL COMMENT '用户版本',
  PRIMARY KEY (`VU_USER_ID`,`VU_USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of vote_user
-- ----------------------------
INSERT INTO `vote_user` VALUES ('10', '姚凯', '123456', '1', '123');
INSERT INTO `vote_user` VALUES ('10010', '赵四', '123456', '1', '123');
INSERT INTO `vote_user` VALUES ('10085', '姚凯', '123456', '1', '123');
INSERT INTO `vote_user` VALUES ('10086', '王五', '123456', '1', '12');
