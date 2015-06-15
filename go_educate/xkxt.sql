/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : xkxt

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2015-06-15 17:58:19
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
INSERT INTO `tbmenu` VALUES ('caa2c5466fcf41e4843866757e9022a5', '101103', 'ee942b37b08c4c0abea1520ff8595668', '101', '学期管理', '../semester/findList.do', '2', '12', null);
INSERT INTO `tbmenu` VALUES ('be513030cafd4314a7fdf0989453a46f', '101104', 'ee942b37b08c4c0abea1520ff8595668', '101', '老师课表', '../teacherkb/findList.do', '2', '13', null);
INSERT INTO `tbmenu` VALUES ('cd6ef124bb3644d897b5704262aafc49', '101105', 'ee942b37b08c4c0abea1520ff8595668', '101', '节课管理', '../class/findList.do', '2', '14', null);

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
INSERT INTO `tbuser` VALUES ('377830a9209a47c29990ac4e308b6240', 'eebc1fa86cdb4c8d81901151bf37eeca', 'xxs', '小学生', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, '1', '2', '1');

-- ----------------------------
-- Table structure for `tclass`
-- ----------------------------
DROP TABLE IF EXISTS `tclass`;
CREATE TABLE `tclass` (
  `ID` varchar(100) NOT NULL,
  `SEVERAL` int(11) default NULL,
  `LSUSERID` varchar(100) default NULL,
  `XSUSERID` varchar(100) default NULL,
  `DATE` varchar(10) default NULL,
  `CURRICULUMID` varchar(100) default NULL,
  `MUCHLESSON` int(11) default NULL,
  `STARTTIME` varchar(5) default NULL,
  `ENDTIME` varchar(5) default NULL,
  `CREATEDATE` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tclass
-- ----------------------------
INSERT INTO `tclass` VALUES ('32972f26d957496d9cf375ffc95b8097', null, 'dffcded4e07944f29987cc51036f910d', '90f07928223842a4893370c34e4c7578', '2015-06-16', 'a4e799b303e7473eb7a238de30090628', '1', '08:00', '08:30', '2015-06-15 11:21:30');
INSERT INTO `tclass` VALUES ('f73d174bdd0c414989ac8b8f271e1c09', null, 'dffcded4e07944f29987cc51036f910d', '90f07928223842a4893370c34e4c7578', '2015-06-16', 'fd411d2711514405a4dfeb6c481a99fc', '2', '07:00', '08:00', '2015-06-15 11:21:30');

-- ----------------------------
-- Table structure for `tclassel`
-- ----------------------------
DROP TABLE IF EXISTS `tclassel`;
CREATE TABLE `tclassel` (
  `ID` varchar(100) NOT NULL,
  `CLASSID` varchar(100) default NULL,
  `ELID` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tclassel
-- ----------------------------
INSERT INTO `tclassel` VALUES ('cd4488f1ae624bc5916dacee8002750d', '32972f26d957496d9cf375ffc95b8097', '66a495b9c28a4e1bb723f6e5f819822a');
INSERT INTO `tclassel` VALUES ('05d46bf93f0242889e78c8a557189868', 'f73d174bdd0c414989ac8b8f271e1c09', '7ab05ce274244519b3716e2ecedab9c5');
INSERT INTO `tclassel` VALUES ('6975d6b34ce442aea68f6a26f2efe9db', 'f73d174bdd0c414989ac8b8f271e1c09', '623a0e7cfa9e495484f5f204d1c7f891');

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
INSERT INTO `telective` VALUES ('0c5e92d918a14977995515f4056fed75', '90f07928223842a4893370c34e4c7578', 'fd411d2711514405a4dfeb6c481a99fc', null, '2015-06-15 11:21:21', '1');
INSERT INTO `telective` VALUES ('052bca64837a4379a0d25e0021fceaa6', '90f07928223842a4893370c34e4c7578', 'a4e799b303e7473eb7a238de30090628', null, '2015-06-15 11:21:26', '1');

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
INSERT INTO `telectivelesson` VALUES ('623a0e7cfa9e495484f5f204d1c7f891', '0c5e92d918a14977995515f4056fed75', '10489e6e7eec4b50a98d4a70508952f7', '61547659facb40e3a2f026cd161328f8');
INSERT INTO `telectivelesson` VALUES ('7ab05ce274244519b3716e2ecedab9c5', '0c5e92d918a14977995515f4056fed75', 'ebe80b2bd714408b95c0fb6acdd88240', '61547659facb40e3a2f026cd161328f8');
INSERT INTO `telectivelesson` VALUES ('66a495b9c28a4e1bb723f6e5f819822a', '052bca64837a4379a0d25e0021fceaa6', '25b401d281a54b739a66cf0ead20ab6c', '61547659facb40e3a2f026cd161328f8');

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
INSERT INTO `tlesson` VALUES ('b1c33eeee3664d1ba4c480bd24f49916', null, '15:30', '16:00', '1');
INSERT INTO `tlesson` VALUES ('8822d9a710d94067a34a8daa8c99eb5a', null, '16:00', '16:30', '1');
INSERT INTO `tlesson` VALUES ('4b1d1cbeebff413581a48f71725f788d', null, '16:30', '17:00', '1');
INSERT INTO `tlesson` VALUES ('d1938fcfe12a40e1b5dafc3c68654373', null, '17:00', '17:30', '1');
INSERT INTO `tlesson` VALUES ('8a20992dc7bd4813b1d5e645e72b8ae8', null, '17:30', '18:00', '1');
INSERT INTO `tlesson` VALUES ('a7e0d2970351465fbd84f54b2e65d4a6', null, '18:00', '18:30', '1');
INSERT INTO `tlesson` VALUES ('ce276ad27d414b2bae71881643b25a94', null, '18:30', '19:00', '1');
INSERT INTO `tlesson` VALUES ('27debfa901e54a75b6ca8f26781dfa10', null, '19:00', '19:30', '1');
INSERT INTO `tlesson` VALUES ('2a92c83b7f504ad4b20be6c478a19891', null, '19:30', '20:00', '1');
INSERT INTO `tlesson` VALUES ('bbec9cbb619748429be555576b75af7a', null, '20:00', '20:30', '1');
INSERT INTO `tlesson` VALUES ('f8a22d86a69c4ef18c361df79191211a', null, '20:30', '21:00', '1');
INSERT INTO `tlesson` VALUES ('fb2de522d5544a058447bac270ecd6de', null, '21:00', '21:30', '1');
INSERT INTO `tlesson` VALUES ('07c4a015e97b4fd8815e6e33cbbdf898', null, '21:30', '22:00', '1');
INSERT INTO `tlesson` VALUES ('4247758f78244379a606deab7f86a436', null, '22:00', '22:30', '1');
INSERT INTO `tlesson` VALUES ('0667eab865d34119bdddc1cf9e64f7c9', null, '22:30', '23:00', '1');
INSERT INTO `tlesson` VALUES ('f95a9afc00ff4ec8944b04cafe9bb8b6', null, '23:00', '23:30', '1');

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
INSERT INTO `troleautority` VALUES ('b60aceb2b52c43afb0f93adafc6abbd7', 'eebc1fa86cdb4c8d81901151bf37eeca', '57d2bcff0d0a4af7bc3fc1e0b0f14798');
INSERT INTO `troleautority` VALUES ('006ca7504c0644df8ba39f76e824c1b2', 'eebc1fa86cdb4c8d81901151bf37eeca', 'b387b35ee1ac46a18d26beb544aea8a7');
INSERT INTO `troleautority` VALUES ('9f1d24bae3d341879f480e7ead02719f', 'eebc1fa86cdb4c8d81901151bf37eeca', 'bb0569c94a5b46a3b6042d4ced5a6115');
INSERT INTO `troleautority` VALUES ('2ae3490b14eb4dda92e35e95d97ec873', 'eebc1fa86cdb4c8d81901151bf37eeca', 'e6c87b15587b42ad8d985318b65c0595');
INSERT INTO `troleautority` VALUES ('8436e8e79f714fb3b9001ad174ca4c21', 'eebc1fa86cdb4c8d81901151bf37eeca', '5b4f897fe9d744bf9be341860f3e61e6');
INSERT INTO `troleautority` VALUES ('866ae3b9bdca4438aa1e5771e2f4691e', 'eebc1fa86cdb4c8d81901151bf37eeca', '9e8b12537f03447596bedae9ed4aac32');
INSERT INTO `troleautority` VALUES ('b7adf827ee7b435b8d877f4e0f87c68c', 'eebc1fa86cdb4c8d81901151bf37eeca', 'cd6ef124bb3644d897b5704262aafc49');
INSERT INTO `troleautority` VALUES ('546d6653c0b0468b8a7b76f387a53925', 'eebc1fa86cdb4c8d81901151bf37eeca', 'be513030cafd4314a7fdf0989453a46f');
INSERT INTO `troleautority` VALUES ('57aeae9b1b2641af858906f4ba76f5a2', 'eebc1fa86cdb4c8d81901151bf37eeca', 'caa2c5466fcf41e4843866757e9022a5');
INSERT INTO `troleautority` VALUES ('7510760775204aefa670a049139abe5a', 'eebc1fa86cdb4c8d81901151bf37eeca', 'd45e5b2508764852bc680b6b7417bbdc');
INSERT INTO `troleautority` VALUES ('4ce485959b3a4af5b9aab6ba09e5fec9', 'eebc1fa86cdb4c8d81901151bf37eeca', '74de8845c1bb432a84c241fb03f5204b');
INSERT INTO `troleautority` VALUES ('4570b855f257404a80a2a624a8dd80fd', 'eebc1fa86cdb4c8d81901151bf37eeca', '6b94a0cb88d24bada197ad92dfd63ad3');
INSERT INTO `troleautority` VALUES ('609ccfb70de54154a1952e2188604d00', 'eebc1fa86cdb4c8d81901151bf37eeca', 'ee942b37b08c4c0abea1520ff8595668');
INSERT INTO `troleautority` VALUES ('e848e4d720a64632ba0bbfa5b0369ce8', 'eebc1fa86cdb4c8d81901151bf37eeca', 'f35c46ae893d49608b9a65bce6a472e6');

-- ----------------------------
-- Table structure for `tsemester`
-- ----------------------------
DROP TABLE IF EXISTS `tsemester`;
CREATE TABLE `tsemester` (
  `ID` varchar(100) NOT NULL,
  `USERID` varchar(100) default NULL,
  `CREATEDATE` varchar(20) default NULL,
  `SEVERAL` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsemester
-- ----------------------------
INSERT INTO `tsemester` VALUES ('23a3eef37e25469b99f690b4b1fb81a4', '90f07928223842a4893370c34e4c7578', '2015-06-15 11:21:30', '1');

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
INSERT INTO `tsemesterelective` VALUES ('0c5b4cd999e94994a92544eb7ef30db6', '23a3eef37e25469b99f690b4b1fb81a4', '0c5e92d918a14977995515f4056fed75');
INSERT INTO `tsemesterelective` VALUES ('3c18ae16cdc549569ff50e191305a23d', '23a3eef37e25469b99f690b4b1fb81a4', '052bca64837a4379a0d25e0021fceaa6');

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
INSERT INTO `tteachertime` VALUES ('aa7d587763f24da482bb1999f6541a29', '3936c04ff10d4824b7cf4c53f1591ffb', '2015-06-12');
INSERT INTO `tteachertime` VALUES ('b89c963f52944fb38bf7ca57400fd45f', '3936c04ff10d4824b7cf4c53f1591ffb', '2015-06-13');
INSERT INTO `tteachertime` VALUES ('a8b52e34ec62483880dbfb96af99ab2f', '3936c04ff10d4824b7cf4c53f1591ffb', '2015-06-14');
INSERT INTO `tteachertime` VALUES ('c0848e1a48034de28b7e18599e7b6453', '3936c04ff10d4824b7cf4c53f1591ffb', '2015-06-15');
INSERT INTO `tteachertime` VALUES ('0227ff59ae394c7fa5f69ee0b04586fb', '3936c04ff10d4824b7cf4c53f1591ffb', '2015-06-17');
INSERT INTO `tteachertime` VALUES ('35918795ca87479b8d58b4e11daca834', '3936c04ff10d4824b7cf4c53f1591ffb', '2015-06-18');
INSERT INTO `tteachertime` VALUES ('9c8a77abc53a4cf987c62544534afc1f', '3936c04ff10d4824b7cf4c53f1591ffb', '2015-06-19');
INSERT INTO `tteachertime` VALUES ('ee14531f8d7d4a6d8779bfb3bcdff331', 'fe56f71c6959401a9461565eb7faa60e', '2015-06-14');
INSERT INTO `tteachertime` VALUES ('a0aeb12b7b174afda4bc4dcf21191d5d', 'fe56f71c6959401a9461565eb7faa60e', '2015-06-15');
INSERT INTO `tteachertime` VALUES ('57c81289a08e48c0b03c846b416bee57', 'fe56f71c6959401a9461565eb7faa60e', '2015-06-16');
INSERT INTO `tteachertime` VALUES ('72e5de7402ed420fb838337412bcb6f3', 'fe56f71c6959401a9461565eb7faa60e', '2015-06-17');
INSERT INTO `tteachertime` VALUES ('2cb48c6cd05d4a73b0b44232d313de91', 'fe56f71c6959401a9461565eb7faa60e', '2015-06-18');
INSERT INTO `tteachertime` VALUES ('a573f5ea6c974082bb66051118e5ea64', 'fe56f71c6959401a9461565eb7faa60e', '2015-06-19');
INSERT INTO `tteachertime` VALUES ('d6022d9dce2b47adb684db95ebf93231', 'dffcded4e07944f29987cc51036f910d', '2015-06-12');
INSERT INTO `tteachertime` VALUES ('38f63f7badb34ad283baeb7aaf1266b0', 'dffcded4e07944f29987cc51036f910d', '2015-06-13');
INSERT INTO `tteachertime` VALUES ('a196d3c1e2f04577999b464d9cabd099', 'dffcded4e07944f29987cc51036f910d', '2015-06-15');
INSERT INTO `tteachertime` VALUES ('61547659facb40e3a2f026cd161328f8', 'dffcded4e07944f29987cc51036f910d', '2015-06-16');
INSERT INTO `tteachertime` VALUES ('d6bfa46f030e4fa49f319abf9982aeb2', 'dffcded4e07944f29987cc51036f910d', '2015-06-18');
INSERT INTO `tteachertime` VALUES ('cee352e18f194df1b8afa707e072ec1d', 'dffcded4e07944f29987cc51036f910d', '2015-06-19');

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
INSERT INTO `ttimelesson` VALUES ('95fd6fe382354c23aaad9bc21e4f5836', 'aa7d587763f24da482bb1999f6541a29', '06:00', '09:00');
INSERT INTO `ttimelesson` VALUES ('be2249d1268449dfa59682a6167304c9', 'aa7d587763f24da482bb1999f6541a29', '10:00', '12:00');
INSERT INTO `ttimelesson` VALUES ('ff040f9aea8245e78f30c07dde9bb7a4', 'aa7d587763f24da482bb1999f6541a29', '14:00', '18:00');
INSERT INTO `ttimelesson` VALUES ('5f71cadbb991422b816b63b69ce4c1ff', 'b89c963f52944fb38bf7ca57400fd45f', '06:00', '10:00');
INSERT INTO `ttimelesson` VALUES ('b18e9a024a8a4308b5fae2fa9ade9195', 'b89c963f52944fb38bf7ca57400fd45f', '14:00', '16:00');
INSERT INTO `ttimelesson` VALUES ('629643c57e354552ac29abdafd1b2eb3', 'b89c963f52944fb38bf7ca57400fd45f', '20:00', '22:00');
INSERT INTO `ttimelesson` VALUES ('1dfc75b4015d42129ee4d92102abac50', 'a8b52e34ec62483880dbfb96af99ab2f', '06:00', '12:00');
INSERT INTO `ttimelesson` VALUES ('5e9e361fac35443cae408f7dc520f065', 'a8b52e34ec62483880dbfb96af99ab2f', '14:00', '18:00');
INSERT INTO `ttimelesson` VALUES ('3d631e7d5fc5441fadd1e2bb0e405eae', 'c0848e1a48034de28b7e18599e7b6453', '06:00', '11:00');
INSERT INTO `ttimelesson` VALUES ('863f12993fed45f5bead48f6323f827c', '0227ff59ae394c7fa5f69ee0b04586fb', '09:00', '12:00');
INSERT INTO `ttimelesson` VALUES ('4ab2fbc86aa04699b449c0739e37e9c9', '0227ff59ae394c7fa5f69ee0b04586fb', '15:00', '18:00');
INSERT INTO `ttimelesson` VALUES ('32eaa31e255d485db3afbf41119b42bf', '35918795ca87479b8d58b4e11daca834', '06:00', '08:00');
INSERT INTO `ttimelesson` VALUES ('229f7b4ef7a74e22bf3c609e790a1414', '35918795ca87479b8d58b4e11daca834', '09:00', '11:30');
INSERT INTO `ttimelesson` VALUES ('20951b0089334109a42854d4fb5a8513', '9c8a77abc53a4cf987c62544534afc1f', '06:00', '18:00');
INSERT INTO `ttimelesson` VALUES ('5a00b90e9c3a4ac98fab471352699272', 'ee14531f8d7d4a6d8779bfb3bcdff331', '08:00', '12:00');
INSERT INTO `ttimelesson` VALUES ('0bc5cab8d4cb4908aec096216b0e3fbd', 'ee14531f8d7d4a6d8779bfb3bcdff331', '13:30', '18:00');
INSERT INTO `ttimelesson` VALUES ('693b7e3c4a57471494651bdf47fb2ad5', 'a0aeb12b7b174afda4bc4dcf21191d5d', '09:00', '11:00');
INSERT INTO `ttimelesson` VALUES ('8f3d71c7bf4c478e8ae6420e08432833', 'a0aeb12b7b174afda4bc4dcf21191d5d', '15:00', '17:00');
INSERT INTO `ttimelesson` VALUES ('04c20e21b59a4d979e4aceb00ae40d7a', '57c81289a08e48c0b03c846b416bee57', '09:00', '18:00');
INSERT INTO `ttimelesson` VALUES ('ea587a9bddd841f5a89fc912848867d2', '72e5de7402ed420fb838337412bcb6f3', '09:00', '12:00');
INSERT INTO `ttimelesson` VALUES ('6e2a536a32f242d3a54ae3d7c79b6fcd', '72e5de7402ed420fb838337412bcb6f3', '14:00', '19:00');
INSERT INTO `ttimelesson` VALUES ('48f4ad146b3241bbb1aaae5c5ea48008', '2cb48c6cd05d4a73b0b44232d313de91', '11:00', '14:00');
INSERT INTO `ttimelesson` VALUES ('a134906bcfe1474487f6eb3f20daa0a2', '2cb48c6cd05d4a73b0b44232d313de91', '16:00', '20:00');
INSERT INTO `ttimelesson` VALUES ('91580667a6bc42cbae603c7fd44dd5c4', 'a573f5ea6c974082bb66051118e5ea64', '09:00', '12:00');
INSERT INTO `ttimelesson` VALUES ('9a9b220bb06b490184d71e2993956315', 'd6022d9dce2b47adb684db95ebf93231', '06:00', '09:00');
INSERT INTO `ttimelesson` VALUES ('b923a1b0dfef42399f062efcd116a496', 'd6022d9dce2b47adb684db95ebf93231', '15:00', '17:00');
INSERT INTO `ttimelesson` VALUES ('28234bb36fb24aec883a1e83a1f30cb7', '38f63f7badb34ad283baeb7aaf1266b0', '09:00', '11:30');
INSERT INTO `ttimelesson` VALUES ('355b599847e840e5b02165052715517a', '38f63f7badb34ad283baeb7aaf1266b0', '15:00', '17:30');
INSERT INTO `ttimelesson` VALUES ('ecaa0c53ab974f8887b1d8d35a1ba897', 'a196d3c1e2f04577999b464d9cabd099', '08:30', '12:00');
INSERT INTO `ttimelesson` VALUES ('f83b4d894ba64526af3cf8b84e237c24', 'a196d3c1e2f04577999b464d9cabd099', '15:00', '17:00');
INSERT INTO `ttimelesson` VALUES ('1e590bc373884fdbb22255a98b695241', '61547659facb40e3a2f026cd161328f8', '07:00', '12:00');
INSERT INTO `ttimelesson` VALUES ('b8eaaf8634a9438daf656b4d30dd4fe4', '61547659facb40e3a2f026cd161328f8', '13:00', '18:00');
INSERT INTO `ttimelesson` VALUES ('d877026b1085447e85a983a61bee1008', '61547659facb40e3a2f026cd161328f8', '21:00', '22:30');
INSERT INTO `ttimelesson` VALUES ('f5e40aae757647999b3fdf107f5e533c', 'd6bfa46f030e4fa49f319abf9982aeb2', '09:00', '11:00');
INSERT INTO `ttimelesson` VALUES ('b3db9d81147e4d13bce42a3828355518', 'cee352e18f194df1b8afa707e072ec1d', '14:00', '18:00');

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
