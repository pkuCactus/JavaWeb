-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: questionaire
-- ------------------------------------------------------
-- Server version	5.7.18

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

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `departmentID` varchar(10) NOT NULL,
  `departmentName` varchar(50) NOT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('0048','信息科学与技术学院'),('0049','工商管理学院'),('0050','国教学院');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `details` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2017-07-13 16:14:01','root add 0048 信息科学与技术学院 into table department'),(2,'2017-07-13 16:14:01','root add 0049 工商管理学院 into table department'),(3,'2017-07-13 21:11:58','%s delete %s %s from table department'),(4,'2017-07-13 21:11:58','root add 0049 工商管理学院 into table department'),(5,'2017-07-13 21:11:58','root add 21313 12313 into table department'),(6,'2017-07-13 21:18:00','%s delete %s %s from table department'),(7,'2017-07-13 21:48:27','root add 计算机科学界的最高奖项是以______命名的。 into table question'),(8,'2017-07-13 22:53:56','root add 232432 234234 into table department'),(9,'2017-07-13 22:53:56','root delete 232432 234234 from table department'),(10,'2017-07-13 22:53:56','root add 冯诺依曼体系结构是现代通用电子计算机的基础， 在这个结构中指出计算机中_______都是以二进制形式存储的。 into table question'),(11,'2017-07-13 23:13:59','root delete 0049 工商管理学院 from table department'),(12,'2017-07-13 23:13:59','root add 0049 工商管理学院 into table department'),(13,'2017-07-13 23:24:27','root delete 计算机科学界的最高奖项是以______命名的。 from table question'),(14,'2017-07-13 23:24:27','root delete 冯诺依曼体系结构是现代通用电子计算机的基础， 在这个结构中指出计算机中_______都是以二进制形式存储的。 from table question'),(15,'2017-07-13 23:24:27','root add 计算机科学界的最高奖项是以______命名的。 into table question'),(16,'2017-07-13 23:24:27','root add 计算机科学界的最高奖项是以______命名的。 into table question'),(17,'2017-07-13 23:24:27','root add 计算机科学界的最高奖项是以______命名的。 into table question'),(18,'2017-07-13 23:24:27','root add 计算机科学界的最高奖项是以______命名的。 into table question'),(19,'2017-07-13 23:24:27','root add 计算机科学界的最高奖项是以______命名的。 into table question'),(20,'2017-07-13 23:24:27','root add 12312 into table question'),(21,'2017-07-13 23:24:27','root delete 12312 from table question'),(22,'2017-07-13 23:24:27','root add 冯诺依曼体系结构是现代通用电子计算机的基础， 在这个结构中指出计算机中_______都是以二进制形式存储的。 into table question'),(23,'2017-07-13 23:24:27','root add 在计算机中，存储容量为1MB，指的是_____。 into table question'),(24,'2017-07-14 00:08:24','root add 1231 123123 into table department'),(25,'2017-07-14 00:08:24','root add 12412 424214 into table department'),(26,'2017-07-14 00:08:24','root add 124122141 42421421424 into table department'),(27,'2017-07-14 00:08:24','root add 12124 24234 into table department'),(28,'2017-07-14 00:08:24','root add 121243424 24234234 into table department'),(29,'2017-07-14 00:08:24','root delete 1231 123123 from table department'),(30,'2017-07-14 00:08:24','root delete 12412 424214 from table department'),(31,'2017-07-14 00:08:24','root delete 124122141 42421421424 from table department'),(32,'2017-07-14 00:08:24','root delete 12124 24234 from table department'),(33,'2017-07-14 00:08:24','root delete 121243424 24234234 from table department'),(34,'2017-07-14 00:08:24','root add 21414 124124 into table department'),(35,'2017-07-14 00:08:24','root add 124124 1242142 into table department'),(36,'2017-07-14 00:08:24','root add 1241242432 1242142234234 into table department'),(37,'2017-07-14 00:08:24','root add 123123 12313 into table department'),(38,'2017-07-14 00:08:24','root add 1231231 123131 into table department'),(39,'2017-07-14 00:08:24','root add 1231231231 123131 into table department'),(40,'2017-07-14 00:08:24','root add 211 123131 into table department'),(41,'2017-07-14 00:08:24','root add 2111212 123131123 into table department'),(42,'2017-07-14 00:08:24','root add 2112311212 1231123231123 into table department'),(43,'2017-07-14 00:08:24','root add 2123123323 123112123231123 into table department'),(44,'2017-07-14 00:08:24','root delete 21414 124124 from table department'),(45,'2017-07-14 00:08:24','root delete 124124 1242142 from table department'),(46,'2017-07-14 00:08:24','root delete 1241242432 1242142234234 from table department'),(47,'2017-07-14 00:08:24','root delete 123123 12313 from table department'),(48,'2017-07-14 00:08:24','root delete 1231231 123131 from table department'),(49,'2017-07-14 00:08:24','root delete 211 123131 from table department'),(50,'2017-07-14 00:08:24','root delete 2111212 123131123 from table department'),(51,'2017-07-14 00:08:24','root delete 2112311212 1231123231123 from table department'),(52,'2017-07-14 00:08:24','root delete 2123123323 123112123231123 from table department'),(53,'2017-07-14 00:08:24','root delete 1231231231 123131 from table department'),(54,'2017-07-14 00:08:24','root add 1 1 into table department'),(55,'2017-07-14 00:08:24','root add 12 12 into table department'),(56,'2017-07-14 00:08:24','root add 122 122 into table department'),(57,'2017-07-14 00:08:24','root add 1221 122 into table department'),(58,'2017-07-14 00:08:24','root add 12212 1221 into table department'),(59,'2017-07-14 00:25:49','root delete 12 12 from table department'),(60,'2017-07-14 00:25:49','root delete 122 122 from table department'),(61,'2017-07-14 00:25:49','root delete 12212 1221 from table department'),(62,'2017-07-14 00:25:49','root delete 122 122 from table department'),(63,'2017-07-14 00:25:49','root delete 1 1 from table department'),(64,'2017-07-14 00:25:49','root add 123 123 into table department'),(65,'2017-07-14 00:25:49','root add 1231 1231 into table department'),(66,'2017-07-14 00:25:49','root add 1231231 12311 into table department'),(67,'2017-07-14 00:25:49','root add 12311231 123111 into table department'),(68,'2017-07-14 00:25:49','root add 2132 12321 into table department'),(69,'2017-07-14 00:25:49','root delete 1231231 12311 from table department'),(70,'2017-07-14 00:25:49','root delete 2132 12321 from table department'),(71,'2017-07-14 00:25:49','root delete 123 123 from table department'),(72,'2017-07-14 00:25:49','root delete 1231 1231 from table department'),(73,'2017-07-14 00:25:49','root delete 12311231 123111 from table department'),(74,'2017-07-14 00:25:49','root add 1 2 into table department'),(75,'2017-07-14 00:25:49','root add 1123 213 into table department'),(76,'2017-07-14 00:25:49','root add 212 2132 into table department'),(77,'2017-07-14 00:25:49','root add 2121 21321 into table department'),(78,'2017-07-14 00:25:49','root add 21212 213212 into table department'),(79,'2017-07-14 00:25:49','root add 2121222 2132122 into table department'),(80,'2017-07-14 00:25:49','root delete 1 2 from table department'),(81,'2017-07-14 00:25:49','root delete 2121 21321 from table department'),(82,'2017-07-14 00:25:49','root delete 21212 213212 from table department'),(83,'2017-07-14 00:25:49','root delete 1123 213 from table department'),(84,'2017-07-14 00:25:49','root delete 2121222 2132122 from table department'),(85,'2017-07-14 00:25:49','root delete 212 2132 from table department'),(86,'2017-07-14 00:54:31','root add 0050 国教学院 into table department'),(87,'2017-07-14 17:12:43','root add 在下列四个不同进制的无符号数中，值最大的是______。 into table question'),(88,'2017-07-14 17:12:43','root add 可视范围内的两个山头上有四个醒目的土堆，每个土堆上可以立起或放倒一个醒目竖杆，这四个土堆上的竖杆能表达的消息总数________。\n into table question'),(89,'2017-07-14 17:12:43','root add 6.	(II)有关半导体只读存储器(ROM)与半导体随机存储器（RAM）的描述，正确的是___________。\n\n into table question'),(90,'2017-07-14 17:12:43','root add 12313 1221414 into table department'),(91,'2017-07-14 17:12:43','root delete 12313 1221414 from table department'),(92,'2017-07-14 17:12:43','root delete 6.	(II)有关半导体只读存储器(ROM)与半导体随机存储器（RAM）的描述，正确的是___________。\n\n from table question'),(93,'2017-07-14 17:12:43','root add 3日2日43  4534535 into table department'),(94,'2017-07-14 17:12:43','root delete 3日2日43  4534535 from table department'),(95,'2017-07-14 17:12:43','root add 12321 12312 into table department'),(96,'2017-07-14 17:12:43','root delete 12321 12312 from table department'),(97,'2017-07-14 17:12:43','root add 有关半导体只读存储器(ROM)与半导体随机存储器（RAM）的描述，正确的是___________。\n into table question'),(98,'2017-07-14 17:12:43','root add 不属于计算机外存设备的存储部件是_____。\n into table question'),(99,'2017-07-14 17:12:43','root add CPU可以直接访问计算机的______。\n into table question'),(100,'2017-07-14 17:12:43','root add CPU不能直接访问的存储器是______。\n into table question'),(101,'2017-07-14 17:12:43','root add 在计算机存储器中，_____用来永久存放数据，不能随时修改。\n into table question'),(102,'2017-07-14 17:12:43','root add 关于内存与硬盘的区别，错误的说法是_______。\n into table question'),(103,'2017-07-14 17:12:43','root add 程序设计语言可分为机器语言、____________和高级语言。\n\n into table question'),(104,'2017-07-14 17:12:43','root add 程序设计语言可分为机器语言、____________和高级语言。\n\n into table question'),(105,'2017-07-14 17:12:43','root delete 程序设计语言可分为机器语言、____________和高级语言。\n\n from table question'),(106,'2017-07-14 17:54:34','root add 在程序设计语言中，C语言属于________。\n into table question'),(107,'2017-07-14 17:54:34','root add 将计算机高级语言程序翻译为机器语言的程序是____________。\n into table question'),(108,'2017-07-14 17:54:34','root add 不是程序设计语言的是________。\n\n into table question'),(109,'2017-07-14 17:54:34','root add 设计算法的主要目的是________。\n\n into table question'),(110,'2017-07-14 17:54:34','root add 123124 into table question'),(111,'2017-07-14 17:54:34','root add 234223人 into table question'),(112,'2017-07-14 17:54:34','root add 23322额外 223 into table question'),(113,'2017-07-14 17:54:34','root add 232423332 into table question'),(114,'2017-07-14 17:54:34','root add 3432423423 into table question'),(115,'2017-07-14 17:54:34','root add 324324234234234242423424 into table question'),(116,'2017-07-14 17:54:34','root add 1231131231231232132 into table question'),(117,'2017-07-14 17:54:34','root add 1123213123123213 into table question'),(118,'2017-07-15 00:56:36','root delete 232423332 from table question'),(119,'2017-07-15 00:56:36','root delete 324324234234234242423424 from table question'),(120,'2017-07-15 00:56:36','root delete 1231131231231232132 from table question'),(121,'2017-07-15 00:56:36','root delete 123124 from table question'),(122,'2017-07-15 00:56:36','root delete 23322额外 223 from table question'),(123,'2017-07-15 00:56:36','root delete 1123213123123213 from table question'),(124,'2017-07-15 00:56:36','root delete 234223人 from table question'),(125,'2017-07-15 00:56:36','root delete 3432423423 from table question'),(126,'2017-07-15 00:56:36','root add 我1314134 into table question'),(127,'2017-07-15 00:58:21','root add 1213213 into table question'),(128,'2017-07-15 00:59:55','root add 1221414 into table question'),(129,'2017-07-15 01:00:46','root add 24234 into table question'),(130,'2017-07-15 01:04:08','root delete 我1314134 from table question'),(131,'2017-07-15 01:04:08','root delete 1213213 from table question'),(132,'2017-07-15 01:04:08','root delete 1221414 from table question'),(133,'2017-07-15 01:04:08','root delete 24234 from table question'),(134,'2017-07-15 01:04:08','root add 121231414 into table question'),(135,'2017-07-15 01:04:08','root add 23424 234234 into table department'),(136,'2017-07-15 01:04:08','root delete 23424 234234 from table department'),(137,'2017-07-15 01:09:17','root add 1233 into table question'),(138,'2017-07-15 01:09:17','root add 2113 into table question'),(139,'2017-07-15 01:09:17','root delete 2113 from table question'),(140,'2017-07-22 23:37:22','root add 23424234 into table question');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('root','e10adc3949ba59abbe56e057f20f883e');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `option` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `altertime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `score` int(11) DEFAULT NULL,
  `difficult` int(11) DEFAULT NULL,
  `part` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (7,'计算机科学界的最高奖项是以______命名的。','图灵 ;冯.诺依曼 ;比尔盖茨; 诺贝尔',0,'2017-07-13 23:24:27','2017-07-13 23:24:27',1,1,2),(9,'冯诺依曼体系结构是现代通用电子计算机的基础， 在这个结构中指出计算机中_______都是以二进制形式存储的。','程序和数据;程序和算法 ;指令与电流 ;数据与信息',0,'2017-07-13 23:24:27','2017-07-13 23:24:27',1,2,2),(10,'在计算机中，存储容量为1MB，指的是_____。','1024×1024位;1024×1024字节;1000×1000位 ;1000×1000字节',0,'2017-07-13 23:24:27','2017-07-13 23:24:27',1,1,2),(11,'在下列四个不同进制的无符号数中，值最大的是______。','(CB)16;(312)8; (204)10 ;(11001010)2\n',0,'2017-07-14 17:12:43','2017-07-14 17:12:43',1,2,2),(12,'可视范围内的两个山头上有四个醒目的土堆，每个土堆上可以立起或放倒一个醒目竖杆，这四个土堆上的竖杆能表达的消息总数________。\n','4;8;16;32\n',0,'2017-07-14 17:12:43','2017-07-14 17:12:43',1,1,2),(14,'有关半导体只读存储器(ROM)与半导体随机存储器（RAM）的描述，正确的是___________。\n','ROM可以永久保存信息，RAM在掉电后信息会丢失;RAM通常被用来制作移动硬盘;ROM掉电后，信息会丢失，RAM则不会;ROM是内存储器，RAM是外存储器',0,'2017-07-14 17:12:43','2017-07-14 17:12:43',1,2,2),(15,'不属于计算机外存设备的存储部件是_____。\n','高速缓存;磁盘阵列（RAID）;光驱;固态硬盘',0,'2017-07-14 17:12:43','2017-07-14 17:12:43',1,2,2),(16,'CPU可以直接访问计算机的______。\n','内存储器;硬盘;虚拟存储器;光盘',0,'2017-07-14 17:12:43','2017-07-14 17:12:43',1,3,2),(17,'CPU不能直接访问的存储器是______。\n','ROM;RAM ;Cache;CD－ROM',0,'2017-07-14 17:12:43','2017-07-14 17:12:43',1,3,2),(18,'在计算机存储器中，_____用来永久存放数据，不能随时修改。\n','虚拟存储器;RAM;ROM ;Cache',0,'2017-07-14 17:12:43','2017-07-14 17:12:43',1,3,2),(19,'关于内存与硬盘的区别，错误的说法是_______。\n','内存与硬盘都是存储设备;内存的容量小，硬盘的容量相对大;内存的存取速度快，硬盘的速度相对慢;断电后内存和硬盘中的信息仍然保留着',0,'2017-07-14 17:12:43','2017-07-14 17:12:43',1,2,2),(21,'程序设计语言可分为机器语言、____________和高级语言。\n\n','汇编语言;编程语言 ;排版语言 ;逻辑语言',0,'2017-07-14 17:12:43','2017-07-14 17:12:43',1,1,3),(22,'在程序设计语言中，C语言属于________。\n','机器语言;低级语言;高级语言;面向对象语言',0,'2017-07-14 17:54:34','2017-07-14 17:54:34',1,1,3),(23,'将计算机高级语言程序翻译为机器语言的程序是____________。\n','C语言程序; 编译程序;汇编程序;连接程序',0,'2017-07-14 17:54:34','2017-07-14 17:54:34',1,2,3),(24,'不是程序设计语言的是________。\n\n','Basic;Java;Python;Android',0,'2017-07-14 17:54:34','2017-07-14 17:54:34',1,1,3),(25,'设计算法的主要目的是________。\n\n','找出问题中的数学规律;提高计算机硬件的性能，比如加快CPU运行速度，提高内存或硬盘访问速度;使得程序易于被计算机理解\n;使得计算机能够在尽可能短的时间内正确完成计算任务',0,'2017-07-14 17:54:34','2017-07-14 17:54:34',1,2,3),(38,'121231414','124124;2423;4234234;24242',0,'2017-07-15 01:04:08','2017-07-15 01:04:08',1,1,2),(39,'1233','13123;12321;22432',0,'2017-07-15 01:09:17','2017-07-15 01:09:17',1,1,2),(40,'23424234','234234234',0,'2017-07-22 23:37:22','2017-07-22 23:37:22',1,1,3);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_ques`
--

DROP TABLE IF EXISTS `student_ques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_ques` (
  `studentID` varchar(10) NOT NULL,
  `questionID` int(11) NOT NULL,
  `answer` varchar(500) DEFAULT NULL,
  `anstime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`studentID`,`questionID`),
  KEY `questionID` (`questionID`),
  CONSTRAINT `student_ques_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`),
  CONSTRAINT `student_ques_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_ques`
--

LOCK TABLES `student_ques` WRITE;
/*!40000 ALTER TABLE `student_ques` DISABLE KEYS */;
INSERT INTO `student_ques` VALUES ('1601214510',7,'','2017-07-23 02:40:58'),('1601214510',9,'','2017-07-23 02:40:58'),('1601214510',10,'','2017-07-23 02:40:58'),('1601214510',11,'','2017-07-23 02:40:58'),('1601214510',12,'','2017-07-23 02:40:58'),('1601214510',14,'','2017-07-23 02:40:58'),('1601214510',15,'','2017-07-23 02:40:58'),('1601214510',16,'','2017-07-23 02:40:58'),('1601214510',17,'','2017-07-23 02:40:58'),('1601214510',18,'','2017-07-23 02:40:58'),('1601214510',19,'','2017-07-23 02:40:58'),('1601214510',21,'','2017-07-23 02:40:58'),('1601214510',22,'','2017-07-23 02:40:58'),('1601214510',23,'','2017-07-23 02:40:58'),('1601214510',24,'','2017-07-23 02:40:58'),('1601214510',25,'','2017-07-23 02:40:58'),('1601214510',38,'','2017-07-23 02:40:58'),('1601214510',39,'','2017-07-23 02:40:58'),('1601214510',40,'','2017-07-23 02:40:58'),('1601214511',7,'','2017-07-23 01:00:29'),('1601214511',9,'','2017-07-23 01:00:29'),('1601214511',10,'','2017-07-23 01:00:29'),('1601214511',11,'','2017-07-23 01:00:29'),('1601214511',12,'','2017-07-23 01:00:29'),('1601214511',14,'','2017-07-23 01:00:29'),('1601214511',15,'','2017-07-23 01:00:29'),('1601214511',16,'','2017-07-23 01:00:29'),('1601214511',17,'','2017-07-23 01:00:29'),('1601214511',18,'','2017-07-23 01:00:29'),('1601214511',19,'','2017-07-23 01:00:29'),('1601214511',21,'','2017-07-23 01:00:29'),('1601214511',22,'','2017-07-23 01:00:29'),('1601214511',23,'','2017-07-23 01:00:29'),('1601214511',24,'','2017-07-23 01:00:29'),('1601214511',25,'','2017-07-23 01:00:29'),('1601214511',38,'','2017-07-23 01:00:29'),('1601214511',39,'','2017-07-23 01:00:29'),('1601214511',40,'','2017-07-23 01:00:29');
/*!40000 ALTER TABLE `student_ques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `studentID` varchar(10) NOT NULL,
  `studentName` varchar(40) NOT NULL,
  `studentDepartment` varchar(50) NOT NULL,
  `home` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL,
  `finished` tinyint(1) DEFAULT '0',
  `logintime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('1601214510','何建忠','0048','东北',0,1,'2017-07-23 02:15:08'),('1601214511','李四','0048','东北',0,1,'2017-07-23 00:54:18'),('1601214512','县道','0048','东北',0,0,'2017-07-23 19:17:05');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-23 19:32:53
