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
-- Table structure for table `DAS_Bemanning`
--

DROP TABLE IF EXISTS `DAS_Bemanning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DAS_Bemanning` (
  `Number` varchar(9) DEFAULT NULL,
  `onbcategory` varchar(10) DEFAULT NULL,
  `I` varchar(10) DEFAULT NULL,
  `II` varchar(3) DEFAULT NULL,
  `III` varchar(3) DEFAULT NULL,
  `IV` varchar(3) DEFAULT NULL,
  `V` varchar(3) DEFAULT NULL,
  `VI` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DAS_SCHIP`
--

DROP TABLE IF EXISTS `DAS_SCHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DAS_SCHIP` (
  `Number` varchar(9) DEFAULT NULL,
  `Name of ship` varchar(34) DEFAULT NULL,
  `Master` varchar(50) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `PREFIX_LAST_NAME` varchar(255) DEFAULT NULL,
  `Hulp` int(11) DEFAULT NULL,
  `Tonnage` varchar(9) DEFAULT NULL,
  `Type of ship` varchar(19) DEFAULT NULL,
  `Built` varchar(19) DEFAULT NULL,
  `Yard` varchar(9) DEFAULT NULL,
  `Chamber` varchar(15) DEFAULT NULL,
  `Date of departure` varchar(16) DEFAULT NULL,
  `Place of departure` varchar(14) DEFAULT NULL,
  `Arrival at Cape` varchar(12) DEFAULT NULL,
  `Departure from Cape` varchar(12) DEFAULT NULL,
  `Date of arrival at destination` varchar(17) DEFAULT NULL,
  `Place of arrival` varchar(15) DEFAULT NULL,
  `Chamber_destination_cargo` varchar(49) DEFAULT NULL,
  `Particulars` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-29 16:47:31
