-- MySQL dump 10.13  Distrib 5.5.47, for Linux (x86_64)
--
-- Host: localhost    Database: 5_migranten
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
-- Table structure for table `migranten_map`
--

DROP TABLE IF EXISTS `migranten_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migranten_map` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Migranten db` varchar(17) DEFAULT NULL,
  `Table` varchar(20) DEFAULT NULL,
  `Type_T` varchar(20) DEFAULT NULL,
  `Type` varchar(35) DEFAULT NULL,
  `Value` varchar(35) DEFAULT NULL,
  `DataType` varchar(11) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solrimport`
--

DROP TABLE IF EXISTS `solrimport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solrimport` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdOrg` int(11) DEFAULT NULL,
  `Naam` varchar(255) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `KvKNummer` varchar(50) DEFAULT NULL,
  `VSNummer` varchar(255) DEFAULT NULL,
  `StJaar` int(11) DEFAULT NULL,
  `BronStJaar` varchar(255) DEFAULT NULL,
  `OphJaar` int(11) DEFAULT NULL,
  `Eindjaar` int(11) DEFAULT NULL,
  `BronOphJaar` varchar(255) DEFAULT NULL,
  `IsOph` varchar(50) DEFAULT NULL,
  `Dossier` varchar(50) DEFAULT NULL,
  `Internet` varchar(255) DEFAULT NULL,
  `TrefwoordKvK` varchar(50) DEFAULT NULL,
  `Doelstelling` varchar(50) DEFAULT NULL,
  `Etniciteit` varchar(50) DEFAULT NULL,
  `Herkomstregio` varchar(255) DEFAULT NULL,
  `Herkomststad` varchar(255) DEFAULT NULL,
  `Herkomstland` varchar(45) DEFAULT NULL,
  `Land` varchar(50) DEFAULT NULL,
  `Religie` varchar(50) DEFAULT NULL,
  `Schaal` varchar(50) DEFAULT NULL,
  `Plaats` varchar(50) DEFAULT NULL,
  `Soort` varchar(50) DEFAULT NULL,
  `MEMBERSHIP_TOTAL` varchar(45) DEFAULT NULL,
  `PROVENANCE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6210 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldoelstelling`
--

DROP TABLE IF EXISTS `tbldoelstelling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldoelstelling` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdDoelstelling` int(11) DEFAULT NULL,
  `Doelstelling` varchar(50) DEFAULT NULL,
  `Doelstelling_en` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbletniciteit`
--

DROP TABLE IF EXISTS `tbletniciteit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbletniciteit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdEtniciteit` int(11) DEFAULT NULL,
  `Etniciteit` varchar(50) DEFAULT NULL,
  `Etniciteit_en` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblherkomstregio`
--

DROP TABLE IF EXISTS `tblherkomstregio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblherkomstregio` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IDHerkomstRegio` int(11) DEFAULT NULL,
  `Herkomstregio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblherkomststad`
--

DROP TABLE IF EXISTS `tblherkomststad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblherkomststad` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IDHerkomststad` int(11) DEFAULT NULL,
  `Herkomststad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblimport`
--

DROP TABLE IF EXISTS `tblimport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblimport` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Import_ID` int(11) DEFAULT NULL,
  `Scholar_Id` int(11) DEFAULT NULL,
  `Import_date` datetime DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblkoppelpersorg`
--

DROP TABLE IF EXISTS `tblkoppelpersorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblkoppelpersorg` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdOrg` int(11) DEFAULT NULL,
  `IdPers` int(11) DEFAULT NULL,
  `Begin` int(11) DEFAULT NULL,
  `BeginKwa` varchar(50) DEFAULT NULL,
  `Eind` int(11) DEFAULT NULL,
  `EindKwa` varchar(50) DEFAULT NULL,
  `Functie` varchar(50) DEFAULT NULL,
  `ImportId` int(11) DEFAULT NULL,
  `Scholar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11385 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblland`
--

DROP TABLE IF EXISTS `tblland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblland` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdLand` int(11) DEFAULT NULL,
  `Land` varchar(50) DEFAULT NULL,
  `Land_en` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblorganisatie`
--

DROP TABLE IF EXISTS `tblorganisatie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorganisatie` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdOrg` int(11) DEFAULT NULL,
  `Naam` varchar(255) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `KvKNummer` varchar(50) DEFAULT NULL,
  `VSNummer` varchar(255) DEFAULT NULL,
  `Soort` varchar(50) DEFAULT NULL,
  `Straat` varchar(150) DEFAULT NULL,
  `Huisnr` varchar(50) DEFAULT NULL,
  `Postcode` varchar(50) DEFAULT NULL,
  `Vestigingsplaats` int(11) DEFAULT NULL,
  `Telefoon` varchar(50) DEFAULT NULL,
  `Postadres` varchar(255) DEFAULT NULL,
  `StJaar` int(11) DEFAULT NULL,
  `BronStJaar` varchar(255) DEFAULT NULL,
  `OphJaar` int(11) DEFAULT NULL,
  `BronOphJaar` varchar(255) DEFAULT NULL,
  `IsOph` varchar(50) DEFAULT NULL,
  `Dossier` varchar(50) DEFAULT NULL,
  `Internet` varchar(255) DEFAULT NULL,
  `Auteur` varchar(50) DEFAULT NULL,
  `PubJaar` varchar(50) DEFAULT NULL,
  `Pagina` varchar(50) DEFAULT NULL,
  `TrefwoordKvK` varchar(50) DEFAULT NULL,
  `Sleutelpersoon` varchar(255) DEFAULT NULL,
  `Herkomstland` int(11) DEFAULT NULL,
  `Herkomstregio` int(11) DEFAULT NULL,
  `Herkomststad` int(11) DEFAULT NULL,
  `Etniciteit` int(11) DEFAULT NULL,
  `Religie` int(11) DEFAULT NULL,
  `Doelstelling` int(11) DEFAULT NULL,
  `Schaal` int(11) DEFAULT NULL,
  `Ledental` varchar(255) DEFAULT NULL,
  `Doelgroep` varchar(50) DEFAULT NULL,
  `Doelgroep_en` varchar(50) DEFAULT NULL,
  `Opm` mediumtext,
  `Vestigingsland` int(11) DEFAULT NULL,
  `ImportId` int(11) DEFAULT NULL,
  `Scholar_id` int(11) DEFAULT NULL,
  `Vestiging_pl_text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6210 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblpersoon`
--

DROP TABLE IF EXISTS `tblpersoon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpersoon` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdPers` int(11) DEFAULT NULL,
  `Voornaam` varchar(50) DEFAULT NULL,
  `Voorletters` varchar(50) DEFAULT NULL,
  `Tussenvoegsel` varchar(50) DEFAULT NULL,
  `Achternaam` varchar(50) DEFAULT NULL,
  `Geslacht` varchar(50) DEFAULT NULL,
  `GebDatum` varchar(50) DEFAULT NULL,
  `Geboorteplaats` varchar(50) DEFAULT NULL,
  `Geboorteland` int(11) DEFAULT NULL,
  `Straat` varchar(255) DEFAULT NULL,
  `Plaats` int(11) DEFAULT NULL,
  `Telefoon` varchar(255) DEFAULT NULL,
  `E-mail` varchar(255) DEFAULT NULL,
  `Dossier` bit(1) DEFAULT NULL,
  `Opm` mediumtext,
  `ImportId` int(11) DEFAULT NULL,
  `Scholar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11306 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblplaats`
--

DROP TABLE IF EXISTS `tblplaats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblplaats` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdPlaats` int(11) DEFAULT NULL,
  `Plaats` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblreligie`
--

DROP TABLE IF EXISTS `tblreligie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreligie` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdReligie` int(11) DEFAULT NULL,
  `Religie` varchar(50) DEFAULT NULL,
  `Religie_en` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblschaal`
--

DROP TABLE IF EXISTS `tblschaal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblschaal` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdSchaal` int(11) DEFAULT NULL,
  `Schaal` varchar(50) DEFAULT NULL,
  `Schaal_en` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblscholar`
--

DROP TABLE IF EXISTS `tblscholar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblscholar` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Scholar_Id` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Surname` varchar(100) DEFAULT NULL,
  `DB_naam` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
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
