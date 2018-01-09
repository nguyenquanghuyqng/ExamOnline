CREATE DATABASE  IF NOT EXISTS `examonline` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `examonline`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: examonline
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` text,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'151103A'),(2,'151103B'),(3,'151101A'),(4,'151101B'),(5,'151102A');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_tests`
--

DROP TABLE IF EXISTS `classes_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_tests` (
  `classid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  PRIMARY KEY (`classid`,`testid`),
  KEY `FK_Tests_Classes_idx` (`testid`),
  CONSTRAINT `FK_Classes_Tests` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Tests_Classes` FOREIGN KEY (`testid`) REFERENCES `tests` (`testid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_tests`
--

LOCK TABLES `classes_tests` WRITE;
/*!40000 ALTER TABLE `classes_tests` DISABLE KEYS */;
INSERT INTO `classes_tests` VALUES (2,1),(3,2),(1,3),(4,4),(1,5);
/*!40000 ALTER TABLE `classes_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_user`
--

DROP TABLE IF EXISTS `classes_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_user` (
  `classid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`classid`,`userid`),
  KEY `FK_Users_idx` (`userid`),
  CONSTRAINT `FK_Classes` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_user`
--

LOCK TABLES `classes_user` WRITE;
/*!40000 ALTER TABLE `classes_user` DISABLE KEYS */;
INSERT INTO `classes_user` VALUES (1,3),(1,5),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(5,13);
/*!40000 ALTER TABLE `classes_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `listclassexamview`
--

DROP TABLE IF EXISTS `listclassexamview`;
/*!50001 DROP VIEW IF EXISTS `listclassexamview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listclassexamview` AS SELECT 
 1 AS `classid`,
 1 AS `classname`,
 1 AS `subjectname`,
 1 AS `testtypemame`,
 1 AS `testid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `medias`
--

DROP TABLE IF EXISTS `medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medias` (
  `mediaid` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(45) DEFAULT NULL,
  `media` varchar(45) DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`mediaid`),
  KEY `Fk_Questions_idx` (`questionid`),
  CONSTRAINT `Fk_Questions` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias`
--

LOCK TABLES `medias` WRITE;
/*!40000 ALTER TABLE `medias` DISABLE KEYS */;
INSERT INTO `medias` VALUES (1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `questionid` int(11) DEFAULT NULL,
  `optionid` int(11) NOT NULL AUTO_INCREMENT,
  `optionname` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `isanswer` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`optionid`),
  KEY `FK_Qustion_Option_idx` (`questionid`),
  CONSTRAINT `FK_Qustion_Option` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,1,'A.Then',NULL),(1,2,'B.Which',NULL),(1,3,'C.Who',NULL),(1,4,'D.If',NULL),(2,5,'A.Infact',NULL),(2,6,'B.Recently',NULL),(2,7,'C.Although',NULL),(2,8,'D.Also',NULL),(3,9,'A.Addition',NULL),(3,10,'B.Increased',NULL),(3,11,'C.Division',NULL),(3,12,'D.Additional',NULL),(4,13,'A. Opportunism',NULL),(4,14,'B.Opportunities',NULL),(4,15,'C.Favorable',NULL),(4,16,'D.Chances',NULL),(5,17,'A. Widest',NULL),(5,18,'B. Highest',NULL),(5,19,'C. Least',NULL),(5,20,'D. Deepest',NULL),(6,21,'A.2',NULL),(6,22,'B.5',NULL),(6,23,'C.6',NULL),(6,24,'D.7',NULL),(7,25,'A.10',NULL),(7,26,'B.5',NULL),(7,27,'C.15',NULL),(7,28,'D.20',NULL),(8,29,'A.1',NULL),(8,30,'B.2',NULL),(8,31,'C.6',NULL),(8,32,'D.4',NULL),(9,33,'A.15',NULL),(9,34,'B.2.10',NULL),(9,35,'C.18',NULL),(9,36,'D.19',NULL),(10,37,'A.1',NULL),(10,38,'B.2',NULL),(10,39,'C.3',NULL),(10,40,'D.4',NULL),(11,41,'A.12',NULL),(11,42,'B.9',NULL),(11,43,'C.3/2',NULL),(11,44,'D.7.14',NULL),(12,45,'A.32',NULL),(12,46,'B.100.100',NULL),(12,47,'C.100',NULL),(12,48,'D.0.12',NULL),(13,49,'A.0.1',NULL),(13,50,'B.33.33',NULL),(13,51,'C.11.11',NULL),(13,52,'D.22',NULL),(14,53,'A.64',NULL),(14,54,'B.12',NULL),(14,55,'C.24',NULL),(14,56,'D.0',NULL),(15,57,'A.0.1',NULL),(15,58,'B.1',NULL),(15,59,'C.0.001',NULL),(15,60,'D.0.0',NULL),(16,61,'A.System programming language',NULL),(16,62,'B.General purpose language',NULL),(16,63,'C.Data processing language',NULL),(16,64,'D.None of the above',NULL),(17,65,'A.absiha',NULL),(17,66,'B.asiha',NULL),(17,67,'C.haasi',NULL),(17,68,'D.hai',NULL),(18,69,'A.0289',NULL),(18,70,'B.1289',NULL),(18,71,'C.713',NULL),(18,72,'D.Syntax error',NULL),(19,73,'A.Both can occur multiple times, but a declaration must occur first',NULL),(19,74,'B.A definition occurs once, but a declaration may occur many times',NULL),(19,75,'C.Both can occur multiple times, but a definition must occur first',NULL),(19,76,'D.A declaration occurs once, but a definition may occur many times',NULL),(20,77,'A.int',NULL),(20,78,'B.double',NULL),(20,79,'C.string',NULL),(20,80,'D.float',NULL),(21,81,'A.Stack underflow',NULL),(21,82,'B.Stack Overflow',NULL),(21,83,'C.None of these',NULL),(21,84,'D.Both A and B',NULL),(22,85,'A.stdio.h',NULL),(22,86,'B.stdio.h & math.h',NULL),(22,87,'C.stdio.h & stddef.h',NULL),(22,88,'D.None of the above',NULL),(23,89,'A.::',NULL),(23,90,'B.+',NULL),(23,91,'C.-',NULL),(23,92,'D.[]',NULL),(24,93,'A.catch(..,)',NULL),(24,94,'B.catch(---)',NULL),(24,95,'C.catch(...)',NULL),(24,96,'D.catch(void x)',NULL),(25,97,'A.2',NULL),(25,98,'B.0',NULL),(25,99,'C.1',NULL),(25,100,'D.infinite',NULL),(26,101,'A.Virtual Base class',NULL),(26,102,'B.Container class',NULL),(26,103,'C.Virtual function',NULL),(26,104,'D.Both a and c',NULL),(27,105,'A.1',NULL),(27,106,'B.as many as you like',NULL),(27,107,'C.0',NULL),(27,108,'D.2',NULL),(28,109,'A.?::',NULL),(28,110,'B.&*',NULL),(28,111,'C.->>',NULL),(28,112,'D.->*',NULL),(29,113,'A.Stack underflow',NULL),(29,114,'B.Stack Overflow',NULL),(29,115,'C.None of these',NULL),(29,116,'D.Both A and B',NULL),(30,117,'A.Virtual class',NULL),(30,118,'B.Sealed class',NULL),(30,119,'C.Pure Local class',NULL),(30,120,'D.Abstract Class',NULL),(31,121,'A.problems ',NULL),(31,122,'B.situations ',NULL),(31,123,'C.crosses',NULL),(31,124,'D. results',NULL),(32,125,'A.scorn ',NULL),(32,126,'B. grin ',NULL),(32,127,'C.augh',NULL),(32,128,'D.smile',NULL),(33,129,'A.by',NULL),(33,130,'B.on',NULL),(33,131,'C.at',NULL),(33,132,'D.with',NULL),(34,133,'A.out ',NULL),(34,134,'B.to',NULL),(34,135,'C.for',NULL),(34,136,'D.onto',NULL),(35,137,'A.to',NULL),(35,138,'B.on',NULL),(35,139,'C.into',NULL),(35,140,'D.by',NULL);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `contentquestion` text,
  `correctoption` varchar(45) DEFAULT NULL,
  `mediaid` int(11) DEFAULT NULL,
  `questiontypeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionid`),
  KEY `FK_Questions_QuestionType` (`questiontypeid`),
  CONSTRAINT `FK_Questions_QuestionType` FOREIGN KEY (`questiontypeid`) REFERENCES `questiontypes` (`questiontypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'We have two employees ……….create new marketing strategies.','C',NULL,1),(2,2,' ……….he attended the conference, he didn’t think it was very informative.','C',NULL,1),(3,3,'Richard Furst, a specialist in copyright law, is the most recent ……….to our staff','A',NULL,1),(4,4,'With computer programming experience job ……….increase.','B',NULL,1),(5,5,'Company profits reached $ 6 billion in September, the ……….of the decade.','B',NULL,1),(6,1,'1+1=?','A',NULL,2),(7,2,'2+3=?','B',NULL,2),(8,3,'2*3=?','C',NULL,2),(9,4,'3+3+12=?','C',NULL,2),(10,5,'1=?','A',NULL,2),(11,6,'9-0=?','B',NULL,2),(12,7,'10*10','C',NULL,2),(13,8,'11+11=?','D',NULL,2),(14,9,'8*8=?','A',NULL,2),(15,10,'9/9=?','B',NULL,2),(16,1,'C&nbsp;was&nbsp;primarily&nbsp;developed&nbsp;as','A',NULL,2),(17,2,'What&nbsp;will&nbsp;be&nbsp;printed&nbsp;after&nbsp;execution&nbsp;of&nbsp;the&nbsp;following&nbsp;program&nbsp;code?','D',NULL,2),(18,3,'Find&nbsp;the&nbsp;output&nbsp;of&nbsp;the&nbsp;following&nbsp;program','D',NULL,2),(19,4,'What&nbsp;is&nbsp;the&nbsp;difference&nbsp;between&nbsp;a&nbsp;declaration&nbsp;and&nbsp;a&nbsp;definition&nbsp;of&nbsp;a&nbsp;variable?','D',NULL,2),(20,5,'The&nbsp;pow&nbsp;functions&nbsp;returns','B',NULL,2),(21,6,'Whats&nbsp;happen&nbsp;if&nbsp;base&nbsp;condition&nbsp;is&nbsp;not&nbsp;defined&nbsp;in&nbsp;recursion&nbsp;?','B',NULL,2),(22,7,'In&nbsp;which&nbsp;header&nbsp;file&nbsp;is&nbsp;the&nbsp;NULL&nbsp;macro&nbsp;defined?','C',NULL,2),(23,8,'Which&nbsp;of&nbsp;the&nbsp;following&nbsp;operators&nbsp;cant&nbsp;be&nbsp;overloaded?','A',NULL,2),(24,9,'Generic&nbsp;catch&nbsp;handler&nbsp;is&nbsp;represented&nbsp;by','C',NULL,2),(25,10,'Destructor&nbsp;can&nbsp;have&nbsp;following&nbsp;number&nbsp;of&nbsp;argument','B',NULL,2),(26,11,'Runtime&nbsp;polymorphism&nbsp;can&nbsp;be&nbsp;achieved&nbsp;with','C',NULL,2),(27,12,'In&nbsp;C++&nbsp;how&nbsp;many&nbsp;return&nbsp;statements&nbsp;are&nbsp;allowed&nbsp;in&nbsp;a&nbsp;non-void&nbsp;function?','B',NULL,2),(28,13,'Following&nbsp;is&nbsp;the&nbsp;dereferencing&nbsp;operator','D',NULL,2),(29,14,'Whats&nbsp;happen&nbsp;if&nbsp;base&nbsp;condition&nbsp;is&nbsp;not&nbsp;defined&nbsp;in&nbsp;recursion&nbsp;?','D',NULL,2),(30,15,'If&nbsp;a&nbsp;class&nbsp;contains&nbsp;pure&nbsp;virtual&nbsp;function,&nbsp;then&nbsp;it&nbsp;is&nbsp;termed&nbsp;as','C',NULL,2),(31,1,'We all have our ....... to bear so I should be grateful if you would stop complaining all the time.','C',NULL,1),(32,2,'There is really nothing much you can do to stop it and I\'m afraid you\'ll just have to ....... and bear it.','D',NULL,1),(33,3,'I hope you can be patient for a little longer and bear ....... me while I try and solve the problem.','B',NULL,1),(34,4,'She has been proved right in everything she did as the report quite clearly bears ........','A',NULL,1),(35,5,'The judge dismissed the new evidence completely because it had no bearing ....... the trial.','B',NULL,1);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questiontypes`
--

DROP TABLE IF EXISTS `questiontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questiontypes` (
  `questiontypeid` int(11) NOT NULL AUTO_INCREMENT,
  `questiontypename` text,
  PRIMARY KEY (`questiontypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questiontypes`
--

LOCK TABLES `questiontypes` WRITE;
/*!40000 ALTER TABLE `questiontypes` DISABLE KEYS */;
INSERT INTO `questiontypes` VALUES (1,'TOEIC'),(2,'PROGRAMING');
/*!40000 ALTER TABLE `questiontypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `resultid` int(11) NOT NULL AUTO_INCREMENT,
  `point` float DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `testid` int(11) DEFAULT NULL,
  PRIMARY KEY (`resultid`),
  KEY `FK_Tests_idx` (`testid`),
  KEY `FK_Users_Subjects_idx` (`userid`),
  CONSTRAINT `FK_Test_Results` FOREIGN KEY (`testid`) REFERENCES `tests` (`testid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Users_Results` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,6,1,1),(2,7,2,1),(3,8,3,2),(4,9,4,2),(5,8,1,2);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'Manage Question '),(3,'Manage Exam'),(4,'Student');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `subjectid` int(11) NOT NULL AUTO_INCREMENT,
  `subjectname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subjectid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'CNPM'),(2,'TOEIC'),(3,'LTW');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_question`
--

DROP TABLE IF EXISTS `test_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_question` (
  `testid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`testid`,`questionid`),
  KEY `FK_Questions_idx` (`questionid`),
  CONSTRAINT `FK_Questions_Test` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Tests_Question` FOREIGN KEY (`testid`) REFERENCES `tests` (`testid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_question`
--

LOCK TABLES `test_question` WRITE;
/*!40000 ALTER TABLE `test_question` DISABLE KEYS */;
INSERT INTO `test_question` VALUES (1,1),(5,1),(1,2),(5,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(4,31),(4,32),(4,33),(4,34),(4,35);
/*!40000 ALTER TABLE `test_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `testid` int(11) NOT NULL AUTO_INCREMENT,
  `datetimestart` datetime DEFAULT NULL,
  `datetimeend` datetime DEFAULT NULL,
  `time` time DEFAULT NULL,
  `numberquestion` int(11) DEFAULT NULL,
  `testtypeid` int(11) DEFAULT NULL,
  `subjectid` int(11) DEFAULT NULL,
  PRIMARY KEY (`testid`),
  KEY `FK_Subjects_idx` (`subjectid`),
  KEY `FK_Testtype_idx` (`testtypeid`),
  CONSTRAINT `FK_Subjects` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Testtype` FOREIGN KEY (`testtypeid`) REFERENCES `testtypes` (`testtypeid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'2017-12-01 00:00:00','2017-12-29 10:00:00','00:05:00',5,1,2),(2,'2017-12-01 00:00:00','2017-12-01 00:00:00','00:10:00',10,3,1),(3,'2017-12-01 00:00:00','2017-12-29 00:00:00','01:00:00',15,2,3),(4,'2017-12-01 00:00:00','2017-12-01 00:00:00','00:15:00',5,1,2),(5,'2017-12-11 02:31:00','2017-12-12 03:24:00','00:15:00',2,3,3);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtypes`
--

DROP TABLE IF EXISTS `testtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testtypes` (
  `testtypeid` int(11) NOT NULL AUTO_INCREMENT,
  `testtypename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`testtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtypes`
--

LOCK TABLES `testtypes` WRITE;
/*!40000 ALTER TABLE `testtypes` DISABLE KEYS */;
INSERT INTO `testtypes` VALUES (1,'Kiểm tra 5 phút'),(2,'Kiểm tra 60 phút'),(3,'Kiểm tra 10 phút');
/*!40000 ALTER TABLE `testtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_swedish_ci DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `country` text,
  `phone` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `classid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `user_role` (`roleid`),
  CONSTRAINT `user_role` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123','Nguyễn Quang Huy','1997-06-20','Quảng Ngãi','01668659489','huy.png',1,0),(2,'dieu','123','Lương Xuân Diệu','1995-02-04','Buôn Mê Thuột','01234567654','dieu.jpg',3,0),(3,'trung','123','Lưu Quang Trung','1997-02-03','Vũng Tàu','01239876780','trung.jpg',4,1),(4,'hoang','123','Trần Kim Hoàng','1997-04-02','Tp Hồ Chí Minh','01987123429','hoang.jpg',2,0),(5,'huy','123','Nguyễn Quang Huy','1997-06-20','Quảng Ngãi','01668659489','huy.jpg',4,1),(6,'15110215','123','Nguyễn Quang Huy','2012-01-01','Quảng Ngãi','01668659489','huy.jpg',4,1),(7,'15110215','15110215','Nguyễn Quang Huy','1997-02-03','Quảng Ngãi','01668659489','huy.jpg',4,5),(8,'15110216','15110216','Nguyễn Quang Huy','1997-02-04','Quảng Ngãi','01668659589','huy.jpg',4,5),(9,'15110217','15110217','Nguyễn Quang Huy','1997-02-05','Quảng Ngãi','01668659689','huy.jpg',4,5),(10,'15110218','15110218','Nguyễn Quang Huy','1997-02-06','Quảng Ngãi','01668659789','huy.jpg',4,5),(11,'15110219','15110219','Nguyễn Quang Huy','1997-02-07','Quảng Ngãi','01668659889','huy.jpg',4,5),(12,'15110220','15110220','Nguyễn Quang Huy','1997-02-08','Quảng Ngãi','01668659989','huy.jpg',4,5),(13,'15110221','15110221','Nguyễn Quang Huy','1997-02-09','Quảng Ngãi','01668660089','huy.jpg',4,5);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_subjects`
--

DROP TABLE IF EXISTS `users_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_subjects` (
  `userid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`subjectid`),
  KEY `FK_Subjects_idx` (`subjectid`),
  CONSTRAINT `FK_Subjects_Users` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_User_Subjects` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_subjects`
--

LOCK TABLES `users_subjects` WRITE;
/*!40000 ALTER TABLE `users_subjects` DISABLE KEYS */;
INSERT INTO `users_subjects` VALUES (3,1),(3,2),(5,2),(3,3),(5,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3);
/*!40000 ALTER TABLE `users_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'examonline'
--

--
-- Dumping routines for database 'examonline'
--
/*!50003 DROP PROCEDURE IF EXISTS `pr_CreateTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_CreateTest`(
in _datestart nvarchar(45),
in _dateend nvarchar(45),
in _time time,
in _number int,
in _testtypeid int,
in _subjectid int,
in _classid int,
in _questiontypeid int
)
BEGIN
	
	declare i int default 0;
    declare t int default 0;
    declare countrow int;
    declare _questionid int;
    declare _testid int;
    
    insert into tests(datetimestart,datetimeend,time,numberquestion,
    testtypeid,subjectid)
    value(_datestart,_dateend,_time,_number,_testtypeid,_subjectid );
    
    insert into classes_tests(classid,testid)
    value(_classid, (select testid from tests ORDER BY testid DESC LIMIT 1));
    
	while(i<_number) do
		set i=i+1;
        set countrow = (select count(*) from questions);
            
            set _testid = (select testid from tests ORDER BY testid DESC LIMIT 1);
        
			set _questionid = (SELECT questionid
            FROM (select * from questions where questiontypeid=_questiontypeid
            order by RAND())  AS ID limit 1);
            
         if(_questionid not in (select questionid from test_question)) then
					insert into test_question(testid, questionid)
					value( _testid ,_questionid);
				else 
					while(_questionid in (select questionid from test_question) and t<countrow) do
						set t = t+1;
						set _questionid = (SELECT questionid
						FROM (select * from questions where questiontypeid=2
						order by RAND())  AS ID limit 1);
					end while;
					if(_questionid not in (select questionid from test_question)) then
						insert into test_question(testid, questionid)
						value( _testid ,_questionid);
					end if;
				end if;
		end while; 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_DeleteExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DeleteExam`(
in _testid int,
in _number int
)
BEGIN
	declare i int default 0;
	delete from results where results.testid=_testid;
    delete from classes_tests where classes_tests.testid=_testid;
    while(i<_number) do 
		set i=i+1; 
		delete from test_question where test_question.testid=_testid;
    end while;
    delete from tests where tests.testid=_testid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_DemoCreateTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DemoCreateTest`(
in _number int,
in _questiontypeid int
)
BEGIN
	
    declare i int default 0;
    declare t int default 0;
    declare countrow int;
    declare _questionid int;
    declare _testid int;
	 while(i<_number) do
		set i=i+1;
        set countrow = (select count(*) from questions);
            
            set _testid = (select testid from tests ORDER BY testid DESC LIMIT 1);
        
			set _questionid = (SELECT questionid
            FROM (select * from questions where questiontypeid=2
            order by RAND())  AS ID limit 1);
            
         if(_questionid not in (select quesitonid from test_question)) then
					insert into test_question(testid, quesitonid)
					value( _testid ,_questionid);
				else 
					while(_questionid in (select quesitonid from test_question) and t<countrow) do
						set t = t+1;
						set _questionid = (SELECT questionid
						FROM (select * from questions where questiontypeid=2
						order by RAND())  AS ID limit 1);
					end while;
					if(_questionid not in (select quesitonid from test_question)) then
						insert into test_question(testid, quesitonid)
						value( _testid ,_questionid);
					end if;
				end if;
		end while;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_DontExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DontExam`(
in _start int,
in _count int)
BEGIN
	select distinct users.userid, users.username,users.fullname, classes.classname
	from users , results, classes
	where not exists (select * from results
				where users.userid= results.userid 
                limit _start,_count)
	group by users.userid, resultid asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_HaveExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_HaveExam`(
in _start int,
in _count int)
BEGIN
	select results.resultid,users.userid,users.username,
    users.fullname,results.point, tests.testid
	from users,results,tests
	where users.userid=results.userid 
	and results.testid= tests.testid
    limit _start,_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_InsertAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_InsertAccount`(
in _username nvarchar(45),
in _pass nvarchar(45),
in _fullname nvarchar(45),
in _birthday nvarchar(45),
in _country nvarchar(45),
in _phone nvarchar(45),
in _image nvarchar(45),
in _roleid nvarchar(45),
in _classid nvarchar(45),
in _subjectid nvarchar(45)
)
BEGIN
	insert into  users( username, pass, fullname,
    birthday,country, phone, image, roleid, classid)
    value(_username,_pass,_fullname,_birthday,_country,
    _phone,_image,_roleid,_classid);
    
    insert into classes_user(classid, userid)
    value(_classid, (select userid from users ORDER BY userid DESC LIMIT 1));
	
    insert into users_subjects(userid, subjectid)
    value((select userid from users ORDER BY userid DESC LIMIT 1),_subjectid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_InsertOption` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_InsertOption`(
in _optionname nvarchar(45),
in _isanswer boolean
)
BEGIN
	declare id int  default 0;
    set id = (select questionid from questions ORDER BY questionid DESC LIMIT 1);
   
	insert into options(questionid,optionname,isanswer)
	value(id,_optionname,_isanswer);

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_InsertQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_InsertQuestion`(
in _number int ,
in _contentquestion nvarchar(45),
in _correctoption nvarchar(45),
in _mediaid int,
in _questiontypeid int
)
BEGIN

    
	insert into questions (number, contentquestion,correctoption, mediaid,questiontypeid)
    value(_number,_contentquestion,_correctoption,_mediaid,_questiontypeid);
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_ListClassExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_ListClassExam`(
in _start int ,
in _end int)
BEGIN

	 SELECT 
        `c`.`classid` AS `classid`,
        `c`.`classname` AS `classname`,
        `s`.`subjectname` AS `subjectname`,
        `tp`.`testtypename` AS `testtypemame`,
        `t`.`testid` AS `testid`
    FROM
        ((((`classes` `c`
        JOIN `classes_tests` `ct` ON ((`c`.`classid` = `ct`.`classid`)))
        JOIN `tests` `t` ON ((`t`.`testid` = `ct`.`testid`)))
        JOIN `testtypes` `tp` ON ((`tp`.`testtypeid` = `t`.`testtypeid`)))
        JOIN `subjects` `s` ON ((`t`.`subjectid` = `s`.`subjectid`)))
        group by `c`.`classid`
        limit _start,_end;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_UpdateExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_UpdateExam`(
in _datestart nvarchar(45),
in _dateend nvarchar(45),
in _time time,
in _number int,
in _testtypeid int,
in _subjectid int,
in _testid int
)
BEGIN
    
    update tests set datetimestart=_datestart,datetimeend=_dateend,
    time=_time,numberquestion=_number,testtypeid=_testtypeid,
    subjectid=_subjectid where tests.testid=_testid;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_UpdateResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_UpdateResult`(
in _resultid int,
in _userid int,
in _point int,
in _testid int)
BEGIN
	update results set userid=_userid,point=_point,testid=_testid
    where resultid=_resultid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_UpdateTimeExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_UpdateTimeExam`(
in _testid int,
in _datestart nvarchar(45),
in _dateend nvarchar(45),
in _time time
)
BEGIN
	
    update tests set datetimestart=_datestart, datetimeend=_dateend,
    time=_time where testid=_testid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_ViewListTestSheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_ViewListTestSheet`(
in start int,
in end int )
BEGIN

    select T.testid, testtypename, classname, subjectname, datetimestart, datetimeend, numberquestion, time  
    from tests as T 
    inner join classes_tests as CT on T.testid=CT.testid 
    inner join classes on classes.classid=CT.classid 
    inner join subjects as S on T.subjectid= S.subjectid
    inner join testtypes as TT on T.testtypeid=TT.testtypeid group by T.testid limit start,end; 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_dQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_dQuestion`(
	in _questionid int)
BEGIN
	delete from options where questionid=_questionid;
    delete from test_question where questionid=_questionid;
    delete from questions where questionid=_questionid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_dQuestiontype` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_dQuestiontype`(
	in _questiontypeid int)
BEGIN
	delete from options where questionid in (select questionid from questions where questiontypeid=_questiontypeid);
	delete from questions where questiontypeid=_questiontypeid;
	delete from questiontypes where questiontypeid=_questiontypeid; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_iOption` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_iOption`(
in _optionname nvarchar(45),
in _isanswer boolean
)
BEGIN
	declare _questionid int  default 0;
    set _questionid = (select questionid from questions ORDER BY questionid DESC LIMIT 1);
   
	insert into options(questionid,optionname,isanswer)
	value(_questionid,_optionname,_isanswer);

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_iQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_iQuestion`(
in _number int ,
in _contentquestion nvarchar(45),
in _correctoption nvarchar(45),
in _mediaid int,
in _questiontypeid int
)
BEGIN

	insert into questions (number, contentquestion,correctoption, mediaid,questiontypeid)
    value(_number,_contentquestion,_correctoption,_mediaid,_questiontypeid);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_iQuestiontype` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_iQuestiontype`(
in _questiontypename nvarchar(45)

)
BEGIN
	insert into questiontypes (questiontypename)
    value(_questiontypename);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `listclassexamview`
--

/*!50001 DROP VIEW IF EXISTS `listclassexamview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listclassexamview` AS select 1 AS `classid`,1 AS `classname`,1 AS `subjectname`,1 AS `testtypemame`,1 AS `testid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-22 15:20:52
