/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : xkxt

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2015-06-11 18:06:41
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
INSERT INTO `telective` VALUES ('939449b35abe42ff9cad56525a3f1c38', '90f07928223842a4893370c34e4c7578', 'a4e799b303e7473eb7a238de30090628', '37', '2015-06-11 15:22:56', '1');
INSERT INTO `telective` VALUES ('a703f9c3c33f428b86db0cb1118d4748', '90f07928223842a4893370c34e4c7578', 'fd411d2711514405a4dfeb6c481a99fc', '12', '2015-06-10 17:58:16', '1');
INSERT INTO `telective` VALUES ('228c5c9f614b49b0ad4b8f2413909063', '90f07928223842a4893370c34e4c7578', 'a4e799b303e7473eb7a238de30090628', '14', '2015-06-10 17:58:24', '1');
INSERT INTO `telective` VALUES ('1c4d431016cf4c789aac3ed01029d587', '90f07928223842a4893370c34e4c7578', 'fd411d2711514405a4dfeb6c481a99fc', '51', '2015-06-11 15:22:26', '1');

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
INSERT INTO `telectivelesson` VALUES ('e1251d8cadc34df0b250182a75ee2b19', '939449b35abe42ff9cad56525a3f1c38', '8822d9a710d94067a34a8daa8c99eb5a', '72e5de7402ed420fb838337412bcb6f3');
INSERT INTO `telectivelesson` VALUES ('b86642dc4e9a4154ba4adb6815c5c35b', '939449b35abe42ff9cad56525a3f1c38', 'b1c33eeee3664d1ba4c480bd24f49916', '72e5de7402ed420fb838337412bcb6f3');
INSERT INTO `telectivelesson` VALUES ('64b1a68200c64250b372c524f84b465c', '939449b35abe42ff9cad56525a3f1c38', 'e89309cd0c5a438d823fdfba6852095c', '72e5de7402ed420fb838337412bcb6f3');
INSERT INTO `telectivelesson` VALUES ('72e4ea39135843e398954879b63e671f', '939449b35abe42ff9cad56525a3f1c38', '52d59ad6ca1a4a8e9e932d72384c55dc', '72e5de7402ed420fb838337412bcb6f3');
INSERT INTO `telectivelesson` VALUES ('3754c3e2d21244e383c3e87308d01da0', '939449b35abe42ff9cad56525a3f1c38', '34981c45dad6486b80ebbf2b24cb9080', '57c81289a08e48c0b03c846b416bee57');
INSERT INTO `telectivelesson` VALUES ('abc3c0f10e804864bd84edafd036723f', '939449b35abe42ff9cad56525a3f1c38', 'fca72d4d53c94788aba0b7b955b23263', '57c81289a08e48c0b03c846b416bee57');
INSERT INTO `telectivelesson` VALUES ('427b4aacb97c485fa34627c85bb503fe', '939449b35abe42ff9cad56525a3f1c38', '5fd244c38fc34a2db6b5dd5446e62ed8', '57c81289a08e48c0b03c846b416bee57');
INSERT INTO `telectivelesson` VALUES ('af83570b0ac64d0f88e1aef8cf6ba660', '939449b35abe42ff9cad56525a3f1c38', '4117bac2595047d5b4b51b4caa61de4a', '57c81289a08e48c0b03c846b416bee57');
INSERT INTO `telectivelesson` VALUES ('303e1794ab784fa380c4da9c447ea087', '939449b35abe42ff9cad56525a3f1c38', '9f3e7a4eb1644c57a6b74dc819ee0772', '57c81289a08e48c0b03c846b416bee57');
INSERT INTO `telectivelesson` VALUES ('deb39f6d9a7e42acbf7998cb14aedcdb', '939449b35abe42ff9cad56525a3f1c38', '3a4b0fd4754348138487df521c59486c', '57c81289a08e48c0b03c846b416bee57');
INSERT INTO `telectivelesson` VALUES ('ddc4d7bf385e426980809bfbc74562ae', '939449b35abe42ff9cad56525a3f1c38', '4b1d1cbeebff413581a48f71725f788d', 'a0aeb12b7b174afda4bc4dcf21191d5d');
INSERT INTO `telectivelesson` VALUES ('ee1770b03ef74abeafe7ca9c29563b97', '939449b35abe42ff9cad56525a3f1c38', '8822d9a710d94067a34a8daa8c99eb5a', 'a0aeb12b7b174afda4bc4dcf21191d5d');
INSERT INTO `telectivelesson` VALUES ('e2672fd9c3dd40ddb8eb7b11d06df697', '939449b35abe42ff9cad56525a3f1c38', 'b1c33eeee3664d1ba4c480bd24f49916', 'a0aeb12b7b174afda4bc4dcf21191d5d');
INSERT INTO `telectivelesson` VALUES ('0d28043c30c8451ab02b03443e0bfb6c', '939449b35abe42ff9cad56525a3f1c38', 'e89309cd0c5a438d823fdfba6852095c', 'a0aeb12b7b174afda4bc4dcf21191d5d');
INSERT INTO `telectivelesson` VALUES ('e76df9fab9274927a6deb6117dc9d673', '939449b35abe42ff9cad56525a3f1c38', '9e91abc9386b42799d634c07713ab7ed', 'a0aeb12b7b174afda4bc4dcf21191d5d');
INSERT INTO `telectivelesson` VALUES ('8c6637add2674abdaac5e05590891130', '939449b35abe42ff9cad56525a3f1c38', 'e0c308f42aa447ca8984053279868b1c', 'a0aeb12b7b174afda4bc4dcf21191d5d');
INSERT INTO `telectivelesson` VALUES ('ae0bbbd8ae294926b8762d509a349982', '939449b35abe42ff9cad56525a3f1c38', '8822d9a710d94067a34a8daa8c99eb5a', 'ee14531f8d7d4a6d8779bfb3bcdff331');
INSERT INTO `telectivelesson` VALUES ('f7d855c9c45c415e9173eb4136fc2c8f', '939449b35abe42ff9cad56525a3f1c38', 'b1c33eeee3664d1ba4c480bd24f49916', 'ee14531f8d7d4a6d8779bfb3bcdff331');
INSERT INTO `telectivelesson` VALUES ('f7644282c2ef4bdeb5cef1459dc1faa4', '939449b35abe42ff9cad56525a3f1c38', 'e89309cd0c5a438d823fdfba6852095c', 'ee14531f8d7d4a6d8779bfb3bcdff331');
INSERT INTO `telectivelesson` VALUES ('e0b66655e1ba4d18aa287e8a0c337151', '939449b35abe42ff9cad56525a3f1c38', '52d59ad6ca1a4a8e9e932d72384c55dc', 'ee14531f8d7d4a6d8779bfb3bcdff331');
INSERT INTO `telectivelesson` VALUES ('68815621077e4d6c8203a6b21032b7cd', '939449b35abe42ff9cad56525a3f1c38', '34981c45dad6486b80ebbf2b24cb9080', 'ee14531f8d7d4a6d8779bfb3bcdff331');
INSERT INTO `telectivelesson` VALUES ('556a2e26663149bba43ec518599a876e', '939449b35abe42ff9cad56525a3f1c38', 'd1938fcfe12a40e1b5dafc3c68654373', '38f63f7badb34ad283baeb7aaf1266b0');
INSERT INTO `telectivelesson` VALUES ('c68383fdb28145fd8a7789858ff55431', '939449b35abe42ff9cad56525a3f1c38', '8822d9a710d94067a34a8daa8c99eb5a', '38f63f7badb34ad283baeb7aaf1266b0');
INSERT INTO `telectivelesson` VALUES ('3249656b962a49168751b9b7aed092ab', '939449b35abe42ff9cad56525a3f1c38', '4b1d1cbeebff413581a48f71725f788d', 'd6022d9dce2b47adb684db95ebf93231');
INSERT INTO `telectivelesson` VALUES ('5e71c3631b8a4f03ab388f0238d7f2cf', '939449b35abe42ff9cad56525a3f1c38', 'b1c33eeee3664d1ba4c480bd24f49916', 'd6022d9dce2b47adb684db95ebf93231');
INSERT INTO `telectivelesson` VALUES ('24cd9f24b7934e38b2639278e536541d', '939449b35abe42ff9cad56525a3f1c38', 'ebe80b2bd714408b95c0fb6acdd88240', 'd6022d9dce2b47adb684db95ebf93231');
INSERT INTO `telectivelesson` VALUES ('7fc6d871ff054973919f10b231acf778', '1c4d431016cf4c789aac3ed01029d587', 'b1c33eeee3664d1ba4c480bd24f49916', 'cee352e18f194df1b8afa707e072ec1d');
INSERT INTO `telectivelesson` VALUES ('520f30c8c3c849ee993aa99c95f47dfa', '1c4d431016cf4c789aac3ed01029d587', 'e89309cd0c5a438d823fdfba6852095c', 'cee352e18f194df1b8afa707e072ec1d');
INSERT INTO `telectivelesson` VALUES ('196c7fb19f5540ccb2df0a5efeed9a17', '1c4d431016cf4c789aac3ed01029d587', '52d59ad6ca1a4a8e9e932d72384c55dc', 'cee352e18f194df1b8afa707e072ec1d');
INSERT INTO `telectivelesson` VALUES ('06f1efe511ad41c599a3fd249105249d', '1c4d431016cf4c789aac3ed01029d587', '2293743666174e50981ec0214a4bda25', 'cee352e18f194df1b8afa707e072ec1d');
INSERT INTO `telectivelesson` VALUES ('80dae55aaff54139a3d9837a06824418', '1c4d431016cf4c789aac3ed01029d587', '4117bac2595047d5b4b51b4caa61de4a', '9c8a77abc53a4cf987c62544534afc1f');
INSERT INTO `telectivelesson` VALUES ('4262d4081ab44887900d2f83d153c2ac', '1c4d431016cf4c789aac3ed01029d587', '9f3e7a4eb1644c57a6b74dc819ee0772', '9c8a77abc53a4cf987c62544534afc1f');
INSERT INTO `telectivelesson` VALUES ('7a7b1ba71c7c4d40b703523dc734ab7e', '1c4d431016cf4c789aac3ed01029d587', '3a4b0fd4754348138487df521c59486c', '9c8a77abc53a4cf987c62544534afc1f');
INSERT INTO `telectivelesson` VALUES ('9417763c1216404f95cdc787c32079fc', '1c4d431016cf4c789aac3ed01029d587', '4dbd288e22894996a594e5333b3fae71', '9c8a77abc53a4cf987c62544534afc1f');
INSERT INTO `telectivelesson` VALUES ('ce1a5caabf3742478041bcff6822291b', '1c4d431016cf4c789aac3ed01029d587', '256663984daf43a79ea3e994dff21c22', 'd6bfa46f030e4fa49f319abf9982aeb2');
INSERT INTO `telectivelesson` VALUES ('afa6851ab67346868cf054b2a2747a94', '1c4d431016cf4c789aac3ed01029d587', '9e91abc9386b42799d634c07713ab7ed', 'd6bfa46f030e4fa49f319abf9982aeb2');
INSERT INTO `telectivelesson` VALUES ('7096c0b22c38430c91414506a704f194', '1c4d431016cf4c789aac3ed01029d587', '10489e6e7eec4b50a98d4a70508952f7', '35918795ca87479b8d58b4e11daca834');
INSERT INTO `telectivelesson` VALUES ('0f7ce6bf4768405e85da4770e3fef53f', '1c4d431016cf4c789aac3ed01029d587', 'ddaa98affa2d4a018903231d681b97bb', '35918795ca87479b8d58b4e11daca834');
INSERT INTO `telectivelesson` VALUES ('6e683ffe38ea43c58cb909b12db3ec24', '1c4d431016cf4c789aac3ed01029d587', 'fb6aa965fee8494a9c97b863655fa24c', '35918795ca87479b8d58b4e11daca834');
INSERT INTO `telectivelesson` VALUES ('7f414a814faf4dc3beb70a9f3a6d2eac', '1c4d431016cf4c789aac3ed01029d587', '256663984daf43a79ea3e994dff21c22', '0227ff59ae394c7fa5f69ee0b04586fb');
INSERT INTO `telectivelesson` VALUES ('42abcb5148af4660b4b29cced963bbec', '1c4d431016cf4c789aac3ed01029d587', '9e91abc9386b42799d634c07713ab7ed', '0227ff59ae394c7fa5f69ee0b04586fb');
INSERT INTO `telectivelesson` VALUES ('408b3ec432744c6b8e0a1e99b88b0d17', '1c4d431016cf4c789aac3ed01029d587', 'e0c308f42aa447ca8984053279868b1c', '0227ff59ae394c7fa5f69ee0b04586fb');
INSERT INTO `telectivelesson` VALUES ('f22c1f7c5dbe45378674d1505f5f2b23', '1c4d431016cf4c789aac3ed01029d587', 'd1938fcfe12a40e1b5dafc3c68654373', '61547659facb40e3a2f026cd161328f8');
INSERT INTO `telectivelesson` VALUES ('6828f12e8e2a4f388a86c5301746d397', '1c4d431016cf4c789aac3ed01029d587', '4b1d1cbeebff413581a48f71725f788d', '61547659facb40e3a2f026cd161328f8');
INSERT INTO `telectivelesson` VALUES ('d1f2d6158b164201806ae8e42400eb79', '1c4d431016cf4c789aac3ed01029d587', '8822d9a710d94067a34a8daa8c99eb5a', '61547659facb40e3a2f026cd161328f8');
INSERT INTO `telectivelesson` VALUES ('d7293a705b7c421c8f954a9455cbc026', '1c4d431016cf4c789aac3ed01029d587', '8e7bbb33791f4f55bf1f0cfd2c2a6693', '61547659facb40e3a2f026cd161328f8');
INSERT INTO `telectivelesson` VALUES ('5d84f0ba87f04b36bec7ba2108c21270', '1c4d431016cf4c789aac3ed01029d587', '25b401d281a54b739a66cf0ead20ab6c', '61547659facb40e3a2f026cd161328f8');
INSERT INTO `telectivelesson` VALUES ('4ad94c8c9a1549ae8e3e82874590fc05', '1c4d431016cf4c789aac3ed01029d587', 'ebe80b2bd714408b95c0fb6acdd88240', '61547659facb40e3a2f026cd161328f8');
INSERT INTO `telectivelesson` VALUES ('4b25a8bbe87b4f2b8cf0bd7142959b1c', '1c4d431016cf4c789aac3ed01029d587', '10489e6e7eec4b50a98d4a70508952f7', '61547659facb40e3a2f026cd161328f8');
INSERT INTO `telectivelesson` VALUES ('e66fba2207464177a549b82a7a483f2a', '1c4d431016cf4c789aac3ed01029d587', '3a4b0fd4754348138487df521c59486c', 'a196d3c1e2f04577999b464d9cabd099');
INSERT INTO `telectivelesson` VALUES ('0151a79ee6714553bd555deaef9486ee', '1c4d431016cf4c789aac3ed01029d587', '4dbd288e22894996a594e5333b3fae71', 'a196d3c1e2f04577999b464d9cabd099');
INSERT INTO `telectivelesson` VALUES ('92a291f988cc4b98b90ad0107bf2c7cc', '1c4d431016cf4c789aac3ed01029d587', '256663984daf43a79ea3e994dff21c22', 'a196d3c1e2f04577999b464d9cabd099');
INSERT INTO `telectivelesson` VALUES ('558f4113446c457c99bca1c61406a950', '1c4d431016cf4c789aac3ed01029d587', '25b401d281a54b739a66cf0ead20ab6c', 'c0848e1a48034de28b7e18599e7b6453');
INSERT INTO `telectivelesson` VALUES ('6cf848bdaafb488a8b5e92bd8a126127', '1c4d431016cf4c789aac3ed01029d587', 'ebe80b2bd714408b95c0fb6acdd88240', 'c0848e1a48034de28b7e18599e7b6453');
INSERT INTO `telectivelesson` VALUES ('340da761d8444fe7934793e41a5cde00', '1c4d431016cf4c789aac3ed01029d587', '10489e6e7eec4b50a98d4a70508952f7', 'c0848e1a48034de28b7e18599e7b6453');
INSERT INTO `telectivelesson` VALUES ('674813fb299647869ccd9419122c53d2', '1c4d431016cf4c789aac3ed01029d587', 'ddaa98affa2d4a018903231d681b97bb', 'c0848e1a48034de28b7e18599e7b6453');
INSERT INTO `telectivelesson` VALUES ('ec7cfd7261e243bc8fe07b4c57c221bc', '1c4d431016cf4c789aac3ed01029d587', 'fb6aa965fee8494a9c97b863655fa24c', 'c0848e1a48034de28b7e18599e7b6453');
INSERT INTO `telectivelesson` VALUES ('51648874f67f4c56873c2ddf787bc28b', '1c4d431016cf4c789aac3ed01029d587', '2293743666174e50981ec0214a4bda25', 'a8b52e34ec62483880dbfb96af99ab2f');
INSERT INTO `telectivelesson` VALUES ('d8518303e27a477dbf8d9ae0de1465af', '1c4d431016cf4c789aac3ed01029d587', '9f3e7a4eb1644c57a6b74dc819ee0772', 'a8b52e34ec62483880dbfb96af99ab2f');
INSERT INTO `telectivelesson` VALUES ('d442341af4d848e38064887f7990f02f', '1c4d431016cf4c789aac3ed01029d587', '3a4b0fd4754348138487df521c59486c', 'a8b52e34ec62483880dbfb96af99ab2f');
INSERT INTO `telectivelesson` VALUES ('fcbca509f7414e78b5eca35f2e882e3d', '1c4d431016cf4c789aac3ed01029d587', '4dbd288e22894996a594e5333b3fae71', 'a8b52e34ec62483880dbfb96af99ab2f');
INSERT INTO `telectivelesson` VALUES ('035c6ea409154f4787b245de76aeb3d7', '1c4d431016cf4c789aac3ed01029d587', '256663984daf43a79ea3e994dff21c22', 'a8b52e34ec62483880dbfb96af99ab2f');
INSERT INTO `telectivelesson` VALUES ('de0f561d64ef42739050f49fa8a9e99d', '1c4d431016cf4c789aac3ed01029d587', '4b1d1cbeebff413581a48f71725f788d', '38f63f7badb34ad283baeb7aaf1266b0');
INSERT INTO `telectivelesson` VALUES ('3128e898eb7a483a896d3d9e86ec38e4', '1c4d431016cf4c789aac3ed01029d587', 'b1c33eeee3664d1ba4c480bd24f49916', '38f63f7badb34ad283baeb7aaf1266b0');
INSERT INTO `telectivelesson` VALUES ('e2e1d620ea8648c1a34b40ebf2eb2d2f', '1c4d431016cf4c789aac3ed01029d587', 'e89309cd0c5a438d823fdfba6852095c', '38f63f7badb34ad283baeb7aaf1266b0');
INSERT INTO `telectivelesson` VALUES ('cbc2f234288a43fb888bb7748722153c', '1c4d431016cf4c789aac3ed01029d587', '07c4a015e97b4fd8815e6e33cbbdf898', 'b89c963f52944fb38bf7ca57400fd45f');
INSERT INTO `telectivelesson` VALUES ('07fbf8bcc28e45f4a4a9acf479eab346', '1c4d431016cf4c789aac3ed01029d587', 'fb2de522d5544a058447bac270ecd6de', 'b89c963f52944fb38bf7ca57400fd45f');
INSERT INTO `telectivelesson` VALUES ('352bfd68caa74e76beae17a9a50c5bc1', '1c4d431016cf4c789aac3ed01029d587', 'f8a22d86a69c4ef18c361df79191211a', 'b89c963f52944fb38bf7ca57400fd45f');
INSERT INTO `telectivelesson` VALUES ('fd0f94e38aca468fa69377f198f5c277', '1c4d431016cf4c789aac3ed01029d587', '8822d9a710d94067a34a8daa8c99eb5a', 'd6022d9dce2b47adb684db95ebf93231');
INSERT INTO `telectivelesson` VALUES ('2fc93be6a5ee45caafee867617254f8f', '1c4d431016cf4c789aac3ed01029d587', 'e89309cd0c5a438d823fdfba6852095c', 'd6022d9dce2b47adb684db95ebf93231');
INSERT INTO `telectivelesson` VALUES ('dcd42991a0d44cf5ada5ddbf89733b4d', '1c4d431016cf4c789aac3ed01029d587', '25b401d281a54b739a66cf0ead20ab6c', 'd6022d9dce2b47adb684db95ebf93231');
INSERT INTO `telectivelesson` VALUES ('7dcf8251785e4e7da199fc970b4a92ae', '1c4d431016cf4c789aac3ed01029d587', '10489e6e7eec4b50a98d4a70508952f7', 'd6022d9dce2b47adb684db95ebf93231');
INSERT INTO `telectivelesson` VALUES ('72af4cd7efb6423e9feb8ffa19844fba', '1c4d431016cf4c789aac3ed01029d587', '9f3e7a4eb1644c57a6b74dc819ee0772', 'aa7d587763f24da482bb1999f6541a29');
INSERT INTO `telectivelesson` VALUES ('431170a245d24029ba4d157f18a4a821', '1c4d431016cf4c789aac3ed01029d587', '3a4b0fd4754348138487df521c59486c', 'aa7d587763f24da482bb1999f6541a29');
INSERT INTO `telectivelesson` VALUES ('c354b5deb7444104aa0da9e48ff6223b', '1c4d431016cf4c789aac3ed01029d587', '4dbd288e22894996a594e5333b3fae71', 'aa7d587763f24da482bb1999f6541a29');
INSERT INTO `telectivelesson` VALUES ('6f1ac308636d4ddf8ad30e381c433078', '1c4d431016cf4c789aac3ed01029d587', '256663984daf43a79ea3e994dff21c22', 'aa7d587763f24da482bb1999f6541a29');
INSERT INTO `telectivelesson` VALUES ('c2ee30f4ae544efe966b0e2d4a12218f', '1c4d431016cf4c789aac3ed01029d587', '8e7bbb33791f4f55bf1f0cfd2c2a6693', 'aa7d587763f24da482bb1999f6541a29');
INSERT INTO `telectivelesson` VALUES ('9edc6f017f9d4be19f34e22acca77316', '939449b35abe42ff9cad56525a3f1c38', '4b1d1cbeebff413581a48f71725f788d', '72e5de7402ed420fb838337412bcb6f3');
INSERT INTO `telectivelesson` VALUES ('c2cbc1404e824c95970c8f7a9a6fca76', '939449b35abe42ff9cad56525a3f1c38', 'e0c308f42aa447ca8984053279868b1c', 'd6bfa46f030e4fa49f319abf9982aeb2');
INSERT INTO `telectivelesson` VALUES ('cca4bac6026043d29ce7ecb34013d291', '939449b35abe42ff9cad56525a3f1c38', '4dbd288e22894996a594e5333b3fae71', 'd6bfa46f030e4fa49f319abf9982aeb2');
INSERT INTO `telectivelesson` VALUES ('9f301339f2994d96a001c7788dd07f73', '939449b35abe42ff9cad56525a3f1c38', 'ce276ad27d414b2bae71881643b25a94', '2cb48c6cd05d4a73b0b44232d313de91');
INSERT INTO `telectivelesson` VALUES ('0148114757924e6196ac55856d0f417b', '939449b35abe42ff9cad56525a3f1c38', '27debfa901e54a75b6ca8f26781dfa10', '2cb48c6cd05d4a73b0b44232d313de91');
INSERT INTO `telectivelesson` VALUES ('6692da05239c402d92e51070624b9028', '939449b35abe42ff9cad56525a3f1c38', '2a92c83b7f504ad4b20be6c478a19891', '2cb48c6cd05d4a73b0b44232d313de91');
INSERT INTO `telectivelesson` VALUES ('1480ad63c4d2485d96228095ba7b289b', '939449b35abe42ff9cad56525a3f1c38', 'd1938fcfe12a40e1b5dafc3c68654373', 'cee352e18f194df1b8afa707e072ec1d');
INSERT INTO `telectivelesson` VALUES ('e8c826ee02324f3bbe5ebe3a045fc2be', '939449b35abe42ff9cad56525a3f1c38', '8a20992dc7bd4813b1d5e645e72b8ae8', 'cee352e18f194df1b8afa707e072ec1d');
INSERT INTO `telectivelesson` VALUES ('ae0188ca32464a049e8ced15fb780ca0', '939449b35abe42ff9cad56525a3f1c38', 'e0c308f42aa447ca8984053279868b1c', 'a573f5ea6c974082bb66051118e5ea64');
INSERT INTO `telectivelesson` VALUES ('1873fb048a6243d2b034d0200f240554', '939449b35abe42ff9cad56525a3f1c38', '9e91abc9386b42799d634c07713ab7ed', 'a573f5ea6c974082bb66051118e5ea64');
INSERT INTO `telectivelesson` VALUES ('f165799c06a94ed4a54e13077ef2372e', '939449b35abe42ff9cad56525a3f1c38', '256663984daf43a79ea3e994dff21c22', 'a573f5ea6c974082bb66051118e5ea64');

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
INSERT INTO `troleautority` VALUES ('68064534a7274d6d8e1759714b8b4398', 'eebc1fa86cdb4c8d81901151bf37eeca', '57d2bcff0d0a4af7bc3fc1e0b0f14798');
INSERT INTO `troleautority` VALUES ('f4312345fb354b719c417809cb7e5203', 'eebc1fa86cdb4c8d81901151bf37eeca', 'b387b35ee1ac46a18d26beb544aea8a7');
INSERT INTO `troleautority` VALUES ('91256d11daa04461b13e96d239f2697b', 'eebc1fa86cdb4c8d81901151bf37eeca', 'bb0569c94a5b46a3b6042d4ced5a6115');
INSERT INTO `troleautority` VALUES ('91021cf0e5724dda94a33b618d4cb2c9', 'eebc1fa86cdb4c8d81901151bf37eeca', 'e6c87b15587b42ad8d985318b65c0595');
INSERT INTO `troleautority` VALUES ('1faf93ad8cf14f53a7e79ec34841027f', 'eebc1fa86cdb4c8d81901151bf37eeca', '5b4f897fe9d744bf9be341860f3e61e6');
INSERT INTO `troleautority` VALUES ('eedb52e243f543e5b33522acea0599e7', 'eebc1fa86cdb4c8d81901151bf37eeca', '9e8b12537f03447596bedae9ed4aac32');
INSERT INTO `troleautority` VALUES ('a33ac6f2d5214d2a94efa2bae177fabf', 'eebc1fa86cdb4c8d81901151bf37eeca', 'caa2c5466fcf41e4843866757e9022a5');
INSERT INTO `troleautority` VALUES ('dca9be8973414ebe82a4797a05383a3c', 'eebc1fa86cdb4c8d81901151bf37eeca', 'd45e5b2508764852bc680b6b7417bbdc');
INSERT INTO `troleautority` VALUES ('752d26f679b14596b42043fba28267af', 'eebc1fa86cdb4c8d81901151bf37eeca', '74de8845c1bb432a84c241fb03f5204b');
INSERT INTO `troleautority` VALUES ('54a1cae6f29d43dcb22100ec79932bc8', 'eebc1fa86cdb4c8d81901151bf37eeca', '6b94a0cb88d24bada197ad92dfd63ad3');
INSERT INTO `troleautority` VALUES ('71704f00a3cd4515a1ced3ea457c3468', 'eebc1fa86cdb4c8d81901151bf37eeca', 'ee942b37b08c4c0abea1520ff8595668');
INSERT INTO `troleautority` VALUES ('c7c4244098094d3f9a404063bda7110b', 'eebc1fa86cdb4c8d81901151bf37eeca', 'f35c46ae893d49608b9a65bce6a472e6');

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
INSERT INTO `tsemester` VALUES ('360bd21e8c36464398afdeb594a40a0e', '90f07928223842a4893370c34e4c7578', '2015-06-10 17:58:30', null);
INSERT INTO `tsemester` VALUES ('fbfc19e3e4264c51b29e84774dc208fd', '90f07928223842a4893370c34e4c7578', '2015-06-11 15:43:50', '1');

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
INSERT INTO `tsemesterelective` VALUES ('b38a7d4d892144b0b25e6dc979f908d5', 'fbfc19e3e4264c51b29e84774dc208fd', '939449b35abe42ff9cad56525a3f1c38');
INSERT INTO `tsemesterelective` VALUES ('c278111b1868492fb826e9224523bb68', 'fbfc19e3e4264c51b29e84774dc208fd', '1c4d431016cf4c789aac3ed01029d587');

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
