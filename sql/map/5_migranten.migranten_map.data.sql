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
-- Dumping data for table `migranten_map`
--

LOCK TABLES `migranten_map` WRITE;
/*!40000 ALTER TABLE `migranten_map` DISABLE KEYS */;
INSERT INTO `migranten_map` VALUES (0,'','','','','','',''),(1,'IdOrg','solrimport','ORGANIZATION','ORIGINAL_IDENTIFIER','DEFINITION','int(10)',''),(2,NULL,'solrimport','ORGANIZATION','Source','Migrant_organis_CMG_IISH','string',NULL),(3,'','solrimport','ORGANIZATION','TYPE_ORGANIZATION','Migrant Societies','string',''),(5,'Naam','solrimport','ORGANIZATION','NAME','DEFINITION','string(255)',''),(6,'StJaar','solrimport','ORGANIZATION','START_DATE','DEFINITION','enum','Declared  Exact with  Estimation: Year'),(7,'OphJaar','solrimport','ORGANIZATION','END_DATE','DEFINITION','enum','Declared  Exact with  Estimation: Year  if Isoph=J anders geen record'),(8,'','solrimport','ORGANIZATION','Timestamp','DEFINITION','enum','Period / with (End period) unavailable'),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'KvKNummer','solrimport','ORGANIZATION','CHAMBER_OF_COMMERCE_REG_NO','DEFINITION','string',NULL),(12,'TrefwoordKvK','solrimport','ORGANIZATION','CHAMBER_OF_COMMERCE_KEY_WORD','DEFINITION','string',NULL),(13,'Internet','solrimport','ORGANIZATION','INTERNET_ADDRESS','DEFINITION','string','TIMESTAMP MISSING=UNAVAILABLE'),(15,'Doelstelling','solrimport','ORGANIZATION','GOAL','DEFINITION','enum','vanuit aparte tabel Nederlands met Engels vervangen'),(16,'Etniciteit','solrimport','ORGANIZATION','ETHNICITY','DEFINITION','enum','vanuit aparte tabel Nederlands met Engels vervangen'),(17,'Religie','solrimport','ORGANIZATION','RELIGION','DEFINITION','enum','vanuit aparte tabel Nederlands met Engels vervangen'),(18,'Schaal','solrimport','ORGANIZATION','DOMAIN','DEFINITION','enum','vanuit aparte tabel Nederlands met Engels vervangen'),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'Herkomstland','solrimport','ORGANIZATION','COUNTRY_OF_ORIGIN','DEFINITION','enum','Opnieuw ingevuld gelinkt via OrganisatieTabel'),(22,'Ledental','solrimport','ORGANIZATION','MEMBERSHIP_TOTAL','DEFINITION','int(4)','TIMESTAMP: Assigned, date exact 01-01-2000'),(23,'PROVENANCE','solrimport','ORGANIZATION','PROVENANCE','DEFINITION','clob',''),(30,'','','','','','',''),(34,'Status','solrimport','ORGANIZATION',NULL,NULL,NULL,'Meerder waardes mogelijk  BETEKENIS????'),(35,'Soort','solrimport','ORGANIZATION',NULL,NULL,NULL,'Meerder waardes mogelijk  BETEKENIS????'),(115,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,'','','','','','',''),(124,'','','','','','',''),(135,NULL,'tblorganisatie','CONTEXT','LEVEL','DEFINITION','string(255)',NULL),(137,NULL,'tblorganisatie','CONTEXT','LEVEL','Municipality','string(255)',NULL),(138,NULL,'tblorganisatie','CONTEXT','LEVEL','Address','string(255)',NULL),(140,'Vestiging_pl_text','tblorganisatie','CONTEXT','NAME','DEFINITION','string(255)','Level Municipality'),(141,'Postcode','tblorganisatie','CONTEXT','POSTAL_CODE','DEFINITION','string(255)','Level Address'),(142,'Telefoon','tblorganisatie','CONTEXT','TELEPHONE_NO','DEFINITION','string(255)','Level Address'),(147,'Straat','tblorganisatie','CONTEXT','STREET','DEFINITION','string(50)','Level Address'),(148,'Huisnr','tblorganisatie','CONTEXT','HOUSE_NUMBER','DEFINITION','string(50)','inclusief eventuele toevoeging, daarom text (splitsen??)'),(173,'',NULL,'','','','',''),(175,'','tblorganisatie','CONTEXT_CONTEXT','RELATION','Address and municipality','string(255)',''),(177,'','','','','','',''),(178,'','','','','','',''),(179,'IdPers','tblpersoon','INDIVIDUAL','ORIGINAL_IDENTIFIER','DEFINITION','int(4)',''),(180,'Voornaam','tblpersoon','INDIVIDUAL','FIRST_NAME','DEFINITION','string(255)',''),(181,'Voorletters','tblpersoon','INDIVIDUAL','FIRST_NAME_INITIALS','DEFINITION','string(10)','Een of meerdere voorletters'),(182,'Tussenvoegsel','tblpersoon','INDIVIDUAL','PREFIX_LAST_NAME','DEFINITION','string(10)',''),(183,'Achternaam','tblpersoon','INDIVIDUAL','LAST_NAME','DEFINITION','string(255)',''),(184,'Geslacht','tblpersoon','INDIVIDUAL','SEX','DEFINITION','string(255)',''),(185,'Geslacht','tblpersoon','INDIVIDUAL','SEX','Male','string','Man'),(186,'Geslacht','tblpersoon','INDIVIDUAL','SEX','Female','string','Frau'),(187,'Geslacht','tblpersoon','INDIVIDUAL','SEX','Unknown','string','Wanneer niet Man or Frau'),(188,'GebDatum','tblpersoon','INDIVIDUAL','BIRTH_DATE','TIMESTAMP','enum',''),(190,NULL,NULL,NULL,'Timestamp',NULL,NULL,'MISSING Time_Invariant'),(191,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(193,'IdOrg','tblkoppelpersorg','INDIV_ORG','Id_O','DEFINITION',NULL,'+ 5000000'),(194,'IdPers','tblkoppelpersorg','INDIV_ORG','Id_I','DEFINITION',NULL,NULL),(325,'Functie','tblkoppelpersorg','INDIV_ORG','RELATION','DEFINITION','enum','Beginjaar en Eindjaar als Timestamp opnemen'),(326,'Functie','tblkoppelpersorg','INDIV_ORG','RELATION','Chairman','enum','Origineel opnemen moet langs vertaaltabel'),(327,'Functie','tblkoppelpersorg','INDIV_ORG','RELATION','Vice-Chairman','enum',''),(328,'Functie','tblkoppelpersorg','INDIV_ORG','RELATION','Chamberlain','enum',''),(329,'Functie','tblkoppelpersorg','INDIV_ORG','RELATION','Secretary','enum',''),(330,'Functie','tblkoppelpersorg','INDIV_ORG','RELATION','Contactperson','enum',''),(331,'Functie','tblkoppelpersorg','INDIV_ORG','RELATION','Member','enum',''),(332,'Functie','tblkoppelpersorg','INDIV_ORG','RELATION','Director','enum',''),(333,'Functie','tblkoppelpersorg','INDIV_ORG','RELATION','Founder','enum',''),(334,'Begin','tblkoppelpersorg','INDIV_ORG','Timestamp',NULL,NULL,'Combinatie van Begin en Eind'),(335,'Eind','tblkoppelpersorg','INDIV_ORG','Timestamp',NULL,NULL,'Combinatie van Begin en Eind');
/*!40000 ALTER TABLE `migranten_map` ENABLE KEYS */;
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
