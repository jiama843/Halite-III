-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Halite
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `Game`
--

DROP TABLE IF EXISTS `Game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Game` (
  `gameID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `replayName` varchar(64) NOT NULL,
  `mapWidth` smallint(5) NOT NULL,
  `mapHeight` smallint(5) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=407227 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GameUser`
--

DROP TABLE IF EXISTS `GameUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GameUser` (
  `gameID` mediumint(8) unsigned NOT NULL,
  `userID` mediumint(8) unsigned NOT NULL,
  `errorLogName` varchar(64) DEFAULT NULL,
  `rank` smallint(5) unsigned NOT NULL,
  `playerIndex` smallint(5) unsigned NOT NULL,
  `territoryAverage` float(8,5) NOT NULL,
  `productionAverage` float(8,5) NOT NULL,
  `strengthAverage` float(8,5) NOT NULL,
  `stillPercentage` float(8,5) NOT NULL,
  `turnTimeAverage` float(8,5) NOT NULL,
  `didTimeout` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `userID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` smallint(5) unsigned NOT NULL,
  `email` varchar(32) NOT NULL,
  `verificationCode` varchar(32) DEFAULT NULL,
  `isVerified` tinyint(1) NOT NULL,
  `language` varchar(16) DEFAULT NULL,
  `mu` float unsigned NOT NULL,
  `sigma` float unsigned NOT NULL,
  `rank` smallint(5) DEFAULT NULL,
  `numSubmissions` smallint(5) NOT NULL,
  `numGames` smallint(5) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserExtraStats`
--

DROP TABLE IF EXISTS `UserExtraStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserExtraStats` (
  `userID` mediumint(8) unsigned NOT NULL,
  `territoryAverage` float(8,5) NOT NULL,
  `strengthAverage` float(8,5) NOT NULL,
  `productionAverage` float(8,5) NOT NULL,
  `stillPercentage` float(8,5) NOT NULL,
  `turnTimeAverage` float(8,5) NOT NULL,
  `territoryRanking` smallint(5) NOT NULL,
  `strengthRanking` smallint(5) NOT NULL,
  `productionRanking` smallint(5) NOT NULL,
  `stillRanking` smallint(5) NOT NULL,
  `turnTimeRanking` smallint(5) NOT NULL,
  `timeoutRanking` smallint(5) NOT NULL,
  `didTimeout` float(8,5) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserHistory`
--

DROP TABLE IF EXISTS `UserHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserHistory` (
  `userID` mediumint(8) unsigned NOT NULL,
  `versionNumber` smallint(5) NOT NULL,
  `lastRank` smallint(5) NOT NULL,
  `lastNumPlayers` smallint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Announcement`
--

DROP TABLE IF EXISTS `Announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Announcement` (
  `announcementID` mediumint(8) unsigned NOT NULL,
  `header` varchar(64) NOT NULL,
  `body` varchar(512) NOT NULL,
  PRIMARY KEY (`announcementID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DoneWithAnnouncement`
--

DROP TABLE IF EXISTS `DoneWithAnnouncement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoneWithAnnouncement` (
  `announcementID` mediumint(8) unsigned NOT NULL,
  `userID` mediumint(8) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Worker`
--

DROP TABLE IF EXISTS `Worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Worker` (
  `apiKey` smallint(5) unsigned NOT NULL,
  `ipAddress` varchar(32) NOT NULL,
  `numGames` mediumint(8) NOT NULL,
  `numCompiles` smallint(5) NOT NULL,
  `lastRequestTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(16) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-22 16:25:27
