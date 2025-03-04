-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: comunion
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `comer`
--

DROP TABLE IF EXISTS `comer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comer` (
  `id` bigint(20) NOT NULL,
  `address` char(42) DEFAULT NULL COMMENT 'comer could save some useful info on block chain with this address',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0  COMMENT 'Is Deleted',
  PRIMARY KEY (`id`),
  UNIQUE KEY `comer_address_uindex` (`address`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comer_account`
--

DROP TABLE IF EXISTS `comer_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comer_account` (
  `id` bigint(20) NOT NULL,
  `comer_id` bigint(20) NOT NULL COMMENT 'comer unique identifier',
  `oin` varchar(100) NOT NULL COMMENT 'comer outer account unique identifier, wallet will be public key and Oauth is the OauthID',
  `is_primary` tinyint(1) NOT NULL COMMENT 'comer use this account as primay account',
  `nick` varchar(50) NOT NULL COMMENT 'comer nick name',
  `avatar` varchar(255) NOT NULL COMMENT 'avatar link address',
  `type` int(11) NOT NULL COMMENT '1 for github 2 for twitter 3 for facebook 4 for likedin 5 for google',
  `is_linked` tinyint(1) NOT NULL COMMENT '0 for unlink 1 for linked',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0  COMMENT 'Is Deleted',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comer_account_oin_uindex` (`oin`) USING BTREE,
  KEY `comer_account_comer_id_index` (`comer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comer_profile`
--

DROP TABLE IF EXISTS `comer_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comer_profile` (
  `id` bigint(20) NOT NULL,
  `comer_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'name',
  `avatar` varchar(50) NOT NULL COMMENT 'avatar',
  `location` char(42) NOT NULL COMMENT 'location city',
  `website` varchar(50) DEFAULT NULL COMMENT 'website',
  `bio` varchar(255) DEFAULT NULL COMMENT 'bio',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0  COMMENT 'Is Deleted',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comer_profile_comer_id_index` (`comer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `comer_skill`
--

DROP TABLE IF EXISTS `comer_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comer_skill` (
  `id` bigint(20) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT 'name',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0  COMMENT 'Is Deleted',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comer_skill_rel`
--

DROP TABLE IF EXISTS `comer_skill_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comer_skill_rel` (
  `id` bigint(20) NOT NULL,
  `comer_id` bigint(20) NOT NULL COMMENT 'comer id',
  `skill_id` bigint(20) NOT NULL COMMENT 'skill id',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0  COMMENT 'Is Deleted',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comer_id_skill_id` (`comer_id`,`skill_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 12:11:51
