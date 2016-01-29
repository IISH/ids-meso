-- MySQL dump 10.13  Distrib 5.5.47, for Linux (x86_64)
--
-- Host: localhost    Database: 1_das
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
-- Table structure for table `DAS_map`
--

DROP TABLE IF EXISTS `DAS_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DAS_map` (
  `Id` int(11) NOT NULL,
  `DAS` varchar(35) DEFAULT NULL,
  `Table` varchar(23) DEFAULT NULL,
  `Type_T` varchar(20) DEFAULT NULL,
  `Type` varchar(30) DEFAULT NULL,
  `Value` varchar(34) DEFAULT NULL,
  `DataType` varchar(20) DEFAULT NULL,
  `Description` varchar(86) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DAS_map`
--

LOCK TABLES `DAS_map` WRITE;
/*!40000 ALTER TABLE `DAS_map` DISABLE KEYS */;
INSERT INTO `DAS_map` VALUES (2,'','DAS_Schip','ORGANIZATION','Source','Dutch_Ships_and_Sailors_HuygensING','string',''),(3,'','DAS_Schip','ORGANIZATION','TYPE_ORGANIZATION','Ship','string(255)',''),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'Number','DAS_Schip','ORGANIZATION','ORIGINAL_IDENTIFIER','DEFINITION','double',''),(15,'Chamber','DAS_Schip','ORGANIZATION','CHAMBER_VOC','DEFINITION','string',''),(16,'Name of ship','DAS_Schip','ORGANIZATION','NAME','DEFINITION','string(255)',''),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'Built','DAS_Schip','ORGANIZATION','BUILDING_YEAR','DEFINITION','int(4)',''),(57,'Chamber_destination_cargo','DAS_Schip','ORGANIZATION','CHAMBER_DESTINATION','DEFINITION','string(255)',''),(58,'Particulars','DAS_Schip','ORGANIZATION','PROVENANCE','DEFINITION','clob',''),(59,'Yard','DAS_Schip','ORGANIZATION','LOCATION_SHIPYARD','DEFINITION','string(255)',''),(60,'Tonnage','DAS_Schip','ORGANIZATION','SIZE_TONNAGE','DEFINITION','int(5)',''),(61,NULL,NULL,'ORGANIZATION','Timestamp','period','int','Declared Period Start Year: Building_Year; End_Mont_Year is 06/??'),(62,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','DEFINITION','string',''),(105,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Pantjallang','string',''),(106,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Schuijtje','string',''),(107,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Flenijk','string',''),(108,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Buijs','string',''),(109,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Prauwtje','string',''),(110,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Tanjongp','string',''),(111,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Berkentijn','string',''),(112,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Prauw','string',''),(113,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Brigantijn','string',''),(114,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Schuijtboot','string',''),(115,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Pramijang','string',''),(116,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Gonting','string',''),(117,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Schouwen','string',''),(118,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Mayangprauw','string',''),(119,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Mayang prauw','string',''),(120,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Klene conting','string',''),(121,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Zijlboot','string',''),(122,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Loots','string',''),(123,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Diverse vaartuigen','string',''),(124,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Zeijlboot','string',''),(125,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Losboot','string',''),(126,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Dubbele hoornschuit','string',''),(127,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Tanjong poura','string',''),(128,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Hoornschuijt','string',''),(129,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Dubb. Thoornschuijt','string',''),(130,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','niet gegeven','string',''),(131,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Opgelegd','string',''),(132,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Ponting','string',''),(133,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Beuk?','string',''),(134,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Bark','string',''),(135,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Scheepje','string',''),(136,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Oorlogschip','string',''),(137,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Schip, admiraalschip','string',''),(138,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Kotter','string',''),(139,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Barcq','string',''),(140,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','Java\'s Noordoostcust','string',''),(141,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','adviesjacht','string',''),(142,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','bootje','string',''),(143,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','brik','string',''),(144,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','buis','string',''),(145,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','fluit','string',''),(146,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','fluitje','string',''),(147,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','galjootje','string',''),(148,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','hekboot','string',''),(149,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','jacht','string',''),(150,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','jachtje','string',''),(151,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','kat','string',''),(152,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','logger','string',''),(153,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','loodsboot','string',''),(154,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','paketboot','string',''),(155,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','pinas','string',''),(156,'Type of ship','DAS_Schip','ORGANIZATION','TYPE_SHIP','pink','string',''),(157,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,'onbcategory','DAS_Bemanning','CONTEXT','TYPE_CREW','DEFINITION','string','Betere type naam geven. In kolom I t/m VI staat waarde. kijken hoe hier mee om te gaan'),(162,'onbcategory','DAS_Bemanning','CONTEXT','TYPE_CREW','Seafarers','string',''),(163,'onbcategory','DAS_Bemanning','CONTEXT','TYPE_CREW','Soldiers','string',''),(164,'onbcategory','DAS_Bemanning','CONTEXT','TYPE_CREW','Passengers','string',''),(165,'onbcategory','DAS_Bemanning','CONTEXT','TYPE_CREW','Craftsmen','string',''),(166,'onbcategory','DAS_Bemanning','CONTEXT','TYPE_CREW','Impotenten','string',''),(169,'onbcategory','DAS_Bemanning','CONTEXT','TYPE_CREW','Total','string',''),(171,'I','DAS_Bemanning','CONTEXT','CREW_NUMBER','DEFINITION','enum','Wel een probleem dat we niet zeker weten wat I-VI betekent'),(172,'',NULL,'','','','',NULL),(173,NULL,'DAS_Schip','CONTEXT','JOURNEY','DEFINITION','string','Period is departure datum Holland en Arrival datum Indië'),(174,NULL,'DAS_Schip','CONTEXT','JOURNEY','\"Holland-East-Indies\"','string','Default-value'),(175,'Arrival at Cape','DAS_Schip','CONTEXT','JOURNEY','\"Holland-Cape-East Indies\"','string','If field is not null'),(177,'Place of departure','DAS_Schip','CONTEXT','LOCATION_DEPARTURE','DEFINITION','string(255)','Place/date one record in CONTEXT'),(178,'Date of departure','DAS_Schip','CONTEXT','DATE_DEPARTURE','Timestamp',NULL,'Timestamp'),(183,'Place of arrival','DAS_Schip','CONTEXT','LOCATION_ARRIVAL','DEFINITION','string','Place/date one record in CONTEXT'),(184,'Date of arrival at destination','DAS_Schip','CONTEXT','DATE_ARRIVAL','Timestamp',NULL,''),(194,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(195,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(196,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(197,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(198,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(201,NULL,'DAS_Schip','ORG_CONTEXT','Id_O',NULL,NULL,'Beide nummers zelfde bron geen probleem;'),(202,NULL,'DAS_Schip','ORG_CONTEXT','Id_C',NULL,NULL,NULL),(203,NULL,'DAS_Schip','ORG_CONTEXT','Geen relatie',NULL,NULL,NULL),(204,NULL,NULL,NULL,'timestamp',NULL,NULL,'Als bij JOURNEY'),(205,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(290,NULL,'DAS_Schip','INDIV_ORG','Id_O','Number','int',NULL),(291,'','DAS_Schip','INDIV_ORG','Id_I','Number','',''),(292,NULL,'DAS_Schip','INDIV_ORG','Relation','Captain','string(10)','Als veld master is ingevuld, dan relatie schip en persoon is Captain'),(293,NULL,'DAS_Schip',NULL,'timestamp',NULL,NULL,'Alleen datum nemen, als einde periode MonthYear'),(294,'FIRST_NAME','DAS_Schip','INDIVIDUAL','FIRST_NAME','DEFINITION','string(255)','Let op: Achternaam, voornaam prefix'),(295,'PREFIX_LAST_NAME','DAS_Schip','INDIVIDUAL','PREFIX_LAST_NAME','DEFINITION','string(255)',''),(296,'LAST_NAME','DAS_Schip','INDIVIDUAL','LAST_NAME','DEFINITION','string(255)',''),(297,'Master','DAS_Schip','INDIVIDUAL','',NULL,NULL,'Timestamp   Missing:  Time Invariant');
/*!40000 ALTER TABLE `DAS_map` ENABLE KEYS */;
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
