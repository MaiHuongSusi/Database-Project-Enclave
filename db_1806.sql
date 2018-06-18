-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: mcts
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `ability`
--

DROP TABLE IF EXISTS `ability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ability_1_idx` (`user_id`),
  KEY `fk_ability_2_idx` (`skill_id`),
  CONSTRAINT `fk_ability_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ability_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ability`
--

LOCK TABLES `ability` WRITE;
/*!40000 ALTER TABLE `ability` DISABLE KEYS */;
INSERT INTO `ability` VALUES (1,10,1,12,1),(2,11,2,24,2);
/*!40000 ALTER TABLE `ability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `time_of_date` varchar(150) NOT NULL,
  `date_of_week` varchar(150) NOT NULL,
  `count_lesson` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `fk_classes_1_idx` (`course_id`),
  KEY `fk_classes_2_idx` (`room_id`),
  CONSTRAINT `fk_classes_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_classes_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (2,'2018-12-02 00:00:00','7:00','2,4,6',0,1,9,1,''),(3,'2018-12-02 00:00:00','7:00','2,4,6',0,2,10,1,''),(4,'2018-12-02 00:00:00','9:00','2,4,6',0,1,9,1,''),(5,'2018-12-02 00:00:00','10:00','3,5,7',0,1,10,2,''),(6,'2018-12-02 00:00:00','13:00','2,4',0,1,10,1,''),(7,'2018-12-02 00:00:00','14:00','2,6',0,1,9,2,'');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `duration` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `default` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `fk_courses_1_idx` (`major_id`),
  CONSTRAINT `fk_courses_1` FOREIGN KEY (`major_id`) REFERENCES `majors` (`major_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,3,'Training GIT',8,0,1),(2,2,'Speaking English',64,0,1),(3,2,'Write ',4,0,1),(4,1,'Basic Linux',8,0,1),(5,1,'JAVA CORE',54,0,1),(6,1,'JSP',60,0,0),(7,1,'HTML',40,0,0),(8,1,'SPRING',50,0,1),(9,2,'PHP',40,0,0);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning`
--

DROP TABLE IF EXISTS `learning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_learning_1_idx` (`user_id`),
  KEY `fk_learning_2_idx` (`class_id`),
  CONSTRAINT `fk_learning_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_learning_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning`
--

LOCK TABLES `learning` WRITE;
/*!40000 ALTER TABLE `learning` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majors`
--

DROP TABLE IF EXISTS `majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `majors` (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors`
--

LOCK TABLES `majors` WRITE;
/*!40000 ALTER TABLE `majors` DISABLE KEYS */;
INSERT INTO `majors` VALUES (1,'Technical'),(2,'English '),(3,'Soft Skill ');
/*!40000 ALTER TABLE `majors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `user_id` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'Hello Everyone!','1,2,3,4,5');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `fk_results_1_idx` (`class_id`),
  KEY `fk_results_2_idx` (`user_id`),
  CONSTRAINT `fk_results_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_results_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,1,3,4),(2,1,3,5),(3,1,3,6),(4,0,3,7);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Trainer\n'),(2,'Trainee\n'),(3,'Management Training\n');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'101',50,0),(2,'201',20,0),(3,'302',10,0),(4,'502',5,0),(5,'403',15,0),(6,'404',10,0),(7,'202',10,0);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'JAVA '),(2,'HTML'),(3,'CSS'),(4,'JSP'),(5,'NODEJS'),(6,'PHP'),(7,'GIT'),(8,'SPEAKING ENGLISH '),(9,'PYTHON '),(10,'RUBY '),(11,'SKYPE '),(12,'EMAIL');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `email` varchar(150) NOT NULL,
  `gender` int(11) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL,
  `notificatoin_id` varchar(1000) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_users_1_idx` (`role_id`),
  CONSTRAINT `fk_users_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'HungNguyen ','123456','Nguyen Van Hung ','1996-12-25 00:00:00','2018-12-24 00:00:00','nguyenhung@gmail.com ',1,'Da Nang ','0123648794',3,'1'),(5,'NamNguyen','123456','am Ngoc N','1996-12-25 00:00:00','2018-12-24 00:00:00','nguyenngocnam0@gmail.com ',1,'Da Nang ','0123648794',3,'1'),(6,'ViNguyenHuu','123456','Nguyen Huu V','1996-12-25 00:00:00','2018-12-24 00:00:00','nguyenhuuvi@gmail.com',1,'Da Nang ','0123648794',3,'1'),(7,'PhamHuong','123456','Pham Thi Mai Huong','1996-12-25 00:00:00','2018-12-24 00:00:00','phamthimaihuong@gmail.com ',1,'Da Nang ','0123648794',3,'1'),(8,'Luke','123456','Vo Van Loc','1985-12-20 00:00:00','2018-12-14 00:00:00','vovanloc@gmail.com',1,'Da Nang','012356874',1,'1'),(9,'Sunny','123456','Nguyen Thi Huong Duong','1985-12-20 00:00:00','2018-12-14 00:00:00','nguyenthihuongduong@gmail.com',1,'Da Nang','012356874',1,'1'),(10,'Tunner','123456','Nguyen Van Tung','1985-12-20 00:00:00','2018-12-14 00:00:00','nguyenvantung@gmail.com',1,'Da Nang','012356874',2,'1'),(11,'Henri','123456','Nguyen Van Hung','1985-12-20 00:00:00','2018-12-14 00:00:00','nguyenvantung@gmail.com',1,'Da Nang','012356874',2,'1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-18 17:09:14
