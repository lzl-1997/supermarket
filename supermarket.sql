/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : supermarket

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 29/11/2019 15:33:45
*/
create database supermarket;
use supermarket;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
                         `pid` varchar(255) NOT NULL,
                         `pname` varchar(255) DEFAULT NULL,
                         `pimg` varchar(255) DEFAULT NULL,
                         `price` double DEFAULT NULL,
                         `count` int(11) DEFAULT NULL,
                         `kind` varchar(255) DEFAULT NULL,
                         PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('17b865dd-e1a8-417e-a176-dc99b8a73da8', '苹果XR', 'img/c_004.jpg', 2000, 10, '手机数码');
INSERT INTO `product` VALUES ('1eacee51-a8e2-43a2-b5f4-01f5362b8e64', '苹果XSM', 'img/c_0043.jpg', 1000, 5, '水果');
INSERT INTO `product` VALUES ('417e417e417esdfghjk', '苹果XS', 'img/c_005.jpg', 3000, 10, '手机数码');
INSERT INTO `product` VALUES ('b84e700c-d985-4b33-bcca-012a858777fa', 'Macbook2019', 'img/c_0018.jpg', 10000, 1220, '电脑办公');
INSERT INTO `product` VALUES ('ed6450ac-0abf-49cc-81e6-8e45b6dafe3c', 'Macbook2017', 'img/c_005.jpg', 4000, 8, '电脑办公');
INSERT INTO `product` VALUES ('wesdfgh', '苹果X', 'img/c_003.jpg', 5000, 2, '手机数码');
INSERT INTO `product` VALUES ('wqwefgh', '苹果XS', 'img/c_005.jpg', 500, 8, '手机数码');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                      `id` varchar(255) NOT NULL,
                      `username` varchar(255) DEFAULT NULL,
                      `phone` varchar(255) DEFAULT NULL,
                      `sex` varchar(255) DEFAULT NULL,
                      `password` varchar(255) DEFAULT NULL,
                      `email` varchar(255) DEFAULT NULL,
                      `state` int(11) NOT NULL DEFAULT '0',
                      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('654cf787-058d-47f5-a4de-65eaa61a0844', 'admin', '15883405881', '男', '123', '9707149@qq.com', 1);
INSERT INTO `user` VALUES ('8f9e018b-b8f3-4e49-a0c9-2827b7dc6267', 'lzl1997', '15883405881', '男', '123', '9707149@qq.com', 0);
INSERT INTO `user` VALUES ('9a47954c-8b7b-4821-9b94-3e44658a977e', 'lzl', '15883405881', '男', '123', '9707149@qq.com', 0);
INSERT INTO `user` VALUES ('d50d7cb0-90ee-450a-b973-fb564e02421f', 'zhangsan', '15883405881', '女', '123', '9707149@qq.com', 0);
INSERT INTO `user` VALUES ('de2e7c03-a670-4dae-bd3a-ad997cc70907', 'lisi', '15883405881', '男', '123', '9707149@qq.com', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
