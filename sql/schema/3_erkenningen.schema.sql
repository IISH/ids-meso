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
-- Table structure for table `erkenningen`
--

DROP TABLE IF EXISTS `erkenningen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erkenningen` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `plaats` varchar(41) DEFAULT NULL,
  `gemeente` varchar(32) DEFAULT NULL,
  `provincie` varchar(12) DEFAULT NULL,
  `bisdom` varchar(0) DEFAULT NULL,
  `naam` varchar(241) DEFAULT NULL,
  `opm_naam` varchar(0) DEFAULT NULL,
  `alternatieve_namen` varchar(0) DEFAULT NULL,
  `doelstelling` varchar(1249) DEFAULT NULL,
  `begindatum` varchar(10) DEFAULT NULL,
  `begindatum_soort` varchar(0) DEFAULT NULL,
  `kb` varchar(7) DEFAULT NULL,
  `einddatum` varchar(10) DEFAULT NULL,
  `einddatum_soort` varchar(0) DEFAULT NULL,
  `werkingsgebied` varchar(0) DEFAULT NULL,
  `parochie` varchar(0) DEFAULT NULL,
  `grondslag` varchar(0) DEFAULT NULL,
  `activiteit` varchar(0) DEFAULT NULL,
  `sport` varchar(0) DEFAULT NULL,
  `landelijke_bond` varchar(0) DEFAULT NULL,
  `regionale_bond` varchar(0) DEFAULT NULL,
  `speeldag` varchar(0) DEFAULT NULL,
  `doelgroepen` varchar(0) DEFAULT NULL,
  `richtgroepen` varchar(0) DEFAULT NULL,
  `soort_politieke_vereniging` varchar(0) DEFAULT NULL,
  `levensbeschouwing` varchar(0) DEFAULT NULL,
  `nr_verenigingsdossier` varchar(68) DEFAULT NULL,
  `relaties` varchar(0) DEFAULT NULL,
  `oprichters` varchar(0) DEFAULT NULL,
  `bestuursleden` varchar(0) DEFAULT NULL,
  `beschermheren` varchar(0) DEFAULT NULL,
  `verantwoording_gegevens` varchar(13) DEFAULT NULL,
  `inlichting_niet_ontvangen` varchar(0) DEFAULT NULL,
  `staatscourant` varchar(121) DEFAULT NULL,
  `archief_geschreven` varchar(13) DEFAULT NULL,
  `archief_objecten` varchar(0) DEFAULT NULL,
  `eigen_gebouw` varchar(0) DEFAULT NULL,
  `vergaderplaats` varchar(0) DEFAULT NULL,
  `literatuur_over` varchar(0) DEFAULT NULL,
  `publicaties_van` varchar(0) DEFAULT NULL,
  `goossens` varchar(22) DEFAULT NULL,
  `opmerkingen` varchar(675) DEFAULT NULL,
  `oprichtingsdatum` varchar(0) DEFAULT NULL,
  `aantekeningen` varchar(0) DEFAULT NULL,
  `provenance` varchar(193) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-29 16:47:31
