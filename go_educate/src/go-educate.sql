/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : xkxt

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2015-06-03 18:00:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbmenu`
-- ----------------------------
DROP TABLE IF EXISTS `tbmenu`;
CREATE TABLE `tbmenu` (
  `ID` varchar(100) NOT NULL,
  `MCODE` varchar(50) default NULL,
  `PID` varchar(100) default NULL,
  `PMCODE` varchar(50) default NULL,
  `MNAME` varchar(20) default NULL,
  `URLS` varchar(100) default NULL,
  `SERIES` int(11) default NULL,
  `SEQ` int(11) default NULL,
  `ISACTIVES` char(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbmenu
-- ----------------------------
INSERT INTO `tbmenu` VALUES ('9e8b12537f03447596bedae9ed4aac32', '100', null, null, '系统管理', '#', '1', '1', null);
INSERT INTO `tbmenu` VALUES ('5b4f897fe9d744bf9be341860f3e61e6', '100100', '9e8b12537f03447596bedae9ed4aac32', '100', '菜单管理', '../bmenu/findList.do', '2', '2', null);
INSERT INTO `tbmenu` VALUES ('e6c87b15587b42ad8d985318b65c0595', '100101', '9e8b12537f03447596bedae9ed4aac32', '100', '用户管理', '../buser/findList.do', '2', '3', null);
INSERT INTO `tbmenu` VALUES ('bb0569c94a5b46a3b6042d4ced5a6115', '100102', '9e8b12537f03447596bedae9ed4aac32', '100', '角色管理', '../role/findList.do', '2', '4', null);
INSERT INTO `tbmenu` VALUES ('b387b35ee1ac46a18d26beb544aea8a7', '100103', '9e8b12537f03447596bedae9ed4aac32', '100', '课程管理', '../curriculum/findList.do', '2', '5', null);
INSERT INTO `tbmenu` VALUES ('57d2bcff0d0a4af7bc3fc1e0b0f14798', '100104', '9e8b12537f03447596bedae9ed4aac32', '100', '修改密码', '../buser/modifypw.do', '2', '6', null);
INSERT INTO `tbmenu` VALUES ('f35c46ae893d49608b9a65bce6a472e6', '100105', '9e8b12537f03447596bedae9ed4aac32', '100', '我的信息', '../buser/findInfo.do', '2', '7', null);
INSERT INTO `tbmenu` VALUES ('ee942b37b08c4c0abea1520ff8595668', '101', null, null, '考勤管理', '#', '1', '8', null);
INSERT INTO `tbmenu` VALUES ('74de8845c1bb432a84c241fb03f5204b', '101100', 'ee942b37b08c4c0abea1520ff8595668', '101', '课时管理', '../lesson/findList.do', '2', '9', null);

-- ----------------------------
-- Table structure for `tbuser`
-- ----------------------------
DROP TABLE IF EXISTS `tbuser`;
CREATE TABLE `tbuser` (
  `ID` varchar(100) NOT NULL,
  `ROLEID` varchar(100) default NULL,
  `TEXT` varchar(20) default NULL,
  `NAME` varchar(20) default NULL,
  `PASSWORD` varchar(200) default NULL,
  `IDENF` varchar(20) default NULL,
  `TELEPHONE` varchar(15) default NULL,
  `QQ` varchar(20) default NULL,
  `EMAIL` varchar(50) default NULL,
  `SEX` char(1) default NULL,
  `TYPE` char(1) default NULL,
  `ISACTIVES` char(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbuser
-- ----------------------------
INSERT INTO `tbuser` VALUES ('c9b0546100ef46648fecda52ff787c85', 'eebc1fa86cdb4c8d81901151bf37eeca', 'admin', '小C', '4QrcOUm6Wau+VuBX8g+IPg==', '350626198906241533', null, null, null, '1', '1', '1');

-- ----------------------------
-- Table structure for `tcurriculum`
-- ----------------------------
DROP TABLE IF EXISTS `tcurriculum`;
CREATE TABLE `tcurriculum` (
  `ID` varchar(100) NOT NULL,
  `NAME` varchar(50) default NULL,
  `ISACTIVES` char(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tcurriculum
-- ----------------------------
INSERT INTO `tcurriculum` VALUES ('fd411d2711514405a4dfeb6c481a99fc', '听课', '1');
INSERT INTO `tcurriculum` VALUES ('a4e799b303e7473eb7a238de30090628', '写课', '1');

-- ----------------------------
-- Table structure for `tlesson`
-- ----------------------------
DROP TABLE IF EXISTS `tlesson`;
CREATE TABLE `tlesson` (
  `ID` varchar(100) NOT NULL,
  `NAME` varchar(50) default NULL,
  `STARTTIME` varchar(5) default NULL,
  `ENDTIME` varchar(5) default NULL,
  `ISACTIVES` char(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlesson
-- ----------------------------
INSERT INTO `tlesson` VALUES ('10489e6e7eec4b50a98d4a70508952f7', '早读课', '07:00', '08:00', '1');
INSERT INTO `tlesson` VALUES ('ebe80b2bd714408b95c0fb6acdd88240', '第一节课', '08:00', '09:00', '1');

-- ----------------------------
-- Table structure for `trole`
-- ----------------------------
DROP TABLE IF EXISTS `trole`;
CREATE TABLE `trole` (
  `ID` varchar(100) NOT NULL,
  `ROLETEXT` varchar(20) default NULL,
  `ISACTIVES` char(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trole
-- ----------------------------
INSERT INTO `trole` VALUES ('eebc1fa86cdb4c8d81901151bf37eeca', '超级管理', '1');

-- ----------------------------
-- Table structure for `troleautority`
-- ----------------------------
DROP TABLE IF EXISTS `troleautority`;
CREATE TABLE `troleautority` (
  `ID` varchar(100) NOT NULL,
  `ROLEID` varchar(100) default NULL,
  `MENUID` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of troleautority
-- ----------------------------
INSERT INTO `troleautority` VALUES ('9a92463629a94af69bf94097dfc58311', 'eebc1fa86cdb4c8d81901151bf37eeca', 'b387b35ee1ac46a18d26beb544aea8a7');
INSERT INTO `troleautority` VALUES ('7cc008e28de54fd29a3c5dba2f65a4fc', 'eebc1fa86cdb4c8d81901151bf37eeca', 'bb0569c94a5b46a3b6042d4ced5a6115');
INSERT INTO `troleautority` VALUES ('239e307ad04a4505896efd91559ed29e', 'eebc1fa86cdb4c8d81901151bf37eeca', 'e6c87b15587b42ad8d985318b65c0595');
INSERT INTO `troleautority` VALUES ('5d0d8bf16db24f8aa2b3ee1aa6e60e37', 'eebc1fa86cdb4c8d81901151bf37eeca', '5b4f897fe9d744bf9be341860f3e61e6');
INSERT INTO `troleautority` VALUES ('c9d5fa438a3441afb98f44add871d099', 'eebc1fa86cdb4c8d81901151bf37eeca', '9e8b12537f03447596bedae9ed4aac32');
INSERT INTO `troleautority` VALUES ('8612fdfd86c2474c9ac06497893d0144', 'eebc1fa86cdb4c8d81901151bf37eeca', '74de8845c1bb432a84c241fb03f5204b');
INSERT INTO `troleautority` VALUES ('0c30b6ceeec24103a7c171c0766fa5f2', 'eebc1fa86cdb4c8d81901151bf37eeca', 'ee942b37b08c4c0abea1520ff8595668');
INSERT INTO `troleautority` VALUES ('c714c919e1924e97b392fbaf504c8e5a', 'eebc1fa86cdb4c8d81901151bf37eeca', '57d2bcff0d0a4af7bc3fc1e0b0f14798');
INSERT INTO `troleautority` VALUES ('713dd7f04cd34d8c97ea0b870b42654e', 'eebc1fa86cdb4c8d81901151bf37eeca', 'f35c46ae893d49608b9a65bce6a472e6');

-- ----------------------------
-- Table structure for `tusercurriculum`
-- ----------------------------
DROP TABLE IF EXISTS `tusercurriculum`;
CREATE TABLE `tusercurriculum` (
  `ID` varchar(100) NOT NULL,
  `USERID` varchar(100) default NULL,
  `CURRICULUMID` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tusercurriculum
-- ----------------------------
INSERT INTO `tusercurriculum` VALUES ('07bb4f9a80da4bd68d9cc1454f5fe264', 'c9b0546100ef46648fecda52ff787c85', 'a4e799b303e7473eb7a238de30090628');

-- ----------------------------
-- Table structure for `tuserrole`
-- ----------------------------
DROP TABLE IF EXISTS `tuserrole`;
CREATE TABLE `tuserrole` (
  `ID` varchar(100) NOT NULL,
  `USERID` varchar(100) default NULL,
  `ROLEID` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuserrole
-- ----------------------------
