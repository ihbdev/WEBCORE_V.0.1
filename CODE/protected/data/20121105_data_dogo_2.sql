-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 11, 2012 at 11:46 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dogo`
--

-- --------------------------------------------------------

--
-- Table structure for table `authassignment`
--

CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(64) NOT NULL,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`itemname`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authassignment`
--

INSERT INTO `authassignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('admin', 1, NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `authitem`
--

CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authitem`
--

INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('admin', 2, '', NULL, 'N;'),
('author', 2, '', NULL, 'N;'),
('create', 0, 'create', NULL, 'N;'),
('delete', 0, 'delete', NULL, 'N;'),
('editor', 2, '', NULL, 'N;'),
('manager_account', 2, NULL, NULL, NULL),
('managerAccount', 0, 'manager user', NULL, NULL),
('updateOwn', 1, 'update a post by author himself', 'return Yii::app()->user->id==$params["post"]->created_by;', 'N;'),
('update', 0, 'update a post', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `authitemchild`
--

CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authitemchild`
--

INSERT INTO `authitemchild` (`parent`, `child`) VALUES
('admin', 'author'),
('admin', 'delete'),
('admin', 'editor'),
('admin', 'manager_account'),
('author', 'create'),
('author', 'updateOwn'),
('editor', 'update'),
('manager_account', 'managerAccount'),
('update', 'create'),
('updateOwn', 'update');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_article`
--

CREATE TABLE IF NOT EXISTS `tbl_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `lang` smallint(6) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `special` tinyint(4) NOT NULL DEFAULT '0',
  `order_view` int(11) NOT NULL DEFAULT '0',
  `title` varchar(256) NOT NULL,
  `alias` varchar(256) NOT NULL,
  `keywords` varchar(512) NOT NULL,
  `other` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_article`
--

INSERT INTO `tbl_article` (`id`, `catid`, `type`, `lang`, `status`, `special`, `order_view`, `title`, `alias`, `keywords`, `other`, `created_by`, `created_date`) VALUES
(1, 0, 4, 0, 1, 1, 0, 'Đồ gỗ đẹp', 'do-go-dep-10052012', '', '{"link":"http:\\/\\/www.youtube.com\\/watch?v=1c6OpC0te5k","introimage":"","description":"","modified":"{\\"1336666762\\":\\"1\\",\\"1336666793\\":\\"1\\"}"}', 1, 1336666723),
(2, 0, 5, 0, 1, 0, 0, 'Banner left', 'banner-left-11052012', '', '{"description":"Banner left","images":"3","modified":"{\\"1336669683\\":\\"1\\",\\"1336669684\\":\\"1\\",\\"1336669697\\":\\"1\\",\\"1336669707\\":\\"1\\"}"}', 1, 1336669343),
(3, 0, 5, 0, 1, 0, 0, 'Headline', 'headline-11052012', '', '{"description":"Headline","images":"6,7,8,9,10,11,12","modified":"{\\"1336670427\\":\\"1\\",\\"1336670657\\":\\"1\\",\\"1336670662\\":\\"1\\",\\"1336670665\\":\\"1\\",\\"1336670690\\":\\"1\\",\\"1336670950\\":\\"1\\",\\"1336671429\\":\\"1\\",\\"1336671430\\":\\"1\\",\\"1336671434\\":\\"1\\"}"}', 1, 1336670381),
(4, 59, 1, 0, 1, 0, 0, 'Hướng dẫn mua hàng', 'huong-dan-mua-hang', '', '{"introimage":"24","list_suggest":"","fulltext":"<table class=\\"table_noborder\\" cellspacing=\\"0\\" cellpadding=\\"0\\" width=\\"96%\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td class=\\"v_border\\">&nbsp;<\\/td>\\r\\n<td><br \\/><\\/td>\\r\\n<td class=\\"v_border\\">&nbsp;<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td class=\\"v_border\\" colspan=\\"3\\" align=\\"left\\" valign=\\"top\\">\\r\\n<p><strong><span style=\\"font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">1) Duy\\u1ec7t v&agrave; ch\\u1ecdn s\\u1ea3n ph\\u1ea9m<br \\/>2) Th&ecirc;m s\\u1ea3n ph\\u1ea9m v&agrave;o gi\\u1ecf h&agrave;ng c\\u1ee7a b\\u1ea1n<br \\/>3) C&aacute;c b\\u01b0\\u1edbc thanh to&aacute;n:<\\/span><\\/strong><\\/p>\\r\\n<p><span style=\\"color: #33cccc; font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp;<span style=\\"color: #0000ff;\\">&nbsp;<strong>B\\u01b0\\u1edbc1 - Xem th&ocirc;ng tin gi\\u1ecf h&agrave;ng:<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - H\\u1ec7 th\\u1ed1ng hi\\u1ec3n th\\u1ecb c&aacute;c th&ocirc;ng tin v\\u1ec1 s\\u1ea3n ph\\u1ea9m b\\u1ea1n \\u0111&atilde; \\u0111\\u1eb7t mua nh\\u01b0 ch\\u1ee7ng lo\\u1ea1i, \\u0111\\u01a1n gi&aacute;, s\\u1ed1 l\\u01b0\\u1ee3ng, tr\\u1ecb gi&aacute;,...T\\u1ea1i \\u0111&acirc;y b\\u1ea1n c&oacute; th\\u1ec3 thay \\u0111\\u1ed5i s\\u1ed1 l\\u01b0\\u1ee3ng h&agrave;ng ho&aacute; b\\u1eb1ng c&aacute;ch nh\\u1eadp v&agrave;o s\\u1ed1 l\\u01b0\\u01a1ng trong &ocirc; \\"S\\u1ed1 l\\u01b0\\u1ee3ng\\".<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - N\\u1ebfu mu\\u1ed1n tr\\u1ea3 l\\u1ea1i s\\u1ea3n ph\\u1ea9m \\u0111&atilde; ch\\u1ecdn (kh&ocirc;ng mua n\\u1eefa), b\\u1ea1n nh\\u1eadp v&agrave;o s\\u1ed1 l\\u01b0\\u1ee3ng c\\u1ee7a s\\u1ea3n ph\\u1ea9m \\u0111&oacute; b\\u1eb1ng \\"0\\".<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - M\\u1ed7i l\\u1ea7n thay \\u0111\\u1ed5i s\\u1ed1 l\\u01b0\\u1ee3ng c\\u1ee7a s\\u1ea3n ph\\u1ea9m, b\\u1ea1n nh\\u1edb ph\\u1ea3i click v&agrave;o n&uacute;t&nbsp;<strong>\\"C\\u1eadp nh\\u1eadt gi\\u1ecf h&agrave;ng\\"<\\/strong>&nbsp;\\u0111\\u1ec3 h\\u1ec7 th\\u1ed1ng ghi nh\\u1eadn l\\u1ea1i nh\\u1eefng thay \\u0111\\u1ed5i trong gi\\u1ecf h&agrave;ng c\\u1ee7a b\\u1ea1n tr\\u01b0\\u1edbc khi click ch\\u1ecdn&nbsp;<strong>\\"Thanh to&aacute;n\\"<\\/strong>&nbsp;\\u0111\\u1ec3 sang b\\u01b0\\u1edbc k\\u1ebf ti\\u1ebfp.&nbsp;<br \\/>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - N\\u1ebfu \\u0111&atilde; \\u0111\\u0103ng nh\\u1eadp (login) r\\u1ed3i th&igrave; b\\u1ea1n s\\u1ebd \\u0111\\u01b0\\u1ee3c chuy\\u1ec3n sang b\\u01b0\\u1edbc 2, n\\u1ebfu ch\\u01b0a h\\u1ec7 th\\u1ed1ng s\\u1ebd y&ecirc;u c\\u1ea7u b\\u1ea1n \\u0111\\u0103ng nh\\u1eadp tr\\u01b0\\u1edbc khi thanh to&aacute;n. N\\u1ebfu b\\u1ea1n \\u0111&atilde; \\u0111\\u0103ng k&yacute; l&agrave;m th&agrave;nh vi&ecirc;n v\\u1edbi Vinabook th&igrave; b\\u1ea1n \\u0111\\u0103ng nh\\u1eadp v\\u1edbi email v&agrave; m\\u1eadt kh\\u1ea9u \\u0111&atilde; \\u0111\\u0103ng k&yacute;, n\\u1ebfu ch\\u01b0a b\\u1ea1n c&oacute; th\\u1ec3 \\u0111\\u0103ng k&yacute; t\\u1ea1i b\\u01b0\\u1edbc n&agrave;y.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - Xin l\\u01b0u &yacute; \\u0111\\u1ec3 \\u0111\\u0103ng nh\\u1eadp v&agrave;o website Vinabook.com. b\\u1ea1n c\\u1ea7n ph\\u1ea3i cung c\\u1ea5p hai th&ocirc;ng tin sau:<br \\/>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; + \\u0110\\u1ecba ch\\u1ec9 email: Email m&agrave; b\\u1ea1n \\u0111&atilde; d&ugrave;ng \\u0111\\u1ec3 \\u0111ang k&yacute; l&agrave;m th&agrave;nh vi&ecirc;n.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; + M\\u1eadt kh\\u1ea9u \\u0111\\u0103ng nh\\u1eadp: M\\u1eadt kh\\u1ea9u b\\u1ea1n \\u0111&atilde; \\u0111\\u0103ng k&yacute; v\\u1edbi Vinabook.<\\/span><\\/p>\\r\\n<p><span style=\\"color: #33cccc; font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style=\\"color: #0000ff;\\">B\\u01b0\\u1edbc 2 - \\u0110\\u1ecba ch\\u1ec9 thanh to&aacute;n v&agrave; giao h&agrave;ng:<\\/span><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - Nh\\u1eadp v&agrave;o \\u0111\\u1ecba ch\\u1ec9 thanh to&aacute;n v&agrave; \\u0111\\u1ecba ch\\u1ec9 giao h&agrave;ng.&nbsp;<br \\/>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - B\\u1ea1n c&oacute; th\\u1ec3 s\\u1eed d\\u1ee5ng c&aacute;c tu\\u1ef3 ch\\u1ecdn \\"\\u0110\\u1ecba ch\\u1ec9 thanh to&aacute;n gi\\u1ed1ng th&ocirc;ng tin t&agrave;i kho\\u1ea3n\\" v&agrave; \\"\\u0110\\u1ecba ch\\u1ec9 giao h&agrave;ng gi\\u1ed1ng \\u0111\\u1ecba ch\\u1ec9 thanh to&aacute;n\\".<\\/span><\\/p>\\r\\n<p><span style=\\"color: #33cccc; font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp;<span style=\\"color: #0000ff;\\">&nbsp;<strong>B\\u01b0\\u1edbc 3 - Ph\\u01b0\\u01a1ng th\\u1ee9c v\\u1eadn chuy\\u1ec3n v&agrave; thanh to&aacute;n:<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - Ch\\u1ecdn ph\\u01b0\\u01a1ng th\\u1ee9c thanh to&aacute;n v&agrave; ph\\u01b0\\u01a1ng th\\u1ee9c v\\u1eadn chuy\\u1ec3n.&nbsp;&nbsp;<br \\/>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - B\\u1ea1n c&oacute; th\\u1ec3 y&ecirc;u c\\u1ea7u Vinabook g&oacute;i h&agrave;ng l\\u1ea1i th&agrave;nh qu&agrave; ho\\u1eb7c xu\\u1ea5t h&oacute;a \\u0111\\u01a1n cho b\\u1ea1n t\\u1ea1i b\\u01b0\\u1edbc n&agrave;y.<\\/span>&nbsp;&nbsp;&nbsp;&nbsp;<\\/p>\\r\\n<p><span style=\\"color: #33cccc; font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp;<strong>&nbsp;<\\/strong><\\/span><strong><span style=\\"color: #0000ff; font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">B\\u01b0\\u1edbc 4 - Xem h&oacute;a \\u0111\\u01a1n:<\\/span><\\/strong><\\/p>\\r\\n<p><span style=\\"font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; - H\\u1ec7 th\\u1ed1ng s\\u1ebd hi\\u1ec3n th\\u1ecb ho&aacute; \\u0111\\u01a1n mua h&agrave;ng c\\u1ee7a b\\u1ea1n, n\\u1ebfu \\u0111\\u1ed3ng &yacute; b\\u1ea1n click&nbsp;<strong>\\"\\u0110\\u1eb7t mua h&agrave;ng\\"<\\/strong>&nbsp;\\u0111\\u1ec3 k\\u1ebft th&uacute;c vi\\u1ec7c \\u0111\\u1eb7t mua h&agrave;ng.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - Ri&ecirc;ng v\\u1edbi ph\\u01b0\\u01a1ng th\\u1ee9c thanh to&aacute;n b\\u1eb1ng&nbsp;<strong>th\\u1ebb t&iacute;n d\\u1ee5ng(Credit Card)<\\/strong>, b\\u1ea1n s\\u1ebd \\u0111\\u01b0\\u1ee3c chuy\\u1ec3n t\\u1edbi trang&nbsp;<strong>2CheckOut<\\/strong>&nbsp;v&agrave; nh\\u1eadp v&agrave;o c&aacute;c th&ocirc;ng tin \\u0111\\u01b0\\u1ee3c y&ecirc;u c\\u1ea7u tr\\u01b0\\u1edbc khi k\\u1ebft th&uacute;c vi\\u1ec7c mua h&agrave;ng.&nbsp;&nbsp;&nbsp;<br \\/><\\/span><\\/p>\\r\\n<p><span style=\\"color: #33cccc; font-family: tahoma, arial, helvetica, sans-serif; font-size: x-small;\\">&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style=\\"color: #0000ff;\\">B\\u01b0\\u1edbc 5 - K\\u1ebft th&uacute;c:<\\/span><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: tahoma, arial, helvetica, sans-serif;\\"><span style=\\"font-size: x-small;\\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - H\\u1ec7 th\\u1ed1ng s\\u1ebd g\\u1edfi email x&aacute;c nh\\u1eadn \\u0111\\u01a1n h&agrave;ng cho b\\u1ea1n, nh&acirc;n vi&ecirc;n Vinabook s\\u1ebd li&ecirc;n h\\u1ec7 v\\u1edbi b\\u1ea1n \\u0111\\u1ec3 giao h&agrave;ng theo y&ecirc;u c\\u1ea7u.&nbsp;<\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>","introtext":"\\r\\n\\r\\n\\r\\n&nbsp;\\r\\n\\r\\n&nbsp;\\r\\n\\r\\n\\r\\n\\r\\n1) Duy\\u1ec7t v&agrave; ch\\u1ecdn s\\u1ea3n ph\\u1ea9m2) Th&ecirc;m s\\u1ea3n ph\\u1ea9m v&agrave;o gi\\u1ecf h&agrave;ng c\\u1ee7a b\\u1ea1n3) C&aacute;c b\\u01b0\\u1edbc thanh to&aacute;n:\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;B\\u01b0\\u1edbc1 - Xem th&ocirc;ng tin gi\\u1ecf h&agrave;ng:\\r\\n&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - H\\u1ec7 th\\u1ed1ng hi\\u1ec3n th\\u1ecb c&aacute;c th&ocirc;ng tin v\\u1ec1 s\\u1ea3n ph\\u1ea9m b\\u1ea1n \\u0111&atilde; \\u0111\\u1eb7t mua nh\\u01b0 ch\\u1ee7ng lo\\u1ea1i, \\u0111\\u01a1n gi&aacute;, s\\u1ed1 l\\u01b0\\u1ee3ng, tr\\u1ecb gi&aacute;,...T\\u1ea1i \\u0111&acirc;y b\\u1ea1n c&oacute; th\\u1ec3 thay \\u0111\\u1ed5i s\\u1ed1 l\\u01b0\\u1ee3ng h&agrave;ng ho&aacute; b\\u1eb1ng c&aacute;ch nh\\u1eadp v&agrave;o s\\u1ed1 l\\u01b0\\u01a1ng trong &ocirc; \\"S\\u1ed1 l\\u01b0\\u1ee3ng\\".\\r\\n&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - N\\u1ebfu mu\\u1ed1n tr\\u1ea3 l\\u1ea1i s\\u1ea3n ph\\u1ea9m \\u0111&atilde; ch\\u1ecdn (kh&ocirc;ng mua n\\u1eefa), b\\u1ea1n nh\\u1eadp v&agrave;o s\\u1ed1 l\\u01b0\\u1ee3ng c\\u1ee7a s\\u1ea3n ph\\u1ea9m \\u0111&oacute; b\\u1eb1ng \\"0\\".\\r\\n&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - M\\u1ed7i l\\u1ea7n thay \\u0111\\u1ed5i s\\u1ed1 ...","modified":"{\\"1336710023\\":\\"1\\",\\"1336710025\\":\\"1\\"}"}', 1, 1336673359),
(5, 59, 1, 0, 1, 0, 0, 'Phương thức thanh toán', 'phuong-thuc-thanh-toan', '', '{"introimage":"23","list_suggest":"","fulltext":"<p><span style=\\"text-decoration: underline;\\">Khu v\\u1ef1c TP.HCM:<\\/span>&nbsp;qu&yacute; kh&aacute;ch c&oacute; th\\u1ec3 ch\\u1ecdn 1 trong 3 h&igrave;nh th\\u1ee9c sau:<\\/p>\\r\\n<p>1-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Qu&yacute; kh&aacute;ch chuy\\u1ec3n kho\\u1ea3n tr\\u01b0\\u1edbc cho ch&uacute;ng t&ocirc;i \\u0111\\u1ec3 thanh to&aacute;n cho s\\u1ea3n ph\\u1ea9m m&agrave; qu&yacute; kh&aacute;ch \\u0111\\u1eb7t h&agrave;ng. Ti\\u1ebfp theo, ch&uacute;ng t&ocirc;i s\\u1ebd chuy\\u1ec3n h&agrave;ng \\u0111\\u1ebfn t\\u1eadn n\\u01a1i cho qu&yacute; kh&aacute;ch theo \\u0110\\u01a1n \\u0110\\u1eb7t h&agrave;ng.<\\/p>\\r\\n<p>2-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ch&uacute;ng t&ocirc;i s\\u1ebd giao h&agrave;ng t\\u1eadn n\\u01a1i theo \\u0110\\u01a1n \\u0110\\u1eb7t H&agrave;ng c\\u1ee7a qu&yacute; kh&aacute;ch v&agrave; qu&yacute; kh&aacute;ch vui l&ograve;ng thanh to&aacute;n \\u0111\\u01a1n h&agrave;ng sau khi \\u0111&atilde; ki\\u1ec3m tra v&agrave; nh\\u1eadn h&agrave;ng.<\\/p>\\r\\n<p>3-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Qu&yacute; kh&aacute;ch c&oacute; th\\u1ec3 \\u0111\\u1ebfn mua h&agrave;ng v&agrave; thanh to&aacute;n tr\\u1ef1c ti\\u1ebfp t\\u1ea1i v\\u0103n ph&ograve;ng giao d\\u1ecbch c\\u1ee7a Cty<strong><em>Th\\u1ebf Gi\\u1edbi K\\u1ef9 Thu\\u1eadt S\\u1ed1&nbsp;&nbsp;<\\/em><\\/strong>t\\u1ea1i:&nbsp;<strong>105 \\u0110\\u1eb7ng V\\u0103n Ng\\u1eef F.14 Q.Ph&uacute; Nhu\\u1eadn TP.HCM<\\/strong>&nbsp; Tel:<span style=\\"color: #ff0000;\\"><strong>08.66 744 606<\\/strong><\\/span>&nbsp; ho\\u1eb7c&nbsp;<span style=\\"color: #0000ff;\\"><strong>0936 101 101<\\/strong><\\/span>&nbsp;-&nbsp;<span style=\\"color: #008000;\\"><strong>0936 35 75 76<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"text-decoration: underline;\\">Ngo&agrave;i TP.HCM &ndash; c&aacute;c t\\u1ec9nh th&agrave;nh kh&aacute;c:<\\/span><\\/p>\\r\\n<p>\\u0110\\u1ec3 giao d\\u1ecbch nhanh ch&oacute;ng \\u0111\\u01b0\\u1ee3c th\\u1ef1c hi\\u1ec7n v&agrave; ti\\u1ec7n l\\u1ee3i cho c\\u1ea3 qu&yacute; kh&aacute;ch v&agrave; ch&uacute;ng t&ocirc;i,&nbsp; Qu&yacute; kh&aacute;ch vui l&ograve;ng thanh to&aacute;n tr\\u01b0\\u1edbc b\\u1eb1ng&nbsp;<strong><em>chuy\\u1ec3n kho\\u1ea3n qua ATM.<\\/em><\\/strong><\\/p>\\r\\n<p>Qu&yacute; kh&aacute;ch c&oacute; th\\u1ec3 \\u0111\\u1ebfn ng&acirc;n h&agrave;ng ho\\u1eb7c c&aacute;c m&aacute;y ATM c&ugrave;ng m\\u1ea1ng l\\u01b0\\u1edbi ng&acirc;n h&agrave;ng \\u0111\\u1ec3 chuy\\u1ec3n kho\\u1ea3n v&agrave;o m\\u1ed9t trong 2 t&agrave;i kho\\u1ea3n d\\u01b0\\u1edbi \\u0111&acirc;y c\\u1ee7a ch&uacute;ng t&ocirc;i:<\\/p>\\r\\n<p>&nbsp;T&agrave;i kho\\u1ea3n 1:&nbsp;&Aacute;p d\\u1ee5ng cho kh&aacute;ch h&agrave;ng l&agrave; Doanh Nghi\\u1ec7p, C&ocirc;ng Ty, T\\u1ed5 Ch\\u1ee9c v.v<\\/p>\\r\\n<div>\\r\\n<table border=\\"1\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"155\\" valign=\\"top\\">\\r\\n<p>T&ecirc;n Ng&acirc;n H&agrave;ng<\\/p>\\r\\n<\\/td>\\r\\n<td width=\\"288\\" valign=\\"top\\">Ng&acirc;n H&agrave;ng vietcombank (chi nh&aacute;nh T&acirc;n B&igrave;nh)<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td width=\\"155\\" valign=\\"top\\">\\r\\n<p>Ch\\u1ee7 T&agrave;i Kho\\u1ea3n<\\/p>\\r\\n<\\/td>\\r\\n<td width=\\"288\\" valign=\\"top\\">\\r\\n<p>CTY TNHH Th\\u1ebf Gi\\u1edbi K\\u1ef9 Thu\\u1eadt S\\u1ed1<\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td width=\\"155\\" valign=\\"top\\">\\r\\n<p>S\\u1ed1 T&agrave;i Kho\\u1ea3n<\\/p>\\r\\n<\\/td>\\r\\n<td width=\\"288\\" valign=\\"top\\">0441 000 615 086<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<\\/div>\\r\\n<p>&nbsp;T&agrave;i kho\\u1ea3n 2:&nbsp;&Aacute;p D\\u1ee5ng cho kh&aacute;ch h&agrave;ng l&agrave; C&aacute; nh&acirc;n<\\/p>\\r\\n<table border=\\"1\\" cellspacing=\\"0\\" cellpadding=\\"0\\" width=\\"476\\" height=\\"50\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"155\\" valign=\\"top\\">\\r\\n<p>T&ecirc;n Ng&acirc;n H&agrave;ng<\\/p>\\r\\n<\\/td>\\r\\n<td width=\\"288\\" valign=\\"top\\">\\r\\n<p>Ng&acirc;n H&agrave;ng \\u0110\\u1ea7u t\\u01b0 v&agrave; Ph&aacute;t Tri\\u1ec3n Vi\\u1ec7t Nam<\\/p>\\r\\n<p>(BIDV - chi nh&aacute;nh TP.HCM)<\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td width=\\"155\\" valign=\\"top\\">\\r\\n<p>Ch\\u1ee7 T&agrave;i Kho\\u1ea3n<\\/p>\\r\\n<\\/td>\\r\\n<td width=\\"288\\" valign=\\"top\\"><strong>H&agrave; Phong V\\u0169<\\/strong>&nbsp;<br \\/><\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td width=\\"155\\" valign=\\"top\\">\\r\\n<p>S\\u1ed1 T&agrave;i Kho\\u1ea3n<\\/p>\\r\\n<\\/td>\\r\\n<td width=\\"288\\" valign=\\"top\\">3101 0000 62 47 28<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p>&nbsp;T&agrave;i kho\\u1ea3n 3:&nbsp;&Aacute;p D\\u1ee5ng cho kh&aacute;ch h&agrave;ng l&agrave; C&aacute; nh&acirc;n.<\\/p>\\r\\n<table border=\\"1\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"155\\" valign=\\"top\\">\\r\\n<p>T&ecirc;n Ng&acirc;n H&agrave;ng<\\/p>\\r\\n<\\/td>\\r\\n<td width=\\"288\\" valign=\\"top\\">\\r\\n<p>Ng&acirc;n H&agrave;ng vietcombank(chi nh&aacute;nh V\\u0129nh l\\u1ed9c)<\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td width=\\"155\\" valign=\\"top\\">\\r\\n<p>Ch\\u1ee7 T&agrave;i Kho\\u1ea3n<\\/p>\\r\\n<\\/td>\\r\\n<td width=\\"288\\" valign=\\"top\\">\\r\\n<h3>T\\u0103ng V\\u0103n Lu&acirc;n<\\/h3>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td width=\\"155\\" valign=\\"top\\">\\r\\n<p>S\\u1ed1 T&agrave;i Kho\\u1ea3n<\\/p>\\r\\n<\\/td>\\r\\n<td width=\\"288\\" valign=\\"top\\">\\r\\n<p>0501.000.208.642<\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p>&nbsp;<span style=\\"text-decoration: underline;\\">L\\u01b0u &yacute;:<\\/span>&nbsp;Qu&yacute; kh&aacute;ch vui l&ograve;ng th&ocirc;ng b&aacute;o cho ch&uacute;ng t&ocirc;i tr\\u01b0\\u1edbc khi chuy\\u1ec3n kho\\u1ea3n \\u0111\\u1ec3 ch&uacute;ng t&ocirc;i ghi nh\\u1eadn v&agrave; theo d&otilde;i.<\\/p>\\r\\n<p>D\\u1ef1a v&agrave;o th&ocirc;ng tin tr&ecirc;n \\u0110\\u01a1n \\u0110\\u1eb7t H&agrave;ng, ch&uacute;ng t&ocirc;i s\\u1ebd &aacute;p d\\u1ee5ng m\\u1ed9t trong nh\\u1eefng h&igrave;nh th\\u1ee9c v\\u1eadn chuy\\u1ec3n tr&ecirc;n \\u0111\\u1ec3 chuy\\u1ec3n h&agrave;ng cho qu&yacute; kh&aacute;ch sau khi qu&yacute; kh&aacute;ch \\u0111&atilde; thanh to&aacute;n cho ch&uacute;ng t&ocirc;i.<\\/p>","introtext":"Khu v\\u1ef1c TP.HCM:&nbsp;qu&yacute; kh&aacute;ch c&oacute; th\\u1ec3 ch\\u1ecdn 1 trong 3 h&igrave;nh th\\u1ee9c sau:\\r\\n1-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Qu&yacute; kh&aacute;ch chuy\\u1ec3n kho\\u1ea3n tr\\u01b0\\u1edbc cho ch&uacute;ng t&ocirc;i \\u0111\\u1ec3 thanh to&aacute;n cho s\\u1ea3n ph\\u1ea9m m&agrave; qu&yacute; kh&aacute;ch \\u0111\\u1eb7t h&agrave;ng. Ti\\u1ebfp theo, ch&uacute;ng t&ocirc;i s\\u1ebd chuy\\u1ec3n h&agrave;ng \\u0111\\u1ebfn t\\u1eadn n\\u01a1i cho qu&yacute; kh&aacute;ch theo \\u0110\\u01a1n \\u0110\\u1eb7t h&agrave;ng.\\r\\n2-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ch&uacute;ng t&ocirc;i s\\u1ebd giao h&agrave;ng t\\u1eadn n\\u01a1i theo \\u0110\\u01a1n \\u0110\\u1eb7t H&agrave;ng c\\u1ee7a qu&yacute; kh&aacute;ch v&agrave; qu&yacute; kh&aacute;ch vui l&ograve;ng thanh to&aacute;n \\u0111\\u01a1n h&agrave;ng sau khi \\u0111&atilde; ki\\u1ec3m tra v&agrave; nh\\u1eadn h&agrave;ng.\\r\\n3-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Qu&yacute; kh&aacute;ch c&oacute; th\\u1ec3 \\u0111\\u1ebfn mua h&agrave;ng v&agrave; thanh to&aacute;n tr\\u1ef1c ti\\u1ebfp t\\u1ea1i v\\u0103n ph&ograve;ng giao d\\u1ecbch c\\u1ee7a CtyTh\\u1ebf Gi\\u1edbi K\\u1ef9 Thu\\u1eadt S\\u1ed1&nbsp;&nbsp;t\\u1ea1i:&nbsp;105 ...","modified":"{\\"1336710009\\":\\"1\\",\\"1336710011\\":\\"1\\"}"}', 1, 1336673437);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE IF NOT EXISTS `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `lang` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `child_id` int(11) DEFAULT NULL,
  `special` tinyint(4) DEFAULT NULL,
  `order_view` smallint(6) NOT NULL DEFAULT '1',
  `keywords` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=74 ;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `alias`, `lang`, `name`, `parent_id`, `child_id`, `special`, `order_view`, `keywords`, `other`, `created_by`, `created_date`) VALUES
(1, 'quan-ly-menu-trang-quan-tri', 0, 'Quản lý menu trang quản trị', 0, NULL, NULL, 1, '', '{"max_rank":"3","description":"Qu\\u1ea3n l\\u00fd menu trang qu\\u1ea3n tr\\u1ecb ","created_date":1332903011}', 1, 1336612722),
(2, 'quan-ly-menu-trang-hien-thi', 0, 'Quản lý menu trang hiển thị', 0, NULL, NULL, 2, '', '{"max_rank":"3","description":"Qu\\u1ea3n l\\u00fd menu trang hi\\u1ec3n th\\u1ecb","created_date":1332903057,"modified":"{\\"1332903474\\":\\"12\\"}"}', 1, 1336612722),
(3, 'quan-ly-danh-muc-tin-tuc', 0, 'Quản lý danh mục tin tức', 0, NULL, NULL, 3, '', '{"max_rank":"3","description":"Qu\\u1ea3n l\\u00fd danh m\\u1ee5c tin t\\u1ee9c","created_date":1332903214}', 1, 1336612722),
(31, 'he-thong', 0, 'Hệ thống', 1, NULL, NULL, 1, '', '{"controller":"config","action":"menu","params":"{\\"group\\":1}","description":"Qu\\u1ea3n tr\\u1ecb h\\u1ec7 th\\u1ed1ng","created_date":1332903517,"modified":"{\\"1336216659\\":\\"1\\",\\"1336613220\\":\\"1\\"}"}', 1, 1336612722),
(32, 'menu', 0, 'Menu', 31, NULL, NULL, 4, '', '{"controller":"config","action":"menu","params":"{\\"group\\":1}","description":"","created_date":1332903631,"modified":"{\\"1332903824\\":\\"12\\",\\"1333737009\\":\\"12\\",\\"1333737015\\":\\"12\\",\\"1336612491\\":\\"1\\",\\"1336612617\\":\\"1\\",\\"1336612804\\":\\"1\\"}"}', 1, 1336612722),
(6, 'don-dep', 0, 'Dọn dẹp', 31, NULL, NULL, 3, '', '{"controller":"config","action":"clear_image","description":"","params":"","created_date":1332903671,"modified":"{\\"1332903824\\":\\"12\\",\\"1336612491\\":\\"1\\",\\"1336612617\\":\\"1\\",\\"1336612797\\":\\"1\\"}"}', 1, 1336612722),
(7, 'anh-rac', 0, 'Ảnh rác', 6, NULL, NULL, 1, '', '{"controller":"config","action":"clear_image","description":"","params":"","created_date":1332903695,"modified":"{\\"1336612767\\":\\"1\\"}"}', 1, 1336612722),
(8, 'trang-quan-tri', 0, 'Trang quản trị', 32, NULL, NULL, 1, '', '{"controller":"config","action":"menu","params":"{\\"group\\":1}","description":"","created_date":1332903781,"modified":"{\\"1332903853\\":\\"12\\",\\"1333091541\\":\\"12\\",\\"1333091588\\":\\"12\\",\\"1336126815\\":\\"1\\",\\"1336126843\\":\\"1\\",\\"1336612776\\":\\"1\\"}"}', 1, 1336612722),
(9, 'trang-frontend', 0, 'Trang frontend', 32, NULL, NULL, 2, '', '{"controller":"config","action":"menu","params":"{\\"group\\":2}","description":"","created_date":1332903802,"modified":"{\\"1332903853\\":\\"12\\",\\"1333091551\\":\\"12\\",\\"1336126805\\":\\"1\\",\\"1336126815\\":\\"1\\",\\"1336126902\\":\\"1\\",\\"1336126931\\":\\"1\\",\\"1336612782\\":\\"1\\"}"}', 1, 1336612722),
(10, 'user', 0, 'User', 31, NULL, NULL, 5, '', '{"controller":"user","action":"index","description":"","params":"","created_date":1332903891,"modified":"{\\"1332904074\\":\\"12\\",\\"1336214993\\":\\"1\\",\\"1336215008\\":\\"1\\",\\"1336612491\\":\\"1\\",\\"1336612617\\":\\"1\\",\\"1336612827\\":\\"1\\"}"}', 1, 1336612722),
(11, 'danh-sach-22', 0, 'Danh sách', 10, NULL, NULL, 1, '', '{"controller":"user","action":"index","description":"","params":"","created_date":1332904104,"modified":"{\\"1336612833\\":\\"1\\"}"}', 1, 1336612722),
(12, 'tao-moi-20', 0, 'Tạo mới', 10, NULL, NULL, 2, '', '{"controller":"user","action":"create","description":"","params":"","created_date":1332904116,"modified":"{\\"1336612839\\":\\"1\\",\\"1336612868\\":\\"1\\"}"}', 1, 1336612722),
(13, 'bai-viet', 0, 'Bài viết', 1, NULL, NULL, 2, '', '{"controller":"news","action":"index","description":"","params":"","created_date":1332904144,"modified":"{\\"1336214993\\":\\"1\\",\\"1336216648\\":\\"1\\",\\"1336216659\\":\\"1\\",\\"1336613271\\":\\"1\\"}"}', 1, 1336612722),
(14, 'danh-sach-25', 0, 'Danh sách', 13, NULL, NULL, 1, '', '{"controller":"news","action":"index","description":"","params":"","created_date":1332904163,"modified":"{\\"1336612848\\":\\"1\\"}"}', 1, 1336612722),
(15, 'tao-moi-79', 0, 'Tạo mới', 13, NULL, NULL, 2, '', '{"controller":"news","action":"create","description":"","params":"","created_date":1332904178,"modified":"{\\"1336612858\\":\\"1\\"}"}', 1, 1336612722),
(16, 'danh-muc-tieng-viet', 0, 'Danh mục tiếng việt', 106, NULL, NULL, 1, '', '{"controller":"news","action":"manager_category_vi","description":"","params":"","created_date":1332904205,"modified":"{\\"1333704719\\":\\"12\\",\\"1333704803\\":\\"12\\",\\"1333704808\\":\\"12\\",\\"1333704871\\":\\"12\\"}"}', 1, 1336612722),
(17, 'lien-he--hoi-dap-', 0, 'Liên hệ & hỏi đáp ', 1, NULL, NULL, 5, '', '{"controller":"qa","action":"index","description":"","params":"","created_date":1332904285,"modified":"{\\"1336214993\\":\\"1\\",\\"1336216648\\":\\"1\\",\\"1336216672\\":\\"1\\",\\"1336613323\\":\\"1\\"}"}', 1, 1336612722),
(18, 'hoi-dap', 0, 'Hỏi đáp', 17, NULL, NULL, 1, '', '{"controller":"qa","action":"index","description":"","params":"","created_date":1332904297,"modified":"{\\"1336612919\\":\\"1\\"}"}', 1, 1336612722),
(19, 'lien-he', 0, 'Liên hệ', 17, NULL, NULL, 2, '', '{"controller":"contact","action":"index","description":"","params":"","created_date":1332904320,"modified":"{\\"1332904326\\":\\"12\\",\\"1332904388\\":\\"12\\",\\"1332904402\\":\\"12\\",\\"1336612927\\":\\"1\\"}"}', 1, 1336612722),
(20, 'xuat-du-lieu-ra-file-excel', 0, 'Xuất dữ liệu ra file excel', 46, NULL, NULL, 5, '', '{"controller":"language","action":"export","description":"","params":""}', 1, 1336612722),
(21, 'bo-suu-tap', 0, 'Bộ sưu tập', 1, NULL, NULL, 6, '', '{"controller":"album","action":"index","description":"","params":"","created_date":1332904460,"modified":"{\\"1336214993\\":\\"1\\",\\"1336216648\\":\\"1\\",\\"1336216672\\":\\"1\\",\\"1336613333\\":\\"1\\"}"}', 1, 1336612722),
(22, 'album', 0, 'Album', 21, NULL, NULL, 1, '', '{"controller":"album","action":"index","description":"","params":"","created_date":1332904475,"modified":"{\\"1336613340\\":\\"1\\"}"}', 1, 1336612722),
(23, 'danh-sach-59', 0, 'Danh sách', 22, NULL, NULL, 1, '', '{"controller":"album","action":"index","description":"","params":"","created_date":1332904513,"modified":"{\\"1336613347\\":\\"1\\"}"}', 1, 1336612722),
(24, 'tao-moi-27', 0, 'Tạo mới', 22, NULL, NULL, 2, '', '{"controller":"album","action":"create","description":"","params":"","created_date":1332904530,"modified":"{\\"1336613354\\":\\"1\\",\\"1336613385\\":\\"1\\"}"}', 1, 1336612722),
(25, 'video', 0, 'Video', 21, NULL, NULL, 2, '', '{"controller":"galleryVideo","action":"index","description":"","params":"","created_date":1332904546,"modified":"{\\"1336613363\\":\\"1\\"}"}', 1, 1336612722),
(26, 'danh-sach-22-28', 0, 'Danh sách', 25, NULL, NULL, 1, '', '{"controller":"galleryVideo","action":"index","description":"","params":"","created_date":1332904563,"modified":"{\\"1336613369\\":\\"1\\"}"}', 1, 1336612722),
(27, 'tao-moi-17', 0, 'Tạo mới', 25, NULL, NULL, 2, '', '{"controller":"galleryVideo","action":"create","description":"","params":"","created_date":1332904579,"modified":"{\\"1336613377\\":\\"1\\"}"}', 1, 1336612722),
(28, 'banner-quang-cao', 0, 'Banner quảng cáo', 31, NULL, NULL, 4, '', '{"controller":"banner","action":"index","description":"","params":"","created_date":1332904617,"modified":"{\\"1332904651\\":\\"12\\",\\"1332904653\\":\\"12\\",\\"1336214593\\":\\"1\\",\\"1336214964\\":\\"1\\",\\"1336215008\\":\\"1\\",\\"1336612491\\":\\"1\\",\\"1336612617\\":\\"1\\",\\"1336612813\\":\\"1\\"}"}', 1, 1336612722),
(29, 'danh-sach-8', 0, 'Danh sách', 28, NULL, NULL, 1, '', '{"controller":"banner","action":"index","description":"","params":"","created_date":1332904703,"modified":"{\\"1332904711\\":\\"12\\",\\"1336612820\\":\\"1\\"}"}', 1, 1336612722),
(30, 'gioi-thieu', 0, 'Giới thiệu', 3, NULL, 1, 6, '', '{"description":"","created_date":1332904975,"modified":"{\\"1332905230\\":\\"12\\",\\"1333536138\\":\\"12\\",\\"1333702687\\":\\"12\\",\\"1333702700\\":\\"12\\",\\"1333703294\\":\\"12\\",\\"1333954957\\":\\"12\\",\\"1333954961\\":\\"12\\",\\"1333956924\\":\\"12\\",\\"1334141359\\":\\"12\\",\\"1334141396\\":\\"12\\",\\"1334141416\\":\\"12\\",\\"1334141430\\":\\"12\\",\\"1334141448\\":\\"12\\"}"}', 1, 1336612722),
(4, 'quan-ly-danh-muc-san-pham', 0, 'Quản lý danh mục sản phẩm', 0, NULL, NULL, 4, '', '{"max_rank":"3","description":"","created_date":1332998910}', 1, 1336612722),
(5, 'quan-ly-danh-muc-nha-san-xuat', 0, 'Quản lý danh mục nhà sản xuất', 0, NULL, NULL, 5, '', '{"max_rank":"2","description":"","created_date":1332998922}', 1, 1336612722),
(34, 'menu-trang-quan-tri-9', 0, 'Menu trang quản trị', 33, NULL, NULL, 1, '', '{"controller":"config","action":"menu","params":"{\\"group\\":1}","description":"","created_date":1336214722}', 1, 1336612722),
(35, 'menu-trang-frontend-21', 0, 'Menu trang frontend', 33, NULL, NULL, 2, '', '{"controller":"config","action":"menu","params":"{\\"group\\":2}","description":"","created_date":1336214747}', 1, 1336612722),
(37, 'san-pham', 0, 'Sản phẩm', 1, NULL, NULL, 3, '', '{"controller":"product","action":"index","description":"","params":"","created_date":1336216438,"modified":"{\\"1336216648\\":\\"1\\",\\"1336216659\\":\\"1\\",\\"1336613278\\":\\"1\\"}"}', 1, 1336612722),
(38, 'danh-sach-84', 0, 'Danh sách', 37, NULL, NULL, 1, '', '{"controller":"product","action":"index","description":"","params":"","created_date":1336216465,"modified":"{\\"1336612876\\":\\"1\\"}"}', 1, 1336612722),
(39, 'tao-moi-26', 0, 'Tạo mới', 37, NULL, NULL, 2, '', '{"controller":"product","action":"create","description":"","params":"","created_date":1336216497,"modified":"{\\"1336612891\\":\\"1\\"}"}', 1, 1336612722),
(40, 'danh-muc', 0, 'Danh mục', 37, NULL, NULL, 3, '', '{"controller":"product","action":"manager_category","description":"","params":"","created_date":1336216544,"modified":"{\\"1336612898\\":\\"1\\"}"}', 1, 1336612722),
(41, 'nha-san-xuat', 0, 'Nhà sản xuất', 37, NULL, NULL, 4, '', '{"controller":"manufacturer","action":"manager_category","description":"","params":"","created_date":1336216598,"modified":"{\\"1336612905\\":\\"1\\"}"}', 1, 1336612722),
(42, 'don-hang', 0, 'Đơn hàng', 1, NULL, NULL, 4, '', '{"controller":"order","action":"index","description":"","params":"","created_date":1336216631,"modified":"{\\"1336216648\\":\\"1\\",\\"1336216672\\":\\"1\\",\\"1336216675\\":\\"1\\",\\"1336613288\\":\\"1\\",\\"1336613304\\":\\"1\\"}"}', 1, 1336612722),
(43, 'tham-so-cau-hinh', 0, 'Tham số cấu hình', 31, NULL, NULL, 1, '', '{"controller":"setting","action":"index","description":"","params":"","modified":"{\\"1336612491\\":\\"1\\",\\"1336613260\\":\\"1\\",\\"1336617172\\":\\"1\\"}"}', 1, 1336612722),
(44, 'danh-sach', 0, 'Danh sách', 43, NULL, NULL, 1, '', '{"controller":"setting","action":"index","description":"","params":"","modified":"{\\"1336612734\\":\\"1\\"}"}', 1, 1336612722),
(45, 'them-moi', 0, 'Thêm mới', 43, NULL, NULL, 2, '', '{"controller":"setting","action":"create","description":"","params":"","modified":"{\\"1336612742\\":\\"1\\"}"}', 1, 1336612722),
(46, 'ngon-ngu', 0, 'Ngôn ngữ', 31, NULL, NULL, 2, '', '{"controller":"language","action":"edit","description":"","params":"","modified":"{\\"1336612617\\":\\"1\\"}"}', 1, 1336612722),
(47, 'chinh-sua', 0, 'Chỉnh sửa', 46, NULL, NULL, 1, '', '{"controller":"language","action":"edit","description":"","params":"","modified":"{\\"1336612748\\":\\"1\\"}"}', 1, 1336612722),
(48, 'tao-moi', 0, 'Tạo mới', 46, NULL, NULL, 2, '', '{"controller":"language","action":"create","description":"","params":""}', 1, 1336612722),
(49, 'xoa', 0, 'Xóa', 46, NULL, NULL, 3, '', '{"controller":"language","action":"delete","description":"","params":""}', 1, 1336612722),
(50, 'nhap-du-lieu-tu-file-excel', 0, 'Nhập dữ liệu từ file excel', 46, NULL, NULL, 4, '', '{"controller":"language","action":"import","description":"","params":""}', 1, 1336612722),
(52, 'trang-chu', 0, 'Trang chủ', 2, NULL, NULL, 1, '', '{"controller":"product","action":"present","description":"","params":""}', 1, 1336650918),
(53, 'gioi-thieu-23', 0, 'Giới thiệu', 2, NULL, NULL, 2, '', '{"controller":"news","action":"present","description":"","params":"","modified":"{\\"1336672845\\":\\"1\\",\\"1336672901\\":\\"1\\",\\"1336672905\\":\\"1\\"}"}', 1, 1336651409),
(54, 'tin-tuc', 0, 'Tin tức', 2, NULL, NULL, 3, '', '{"controller":"news","action":"view_category","params":"{\\"cat_alias\\":\\"gioi-thieu\\"}","description":""}', 1, 1336651433),
(55, 'san-pham-99', 0, 'Sản phẩm', 2, NULL, NULL, 4, '', '{"controller":"product","action":"index","description":"","params":"","modified":"{\\"1336672988\\":\\"1\\",\\"1336672993\\":\\"1\\"}"}', 1, 1336651458),
(56, 'lien-he-23', 0, 'Liên hệ', 2, NULL, NULL, 6, '', '{"controller":"contact","action":"view_contact","description":"","params":"","modified":"{\\"1336672988\\":\\"1\\",\\"1336672993\\":\\"1\\"}"}', 1, 1336651489),
(57, 'hoi-dap-61', 0, 'Hỏi đáp', 2, NULL, NULL, 7, '', '{"controller":"qa","action":"view_qa","description":"","params":"","modified":"{\\"1336672988\\":\\"1\\",\\"1336672993\\":\\"1\\"}"}', 1, 1336651499),
(58, 'danh-muc-92', 0, 'Danh mục', 13, NULL, NULL, 3, '', '{"controller":"news","action":"manager_category","description":"","params":""}', 1, 1336671680),
(59, 'huong-dan', 0, 'Hướng dẫn', 3, NULL, 1, 2, '', '{"description":""}', 1, 1336671721),
(60, 'huong-dan-1', 0, 'Hướng dẫn', 2, NULL, NULL, 5, '', '{"controller":"news","action":"guide","description":"","params":"","modified":"{\\"1336672988\\":\\"1\\",\\"1336672993\\":\\"1\\"}"}', 1, 1336672893),
(61, 'ban-an', 0, 'Bàn ăn', 4, NULL, 1, 2, '', '{"description":"","modified":"{\\"1336698270\\":\\"1\\",\\"1336698279\\":\\"1\\",\\"1336698294\\":\\"1\\",\\"1336698679\\":\\"1\\",\\"1336698760\\":\\"1\\",\\"1336698971\\":\\"1\\",\\"1336699318\\":\\"1\\"}"}', 1, 1336674427),
(62, 'tu-bay-phong-khach', 0, 'Tủ bày phòng khách', 4, NULL, 1, 1, '', '{"description":"","modified":"{\\"1336674504\\":\\"1\\",\\"1336698545\\":\\"1\\",\\"1336698684\\":\\"1\\",\\"1336698988\\":\\"1\\",\\"1336699082\\":\\"1\\",\\"1336699318\\":\\"1\\"}"}', 1, 1336674438),
(63, 'ban-ghe-phong-khach', 0, 'Bàn ghế phòng khách', 4, NULL, 1, 3, '', '{"description":"","modified":"{\\"1336674509\\":\\"1\\",\\"1336698705\\":\\"1\\",\\"1336699008\\":\\"1\\",\\"1336699318\\":\\"1\\"}"}', 1, 1336674447),
(64, 'ke-bay', 0, 'Kệ bày', 4, NULL, 1, 4, '', '{"description":"","modified":"{\\"1336698708\\":\\"1\\",\\"1336699011\\":\\"1\\",\\"1336699319\\":\\"1\\"}"}', 1, 1336674453),
(65, 'tu-ruou', 0, 'Tủ rượu', 4, NULL, 1, 5, '', '{"description":"","modified":"{\\"1336698711\\":\\"1\\",\\"1336699014\\":\\"1\\",\\"1336699319\\":\\"1\\"}"}', 1, 1336674464),
(66, 'giuong-ngu', 0, 'Giường ngủ', 4, NULL, 1, 6, '', '{"description":"","modified":"{\\"1336698714\\":\\"1\\",\\"1336699019\\":\\"1\\",\\"1336699319\\":\\"1\\"}"}', 1, 1336674470),
(67, 'tu-quan-ao', 0, 'Tủ quần áo', 4, NULL, 1, 7, '', '{"description":"","modified":"{\\"1336698716\\":\\"1\\",\\"1336699022\\":\\"1\\",\\"1336699319\\":\\"1\\"}"}', 1, 1336674477),
(68, 'tu-ngan-keo', 0, 'Tủ ngăn kéo', 4, NULL, 1, 8, '', '{"description":"","modified":"{\\"1336698719\\":\\"1\\",\\"1336699025\\":\\"1\\",\\"1336699319\\":\\"1\\"}"}', 1, 1336674483),
(69, 'tu-dung', 0, 'Tủ đứng', 62, NULL, 1, 1, '', '{"description":"","modified":"{\\"1336698688\\":\\"1\\",\\"1336698991\\":\\"1\\"}"}', 1, 1336674498),
(70, 'tu-nam', 0, 'Tủ nằm', 62, NULL, 1, 2, '', '{"description":"","modified":"{\\"1336698692\\":\\"1\\",\\"1336698995\\":\\"1\\"}"}', 1, 1336674522),
(71, 'tu-3-buong', 0, 'Tủ 3 buồng', 62, NULL, 1, 3, '', '{"description":"","modified":"{\\"1336698695\\":\\"1\\",\\"1336698697\\":\\"1\\",\\"1336698999\\":\\"1\\"}"}', 1, 1336674537),
(72, 'tu-2-buong', 0, 'Tủ 2 buồng', 62, NULL, 1, 4, '', '{"description":"","modified":"{\\"1336698701\\":\\"1\\",\\"1336699003\\":\\"1\\"}"}', 1, 1336674549),
(73, 'cong-ty-co-phan-thuong-mai-va-xay-dung-do-noi-that-go', 0, 'CÔNG TY CỔ PHẦN THƯƠNG MẠI VÀ XÂY DỰNG ĐỒ NỘI THẤT GỖ', 5, NULL, NULL, 1, '', '{"description":"","modified":"{\\"1336674671\\":\\"1\\"}"}', 1, 1336674663);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_image`
--

CREATE TABLE IF NOT EXISTS `tbl_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `title` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `parent_attribute` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(4) NOT NULL DEFAULT '0',
  `src` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `tbl_image`
--

INSERT INTO `tbl_image` (`id`, `status`, `title`, `url`, `category`, `parent_attribute`, `parent_id`, `src`, `filename`, `extension`, `other`, `created_by`, `created_date`) VALUES
(1, 1, NULL, NULL, 'Banner', 'images', 0, 'upload/2012/05/11', 'ad1', 'jpg', 'null', 1, 1336669262),
(11, 1, NULL, NULL, 'Banner', 'images', 3, 'upload/2012/05/11', 'Lighthouse-69', 'jpg', '[]', 1, 1336671430),
(3, 1, NULL, NULL, 'Banner', 'images', 2, 'upload/2012/05/11', 'Koala', 'jpg', '[]', 1, 1336669683),
(10, 1, NULL, NULL, 'Banner', 'images', 3, 'upload/2012/05/11', 'Koala-69', 'jpg', '[]', 1, 1336671429),
(6, 1, NULL, NULL, 'Banner', 'images', 3, 'upload/2012/05/11', 'slider4', 'jpg', '[]', 1, 1336670376),
(7, 1, NULL, NULL, 'Banner', 'images', 3, 'upload/2012/05/11', 'slider3', 'jpg', '[]', 1, 1336670376),
(8, 1, NULL, NULL, 'Banner', 'images', 3, 'upload/2012/05/11', 'Tulips', 'jpg', '[]', 1, 1336670657),
(9, 1, NULL, NULL, 'Banner', 'images', 3, 'upload/2012/05/11', 'Lighthouse', 'jpg', '[]', 1, 1336670662),
(12, 1, NULL, NULL, 'Banner', 'images', 3, 'upload/2012/05/11', 'Penguins', 'jpg', '[]', 1, 1336671430),
(13, 1, NULL, NULL, 'Product', 'introimage', 0, 'upload/2012/05/11', 'image1', 'jpg', 'null', 1, 1336674157),
(14, 1, NULL, NULL, 'Product', 'otherimage', 0, 'upload/2012/05/11', 'image2', 'jpg', 'null', 1, 1336674185),
(15, 1, NULL, NULL, 'Product', 'introimage', 1, 'upload/2012/05/11', 'image1-18', 'jpg', '[]', 1, 1336674705),
(16, 1, NULL, NULL, 'Product', 'otherimage', 0, 'upload/2012/05/11', 'image2-34', 'jpg', 'null', 1, 1336674708),
(17, 1, NULL, NULL, 'Product', 'introimage', 2, 'upload/2012/05/11', 'image2-95', 'jpg', '[]', 1, 1336674836),
(18, 1, NULL, NULL, 'Product', 'otherimage', 0, 'upload/2012/05/11', 'view1', 'jpg', 'null', 1, 1336674842),
(19, 1, NULL, NULL, 'Product', 'otherimage', 0, 'upload/2012/05/11', 'view2', 'jpg', 'null', 1, 1336674842),
(20, 1, NULL, NULL, 'Product', 'introimage', 3, 'upload/2012/05/11', 'view4', 'jpg', '[]', 1, 1336674882),
(21, 1, NULL, NULL, 'Product', 'otherimage', 0, 'upload/2012/05/11', 'view1-96', 'jpg', 'null', 1, 1336674889),
(22, 1, NULL, NULL, 'Product', 'otherimage', 0, 'upload/2012/05/11', 'view3', 'jpg', 'null', 1, 1336674889),
(23, 1, NULL, NULL, 'News', 'introimage', 5, 'upload/2012/05/11', 'image4', 'jpg', '[]', 1, 1336710009),
(24, 1, NULL, NULL, 'News', 'introimage', 4, 'upload/2012/05/11', 'inside', 'jpg', '[]', 1, 1336710023);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_language`
--

CREATE TABLE IF NOT EXISTS `tbl_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(5) CHARACTER SET utf8 NOT NULL,
  `origin` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `translation` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `module` varchar(32) CHARACTER SET utf8 NOT NULL,
  `controller` varchar(32) CHARACTER SET utf8 NOT NULL,
  `action` varchar(32) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=193 ;

--
-- Dumping data for table `tbl_language`
--

INSERT INTO `tbl_language` (`id`, `lang`, `origin`, `translation`, `module`, `controller`, `action`) VALUES
(1, 'vi', 'IHB Việt Nam', '', '', 'site', 'home'),
(2, 'vi', 'Đồ gỗ, IHB Việt Nam', '', '', 'site', 'home'),
(3, 'vi', 'Đồ gỗ nội thất', '', '', 'site', 'home'),
(4, 'vi', 'Liên hệ qua Email', '', '', 'site', 'home'),
(5, 'vi', 'Ngôn ngữ', '', '', 'site', 'home'),
(6, 'vi', 'Hotline', '', '', 'site', 'home'),
(7, 'vi', 'Giỏ hàng', '', '', 'site', 'home'),
(8, 'vi', 'Trang chủ', '', '', 'site', 'home'),
(9, 'vi', 'Giới thiệu', '', '', 'site', 'home'),
(10, 'vi', 'Tin tức', '', '', 'site', 'home'),
(11, 'vi', 'Sản phẩm', '', '', 'site', 'home'),
(12, 'vi', 'Liên hệ', '', '', 'site', 'home'),
(13, 'vi', 'Hỏi đáp', '', '', 'site', 'home'),
(14, 'vi', 'Video', '', '', 'site', 'home'),
(15, 'vi', 'Hướng dẫn', '', '', 'site', 'home'),
(16, 'vi', 'Hướng dẫn mua hàng', '', '', 'site', 'home'),
(17, 'vi', 'Cách giao dịch thanh toán', '', '', 'site', 'home'),
(18, 'vi', 'CÔNG TY CỔ PHẦN THƯƠNG MẠI VÀ XÂY DỰNG ĐỒ NỘI THẤT GỖ', '', '', 'site', 'home'),
(19, 'vi', 'Showroom', '', '', 'site', 'home'),
(20, 'vi', '43 - Ngõ Văn Chương - Khâm Thiên - Hà Nội', '', '', 'site', 'home'),
(21, 'vi', 'Tel/Fax', '', '', 'site', 'home'),
(22, 'vi', '04.35565 863', '', '', 'site', 'home'),
(23, 'vi', 'Mobile', '', '', 'site', 'home'),
(24, 'vi', '0943 903 069', '', '', 'site', 'home'),
(25, 'vi', 'Email', '', '', 'site', 'home'),
(26, 'vi', 'contact@donoithatgo.vn', '', '', 'site', 'home'),
(27, 'vi', 'Design by IHB Việt Nam', '', '', 'site', 'home'),
(28, 'vi', 'quản trị tin tức', '', 'admin', 'news', 'index'),
(29, 'vi', 'Danh sách tin tức', '', 'admin', 'news', 'index'),
(30, 'vi', 'Thêm tin', '', 'admin', 'news', 'index'),
(31, 'vi', 'Tìm kiếm', '', 'admin', 'news', 'index'),
(32, 'vi', 'Lọc kết quả', '', 'admin', 'news', 'index'),
(33, 'vi', 'Tất cả các thư mục', '', 'admin', 'news', 'index'),
(34, 'vi', 'Không lọc', '', 'admin', 'news', 'index'),
(35, 'vi', 'Trạng thái', '', 'admin', 'news', 'index'),
(36, 'vi', 'Đổi trạng thái bài viết', '', 'admin', 'news', 'index'),
(37, 'vi', 'Công cụ', '', 'admin', 'news', 'index'),
(38, 'vi', 'Bạn muốn xóa bài viết này?', '', 'admin', 'news', 'index'),
(39, 'vi', 'Bạn đã xóa thành công', '', 'admin', 'news', 'index'),
(40, 'vi', 'Chỉnh sửa bài viết', '', 'admin', 'news', 'index'),
(41, 'vi', 'Xóa bài viết', '', 'admin', 'news', 'index'),
(42, 'vi', 'Copy bài viết', '', 'admin', 'news', 'index'),
(43, 'vi', 'Có', '', 'admin', 'news', 'index'),
(44, 'vi', 'tin', '', 'admin', 'news', 'index'),
(45, 'vi', 'Trước', '', 'admin', 'news', 'index'),
(46, 'vi', 'Sau', '', 'admin', 'news', 'index'),
(47, 'vi', 'Xóa', '', 'admin', 'news', 'index'),
(48, 'vi', 'Copy', '', 'admin', 'news', 'index'),
(49, 'vi', 'LiÃªn há»‡ qua Email', '', '', 'site', 'home'),
(50, 'vi', 'NgÃ´n ngá»¯', '', '', 'site', 'home'),
(51, 'vi', 'Giá»� hÃ ng', '', '', 'site', 'home'),
(52, 'vi', 'HÆ°á»›ng dáº«n', '', '', 'site', 'home'),
(53, 'vi', 'HÆ°á»›ng dáº«n mua hÃ ng', '', '', 'site', 'home'),
(54, 'vi', 'CÃ¡ch giao dá»‹ch thanh toÃ¡n', '', '', 'site', 'home'),
(55, 'vi', 'Phương thức thanh toán', '', '', 'site', 'home'),
(56, 'vi', 'Bàn ăn', '', '', 'site', 'home'),
(57, 'vi', 'Tủ bày phòng khách', '', '', 'site', 'home'),
(58, 'vi', 'Tủ đứng', '', '', 'site', 'home'),
(59, 'vi', 'Tủ nằm', '', '', 'site', 'home'),
(60, 'vi', 'Tủ 3 buồng', '', '', 'site', 'home'),
(61, 'vi', 'Tủ 2 buồng', '', '', 'site', 'home'),
(62, 'vi', 'Bàn ghế phòng khách', '', '', 'site', 'home'),
(63, 'vi', 'Kệ bày', '', '', 'site', 'home'),
(64, 'vi', 'Tủ rượu', '', '', 'site', 'home'),
(65, 'vi', 'Giường ngủ', '', '', 'site', 'home'),
(66, 'vi', 'Tủ quần áo', '', '', 'site', 'home'),
(67, 'vi', 'Tủ ngăn kéo', '', '', 'site', 'home'),
(68, 'vi', 'Danh mục sản phẩm', '', '', 'site', 'home'),
(69, 'vi', 'quản trị các tham số cấu hình', '', 'admin', 'setting', 'create'),
(70, 'vi', 'Thêm tham số cấu hình', '', 'admin', 'setting', 'create'),
(71, 'vi', 'Danh sách tham số cấu hình', '', 'admin', 'setting', 'create'),
(72, 'vi', 'Tên tham số', '', 'admin', 'setting', 'create'),
(73, 'vi', 'Giá trị', '', 'admin', 'setting', 'create'),
(74, 'vi', 'Hủy thao tác', '', 'admin', 'setting', 'create'),
(75, 'vi', 'Tạo', '', 'admin', 'setting', 'create'),
(76, 'vi', 'quản trị các tham số cấu hình', '', 'admin', 'setting', 'update'),
(77, 'vi', 'Chỉnh sửa các tham số cấu hình', '', 'admin', 'setting', 'update'),
(78, 'vi', 'Thêm tham số cấu hình', '', 'admin', 'setting', 'update'),
(79, 'vi', 'Danh sách tham số cấu hình', '', 'admin', 'setting', 'update'),
(80, 'vi', 'Tên tham số', '', 'admin', 'setting', 'update'),
(81, 'vi', 'Giá trị', '', 'admin', 'setting', 'update'),
(82, 'vi', 'Hủy thao tác', '', 'admin', 'setting', 'update'),
(83, 'vi', 'Cập nhật', '', 'admin', 'setting', 'update'),
(84, 'vi', 'quản trị các tham số cấu hình', '', 'admin', 'setting', 'index'),
(85, 'vi', 'Danh sách các tham số cấu hình', '', 'admin', 'setting', 'index'),
(86, 'vi', 'Tạo tham số', '', 'admin', 'setting', 'index'),
(87, 'vi', 'Tìm kiếm', '', 'admin', 'setting', 'index'),
(88, 'vi', 'Tên tham số', '', 'admin', 'setting', 'index'),
(89, 'vi', 'Giá trị', '', 'admin', 'setting', 'index'),
(90, 'vi', 'Lọc kết quả', '', 'admin', 'setting', 'index'),
(91, 'vi', 'Công cụ', '', 'admin', 'setting', 'index'),
(92, 'vi', 'Bạn muốn xóa bài viết này?', '', 'admin', 'setting', 'index'),
(93, 'vi', 'Bạn đã xóa thành công', '', 'admin', 'setting', 'index'),
(94, 'vi', 'Chỉnh sửa bài viết', '', 'admin', 'setting', 'index'),
(95, 'vi', 'Xóa bài viết', '', 'admin', 'setting', 'index'),
(96, 'vi', 'Copy bài viết', '', 'admin', 'setting', 'index'),
(97, 'vi', 'Có tổng cộng', '', 'admin', 'setting', 'index'),
(98, 'vi', 'tin', '', 'admin', 'setting', 'index'),
(99, 'vi', 'Trước', '', 'admin', 'setting', 'index'),
(100, 'vi', 'Sau', '', 'admin', 'setting', 'index'),
(101, 'vi', 'Xóa', '', 'admin', 'setting', 'index'),
(102, 'vi', 'Sản phẩm nổi bật', '', '', 'site', 'home'),
(103, 'vi', 'IHB Việt Nam', '', '', 'site', 'search'),
(104, 'vi', 'Đồ gỗ, IHB Việt Nam', '', '', 'site', 'search'),
(105, 'vi', 'Đồ gỗ nội thất', '', '', 'site', 'search'),
(106, 'vi', 'Liên hệ qua Email', '', '', 'site', 'search'),
(107, 'vi', 'Ngôn ngữ', '', '', 'site', 'search'),
(108, 'vi', 'Hotline', '', '', 'site', 'search'),
(109, 'vi', 'Giỏ hàng', '', '', 'site', 'search'),
(110, 'vi', 'Trang chủ', '', '', 'site', 'search'),
(111, 'vi', 'Giới thiệu', '', '', 'site', 'search'),
(112, 'vi', 'Tin tức', '', '', 'site', 'search'),
(113, 'vi', 'Sản phẩm', '', '', 'site', 'search'),
(114, 'vi', 'Hướng dẫn', '', '', 'site', 'search'),
(115, 'vi', 'Liên hệ', '', '', 'site', 'search'),
(116, 'vi', 'Hỏi đáp', '', '', 'site', 'search'),
(117, 'vi', 'Video', '', '', 'site', 'search'),
(118, 'vi', 'Hướng dẫn mua hàng', '', '', 'site', 'search'),
(119, 'vi', 'Phương thức thanh toán', '', '', 'site', 'search'),
(120, 'vi', 'Danh mục sản phẩm', '', '', 'site', 'search'),
(121, 'vi', 'Tủ bày phòng khách', '', '', 'site', 'search'),
(122, 'vi', 'Tủ đứng', '', '', 'site', 'search'),
(123, 'vi', 'Tủ nằm', '', '', 'site', 'search'),
(124, 'vi', 'Tủ 3 buồng', '', '', 'site', 'search'),
(125, 'vi', 'Tủ 2 buồng', '', '', 'site', 'search'),
(126, 'vi', 'Bàn ăn', '', '', 'site', 'search'),
(127, 'vi', 'Bàn ghế phòng khách', '', '', 'site', 'search'),
(128, 'vi', 'Kệ bày', '', '', 'site', 'search'),
(129, 'vi', 'Tủ rượu', '', '', 'site', 'search'),
(130, 'vi', 'Giường ngủ', '', '', 'site', 'search'),
(131, 'vi', 'Tủ quần áo', '', '', 'site', 'search'),
(132, 'vi', 'Tủ ngăn kéo', '', '', 'site', 'search'),
(133, 'vi', 'Sản phẩm nổi bật', '', '', 'site', 'search'),
(134, 'vi', 'CÔNG TY CỔ PHẦN THƯƠNG MẠI VÀ XÂY DỰNG ĐỒ NỘI THẤT GỖ', '', '', 'site', 'search'),
(135, 'vi', 'Showroom', '', '', 'site', 'search'),
(136, 'vi', '43 - Ngõ Văn Chương - Khâm Thiên - Hà Nội', '', '', 'site', 'search'),
(137, 'vi', 'Tel/Fax', '', '', 'site', 'search'),
(138, 'vi', '04.35565 863', '', '', 'site', 'search'),
(139, 'vi', 'Mobile', '', '', 'site', 'search'),
(140, 'vi', '0943 903 069', '', '', 'site', 'search'),
(141, 'vi', 'Email', '', '', 'site', 'search'),
(142, 'vi', 'contact@donoithatgo.vn', '', '', 'site', 'search'),
(143, 'vi', 'Design by IHB Việt Nam', '', '', 'site', 'search'),
(144, 'vi', 'Giá', '', '', 'site', 'search'),
(145, 'vi', 'Sản phẩm mới', '', '', 'site', 'home'),
(146, 'vi', 'Giá', '', '', 'site', 'home'),
(147, 'vi', 'Tin tứ mới', '', '', 'site', 'home'),
(148, 'vi', 'Chi tiết', '', '', 'site', 'home'),
(149, 'vi', 'Tin tức mới', '', '', 'site', 'home'),
(150, 'vi', 'Giá', '', '', 'site', 'product'),
(151, 'vi', 'IHB Việt Nam', '', '', 'site', 'product'),
(152, 'vi', 'Đồ gỗ, IHB Việt Nam', '', '', 'site', 'product'),
(153, 'vi', 'Đồ gỗ nội thất', '', '', 'site', 'product'),
(154, 'vi', 'Liên hệ qua Email', '', '', 'site', 'product'),
(155, 'vi', 'Ngôn ngữ', '', '', 'site', 'product'),
(156, 'vi', 'Hotline', '', '', 'site', 'product'),
(157, 'vi', 'Giỏ hàng', '', '', 'site', 'product'),
(158, 'vi', 'Trang chủ', '', '', 'site', 'product'),
(159, 'vi', 'Giới thiệu', '', '', 'site', 'product'),
(160, 'vi', 'Tin tức', '', '', 'site', 'product'),
(161, 'vi', 'Sản phẩm', '', '', 'site', 'product'),
(162, 'vi', 'Hướng dẫn', '', '', 'site', 'product'),
(163, 'vi', 'Liên hệ', '', '', 'site', 'product'),
(164, 'vi', 'Hỏi đáp', '', '', 'site', 'product'),
(165, 'vi', 'Video', '', '', 'site', 'product'),
(166, 'vi', 'Hướng dẫn mua hàng', '', '', 'site', 'product'),
(167, 'vi', 'Phương thức thanh toán', '', '', 'site', 'product'),
(168, 'vi', 'Danh mục sản phẩm', '', '', 'site', 'product'),
(169, 'vi', 'Tủ bày phòng khách', '', '', 'site', 'product'),
(170, 'vi', 'Tủ đứng', '', '', 'site', 'product'),
(171, 'vi', 'Tủ nằm', '', '', 'site', 'product'),
(172, 'vi', 'Tủ 3 buồng', '', '', 'site', 'product'),
(173, 'vi', 'Tủ 2 buồng', '', '', 'site', 'product'),
(174, 'vi', 'Bàn ăn', '', '', 'site', 'product'),
(175, 'vi', 'Bàn ghế phòng khách', '', '', 'site', 'product'),
(176, 'vi', 'Kệ bày', '', '', 'site', 'product'),
(177, 'vi', 'Tủ rượu', '', '', 'site', 'product'),
(178, 'vi', 'Giường ngủ', '', '', 'site', 'product'),
(179, 'vi', 'Tủ quần áo', '', '', 'site', 'product'),
(180, 'vi', 'Tủ ngăn kéo', '', '', 'site', 'product'),
(181, 'vi', 'Sản phẩm nổi bật', '', '', 'site', 'product'),
(182, 'vi', 'CÔNG TY CỔ PHẦN THƯƠNG MẠI VÀ XÂY DỰNG ĐỒ NỘI THẤT GỖ', '', '', 'site', 'product'),
(183, 'vi', 'Showroom', '', '', 'site', 'product'),
(184, 'vi', '43 - Ngõ Văn Chương - Khâm Thiên - Hà Nội', '', '', 'site', 'product'),
(185, 'vi', 'Tel/Fax', '', '', 'site', 'product'),
(186, 'vi', '04.35565 863', '', '', 'site', 'product'),
(187, 'vi', 'Mobile', '', '', 'site', 'product'),
(188, 'vi', '0943 903 069', '', '', 'site', 'product'),
(189, 'vi', 'Email', '', '', 'site', 'product'),
(190, 'vi', 'contact@donoithatgo.vn', '', '', 'site', 'product'),
(191, 'vi', 'Design by IHB Việt Nam', '', '', 'site', 'product'),
(192, 'vi', 'Kết quả tìm kiếm', '', '', 'site', 'product');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE IF NOT EXISTS `tbl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` tinyint(4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `process_status` tinyint(1) NOT NULL,
  `special` tinyint(4) DEFAULT NULL,
  `other` varchar(1024) DEFAULT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE IF NOT EXISTS `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `catid` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `lang` smallint(6) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `amount_status` tinyint(1) NOT NULL DEFAULT '1',
  `special` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(256) NOT NULL,
  `num_price` int(11) NOT NULL,
  `alias` varchar(256) NOT NULL,
  `keywords` varchar(512) NOT NULL,
  `other` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `code`, `catid`, `manufacturer_id`, `type`, `lang`, `status`, `amount_status`, `special`, `name`, `num_price`, `alias`, `keywords`, `other`, `created_by`, `created_date`) VALUES
(1, 'TU1', 61, 73, 0, 0, 1, 1, 0, 'Tu 1', 9000000, 'tu-1-11052012', '', '{"introimage":"15","otherimage":"16","list_suggest":"","description":"<p>Mo ta san pham<\\/p>","parameter":"<p>Thong so ki thuat<\\/p>","price":"{\\"num_price\\":\\"2000000\\",\\"unit_price\\":\\"VND\\"}","modified":"{\\"1336706040\\":\\"1\\"}","showroom":"","store":"","comment":""}', 1, 1336674799),
(2, 'TU2', 69, 73, 0, 0, 1, 1, 1, 'Tu 2', 1200000, 'tu-2-11052012', '', '{"introimage":"17","otherimage":"18,19","list_suggest":"","description":"<p>Mo ta san pham<\\/p>","parameter":"<p>Thong so ki thuat<\\/p>","price":"{\\"num_price\\":\\"\\",\\"unit_price\\":\\"VND\\"}","modified":"{\\"1336702034\\":\\"1\\",\\"1336702059\\":\\"1\\",\\"1336702386\\":\\"1\\",\\"1336706017\\":\\"1\\",\\"1336710986\\":\\"1\\"}","showroom":"","store":"","comment":""}', 1, 1336674856),
(3, 'TU3', 61, 73, 0, 0, 1, 1, 3, 'Tu 3', 500000, 'tu-3-11052012', '', '{"introimage":"20","otherimage":"21,22","list_suggest":"1","description":"<p>Mo ta san pham<\\/p>","parameter":"<p>Thong so ki thuat<\\/p>","price":"{\\"num_price\\":\\"1200000\\",\\"unit_price\\":\\"VND\\"}","modified":"{\\"1336699555\\":\\"1\\",\\"1336699758\\":\\"1\\",\\"1336700487\\":\\"1\\",\\"1336700865\\":\\"1\\",\\"1336700885\\":\\"1\\",\\"1336701915\\":\\"1\\",\\"1336706003\\":\\"1\\"}","showroom":"<p>Showroom<\\/p>","store":"<p>Van phong<\\/p>","comment":"<p>Nhan xet<\\/p>"}', 1, 1336674909);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE IF NOT EXISTS `tbl_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 NOT NULL,
  `value` varchar(512) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`id`, `name`, `value`) VALUES
(1, 'FRONT_SITE_TITLE', 'Đồ gỗ nội thất'),
(2, 'EMAIL_CONTACT', 'thanhlx0204@gmail.com'),
(3, 'HOTLINE', '0906244804'),
(4, 'COMPANY', 'CÔNG TY CỔ PHẦN THƯƠNG MẠI VÀ XÂY DỰNG ĐỒ NỘI THẤT GỖ'),
(5, 'SHOWROOM', '43 - Ngõ Văn Chương - Khâm Thiên - Hà Nội'),
(6, 'TEL/FAX', '04.35565 863'),
(7, 'MOBILE', '0943 903 069'),
(8, 'EMAIL', 'contact@donoithatgo.vn'),
(9, 'DESIGN_BY', 'Design by IHB Việt Nam'),
(10, 'META_DESCRIPTION', 'Đồ gỗ nội thất'),
(11, 'META_KEYWORD', 'Đồ gỗ, IHB Việt Nam'),
(12, 'META_AUTHOR', 'IHB Việt Nam'),
(13, 'META_COPYRIGHT', 'IHB Việt Nam'),
(14, 'SIZE_REMARK_PRODUCT', '6'),
(15, 'SEARCH_PAGE_SIZE', '9'),
(16, 'SIZE_HOME_NEWS', '6'),
(17, 'SIZE_HOME_PRODUCT', '6'),
(18, 'HOME_INTRO_LENGTH', '20'),
(19, 'PRODUCT_PAGE_SIZE', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `salt`, `status`, `email`, `other`) VALUES
(1, 'admin', '068bf8c42edece5daa08c9ec0dc0b317', '4f570d19da3d07.31748483', 1, 'kythuat@ihbvietnam.com', '{"phone":"0906244804","address":"Truong Son, An Lao, Hai Phong","firstname":"YHCT","lastname":"YHCT","register_date":1331006642,"last_visit_date":1331006642}');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
