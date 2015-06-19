/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : xkxt

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2015-06-19 17:27:19
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
INSERT INTO `tbmenu` VALUES ('ee942b37b08c4c0abea1520ff8595668', '101', null, null, '业务管理', '#', '1', '8', null);
INSERT INTO `tbmenu` VALUES ('74de8845c1bb432a84c241fb03f5204b', '101100', 'ee942b37b08c4c0abea1520ff8595668', '101', '课时管理', '../lesson/findList.do', '2', '9', null);
INSERT INTO `tbmenu` VALUES ('d45e5b2508764852bc680b6b7417bbdc', '101102', 'ee942b37b08c4c0abea1520ff8595668', '101', '选课中心', '../elective/findList.do', '2', '11', null);
INSERT INTO `tbmenu` VALUES ('caa2c5466fcf41e4843866757e9022a5', '101103', 'ee942b37b08c4c0abea1520ff8595668', '101', '学生课表', '../semester/findList.do', '2', '12', null);
INSERT INTO `tbmenu` VALUES ('be513030cafd4314a7fdf0989453a46f', '101104', 'ee942b37b08c4c0abea1520ff8595668', '101', '老师课表', '../teacherkb/findList.do', '2', '13', null);
INSERT INTO `tbmenu` VALUES ('cd6ef124bb3644d897b5704262aafc49', '101105', 'ee942b37b08c4c0abea1520ff8595668', '101', '节课管理', '../class/findList.do', '2', '14', null);
INSERT INTO `tbmenu` VALUES ('b3a9187ac098498aa97359c89727bc4c', '101106', 'ee942b37b08c4c0abea1520ff8595668', '101', '我的学生', '../myStudent/findList.do', '2', '15', null);
INSERT INTO `tbmenu` VALUES ('1bee993111a9475c88138e1eba831785', '101107', 'ee942b37b08c4c0abea1520ff8595668', '101', '我的老师', '../myTeacher/findList.do', '2', '16', null);
INSERT INTO `tbmenu` VALUES ('c94db71bedb5483bae2173a665455214', '101108', 'ee942b37b08c4c0abea1520ff8595668', '101', '作业管理', '../task/ajax_list.do', '2', '17', null);
INSERT INTO `tbmenu` VALUES ('3efdc9b93b7a4eff9150f3ac21505ed5', '101109', 'ee942b37b08c4c0abea1520ff8595668', '101', '签到管理', '../sign/findList.do', '2', '18', null);

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
  `SUPERADMIN` char(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbuser
-- ----------------------------
INSERT INTO `tbuser` VALUES ('c9b0546100ef46648fecda52ff787c85', 'eebc1fa86cdb4c8d81901151bf37eeca', 'admin', '小C', '4QrcOUm6Wau+VuBX8g+IPg==', '350626198906241533', null, null, null, '1', '3', '1', '1');
INSERT INTO `tbuser` VALUES ('e2106767bfba4635a0a17e72436e8df1', '4350bd88174f435f8a15d328e0ec8df6', 'xg', '小G', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, '1', '3', '1', null);

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
  `STATUS` char(1) default NULL COMMENT '0:正常上课，1：学生未上课，2：老师未上课，3：学生请假，4：老师请假，5：调课',
  `sign` varchar(1) default '0' COMMENT '0未签到 1已签到 2迟到 3警告',
  `sign2` varchar(1) default '0' COMMENT '0鏈鍒?1宸茬鍒?2杩熷埌 3璀﹀憡',
  `REMARK` varchar(200) default NULL COMMENT '调课说明',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tclass
-- ----------------------------

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
INSERT INTO `tcurriculum` VALUES ('fd411d2711514405a4dfeb6c481a99fc', '听力', '1');
INSERT INTO `tcurriculum` VALUES ('a4e799b303e7473eb7a238de30090628', '写作', '1');
INSERT INTO `tcurriculum` VALUES ('81cc5be405434668b3b4809442af22bf', '阅读', '1');
INSERT INTO `tcurriculum` VALUES ('f308c4f291384c918d51f37df4565f2b', '口语', '1');

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
  `SUPERADMIN` char(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trole
-- ----------------------------
INSERT INTO `trole` VALUES ('eebc1fa86cdb4c8d81901151bf37eeca', '超级管理', '1', '1');
INSERT INTO `trole` VALUES ('e384332bce034483b2e3fe0d030b6466', '老师权限', '1', null);
INSERT INTO `trole` VALUES ('eceb4d7483f1424fb248a4a68385f592', '学生权限', '1', null);
INSERT INTO `trole` VALUES ('4350bd88174f435f8a15d328e0ec8df6', '管理员', '1', null);

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
INSERT INTO `troleautority` VALUES ('63d92284b33a47e6ac708a10a575e188', 'eebc1fa86cdb4c8d81901151bf37eeca', '57d2bcff0d0a4af7bc3fc1e0b0f14798');
INSERT INTO `troleautority` VALUES ('535a7d570f8c47bca152a12b65c30eca', 'eebc1fa86cdb4c8d81901151bf37eeca', 'b387b35ee1ac46a18d26beb544aea8a7');
INSERT INTO `troleautority` VALUES ('f44b6ae5747f420a9125a05f240426cb', 'eebc1fa86cdb4c8d81901151bf37eeca', 'bb0569c94a5b46a3b6042d4ced5a6115');
INSERT INTO `troleautority` VALUES ('76dc998eb74042fd99e405cde294e078', 'eebc1fa86cdb4c8d81901151bf37eeca', 'e6c87b15587b42ad8d985318b65c0595');
INSERT INTO `troleautority` VALUES ('1647f487756e4442bc08b7e5b4a93421', 'eebc1fa86cdb4c8d81901151bf37eeca', '5b4f897fe9d744bf9be341860f3e61e6');
INSERT INTO `troleautority` VALUES ('0e9f0638271341358d6f1dca44412b43', 'eebc1fa86cdb4c8d81901151bf37eeca', '9e8b12537f03447596bedae9ed4aac32');
INSERT INTO `troleautority` VALUES ('179fca28636441b49236c6903d5bdc4e', 'eebc1fa86cdb4c8d81901151bf37eeca', '3efdc9b93b7a4eff9150f3ac21505ed5');
INSERT INTO `troleautority` VALUES ('06870b37ebdc4d378443554de1e843a8', 'eebc1fa86cdb4c8d81901151bf37eeca', 'c94db71bedb5483bae2173a665455214');
INSERT INTO `troleautority` VALUES ('822feea6708446b7b627b14726db5710', 'eebc1fa86cdb4c8d81901151bf37eeca', '1bee993111a9475c88138e1eba831785');
INSERT INTO `troleautority` VALUES ('90da25c49d844eb396a416660e6437cd', 'eebc1fa86cdb4c8d81901151bf37eeca', 'b3a9187ac098498aa97359c89727bc4c');
INSERT INTO `troleautority` VALUES ('fb1044d47edb496cb342d3a6b0aa22a0', 'eebc1fa86cdb4c8d81901151bf37eeca', 'cd6ef124bb3644d897b5704262aafc49');
INSERT INTO `troleautority` VALUES ('934a68b1c18c408fa251b1d562deb18c', 'eebc1fa86cdb4c8d81901151bf37eeca', 'be513030cafd4314a7fdf0989453a46f');
INSERT INTO `troleautority` VALUES ('5ec40e1f07a0421980407f21255d0599', 'eebc1fa86cdb4c8d81901151bf37eeca', 'caa2c5466fcf41e4843866757e9022a5');
INSERT INTO `troleautority` VALUES ('0247d7a6fbc0403cba3721c8dd26b915', 'eebc1fa86cdb4c8d81901151bf37eeca', 'd45e5b2508764852bc680b6b7417bbdc');
INSERT INTO `troleautority` VALUES ('a6e157268e784809b86cbb08d137f024', 'eebc1fa86cdb4c8d81901151bf37eeca', '74de8845c1bb432a84c241fb03f5204b');
INSERT INTO `troleautority` VALUES ('3f0ee26bb3f84ed79911c156170fb1cf', 'e384332bce034483b2e3fe0d030b6466', '57d2bcff0d0a4af7bc3fc1e0b0f14798');
INSERT INTO `troleautority` VALUES ('b4b18641b3c440deba3483d044568864', 'e384332bce034483b2e3fe0d030b6466', '9e8b12537f03447596bedae9ed4aac32');
INSERT INTO `troleautority` VALUES ('7fc40f3ff1eb4062941063e25b4eda20', 'e384332bce034483b2e3fe0d030b6466', '3efdc9b93b7a4eff9150f3ac21505ed5');
INSERT INTO `troleautority` VALUES ('7d87738edc89460da5bb647783eab5b8', 'e384332bce034483b2e3fe0d030b6466', 'c94db71bedb5483bae2173a665455214');
INSERT INTO `troleautority` VALUES ('3bdf7b70c4d54114a96bbfa842f0a694', 'e384332bce034483b2e3fe0d030b6466', 'b3a9187ac098498aa97359c89727bc4c');
INSERT INTO `troleautority` VALUES ('92ff9b2a81104349a92cd4f3c7d6258f', 'e384332bce034483b2e3fe0d030b6466', 'be513030cafd4314a7fdf0989453a46f');
INSERT INTO `troleautority` VALUES ('8f256a5bded144e2beeabda78aef7594', 'e384332bce034483b2e3fe0d030b6466', '6b94a0cb88d24bada197ad92dfd63ad3');
INSERT INTO `troleautority` VALUES ('56f12089250a4cbe8bb828c4f3431cca', 'eebc1fa86cdb4c8d81901151bf37eeca', '6b94a0cb88d24bada197ad92dfd63ad3');
INSERT INTO `troleautority` VALUES ('fc201e9a549a4df6bad9e5eeb50f242a', 'eebc1fa86cdb4c8d81901151bf37eeca', 'ee942b37b08c4c0abea1520ff8595668');
INSERT INTO `troleautority` VALUES ('2005291fe4ed497da7f724b1705ab5be', 'e384332bce034483b2e3fe0d030b6466', 'ee942b37b08c4c0abea1520ff8595668');
INSERT INTO `troleautority` VALUES ('7a9b640f851b4215abac7be4f66c18e9', 'eceb4d7483f1424fb248a4a68385f592', '57d2bcff0d0a4af7bc3fc1e0b0f14798');
INSERT INTO `troleautority` VALUES ('7d9bf1f77e2f4ccd82270ab65afd766d', 'eceb4d7483f1424fb248a4a68385f592', '9e8b12537f03447596bedae9ed4aac32');
INSERT INTO `troleautority` VALUES ('0bece108adb240deb2db91dcfde24fb2', 'eceb4d7483f1424fb248a4a68385f592', '3efdc9b93b7a4eff9150f3ac21505ed5');
INSERT INTO `troleautority` VALUES ('8e087bf089844593bf3ce306c5b2b87e', 'eceb4d7483f1424fb248a4a68385f592', 'c94db71bedb5483bae2173a665455214');
INSERT INTO `troleautority` VALUES ('3423df78b3814e008c6a9b3c9c885b85', 'eceb4d7483f1424fb248a4a68385f592', '1bee993111a9475c88138e1eba831785');
INSERT INTO `troleautority` VALUES ('bb5f8343183744838a08fb6de310428c', 'eceb4d7483f1424fb248a4a68385f592', 'caa2c5466fcf41e4843866757e9022a5');
INSERT INTO `troleautority` VALUES ('2d799289179340c1a5cb76977f18108b', 'eceb4d7483f1424fb248a4a68385f592', 'ee942b37b08c4c0abea1520ff8595668');
INSERT INTO `troleautority` VALUES ('6ec8077061ca4942a7027b777cdb689e', 'eceb4d7483f1424fb248a4a68385f592', 'd45e5b2508764852bc680b6b7417bbdc');
INSERT INTO `troleautority` VALUES ('7c1e16daffc24971a9be28bc3f2c4316', 'eebc1fa86cdb4c8d81901151bf37eeca', 'f35c46ae893d49608b9a65bce6a472e6');
INSERT INTO `troleautority` VALUES ('f1e0b4bfcce24fb2ac239c0c811782dd', '4350bd88174f435f8a15d328e0ec8df6', 'f35c46ae893d49608b9a65bce6a472e6');
INSERT INTO `troleautority` VALUES ('eac0efdc23b04ed5bd0184edbfdacac6', '4350bd88174f435f8a15d328e0ec8df6', '57d2bcff0d0a4af7bc3fc1e0b0f14798');
INSERT INTO `troleautority` VALUES ('2cfa216890dd484cb36c980a3f7cf6fa', '4350bd88174f435f8a15d328e0ec8df6', 'b387b35ee1ac46a18d26beb544aea8a7');
INSERT INTO `troleautority` VALUES ('625cad2938ec40199a1bf662abf39a8e', '4350bd88174f435f8a15d328e0ec8df6', 'e6c87b15587b42ad8d985318b65c0595');
INSERT INTO `troleautority` VALUES ('b8503b63edd042d087dc52687a6e6d66', '4350bd88174f435f8a15d328e0ec8df6', '9e8b12537f03447596bedae9ed4aac32');
INSERT INTO `troleautority` VALUES ('f8797a1cd616425eb26fe51d000be7c6', '4350bd88174f435f8a15d328e0ec8df6', '1bee993111a9475c88138e1eba831785');
INSERT INTO `troleautority` VALUES ('d97a65d0878240d7b0add692e83318e1', '4350bd88174f435f8a15d328e0ec8df6', 'b3a9187ac098498aa97359c89727bc4c');
INSERT INTO `troleautority` VALUES ('e0e199f166c54a9e8277410c5728b124', '4350bd88174f435f8a15d328e0ec8df6', 'caa2c5466fcf41e4843866757e9022a5');
INSERT INTO `troleautority` VALUES ('59bf09ce47794e27aaf7b54d3a95aec1', '4350bd88174f435f8a15d328e0ec8df6', 'ee942b37b08c4c0abea1520ff8595668');
INSERT INTO `troleautority` VALUES ('8d14067aa8c9497e89b984b53e803b87', 'eceb4d7483f1424fb248a4a68385f592', 'f35c46ae893d49608b9a65bce6a472e6');
INSERT INTO `troleautority` VALUES ('b7fd6177477c4380a328ce44908d0450', 'e384332bce034483b2e3fe0d030b6466', 'f35c46ae893d49608b9a65bce6a472e6');

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

-- ----------------------------
-- Table structure for `ttasklog`
-- ----------------------------
DROP TABLE IF EXISTS `ttasklog`;
CREATE TABLE `ttasklog` (
  `ID` varchar(255) NOT NULL,
  `CLASS_ID` varchar(255) default NULL,
  `USER_ID` varchar(255) default NULL,
  `TYPE` varchar(255) default NULL,
  `CREATE_TIME` varchar(255) default NULL,
  `UPLOAD_TYPE` varchar(255) default NULL,
  `STATUS` varchar(30) default NULL,
  `DOWN_LOAD_URL` varchar(1000) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ttasklog
-- ----------------------------

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
