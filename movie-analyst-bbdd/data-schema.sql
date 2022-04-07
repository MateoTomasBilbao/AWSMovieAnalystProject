CREATE DATABASE  IF NOT EXISTS `movie_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `movie_db`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: terraform-20220405183716703500000001.cxh25zyuix5e.sa-east-1.rds.amazonaws.com    Database: movie_db
-- ------------------------------------------------------
-- Server version	5.7.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `title` varchar(250) NOT NULL,
  `release` varchar(250) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `reviewer` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `reviewer_idx` (`reviewer`),
  CONSTRAINT `reviewer` FOREIGN KEY (`reviewer`) REFERENCES `reviewers` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES ('Cuck','2019',11,'Ezequiel Fernández Moores'),('Digimon Ball Super','2012',9,'Cristian Grosso'),('El dilema de las redes sociales','2020',7,'Pablo Sirve'),('El Manguchorian','2019',7,'José Riachuelo'),('Incel','2018',9,'Ezequiel Fernández Moores'),('No confíes en nadie: Tras la pista del rey de las criptomonedas','2022',8,'Pablo Sirve'),('Pintura Secándose','2022',11,'José Riachuelo'),('Rata Cocinera','2016',8,'Cristian Grosso');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `name` varchar(250) NOT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES ('El Maño','glyphicon-leaf'),('Ñaca Ñaca','glyphicon-fire');
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewers`
--

DROP TABLE IF EXISTS `reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewers` (
  `name` varchar(250) NOT NULL,
  `publication` varchar(250) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `publication_idx` (`publication`),
  CONSTRAINT `publication` FOREIGN KEY (`publication`) REFERENCES `publications` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewers`
--

LOCK TABLES `reviewers` WRITE;
/*!40000 ALTER TABLE `reviewers` DISABLE KEYS */;
INSERT INTO `reviewers` VALUES ('Cristian Grosso','El Maño','https://resizer.glanacion.com/resizer/yKJSCggwfO2bj4nSIH2g1x5cLz8=/280x0/filters:format(webp):quality(80)/s3.amazonaws.com/arc-authors/lanacionar/2771759.png'),('Ezequiel Fernández Moores','El Maño','https://resizer.glanacion.com/resizer/L6mNL6VA9voKSDvHeHRNB9gehYk=/280x0/filters:format(webp):quality(80)/s3.amazonaws.com/arc-authors/lanacionar/2089234.png'),('José Riachuelo','Ñaca Ñaca','https://resizer.glanacion.com/resizer/BcGqGlBvQSm8F9tz6NCG-XB5z-E=/280x0/filters:format(webp):quality(80)/s3.amazonaws.com/arc-authors/lanacionar/51bbce6f-91cc-4790-87f2-ee3dc8087d12.png'),('Pablo Sirve','Ñaca Ñaca','https://resizer.glanacion.com/resizer/-3SbvKNeKHzNeXZFQaaUgIN-5P4=/280x0/filters:format(webp):quality(80)/s3.amazonaws.com/arc-authors/lanacionar/2735400.png');
/*!40000 ALTER TABLE `reviewers` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-06 11:15:12
