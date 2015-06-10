/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : xkxt

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2015-06-10 18:01:48
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
INSERT INTO `tbmenu` VALUES ('6b94a0cb88d24bada197ad92dfd63ad3', '101101', 'ee942b37b08c4c0abea1520ff8595668', '101', '老师时间', '../time/findList.do', '2', '10', null);
INSERT INTO `tbmenu` VALUES ('9e8b12537f03447596bedae9ed4aac32', '100', null, null, '系统管理', '#', '1', '1', null);
INSERT INTO `tbmenu` VALUES ('5b4f897fe9d744bf9be341860f3e61e6', '100100', '9e8b12537f03447596bedae9ed4aac32', '100', '菜单管理', '../bmenu/findList.do', '2', '2', null);
INSERT INTO `tbmenu` VALUES ('e6c87b15587b42ad8d985318b65c0595', '100101', '9e8b12537f03447596bedae9ed4aac32', '100', '用户管理', '../buser/findList.do', '2', '3', null);
INSERT INTO `tbmenu` VALUES ('bb0569c94a5b46a3b6042d4ced5a6115', '100102', '9e8b12537f03447596bedae9ed4aac32', '100', '角色管理', '../role/findList.do', '2', '4', null);
INSERT INTO `tbmenu` VALUES ('b387b35ee1ac46a18d26beb544aea8a7', '100103', '9e8b12537f03447596bedae9ed4aac32', '100', '课程管理', '../curriculum/findList.do', '2', '5', null);
INSERT INTO `tbmenu` VALUES ('57d2bcff0d0a4af7bc3fc1e0b0f14798', '100104', '9e8b12537f03447596bedae9ed4aac32', '100', '修改密码', '../buser/modifypw.do', '2', '6', null);
INSERT INTO `tbmenu` VALUES ('f35c46ae893d49608b9a65bce6a472e6', '100105', '9e8b12537f03447596bedae9ed4aac32', '100', '我的信息', '../buser/findInfo.do', '2', '7', null);
INSERT INTO `tbmenu` VALUES ('ee942b37b08c4c0abea1520ff8595668', '101', null, null, '考勤管理', '#', '1', '8', null);
INSERT INTO `tbmenu` VALUES ('74de8845c1bb432a84c241fb03f5204b', '101100', 'ee942b37b08c4c0abea1520ff8595668', '101', '课时管理', '../lesson/findList.do', '2', '9', null);
INSERT INTO `tbmenu` VALUES ('d45e5b2508764852bc680b6b7417bbdc', '101102', 'ee942b37b08c4c0abea1520ff8595668', '101', '选课管理', '../elective/findList.do', '2', '11', null);

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
INSERT INTO `tbuser` VALUES ('c9b0546100ef46648fecda52ff787c85', 'eebc1fa86cdb4c8d81901151bf37eeca', 'admin', '小C', '4QrcOUm6Wau+VuBX8g+IPg==', '350626198906241533', null, null, null, '1', '3', '1');
INSERT INTO `tbuser` VALUES ('e2106767bfba4635a0a17e72436e8df1', 'eebc1fa86cdb4c8d81901151bf37eeca', 's', '小S', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, '1', '1', '1');
INSERT INTO `tbuser` VALUES ('3936c04ff10d4824b7cf4c53f1591ffb', 'eebc1fa86cdb4c8d81901151bf37eeca', 'tkls', '听课老师', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, '1', '1', '1');
INSERT INTO `tbuser` VALUES ('fe56f71c6959401a9461565eb7faa60e', 'eebc1fa86cdb4c8d81901151bf37eeca', 'xkls', '写课老师', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, '1', '1', '1');
INSERT INTO `tbuser` VALUES ('dffcded4e07944f29987cc51036f910d', 'eebc1fa86cdb4c8d81901151bf37eeca', 'qnls', '全能老师', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, '1', '1', '1');
INSERT INTO `tbuser` VALUES ('90f07928223842a4893370c34e4c7578', 'eebc1fa86cdb4c8d81901151bf37eeca', 'xs', '学生', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, '1', '2', '1');

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
-- Table structure for `telective`
-- ----------------------------
DROP TABLE IF EXISTS `telective`;
CREATE TABLE `telective` (
  `ID` varchar(100) NOT NULL,
  `USERID` varchar(100) default NULL,
  `CURRICULUMID` varchar(100) default NULL,
  `MUCHLESSON` int(11) default NULL,
  `CREATEDATE` varchar(20) default NULL,
  `STATUS` char(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of telective
-- ----------------------------
INSERT INTO `telective` VALUES ('a703f9c3c33f428b86db0cb1118d4748', '90f07928223842a4893370c34e4c7578', 'fd411d2711514405a4dfeb6c481a99fc', '12', '2015-06-10 17:58:16', '1');
INSERT INTO `telective` VALUES ('228c5c9f614b49b0ad4b8f2413909063', '90f07928223842a4893370c34e4c7578', 'a4e799b303e7473eb7a238de30090628', '14', '2015-06-10 17:58:24', '1');

-- ----------------------------
-- Table structure for `telectivelesson`
-- ----------------------------
DROP TABLE IF EXISTS `telectivelesson`;
CREATE TABLE `telectivelesson` (
  `ID` varchar(100) NOT NULL,
  `ELECTIVEID` varchar(100) default NULL,
  `LESSONID` varchar(100) default NULL,
  `TIMEID` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of telectivelesson
-- ----------------------------
INSERT INTO `telectivelesson` VALUES ('e1060c4455744cb49ea3f18e91de755a', 'a703f9c3c33f428b86db0cb1118d4748', '4dbd288e22894996a594e5333b3fae71', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('9f7faa2b45dd4fc28e4462d594f3f070', 'a703f9c3c33f428b86db0cb1118d4748', '256663984daf43a79ea3e994dff21c22', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('a18a24e187db469688509b780a06b617', 'a703f9c3c33f428b86db0cb1118d4748', '9e91abc9386b42799d634c07713ab7ed', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('2537ab86e0b04be69d2a58205126632d', 'a703f9c3c33f428b86db0cb1118d4748', 'e0c308f42aa447ca8984053279868b1c', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('34b2466b57ed49808519f98d106a04d5', 'a703f9c3c33f428b86db0cb1118d4748', '8e7bbb33791f4f55bf1f0cfd2c2a6693', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('4aea754f84d14928a4a18cd1d68a61ea', 'a703f9c3c33f428b86db0cb1118d4748', 'fb6aa965fee8494a9c97b863655fa24c', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('c42c9c1b9bcb4c5ca0990299073f0272', 'a703f9c3c33f428b86db0cb1118d4748', 'ddaa98affa2d4a018903231d681b97bb', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('a2cc5b9839a244de827fb6af04ffc711', 'a703f9c3c33f428b86db0cb1118d4748', '10489e6e7eec4b50a98d4a70508952f7', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('56e0468438f34ce49d5d17988b7e9790', 'a703f9c3c33f428b86db0cb1118d4748', 'ebe80b2bd714408b95c0fb6acdd88240', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('e4ff932c96e4469a93740f81a7d8dbc2', 'a703f9c3c33f428b86db0cb1118d4748', '25b401d281a54b739a66cf0ead20ab6c', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('5e29def42b044849a53974e1ceb000ce', 'a703f9c3c33f428b86db0cb1118d4748', '3a4b0fd4754348138487df521c59486c', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('ae8522ad412041d6a9e1563733a2f582', 'a703f9c3c33f428b86db0cb1118d4748', '9f3e7a4eb1644c57a6b74dc819ee0772', '330271bcc0464d98875244c9d0b06aa3');
INSERT INTO `telectivelesson` VALUES ('a15b40aaf6b74f27a5ffd65177563523', '228c5c9f614b49b0ad4b8f2413909063', 'fb6aa965fee8494a9c97b863655fa24c', '4be498f3d29e4ed68ce3e90c72fa4f79');
INSERT INTO `telectivelesson` VALUES ('7343d2a399b4418aa0342ac7eb5554f2', '228c5c9f614b49b0ad4b8f2413909063', 'ddaa98affa2d4a018903231d681b97bb', '4be498f3d29e4ed68ce3e90c72fa4f79');
INSERT INTO `telectivelesson` VALUES ('6d527f2fa2924bbda6060ca3f090b7e0', '228c5c9f614b49b0ad4b8f2413909063', 'fb6aa965fee8494a9c97b863655fa24c', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('e6bee4a5dd9c4c989efef0b2ee3950bb', '228c5c9f614b49b0ad4b8f2413909063', 'ddaa98affa2d4a018903231d681b97bb', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('9af0cfd4928e431a84d64511e67f4a79', '228c5c9f614b49b0ad4b8f2413909063', '10489e6e7eec4b50a98d4a70508952f7', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('ef0969788dca44b2a79ba19efb29d637', '228c5c9f614b49b0ad4b8f2413909063', 'ebe80b2bd714408b95c0fb6acdd88240', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('5d2370633b5541309495253845de2481', '228c5c9f614b49b0ad4b8f2413909063', '25b401d281a54b739a66cf0ead20ab6c', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('7360467aa958441c8ffb58a3b90e396f', '228c5c9f614b49b0ad4b8f2413909063', '8e7bbb33791f4f55bf1f0cfd2c2a6693', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('e58068ca9aea419facab998bda1cc5de', '228c5c9f614b49b0ad4b8f2413909063', 'e0c308f42aa447ca8984053279868b1c', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('ff57713d4ae540fe910eb1bbf4163648', '228c5c9f614b49b0ad4b8f2413909063', '9e91abc9386b42799d634c07713ab7ed', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('d9c73352eafa4fe7814bc6bab6499370', '228c5c9f614b49b0ad4b8f2413909063', '256663984daf43a79ea3e994dff21c22', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('46306763884544ea8d336f784d02848f', '228c5c9f614b49b0ad4b8f2413909063', '4dbd288e22894996a594e5333b3fae71', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('7019257c01554c7cae146e1f9222a82a', '228c5c9f614b49b0ad4b8f2413909063', '3a4b0fd4754348138487df521c59486c', '638ce536e11e479dbcc366d70b709952');
INSERT INTO `telectivelesson` VALUES ('b4e84a081820463e824073e7132c9009', '228c5c9f614b49b0ad4b8f2413909063', '9f3e7a4eb1644c57a6b74dc819ee0772', '638ce536e11e479dbcc366d70b709952');

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
INSERT INTO `tlesson` VALUES ('10489e6e7eec4b50a98d4a70508952f7', null, '07:00', '07:30', '1');
INSERT INTO `tlesson` VALUES ('ebe80b2bd714408b95c0fb6acdd88240', null, '07:30', '08:00', '1');
INSERT INTO `tlesson` VALUES ('25b401d281a54b739a66cf0ead20ab6c', null, '08:00', '08:30', '1');
INSERT INTO `tlesson` VALUES ('8e7bbb33791f4f55bf1f0cfd2c2a6693', null, '08:30', '09:00', '1');
INSERT INTO `tlesson` VALUES ('e0c308f42aa447ca8984053279868b1c', null, '09:00', '09:30', '1');
INSERT INTO `tlesson` VALUES ('9e91abc9386b42799d634c07713ab7ed', null, '09:30', '10:00', '1');
INSERT INTO `tlesson` VALUES ('fb6aa965fee8494a9c97b863655fa24c', null, '06:00', '06:30', '1');
INSERT INTO `tlesson` VALUES ('ddaa98affa2d4a018903231d681b97bb', null, '06:30', '07:00', '1');
INSERT INTO `tlesson` VALUES ('256663984daf43a79ea3e994dff21c22', null, '10:00', '10:30', '1');
INSERT INTO `tlesson` VALUES ('4dbd288e22894996a594e5333b3fae71', null, '10:30', '11:00', '1');
INSERT INTO `tlesson` VALUES ('3a4b0fd4754348138487df521c59486c', null, '11:00', '11:30', '1');
INSERT INTO `tlesson` VALUES ('9f3e7a4eb1644c57a6b74dc819ee0772', null, '11:30', '12:00', '1');
INSERT INTO `tlesson` VALUES ('4117bac2595047d5b4b51b4caa61de4a', null, '12:00', '12:30', '1');
INSERT INTO `tlesson` VALUES ('5fd244c38fc34a2db6b5dd5446e62ed8', null, '12:30', '13:00', '1');
INSERT INTO `tlesson` VALUES ('fca72d4d53c94788aba0b7b955b23263', null, '13:00', '13:30', '1');
INSERT INTO `tlesson` VALUES ('34981c45dad6486b80ebbf2b24cb9080', null, '13:30', '14:00', '1');
INSERT INTO `tlesson` VALUES ('2293743666174e50981ec0214a4bda25', null, '14:00', '14:30', '1');
INSERT INTO `tlesson` VALUES ('52d59ad6ca1a4a8e9e932d72384c55dc', null, '14:30', '15:00', '1');
INSERT INTO `tlesson` VALUES ('e89309cd0c5a438d823fdfba6852095c', null, '15:00', '15:30', '1');

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
INSERT INTO `troleautority` VALUES ('49c11bcceced41f3a232a2c58470a272', 'eebc1fa86cdb4c8d81901151bf37eeca', '57d2bcff0d0a4af7bc3fc1e0b0f14798');
INSERT INTO `troleautority` VALUES ('7f1fb51c487b4371a901bd24ab1a7f10', 'eebc1fa86cdb4c8d81901151bf37eeca', 'b387b35ee1ac46a18d26beb544aea8a7');
INSERT INTO `troleautority` VALUES ('857be649a12e40699759a96176833a84', 'eebc1fa86cdb4c8d81901151bf37eeca', 'bb0569c94a5b46a3b6042d4ced5a6115');
INSERT INTO `troleautority` VALUES ('7058212003da4a169488916a315594c4', 'eebc1fa86cdb4c8d81901151bf37eeca', 'e6c87b15587b42ad8d985318b65c0595');
INSERT INTO `troleautority` VALUES ('4455b7d818394e819392a1c7879e2a2d', 'eebc1fa86cdb4c8d81901151bf37eeca', '5b4f897fe9d744bf9be341860f3e61e6');
INSERT INTO `troleautority` VALUES ('c80f84d993654810aaa531f1a1fa9902', 'eebc1fa86cdb4c8d81901151bf37eeca', '9e8b12537f03447596bedae9ed4aac32');
INSERT INTO `troleautority` VALUES ('85ee5cd69274469e9ba8c098531a7f8c', 'eebc1fa86cdb4c8d81901151bf37eeca', 'd45e5b2508764852bc680b6b7417bbdc');
INSERT INTO `troleautority` VALUES ('d1639fc7842f45ee9caeeaed945c7fd2', 'eebc1fa86cdb4c8d81901151bf37eeca', '74de8845c1bb432a84c241fb03f5204b');
INSERT INTO `troleautority` VALUES ('25da44c33575469ba107c02521be48ec', 'eebc1fa86cdb4c8d81901151bf37eeca', '6b94a0cb88d24bada197ad92dfd63ad3');
INSERT INTO `troleautority` VALUES ('ff934466beb844f8a1d7e7228baedcb6', 'eebc1fa86cdb4c8d81901151bf37eeca', 'ee942b37b08c4c0abea1520ff8595668');
INSERT INTO `troleautority` VALUES ('fcf3ec72b71b42eab522de80c7a501fb', 'eebc1fa86cdb4c8d81901151bf37eeca', 'f35c46ae893d49608b9a65bce6a472e6');

-- ----------------------------
-- Table structure for `tsemester`
-- ----------------------------
DROP TABLE IF EXISTS `tsemester`;
CREATE TABLE `tsemester` (
  `ID` varchar(100) NOT NULL,
  `USERID` varchar(100) default NULL,
  `CREATEDATE` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsemester
-- ----------------------------
INSERT INTO `tsemester` VALUES ('360bd21e8c36464398afdeb594a40a0e', '90f07928223842a4893370c34e4c7578', '2015-06-10 17:58:30');

-- ----------------------------
-- Table structure for `tsemesterelective`
-- ----------------------------
DROP TABLE IF EXISTS `tsemesterelective`;
CREATE TABLE `tsemesterelective` (
  `ID` varchar(100) NOT NULL,
  `SEMESTERID` varchar(100) default NULL,
  `ELECTIVEID` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsemesterelective
-- ----------------------------
INSERT INTO `tsemesterelective` VALUES ('47852a040144427f85d8b9a0522c0104', '360bd21e8c36464398afdeb594a40a0e', 'a703f9c3c33f428b86db0cb1118d4748');
INSERT INTO `tsemesterelective` VALUES ('aad9215b1b3441e292473f5b255ce247', '360bd21e8c36464398afdeb594a40a0e', '228c5c9f614b49b0ad4b8f2413909063');

-- ----------------------------
-- Table structure for `tteachertime`
-- ----------------------------
DROP TABLE IF EXISTS `tteachertime`;
CREATE TABLE `tteachertime` (
  `ID` varchar(100) NOT NULL,
  `USERID` varchar(100) default NULL,
  `DATE` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tteachertime
-- ----------------------------
INSERT INTO `tteachertime` VALUES ('4be498f3d29e4ed68ce3e90c72fa4f79', 'fe56f71c6959401a9461565eb7faa60e', '2015-06-12');
INSERT INTO `tteachertime` VALUES ('bd724b1b3ebb424ebaf9db8acd80aa76', 'fe56f71c6959401a9461565eb7faa60e', '2015-06-11');
INSERT INTO `tteachertime` VALUES ('93a9ccb86cdb4ecda8211206887e8f22', 'dffcded4e07944f29987cc51036f910d', '2015-06-10');
INSERT INTO `tteachertime` VALUES ('330271bcc0464d98875244c9d0b06aa3', 'dffcded4e07944f29987cc51036f910d', '2015-06-11');
INSERT INTO `tteachertime` VALUES ('638ce536e11e479dbcc366d70b709952', 'fe56f71c6959401a9461565eb7faa60e', '2015-06-13');
INSERT INTO `tteachertime` VALUES ('cfd554550e0c454f98e52bfa64b1647b', '3936c04ff10d4824b7cf4c53f1591ffb', '2015-06-10');

-- ----------------------------
-- Table structure for `ttimelesson`
-- ----------------------------
DROP TABLE IF EXISTS `ttimelesson`;
CREATE TABLE `ttimelesson` (
  `ID` varchar(100) NOT NULL,
  `TIMEID` varchar(100) default NULL,
  `STARTTIME` varchar(5) default NULL,
  `ENDTIME` varchar(5) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ttimelesson
-- ----------------------------
INSERT INTO `ttimelesson` VALUES ('9d98b19720bf401a95ac47c859368280', 'cfd554550e0c454f98e52bfa64b1647b', '08:00', '09:00');
INSERT INTO `ttimelesson` VALUES ('df6a6dc7c8a345359d43f0653c0e5882', 'cfd554550e0c454f98e52bfa64b1647b', '06:00', '08:00');
INSERT INTO `ttimelesson` VALUES ('95393348843b40f081be322b597d07f0', '638ce536e11e479dbcc366d70b709952', '06:00', '12:00');
INSERT INTO `ttimelesson` VALUES ('b80b09f302f84967b48d875276be58c8', '330271bcc0464d98875244c9d0b06aa3', '06:00', '12:00');
INSERT INTO `ttimelesson` VALUES ('0385039854314f458419540357abdad6', '93a9ccb86cdb4ecda8211206887e8f22', '06:00', '08:00');
INSERT INTO `ttimelesson` VALUES ('88f09e8613224b93a53d3543b4505aea', 'bd724b1b3ebb424ebaf9db8acd80aa76', '06:00', '07:00');
INSERT INTO `ttimelesson` VALUES ('9e166f1e23434589b89fe947c7ed8745', '4be498f3d29e4ed68ce3e90c72fa4f79', '06:00', '07:00');

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
INSERT INTO `tusercurriculum` VALUES ('1a638a1826d44c97af5c8297ce25eade', 'dffcded4e07944f29987cc51036f910d', 'fd411d2711514405a4dfeb6c481a99fc');
INSERT INTO `tusercurriculum` VALUES ('ed076f6e645046c891786d2d2b289d15', '3936c04ff10d4824b7cf4c53f1591ffb', 'fd411d2711514405a4dfeb6c481a99fc');
INSERT INTO `tusercurriculum` VALUES ('e2e182a665434f1880efe0a4edc7b6e9', 'e2106767bfba4635a0a17e72436e8df1', 'fd411d2711514405a4dfeb6c481a99fc');
INSERT INTO `tusercurriculum` VALUES ('c8da55f84bb2411eb4505bf4088633ff', 'fe56f71c6959401a9461565eb7faa60e', 'a4e799b303e7473eb7a238de30090628');
INSERT INTO `tusercurriculum` VALUES ('20ad864ea0b44c94993bb41201316e89', 'dffcded4e07944f29987cc51036f910d', 'a4e799b303e7473eb7a238de30090628');

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
