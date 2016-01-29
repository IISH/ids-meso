-- MySQL dump 10.13  Distrib 5.5.47, for Linux (x86_64)
--
-- Host: localhost    Database: 6_hisvak
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
-- Table structure for table `HISVAK`
--

DROP TABLE IF EXISTS `HISVAK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HISVAK` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Beroep` varchar(255) DEFAULT NULL,
  `Nrorg_std` int(11) DEFAULT NULL,
  `Nmorg_std` varchar(255) DEFAULT NULL,
  `Landelijk` varchar(1) DEFAULT NULL,
  `Afdvan_bewerkt_nr` int(11) DEFAULT '0',
  `Aangsl_bewerkt_nr` int(11) DEFAULT '0',
  `Bedrijfsgroep` varchar(50) DEFAULT NULL,
  `Beroepsgroep` varchar(50) DEFAULT NULL,
  `Plaats_StandaardNaam` varchar(50) DEFAULT NULL,
  `Plaats_Standaardnaam_voor_index` varchar(50) DEFAULT NULL,
  `StandaardGemNaam` varchar(50) DEFAULT NULL,
  `StandaardProvincie` varchar(50) DEFAULT NULL,
  `Richting` varchar(50) DEFAULT NULL,
  `Opr_dag` varchar(10) DEFAULT NULL,
  `Opr_mnd` varchar(10) DEFAULT NULL,
  `Opr_jar` varchar(10) DEFAULT NULL,
  `Oph_dag` varchar(10) DEFAULT NULL,
  `Oph_mnd` varchar(10) DEFAULT NULL,
  `Oph_jar` varchar(10) DEFAULT NULL,
  `Afsplitsvan_Nrorg_std` int(11) DEFAULT NULL,
  `Opvolgervan_Nrorg_std` int(11) DEFAULT NULL,
  `Voortgegaanals_Nrorg_std` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=30744 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HISVAK_BRON`
--

DROP TABLE IF EXISTS `HISVAK_BRON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HISVAK_BRON` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NummerOrg` int(11) DEFAULT NULL,
  `Naamorg` varchar(150) DEFAULT NULL,
  `Nrorg_std` int(11) DEFAULT NULL,
  `Bron` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=65259 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HISVAK_LID`
--

DROP TABLE IF EXISTS `HISVAK_LID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HISVAK_LID` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nummer_lid` int(11) DEFAULT NULL,
  `Jaar` int(11) DEFAULT NULL,
  `Aantalleden` int(11) DEFAULT NULL,
  `Nrorg_std` int(11) DEFAULT NULL,
  `Bronlid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Nummer_lid` (`Nummer_lid`)
) ENGINE=MyISAM AUTO_INCREMENT=1346847 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hisvak_map`
--

DROP TABLE IF EXISTS `hisvak_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hisvak_map` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Vakbond db` varchar(20) DEFAULT NULL,
  `Table` varchar(11) DEFAULT NULL,
  `Type_T` varchar(20) DEFAULT NULL,
  `Type` varchar(19) DEFAULT NULL,
  `Value` varchar(47) DEFAULT NULL,
  `DataType` varchar(43) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-29 16:47:32
