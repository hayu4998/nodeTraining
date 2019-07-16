-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `tbl_author`
--

DROP TABLE IF EXISTS `tbl_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_author` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `authorName` varchar(45) NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_author`
--

LOCK TABLES `tbl_author` WRITE;
/*!40000 ALTER TABLE `tbl_author` DISABLE KEYS */;
INSERT INTO `tbl_author` VALUES (1,'J.K.Rowling'),(2,'Kendra Elliot'),(3,'James Patterson'),(4,'George R. R. Martin'),(5,'Laura Hillenbrand'),(6,'Darven'),(7,'Albert Einstein'),(8,'Stephen hawking'),(9,'Benjamin Franklin'),(12,'Hao Yuan'),(21,'update book test Author');
/*!40000 ALTER TABLE `tbl_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book`
--

DROP TABLE IF EXISTS `tbl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `pubId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `fk_publisher` (`pubId`),
  CONSTRAINT `fk_publisher` FOREIGN KEY (`pubId`) REFERENCES `tbl_publisher` (`publisherId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book`
--

LOCK TABLES `tbl_book` WRITE;
/*!40000 ALTER TABLE `tbl_book` DISABLE KEYS */;
INSERT INTO `tbl_book` VALUES (1,'Harry Potter Collection',2),(2,'A Merciful Promise',4),(3,'Unbroken: A World War II Story',1),(4,'Unsolved(Invisible)',3),(6,'A Game of Thrones',2),(7,'Skin Care',8),(8,'Aerospace Crafting',7),(9,'Relative Theory',6),(10,'The autobiography of BENJAMIN FRANKLIN',1),(12,'Blackhole',6),(14,'Jason Potter',15),(15,'Jason\'s Book',15),(22,'Hello World',15),(31,'Update Book test 3',24);
/*!40000 ALTER TABLE `tbl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_authors`
--

DROP TABLE IF EXISTS `tbl_book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_authors` (
  `bookId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`bookId`,`authorId`),
  KEY `fk_tbl_book_authors_tbl_author1_idx` (`authorId`),
  CONSTRAINT `fk_tbl_book_authors_tbl_author1` FOREIGN KEY (`authorId`) REFERENCES `tbl_author` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_book_authors_tbl_book1` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_authors`
--

LOCK TABLES `tbl_book_authors` WRITE;
/*!40000 ALTER TABLE `tbl_book_authors` DISABLE KEYS */;
INSERT INTO `tbl_book_authors` VALUES (1,1),(14,1),(22,1),(31,1),(2,2),(22,2),(4,3),(6,4),(7,4),(3,5),(7,5),(8,6),(22,6),(9,7),(15,7),(12,8),(10,9),(14,12),(31,21);
/*!40000 ALTER TABLE `tbl_book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_copies`
--

DROP TABLE IF EXISTS `tbl_book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_copies` (
  `bookId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `noOfCopies` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`,`branchId`),
  KEY `fk_bc_book` (`bookId`),
  KEY `fk_bc_branch` (`branchId`),
  CONSTRAINT `fk_bc_book` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bc_branch` FOREIGN KEY (`branchId`) REFERENCES `tbl_library_branch` (`branchId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_copies`
--

LOCK TABLES `tbl_book_copies` WRITE;
/*!40000 ALTER TABLE `tbl_book_copies` DISABLE KEYS */;
INSERT INTO `tbl_book_copies` VALUES (1,1,3),(1,2,7),(1,3,6),(1,4,1),(2,2,5),(2,3,8),(2,5,10),(2,6,9),(2,7,9),(3,1,7),(3,3,7),(3,4,4),(3,5,8),(3,6,8),(3,7,3),(3,9,8),(4,1,8),(4,3,9),(4,4,8),(4,5,7),(4,6,8),(4,9,4),(6,1,3),(6,2,3),(6,3,3),(6,4,3),(6,5,3),(6,6,3),(6,7,3),(6,8,3),(6,9,3),(7,5,1),(7,6,5),(7,7,3),(8,4,5),(8,6,8),(8,7,7),(8,8,6),(8,9,9),(9,1,10),(9,2,8),(9,3,10),(9,4,9),(9,5,10),(9,6,10),(9,7,10),(9,8,10),(9,9,10),(10,1,8),(10,2,3),(10,3,10),(10,4,6),(10,5,8),(10,6,7),(10,7,10),(10,8,12),(10,9,11),(12,1,7),(12,2,6),(12,3,5),(12,4,7),(12,5,4),(12,6,10),(12,7,9),(12,8,5),(12,9,6),(14,1,5),(14,2,12),(14,10,5),(15,8,5),(15,11,21),(22,7,6),(22,9,5),(22,11,13);
/*!40000 ALTER TABLE `tbl_book_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_genres`
--

DROP TABLE IF EXISTS `tbl_book_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_genres` (
  `genre_id` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  PRIMARY KEY (`genre_id`,`bookId`),
  KEY `fk_tbl_book_genres_tbl_book1_idx` (`bookId`),
  CONSTRAINT `fk_tbl_book_genres_tbl_book1` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_book_genres_tbl_genre1` FOREIGN KEY (`genre_id`) REFERENCES `tbl_genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_genres`
--

LOCK TABLES `tbl_book_genres` WRITE;
/*!40000 ALTER TABLE `tbl_book_genres` DISABLE KEYS */;
INSERT INTO `tbl_book_genres` VALUES (1,1),(8,1),(1,2),(13,3),(1,4),(8,4),(1,6),(8,6),(2,7),(4,8),(6,8),(7,8),(6,9),(7,9),(3,10),(5,10),(8,14),(14,14),(4,15),(15,15),(15,22),(3,31),(22,31),(23,31);
/*!40000 ALTER TABLE `tbl_book_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_loans`
--

DROP TABLE IF EXISTS `tbl_book_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_loans` (
  `bookId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `cardNo` int(11) NOT NULL,
  `dateOut` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dueDate` datetime DEFAULT NULL,
  `dateIn` datetime DEFAULT NULL,
  PRIMARY KEY (`bookId`,`branchId`,`cardNo`,`dateOut`),
  KEY `fk_bl_book` (`bookId`),
  KEY `fk_bl_branch` (`branchId`),
  KEY `fk_bl_borrower` (`cardNo`),
  CONSTRAINT `fk_bl_book` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_borrower` FOREIGN KEY (`cardNo`) REFERENCES `tbl_borrower` (`cardNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_branch` FOREIGN KEY (`branchId`) REFERENCES `tbl_library_branch` (`branchId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_loans`
--

LOCK TABLES `tbl_book_loans` WRITE;
/*!40000 ALTER TABLE `tbl_book_loans` DISABLE KEYS */;
INSERT INTO `tbl_book_loans` VALUES (1,1,1,'2019-07-01 16:24:22','2019-07-08 16:24:22','2019-07-01 16:37:03'),(1,1,2,'2019-06-15 23:55:52','2019-06-22 23:55:52','2019-06-19 23:55:52'),(1,1,2,'2019-06-25 14:28:50','2019-07-02 14:28:50','2019-06-25 14:29:20'),(1,1,2,'2019-06-25 14:28:59','2019-07-16 14:28:59','2019-07-01 16:34:09'),(1,1,2,'2019-06-25 14:29:05','2019-07-09 14:29:05',NULL),(1,4,4,'2019-06-24 17:55:59','2019-07-01 17:55:59','2019-06-25 14:24:33'),(1,4,4,'2019-06-24 17:56:10','2019-07-01 17:56:10','2019-06-25 14:24:33'),(1,4,5,'2019-06-24 17:53:39','2019-07-01 17:53:39','2019-06-24 17:54:14'),(2,2,2,'2019-06-15 23:55:52','2019-06-29 23:55:52','2019-06-24 16:03:07'),(3,3,5,'2019-06-15 23:55:52','2019-06-22 23:55:52','2019-06-24 17:53:58'),(3,3,6,'2019-06-14 00:12:16','2019-06-28 00:12:16',NULL),(3,9,1,'2019-06-23 16:44:59','2019-06-30 16:44:59','2019-06-23 18:06:18'),(4,1,1,'2019-06-15 23:55:53','2019-07-06 23:55:53','2019-06-23 18:18:53'),(7,5,1,'2019-06-23 19:05:55','2019-07-07 19:05:55','2019-06-25 13:20:02'),(9,4,4,'2019-06-24 17:55:00','2019-07-01 17:55:00',NULL),(14,1,2,'2019-06-24 16:02:48','2019-07-01 16:02:48','2019-06-25 13:20:26'),(15,11,1,'2019-06-25 13:22:57','2019-07-02 13:22:57','2019-06-25 13:23:28'),(15,11,1,'2019-06-25 13:23:08','2019-07-02 13:23:08','2019-06-25 13:23:28');
/*!40000 ALTER TABLE `tbl_book_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_borrower`
--

DROP TABLE IF EXISTS `tbl_borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_borrower` (
  `cardNo` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_borrower`
--

LOCK TABLES `tbl_borrower` WRITE;
/*!40000 ALTER TABLE `tbl_borrower` DISABLE KEYS */;
INSERT INTO `tbl_borrower` VALUES (1,'Mark','CO','101-111-1111'),(2,'Jason','CA','202-222-2222'),(3,'Musa','SE','303-333-3333'),(4,'Joseph','TA','404-444-4444'),(5,'Sean','DC','505-555-5555'),(6,'Maria','OH','606-666-6666');
/*!40000 ALTER TABLE `tbl_borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_genre`
--

DROP TABLE IF EXISTS `tbl_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genre`
--

LOCK TABLES `tbl_genre` WRITE;
/*!40000 ALTER TABLE `tbl_genre` DISABLE KEYS */;
INSERT INTO `tbl_genre` VALUES (1,'Art'),(2,'Health'),(3,'History'),(4,'Encyclopedia'),(5,'Autobiography'),(6,'Science'),(7,'Textbook'),(8,'Fiction'),(11,'Test '),(12,'Test 2'),(13,'ClassicHistory'),(14,'Jason Dream'),(15,'Cool'),(22,'update book test genre'),(23,'update book test genre 3');
/*!40000 ALTER TABLE `tbl_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_library_branch`
--

DROP TABLE IF EXISTS `tbl_library_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_library_branch` (
  `branchId` int(11) NOT NULL AUTO_INCREMENT,
  `branchName` varchar(45) DEFAULT NULL,
  `branchAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_library_branch`
--

LOCK TABLES `tbl_library_branch` WRITE;
/*!40000 ALTER TABLE `tbl_library_branch` DISABLE KEYS */;
INSERT INTO `tbl_library_branch` VALUES (1,'New York Library','New York'),(2,'Colorado Library','2300 Arapahoe ave'),(3,'Ohio Library','Ohio'),(4,'Lonely Star library','Taxes'),(5,'VIG LIB','OAK LN'),(6,'California Library','California'),(7,'Washington Library','Washington'),(8,'Geogre W. Library','WashingtonDC'),(9,'Seattle Library','Seattle'),(10,'Jason Magic Library','Jason\'s mind'),(11,'National branch of Persia','jason\'s brain'),(13,'test branch','hello world');
/*!40000 ALTER TABLE `tbl_library_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_publisher`
--

DROP TABLE IF EXISTS `tbl_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_publisher` (
  `publisherId` int(11) NOT NULL AUTO_INCREMENT,
  `publisherName` varchar(45) NOT NULL,
  `publisherAddress` varchar(45) DEFAULT NULL,
  `publisherPhone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`publisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_publisher`
--

LOCK TABLES `tbl_publisher` WRITE;
/*!40000 ALTER TABLE `tbl_publisher` DISABLE KEYS */;
INSERT INTO `tbl_publisher` VALUES (1,'History','California','111-111-111'),(2,'Fiction','Washington','222-222-222'),(3,'Ghost','New York','333-333-333'),(4,'Tear','Colorado','444-444-444'),(5,'Ethic','Seattle','555-555-555'),(6,'Scientific','Virginia','666-666-666'),(7,'Education','Ohio','777-777-777'),(8,'Fashion','Taxes','888-888-888'),(9,'Geology','Colorado','999-999-9999'),(15,'Jason fancy','Jason dream','777'),(16,'Hello world','DC','777'),(19,'Test Publisher','test','222-222-222'),(21,'Update Test 2 Publisher','update test','222-222-222'),(22,'Update Test 2 Publisher','update test','222-222-222'),(23,'Update Test 3 Publisher','update test','222-222-222'),(24,'Update Test 3 Publisher','update test','222-222-222');
/*!40000 ALTER TABLE `tbl_publisher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-16 10:48:38
