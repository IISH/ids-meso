-- MySQL dump 10.13  Distrib 5.5.47, for Linux (x86_64)
--
-- Host: localhost    Database: 2_sport
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
-- Table structure for table `sport_map`
--

DROP TABLE IF EXISTS `sport_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sport_map` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sport` varchar(23) DEFAULT NULL,
  `Table` varchar(5) DEFAULT NULL,
  `Type_T` varchar(20) DEFAULT NULL,
  `Type` varchar(25) DEFAULT NULL,
  `Value` varchar(50) DEFAULT NULL,
  `DataType` varchar(11) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport_map`
--

LOCK TABLES `sport_map` WRITE;
/*!40000 ALTER TABLE `sport_map` DISABLE KEYS */;
INSERT INTO `sport_map` VALUES (1,'Id','Sport','ORGANIZATION','ORIGINAL_IDENTIFIER','DEFINITION','enum',NULL),(2,'','Sport','ORGANIZATION','Source','Sportvereniging_HuygensING','string(255)',NULL),(3,'','Sport','ORGANIZATION','TYPE_ORGANIZATION','Sporting club','string(255)',NULL),(8,'naam_nw','Sport','ORGANIZATION','NAME','DEFINITION','string(255)',NULL),(10,'sport','Sport','ORGANIZATION','TYPE_SPORT','DEFINITION','enum',NULL),(11,'sport','Sport','ORGANIZATION','TYPE_SPORT','Chess','enum',NULL),(12,'sport','Sport','ORGANIZATION','TYPE_SPORT','Tennis','enum',NULL),(13,'sport','Sport','ORGANIZATION','TYPE_SPORT','Soccer','enum',NULL),(14,'sport','Sport','ORGANIZATION','TYPE_SPORT','Hockey','enum',NULL),(15,'sport','Sport','ORGANIZATION','TYPE_SPORT','Gymnastics','enum',NULL),(16,'sport','Sport','ORGANIZATION','TYPE_SPORT','Korffball','enum',NULL),(17,'begindatum','Sport','ORGANIZATION','Timestamp','dd-mm-yyyy','string(10)',NULL),(18,'einddatum','Sport','ORGANIZATION','Timestamp','dd-mm-yyyy','string(10)',NULL),(19,'begindatum_soort','Sport','ORGANIZATION','START_DATE','DEFINITION','enum',NULL),(20,'begindatum_soort','Sport','ORGANIZATION','START_DATE','Formation_date','enum',NULL),(21,'begindatum_soort','Sport','ORGANIZATION','START_DATE','Oldest_statement','enum',NULL),(22,'einddatum_soort','Sport','ORGANIZATION','END_DATE','DEFINITION','enum',NULL),(23,'einddatum_soort','Sport','ORGANIZATION','END_DATE','Last_statement','enum',NULL),(24,'einddatum_soort','Sport','ORGANIZATION','END_DATE','Dissolution_date','enum',NULL),(30,'levensbeschouwing','Sport','ORGANIZATION','SOCIETAL_PILLAR','DEFINITION','enum',NULL),(31,'levensbeschouwing','Sport','ORGANIZATION','SOCIETAL_PILLAR','Neutral','enum',NULL),(32,'levensbeschouwing','Sport','ORGANIZATION','SOCIETAL_PILLAR','Roman Catholic','enum',NULL),(33,'levensbeschouwing','Sport','ORGANIZATION','SOCIETAL_PILLAR','Protestant Christian','enum',NULL),(34,'levensbeschouwing','Sport','ORGANIZATION','SOCIETAL_PILLAR','Jewish','enum',NULL),(35,'levensbeschouwing','Sport','ORGANIZATION','SOCIETAL_PILLAR','Socialist','enum',NULL),(36,'verantwoording gegevens','Sport','ORGANIZATION','SOCIETAL_PILLAR','DEFINITION','string',NULL),(37,'opmerkingen','Sport','ORGANIZATION','REMARKS','DEFINITION','string',NULL),(41,'doelstelling','Sport','ORGANIZATION','GOAL','DEFINITION','clob',NULL),(43,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'werkingsgebied','Sport','ORGANIZATION','DOMAIN','DEFINITION','enum',NULL),(52,'werkingsgebied','Sport','ORGANIZATION','DOMAIN','National','enum',NULL),(53,'werkingsgebied','Sport','ORGANIZATION','DOMAIN','Provincial','enum',NULL),(54,'werkingsgebied','Sport','ORGANIZATION','DOMAIN','Regional','enum',NULL),(55,'werkingsgebied','Sport','ORGANIZATION','DOMAIN','Municipal','enum',NULL),(56,'werkingsgebied','Sport','ORGANIZATION','DOMAIN','Local','enum',NULL),(57,'werkingsgebied','Sport','ORGANIZATION','DOMAIN','Unknown','enum',NULL),(61,'speeldag','Sport','ORGANIZATION','PLAY_DAY','DEFINITION','string',NULL),(62,NULL,'Sport','ORGANIZATION','PLAY_DAY','Saturday','string','alleen_zaterdag'),(63,NULL,'Sport','ORGANIZATION','PLAY_DAY','Saturday and Sunday','string','ook_zaterdag'),(64,NULL,'Sport','ORGANIZATION','PLAY_DAY','Sunday','string','NULL'),(65,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,NULL,'Sport','CONTEXT','NAME','DEFINITION','string',NULL),(72,'','Sport','CONTEXT','LEVEL','DEFINITION','string',NULL),(73,'plaats','Sport','CONTEXT','LEVEL','Locality','string(255)',NULL),(74,'gemeente','Sport','CONTEXT','LEVEL','Municipality','string(255)',NULL),(76,'provincie','Sport','CONTEXT','LEVEL','Province','string(255)',NULL),(77,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,NULL,'Sport','ORG_CONTEXT','Relation','NULL',NULL,NULL),(79,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,NULL,'Sport','CONTEXT_CONTEXT','Relation','Locality and Municipality','string',NULL),(104,NULL,'Sport','CONTEXT_CONTEXT','Relation','Municipality and Province','string',NULL),(107,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sport_map` ENABLE KEYS */;
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
