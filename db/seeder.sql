-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: xi-tech
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

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
-- Table structure for table `AccountType`
--

DROP TABLE IF EXISTS `AccountType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountType`
--

LOCK TABLES `AccountType` WRITE;
/*!40000 ALTER TABLE `AccountType` DISABLE KEYS */;
INSERT INTO `AccountType` VALUES
(1,'user'),
(2,'seller'),
(3,'support'),
(4,'admin');
/*!40000 ALTER TABLE `AccountType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_price` int(11) NOT NULL,
  `thumbnail_path` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) DEFAULT 0,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Article_Brand_id_fk` (`brand_id`),
  KEY `Article_Category_id_fk` (`category_id`),
  CONSTRAINT `Article_Brand_id_fk` FOREIGN KEY (`brand_id`) REFERENCES `Brand` (`id`),
  CONSTRAINT `Article_Category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArticleImagePath`
--

DROP TABLE IF EXISTS `ArticleImagePath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArticleImagePath` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_image_path_article_id_fk` (`article_id`),
  CONSTRAINT `article_image_path_article_id_fk` FOREIGN KEY (`article_id`) REFERENCES `Article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArticleImagePath`
--

LOCK TABLES `ArticleImagePath` WRITE;
/*!40000 ALTER TABLE `ArticleImagePath` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArticleImagePath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Order_User_id_fk` (`user_id`),
  KEY `Order_OrderStatus_id_fk` (`status_id`),
  CONSTRAINT `Order_OrderStatus_id_fk` FOREIGN KEY (`status_id`) REFERENCES `OrderStatus` (`id`),
  CONSTRAINT `Order_User_id_fk` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderStatus`
--

DROP TABLE IF EXISTS `OrderStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderStatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatus`
--

LOCK TABLES `OrderStatus` WRITE;
/*!40000 ALTER TABLE `OrderStatus` DISABLE KEYS */;
INSERT INTO `OrderStatus` VALUES
(3,'created'),
(4,'paid'),
(5,'delivered'),
(6,'cancelled');
/*!40000 ALTER TABLE `OrderStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ordering`
--

DROP TABLE IF EXISTS `Ordering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ordering` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Ordering_Article_id_fk` (`article_id`),
  KEY `Ordering_Order_id_fk` (`order_id`),
  CONSTRAINT `Ordering_Article_id_fk` FOREIGN KEY (`article_id`) REFERENCES `Article` (`id`),
  CONSTRAINT `Ordering_Order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ordering`
--

LOCK TABLES `Ordering` WRITE;
/*!40000 ALTER TABLE `Ordering` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ordering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RatingLabel`
--

DROP TABLE IF EXISTS `RatingLabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RatingLabel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RatingLabel`
--

LOCK TABLES `RatingLabel` WRITE;
/*!40000 ALTER TABLE `RatingLabel` DISABLE KEYS */;
INSERT INTO `RatingLabel` VALUES
(1,'Very Bad'),
(2,'Bad'),
(3,'Ok'),
(4,'Good'),
(5,'Excellent');
/*!40000 ALTER TABLE `RatingLabel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Review_User_id_fk` (`author_id`),
  KEY `Review_RatingLabel_id_fk` (`rating`),
  CONSTRAINT `Review_RatingLabel_id_fk` FOREIGN KEY (`rating`) REFERENCES `RatingLabel` (`id`),
  CONSTRAINT `Review_User_id_fk` FOREIGN KEY (`author_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Ticket_User_id_fk` (`author_id`),
  CONSTRAINT `Ticket_User_id_fk` FOREIGN KEY (`author_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TicketResponse`
--

DROP TABLE IF EXISTS `TicketResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TicketResponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TicketResponse_Ticket_id_fk` (`ticket_id`),
  KEY `TicketResponse_User_id_fk` (`author_id`),
  CONSTRAINT `TicketResponse_Ticket_id_fk` FOREIGN KEY (`ticket_id`) REFERENCES `Ticket` (`id`),
  CONSTRAINT `TicketResponse_User_id_fk` FOREIGN KEY (`author_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TicketResponse`
--

LOCK TABLES `TicketResponse` WRITE;
/*!40000 ALTER TABLE `TicketResponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `TicketResponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_type` int(11) NOT NULL DEFAULT 1,
  `authentication_string` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_account_type_id_fk` (`account_type`),
  CONSTRAINT `user_account_type_id_fk` FOREIGN KEY (`account_type`) REFERENCES `AccountType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-07 22:42:29
