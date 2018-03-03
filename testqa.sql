/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : testqa

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-08 18:38:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for auth_content_type
-- ----------------------------
DROP TABLE IF EXISTS `auth_content_type`;
CREATE TABLE `auth_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_content_type
-- ----------------------------
INSERT INTO `auth_content_type` VALUES ('1', 'log entry', 'admin', 'logentry');
INSERT INTO `auth_content_type` VALUES ('2', 'permission', 'auth', 'permission');
INSERT INTO `auth_content_type` VALUES ('3', 'group', 'auth', 'group');
INSERT INTO `auth_content_type` VALUES ('4', 'user', 'auth', 'user');
INSERT INTO `auth_content_type` VALUES ('5', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `auth_content_type` VALUES ('6', 'session', 'sessions', 'session');

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','inactive','deleted') DEFAULT 'active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------

-- ----------------------------
-- Table structure for group_permission_mapping
-- ----------------------------
DROP TABLE IF EXISTS `group_permission_mapping`;
CREATE TABLE `group_permission_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_permission_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `auth_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `permission` VALUES ('18', 'Can delete session', '6', 'delete_session');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(75) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','deleted') DEFAULT 'inactive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'macy', 'pbkdf2_sha256$12000$nIzFlPJQjMM3$/qktRqw3LgPPrFMkRaJKcATQflr58cgpsHtc2Tmob9Y=', 'five3@163.com', '', '', '1', '1', '2015-06-30 08:23:07', '2015-06-30 08:23:07', '2015-06-30 08:23:07', 'active');

-- ----------------------------
-- Table structure for user_group_mapping
-- ----------------------------
DROP TABLE IF EXISTS `user_group_mapping`;
CREATE TABLE `user_group_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_group_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for user_permission_mapping
-- ----------------------------
DROP TABLE IF EXISTS `user_permission_mapping`;
CREATE TABLE `user_permission_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_permission_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for ww_answer
-- ----------------------------
DROP TABLE IF EXISTS `ww_answer`;
CREATE TABLE `ww_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `content` text NOT NULL,
  `creator` int(11) NOT NULL,
  `like_count` int(11) DEFAULT '0',
  `unlike_count` int(11) DEFAULT '0',
  `is_accepted` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','deleted') DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`),
  CONSTRAINT `ww_answer_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `ww_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ww_answer
-- ----------------------------

-- ----------------------------
-- Table structure for ww_article
-- ----------------------------
DROP TABLE IF EXISTS `ww_article`;
CREATE TABLE `ww_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `creator` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','deleted') DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ww_article
-- ----------------------------

-- ----------------------------
-- Table structure for ww_comment
-- ----------------------------
DROP TABLE IF EXISTS `ww_comment`;
CREATE TABLE `ww_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `parent_id` int(11) NOT NULL,
  `parent_type` enum('article','question') DEFAULT 'question',
  `creator` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ww_comment
-- ----------------------------

-- ----------------------------
-- Table structure for ww_profile
-- ----------------------------
DROP TABLE IF EXISTS `ww_profile`;
CREATE TABLE `ww_profile` (
  `uid` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  CONSTRAINT `ww_profile_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ww_profile
-- ----------------------------

-- ----------------------------
-- Table structure for ww_question
-- ----------------------------
DROP TABLE IF EXISTS `ww_question`;
CREATE TABLE `ww_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `creator` int(11) NOT NULL,
  `answer_count` int(11) DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','deleted') DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  CONSTRAINT `ww_ask_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `ww_team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ww_question
-- ----------------------------

-- ----------------------------
-- Table structure for ww_tag
-- ----------------------------
DROP TABLE IF EXISTS `ww_tag`;
CREATE TABLE `ww_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `parent_type` enum('article','question') DEFAULT 'question',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ww_tag
-- ----------------------------

-- ----------------------------
-- Table structure for ww_team
-- ----------------------------
DROP TABLE IF EXISTS `ww_team`;
CREATE TABLE `ww_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `creator` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','deleted') DEFAULT 'active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ww_team
-- ----------------------------

-- ----------------------------
-- Table structure for ww_team_member
-- ----------------------------
DROP TABLE IF EXISTS `ww_team_member`;
CREATE TABLE `ww_team_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `mid` (`mid`),
  CONSTRAINT `ww_team_member_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `ww_team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ww_team_member_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ww_team_member
-- ----------------------------
