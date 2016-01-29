-- MySQL dump 10.13  Distrib 5.5.47, for Linux (x86_64)
--
-- Host: localhost    Database: 7_stakingen
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
-- Table structure for table `Switchboard Items`
--

DROP TABLE IF EXISTS `Switchboard Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Switchboard Items` (
  `SwitchboardID` int(11) NOT NULL,
  `ItemNumber` int(11) NOT NULL DEFAULT '0',
  `ItemText` varchar(255) DEFAULT NULL,
  `Command` int(11) DEFAULT NULL,
  `Argument` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SwitchboardID`,`ItemNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stakingen_map`
--

DROP TABLE IF EXISTS `stakingen_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stakingen_map` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Stakingen db` varchar(92) DEFAULT NULL,
  `Table` varchar(31) DEFAULT NULL,
  `Type_T` varchar(20) DEFAULT NULL,
  `Type` varchar(34) DEFAULT NULL,
  `Value` varchar(35) DEFAULT NULL,
  `DataType` varchar(24) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblAantallen`
--

DROP TABLE IF EXISTS `tblAantallen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblAantallen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AantalType` varchar(100) NOT NULL,
  `AantalType_en` varchar(100) DEFAULT NULL,
  `AantalOmschrijving` varchar(255) DEFAULT NULL,
  `AantalOmschrijving_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActieSoort`
--

DROP TABLE IF EXISTS `tblActieSoort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActieSoort` (
  `ID` int(11) NOT NULL,
  `Actie` varchar(70) DEFAULT NULL,
  `Actie_en` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies`
--

DROP TABLE IF EXISTS `tblActies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ActieSoort` int(11) NOT NULL,
  `JAAR` varchar(4) DEFAULT NULL,
  `MAAND` varchar(2) DEFAULT NULL,
  `DAG` varchar(2) DEFAULT NULL,
  `SektorID` int(11) DEFAULT '0',
  `UitkomstID` int(11) DEFAULT NULL,
  `DUUR` double DEFAULT NULL,
  `VERSLAG` longtext,
  `KarakterID` int(11) DEFAULT NULL,
  `TypeID` int(11) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=16474 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActiesNew`
--

DROP TABLE IF EXISTS `tblActiesNew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActiesNew` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ActieSoort` int(11) NOT NULL,
  `JAAR` varchar(4) DEFAULT NULL,
  `MAAND` varchar(2) DEFAULT NULL,
  `DAG` varchar(2) DEFAULT NULL,
  `SektorID` int(11) DEFAULT '0',
  `UitkomstID` int(11) DEFAULT NULL,
  `DURATION_DAYS` double DEFAULT NULL,
  `REPORT_NL` longtext,
  `KarakterID` int(11) DEFAULT NULL,
  `TypeID` int(11) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  `RESULT` varchar(45) DEFAULT NULL,
  `TYPE_OUTBREAK` varchar(45) DEFAULT NULL,
  `TYPE_ACTION_GENERAL` varchar(45) DEFAULT NULL,
  `TYPE_ACTION` varchar(45) DEFAULT NULL,
  `ECONOMIC_SECTOR` varchar(100) DEFAULT NULL,
  `OCCUPATIONAL_GROUP` varchar(45) DEFAULT NULL,
  `OCCUPATIONAL_GROUP_HISCO` varchar(45) DEFAULT NULL,
  `NAME_TRADE_UNION` varchar(45) DEFAULT NULL,
  `NAME_TRADE_UNION_CENTRAL` varchar(45) DEFAULT NULL,
  `ACTION_CAUSE` varchar(45) DEFAULT NULL,
  `ACTION_CAUSE_MAIN` varchar(45) DEFAULT NULL,
  `GROUP_MAIN` varchar(45) DEFAULT NULL,
  `PROVENANCE` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=16474 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Aantallen`
--

DROP TABLE IF EXISTS `tblActies_Aantallen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Aantallen` (
  `ActieID` int(11) NOT NULL,
  `AantalID` int(11) NOT NULL,
  `Aantal` int(11) NOT NULL,
  `TYPE` varchar(45) DEFAULT NULL,
  `DAYS_NOT_WORKED_INDIRECT_STRIKERS` int(11) DEFAULT NULL,
  `CAMPAIGNERS` int(11) DEFAULT NULL,
  `DAYS_NOT_WORKED_LOCKED_OUT_WORKERS` int(11) DEFAULT NULL,
  `DAYS_NOT_WORKED_STRIKERS` int(11) DEFAULT NULL,
  `INDIRECT_STRIKERS` int(11) DEFAULT NULL,
  `LAID_OFF__WORKERS` int(11) DEFAULT NULL,
  `LOCKED_OUT_WORKERS` int(11) DEFAULT NULL,
  `NUMBER_ACTIONS` int(11) DEFAULT NULL,
  `NUMBER_COMPANIES_INVOLVED` int(11) DEFAULT NULL,
  `STRIKERS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ActieID`,`AantalID`),
  KEY `AantalID` (`AantalID`),
  KEY `ActieID` (`ActieID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_AndereActie`
--

DROP TABLE IF EXISTS `tblActies_AndereActie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_AndereActie` (
  `ActieID` int(11) NOT NULL,
  `AndereActieID` int(11) NOT NULL,
  PRIMARY KEY (`ActieID`,`AndereActieID`),
  KEY `ActieID` (`ActieID`),
  KEY `AndereActieID` (`AndereActieID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Bedrijf`
--

DROP TABLE IF EXISTS `tblActies_Bedrijf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Bedrijf` (
  `ActieID` int(11) DEFAULT NULL,
  `Bedrijf` varchar(100) DEFAULT NULL,
  `Gevestigd` varchar(100) DEFAULT NULL,
  `Afkomst` varchar(50) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  KEY `ActieID` (`ActieID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Beroep`
--

DROP TABLE IF EXISTS `tblActies_Beroep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Beroep` (
  `ActieID` int(11) NOT NULL,
  `BeroepID` int(11) NOT NULL,
  `OCCUPATIONAL_GROUP` varchar(100) DEFAULT NULL,
  `OCCUPATIONAL_GROUP_HISCO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ActieID`,`BeroepID`),
  KEY `ActieID` (`ActieID`),
  KEY `BeroepID` (`BeroepID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Bond`
--

DROP TABLE IF EXISTS `tblActies_Bond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Bond` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ActieID` int(11) DEFAULT NULL,
  `BondID` int(11) DEFAULT NULL,
  `VakcentraleID` int(11) DEFAULT NULL,
  `OrgWaardeBond` varchar(255) DEFAULT NULL,
  `OrgWaardeVakcentrale` varchar(255) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ActieID` (`ActieID`),
  KEY `VakcentraleID` (`VakcentraleID`)
) ENGINE=MyISAM AUTO_INCREMENT=9700 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Bron`
--

DROP TABLE IF EXISTS `tblActies_Bron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Bron` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ActieID` int(11) NOT NULL,
  `BronID` int(11) DEFAULT NULL,
  `Extra` varchar(255) DEFAULT NULL,
  `PROVENANCE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ActieID` (`ActieID`),
  KEY `BronID` (`BronID`)
) ENGINE=MyISAM AUTO_INCREMENT=35674 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_JaNee`
--

DROP TABLE IF EXISTS `tblActies_JaNee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_JaNee` (
  `ActieID` int(11) NOT NULL,
  `JaNeeID` int(11) NOT NULL,
  `JaNeeAntwoordID` int(11) NOT NULL,
  PRIMARY KEY (`ActieID`,`JaNeeID`),
  KEY `JaNeeID` (`JaNeeID`),
  KEY `ActieID` (`ActieID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Overig`
--

DROP TABLE IF EXISTS `tblActies_Overig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Overig` (
  `ActieID` int(11) DEFAULT NULL,
  `OverigID` int(11) DEFAULT NULL,
  `ExtraInfo` varchar(50) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  KEY `ActieID` (`ActieID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Plaats`
--

DROP TABLE IF EXISTS `tblActies_Plaats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Plaats` (
  `ActieID` int(11) NOT NULL,
  `PlaatsID` int(11) NOT NULL,
  `Locality` varchar(45) DEFAULT NULL,
  `Muncipality` varchar(45) DEFAULT NULL,
  `Chamber-of-Commerce` varchar(45) DEFAULT NULL,
  `Province` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ActieID`,`PlaatsID`),
  KEY `ActieID` (`ActieID`),
  KEY `PlaatsID` (`PlaatsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Reden`
--

DROP TABLE IF EXISTS `tblActies_Reden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Reden` (
  `ActieID` int(11) NOT NULL,
  `RedenCode` varchar(4) NOT NULL,
  `Hoofdreden` int(11) DEFAULT '1',
  PRIMARY KEY (`ActieID`,`RedenCode`),
  KEY `ActieID` (`ActieID`),
  KEY `RedenCode` (`RedenCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_VerbandMet`
--

DROP TABLE IF EXISTS `tblActies_VerbandMet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_VerbandMet` (
  `ActieID` int(11) NOT NULL,
  `RelatieSoortID` int(11) NOT NULL,
  `RelatieActieID` int(11) DEFAULT NULL,
  `OrigineleWaarde` varchar(10) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  KEY `ActieID` (`ActieID`),
  KEY `RelatieActieID` (`RelatieActieID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Voornamelijk`
--

DROP TABLE IF EXISTS `tblActies_Voornamelijk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Voornamelijk` (
  `ActieID` int(11) NOT NULL,
  `VoornamelijkID` int(11) NOT NULL,
  PRIMARY KEY (`ActieID`,`VoornamelijkID`),
  KEY `ActieID` (`ActieID`),
  KEY `VoornamelijkID` (`VoornamelijkID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Werkgeversorganisatie`
--

DROP TABLE IF EXISTS `tblActies_Werkgeversorganisatie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Werkgeversorganisatie` (
  `ActieID` int(11) DEFAULT NULL,
  `WerkgeversorganisatieID` int(11) DEFAULT NULL,
  `Aantal` varchar(50) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  KEY `ActieID` (`ActieID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblAndereActie`
--

DROP TABLE IF EXISTS `tblAndereActie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblAndereActie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AndereActie` varchar(80) NOT NULL,
  `AndereActie_en` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblBeroep`
--

DROP TABLE IF EXISTS `tblBeroep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBeroep` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OMSCHRIJVI` varchar(45) DEFAULT NULL,
  `BEROEP` varchar(20) DEFAULT NULL,
  `HISCO` varchar(50) DEFAULT NULL,
  `PARENTIDS` varchar(50) DEFAULT NULL,
  `OMSCHRIJVI_en` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `BEROEP` (`BEROEP`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=926 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblBeroep_met_engelse_hisco_vertalingen`
--

DROP TABLE IF EXISTS `tblBeroep_met_engelse_hisco_vertalingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBeroep_met_engelse_hisco_vertalingen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OMSCHRIJVI` varchar(45) DEFAULT NULL,
  `BEROEP` varchar(20) DEFAULT NULL,
  `HISCO` varchar(50) DEFAULT NULL,
  `PARENTIDS` varchar(50) DEFAULT NULL,
  `OMSCHRIJVI_en` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `BEROEP` (`BEROEP`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=923 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblBron`
--

DROP TABLE IF EXISTS `tblBron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBron` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SCHRIJVER` varchar(100) DEFAULT NULL,
  `TITEL` varchar(254) DEFAULT NULL,
  `PLAATS` varchar(40) DEFAULT NULL,
  `TIJDSCHRIF` varchar(122) DEFAULT NULL,
  `AFKORTING` varchar(20) NOT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=857 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblJaNee`
--

DROP TABLE IF EXISTS `tblJaNee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblJaNee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JaNeeType` varchar(120) NOT NULL,
  `JaNeeType_en` varchar(120) DEFAULT NULL,
  `JaNeeOmschrijving` varchar(255) DEFAULT NULL,
  `JaNeeOmschrijving_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblJaNeeAntwoord`
--

DROP TABLE IF EXISTS `tblJaNeeAntwoord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblJaNeeAntwoord` (
  `ID` int(11) NOT NULL,
  `JaNee` varchar(10) NOT NULL,
  `JaNee_en` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblJaartallen`
--

DROP TABLE IF EXISTS `tblJaartallen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblJaartallen` (
  `Jaar` varchar(50) NOT NULL,
  PRIMARY KEY (`Jaar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblKarakter`
--

DROP TABLE IF EXISTS `tblKarakter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblKarakter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Karakter` varchar(80) NOT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  `Karakter_en` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblPlaats`
--

DROP TABLE IF EXISTS `tblPlaats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPlaats` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLAATS` varchar(50) NOT NULL,
  `GEMEENTE` varchar(20) DEFAULT NULL,
  `KAMERVKOOP` varchar(20) DEFAULT NULL,
  `PROVINCIE` varchar(50) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PLAATS` (`PLAATS`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1324 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblPopups`
--

DROP TABLE IF EXISTS `tblPopups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPopups` (
  `popupcode` varchar(50) NOT NULL,
  `description` longtext,
  `description_en` longtext,
  PRIMARY KEY (`popupcode`),
  UNIQUE KEY `popupcode` (`popupcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblReden`
--

DROP TABLE IF EXISTS `tblReden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblReden` (
  `REDEN` varchar(4) NOT NULL,
  `EISEN` varchar(255) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  `EISEN_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`REDEN`),
  KEY `REDEN` (`REDEN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblSektor`
--

DROP TABLE IF EXISTS `tblSektor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblSektor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sektor` varchar(100) NOT NULL,
  `Sektor_en` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblType`
--

DROP TABLE IF EXISTS `tblType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) DEFAULT NULL,
  `Type_en` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblUitkomst`
--

DROP TABLE IF EXISTS `tblUitkomst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUitkomst` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Uitkomst` varchar(60) NOT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  `Uitkomst_en` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblVakbeweging`
--

DROP TABLE IF EXISTS `tblVakbeweging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblVakbeweging` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `afkorting` varchar(20) NOT NULL,
  `Bond` varchar(100) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `afkorting` (`afkorting`),
  KEY `Bond` (`Bond`)
) ENGINE=MyISAM AUTO_INCREMENT=471 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblVoornamelijk`
--

DROP TABLE IF EXISTS `tblVoornamelijk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblVoornamelijk` (
  `ID` int(11) NOT NULL,
  `Omschrijving` varchar(50) DEFAULT NULL,
  `Omschrijving_en` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_vakbonden`
--

DROP TABLE IF EXISTS `test_vakbonden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_vakbonden` (
  `ActieID` int(11) DEFAULT NULL,
  `OMSCHRIJVI` varchar(45) DEFAULT NULL,
  `BondID` int(11) DEFAULT NULL,
  `VakcentraleID` int(11) DEFAULT NULL,
  `OrgWaardeBond` varchar(255) DEFAULT NULL,
  `OrgWaardeVakcentrale` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-29 16:47:36
