/*
Navicat MySQL Data Transfer

Source Server         : mysql_local
Source Server Version : 100137
Source Host           : localhost:3306
Source Database       : lib

Target Server Type    : MYSQL
Target Server Version : 100137
File Encoding         : 65001

Date: 2019-03-26 08:11:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authors
-- ----------------------------
DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_name` (`author_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of authors
-- ----------------------------

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `book_copies` int(50) NOT NULL,
  `book_pub` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `digital_file` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `isbn` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `isbn_13` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(40) NOT NULL,
  `copyright_year` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `date_receive` date NOT NULL,
  `date_added` datetime NOT NULL,
  `status` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `custom_fields` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `isbn_2` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of books
-- ----------------------------

-- ----------------------------
-- Table structure for book_authors
-- ----------------------------
DROP TABLE IF EXISTS `book_authors`;
CREATE TABLE `book_authors` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `book_id` int(100) NOT NULL,
  `author_id` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of book_authors
-- ----------------------------

-- ----------------------------
-- Table structure for book_categories
-- ----------------------------
DROP TABLE IF EXISTS `book_categories`;
CREATE TABLE `book_categories` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `book_id` int(100) NOT NULL,
  `category_id` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of book_categories
-- ----------------------------

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(50) NOT NULL,
  `date_borrow` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `due_date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `borrowerid` (`member_id`),
  KEY `borrowid` (`borrow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of borrow
-- ----------------------------

-- ----------------------------
-- Table structure for borrowdetails
-- ----------------------------
DROP TABLE IF EXISTS `borrowdetails`;
CREATE TABLE `borrowdetails` (
  `borrow_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `borrow_id` int(11) NOT NULL,
  `borrow_status` enum('pending','returned','lost','') COLLATE utf8_unicode_ci NOT NULL,
  `fine` decimal(6,2) DEFAULT NULL,
  `price_lost_book` decimal(6,2) DEFAULT NULL,
  `date_return` datetime DEFAULT NULL,
  PRIMARY KEY (`borrow_details_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of borrowdetails
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`id`),
  UNIQUE KEY `category_name` (`category_name`),
  KEY `classid` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(5) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', 'Class 1', '1');
INSERT INTO `class` VALUES ('2', 'Class 2', '1');
INSERT INTO `class` VALUES ('3', 'Class 3', '1');
INSERT INTO `class` VALUES ('4', 'Class 4', '1');
INSERT INTO `class` VALUES ('5', 'Class 5', '1');
INSERT INTO `class` VALUES ('6', 'Class 6', '1');
INSERT INTO `class` VALUES ('7', 'Class 7', '1');
INSERT INTO `class` VALUES ('8', 'Class 8', '1');
INSERT INTO `class` VALUES ('9', 'Olevel', '1');
INSERT INTO `class` VALUES ('10', 'Alevel', '1');
INSERT INTO `class` VALUES ('11', 'IT', '3');
INSERT INTO `class` VALUES ('12', 'Junior Teacher', '2');
INSERT INTO `class` VALUES ('13', 'Senior Teacher', '2');
INSERT INTO `class` VALUES ('14', 'Accountant', '3');
INSERT INTO `class` VALUES ('15', 'Guest', '4');

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('1', 'admin', 'Administrator');
INSERT INTO `groups` VALUES ('2', 'members', 'General User');

-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of login_attempts
-- ----------------------------

-- ----------------------------
-- Table structure for member_types
-- ----------------------------
DROP TABLE IF EXISTS `member_types`;
CREATE TABLE `member_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowertype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fine` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `issue_limit_books` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `issue_limit_day` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of member_types
-- ----------------------------
INSERT INTO `member_types` VALUES ('1', 'Student', '', '10', '10');
INSERT INTO `member_types` VALUES ('2', 'Instructional', '', '0', '0');
INSERT INTO `member_types` VALUES ('3', 'Management', '', '10', '10');
INSERT INTO `member_types` VALUES ('4', 'Guest', '', '10', '10');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `books-index` tinyint(1) DEFAULT '0',
  `books-add` tinyint(1) DEFAULT '0',
  `books-edit` tinyint(1) DEFAULT '0',
  `books-delete` tinyint(1) DEFAULT '0',
  `books-read` tinyint(1) DEFAULT '0',
  `books-getBookDetails` tinyint(1) DEFAULT '0',
  `books-import_csv` tinyint(1) DEFAULT '0',
  `book-print_barcodes` tinyint(1) NOT NULL DEFAULT '0',
  `settings-index` tinyint(1) DEFAULT '0',
  `issued-index` tinyint(1) DEFAULT '0',
  `books-categories` tinyint(1) DEFAULT '0',
  `books-authors` tinyint(1) DEFAULT '0',
  `borrow-index` tinyint(1) DEFAULT '0',
  `borrow-bookreturn` tinyint(1) DEFAULT '0',
  `borrow-borrowed` tinyint(1) DEFAULT '0',
  `settings-sms` tinyint(1) DEFAULT '0',
  `settings-list_db` tinyint(1) DEFAULT '0',
  `settings-backup_db` tinyint(1) DEFAULT '0',
  `settings-restore_db` tinyint(1) DEFAULT '0',
  `settings-remove_db` tinyint(1) DEFAULT '0',
  `auth-index` tinyint(1) DEFAULT '0',
  `auth-create_user` tinyint(1) DEFAULT '0',
  `auth-groups` tinyint(1) DEFAULT '0',
  `auth-edit_group` tinyint(1) DEFAULT '0',
  `auth-member_types` tinyint(1) DEFAULT '0',
  `auth-occupations` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-quick_inventory` tinyint(1) DEFAULT '0',
  `delayed-index` tinyint(1) NOT NULL DEFAULT '0',
  `delayed-due_books_json` tinyint(1) NOT NULL DEFAULT '0',
  `delayed-email_templates` tinyint(1) NOT NULL DEFAULT '0',
  `delayed-notify_delayed` tinyint(1) NOT NULL DEFAULT '0',
  `request-index` tinyint(1) NOT NULL,
  `request-add_requested_books` tinyint(1) NOT NULL,
  `request-delete_request` tinyint(1) NOT NULL,
  `request-edit_request` tinyint(1) NOT NULL,
  `requested_books-index` tinyint(1) NOT NULL,
  `requested_books-email_templates` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '1', '1');
INSERT INTO `permissions` VALUES ('2', '2', '0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for requested_books
-- ----------------------------
DROP TABLE IF EXISTS `requested_books`;
CREATE TABLE `requested_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_title` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `author_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `remarks` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of requested_books
-- ----------------------------

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `section_id` int(50) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('1', 'A');
INSERT INTO `section` VALUES ('2', 'B');
INSERT INTO `section` VALUES ('3', 'C');
INSERT INTO `section` VALUES ('4', 'D');
INSERT INTO `section` VALUES ('5', 'E');
INSERT INTO `section` VALUES ('6', 'F');
INSERT INTO `section` VALUES ('7', 'G');
INSERT INTO `section` VALUES ('8', 'H');
INSERT INTO `section` VALUES ('9', 'I');
INSERT INTO `section` VALUES ('10', 'J');
INSERT INTO `section` VALUES ('11', 'K');
INSERT INTO `section` VALUES ('12', 'L');
INSERT INTO `section` VALUES ('13', 'M');
INSERT INTO `section` VALUES ('14', 'N');
INSERT INTO `section` VALUES ('15', 'O');
INSERT INTO `section` VALUES ('16', 'P');
INSERT INTO `section` VALUES ('17', 'Q');
INSERT INTO `section` VALUES ('18', 'R');
INSERT INTO `section` VALUES ('19', 'S');
INSERT INTO `section` VALUES ('20', 'T');
INSERT INTO `section` VALUES ('21', 'U');
INSERT INTO `section` VALUES ('22', 'V');
INSERT INTO `section` VALUES ('23', 'W');
INSERT INTO `section` VALUES ('24', 'X');
INSERT INTO `section` VALUES ('25', 'Y');
INSERT INTO `section` VALUES ('26', 'Z');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `issue_conf` int(1) NOT NULL COMMENT 'By Member Types: 2, System-Wide:1',
  `fine` int(10) NOT NULL,
  `issue_limit_days` int(10) NOT NULL,
  `issue_limit_books` int(10) NOT NULL,
  `language` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'english',
  `toggle_rtl` tinyint(1) NOT NULL DEFAULT '0',
  `currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `favicon` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `title_small` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `terms_conditions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `books_custom_fields` longtext COLLATE utf8_unicode_ci NOT NULL,
  `smtp_host` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_port` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '25',
  `version` decimal(6,2) DEFAULT NULL,
  `issue_limit_days_extendable` tinyint(1) NOT NULL,
  `notify_delayed_no_days_limit_toggle` tinyint(1) NOT NULL,
  `email_request` tinyint(1) NOT NULL,
  `sms_request` tinyint(1) NOT NULL,
  `front_per_page` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'Open Library Management System', '2', '50', '10', '10', 'english', '0', 'USD', 'uskhan099@gmail.com', '0c3b1741b8fdb5abe04dd94ed84d0ca1.png', '2645b06c18cb7089f7fa63b8de49e127.ico', '1-A1, Gulberg III, Lahore', '123467890', 'LMS', '<ul>\r\n <li><strong>All copyright, trade marks, design rights,</strong> patents and other intellectual property rights (registered and unregistered) in and on LMS Online Services and LMS Content belong to the LMS and/or third parties (which may include you or other users.)</li>\r\n <li>The LMS reserves all of its rights in LMS Content and LMS Online Services. Nothing in the Terms grants you a right or licence to use any trade mark, design right or copyright owned or controlled by the LMS or any other third party except as expressly provided in the Terms.</li>\r\n</ul>', 'Book Pages', 'ssl://smtp.gmail.com', '2312456789@gmail.com', 'password', '465', '2.30', '1', '0', '1', '1', '12');

-- ----------------------------
-- Table structure for sms_settings
-- ----------------------------
DROP TABLE IF EXISTS `sms_settings`;
CREATE TABLE `sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_gateway` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `auth_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `auth_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sms_settings
-- ----------------------------
INSERT INTO `sms_settings` VALUES ('1', 'nexmo', '2132456', '2345', '12345', '+123245');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female','Other','') COLLATE utf8_unicode_ci NOT NULL,
  `member_unique_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', null, null, null, null, '1268889823', '1553562073', '1', 'Admin', 'Admin', 'ADMIN', '0', 'Male', '14707643131136', '1', '1', 'A', 'no_image.png', 'afs');
INSERT INTO `users` VALUES ('2', '10.0.2.2', 'member', '$2y$08$m/U9GokO/ucb2zR1qolGvOHJ9rZBPerD67Bry/WGCDT3E5uCPvp92', null, 'member@member.com', null, null, null, null, '1470680101', '1485014852', '1', 'Student', '2', 'OTS', '09876543', 'Male', '14719715091102', '1', '2', '', 'be4bcb5a784d2b831dfaae08bca4071f.jpg', 'Canada, Pak');

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES ('1', '1', '1');
INSERT INTO `users_groups` VALUES ('2', '2', '2');
SET FOREIGN_KEY_CHECKS=1;
