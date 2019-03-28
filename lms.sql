/*
Navicat MySQL Data Transfer

Source Server         : mysql_local
Source Server Version : 100137
Source Host           : localhost:3306
Source Database       : lms

Target Server Type    : MYSQL
Target Server Version : 100137
File Encoding         : 65001

Date: 2019-03-26 08:11:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `physical_form` enum('Book','Journal','CD/DVD','Manuscript','Others') CHARACTER SET utf8 NOT NULL,
  `author` text CHARACTER SET utf8 NOT NULL,
  `subtitle` varchar(100) CHARACTER SET utf8 NOT NULL,
  `edition_year` year(4) NOT NULL,
  `publisher` varchar(100) CHARACTER SET utf8 NOT NULL,
  `series` varchar(100) CHARACTER SET utf8 NOT NULL,
  `size1` enum('Medium','Large','Huge','Small','Tiny') CHARACTER SET utf8 NOT NULL,
  `price` varchar(100) CHARACTER SET utf8 NOT NULL,
  `call_no` varchar(100) CHARACTER SET utf8 NOT NULL,
  `location` varchar(100) CHARACTER SET utf8 NOT NULL,
  `clue_page` varchar(100) CHARACTER SET utf8 NOT NULL,
  `category_id` varchar(100) CHARACTER SET utf8 NOT NULL,
  `editor` varchar(100) CHARACTER SET utf8 NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `edition` varchar(100) CHARACTER SET utf8 NOT NULL,
  `publishing_year` year(4) NOT NULL,
  `publication_place` varchar(100) CHARACTER SET utf8 NOT NULL,
  `number_of_pages` int(11) NOT NULL,
  `number_of_books` int(11) NOT NULL,
  `dues` varchar(100) CHARACTER SET utf8 NOT NULL,
  `isbn` varchar(100) CHARACTER SET utf8 NOT NULL,
  `source_details` enum('Local Purchase','University','World Bank Donation','Personal Donation','Others') CHARACTER SET utf8 NOT NULL,
  `notes` varchar(100) CHARACTER SET utf8 NOT NULL,
  `cover` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT 'cover_default.jpg',
  `pdf` text CHARACTER SET utf8,
  `is_uploaded` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `deleted` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `status` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `add_date` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of book_info
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for circulation
-- ----------------------------
DROP TABLE IF EXISTS `circulation`;
CREATE TABLE `circulation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(99) NOT NULL,
  `book_id` varchar(99) NOT NULL,
  `issue_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `return_date` date NOT NULL,
  `fine_amount` double NOT NULL,
  `is_returned` tinyint(1) NOT NULL,
  `is_expired` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of circulation
-- ----------------------------

-- ----------------------------
-- Table structure for circulation_config
-- ----------------------------
DROP TABLE IF EXISTS `circulation_config`;
CREATE TABLE `circulation_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_type_id` varchar(99) NOT NULL,
  `issue_day_limit` varchar(99) NOT NULL,
  `issu_book_limit` int(11) NOT NULL,
  `fine_per_day` double NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_type_id` (`member_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of circulation_config
-- ----------------------------

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(200) NOT NULL,
  `ip_address` varchar(200) NOT NULL,
  `user_agent` varchar(199) NOT NULL,
  `last_activity` varchar(199) NOT NULL,
  `user_data` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------
INSERT INTO `ci_sessions` VALUES ('365aa547cbb7aed2538dfe9fbbe3cfeb', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36 OPR/58', '1553561539', 'a:4:{s:9:\"logged_in\";i:1;s:8:\"username\";s:5:\"admin\";s:9:\"user_type\";s:5:\"Admin\";s:9:\"member_id\";s:1:\"1\";}');
INSERT INTO `ci_sessions` VALUES ('50c02b8fbae42795fce643b59b6db095', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1546581376', '');
INSERT INTO `ci_sessions` VALUES ('61ed0b5e0c44ae3d04fe8768aac6fb1a', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1546574512', '');
INSERT INTO `ci_sessions` VALUES ('6e1abce2511f7f42f6e854086fd35f12', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1546626049', '');
INSERT INTO `ci_sessions` VALUES ('77cc7566da515b66f9bb7a4fd5db324b', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 OPR/5', '1546535099', 'a:5:{s:9:\"user_data\";s:0:\"\";s:9:\"logged_in\";i:1;s:8:\"username\";s:5:\"admin\";s:9:\"user_type\";s:5:\"Admin\";s:9:\"member_id\";s:1:\"1\";}');
INSERT INTO `ci_sessions` VALUES ('b6e3550629a6a2e08b51cef15c0e2c3a', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1546576353', '');
INSERT INTO `ci_sessions` VALUES ('cb25cefa229671a15017cbce4f472a21', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1546593776', '');
INSERT INTO `ci_sessions` VALUES ('d505a0cc07ce0783c8f2a21e228785aa', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1546575491', '');
INSERT INTO `ci_sessions` VALUES ('d5cb3ce0dd41f45b2574a88fc940f525', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1546750866', '');
INSERT INTO `ci_sessions` VALUES ('f6288cb5ea41613f43b18af2f14c27aa', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1546532541', 'a:5:{s:9:\"user_data\";s:0:\"\";s:9:\"logged_in\";i:1;s:8:\"username\";s:5:\"admin\";s:9:\"user_type\";s:5:\"Admin\";s:9:\"member_id\";s:1:\"1\";}');

-- ----------------------------
-- Table structure for daily_read_material
-- ----------------------------
DROP TABLE IF EXISTS `daily_read_material`;
CREATE TABLE `daily_read_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` varchar(99) NOT NULL,
  `read_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of daily_read_material
-- ----------------------------

-- ----------------------------
-- Table structure for email_config
-- ----------------------------
DROP TABLE IF EXISTS `email_config`;
CREATE TABLE `email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `smtp_host` varchar(250) NOT NULL,
  `smtp_port` varchar(100) NOT NULL,
  `smtp_user` varchar(100) NOT NULL,
  `smtp_password` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of email_config
-- ----------------------------

-- ----------------------------
-- Table structure for forget_password
-- ----------------------------
DROP TABLE IF EXISTS `forget_password`;
CREATE TABLE `forget_password` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `confirmation_code` varchar(15) CHARACTER SET latin1 NOT NULL,
  `email` varchar(250) CHARACTER SET latin1 NOT NULL,
  `success` int(11) NOT NULL DEFAULT '0',
  `expiration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forget_password
-- ----------------------------

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(99) CHARACTER SET utf8 NOT NULL,
  `type_id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `password` varchar(99) NOT NULL,
  `address` text CHARACTER SET utf8 NOT NULL,
  `user_type` enum('Member','Admin') NOT NULL,
  `status` enum('1','0') NOT NULL,
  `add_date` date NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'admin', '0', 'admin@gmail.com', '', '21232f297a57a5a743894a0e4a801fc3', '', 'Admin', '1', '2016-04-10', '0');
INSERT INTO `member` VALUES ('2', 'test', '0', 'test@gmail.com', '34', '098f6bcd4621d373cade4e832627b4f6', 'test', 'Member', '1', '2019-01-03', '0');

-- ----------------------------
-- Table structure for member_type
-- ----------------------------
DROP TABLE IF EXISTS `member_type`;
CREATE TABLE `member_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_type_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_type_name` (`member_type_name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of member_type
-- ----------------------------

-- ----------------------------
-- Table structure for request_book
-- ----------------------------
DROP TABLE IF EXISTS `request_book`;
CREATE TABLE `request_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `book_title` text CHARACTER SET utf8 NOT NULL,
  `author` text CHARACTER SET utf8 NOT NULL,
  `edition` varchar(200) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `request_date` date NOT NULL,
  `reply` text CHARACTER SET utf8 NOT NULL,
  `request_status` varchar(55) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of request_book
-- ----------------------------

-- ----------------------------
-- Table structure for sms_config
-- ----------------------------
DROP TABLE IF EXISTS `sms_config`;
CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` enum('planet','plivo','twilio','clickatell','nexmo') CHARACTER SET utf8 NOT NULL,
  `auth_id` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sms_config
-- ----------------------------
INSERT INTO `sms_config` VALUES ('1', 'clickatell', 'gd', 'dg', '1', 'hey');

-- ----------------------------
-- Table structure for sms_email_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_email_history`;
CREATE TABLE `sms_email_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `type` enum('SMS','Email','Notification') NOT NULL,
  `sent_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sms_email_history
-- ----------------------------

-- ----------------------------
-- Table structure for terms_and_condition
-- ----------------------------
DROP TABLE IF EXISTS `terms_and_condition`;
CREATE TABLE `terms_and_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terms_and_condition` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of terms_and_condition
-- ----------------------------
INSERT INTO `terms_and_condition` VALUES ('1', '<ul>\r\n <li><strong>All copyright, trade marks, design rights,</strong> patents and other intellectual property rights (registered and unregistered) in and on LMS Online Services and LMS Content belong to the LMS and/or third parties (which may include you or other users.)</li>\r\n <li>The LMS reserves all of its rights in LMS Content and LMS Online Services. Nothing in the Terms grants you a right or licence to use any trade mark, design right or copyright owned or controlled by the LMS or any other third party except as expressly provided in the Terms.</li>\r\n</ul>');
SET FOREIGN_KEY_CHECKS=1;
