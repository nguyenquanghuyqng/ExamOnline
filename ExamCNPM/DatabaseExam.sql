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
  `optionid` int(11) NOT NULL AUTO_INCREMENT,
  `optionname` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `quesitonid` int(11) DEFAULT NULL,
  PRIMARY KEY (`optionid`),
  KEY `FK_Qustion_Option_idx` (`quesitonid`),
  CONSTRAINT `FK_Qustion_Option` FOREIGN KEY (`quesitonid`) REFERENCES `questions` (`questionid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,NULL,NULL,NULL,NULL,1),(2,NULL,NULL,NULL,NULL,2);
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
  `quesitonid` int(11) NOT NULL,
  PRIMARY KEY (`testid`,`quesitonid`),
  KEY `FK_Questions_idx` (`quesitonid`),
  CONSTRAINT `FK_Questions_Test` FOREIGN KEY (`quesitonid`) REFERENCES `questions` (`questionid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,NULL,NULL,NULL,NULL,1,1),(2,NULL,NULL,NULL,NULL,2,2),(3,NULL,NULL,NULL,NULL,2,3),(4,'2017-12-13 09:36:16','2017-12-31 00:00:00','00:00:20',10,2,1),(5,NULL,NULL,'01:24:00',1234,2,3),(6,NULL,NULL,'14:34:00',435,2,2),(7,NULL,NULL,'14:34:00',435,2,2),(8,NULL,NULL,'14:34:00',435,2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123','Nguyễn Quang Huy','1997-06-20','Quảng Ngãi','01668659489','huy.png',1,1),(2,'dieu','123','Lương Xuân Diệu','1995-02-04','Buôn Mê Thuột','01234567654','dieu.png',3,1),(3,'trung','123','Lưu Quang Trung','1997-02-03','Vũng Tàu','01239876780','trung.png',4,1),(4,'hoang','123','Trần Kim Hoàng','1997-04-02','Tp Hồ Chí Minh','01987123422','hoang.png',2,1),(5,'huy','123','Nguyễn Quang Huy','1997-06-20','Quảng Ngãi','01668659489','huy.png',1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `examonline`.`tg_DeletAccount` BEFORE DELETE ON `users` FOR EACH ROW
BEGIN
	delete from results where results.userid= OLD.userid;
    delete from users_subjects where users_subjects.userid= OLD.userid;
    delete from classes_user where classes_user.userid= OLD.userid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
in _datestart datetime,
in _dateend datetime,
in _time time,
in _number int,
in _testtypeid int,
in _subjectid int,
in _classid int,
in _testid int
)
BEGIN
	
    insert into tests(datetimestart,datetimeend,time,numberquestion,
    testtypeid,subjectid)
    value(_datestart,_dateend,_time,_number,_testtypeid,_subjectid );
    
    insert into classes_tests(classid,testid)
    value(_classid, _testid);
    
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DontExam`()
BEGIN
	select distinct users.userid, users.username,users.fullname, classes.classname
	from users , results, classes
	where not exists (select * from results
				where users.userid= results.userid )
	group by users.userid;
                
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_HaveExam`()
BEGIN
	select results.resultid,users.userid,users.username,
    users.fullname,results.point, tests.testid
	from users,results,tests
	where users.userid=results.userid 
	and results.testid= tests.testid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 13:31:18
