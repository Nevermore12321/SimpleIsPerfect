/*
 Navicat Premium Data Transfer

 Source Server         : Ubuntu、
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 192.168.44.129:3306
 Source Schema         : usercenter

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 03/02/2023 13:58:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         `del_state` tinyint NOT NULL DEFAULT 0 COMMENT '软删除',
                         `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户唯一 uuid',
                         `version` bigint NOT NULL DEFAULT 0 COMMENT '版本号',
                         `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
                         `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话',
                         `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
                         `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
                         `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
                         `sex` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别 0:男 1:女',
                         `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
                         `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户信息',
                         `interest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '兴趣爱好',
                         `extra` json NULL COMMENT '额外扩展字段',
                         PRIMARY KEY (`id`) USING BTREE,
                         UNIQUE INDEX `idx_mobile`(`mobile` ASC) USING BTREE,
                         UNIQUE INDEX `idx_username`(`name` ASC) USING BTREE,
                         UNIQUE INDEX `idx_email`(`email` ASC) USING BTREE,
                         UNIQUE INDEX `idx_uuid`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth`  (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                              `del_state` tinyint NOT NULL DEFAULT 0,
                              `version` bigint NOT NULL DEFAULT 0 COMMENT '版本号',
                              `user_id` bigint NOT NULL DEFAULT 0 COMMENT 'local 用户 id，对应 user 表中的 id',
                              `auth_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方平台唯一用户 id',
                              `auth_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '平台类型',
                              PRIMARY KEY (`id`) USING BTREE,
                              UNIQUE INDEX `idx_type_key`(`auth_type` ASC, `auth_key` ASC) USING BTREE,
                              UNIQUE INDEX `idx_userId_key`(`user_id` ASC, `auth_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户授权表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
