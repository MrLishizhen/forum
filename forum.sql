/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80011
Source Host           : 127.0.0.1:3306
Source Database       : forum

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-02 11:39:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dt_article
-- ----------------------------
DROP TABLE IF EXISTS `dt_article`;
CREATE TABLE `dt_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fid` int(11) NOT NULL COMMENT '所属分类',
  `hot` int(11) NOT NULL DEFAULT '0' COMMENT '热门',
  `content` text NOT NULL COMMENT '文章内容',
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userID_id` (`userID`),
  CONSTRAINT `fk_userID_id` FOREIGN KEY (`userID`) REFERENCES `dt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_article
-- ----------------------------
INSERT INTO `dt_article` VALUES ('1', '导入图人鱼江湖让他的', '2020-03-31 17:23:49', '1', '0', '<p>认识它金童玉女三部分是都不能防火门郭敬明 </p>', '1');
INSERT INTO `dt_article` VALUES ('2', '导入图人鱼江湖让他的', '2020-03-31 17:25:04', '1', '0', '<p>认识它金童玉女三部分是都不能防火门郭敬明 </p>', '1');
INSERT INTO `dt_article` VALUES ('3', '导入图人鱼江湖让他的', '2020-03-31 17:25:16', '1', '0', '<p>认识它金童玉女三部分是都不能防火门郭敬明 </p>', '1');
INSERT INTO `dt_article` VALUES ('4', '你好前端', '2020-03-31 17:25:56', '1', '0', '<p>女人通电话男后台浮动吗</p>', '1');
INSERT INTO `dt_article` VALUES ('5', '谁让他让他女人', '2020-03-31 17:27:13', '1', '0', '<p>方便的那么色广州市地方VC</p>', '1');
INSERT INTO `dt_article` VALUES ('6', '不少人如果设评估师', '2020-03-31 17:29:41', '1', '0', '<p>你够狠色粉玻镁板马拉喀什个热备份方向上的个</p>', '1');
INSERT INTO `dt_article` VALUES ('7', '说给你听难如登天', '2020-03-31 17:32:13', '1', '0', '<p>哪天发货没加入多功能房给女人申达股份</p>', '1');
INSERT INTO `dt_article` VALUES ('8', '的播放度日如年的发给你', '2020-03-31 17:36:58', '1', '0', '<p>是人体内国防部对方VC</p>', '1');
INSERT INTO `dt_article` VALUES ('9', '的播放度日如年的发给你', '2020-03-31 17:37:43', '1', '0', '<p>是人体内国防部对方VC</p><p><img src=\"http://localhost:3000/tmp/1585647428532.png\"></p>', '1');
INSERT INTO `dt_article` VALUES ('10', '色如何导入那的人', '2020-03-31 17:52:29', '1', '0', '<p>二十年的发给你</p>', '1');
INSERT INTO `dt_article` VALUES ('11', '色如何导入那的人', '2020-03-31 17:53:42', '1', '0', '<p>二十年的发给你</p><p><br></p>', '1');
INSERT INTO `dt_article` VALUES ('12', '色如何导入那的人', '2020-03-31 17:54:46', '1', '0', '<p>二十年的发给你不认识吧</p><p><br></p>', '1');
INSERT INTO `dt_article` VALUES ('13', '你好大厦噶噶空位，', '2020-03-31 17:56:10', '1', '0', '<p>二十年的发给你不认识吧</p><p><br></p><p><br></p>', '1');
INSERT INTO `dt_article` VALUES ('14', '你好大厦噶噶空位，', '2020-03-31 17:56:51', '1', '0', '<p>二十年的发给你不认识吧</p><p><br></p><p><img src=\"http://localhost:3000/tmp/1585648610589.jpg\"></p>', '1');
INSERT INTO `dt_article` VALUES ('15', '你好大厦噶噶空位，', '2020-03-31 17:57:22', '1', '0', '<p>二十年的发给你不认识吧</p><p><br></p><p><br></p>', '1');
INSERT INTO `dt_article` VALUES ('16', '干活吗你还在', '2020-03-31 17:58:37', '1', '0', '', '1');
INSERT INTO `dt_article` VALUES ('17', '设若干色哦发完了空格', '2020-03-31 18:00:32', '1', '0', '<p>返回键她的眼睛会感受到方便吧</p>', '1');
INSERT INTO `dt_article` VALUES ('18', '东方宝石发给你很多事', '2020-03-31 18:01:14', '1', '0', '<p>表示鼠标第三方包</p>', '1');
INSERT INTO `dt_article` VALUES ('19', '方便的烦恼播摄入函数返回', '2020-03-31 18:20:10', '1', '0', '<p>公司电话稍等哈送人头还认识</p>', '1');
INSERT INTO `dt_article` VALUES ('20', '让她男人打给对方半年度丰田还跟他说', '2020-03-31 18:21:59', '1', '0', '<p>能容纳</p>', '1');
INSERT INTO `dt_article` VALUES ('21', '如果设法把告知对方vdfs', '2020-03-31 18:24:24', '1', '0', '<p>不v四等分不想穿VB的分别第三方包战地风暴学的不对发给你放得下</p>', '1');
INSERT INTO `dt_article` VALUES ('22', '这是一个大厦并那么多天然消毒柜悲伤的故事', '2020-03-31 18:34:30', '7', '0', '<p>上德若谷第三方第三方不舍得哈</p>', '1');
INSERT INTO `dt_article` VALUES ('23', 'css是世界上最好的语言', '2020-04-01 16:38:01', '2', '0', '<p>杉杉股份那顿饭改变的是服个软工时费不v从<img src=\"http://localhost:3000/tmp/1585730276827.jpg\"></p>', '1');
INSERT INTO `dt_article` VALUES ('24', 'JavaScript是世界上最好的语言', '2020-04-01 16:39:57', '5', '0', '<p><img src=\"http://localhost:3000/tmp/1585730395399.png\"></p>', '1');
INSERT INTO `dt_article` VALUES ('25', '花色最好的是你吗发表个生日歌', '2020-04-01 16:42:53', '7', '0', '<p>不身份标识等分的第三方不是被封分公司的个梵蒂冈不干涉顶部财付通个</p>', '1');
INSERT INTO `dt_article` VALUES ('26', 'css3是世界上最好的', '2020-04-01 16:45:22', '4', '0', '<p>不发给你辅导费孤鸿寡鹄你还敢惹我个人风格发那个才能把</p>', '1');
INSERT INTO `dt_article` VALUES ('27', 'Vue是世界上最好的前端框架', '2020-04-01 16:52:03', '6', '0', '<p>ing反而各省内容告诉你如何了快递费那别了的开始分不开的是否能本来多少计日工is二极管两块多方便您被那些独立开发能告诉代理发给你十多年是脑子里的愤怒的水立方半年度凌霜风暴你的思路方柏霓代理商分辨率电饭煲哪来的方便你的路径</p>', '1');
INSERT INTO `dt_article` VALUES ('28', '这是关于这个的大哥表示如果在', '2020-04-01 16:58:49', '1', '0', '<p>方便的让你把对方是还贵呢色个人大部分是年糕火锅第三方V型 </p>', '2');
INSERT INTO `dt_article` VALUES ('29', '这是一个测试用的文件割舍', '2020-04-01 22:01:05', '7', '0', '<p><img src=\"http://localhost:3000/tmp/1585749653118.jpg\"></p><p>你好大傻逼</p>', '1');
INSERT INTO `dt_article` VALUES ('30', 'fnbrssdzjfpovbsmnls e', '2020-04-01 23:33:47', '1', '0', '', '1');
INSERT INTO `dt_article` VALUES ('31', '二狗我阿萨德刚is这顿饭宁波第三方能够as而搞不懂 ', '2020-04-01 23:53:38', '1', '0', '<p>表示是否大V菜鸟dois访问哦is大V你播放时大非流动资产V型哦以购房人额度</p><p class=\"ql-align-center\"><img src=\"http://localhost:3000/tmp/1585756399988.png\"></p><p><br></p>', '1');
INSERT INTO `dt_article` VALUES ('32', '的方法纳罗时空的分屏麻烦不平等谷朊粉V型从', '2020-04-01 23:55:10', '1', '0', '<p class=\"ql-align-center\"><img src=\"http://localhost:3000/tmp/1585756471854.jpg\"></p><p class=\"ql-align-center\">你好</p>', '1');

-- ----------------------------
-- Table structure for dt_list
-- ----------------------------
DROP TABLE IF EXISTS `dt_list`;
CREATE TABLE `dt_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `fid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_list
-- ----------------------------
INSERT INTO `dt_list` VALUES ('1', 'HTML', '0');
INSERT INTO `dt_list` VALUES ('2', 'CSS', '0');
INSERT INTO `dt_list` VALUES ('3', 'HTML5', '0');
INSERT INTO `dt_list` VALUES ('4', 'CSS3', '0');
INSERT INTO `dt_list` VALUES ('5', 'JavaScript', '0');
INSERT INTO `dt_list` VALUES ('6', 'Vue', '0');
INSERT INTO `dt_list` VALUES ('7', '其他', '0');

-- ----------------------------
-- Table structure for dt_user
-- ----------------------------
DROP TABLE IF EXISTS `dt_user`;
CREATE TABLE `dt_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trueName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户真实姓名',
  `password` varchar(16) NOT NULL COMMENT '密码',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '用户类型 默认为2表示用户 1表示版主管理员 0表示最大管理员',
  `sex` int(10) NOT NULL DEFAULT '0' COMMENT '性别，默认为0 表示男 1表示女',
  `nickName` varchar(20) NOT NULL COMMENT '用户昵称',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户注册时间',
  `face` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户头像',
  `phone` varchar(20) NOT NULL COMMENT '用户电话',
  `black` int(10) NOT NULL DEFAULT '0' COMMENT '用户是否被禁言 默认为0 没有被禁言',
  `profiles` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简介',
  `integral` int(10) DEFAULT '0' COMMENT '个人积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_user
-- ----------------------------
INSERT INTO `dt_user` VALUES ('1', '李世镇', '123456', '0', '0', '秋雨不良人', '718647063@qq.com', '2020-03-27 00:00:00', ' ', '17560640208', '0', '', '6');
INSERT INTO `dt_user` VALUES ('2', null, 'li19990208', '0', '0', '秋雨有良人', '718640763@qq.com', '2020-03-28 17:46:13', null, '17560640208', '0', '', '1');
INSERT INTO `dt_user` VALUES ('3', null, '123456789', '0', '0', '天天太样下', '718647063@qq.com', '2020-03-28 17:52:03', null, '15864752588', '0', '', '0');
INSERT INTO `dt_user` VALUES ('4', null, 'li19990208', '0', '0', '天下有情人', '718647063@qq.com', '2020-03-29 21:01:28', null, '17560640208', '0', '', '0');

-- ----------------------------
-- View structure for article_user
-- ----------------------------
DROP VIEW IF EXISTS `article_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `article_user` AS select `t1`.`id` AS `id`,`t1`.`title` AS `title`,`t1`.`date` AS `date`,`t1`.`fid` AS `fid`,`t1`.`hot` AS `hot`,`t1`.`content` AS `content`,`t1`.`userID` AS `userID`,`t2`.`nickName` AS `categoryName` from ((select `dt_article`.`id` AS `id`,`dt_article`.`title` AS `title`,`dt_article`.`date` AS `date`,`dt_article`.`fid` AS `fid`,`dt_article`.`hot` AS `hot`,`dt_article`.`content` AS `content`,`dt_article`.`userID` AS `userID` from `dt_article`) `t1` join (select `dt_user`.`id` AS `id`,`dt_user`.`trueName` AS `trueName`,`dt_user`.`password` AS `password`,`dt_user`.`type` AS `type`,`dt_user`.`sex` AS `sex`,`dt_user`.`nickName` AS `nickName`,`dt_user`.`email` AS `email`,`dt_user`.`time` AS `time`,`dt_user`.`face` AS `face`,`dt_user`.`phone` AS `phone`,`dt_user`.`black` AS `black`,`dt_user`.`profiles` AS `profiles`,`dt_user`.`integral` AS `integral` from `dt_user`) `t2` on((`t1`.`userID` = `t2`.`id`))) ;

-- ----------------------------
-- Procedure structure for p_getProductByCondition
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_getProductByCondition`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getProductByCondition`(
	_type INT,					/*所属分类*/
  _begin INT,         -- 要查看的数据开始的编号
  _count INT          -- 要查看几条数据
)
BEGIN
	-- 获取按当前条件查询(忽略分页)得到的总记录数
	SELECT COUNT(*) AS total FROM `article_user`;
	
	-- 获取按当前条件查询，分页情况下应当返回的记录
	SELECT * FROM `article_user` WHERE (`fid` = _type)
	LIMIT _begin,_count;
END
;;
DELIMITER ;
