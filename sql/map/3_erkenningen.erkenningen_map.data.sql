-- MySQL dump 10.13  Distrib 5.5.47, for Linux (x86_64)
--
-- Host: localhost    Database: 3_erkenningen
-- ------------------------------------------------------
-- Server version	5.5.47

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
-- Table structure for table `erkenningen_map`
--

DROP TABLE IF EXISTS `erkenningen_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erkenningen_map` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Erkenningen` varchar(21) DEFAULT NULL,
  `Table` varchar(11) DEFAULT NULL,
  `Type_T` varchar(20) DEFAULT NULL,
  `Type` varchar(17) DEFAULT NULL,
  `Value` varchar(25) DEFAULT NULL,
  `DataType` varchar(11) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erkenningen_map`
--

LOCK TABLES `erkenningen_map` WRITE;
/*!40000 ALTER TABLE `erkenningen_map` DISABLE KEYS */;
INSERT INTO `erkenningen_map` VALUES (1,'naam','Erkenningen','ORGANIZATION','NAME','DEFINITION','string(255)',''),(2,'doelstelling','Erkenningen','ORGANIZATION','GOAL','DEFINITION','string(255)',''),(3,'provenance','Erkenningen','ORGANIZATION','PROVENANCE','DEFINITION','string(255)','[veld]: [value]; etc'),(7,'begindatum','Erkenningen','ORGANIZATION','Timestamp','dd-mm-yyyy','string(10)',NULL),(8,'einddatum','Erkenningen','ORGANIZATION','Timestamp','dd-mm-yyyy','string(10)','Bij ontbrekende einddatum \'End Period Unavailable\''),(9,'','Erkenningen','ORGANIZATION','Source','Erkenningen_HuygensING','string(255)',''),(10,'','Erkenningen','ORGANIZATION','TYPE_ORGANIZATION','Union','string(255)',''),(11,'begindatum','Erkenningen','ORGANIZATION','START_DATE','dd-mm-yyyy','string(10)','Geldige datum: Estimation=Exact; Bij alleen Maand/Jaar: \'Month_year/Year'),(12,'einddatum','Erkenningen','ORGANIZATION','END_DATE','dd-mm-yyyy','string(10)',NULL),(23,NULL,'Erkenningen','CONTEXT','NAME','DEFINITION','string(255)',''),(24,NULL,'Erkenningen','CONTEXT','LEVEL','DEFINITION','string(255)',NULL),(25,'','Erkenningen','CONTEXT','LEVEL','Locality','string(255)',''),(26,'','Erkenningen','CONTEXT','LEVEL','Municipality','string(255)',''),(27,'','Erkenningen','CONTEXT','LEVEL','Province','string(255)',''),(28,NULL,'Erkenningen','CONTEXT_CONTEXT','Relation','Locality and Municipality','string(255)','Het laagste niveau staat altijd links'),(29,NULL,'Erkenningen','CONTEXT_CONTEXT','Relation','Municipality and Province','string(255)',NULL),(31,NULL,'Erkenningen','ORG_CONTEXT','Relation','NULL','string(255)','Relation blijft leeg, alleen laagste niveau');
/*!40000 ALTER TABLE `erkenningen_map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-29 16:31:53
