/*
Navicat MySQL Data Transfer

Source Server         : huhy
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : springboot_easyui

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-05-11 14:22:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(64) DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `att_type` varchar(20) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o3wk3a2lnl6yl4b8hj9g9wmn5` (`file_path`),
  KEY `FKgl1awyuba6jhcdk8jarfgoup5` (`member_id`),
  CONSTRAINT `FKgl1awyuba6jhcdk8jarfgoup5` FOREIGN KEY (`member_id`) REFERENCES `sys_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_member
-- ----------------------------
DROP TABLE IF EXISTS `sys_member`;
CREATE TABLE `sys_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `real_name` varchar(64) NOT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3w4x463xehrckku45kvs911ml` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_member
-- ----------------------------
INSERT INTO `sys_member` VALUES ('1', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'admin', '', '768870379@qq.com', 'GIRL', '2017-06-30 00:00:00', '管理员', '18676037292', '');
INSERT INTO `sys_member` VALUES ('31', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'gson', '\0', 'wmails@126.com', 'BOY', '2017-05-08 00:00:00', '郭华', '13203314875', '');

-- ----------------------------
-- Table structure for sys_member_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_member_role`;
CREATE TABLE `sys_member_role` (
  `member_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKb17jj8ou6rp2lkxb5xen5tixe` (`role_id`),
  KEY `FK76a8mc5mub4tu1gndxph4ypls` (`member_id`),
  CONSTRAINT `FK3fh7hawfjdp9pcmhffboj1l2w` FOREIGN KEY (`member_id`) REFERENCES `sys_member` (`id`),
  CONSTRAINT `FK76a8mc5mub4tu1gndxph4ypls` FOREIGN KEY (`member_id`) REFERENCES `sys_member` (`id`),
  CONSTRAINT `FKb17jj8ou6rp2lkxb5xen5tixe` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FKsi6p61ijwnxiipcgw2uq0slis` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_member_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fun_urls` varchar(1024) DEFAULT NULL,
  `menu_url` varchar(128) DEFAULT NULL,
  `res_key` varchar(128) NOT NULL,
  `res_name` varchar(128) NOT NULL,
  `res_type` varchar(20) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ic22mdco0hjpt8qjosdnyhxcx` (`res_key`),
  KEY `FKo4megp72bdlng5bpjmo56v1wk` (`parent_id`),
  CONSTRAINT `FK3fekum3ead5klp7y4lckn5ohi` FOREIGN KEY (`parent_id`) REFERENCES `sys_resource` (`id`),
  CONSTRAINT `FKo4megp72bdlng5bpjmo56v1wk` FOREIGN KEY (`parent_id`) REFERENCES `sys_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '', '', 'system', '系统管理', 'MENU', '', null, '0');
INSERT INTO `sys_resource` VALUES ('3', '/system/member/list', '/system/member', 'system-member', '用户管理', 'MENU', '', '1', null);
INSERT INTO `sys_resource` VALUES ('10', '/system/role/list,/system/role/resource/tree', '/system/role', 'system-role', '角色管理', 'MENU', '', '1', null);
INSERT INTO `sys_resource` VALUES ('11', '/system/resource/list', '/system/resource', 'system-resource', '资源管理', 'MENU', '', '1', null);
INSERT INTO `sys_resource` VALUES ('12', '', '', 'role-create', '创建角色', 'FUNCTION', '', '10', null);
INSERT INTO `sys_resource` VALUES ('13', '', '/system/role/delete', 'role-delete', '删除角色', 'FUNCTION', '', '10', null);
INSERT INTO `sys_resource` VALUES ('14', '/system/role/update,/system/role/save', '', 'role-save', '保存编辑', 'FUNCTION', '', '10', null);
INSERT INTO `sys_resource` VALUES ('17', '/system/role/resource/save', '', 'reole-resource-save', '分配资源', 'FUNCTION', '', '10', null);
INSERT INTO `sys_resource` VALUES ('18', '/system/resource/form,/system/resource/parent/tree,/system/resource/save', '', 'resource-create', '创建资源', 'FUNCTION', '', '11', null);
INSERT INTO `sys_resource` VALUES ('19', '/system/resource/form,/system/resource/parent/tree,/system/resource/save', '', 'resource-edit', '编辑', 'FUNCTION', '', '11', null);
INSERT INTO `sys_resource` VALUES ('20', '/system/resource/delete', '', 'resource-delete', '删除', 'FUNCTION', '', '11', null);
INSERT INTO `sys_resource` VALUES ('21', '/system/member/form,/system/member/save', '', 'member-create', '创建用户', 'FUNCTION', '', '3', null);
INSERT INTO `sys_resource` VALUES ('22', '/system/member/delete', '', 'member-delete', '删除用户', 'FUNCTION', '', '3', null);
INSERT INTO `sys_resource` VALUES ('23', '/system/member/form,/system/member/update', '', 'member-edit', '编辑用户', 'FUNCTION', '', '3', null);
INSERT INTO `sys_resource` VALUES ('26', '/system/member/password/reset', '', 'member-reset-password', '重置密码', 'FUNCTION', '', '3', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(512) DEFAULT NULL,
  `role_name` varchar(30) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r0jsnwb00o0n376ghyuahuqfg` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '有系统所有权限', '管理员', '');
INSERT INTO `sys_role` VALUES ('2', '主要是上课，可以查看学员管理模块', '教员', '');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `role_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  KEY `FKjwyt61kixx52wper9y0li38c2` (`resource_id`),
  KEY `FKasi3s87a7p562cyw0jt3m0isf` (`role_id`),
  CONSTRAINT `FK7urjh5xeujvp29nihwbs5b9kr` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FKasi3s87a7p562cyw0jt3m0isf` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FKjwyt61kixx52wper9y0li38c2` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`id`),
  CONSTRAINT `FKkj7e3cva1e2s3nsd0yghpbsnk` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('1', '1');
INSERT INTO `sys_role_resource` VALUES ('1', '3');
INSERT INTO `sys_role_resource` VALUES ('1', '21');
INSERT INTO `sys_role_resource` VALUES ('1', '22');
INSERT INTO `sys_role_resource` VALUES ('1', '23');
INSERT INTO `sys_role_resource` VALUES ('1', '10');
INSERT INTO `sys_role_resource` VALUES ('1', '12');
INSERT INTO `sys_role_resource` VALUES ('1', '13');
INSERT INTO `sys_role_resource` VALUES ('1', '14');
INSERT INTO `sys_role_resource` VALUES ('1', '17');
INSERT INTO `sys_role_resource` VALUES ('1', '11');
INSERT INTO `sys_role_resource` VALUES ('1', '18');
INSERT INTO `sys_role_resource` VALUES ('1', '19');
INSERT INTO `sys_role_resource` VALUES ('1', '20');
