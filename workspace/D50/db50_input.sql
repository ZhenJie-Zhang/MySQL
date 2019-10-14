/*
 Navicat Premium Data Transfer
 
 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : test
 
 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001
 
 Date: 23/01/2019 11:46:37
*/
 
create database db50;
use db50;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
 
-- ----------------------------
-- Table structure for Course
-- ----------------------------
DROP TABLE IF EXISTS `Course`;
CREATE TABLE `Course` (
  `CId` varchar(10) DEFAULT NULL,
  `Cname` varchar(10) DEFAULT NULL,
  `TId` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- ----------------------------
-- Records of Course
-- ----------------------------
BEGIN;
INSERT INTO `Course` VALUES ('01', '语文', '02');
INSERT INTO `Course` VALUES ('02', '数学', '01');
INSERT INTO `Course` VALUES ('03', '英语', '03');
COMMIT;
 
-- ----------------------------
-- Table structure for SC
-- ----------------------------
DROP TABLE IF EXISTS `SC`;
CREATE TABLE `SC` (
  `SId` varchar(10) DEFAULT NULL,
  `CId` varchar(10) DEFAULT NULL,
  `score` decimal(18,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- ----------------------------
-- Records of SC
-- ----------------------------
BEGIN;
INSERT INTO `SC` VALUES ('01', '01', 80.0);
INSERT INTO `SC` VALUES ('01', '02', 90.0);
INSERT INTO `SC` VALUES ('01', '03', 99.0);
INSERT INTO `SC` VALUES ('02', '01', 70.0);
INSERT INTO `SC` VALUES ('02', '02', 60.0);
INSERT INTO `SC` VALUES ('02', '03', 80.0);
INSERT INTO `SC` VALUES ('03', '01', 80.0);
INSERT INTO `SC` VALUES ('03', '02', 80.0);
INSERT INTO `SC` VALUES ('03', '03', 80.0);
INSERT INTO `SC` VALUES ('04', '01', 50.0);
INSERT INTO `SC` VALUES ('04', '02', 30.0);
INSERT INTO `SC` VALUES ('04', '03', 20.0);
INSERT INTO `SC` VALUES ('05', '01', 76.0);
INSERT INTO `SC` VALUES ('05', '02', 87.0);
INSERT INTO `SC` VALUES ('06', '01', 31.0);
INSERT INTO `SC` VALUES ('06', '03', 34.0);
INSERT INTO `SC` VALUES ('07', '02', 89.0);
INSERT INTO `SC` VALUES ('07', '03', 98.0);
COMMIT;
 
-- ----------------------------
-- Table structure for Student
-- ----------------------------
DROP TABLE IF EXISTS `Student`;
CREATE TABLE `Student` (
  `SId` varchar(10) DEFAULT NULL,
  `Sname` varchar(10) DEFAULT NULL,
  `Sage` datetime DEFAULT NULL,
  `Ssex` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- ----------------------------
-- Records of Student
-- ----------------------------
BEGIN;
INSERT INTO `Student` VALUES ('01', '赵雷', '1990-01-01 00:00:00', '男');
INSERT INTO `Student` VALUES ('02', '钱电', '1990-12-21 00:00:00', '男');
INSERT INTO `Student` VALUES ('03', '孙风', '1990-12-20 00:00:00', '男');
INSERT INTO `Student` VALUES ('04', '李云', '1990-12-06 00:00:00', '男');
INSERT INTO `Student` VALUES ('05', '周梅', '1991-12-01 00:00:00', '女');
INSERT INTO `Student` VALUES ('06', '吴兰', '1992-01-01 00:00:00', '女');
INSERT INTO `Student` VALUES ('07', '郑竹', '1989-01-01 00:00:00', '女');
INSERT INTO `Student` VALUES ('09', '张三', '2017-12-20 00:00:00', '女');
INSERT INTO `Student` VALUES ('10', '李四', '2017-12-25 00:00:00', '女');
INSERT INTO `Student` VALUES ('11', '李四', '2012-06-06 00:00:00', '女');
INSERT INTO `Student` VALUES ('12', '赵六', '2013-06-13 00:00:00', '女');
INSERT INTO `Student` VALUES ('13', '孙七', '2014-06-01 00:00:00', '女');
COMMIT;
 
-- ----------------------------
-- Table structure for Teacher
-- ----------------------------
DROP TABLE IF EXISTS `Teacher`;
CREATE TABLE `Teacher` (
  `TId` varchar(10) DEFAULT NULL,
  `Tname` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- ----------------------------
-- Records of Teacher
-- ----------------------------
BEGIN;
INSERT INTO `Teacher` VALUES ('01', '张三');
INSERT INTO `Teacher` VALUES ('02', '李四');
INSERT INTO `Teacher` VALUES ('03', '王五');
COMMIT;
 
SET FOREIGN_KEY_CHECKS = 1;