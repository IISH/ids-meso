-- MySQL dump 10.13  Distrib 5.5.47, for Linux (x86_64)
--
-- Host: localhost    Database: 4_zeemonster
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
-- Table structure for table `zeemonster_map`
--

DROP TABLE IF EXISTS `zeemonster_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zeemonster_map` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Zeemonsterrollen Schepenlijst` varchar(41) DEFAULT NULL,
  `Table` varchar(16) DEFAULT NULL,
  `Type_T` varchar(20) DEFAULT NULL,
  `Type` varchar(22) DEFAULT NULL,
  `Value` varchar(27) DEFAULT NULL,
  `DataType` varchar(11) DEFAULT NULL,
  `Description` varchar(89) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zeemonster_map`
--

LOCK TABLES `zeemonster_map` WRITE;
/*!40000 ALTER TABLE `zeemonster_map` DISABLE KEYS */;
INSERT INTO `zeemonster_map` VALUES (1,'Id','Zeemonsterrollen','ORGANIZATION','ORIGINAL_IDENTIFIER','DEFINITION','int(4)','id_Schip is ook uniek (geen schip matching)'),(2,'','Zeemonsterrollen','ORGANIZATION','Source','Zeemonsterrollen_HuygensING','string(255)',''),(3,'','Zeemonsterrollen','ORGANIZATION','TYPE_ORGANIZATION','Ship','string(255)',''),(4,NULL,'Zeemonsterrollen','ORGANIZATION','Timestamp','yyyy',NULL,'Estimation: Year               Geen periode in dit bestand'),(6,'JAAR','Zeemonsterrollen','ORGANIZATION','YEAR_JOURNEY','timestamp','','Estimation: Year               Geen periode in dit bestand'),(7,'PROVENANCE','Zeemonsterrollen','ORGANIZATION','PROVENANCE','DEFINITION','clob','Combinatie van velden met ; er tussen of zoiets'),(8,'NAAM SCHIP (ORIGINEEL)','Zeemonsterrollen','ORGANIZATION','NAME','DEFINITION','string(255)','Probleem hier is dat de database niet gelinkt is, dezelfde schepen'),(9,'NAAM SCHIP (GESTANDAARDISEERD)','Zeemonsterrollen','ORGANIZATION','NAME_STANDARD','DEFINITION','string(255)','komen meerdere keren voor zonder dat dit is gekenmerkt.'),(10,'SCHEEPSTYPE (ORIGINEEL)','Zeemonsterrollen','ORGANIZATION','TYPE_SHIP','DEFINITION','enum',''),(11,'SCHEEPSTYPE (GESTANDAARDISEERD)','Zeemonsterrollen','ORGANIZATION','TYPE_SHIP_STANDARD','DEFINITION','enum',''),(12,'',NULL,'','','','',''),(13,'','Zeemonsterrollen','CONTEXT','LEVEL','DEFINITION','',''),(14,'','Zeemonsterrollen','CONTEXT','LEVEL','Ship','','A \'Ship\' is used as a contextual level [for all our contexts]'),(15,'','Zeemonsterrollen','CONTEXT','LEVEL','Crew','','\'Crew\' is used as sub-level'),(16,'TOTAAL OPVARENDEN','Zeemonsterrollen','CONTEXT','NUMBER_CREW_PASSENGERS','DEFINITION','int(3)','Behoort bij de context van aanmonstering (juni yyyy)'),(17,'PASSAGIERS','Zeemonsterrollen','CONTEXT','NUMBER_PASSENGERS','DEFINITION','int(2)','Behoort bij de context van aanmonstering (juni yyyy)'),(18,'ZEEVARENDEN EUROPEES','Zeemonsterrollen','CONTEXT','NUMBER_CREW','DEFINITION','int(2)',''),(19,'ZEEVARENDEN AZIATISCH','Zeemonsterrollen','CONTEXT','NUMBER_CREW','DEFINITION','int(2)',''),(20,'SOLDATEN EUROPEES','Zeemonsterrollen','CONTEXT','NUMBER_CREW','DEFINITION','int(2)',''),(21,'SOLDATEN AZIATISCH','Zeemonsterrollen','CONTEXT','NUMBER_CREW','DEFINITION','int(2)',''),(22,'LOON VOORMAN AZIATISCHE ZEEVARENDEN','Zeemonsterrollen','CONTEXT','SALARY','DEFINITION','int(5)',''),(23,'LOON VOORMANSMAAT AZIATISCHE ZEEVARENDEN','Zeemonsterrollen','CONTEXT','SALARY','DEFINITION','int(5)',''),(24,'LOON KOK AZIATISCHE ZEEVARENDEN','Zeemonsterrollen','CONTEXT','SALARY','DEFINITION','int(5)',''),(25,'LOON MATROZEN AZIATISCHE ZEEVARENDEN','Zeemonsterrollen','CONTEXT','SALARY','DEFINITION','int(5)',''),(26,' LOON VOORMAN AZIATISCHE SOLDATEN','Zeemonsterrollen','CONTEXT','SALARY','DEFINITION','int(5)',''),(27,'LOON CORPORAAL AZIATISCHE SOLDATEN','Zeemonsterrollen','CONTEXT','SALARY','DEFINITION','int(5)',''),(28,'LOON AZIATISCHE SOLDATEN','Zeemonsterrollen','CONTEXT','SALARY','DEFINITION','int(5)',''),(29,'','Zeemonsterrollen','CONTEXT','CREW_TYPE','DEFINITION','string(255)',''),(30,'ZEEVARENDEN EUROPEES','Zeemonsterrollen','CONTEXT','CREW_TYPE','Maritime_European','string(255)','Behoort bij de context van aanmonstering (juni yyyy)'),(31,'ZEEVARENDEN AZIATISCH','Zeemonsterrollen','CONTEXT','CREW_TYPE','Maritime_Asian','string(255)','Behoort bij de context van aanmonstering (juni yyyy)'),(32,'SOLDATEN EUROPEES','Zeemonsterrollen','CONTEXT','CREW_TYPE','Soldiers_European','string(255)','Behoort bij de context van aanmonstering (juni yyyy)'),(33,'SOLDATEN AZIATISCH','Zeemonsterrollen','CONTEXT','CREW_TYPE','Soldiers_Asian','string(255)','Behoort bij de context van aanmonstering (juni yyyy)'),(34,'VOORMAN AZIATISCHE ZEEVARENDEN','Zeemonsterrollen','CONTEXT','CREW_TYPE','Foreman_Asian','string(255)','Behoort bij de context van aanmonstering (juni yyyy)'),(35,'VOORMANSMAAT AZIATISCHE ZEEVARENDEN','Zeemonsterrollen','CONTEXT','CREW_TYPE','Foreman_Fellow_Asian','string(255)','Behoort bij de context van aanmonstering (juni yyyy)'),(36,'KOK AZIATISCHE ZEEVARENDEN','Zeemonsterrollen','CONTEXT','CREW_TYPE','Cook_Asian','string(255)','Behoort bij de context van aanmonstering (juni yyyy)'),(37,'MATROZEN AZIATISCHE ZEEVARENDEN','Zeemonsterrollen','CONTEXT','CREW_TYPE','Sailor_Asian','string(255)','Behoort bij de context van aanmonstering (juni yyyy)  Verschil met MARITIME_ASIAN?'),(38,'xxOPMERKINGEN AZIATISCHE ZEEVARENDEN','Zeemonsterrollen','CONTEXT','REMARKS','DEFINITION','clob','Raar veld voorlopoig overslaan, te weing systematiek'),(39,'JAAR AANMONSTERING AZIATISCHE ZEEVARENDEN','Zeemonsterrollen','CONTEXT',NULL,'DEFINITION','int(4)','Raar veld voorlopoig overslaan,'),(40,'LOKATIE (JUNI)','Zeemonsterrollen','CONTEXT','ENGAGEMENT_HARBOUR','DEFINITION','string(255)','Juni onderdeel van timestamp'),(47,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,NULL,'Zeemonsterrollen','ORG_CONTEXT','Id_O',NULL,NULL,NULL),(49,NULL,'Zeemonsterrollen','ORG_CONTEXT','Id_C',NULL,NULL,NULL),(50,NULL,'Zeemonsterrollen','ORG_CONTEXT','Relation','NULL',NULL,NULL),(51,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,NULL,NULL,'CONTEXT_CONTEXT','Relation','Crew and Ship',NULL,NULL),(63,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'Id','Zeemonsterrollen','INDIV_ORG','Id_I','DEFINITION','int','Waarde \'id\' uit origineel bestand  kan zowel voor schip als schipper gebruikt worden'),(67,'Id','Zeemonsterrollen','INDIV_ORG','ID_O','DEFINITION','int',NULL),(68,NULL,'Zeemonsterrollen','INDIV_ORG','Relatie','Captain','str',NULL),(141,'',NULL,'','','','',''),(142,'Id','Zeemonsterrollen','INDIVIDUAL','ID_I','','',''),(143,'SCHIPPERVOORNAAM','Zeemonsterrollen','INDIVIDUAL','FIRST_NAME','DEFINITION','string(255)',''),(144,'SCHIPPER TUSSENVOEGSEL','Zeemonsterrollen','INDIVIDUAL','PREFIX','DEFINITION','string(255)',''),(145,'SCHIPPER ACHTERNAAM','Zeemonsterrollen','INDIVIDUAL','LAST_NAME','DEFINITION','string(255)',''),(146,'SCHIPPERHERKOMST','Zeemonsterrollen','INDIVIDUAL','ORIGIN_LOCATION','DEFINITION','string(255)','Location of origin of the person (not better defined in source)');
/*!40000 ALTER TABLE `zeemonster_map` ENABLE KEYS */;
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
