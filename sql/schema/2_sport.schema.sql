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
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sport` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `plaats` varchar(34) DEFAULT NULL,
  `gemeente` varchar(32) DEFAULT NULL,
  `gemeente1984` varchar(28) DEFAULT NULL,
  `provincie` varchar(12) DEFAULT NULL,
  `naam` varchar(102) DEFAULT NULL,
  `opm_naam` varchar(112) DEFAULT NULL,
  `alternatieve_namen` varchar(0) DEFAULT NULL,
  `doelstelling` varchar(1181) DEFAULT NULL,
  `begindatum` varchar(10) DEFAULT NULL,
  `begindatum_soort` varchar(17) DEFAULT NULL,
  `kb` varchar(220) DEFAULT NULL,
  `einddatum` varchar(10) DEFAULT NULL,
  `einddatum_soort` varchar(18) DEFAULT NULL,
  `werkingsgebied` varchar(11) DEFAULT NULL,
  `sport` varchar(10) DEFAULT NULL,
  `landelijke_bond` varchar(0) DEFAULT NULL,
  `regionale_bond` varchar(0) DEFAULT NULL,
  `speeldag` varchar(15) DEFAULT NULL,
  `levensbeschouwing` varchar(23) DEFAULT NULL,
  `nr_verenigingsdossier` varchar(0) DEFAULT NULL,
  `relaties` varchar(0) DEFAULT NULL,
  `oprichters` varchar(570) DEFAULT NULL,
  `bestuursleden` varchar(734) DEFAULT NULL,
  `beschermheren` varchar(631) DEFAULT NULL,
  `verantwoording_gegevens` varchar(3386) DEFAULT NULL,
  `archief_geschreven` varchar(428) DEFAULT NULL,
  `archief_objecten` varchar(771) DEFAULT NULL,
  `eigen_gebouw` varchar(702) DEFAULT NULL,
  `vergaderplaats` varchar(366) DEFAULT NULL,
  `literatuur_over` varchar(0) DEFAULT NULL,
  `publicaties_van` varchar(0) DEFAULT NULL,
  `goossens` varchar(10) DEFAULT NULL,
  `opmerkingen` varchar(2255) DEFAULT NULL,
  `aantekeningen` varchar(0) DEFAULT NULL,
  `naam_nw` varchar(450) DEFAULT NULL,
  `hulpnr` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16955 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-29 16:47:31
