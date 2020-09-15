-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: thesis
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `all_subjects`
--

DROP TABLE IF EXISTS `all_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_subjects` (
  `all_subjectname` varchar(70) NOT NULL,
  `all_subjectid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`all_subjectid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_subjects`
--

LOCK TABLES `all_subjects` WRITE;
/*!40000 ALTER TABLE `all_subjects` DISABLE KEYS */;
INSERT INTO `all_subjects` VALUES ('Anthropology\r',1),('Archaeology\r',2),('Area Studies\r',3),('Cultural and Ethnic Studies\r',4),('Economics\r',5),('Gender and Sexuality Studies\r',6),('Geography\r',7),('Political Science\r',8),('Psychology\r',9),('Sociology\r',10),('Chemistry\r',11),('Earth Sciences\r',12),('Life Sciences\r',13),('Physics\r',14),('Space Sciences\r',15),('Computer Sciences\r',16),('Logic\r',17),('Mathematics\r',18),('Statistics\r',19),('Systems Science\r',20),('Agriculture\r',21),('Architecture and Design\r',22),('Business\r',23),('Divinity\r',24),('Education\r',25),('Engineering\r',26),('Environmental Studies and Forestry\r',27),('Family and Consumer Science\r',28),('Health Sciences\r',29),('Human Physical Performance and Recreation*\r',30),('Journalism, Media Studies and Communication\r',31),('Law\r',32),('Library and Museum Studies\r',33),('Military Sciences\r',34),('Public Administration\r',35),('Social Work\r',36),('Transportation',37);
/*!40000 ALTER TABLE `all_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_grade_student`
--

DROP TABLE IF EXISTS `class_grade_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_grade_student` (
  `student_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_grade` int(11) NOT NULL,
  PRIMARY KEY (`student_class_id`),
  UNIQUE KEY `class_grade` (`class_grade`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_grade_student`
--

LOCK TABLES `class_grade_student` WRITE;
/*!40000 ALTER TABLE `class_grade_student` DISABLE KEYS */;
INSERT INTO `class_grade_student` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12);
/*!40000 ALTER TABLE `class_grade_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_grade` int(11) NOT NULL,
  `class_code` int(11) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  `days` varchar(30) NOT NULL,
  `start_time` varchar(30) NOT NULL DEFAULT '2010-01-01',
  `end_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `subjectid` int(11) NOT NULL,
  `teacherid` bigint(20) NOT NULL,
  `nim` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_code` (`class_code`),
  KEY `classes_ibfk_1` (`subjectid`),
  KEY `classes_ibfk_2` (`teacherid`),
  KEY `classes_ibfk_3` (`nim`),
  KEY `class_grade` (`class_grade`),
  KEY `start_time` (`start_time`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`),
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`),
  CONSTRAINT `classes_ibfk_3` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`),
  CONSTRAINT `classes_ibfk_4` FOREIGN KEY (`class_grade`) REFERENCES `class_grade_student` (`class_grade`),
  CONSTRAINT `classes_ibfk_5` FOREIGN KEY (`start_time`) REFERENCES `academic_year` (`year_name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (2,1,42485,'56XR','Moday','06/03/2020','2020-06-30 13:25:00',89124,43632372818789,83789553791438),(3,1,95819,'WRTJ','Moday','06/03/2020','2020-06-30 13:40:00',23412,43632372818789,9932532004883),(4,2,60908,'FHIB','Moday','06/03/2020','2020-06-30 13:42:00',23412,43632372818789,83789553791438),(5,1,41603,'WSD9','Moday','06/03/2019','2020-06-30 13:58:00',35216,43632372818789,83789553791438),(6,1,4635,'LA5G','Moday','06/03/2019','2020-06-25 14:02:00',54566,43632372818789,83789553791438),(7,2,88533,'JX57','Tuesday','06/03/2019','2020-06-06 14:04:00',30183,43632372818789,17034213768553),(8,5,10964,'B4YU','Moday','06/03/2020','2020-06-30 14:24:00',11511,43632372818789,17034213768553),(9,3,28822,'PLCE','Moday','06/03/2020','2020-09-16 15:40:00',26156,17352183302292,83789553791438),(11,2,21309,'OMFJ','Wednesday','06/03/2020','2020-09-10 15:43:00',23412,18154898755021,83789553791438);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family` (
  `family_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `familyname` varchar(30) NOT NULL,
  `familyjob` varchar(30) NOT NULL,
  `familyincome` varchar(30) NOT NULL,
  PRIMARY KEY (`family_id`),
  KEY `nim` (`nim`),
  CONSTRAINT `family_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
INSERT INTO `family` VALUES (1,83789553791438,'asdf','asdf','48832'),(2,88900252966804,'asdfasdasdf','asdfasdf','234'),(3,5428577213337,'asdfasdf','aasdfasd','234');
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `teacherid` bigint(20) NOT NULL,
  `file_title` varchar(30) NOT NULL,
  `file_description` text NOT NULL,
  `file_attachment` blob NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`file_id`),
  KEY `nim` (`nim`),
  KEY `teacherid` (`teacherid`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`),
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (2,83789553791438,43632372818789,'asdf','asdfasdf','java.jpg','2020-07-27 04:09:07'),(3,83789553791438,43632372818789,'asdfas','fasdfasdfasdf','2020 MIS FAQ.docx','2020-08-03 10:43:57'),(4,83789553791438,43632372818789,'asdfasdf','asdfasdfasdf','Scanned Document 2.pdf','2020-08-03 10:44:14'),(6,83789553791438,43632372818789,'asdf','asdf','1.PNG','2020-08-28 03:13:43');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades` (
  `grade_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grade_number` int(10) unsigned NOT NULL DEFAULT 0,
  `nim` bigint(20) NOT NULL,
  `teacherid` bigint(20) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `class_grade_id` int(11) NOT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `nim` (`nim`),
  KEY `teacherid` (`teacherid`),
  KEY `subjectid` (`subjectid`),
  KEY `class_grade_id` (`class_grade_id`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`),
  CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`),
  CONSTRAINT `grades_ibfk_4` FOREIGN KEY (`class_grade_id`) REFERENCES `classes` (`class_grade`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,100,9932532004883,43632372818789,23412,1),(2,100,83789553791438,43632372818789,73218,1),(5,90,83789553791438,43632372818789,35216,1),(6,50,83789553791438,43632372818789,23412,1),(7,50,83789553791438,43632372818789,23412,2);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_nim` bigint(20) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_pass` text NOT NULL,
  `admin_conpass` text NOT NULL,
  `admin_image` blob DEFAULT NULL,
  `admin_level` varchar(15) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_nim` (`admin_nim`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,11160930000120,'Saboor','saboorhamedi49@gmail.com','$2y$10$s11fYbAlIeadjk7MtoVEE.UgGTRKQ5zxe7bpXC3fXEsgxJ6I6aK9S','saboor','1592154226_IMG_0066.JPG','admin'),(2,11160930000192,'New admin','newadminy@yahoo.com','$2y$10$pZrNxz/1k3ZQjgCdwFN.8OlwWtMb2i3dfhFJSj4HN/e3aeXN.KjIS','123','1592747020_back5.jpg','admin'),(3,78869645874447,'asdf','asdfasfdas@gmail.com','$2y$10$2rjp7/RDMYsJyr50IVA3JukBuK1iXsU/ZmsenGg.LwFfIWhFv3sIC','123','1595009670_CMFJE7150.JPG','admin'),(4,56796499879463,'123','123@yahoo.com','$2y$10$i1m9iP2OszyVZtAsR9NB/u1Q/2XUCiNCIQ1oe5Mc8BxzHwRmNMim6','123','1598497340_add new family.JPG',''),(5,77977739779684,'asfd','asdf@gmail.com','$2y$10$i7ijeXlkRooOvsocGIEBxeTtkz7weoXCEhTOX/jnh7Q23VxM2DSny','123','1598515128_2.PNG',''),(6,64447884673686,'NEW ADMIN','NEWADMIN@GMAIL.COM','$2y$10$w8DwJW/JXkShTLmW3NYJUeCQ/CZLx5olYL5YlCdl/zl.CjXG9Gt4q','123','1598582561_1.PNG','');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent` (
  `parent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `family_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`parent_id`),
  KEY `nim` (`nim`),
  KEY `family_id` (`family_id`),
  CONSTRAINT `parent_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `parent_ibfk_2` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (1,83789553791438,1);
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professions`
--

DROP TABLE IF EXISTS `professions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professions` (
  `profession_id` int(11) NOT NULL AUTO_INCREMENT,
  `profession_name` varchar(30) NOT NULL,
  PRIMARY KEY (`profession_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professions`
--

LOCK TABLES `professions` WRITE;
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
INSERT INTO `professions` VALUES (1,'HTML'),(2,'Art\r'),(3,'Citizenship\r'),(4,' Geography\r'),(6,' History\r'),(7,'Languages (French, German, Spa'),(8,'Literacy\r'),(9,'Music\r'),(11,' Natural history\r'),(12,' Personal, social and health e'),(13,' Science\r'),(14,' Arithmetic\r'),(15,' Social Studies\r'),(16,'Reading\r'),(17,' Writing\r'),(18,'Information and communication '),(19,'Languages\r'),(20,'Mathematics\r'),(21,'Modern studies\r'),(22,'Music\r'),(23,' PE: Physical education\r'),(24,' P.S.H.E: Personal, social and'),(25,' RE: Religious education\r'),(26,' Science\r'),(27,'Study skills\r'),(28,'Physics\r'),(29,'Religion\r'),(30,'Woodwork\r'),(31,' Sociology\r'),(32,'Psychology\r'),(33,'H.ome economics\r'),(34,'Critical reading');
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `country` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `student_level` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nim` (`nim`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,83789553791438,'saboor','hamedi','Indonesia','kfjlaksdf@gmail.com',12,'askdfjlkj','123','student'),(2,9932532004883,'Liam','Emma','asdfasdf','asdfasd@gmail.com',5,'alsfj','22','student'),(3,5428577213337,'Noah','Olivia','China','sfasd@gmail.com',12,'asdfasf','123','student'),(4,22092393858586,'James	','Isabella','French','asdf@gmail.com',21,'asd','1','student'),(9,17034213768553,'Benjamin','Charlotte','Afghanistan','asdfas@gmail.com',12,'aslfjk','123','student'),(10,54141807378939,'kjhk','klhk','asdf','kjhgkjghjh@gmai.com',15,'asdf','adsf','student'),(11,88900252966804,'lkjfasdk','asldkfj','asdkfjl','aldjlaksdj@gmail.com',7,'asdf','123','student'),(12,3276035011464,'sdf','sdf','sdf','asd@gmail.com',15,'asd','asd','student'),(13,62960424079990,'asdfasdf','asd','asdfasdf','asdfasdf@gmail.com',17,'asdf','asdf','student'),(14,62498751658254,'asdfasd','asdf','asdf','sadfsad199@yahoo.com',12,'asdfsdf','asdfasdf','student'),(15,65384502317782,'asdf','asdf','asdfasd','alajs98@yahoo.com',8,'aksdjfkj','aldjkf','student'),(16,12926861659608,'asdfas','asdfas','asdfasd','asdfas@yahoo.com',7,'laksdjflk','lkajsdf','student'),(17,84614188815285,'asdf','asd','asdf','asdf72@yahoo.com',9,'asdjfl','lkajsdkl','student'),(18,19654297179939,'asdfasd','asdf','asdf','asdfasdf@gmail.com',8,'alsdjf','lkajsdlfk','student'),(23,324523452345234,'','codeigniter','asdfasdfa','asdfasdf',0,'asdfasdf','asdfasdf','student'),(26,3245234523452,'','codeigniter','asdfasdfa','asdfasdf',0,'asdfasdf','asdfasdf','student'),(28,32452345234521,'','codeigniter','asdfasdfa','asdfasdf',0,'asdfasdf','asdfasdf','student'),(30,324523452345211,'','codeigniter','asdfasdfa','asdfasdf',0,'asdfasdf','asdfasdf','student'),(33,34523452345,'','asdfasd','fasdfasdf','asdfasdf',0,'asdfasdf','asdfasdf','student'),(36,12452345234,'asdfasdf','adfasdf','adfasdf','asdfasdfasdf',0,'asdfasdf','asdfasdf','student'),(44,345234523452345,'adsfasdf','asdfasd','adfasdf','asdfasdf',0,'asdfasdf','asdfasdf','student'),(45,2341234512345345,'asdfasdf','asdfasd','asdfasdf','asdfasd',23,'asdfasd','asdfasdf','student'),(46,234123452345234,'adsfasdf','asdfasd','asdfasd','asdfasdf',12,'asdfasdf','sdfsdf','student'),(47,345634562345,'asdfasdf','asdf','asdfasdf','asdfasdf',12,'adfasdf','asdfasdf','student'),(48,345623634563456,'code 12','code 123','asdlfjk','a;ldfjlj@gmail.com',18,'klajsdf','alfj','student'),(49,34563456232345,'asdfasdf','asdf','asdfasd','asdfasd',12,'asdf','asdfasdf','student'),(50,27054705240581,'Seminar','test','test','test@gmail.com',10,'Indonesia','123','student'),(51,42803670603152,'new','new','new','new@gmail.com',5,'America','123','');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subjectid` int(11) NOT NULL,
  `subjectname` varchar(30) NOT NULL,
  `subjectcode` varchar(15) NOT NULL,
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `subjectid` (`subjectid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,73218,'Language Arts','L1AS'),(2,89124,'Language Arts','ALU1'),(4,23412,'History','H13D'),(5,35216,'Music','YN7U'),(6,9314,'Anthropology','L8JY'),(7,26156,'Area Studies','KTWA'),(8,11511,'Geography','TOBK'),(9,9298,'Area Studies','BGC1'),(10,54566,'Physics','6AV7'),(11,28297,'Mathematics','HTBG'),(12,30183,'Life Sciences','KLWT'),(13,5561,'Library and Museum Studies','ECUP'),(14,72186,'Gender and Sexuality Studies','4NPI'),(15,30011,'Logic','4861'),(16,25442,'Anthropology','PDXC');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `tec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacherid` bigint(20) NOT NULL,
  `tname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `address` varchar(70) NOT NULL,
  `country` varchar(30) NOT NULL,
  `profession` varchar(30) NOT NULL,
  `pass` text NOT NULL,
  PRIMARY KEY (`tec_id`),
  UNIQUE KEY `teacherid` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,43632372818789,'Wahid','Rahimi','Kabul','Afghanistan','Language professional','123'),(2,17352183302292,'Aahron','Seminar','asdfa','sdfd','HTML ','123'),(3,73401312312453,'Abrahaim','Abraham','asdf','asdf','HTML ','123'),(4,89643142801876,'Abrahame','Abrahamo','asdfasdf','asdfasd','HTML ','123'),(5,18154898755021,'Abrahem','Abrahim','asdfasd','asdfas','HTML ','123'),(6,47526615248432,'Abrahm','Abrahon','akjdfhj','ajksdk','HTML ','123'),(7,80605444465409,'sdf','asdf','asdfasdf','asdf','Languages (French, German, Spa','123'),(8,1524917062116,'ADD NEW ','ADD NEW ','KABUL','KABUL@GMAIL.COM','Art\r\n ','123');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_table`
--

DROP TABLE IF EXISTS `time_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_table` (
  `time_table_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `teacherid` bigint(20) NOT NULL,
  `class_grade` int(10) unsigned NOT NULL,
  `day_time` varchar(15) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`time_table_id`),
  KEY `time_table_ibfk_1` (`nim`),
  KEY `time_table_ibfk_2` (`subjectid`),
  KEY `time_table_ibfk_3` (`teacherid`),
  KEY `time_table_ibfk_4` (`class_grade`),
  CONSTRAINT `time_table_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `time_table_ibfk_2` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `time_table_ibfk_3` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_table`
--

LOCK TABLES `time_table` WRITE;
/*!40000 ALTER TABLE `time_table` DISABLE KEYS */;
INSERT INTO `time_table` VALUES (4,83789553791438,73218,43632372818789,1,'Tuesday','2020-06-19 04:54:00','2020-06-05 04:54:00'),(5,83789553791438,89124,43632372818789,1,'Monday','2020-06-16 06:18:00','2020-06-16 06:18:00'),(6,83789553791438,73218,43632372818789,4,'Tuesday','2020-06-06 06:23:00','2020-06-06 06:23:00');
/*!40000 ALTER TABLE `time_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_year` (
  `year_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year_name` varchar(30) NOT NULL,
  PRIMARY KEY (`year_id`),
  UNIQUE KEY `year_name` (`year_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_year`
--

LOCK TABLES `academic_year` WRITE;
/*!40000 ALTER TABLE `academic_year` DISABLE KEYS */;
INSERT INTO `academic_year` VALUES (2,'06/03/2019'),(1,'06/03/2020');
/*!40000 ALTER TABLE `academic_year` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-11 13:08:52
