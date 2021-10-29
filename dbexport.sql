-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: website
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.2

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(30) DEFAULT NULL,
  `pass` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'doej','$2a$10$Ombwstme82DjSCHbZKJIX.dq/gfxQycQ64FBabeowLXeGqUbCtbz2'),(2,'wickj','$2a$10$BUPo58x/HzQYxi0z1wyKiuBjtj52g152/RL71kWtiLtFKDVhsMc8.');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flights` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(25) DEFAULT NULL,
  `carrier` varchar(30) DEFAULT NULL,
  `flightNumber` varchar(10) DEFAULT NULL,
  `destination` varchar(30) DEFAULT NULL,
  `ticketPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'First','British Air','ABC-123','Paris',3000),(2,'Business','British Air','ABC-123','Paris',2400),(3,'Economy','British Air','ABC-123','Paris',900),(4,'First','Ryan Air','EFG-456','Berlin',2800),(5,'Business','Ryan Air','EFG-456','Berlin',2300),(6,'Economy','Ryan Air','EFG-456','Berlin',600),(7,'First','XYZ Air','HIJ-789','Rome',2300),(8,'Business','XYZ Air','HIJ-789','Rome',2500),(9,'Economy','XYZ Air','HIJ-789','Rome',650);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `usr` mediumint(8) unsigned DEFAULT NULL,
  `trs` mediumint(8) unsigned DEFAULT NULL,
  `htl` mediumint(8) unsigned DEFAULT NULL,
  `ins` mediumint(8) unsigned DEFAULT NULL,
  `flt` mediumint(8) unsigned DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `isPaid` varchar(15) DEFAULT NULL,
  `invoiceRef` varchar(20) DEFAULT NULL,
  KEY `usr` (`usr`),
  KEY `trs` (`trs`),
  KEY `htl` (`htl`),
  KEY `ins` (`ins`),
  KEY `flt` (`flt`),
  CONSTRAINT `holidays_ibfk_1` FOREIGN KEY (`usr`) REFERENCES `accounts` (`id`),
  CONSTRAINT `holidays_ibfk_2` FOREIGN KEY (`trs`) REFERENCES `tours` (`id`),
  CONSTRAINT `holidays_ibfk_3` FOREIGN KEY (`htl`) REFERENCES `hotels` (`id`),
  CONSTRAINT `holidays_ibfk_4` FOREIGN KEY (`ins`) REFERENCES `insurance` (`id`),
  CONSTRAINT `holidays_ibfk_5` FOREIGN KEY (`flt`) REFERENCES `flights` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,1,2,3,2,'2021-10-30 00:00:00','2021-11-06 00:00:00',2645,'pending','ZZQDPJWSJ'),(1,3,8,4,7,'2021-11-22 00:00:00','2021-11-26 00:00:00',2472,'pending','4R5WAQ9LK'),(2,4,6,2,6,'2021-10-30 00:00:00','2021-11-06 00:00:00',824,'pending','NG2Z372WJ');
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotels` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hotelName` varchar(30) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `hotelImg` varchar(255) DEFAULT NULL,
  `tier` varchar(25) DEFAULT NULL,
  `roomPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Marriott','XYZ 123','France','https://cache.marriott.com/marriottassets/marriott/LOSLG/loslg-exterior-9338-hor-feat.jpg','Premium',30),(2,'Marriott','XYZ 123','France','https://cache.marriott.com/marriottassets/marriott/LOSLG/loslg-exterior-9338-hor-feat.jpg','Standard',20),(3,'Brad\'s House','BBC 123','Spain','https://www.buyshedsdirect.co.uk/media/catalog/product/cache/fd1be18a6282456ceac64b0a6741b1a8/o/d/odp86m_overlap-dip-treated-8x6-pent-shed-insitu-min_1.jpg','Premium',28),(4,'Brad\'s House','BBC 123','Spain','https://www.buyshedsdirect.co.uk/media/catalog/product/cache/fd1be18a6282456ceac64b0a6741b1a8/o/d/odp86m_overlap-dip-treated-8x6-pent-shed-insitu-min_1.jpg','standard',18),(5,'Trump Towers','DSF 584','Germany','https://static.dezeen.com/uploads/2016/11/donald-trump-towers-architecture-trumpitecture-skyscapers-us-election-2016-opinion-doug-staker_dezeen_hero2-1704x959.jpg','Premium',33),(6,'Trump Towers','DSF 584','Germany','https://static.dezeen.com/uploads/2016/11/donald-trump-towers-architecture-trumpitecture-skyscapers-us-election-2016-opinion-doug-staker_dezeen_hero2-1704x959.jpg','Standard',15),(7,'Tilted Towers','FRT NUT','Italy','https://cdn.gamer-network.net/2018/metabomb/tiltedtowersmeteorguidetelescopeschestscontrollervibrations.jpg','Premium',32),(8,'Tilted Towers','FRT NUT','Italy','https://cdn.gamer-network.net/2018/metabomb/tiltedtowersmeteorguidetelescopeschestscontrollervibrations.jpg','standard',25);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `insuranceName` varchar(30) DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `insurancePrice` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'Rock Insurance','Insurances Memes & CO.',7,'Best value all inclusive, comprehensive rock insurance'),(2,'Health Insurance','FAT Insurance',9,'Best value health insurance'),(3,'Health Insurance','Not a scamp company',8,'Better value health insurance'),(4,'Car Insurance','Jon & Doe INC',7,'Value insurance for da wip. SKRRT SKRRT');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tours` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tourName` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `tourPrice` int(11) DEFAULT NULL,
  `tourImg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours`
--

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
INSERT INTO `tours` VALUES (1,'Paris mini tour','France',7,'https://upload.wikimedia.org/wikipedia/commons/4/4b/La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg'),(2,'Eiffel tower trip','France',10,'https://upload.wikimedia.org/wikipedia/commons/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg'),(3,'Rome monument trip','Italy',11,'https://andante.azureedge.net/cache/b/b/9/b/0/0/bb9b001eda2ab2225326cd4036a5c7df75c73cf3.jpg'),(4,'Berlin tour','Germany',8,'https://media.timeout.com/images/105303515/1372/772/image.jpg'),(5,'Liberty City Trip','GTA',7,'https://staticg.sportskeeda.com/editor/2021/07/fdae4-16255251589561.png');
/*!40000 ALTER TABLE `tours` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29 23:38:42
