-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: examcnpm
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
  `classid` int(11) NOT NULL,
  `classname` int(11) DEFAULT NULL,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `mediaid` int(11) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `media` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mediaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `questionid` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `contentquestion` text,
  `option1` text,
  `option2` text,
  `option3` text,
  `option4` text,
  `correctoption` varchar(45) DEFAULT NULL,
  `mediaid` int(11) DEFAULT NULL,
  `questiontypeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionid`),
  KEY `FK_Questions_QuestionType` (`questiontypeid`),
  CONSTRAINT `FK_Questions_QuestionType` FOREIGN KEY (`questiontypeid`) REFERENCES `questiontype` (`questiontypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'3+4 =','(A) 1','(B)8','(C)15','(D)7','(D)',1,1),(2,2,'4+50=','(A) 2','(B)9','(C)16','(D)54','(D)',1,2),(3,3,'6+8=','(A) 3','(B)10','(C)17','(D)14','(D)',1,1),(4,4,'8+8=','(A) 4','(B)11','(C)18','(D)16','(D)',1,2),(5,5,'5+5=','(A) 5','(B)12','(C)19','(D)10','(D)',1,1),(6,6,'4+4=','(A) 6','(B)13','(C)20','(D)8','(D)',1,2);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questiontype`
--

DROP TABLE IF EXISTS `questiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questiontype` (
  `questiontypeid` int(11) NOT NULL,
  `questiontypename` text,
  PRIMARY KEY (`questiontypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questiontype`
--

LOCK TABLES `questiontype` WRITE;
/*!40000 ALTER TABLE `questiontype` DISABLE KEYS */;
INSERT INTO `questiontype` VALUES (1,'Toan'),(2,'Ly'),(3,'Hoa');
/*!40000 ALTER TABLE `questiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resulttest`
--

DROP TABLE IF EXISTS `resulttest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resulttest` (
  `resulttestid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `point` double DEFAULT NULL,
  PRIMARY KEY (`resulttestid`),
  KEY `ResultTest_User` (`userid`),
  CONSTRAINT `ResultTest_User` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resulttest`
--

LOCK TABLES `resulttest` WRITE;
/*!40000 ALTER TABLE `resulttest` DISABLE KEYS */;
/*!40000 ALTER TABLE `resulttest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'user'),(3,'question manager'),(4,'exam manager');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testclass`
--

DROP TABLE IF EXISTS `testclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testclass` (
  `testid` int(11) NOT NULL,
  `classid` int(11) NOT NULL,
  PRIMARY KEY (`classid`,`testid`),
  KEY `FK_TClass_Test` (`testid`),
  CONSTRAINT `FK_TClass_Class` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`),
  CONSTRAINT `FK_TClass_Test` FOREIGN KEY (`testid`) REFERENCES `tests` (`testid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testclass`
--

LOCK TABLES `testclass` WRITE;
/*!40000 ALTER TABLE `testclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `testclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testquestion`
--

DROP TABLE IF EXISTS `testquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testquestion` (
  `testid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`questionid`,`testid`),
  KEY `FK_TQuestion_Test` (`testid`),
  CONSTRAINT `FK_TQuestion_Question` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`),
  CONSTRAINT `FK_TQuestion_Test` FOREIGN KEY (`testid`) REFERENCES `tests` (`testid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testquestion`
--

LOCK TABLES `testquestion` WRITE;
/*!40000 ALTER TABLE `testquestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `testquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `testid` int(11) NOT NULL,
  `testname` varchar(45) DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`testid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userclass`
--

DROP TABLE IF EXISTS `userclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userclass` (
  `userid` int(11) NOT NULL,
  `classid` int(11) NOT NULL,
  PRIMARY KEY (`classid`,`userid`),
  KEY `FK_UClass_User` (`userid`),
  CONSTRAINT `FK_UClass_Class` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`),
  CONSTRAINT `FK_UClass_User` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userclass`
--

LOCK TABLES `userclass` WRITE;
/*!40000 ALTER TABLE `userclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `userclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `country` text,
  `phone` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `user_role` (`roleid`),
  CONSTRAINT `user_role` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123','Nguyễn Quang Huy','20/06/1997','Quảng Ngãi','01668659489',NULL,1),(3,'15110215','15110215','Nguyễn Quang Huy','20/06/1997','Quảng Ngãi','01668659489','huy.jpg',2),(4,'15110216','15110216','Nguyễn Quang Huy','20/07/1997','Quảng Ngãi','01668659589','huy.jpg',2),(5,'15110217','15110217','Nguyễn Quang Huy','20/06/1998','Quảng Ngãi','01668659689','huy.jpg',2),(6,'15110218','15110218','Nguyễn Quang Huy','20/07/1998','Quảng Ngãi','01668659789','huy.jpg',2),(7,'15110219','15110219','Nguyễn Quang Huy','20/06/1999','Quảng Ngãi','01668659889','huy.jpg',2),(8,'15110220','15110220','Nguyễn Quang Huy','20/07/1999','Quảng Ngãi','01668659989','huy.jpg',2),(9,'15110221','15110221','Nguyễn Quang Huy','20/06/2000','Quảng Ngãi','01668660089','huy.jpg',2),(10,'huy','123','Nguyễn Quang Huy','20/07/2000','Quảng Ngãi','01668660189','huy.jpg',4),(11,'hoang','123','Nguyễn Quang Huy','20/06/1997','Quảng Ngãi','01668659489','huy.jpg',3),(12,'trung','123','Nguyễn Quang Huy','20/06/1997','Quảng Ngãi','01668659489','huy.jpg',2),(13,'15110215','15110215','Nguyễn Quang Huy','20/06/1997','Quảng Ngãi','01668659489','huy.jpg',2),(14,'15110215','15110215','Nguyễn Quang Huy','20/06/1998','Quảng Ngãi','01668659490','huy.jpg',2),(15,'15110215','15110215','Nguyễn Quang Huy','20/06/1997','Quảng Ngãi','01668659489','huy.jpg',2),(16,'15110215','15110215','Nguyễn Quang Huy','20/06/1998','Quảng Ngãi','01668659490','huy.jpg',2),(17,'15110215','15110215','Nguyễn Quang Huy','20/06/1997','Quảng Ngãi','01668659489','huy.jpg',2),(18,'15110215','15110215','Nguyễn Quang Huy','20/06/1998','Quảng Ngãi','01668659490','huy.jpg',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'examcnpm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-24 16:12:06
