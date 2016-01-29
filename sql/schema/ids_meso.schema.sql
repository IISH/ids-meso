-- MySQL dump 10.13  Distrib 5.5.47, for Linux (x86_64)
--
-- Host: localhost    Database: ids_meso
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
-- Table structure for table `CONTEXT`
--

DROP TABLE IF EXISTS `CONTEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTEXT` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_D` varchar(100) DEFAULT NULL,
  `Id_C` int(11) DEFAULT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Value` varchar(900) DEFAULT NULL,
  `Date_Type` varchar(50) DEFAULT NULL,
  `Estimation` varchar(50) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Minute` int(11) DEFAULT NULL,
  `Start_Day` int(11) DEFAULT NULL,
  `Start_Month` int(11) DEFAULT NULL,
  `Start_Year` int(11) DEFAULT NULL,
  `End_Day` int(11) DEFAULT NULL,
  `End_Month` int(11) DEFAULT NULL,
  `End_Year` int(11) DEFAULT NULL,
  `Missing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=360442 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONTEXT_BASIC`
--

DROP TABLE IF EXISTS `CONTEXT_BASIC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTEXT_BASIC` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_O` int(11) DEFAULT NULL,
  `plaats` varchar(100) DEFAULT NULL,
  `gemeente` varchar(100) DEFAULT NULL,
  `provincie` varchar(100) DEFAULT NULL,
  `Date_Type` varchar(50) DEFAULT NULL,
  `Estimation` varchar(50) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Minute` int(11) DEFAULT NULL,
  `Start_Day` int(11) DEFAULT NULL,
  `Start_Month` int(11) DEFAULT NULL,
  `Start_Year` int(11) DEFAULT NULL,
  `End_Day` int(11) DEFAULT NULL,
  `End_Month` int(11) DEFAULT NULL,
  `End_Year` int(11) DEFAULT NULL,
  `Missing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONTEXT_CONTEXT`
--

DROP TABLE IF EXISTS `CONTEXT_CONTEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTEXT_CONTEXT` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_D` varchar(100) DEFAULT NULL,
  `Id_C_1` int(11) DEFAULT NULL,
  `Id_C_2` int(11) DEFAULT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `Relation` varchar(100) DEFAULT NULL,
  `Date_Type` varchar(50) DEFAULT NULL,
  `Estimation` varchar(50) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Minute` int(11) DEFAULT NULL,
  `Start_Day` int(11) DEFAULT NULL,
  `Start_Month` int(11) DEFAULT NULL,
  `Start_Year` int(11) DEFAULT NULL,
  `End_Day` int(11) DEFAULT NULL,
  `End_Month` int(11) DEFAULT NULL,
  `End_Year` int(11) DEFAULT NULL,
  `Missing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1646050 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `INDIVIDUAL`
--

DROP TABLE IF EXISTS `INDIVIDUAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDIVIDUAL` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_D` varchar(100) DEFAULT NULL,
  `Id_I` int(11) DEFAULT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Value` varchar(800) DEFAULT NULL,
  `Value_Id_C` varchar(100) DEFAULT NULL,
  `Date_Type` varchar(50) DEFAULT NULL,
  `Estimation` varchar(50) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Minute` int(11) DEFAULT NULL,
  `Start_Day` int(11) DEFAULT NULL,
  `Start_Month` int(11) DEFAULT NULL,
  `Start_Year` int(11) DEFAULT NULL,
  `End_Day` int(11) DEFAULT NULL,
  `End_Month` int(11) DEFAULT NULL,
  `End_Year` int(11) DEFAULT NULL,
  `Missing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=195721 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `INDIV_CONTEXT`
--

DROP TABLE IF EXISTS `INDIV_CONTEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDIV_CONTEXT` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_D` varchar(100) DEFAULT NULL,
  `Id_I` int(11) DEFAULT NULL,
  `Id_C` int(11) DEFAULT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `Relation` varchar(100) DEFAULT NULL,
  `Date_Type` varchar(50) DEFAULT NULL,
  `Estimation` varchar(50) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Minute` int(11) DEFAULT NULL,
  `Start_Day` int(11) DEFAULT NULL,
  `Start_Month` int(11) DEFAULT NULL,
  `Start_Year` int(11) DEFAULT NULL,
  `End_Day` int(11) DEFAULT NULL,
  `End_Month` int(11) DEFAULT NULL,
  `End_Year` int(11) DEFAULT NULL,
  `Missing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `INDIV_INDIV`
--

DROP TABLE IF EXISTS `INDIV_INDIV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDIV_INDIV` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_D` varchar(100) DEFAULT NULL,
  `Id_I_1` int(11) DEFAULT NULL,
  `Id_I_2` int(11) DEFAULT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `Relation` varchar(100) DEFAULT NULL,
  `Date_Type` varchar(50) DEFAULT NULL,
  `Estimation` varchar(50) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Minute` int(11) DEFAULT NULL,
  `Start_Day` int(11) DEFAULT NULL,
  `Start_Month` int(11) DEFAULT NULL,
  `Start_Year` int(11) DEFAULT NULL,
  `End_Day` int(11) DEFAULT NULL,
  `End_Month` int(11) DEFAULT NULL,
  `End_Year` int(11) DEFAULT NULL,
  `Missing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `INDIV_ORG`
--

DROP TABLE IF EXISTS `INDIV_ORG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDIV_ORG` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_D` varchar(100) DEFAULT NULL,
  `Id_I` int(11) DEFAULT NULL,
  `Id_O` int(11) DEFAULT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `Relation` varchar(100) DEFAULT NULL,
  `Date_Type` varchar(50) DEFAULT NULL,
  `Estimation` varchar(50) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Minute` int(11) DEFAULT NULL,
  `Start_Day` int(11) DEFAULT NULL,
  `Start_Month` int(11) DEFAULT NULL,
  `Start_Year` int(11) DEFAULT NULL,
  `End_Day` int(11) DEFAULT NULL,
  `End_Month` int(11) DEFAULT NULL,
  `End_Year` int(11) DEFAULT NULL,
  `Missing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=52172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORGANIZATION`
--

DROP TABLE IF EXISTS `ORGANIZATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORGANIZATION` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_D` varchar(100) DEFAULT NULL,
  `Id_O` int(11) DEFAULT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Value` mediumtext,
  `Value_Id_C` varchar(100) DEFAULT NULL,
  `Date_Type` varchar(50) DEFAULT NULL,
  `Estimation` varchar(50) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Minute` int(11) DEFAULT NULL,
  `Start_Day` int(11) DEFAULT NULL,
  `Start_Month` int(11) DEFAULT NULL,
  `Start_Year` int(11) DEFAULT NULL,
  `End_Day` int(11) DEFAULT NULL,
  `End_Month` int(11) DEFAULT NULL,
  `End_Year` int(11) DEFAULT NULL,
  `Missing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_O` (`Id_O`),
  KEY `Type` (`Type`)
) ENGINE=InnoDB AUTO_INCREMENT=1514393 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG_CONTEXT`
--

DROP TABLE IF EXISTS `ORG_CONTEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORG_CONTEXT` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_D` varchar(100) DEFAULT NULL,
  `Id_O` int(11) DEFAULT NULL,
  `Id_C` int(11) DEFAULT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `Relation` varchar(100) DEFAULT NULL,
  `Date_Type` varchar(50) DEFAULT NULL,
  `Estimation` varchar(50) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Minute` int(11) DEFAULT NULL,
  `Start_Day` int(11) DEFAULT NULL,
  `Start_Month` int(11) DEFAULT NULL,
  `Start_Year` int(11) DEFAULT NULL,
  `End_Day` int(11) DEFAULT NULL,
  `End_Month` int(11) DEFAULT NULL,
  `End_Year` int(11) DEFAULT NULL,
  `Missing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=596761 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG_ORG`
--

DROP TABLE IF EXISTS `ORG_ORG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORG_ORG` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_D` varchar(100) DEFAULT NULL,
  `Id_O_1` int(11) DEFAULT NULL,
  `Id_O_2` int(11) DEFAULT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `Relation` varchar(100) DEFAULT NULL,
  `Date_Type` varchar(50) DEFAULT NULL,
  `Estimation` varchar(50) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Minute` int(11) DEFAULT NULL,
  `Start_Day` int(11) DEFAULT NULL,
  `Start_Month` int(11) DEFAULT NULL,
  `Start_Year` int(11) DEFAULT NULL,
  `End_Day` int(11) DEFAULT NULL,
  `End_Month` int(11) DEFAULT NULL,
  `End_Year` int(11) DEFAULT NULL,
  `Missing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblActies_Bond`
--

DROP TABLE IF EXISTS `tblActies_Bond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblActies_Bond` (
  `ActieID` int(11) DEFAULT NULL,
  `BondID` int(11) DEFAULT NULL,
  `VakcentraleID` int(11) DEFAULT NULL,
  `OrgWaardeBond` varchar(255) DEFAULT NULL,
  `OrgWaardeVakcentrale` varchar(255) DEFAULT NULL,
  `Controleren` tinyint(1) DEFAULT NULL,
  KEY `ActieID` (`ActieID`),
  KEY `VakcentraleID` (`VakcentraleID`)
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

-- Dump completed on 2016-01-29 16:47:31
