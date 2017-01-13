-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: qilin99rdb1.mysql.rds.aliyuncs.com    Database: ctrade
-- ------------------------------------------------------
-- Server version	5.6.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

use ctrade_production
--
-- Table structure for table `admin_user_list`
--

DROP TABLE IF EXISTS `admin_user_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `passwd` varchar(32) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_message`
--

DROP TABLE IF EXISTS `business_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `environment` varchar(20) DEFAULT NULL,
  `expiryTime` datetime NOT NULL,
  `inId` bigint(20) NOT NULL,
  `insertTime` datetime NOT NULL,
  `isread` varchar(64) DEFAULT NULL,
  `sendTime` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_tradehistory`
--

DROP TABLE IF EXISTS `business_tradehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_tradehistory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CO_I` varchar(64) DEFAULT NULL,
  `FI_I` varchar(64) DEFAULT NULL,
  `HL_N` bigint(20) NOT NULL,
  `H_P` decimal(19,2) NOT NULL,
  `LIQPL` decimal(19,2) NOT NULL,
  `OR_N` bigint(20) NOT NULL,
  `OR_T` datetime NOT NULL,
  `OTHER_ID` varchar(64) DEFAULT NULL,
  `O_PR` decimal(19,2) NOT NULL,
  `PR` decimal(19,2) NOT NULL,
  `QTY` bigint(20) NOT NULL,
  `SE_F` bigint(20) NOT NULL,
  `TI` datetime NOT NULL,
  `TRADEFEE` decimal(19,2) NOT NULL,
  `TR_I` varchar(64) DEFAULT NULL,
  `TR_N` bigint(20) NOT NULL,
  `TR_T` bigint(20) NOT NULL,
  `TY` bigint(20) NOT NULL,
  `environment` varchar(20) DEFAULT NULL,
  `insertDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1313 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `count_trade`
--

DROP TABLE IF EXISTS `count_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `count_trade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `commodity_id` varchar(10) DEFAULT NULL,
  `count_date` datetime DEFAULT NULL,
  `count_number` bigint(20) NOT NULL,
  `log_code` int(11) DEFAULT NULL,
  `muid` bigint(20) NOT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `service_name` varchar(30) DEFAULT NULL,
  `ua` varchar(10) DEFAULT NULL,
  `reserved_field1` varchar(255) DEFAULT NULL,
  `reserved_field2` varchar(255) DEFAULT NULL,
  `reserved_field3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2191 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `count_usermanage`
--

DROP TABLE IF EXISTS `count_usermanage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `count_usermanage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count_date` datetime DEFAULT NULL,
  `count_number` bigint(20) NOT NULL,
  `log_code` varchar(1) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `service_name` varchar(20) DEFAULT NULL,
  `ua` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `live_msg`
--

DROP TABLE IF EXISTS `live_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `date` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `roomId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roomIdIndex` (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=2091 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `live_room`
--

DROP TABLE IF EXISTS `live_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) DEFAULT NULL,
  `headimgurl` varchar(1000) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_account`
--

DROP TABLE IF EXISTS `member_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bankAccount` varchar(64) DEFAULT NULL,
  `bankId` varchar(64) DEFAULT NULL,
  `bankName` varchar(128) DEFAULT NULL,
  `bankProvince` varchar(64) DEFAULT NULL,
  `cellphone` varchar(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `customerName` varchar(64) NOT NULL,
  `customerNo` varchar(32) NOT NULL,
  `environment` varchar(20) DEFAULT NULL,
  `invitationCode` varchar(64) DEFAULT NULL,
  `isActived` int(11) NOT NULL,
  `isHLBSigned` int(11) NOT NULL,
  `openDate` datetime NOT NULL,
  `paperCode` varchar(32) NOT NULL,
  `paperType` int(11) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `remoteIp` varchar(20) NOT NULL,
  `signType` int(11) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `ua` varchar(10) DEFAULT NULL,
  `brokerageNo` varchar(20) DEFAULT NULL,
  `openReward` varchar(1) DEFAULT NULL,
  `isQuickPay` bit(1) NOT NULL,
  `threshold` double DEFAULT NULL,
  `channel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userIdIndex` (`userId`),
  KEY `customerNameIndex` (`customerName`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_trade_brokerageno`
--

DROP TABLE IF EXISTS `member_trade_brokerageno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_trade_brokerageno` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brokerageNo` varchar(20) DEFAULT NULL,
  `channel` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `environmentCode` varchar(50) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_user`
--

DROP TABLE IF EXISTS `member_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `headimgurl` varchar(500) DEFAULT NULL,
  `isAdmin` bit(1) NOT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `nickname` varchar(1200) DEFAULT NULL,
  `openid` varchar(64) DEFAULT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL,
  `regDate` datetime NOT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `ua` varchar(10) DEFAULT NULL,
  `unionid` varchar(64) DEFAULT NULL,
  `ucenterPasswd` varchar(20) DEFAULT NULL,
  `channel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `openidIndex` (`openid`),
  KEY `phoneIndex` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=660 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_customer`
--

DROP TABLE IF EXISTS `report_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMoney` varchar(255) DEFAULT NULL,
  `OMoney` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `cellPhone` varchar(15) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cusName` varchar(255) NOT NULL,
  `customerNo` varchar(32) NOT NULL,
  `date` datetime DEFAULT NULL,
  `free` varchar(255) DEFAULT NULL,
  `ob` varchar(255) DEFAULT NULL,
  `obTwo` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1097 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_customer_funds_stat`
--

DROP TABLE IF EXISTS `report_customer_funds_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_customer_funds_stat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CAPITAL` double NOT NULL,
  `CLEAR_DATE` datetime NOT NULL,
  `CLOSE_PL` double NOT NULL,
  `DELAY_FEE` double NOT NULL,
  `FROZENPAY` double NOT NULL,
  `FUNDIO` double NOT NULL,
  `HOLD_PL` double NOT NULL,
  `LAST_CAPITAL` double NOT NULL,
  `MARGIN` double NOT NULL,
  `PAY` double NOT NULL,
  `PENALTY` double NOT NULL,
  `RISK_RATE` double NOT NULL,
  `SETTLEDELAYFEE` double NOT NULL,
  `SETTLEFEE` double NOT NULL,
  `SETTLEMARGIN` double NOT NULL,
  `SETTLEPL` double NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  `TRADE_FEE` double NOT NULL,
  `customerNo` varchar(64) NOT NULL,
  `date` datetime NOT NULL,
  `environmentCode` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customerNoIndex` (`customerNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2629 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_frimfunds`
--

DROP TABLE IF EXISTS `report_frimfunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_frimfunds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cd` double NOT NULL,
  `date` datetime DEFAULT NULL,
  `fee` double NOT NULL,
  `fi_i` varchar(15) NOT NULL,
  `ob` double NOT NULL,
  `rm` double NOT NULL,
  `environmentcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_fundio`
--

DROP TABLE IF EXISTS `report_fundio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_fundio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `am` double NOT NULL,
  `bn` varchar(10) NOT NULL,
  `fi_i` varchar(15) NOT NULL,
  `mid` bigint(20) NOT NULL,
  `tt` varchar(2) NOT NULL,
  `ut` datetime NOT NULL,
  `date` datetime DEFAULT NULL,
  `environmentcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95207 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_fundio_history`
--

DROP TABLE IF EXISTS `report_fundio_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_fundio_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `am` double NOT NULL,
  `bn` varchar(10) NOT NULL,
  `fi_i` varchar(15) NOT NULL,
  `mid` bigint(20) NOT NULL,
  `tt` varchar(2) NOT NULL,
  `ut` datetime NOT NULL,
  `date` datetime DEFAULT NULL,
  `environmentcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_holding`
--

DROP TABLE IF EXISTS `report_holding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_holding` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_qty` bigint(20) NOT NULL,
  `co_i` varchar(10) NOT NULL,
  `f_qty` bigint(20) NOT NULL,
  `fi_i` varchar(15) NOT NULL,
  `h_id` bigint(20) NOT NULL,
  `h_p` double NOT NULL,
  `mar` double NOT NULL,
  `mar_rate` double NOT NULL,
  `o_pr` double NOT NULL,
  `o_qty` bigint(20) NOT NULL,
  `or_t` datetime NOT NULL,
  `other_id` varchar(20) NOT NULL,
  `stop_loss` double NOT NULL,
  `stop_profit` double NOT NULL,
  `tr_n` bigint(20) NOT NULL,
  `ty` bigint(20) NOT NULL,
  `ut` datetime NOT NULL,
  `date` datetime DEFAULT NULL,
  `environmentcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142815 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_holding_history`
--

DROP TABLE IF EXISTS `report_holding_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_holding_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_qty` bigint(20) NOT NULL,
  `co_i` varchar(10) NOT NULL,
  `f_qty` bigint(20) NOT NULL,
  `fi_i` varchar(15) NOT NULL,
  `h_id` bigint(20) NOT NULL,
  `h_p` double NOT NULL,
  `mar` double NOT NULL,
  `mar_rate` double NOT NULL,
  `o_pr` double NOT NULL,
  `o_qty` bigint(20) NOT NULL,
  `or_t` datetime NOT NULL,
  `other_id` varchar(20) NOT NULL,
  `stop_loss` double NOT NULL,
  `stop_profit` double NOT NULL,
  `tr_n` bigint(20) NOT NULL,
  `ty` bigint(20) NOT NULL,
  `ut` datetime NOT NULL,
  `date` datetime DEFAULT NULL,
  `environmentcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4527 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_order`
--

DROP TABLE IF EXISTS `report_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `co_i` varchar(10) NOT NULL,
  `f_fee` double NOT NULL,
  `f_mar` double NOT NULL,
  `fi_i` varchar(15) NOT NULL,
  `h_no` bigint(20) NOT NULL,
  `o_f` varchar(10) NOT NULL,
  `o_t` bigint(20) NOT NULL,
  `or_n` bigint(20) NOT NULL,
  `pri` double NOT NULL,
  `qty` bigint(20) NOT NULL,
  `se_f` bigint(20) NOT NULL,
  `sta` bigint(20) NOT NULL,
  `stop_loss` double NOT NULL,
  `stop_profit` double NOT NULL,
  `time` datetime NOT NULL,
  `tr_i` varchar(15) NOT NULL,
  `ty` bigint(20) NOT NULL,
  `ut` datetime NOT NULL,
  `ut_qty` bigint(20) NOT NULL,
  `wd_t` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `environmentcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148022 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_order_history`
--

DROP TABLE IF EXISTS `report_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_order_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `co_i` varchar(10) NOT NULL,
  `f_fee` double NOT NULL,
  `f_mar` double NOT NULL,
  `fi_i` varchar(15) NOT NULL,
  `h_no` bigint(20) NOT NULL,
  `o_f` varchar(10) NOT NULL,
  `o_t` bigint(20) NOT NULL,
  `or_n` bigint(20) NOT NULL,
  `pri` double NOT NULL,
  `qty` bigint(20) NOT NULL,
  `se_f` bigint(20) NOT NULL,
  `sta` bigint(20) NOT NULL,
  `stop_loss` double NOT NULL,
  `stop_profit` double NOT NULL,
  `time` datetime NOT NULL,
  `tr_i` varchar(15) NOT NULL,
  `ty` bigint(20) NOT NULL,
  `ut` datetime NOT NULL,
  `ut_qty` bigint(20) NOT NULL,
  `wd_t` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `environmentcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3050 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_person`
--

DROP TABLE IF EXISTS `report_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `brokerageNo` varchar(255) DEFAULT NULL,
  `comm` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `custermNo` varchar(100) DEFAULT NULL,
  `liqpl` double DEFAULT NULL,
  `ti` datetime DEFAULT NULL,
  `channel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2732 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_product`
--

DROP TABLE IF EXISTS `report_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) DEFAULT NULL,
  `comm` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `liqpl` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `ti` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_trade`
--

DROP TABLE IF EXISTS `report_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_trade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `co_i` varchar(10) NOT NULL,
  `comm` double NOT NULL,
  `fi_i` varchar(15) NOT NULL,
  `h_p` double NOT NULL,
  `hl_n` bigint(20) NOT NULL,
  `liqpl` double NOT NULL,
  `o_pr` double NOT NULL,
  `or_n` bigint(20) NOT NULL,
  `or_t` bigint(20) NOT NULL,
  `other_id` varchar(20) NOT NULL,
  `pr` double NOT NULL,
  `qty` bigint(20) NOT NULL,
  `se_f` bigint(20) NOT NULL,
  `ti` datetime NOT NULL,
  `tr_i` varchar(15) NOT NULL,
  `tr_n` bigint(20) NOT NULL,
  `tr_t` bigint(20) NOT NULL,
  `ty` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `environmentcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131408 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_trade_history`
--

DROP TABLE IF EXISTS `report_trade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_trade_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `co_i` varchar(10) NOT NULL,
  `comm` double NOT NULL,
  `fi_i` varchar(15) NOT NULL,
  `h_p` double NOT NULL,
  `hl_n` bigint(20) NOT NULL,
  `liqpl` double NOT NULL,
  `o_pr` double NOT NULL,
  `or_n` bigint(20) NOT NULL,
  `or_t` bigint(20) NOT NULL,
  `other_id` varchar(20) NOT NULL,
  `pr` double NOT NULL,
  `qty` bigint(20) NOT NULL,
  `se_f` bigint(20) NOT NULL,
  `ti` datetime NOT NULL,
  `tr_i` varchar(15) NOT NULL,
  `tr_n` bigint(20) NOT NULL,
  `tr_t` bigint(20) NOT NULL,
  `ty` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `environmentcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5031 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_tradebrokerageno`
--

DROP TABLE IF EXISTS `report_tradebrokerageno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_tradebrokerageno` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) DEFAULT NULL,
  `comm` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `liqpl` varchar(255) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `ti` datetime DEFAULT NULL,
  `channel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_ua`
--

DROP TABLE IF EXISTS `report_ua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_ua` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` varchar(20) DEFAULT NULL,
  `comm` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `iMoney` varchar(20) DEFAULT NULL,
  `iNum` int(11) DEFAULT NULL,
  `loginNum` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `oMoney` varchar(20) DEFAULT NULL,
  `oNum` int(11) DEFAULT NULL,
  `openNum` int(11) DEFAULT NULL,
  `regNum` int(11) DEFAULT NULL,
  `relatedNum` int(11) DEFAULT NULL,
  `signNum` int(11) DEFAULT NULL,
  `tradeCount` int(11) DEFAULT NULL,
  `tradeNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_tradedaystat`
--

DROP TABLE IF EXISTS `stat_tradedaystat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_tradedaystat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `commodityName` varchar(50) NOT NULL,
  `environment` varchar(50) NOT NULL,
  `tradeDate` datetime NOT NULL,
  `tradeMoney` double NOT NULL,
  `tradeTimes` int(11) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1475 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_activity`
--

DROP TABLE IF EXISTS `system_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` longtext,
  `endDate` datetime DEFAULT NULL,
  `environmentCode` varchar(50) NOT NULL,
  `isOpen` bit(1) NOT NULL,
  `isTest` bit(1) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codeIndex` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_app_qa_msg`
--

DROP TABLE IF EXISTS `system_app_qa_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_app_qa_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` longtext,
  `question` varchar(2000) DEFAULT NULL,
  `sortId` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_c1fg2h6cbnrjd87tmaqox8i1o` (`sortId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_banner`
--

DROP TABLE IF EXISTS `system_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `img_url` varchar(1000) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `sortId` int(11) DEFAULT NULL,
  `display` int(11) NOT NULL DEFAULT '1',
  `time` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_ctrade`
--

DROP TABLE IF EXISTS `system_ctrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_ctrade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `environmentCode` varchar(50) DEFAULT NULL,
  `forShort` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `isDefault` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_ctrade_time`
--

DROP TABLE IF EXISTS `system_ctrade_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_ctrade_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `across` smallint(6) DEFAULT NULL,
  `closeTime` time DEFAULT NULL,
  `environmentCode` varchar(50) DEFAULT NULL,
  `isOpen` smallint(6) DEFAULT NULL,
  `openTime` time DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `val` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `environmentCodeIndex` (`environmentCode`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_faxian`
--

DROP TABLE IF EXISTS `system_faxian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_faxian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(20) DEFAULT NULL,
  `icon` varchar(1000) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_feed_back`
--

DROP TABLE IF EXISTS `system_feed_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_feed_back` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `muid` bigint(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_jnu0qou0cxql9d7rp42uao287` (`muid`,`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_ipinfo`
--

DROP TABLE IF EXISTS `system_ipinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_ipinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `county` varchar(64) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `region` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_link`
--

DROP TABLE IF EXISTS `system_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_loginhistory`
--

DROP TABLE IF EXISTS `system_loginhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_loginhistory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(5120) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `ua` varchar(10) DEFAULT NULL,
  `userid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `useridIndex` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_message`
--

DROP TABLE IF EXISTS `system_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(20) DEFAULT NULL,
  `adminid` bigint(20) DEFAULT NULL,
  `content` longtext,
  `date` datetime DEFAULT NULL,
  `isDel` bit(1) DEFAULT NULL,
  `isRead` bit(1) DEFAULT NULL,
  `muid` bigint(20) DEFAULT NULL,
  `readDate` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `isDelIndex` (`isDel`),
  KEY `muidIndex` (`muid`)
) ENGINE=InnoDB AUTO_INCREMENT=77471 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_monitorflag`
--

DROP TABLE IF EXISTS `system_monitorflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_monitorflag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(65) DEFAULT NULL,
  `environment` varchar(20) DEFAULT NULL,
  `func` varchar(65) DEFAULT NULL,
  `istrace` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryIndex` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_notice`
--

DROP TABLE IF EXISTS `system_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brief` varchar(300) DEFAULT NULL,
  `content` longtext,
  `date` datetime DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `isShow` smallint(6) DEFAULT NULL,
  `sortId` int(11) DEFAULT NULL,
  `isTop` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `isShowIndex` (`isShow`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_product_msg`
--

DROP TABLE IF EXISTS `system_product_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_product_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) DEFAULT NULL,
  `comm` double NOT NULL,
  `diffPrice` double NOT NULL,
  `limitPrice` varchar(50) DEFAULT NULL,
  `lowerCash` int(11) DEFAULT NULL,
  `minQuoteUnit` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `quoteUnit` int(11) DEFAULT NULL,
  `storeLimit` varchar(50) DEFAULT NULL,
  `storeRate` double NOT NULL,
  `tradeLimit` int(11) DEFAULT NULL,
  `tradeUnit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_qa_msg`
--

DROP TABLE IF EXISTS `system_qa_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_qa_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` longtext,
  `question` varchar(2000) DEFAULT NULL,
  `sortId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_rv9naxho50njjemsjpxxxwl00` (`sortId`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_reward_history`
--

DROP TABLE IF EXISTS `system_reward_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_reward_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `customerNo` varchar(32) NOT NULL,
  `date` datetime DEFAULT NULL,
  `environmentCode` varchar(50) NOT NULL,
  `muid` bigint(20) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `adminname` varchar(20) DEFAULT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `rewardType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customerNoIndex` (`customerNo`),
  KEY `dateIndex` (`date`),
  KEY `muidIndex` (`muid`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_setting`
--

DROP TABLE IF EXISTS `system_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_img_url` varchar(1000) DEFAULT NULL,
  `isOpenReward` bit(1) DEFAULT NULL,
  `stopWG` bit(1) DEFAULT NULL,
  `stopWGString` varchar(255) DEFAULT NULL,
  `openRewardAmount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_sms`
--

DROP TABLE IF EXISTS `system_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_sms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(8) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phoneIndex` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=1129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_tester`
--

DROP TABLE IF EXISTS `system_tester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_tester` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `environmentCode` varchar(50) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `val` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_tradesession`
--

DROP TABLE IF EXISTS `system_tradesession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_tradesession` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customerNo` varchar(50) NOT NULL,
  `environment` varchar(20) NOT NULL,
  `sessionId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_smfxpt46t6936okfdl0slpsao` (`customerNo`),
  KEY `customerNoIndex` (`customerNo`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_wechat_msg`
--

DROP TABLE IF EXISTS `system_wechat_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_wechat_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) DEFAULT NULL,
  `numSuccess` int(11) DEFAULT NULL,
  `numTotal` int(11) DEFAULT NULL,
  `operateTime` datetime DEFAULT NULL,
  `operatorName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-18 10:51:16
