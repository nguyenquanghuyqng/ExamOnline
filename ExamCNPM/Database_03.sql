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
INSERT INTO `classes_tests` VALUES (1,1),(1,2),(2,2);
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
INSERT INTO `classes_user` VALUES (1,1),(2,1),(3,1),(4,2),(5,2);
/*!40000 ALTER TABLE `classes_user` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias`
--

LOCK TABLES `medias` WRITE;
/*!40000 ALTER TABLE `medias` DISABLE KEYS */;
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
  `isanswer` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`optionid`),
  KEY `FK_Qustion_Option_idx` (`questionid`),
  CONSTRAINT `FK_Question_Option` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,11,'A.Then',0),(1,12,'B.Which',0),(1,13,'C.Who',1),(1,14,'D.If',0),(2,21,'A.Infact',0),(2,22,'B.Recently',0),(2,23,'C.Although',1),(2,24,'D.Also',0),(3,31,'A.Addition',1),(3,32,'B.Increased',0),(3,33,'C.Division',0),(3,34,'D.Additional',0),(4,41,'A. Opportunism',0),(4,42,'B.Opportunities',1),(4,43,'C.Favorable',0),(4,44,'D.Chances',0),(5,51,'A. Widest',0),(5,52,'B. Highest',1),(5,53,'C. Least',0),(5,54,'D. Deepest',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'We have two employees ……….create new marketing strategies.','C',NULL,1),(2,2,' ……….he attended the conference, he didn’t think it was very informative.','C',NULL,1),(3,3,'Richard Furst, a specialist in copyright law, is the most recent ……….to our staff','A',NULL,1),(4,4,'With computer programming experience job ……….increase.','B',NULL,1),(5,5,'Company profits reached $ 6 billion in September, the ……….of the decade.','B',NULL,1);
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
INSERT INTO `questiontypes` VALUES (1,'Toeic'),(2,'Math');
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
INSERT INTO `results` VALUES (1,6.5,1,2),(2,7.9,1,1),(3,8,2,1),(4,9,3,1),(5,7.9,4,2);
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
INSERT INTO `subjects` VALUES (1,'English'),(2,'Math'),(3,'C/C++');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,NULL,NULL,NULL,NULL,1,1),(2,NULL,NULL,NULL,NULL,2,2),(3,NULL,NULL,NULL,NULL,2,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtypes`
--

LOCK TABLES `testtypes` WRITE;
/*!40000 ALTER TABLE `testtypes` DISABLE KEYS */;
INSERT INTO `testtypes` VALUES (1,'MiniTest'),(2,'MediumTest');
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
  `birthday` date DEFAULT NULL,
  `country` text,
  `phone` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `classid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `user_role` (`roleid`),
  CONSTRAINT `user_role` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123','Nguyễn Quang Huy','1997-06-20','Quảng Ngãi','01668659489','huy.png',1,1),(2,'dieu','123','Lương Xuân Diệu','1995-02-04','Buôn Mê Thuột','01234567654','dieu.png',3,1),(3,'trung','123','Lưu Quang Trung','1997-02-03','Vũng Tàu','01239876780','trung.png',4,1),(4,'hoang','123','Trần Kim Hoàng','1997-04-02','Tp Hồ Chí Minh','01987123422','hoang.png',2,1),(5,'huy','123','Nguyễn Quang Huy','1997-06-20','Quảng Ngãi','01668659489','huy.png',1,NULL);
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
/*!40000 ALTER TABLE `users_subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 17:48:42
