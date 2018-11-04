SET sql_mode='NO_AUTO_VALUE_ON_ZERO';
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for urlinfo
-- ----------------------------
DROP TABLE IF EXISTS `urlinfo`;
CREATE TABLE `urlinfo`  (
  `uId` int(255) NOT NULL AUTO_INCREMENT,
  `urlName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名字',
  `urlWeblink` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站链接',
  `urlSortId` int(11) NULL DEFAULT NULL COMMENT '网站分类ID(外键)',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id(外键)',
  PRIMARY KEY (`uId`) USING BTREE,
  INDEX `urlAndSort`(`urlSortId`) USING BTREE,
  INDEX `user_url`(`userId`) USING BTREE,
  CONSTRAINT `urlInfo_ibfk_1` FOREIGN KEY (`urlSortId`) REFERENCES `urlsortinfo` (`urlSortId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_url` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of urlinfo
-- ----------------------------
INSERT INTO `urlinfo` VALUES (0, '百度', 'http://www.baidu.com/', 0, 0);
INSERT INTO `urlinfo` VALUES (1, '淘宝网', 'http://www.taobao.com/', 1, 0);
INSERT INTO `urlinfo` VALUES (2, '苏宁易购', 'http://www.suning.com/', 1, 0);
INSERT INTO `urlinfo` VALUES (3, '京东', 'http://www.jd.com/', 1, 0);
INSERT INTO `urlinfo` VALUES (4, '国美商城', 'http://www.gome.com.cn/', 1, 0);
INSERT INTO `urlinfo` VALUES (5, '聚划算', 'http://ju.taobao.com/', 1, 0);
INSERT INTO `urlinfo` VALUES (6, '亚马逊', 'http://www.amazon.cn/', 1, 0);
INSERT INTO `urlinfo` VALUES (7, '虎扑足球', 'http://soccer.hupu.com/', 2, 0);
INSERT INTO `urlinfo` VALUES (8, '新浪足球', 'http://sports.sina.com.cn/global/', 2, 0);
INSERT INTO `urlinfo` VALUES (9, '足协', 'http://www.thecfa.cn/', 2, 0);
INSERT INTO `urlinfo` VALUES (10, 'CCTV体育', 'http://sports.cctv.com/football/index.shtml', 2, 0);
INSERT INTO `urlinfo` VALUES (11, 'NBA官网', 'http://china.nba.com/', 2, 0);
INSERT INTO `urlinfo` VALUES (12, 'CBA官网', 'http://www.cba.gov.cn/', 2, 0);
INSERT INTO `urlinfo` VALUES (13, '百度贴吧', 'http://tieba.baidu.com/', 3, 0);
INSERT INTO `urlinfo` VALUES (14, '推特', 'http://twitter.com/', 3, 0);
INSERT INTO `urlinfo` VALUES (15, 'QQ空间', 'http://qzone.qq.com/', 3, 0);
INSERT INTO `urlinfo` VALUES (16, '天涯', 'http://www.tianya.cn/', 3, 0);
INSERT INTO `urlinfo` VALUES (17, '人人网', 'http://china.nba.com/', 3, 0);
INSERT INTO `urlinfo` VALUES (18, 'Facebook', 'http://www.facebook.com/', 3, 0);
INSERT INTO `urlinfo` VALUES (19, '英雄联盟', 'http://lol.qq.com', 4, 0);
INSERT INTO `urlinfo` VALUES (20, '天涯明月刀', 'http://wuxia.qq.com', 4, 0);
INSERT INTO `urlinfo` VALUES (21, '地下城勇士', 'http://dnf.qq.com', 4, 0);
INSERT INTO `urlinfo` VALUES (22, '梦幻西游', 'http://xyq.163.com', 4, 0);
INSERT INTO `urlinfo` VALUES (23, 'Dota2', 'http://www.dota2.com.cn', 4, 0);
INSERT INTO `urlinfo` VALUES (24, '坦克世界', 'http://wot.kongzhong.com', 4, 0);
INSERT INTO `urlinfo` VALUES (25, '瘾科技', 'http://cn.engadget.com', 5, 0);
INSERT INTO `urlinfo` VALUES (26, 'zealer', 'http://www.zealer.com', 5, 0);
INSERT INTO `urlinfo` VALUES (27, '大米评测', 'http://www.pingce.net', 5, 0);
INSERT INTO `urlinfo` VALUES (28, '数字尾巴', 'http://www.dgtle.com', 5, 0);
INSERT INTO `urlinfo` VALUES (29, '中关村在线', 'http://www.zol.com.cn', 5, 0);
INSERT INTO `urlinfo` VALUES (30, '太平洋电脑', 'http://www.pconline.com.cn', 5, 0);
INSERT INTO `urlinfo` VALUES (31, '携程', 'http://www.ctrip.com', 6, 0);
INSERT INTO `urlinfo` VALUES (32, '途牛', 'http://www.tuniu.com', 6, 0);
INSERT INTO `urlinfo` VALUES (33, '驴妈妈旅游', 'http://www.lvmama.com', 6, 0);
INSERT INTO `urlinfo` VALUES (34, '去哪网', 'http://www.qunar.com', 6, 0);
INSERT INTO `urlinfo` VALUES (35, '马蜂窝', 'http://www.mafengwo.cn', 6, 0);
INSERT INTO `urlinfo` VALUES (36, '长途客运站', 'http://www.keyunzhan.com', 6, 0);
INSERT INTO `urlinfo` VALUES (37, '瘾科技', 'http://cn.engadget.com', 0, 0);
INSERT INTO `urlinfo` VALUES (38, '去哪网', 'http://www.qunar.com', 0, 0);
INSERT INTO `urlinfo` VALUES (39, 'QQ空间', 'http://qzone.qq.com/', 0, 0);
INSERT INTO `urlinfo` VALUES (40, '京东', 'http://www.jd.com/', 0, 0);

-- ----------------------------
-- Table structure for urlsortinfo
-- ----------------------------
DROP TABLE IF EXISTS `urlsortinfo`;
CREATE TABLE `urlsortinfo`  (
  `urlSortId` int(11) NOT NULL AUTO_INCREMENT COMMENT '网址分类ID',
  `urlSortName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网址分类名称',
  PRIMARY KEY (`urlSortId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of urlsortinfo
-- ----------------------------
INSERT INTO `urlsortinfo` VALUES (0, '常用');
INSERT INTO `urlsortinfo` VALUES (1, '购物');
INSERT INTO `urlsortinfo` VALUES (2, '体育');
INSERT INTO `urlsortinfo` VALUES (3, '社区');
INSERT INTO `urlsortinfo` VALUES (4, '游戏');
INSERT INTO `urlsortinfo` VALUES (5, '数码');
INSERT INTO `urlsortinfo` VALUES (6, '旅行');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `userAccount` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `userPwd` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (0, 'boss', 'admin', 'admin');
INSERT INTO `userinfo` VALUES (1, '张三', 'asd', '123');
INSERT INTO `userinfo` VALUES (2, '李四', 'asd1', '1231');

SET FOREIGN_KEY_CHECKS = 1;
