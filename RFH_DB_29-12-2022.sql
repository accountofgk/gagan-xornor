-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: rfhpsf_db
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pivot_action_logs`
--

DROP TABLE IF EXISTS `pivot_action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_action_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_time` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL COMMENT 'User ID',
  `hospital_id` int unsigned NOT NULL,
  `reader_id` int unsigned NOT NULL,
  `module` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_action_logs`
--

LOCK TABLES `pivot_action_logs` WRITE;
/*!40000 ALTER TABLE `pivot_action_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_action_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_activations`
--

DROP TABLE IF EXISTS `pivot_activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_activations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_activations`
--

LOCK TABLES `pivot_activations` WRITE;
/*!40000 ALTER TABLE `pivot_activations` DISABLE KEYS */;
INSERT INTO `pivot_activations` VALUES (1,1,'5fXvT93pQKekBULlVGNrZ8wZptxLvupn',1,'2019-10-01 06:20:05','2019-10-01 06:20:05','2019-10-01 06:20:05'),(2,2,'UdQdkwLLNFopdaYxrBopm2LFz6xGrCMJ',1,'2019-10-01 06:20:05','2019-10-01 06:20:05','2019-10-01 06:20:05'),(3,3,'fWuGOGOPUGIj9fJH6thxGZKfW0GUthS7',1,'2022-12-29 06:00:01','2022-12-29 06:00:01','2022-12-29 06:00:01');
/*!40000 ALTER TABLE `pivot_activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_alert_incidents`
--

DROP TABLE IF EXISTS `pivot_alert_incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_alert_incidents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `raised_by` int unsigned NOT NULL,
  `incident_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `type` enum('ALERT','INCIDENT') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `creation_type` enum('USER','SYSTEM') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'USER',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'NULL' COMMENT ' Image of instrument added by user with marking action',
  `set_id` int unsigned NOT NULL,
  `set_uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `instrument_id` int unsigned NOT NULL,
  `batch_id` int NOT NULL,
  `department_id` int unsigned NOT NULL,
  `status` enum('DONE','PENDING','DISCUSSION','REPLY','RESOLVE','ASSIGN','REOPEN','OPEN') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `incident_type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `incident_by` int unsigned NOT NULL,
  `reopened_by` int NOT NULL,
  `cc_to` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `is_read` double NOT NULL DEFAULT '0',
  `is_archived` double NOT NULL DEFAULT '0',
  `instrument_type` enum('ID','CODE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'ID' COMMENT 'Setting for Instrument Level or Not',
  PRIMARY KEY (`id`),
  KEY `alert_incidents_raised_by_foreign` (`raised_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_alert_incidents`
--

LOCK TABLES `pivot_alert_incidents` WRITE;
/*!40000 ALTER TABLE `pivot_alert_incidents` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_alert_incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_api_request`
--

DROP TABLE IF EXISTS `pivot_api_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_api_request` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `api_request_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `api_request_type` enum('Inventory','Case Schedule','Consumption Tracking') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `api_callback_status` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_process` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0' COMMENT '1 for processed and 0 for new request 2 for unprocessed',
  `is_csv_process` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_api_request`
--

LOCK TABLES `pivot_api_request` WRITE;
/*!40000 ALTER TABLE `pivot_api_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_api_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_applicable_processes`
--

DROP TABLE IF EXISTS `pivot_applicable_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_applicable_processes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_applicable_processes`
--

LOCK TABLES `pivot_applicable_processes` WRITE;
/*!40000 ALTER TABLE `pivot_applicable_processes` DISABLE KEYS */;
INSERT INTO `pivot_applicable_processes` VALUES (1,'Packing','2022-07-07 02:30:21','2022-07-07 02:30:21'),(2,'Sterilization','2022-07-07 02:31:49','2022-07-07 02:31:49');
/*!40000 ALTER TABLE `pivot_applicable_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_assets_type_shortcodes`
--

DROP TABLE IF EXISTS `pivot_assets_type_shortcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_assets_type_shortcodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `short_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_assets_type_shortcodes`
--

LOCK TABLES `pivot_assets_type_shortcodes` WRITE;
/*!40000 ALTER TABLE `pivot_assets_type_shortcodes` DISABLE KEYS */;
INSERT INTO `pivot_assets_type_shortcodes` VALUES (1,'tray','T','2019-10-01 08:50:03','2019-10-01 08:50:03'),(2,'instrument','I','2019-10-01 08:50:03','2019-10-01 08:50:03'),(3,'assembly','A','2019-10-01 08:50:03','2019-10-01 08:50:03'),(4,'subpart','P','2019-10-01 08:50:03','2019-10-01 08:50:03'),(5,'non_instrument','N','2019-10-01 08:50:03','2019-10-01 08:50:03'),(6,'set','S','2019-10-01 08:50:03','2019-10-01 08:50:03'),(7,'loose_instrument','L','2019-10-01 08:50:03','2019-10-01 08:50:03');
/*!40000 ALTER TABLE `pivot_assets_type_shortcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_audit_queue`
--

DROP TABLE IF EXISTS `pivot_audit_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_audit_queue` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `reader_id` int unsigned NOT NULL,
  `socket_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tags` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `department_id` int unsigned DEFAULT NULL,
  `status` enum('INPROGRESS','COMPLETE','FAILED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_audit_queue`
--

LOCK TABLES `pivot_audit_queue` WRITE;
/*!40000 ALTER TABLE `pivot_audit_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_audit_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_audits`
--

DROP TABLE IF EXISTS `pivot_audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_audits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `auditable_id` int unsigned NOT NULL,
  `auditable_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `old_values` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `new_values` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_id_auditable_type_index` (`auditable_id`,`auditable_type`),
  KEY `audits_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_audits`
--

LOCK TABLES `pivot_audits` WRITE;
/*!40000 ALTER TABLE `pivot_audits` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_batch_cycle_reports`
--

DROP TABLE IF EXISTS `pivot_batch_cycle_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_batch_cycle_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `aws_status` tinyint NOT NULL DEFAULT '0',
  `uploaded_by` int NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_batch_cycle_reports`
--

LOCK TABLES `pivot_batch_cycle_reports` WRITE;
/*!40000 ALTER TABLE `pivot_batch_cycle_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_batch_cycle_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_batch_process_log`
--

DROP TABLE IF EXISTS `pivot_batch_process_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_batch_process_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int NOT NULL,
  `user_id` int NOT NULL,
  `row` int NOT NULL,
  `coloumn_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `header` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `file_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_batch_process_log`
--

LOCK TABLES `pivot_batch_process_log` WRITE;
/*!40000 ALTER TABLE `pivot_batch_process_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_batch_process_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_bulk_approval_csv_request`
--

DROP TABLE IF EXISTS `pivot_bulk_approval_csv_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_bulk_approval_csv_request` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `hospital_id` int NOT NULL,
  `api_request_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'instruments',
  `filename` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_entry` tinyint NOT NULL DEFAULT '0',
  `status_summary` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('PENDING','FAILED','SUCCESS') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_bulk_approval_csv_request`
--

LOCK TABLES `pivot_bulk_approval_csv_request` WRITE;
/*!40000 ALTER TABLE `pivot_bulk_approval_csv_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_bulk_approval_csv_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_bulk_inventory_approval_csv_log`
--

DROP TABLE IF EXISTS `pivot_bulk_inventory_approval_csv_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_bulk_inventory_approval_csv_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `api_request_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` int NOT NULL,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `header` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `row` tinyint DEFAULT NULL,
  `coloumn_name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `total_entry` tinyint DEFAULT NULL,
  `status` enum('FAIL') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'FAIL',
  `request_status` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_bulk_inventory_approval_csv_log`
--

LOCK TABLES `pivot_bulk_inventory_approval_csv_log` WRITE;
/*!40000 ALTER TABLE `pivot_bulk_inventory_approval_csv_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_bulk_inventory_approval_csv_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cities`
--

DROP TABLE IF EXISTS `pivot_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `population` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4080 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cities`
--

LOCK TABLES `pivot_cities` WRITE;
/*!40000 ALTER TABLE `pivot_cities` DISABLE KEYS */;
INSERT INTO `pivot_cities` VALUES (1,'Kabul','AFG','Kabol',1780000,NULL,NULL),(2,'Qandahar','AFG','Qandahar',237500,NULL,NULL),(3,'Herat','AFG','Herat',186800,NULL,NULL),(4,'Mazar-e-Sharif','AFG','Balkh',127800,NULL,NULL),(5,'Amsterdam','NLD','Noord-Holland',731200,NULL,NULL),(6,'Rotterdam','NLD','Zuid-Holland',593321,NULL,NULL),(7,'Haag','NLD','Zuid-Holland',440900,NULL,NULL),(8,'Utrecht','NLD','Utrecht',234323,NULL,NULL),(9,'Eindhoven','NLD','Noord-Brabant',201843,NULL,NULL),(10,'Tilburg','NLD','Noord-Brabant',193238,NULL,NULL),(11,'Groningen','NLD','Groningen',172701,NULL,NULL),(12,'Breda','NLD','Noord-Brabant',160398,NULL,NULL),(13,'Apeldoorn','NLD','Gelderland',153491,NULL,NULL),(14,'Nijmegen','NLD','Gelderland',152463,NULL,NULL),(15,'Enschede','NLD','Overijssel',149544,NULL,NULL),(16,'Haarlem','NLD','Noord-Holland',148772,NULL,NULL),(17,'Almere','NLD','Flevoland',142465,NULL,NULL),(18,'Arnhem','NLD','Gelderland',138020,NULL,NULL),(19,'Zaanstad','NLD','Noord-Holland',135621,NULL,NULL),(20,'´s-Hertogenbosch','NLD','Noord-Brabant',129170,NULL,NULL),(21,'Amersfoort','NLD','Utrecht',126270,NULL,NULL),(22,'Maastricht','NLD','Limburg',122087,NULL,NULL),(23,'Dordrecht','NLD','Zuid-Holland',119811,NULL,NULL),(24,'Leiden','NLD','Zuid-Holland',117196,NULL,NULL),(25,'Haarlemmermeer','NLD','Noord-Holland',110722,NULL,NULL),(26,'Zoetermeer','NLD','Zuid-Holland',110214,NULL,NULL),(27,'Emmen','NLD','Drenthe',105853,NULL,NULL),(28,'Zwolle','NLD','Overijssel',105819,NULL,NULL),(29,'Ede','NLD','Gelderland',101574,NULL,NULL),(30,'Delft','NLD','Zuid-Holland',95268,NULL,NULL),(31,'Heerlen','NLD','Limburg',95052,NULL,NULL),(32,'Alkmaar','NLD','Noord-Holland',92713,NULL,NULL),(33,'Willemstad','ANT','Curaçao',2345,NULL,NULL),(34,'Tirana','ALB','Tirana',270000,NULL,NULL),(35,'Alger','DZA','Alger',2168000,NULL,NULL),(36,'Oran','DZA','Oran',609823,NULL,NULL),(37,'Constantine','DZA','Constantine',443727,NULL,NULL),(38,'Annaba','DZA','Annaba',222518,NULL,NULL),(39,'Batna','DZA','Batna',183377,NULL,NULL),(40,'Sétif','DZA','Sétif',179055,NULL,NULL),(41,'Sidi Bel Abbès','DZA','Sidi Bel Abbès',153106,NULL,NULL),(42,'Skikda','DZA','Skikda',128747,NULL,NULL),(43,'Biskra','DZA','Biskra',128281,NULL,NULL),(44,'Blida (el-Boulaida)','DZA','Blida',127284,NULL,NULL),(45,'Béjaïa','DZA','Béjaïa',117162,NULL,NULL),(46,'Mostaganem','DZA','Mostaganem',115212,NULL,NULL),(47,'Tébessa','DZA','Tébessa',112007,NULL,NULL),(48,'Tlemcen (Tilimsen)','DZA','Tlemcen',110242,NULL,NULL),(49,'Béchar','DZA','Béchar',107311,NULL,NULL),(50,'Tiaret','DZA','Tiaret',100118,NULL,NULL),(51,'Ech-Chleff (el-Asnam)','DZA','Chlef',96794,NULL,NULL),(52,'Ghardaïa','DZA','Ghardaïa',89415,NULL,NULL),(53,'Tafuna','ASM','Tutuila',5200,NULL,NULL),(54,'Fagatogo','ASM','Tutuila',2323,NULL,NULL),(55,'Andorra la Vella','AND','Andorra la Vella',21189,NULL,NULL),(56,'Luanda','AGO','Luanda',2022000,NULL,NULL),(57,'Huambo','AGO','Huambo',163100,NULL,NULL),(58,'Lobito','AGO','Benguela',130000,NULL,NULL),(59,'Benguela','AGO','Benguela',128300,NULL,NULL),(60,'Namibe','AGO','Namibe',118200,NULL,NULL),(61,'South Hill','AIA','–',961,NULL,NULL),(62,'The Valley','AIA','–',595,NULL,NULL),(63,'Saint John´s','ATG','St John',24000,NULL,NULL),(64,'Dubai','ARE','Dubai',669181,NULL,NULL),(65,'Abu Dhabi','ARE','Abu Dhabi',398695,NULL,NULL),(66,'Sharja','ARE','Sharja',320095,NULL,NULL),(67,'al-Ayn','ARE','Abu Dhabi',225970,NULL,NULL),(68,'Ajman','ARE','Ajman',114395,NULL,NULL),(69,'Buenos Aires','ARG','Distrito Federal',2982146,NULL,NULL),(70,'La Matanza','ARG','Buenos Aires',1266461,NULL,NULL),(71,'Córdoba','ARG','Córdoba',1157507,NULL,NULL),(72,'Rosario','ARG','Santa Fé',907718,NULL,NULL),(73,'Lomas de Zamora','ARG','Buenos Aires',622013,NULL,NULL),(74,'Quilmes','ARG','Buenos Aires',559249,NULL,NULL),(75,'Almirante Brown','ARG','Buenos Aires',538918,NULL,NULL),(76,'La Plata','ARG','Buenos Aires',521936,NULL,NULL),(77,'Mar del Plata','ARG','Buenos Aires',512880,NULL,NULL),(78,'San Miguel de Tucumán','ARG','Tucumán',470809,NULL,NULL),(79,'Lanús','ARG','Buenos Aires',469735,NULL,NULL),(80,'Merlo','ARG','Buenos Aires',463846,NULL,NULL),(81,'General San Martín','ARG','Buenos Aires',422542,NULL,NULL),(82,'Salta','ARG','Salta',367550,NULL,NULL),(83,'Moreno','ARG','Buenos Aires',356993,NULL,NULL),(84,'Santa Fé','ARG','Santa Fé',353063,NULL,NULL),(85,'Avellaneda','ARG','Buenos Aires',353046,NULL,NULL),(86,'Tres de Febrero','ARG','Buenos Aires',352311,NULL,NULL),(87,'Morón','ARG','Buenos Aires',349246,NULL,NULL),(88,'Florencio Varela','ARG','Buenos Aires',315432,NULL,NULL),(89,'San Isidro','ARG','Buenos Aires',306341,NULL,NULL),(90,'Tigre','ARG','Buenos Aires',296226,NULL,NULL),(91,'Malvinas Argentinas','ARG','Buenos Aires',290335,NULL,NULL),(92,'Vicente López','ARG','Buenos Aires',288341,NULL,NULL),(93,'Berazategui','ARG','Buenos Aires',276916,NULL,NULL),(94,'Corrientes','ARG','Corrientes',258103,NULL,NULL),(95,'San Miguel','ARG','Buenos Aires',248700,NULL,NULL),(96,'Bahía Blanca','ARG','Buenos Aires',239810,NULL,NULL),(97,'Esteban Echeverría','ARG','Buenos Aires',235760,NULL,NULL),(98,'Resistencia','ARG','Chaco',229212,NULL,NULL),(99,'José C. Paz','ARG','Buenos Aires',221754,NULL,NULL),(100,'Paraná','ARG','Entre Rios',207041,NULL,NULL),(101,'Godoy Cruz','ARG','Mendoza',206998,NULL,NULL),(102,'Posadas','ARG','Misiones',201273,NULL,NULL),(103,'Guaymallén','ARG','Mendoza',200595,NULL,NULL),(104,'Santiago del Estero','ARG','Santiago del Estero',189947,NULL,NULL),(105,'San Salvador de Jujuy','ARG','Jujuy',178748,NULL,NULL),(106,'Hurlingham','ARG','Buenos Aires',170028,NULL,NULL),(107,'Neuquén','ARG','Neuquén',167296,NULL,NULL),(108,'Ituzaingó','ARG','Buenos Aires',158197,NULL,NULL),(109,'San Fernando','ARG','Buenos Aires',153036,NULL,NULL),(110,'Formosa','ARG','Formosa',147636,NULL,NULL),(111,'Las Heras','ARG','Mendoza',145823,NULL,NULL),(112,'La Rioja','ARG','La Rioja',138117,NULL,NULL),(113,'San Fernando del Valle de Cata','ARG','Catamarca',134935,NULL,NULL),(114,'Río Cuarto','ARG','Córdoba',134355,NULL,NULL),(115,'Comodoro Rivadavia','ARG','Chubut',124104,NULL,NULL),(116,'Mendoza','ARG','Mendoza',123027,NULL,NULL),(117,'San Nicolás de los Arroyos','ARG','Buenos Aires',119302,NULL,NULL),(118,'San Juan','ARG','San Juan',119152,NULL,NULL),(119,'Escobar','ARG','Buenos Aires',116675,NULL,NULL),(120,'Concordia','ARG','Entre Rios',116485,NULL,NULL),(121,'Pilar','ARG','Buenos Aires',113428,NULL,NULL),(122,'San Luis','ARG','San Luis',110136,NULL,NULL),(123,'Ezeiza','ARG','Buenos Aires',99578,NULL,NULL),(124,'San Rafael','ARG','Mendoza',94651,NULL,NULL),(125,'Tandil','ARG','Buenos Aires',91101,NULL,NULL),(126,'Yerevan','ARM','Yerevan',1248700,NULL,NULL),(127,'Gjumri','ARM','Širak',211700,NULL,NULL),(128,'Vanadzor','ARM','Lori',172700,NULL,NULL),(129,'Oranjestad','ABW','–',29034,NULL,NULL),(130,'Sydney','AUS','New South Wales',3276207,NULL,NULL),(131,'Melbourne','AUS','Victoria',2865329,NULL,NULL),(132,'Brisbane','AUS','Queensland',1291117,NULL,NULL),(133,'Perth','AUS','West Australia',1096829,NULL,NULL),(134,'Adelaide','AUS','South Australia',978100,NULL,NULL),(135,'Canberra','AUS','Capital Region',322723,NULL,NULL),(136,'Gold Coast','AUS','Queensland',311932,NULL,NULL),(137,'Newcastle','AUS','New South Wales',270324,NULL,NULL),(138,'Central Coast','AUS','New South Wales',227657,NULL,NULL),(139,'Wollongong','AUS','New South Wales',219761,NULL,NULL),(140,'Hobart','AUS','Tasmania',126118,NULL,NULL),(141,'Geelong','AUS','Victoria',125382,NULL,NULL),(142,'Townsville','AUS','Queensland',109914,NULL,NULL),(143,'Cairns','AUS','Queensland',92273,NULL,NULL),(144,'Baku','AZE','Baki',1787800,NULL,NULL),(145,'Gäncä','AZE','Gäncä',299300,NULL,NULL),(146,'Sumqayit','AZE','Sumqayit',283000,NULL,NULL),(147,'Mingäçevir','AZE','Mingäçevir',93900,NULL,NULL),(148,'Nassau','BHS','New Providence',172000,NULL,NULL),(149,'al-Manama','BHR','al-Manama',148000,NULL,NULL),(150,'Dhaka','BGD','Dhaka',3612850,NULL,NULL),(151,'Chittagong','BGD','Chittagong',1392860,NULL,NULL),(152,'Khulna','BGD','Khulna',663340,NULL,NULL),(153,'Rajshahi','BGD','Rajshahi',294056,NULL,NULL),(154,'Narayanganj','BGD','Dhaka',202134,NULL,NULL),(155,'Rangpur','BGD','Rajshahi',191398,NULL,NULL),(156,'Mymensingh','BGD','Dhaka',188713,NULL,NULL),(157,'Barisal','BGD','Barisal',170232,NULL,NULL),(158,'Tungi','BGD','Dhaka',168702,NULL,NULL),(159,'Jessore','BGD','Khulna',139710,NULL,NULL),(160,'Comilla','BGD','Chittagong',135313,NULL,NULL),(161,'Nawabganj','BGD','Rajshahi',130577,NULL,NULL),(162,'Dinajpur','BGD','Rajshahi',127815,NULL,NULL),(163,'Bogra','BGD','Rajshahi',120170,NULL,NULL),(164,'Sylhet','BGD','Sylhet',117396,NULL,NULL),(165,'Brahmanbaria','BGD','Chittagong',109032,NULL,NULL),(166,'Tangail','BGD','Dhaka',106004,NULL,NULL),(167,'Jamalpur','BGD','Dhaka',103556,NULL,NULL),(168,'Pabna','BGD','Rajshahi',103277,NULL,NULL),(169,'Naogaon','BGD','Rajshahi',101266,NULL,NULL),(170,'Sirajganj','BGD','Rajshahi',99669,NULL,NULL),(171,'Narsinghdi','BGD','Dhaka',98342,NULL,NULL),(172,'Saidpur','BGD','Rajshahi',96777,NULL,NULL),(173,'Gazipur','BGD','Dhaka',96717,NULL,NULL),(174,'Bridgetown','BRB','St Michael',6070,NULL,NULL),(175,'Antwerpen','BEL','Antwerpen',446525,NULL,NULL),(176,'Gent','BEL','East Flanderi',224180,NULL,NULL),(177,'Charleroi','BEL','Hainaut',200827,NULL,NULL),(178,'Liège','BEL','Liège',185639,NULL,NULL),(179,'Bruxelles [Brussel]','BEL','Bryssel',133859,NULL,NULL),(180,'Brugge','BEL','West Flanderi',116246,NULL,NULL),(181,'Schaerbeek','BEL','Bryssel',105692,NULL,NULL),(182,'Namur','BEL','Namur',105419,NULL,NULL),(183,'Mons','BEL','Hainaut',90935,NULL,NULL),(184,'Belize City','BLZ','Belize City',55810,NULL,NULL),(185,'Belmopan','BLZ','Cayo',7105,NULL,NULL),(186,'Cotonou','BEN','Atlantique',536827,NULL,NULL),(187,'Porto-Novo','BEN','Ouémé',194000,NULL,NULL),(188,'Djougou','BEN','Atacora',134099,NULL,NULL),(189,'Parakou','BEN','Borgou',103577,NULL,NULL),(190,'Saint George','BMU','Saint George´s',1800,NULL,NULL),(191,'Hamilton','BMU','Hamilton',1200,NULL,NULL),(192,'Thimphu','BTN','Thimphu',22000,NULL,NULL),(193,'Santa Cruz de la Sierra','BOL','Santa Cruz',935361,NULL,NULL),(194,'La Paz','BOL','La Paz',758141,NULL,NULL),(195,'El Alto','BOL','La Paz',534466,NULL,NULL),(196,'Cochabamba','BOL','Cochabamba',482800,NULL,NULL),(197,'Oruro','BOL','Oruro',223553,NULL,NULL),(198,'Sucre','BOL','Chuquisaca',178426,NULL,NULL),(199,'Potosí','BOL','Potosí',140642,NULL,NULL),(200,'Tarija','BOL','Tarija',125255,NULL,NULL),(201,'Sarajevo','BIH','Federaatio',360000,NULL,NULL),(202,'Banja Luka','BIH','Republika Srpska',143079,NULL,NULL),(203,'Zenica','BIH','Federaatio',96027,NULL,NULL),(204,'Gaborone','BWA','Gaborone',213017,NULL,NULL),(205,'Francistown','BWA','Francistown',101805,NULL,NULL),(206,'São Paulo','BRA','São Paulo',9968485,NULL,NULL),(207,'Rio de Janeiro','BRA','Rio de Janeiro',5598953,NULL,NULL),(208,'Salvador','BRA','Bahia',2302832,NULL,NULL),(209,'Belo Horizonte','BRA','Minas Gerais',2139125,NULL,NULL),(210,'Fortaleza','BRA','Ceará',2097757,NULL,NULL),(211,'Brasília','BRA','Distrito Federal',1969868,NULL,NULL),(212,'Curitiba','BRA','Paraná',1584232,NULL,NULL),(213,'Recife','BRA','Pernambuco',1378087,NULL,NULL),(214,'Porto Alegre','BRA','Rio Grande do Sul',1314032,NULL,NULL),(215,'Manaus','BRA','Amazonas',1255049,NULL,NULL),(216,'Belém','BRA','Pará',1186926,NULL,NULL),(217,'Guarulhos','BRA','São Paulo',1095874,NULL,NULL),(218,'Goiânia','BRA','Goiás',1056330,NULL,NULL),(219,'Campinas','BRA','São Paulo',950043,NULL,NULL),(220,'São Gonçalo','BRA','Rio de Janeiro',869254,NULL,NULL),(221,'Nova Iguaçu','BRA','Rio de Janeiro',862225,NULL,NULL),(222,'São Luís','BRA','Maranhão',837588,NULL,NULL),(223,'Maceió','BRA','Alagoas',786288,NULL,NULL),(224,'Duque de Caxias','BRA','Rio de Janeiro',746758,NULL,NULL),(225,'São Bernardo do Campo','BRA','São Paulo',723132,NULL,NULL),(226,'Teresina','BRA','Piauí',691942,NULL,NULL),(227,'Natal','BRA','Rio Grande do Norte',688955,NULL,NULL),(228,'Osasco','BRA','São Paulo',659604,NULL,NULL),(229,'Campo Grande','BRA','Mato Grosso do Sul',649593,NULL,NULL),(230,'Santo André','BRA','São Paulo',630073,NULL,NULL),(231,'João Pessoa','BRA','Paraíba',584029,NULL,NULL),(232,'Jaboatão dos Guararapes','BRA','Pernambuco',558680,NULL,NULL),(233,'Contagem','BRA','Minas Gerais',520801,NULL,NULL),(234,'São José dos Campos','BRA','São Paulo',515553,NULL,NULL),(235,'Uberlândia','BRA','Minas Gerais',487222,NULL,NULL),(236,'Feira de Santana','BRA','Bahia',479992,NULL,NULL),(237,'Ribeirão Preto','BRA','São Paulo',473276,NULL,NULL),(238,'Sorocaba','BRA','São Paulo',466823,NULL,NULL),(239,'Niterói','BRA','Rio de Janeiro',459884,NULL,NULL),(240,'Cuiabá','BRA','Mato Grosso',453813,NULL,NULL),(241,'Juiz de Fora','BRA','Minas Gerais',450288,NULL,NULL),(242,'Aracaju','BRA','Sergipe',445555,NULL,NULL),(243,'São João de Meriti','BRA','Rio de Janeiro',440052,NULL,NULL),(244,'Londrina','BRA','Paraná',432257,NULL,NULL),(245,'Joinville','BRA','Santa Catarina',428011,NULL,NULL),(246,'Belford Roxo','BRA','Rio de Janeiro',425194,NULL,NULL),(247,'Santos','BRA','São Paulo',408748,NULL,NULL),(248,'Ananindeua','BRA','Pará',400940,NULL,NULL),(249,'Campos dos Goytacazes','BRA','Rio de Janeiro',398418,NULL,NULL),(250,'Mauá','BRA','São Paulo',375055,NULL,NULL),(251,'Carapicuíba','BRA','São Paulo',357552,NULL,NULL),(252,'Olinda','BRA','Pernambuco',354732,NULL,NULL),(253,'Campina Grande','BRA','Paraíba',352497,NULL,NULL),(254,'São José do Rio Preto','BRA','São Paulo',351944,NULL,NULL),(255,'Caxias do Sul','BRA','Rio Grande do Sul',349581,NULL,NULL),(256,'Moji das Cruzes','BRA','São Paulo',339194,NULL,NULL),(257,'Diadema','BRA','São Paulo',335078,NULL,NULL),(258,'Aparecida de Goiânia','BRA','Goiás',324662,NULL,NULL),(259,'Piracicaba','BRA','São Paulo',319104,NULL,NULL),(260,'Cariacica','BRA','Espírito Santo',319033,NULL,NULL),(261,'Vila Velha','BRA','Espírito Santo',318758,NULL,NULL),(262,'Pelotas','BRA','Rio Grande do Sul',315415,NULL,NULL),(263,'Bauru','BRA','São Paulo',313670,NULL,NULL),(264,'Porto Velho','BRA','Rondônia',309750,NULL,NULL),(265,'Serra','BRA','Espírito Santo',302666,NULL,NULL),(266,'Betim','BRA','Minas Gerais',302108,NULL,NULL),(267,'Jundíaí','BRA','São Paulo',296127,NULL,NULL),(268,'Canoas','BRA','Rio Grande do Sul',294125,NULL,NULL),(269,'Franca','BRA','São Paulo',290139,NULL,NULL),(270,'São Vicente','BRA','São Paulo',286848,NULL,NULL),(271,'Maringá','BRA','Paraná',286461,NULL,NULL),(272,'Montes Claros','BRA','Minas Gerais',286058,NULL,NULL),(273,'Anápolis','BRA','Goiás',282197,NULL,NULL),(274,'Florianópolis','BRA','Santa Catarina',281928,NULL,NULL),(275,'Petrópolis','BRA','Rio de Janeiro',279183,NULL,NULL),(276,'Itaquaquecetuba','BRA','São Paulo',270874,NULL,NULL),(277,'Vitória','BRA','Espírito Santo',270626,NULL,NULL),(278,'Ponta Grossa','BRA','Paraná',268013,NULL,NULL),(279,'Rio Branco','BRA','Acre',259537,NULL,NULL),(280,'Foz do Iguaçu','BRA','Paraná',259425,NULL,NULL),(281,'Macapá','BRA','Amapá',256033,NULL,NULL),(282,'Ilhéus','BRA','Bahia',254970,NULL,NULL),(283,'Vitória da Conquista','BRA','Bahia',253587,NULL,NULL),(284,'Uberaba','BRA','Minas Gerais',249225,NULL,NULL),(285,'Paulista','BRA','Pernambuco',248473,NULL,NULL),(286,'Limeira','BRA','São Paulo',245497,NULL,NULL),(287,'Blumenau','BRA','Santa Catarina',244379,NULL,NULL),(288,'Caruaru','BRA','Pernambuco',244247,NULL,NULL),(289,'Santarém','BRA','Pará',241771,NULL,NULL),(290,'Volta Redonda','BRA','Rio de Janeiro',240315,NULL,NULL),(291,'Novo Hamburgo','BRA','Rio Grande do Sul',239940,NULL,NULL),(292,'Caucaia','BRA','Ceará',238738,NULL,NULL),(293,'Santa Maria','BRA','Rio Grande do Sul',238473,NULL,NULL),(294,'Cascavel','BRA','Paraná',237510,NULL,NULL),(295,'Guarujá','BRA','São Paulo',237206,NULL,NULL),(296,'Ribeirão das Neves','BRA','Minas Gerais',232685,NULL,NULL),(297,'Governador Valadares','BRA','Minas Gerais',231724,NULL,NULL),(298,'Taubaté','BRA','São Paulo',229130,NULL,NULL),(299,'Imperatriz','BRA','Maranhão',224564,NULL,NULL),(300,'Gravataí','BRA','Rio Grande do Sul',223011,NULL,NULL),(301,'Embu','BRA','São Paulo',222223,NULL,NULL),(302,'Mossoró','BRA','Rio Grande do Norte',214901,NULL,NULL),(303,'Várzea Grande','BRA','Mato Grosso',214435,NULL,NULL),(304,'Petrolina','BRA','Pernambuco',210540,NULL,NULL),(305,'Barueri','BRA','São Paulo',208426,NULL,NULL),(306,'Viamão','BRA','Rio Grande do Sul',207557,NULL,NULL),(307,'Ipatinga','BRA','Minas Gerais',206338,NULL,NULL),(308,'Juazeiro','BRA','Bahia',201073,NULL,NULL),(309,'Juazeiro do Norte','BRA','Ceará',199636,NULL,NULL),(310,'Taboão da Serra','BRA','São Paulo',197550,NULL,NULL),(311,'São José dos Pinhais','BRA','Paraná',196884,NULL,NULL),(312,'Magé','BRA','Rio de Janeiro',196147,NULL,NULL),(313,'Suzano','BRA','São Paulo',195434,NULL,NULL),(314,'São Leopoldo','BRA','Rio Grande do Sul',189258,NULL,NULL),(315,'Marília','BRA','São Paulo',188691,NULL,NULL),(316,'São Carlos','BRA','São Paulo',187122,NULL,NULL),(317,'Sumaré','BRA','São Paulo',186205,NULL,NULL),(318,'Presidente Prudente','BRA','São Paulo',185340,NULL,NULL),(319,'Divinópolis','BRA','Minas Gerais',185047,NULL,NULL),(320,'Sete Lagoas','BRA','Minas Gerais',182984,NULL,NULL),(321,'Rio Grande','BRA','Rio Grande do Sul',182222,NULL,NULL),(322,'Itabuna','BRA','Bahia',182148,NULL,NULL),(323,'Jequié','BRA','Bahia',179128,NULL,NULL),(324,'Arapiraca','BRA','Alagoas',178988,NULL,NULL),(325,'Colombo','BRA','Paraná',177764,NULL,NULL),(326,'Americana','BRA','São Paulo',177409,NULL,NULL),(327,'Alvorada','BRA','Rio Grande do Sul',175574,NULL,NULL),(328,'Araraquara','BRA','São Paulo',174381,NULL,NULL),(329,'Itaboraí','BRA','Rio de Janeiro',173977,NULL,NULL),(330,'Santa Bárbara d´Oeste','BRA','São Paulo',171657,NULL,NULL),(331,'Nova Friburgo','BRA','Rio de Janeiro',170697,NULL,NULL),(332,'Jacareí','BRA','São Paulo',170356,NULL,NULL),(333,'Araçatuba','BRA','São Paulo',169303,NULL,NULL),(334,'Barra Mansa','BRA','Rio de Janeiro',168953,NULL,NULL),(335,'Praia Grande','BRA','São Paulo',168434,NULL,NULL),(336,'Marabá','BRA','Pará',167795,NULL,NULL),(337,'Criciúma','BRA','Santa Catarina',167661,NULL,NULL),(338,'Boa Vista','BRA','Roraima',167185,NULL,NULL),(339,'Passo Fundo','BRA','Rio Grande do Sul',166343,NULL,NULL),(340,'Dourados','BRA','Mato Grosso do Sul',164716,NULL,NULL),(341,'Santa Luzia','BRA','Minas Gerais',164704,NULL,NULL),(342,'Rio Claro','BRA','São Paulo',163551,NULL,NULL),(343,'Maracanaú','BRA','Ceará',162022,NULL,NULL),(344,'Guarapuava','BRA','Paraná',160510,NULL,NULL),(345,'Rondonópolis','BRA','Mato Grosso',155115,NULL,NULL),(346,'São José','BRA','Santa Catarina',155105,NULL,NULL),(347,'Cachoeiro de Itapemirim','BRA','Espírito Santo',155024,NULL,NULL),(348,'Nilópolis','BRA','Rio de Janeiro',153383,NULL,NULL),(349,'Itapevi','BRA','São Paulo',150664,NULL,NULL),(350,'Cabo de Santo Agostinho','BRA','Pernambuco',149964,NULL,NULL),(351,'Camaçari','BRA','Bahia',149146,NULL,NULL),(352,'Sobral','BRA','Ceará',146005,NULL,NULL),(353,'Itajaí','BRA','Santa Catarina',145197,NULL,NULL),(354,'Chapecó','BRA','Santa Catarina',144158,NULL,NULL),(355,'Cotia','BRA','São Paulo',140042,NULL,NULL),(356,'Lages','BRA','Santa Catarina',139570,NULL,NULL),(357,'Ferraz de Vasconcelos','BRA','São Paulo',139283,NULL,NULL),(358,'Indaiatuba','BRA','São Paulo',135968,NULL,NULL),(359,'Hortolândia','BRA','São Paulo',135755,NULL,NULL),(360,'Caxias','BRA','Maranhão',133980,NULL,NULL),(361,'São Caetano do Sul','BRA','São Paulo',133321,NULL,NULL),(362,'Itu','BRA','São Paulo',132736,NULL,NULL),(363,'Nossa Senhora do Socorro','BRA','Sergipe',131351,NULL,NULL),(364,'Parnaíba','BRA','Piauí',129756,NULL,NULL),(365,'Poços de Caldas','BRA','Minas Gerais',129683,NULL,NULL),(366,'Teresópolis','BRA','Rio de Janeiro',128079,NULL,NULL),(367,'Barreiras','BRA','Bahia',127801,NULL,NULL),(368,'Castanhal','BRA','Pará',127634,NULL,NULL),(369,'Alagoinhas','BRA','Bahia',126820,NULL,NULL),(370,'Itapecerica da Serra','BRA','São Paulo',126672,NULL,NULL),(371,'Uruguaiana','BRA','Rio Grande do Sul',126305,NULL,NULL),(372,'Paranaguá','BRA','Paraná',126076,NULL,NULL),(373,'Ibirité','BRA','Minas Gerais',125982,NULL,NULL),(374,'Timon','BRA','Maranhão',125812,NULL,NULL),(375,'Luziânia','BRA','Goiás',125597,NULL,NULL),(376,'Macaé','BRA','Rio de Janeiro',125597,NULL,NULL),(377,'Teófilo Otoni','BRA','Minas Gerais',124489,NULL,NULL),(378,'Moji-Guaçu','BRA','São Paulo',123782,NULL,NULL),(379,'Palmas','BRA','Tocantins',121919,NULL,NULL),(380,'Pindamonhangaba','BRA','São Paulo',121904,NULL,NULL),(381,'Francisco Morato','BRA','São Paulo',121197,NULL,NULL),(382,'Bagé','BRA','Rio Grande do Sul',120793,NULL,NULL),(383,'Sapucaia do Sul','BRA','Rio Grande do Sul',120217,NULL,NULL),(384,'Cabo Frio','BRA','Rio de Janeiro',119503,NULL,NULL),(385,'Itapetininga','BRA','São Paulo',119391,NULL,NULL),(386,'Patos de Minas','BRA','Minas Gerais',119262,NULL,NULL),(387,'Camaragibe','BRA','Pernambuco',118968,NULL,NULL),(388,'Bragança Paulista','BRA','São Paulo',116929,NULL,NULL),(389,'Queimados','BRA','Rio de Janeiro',115020,NULL,NULL),(390,'Araguaína','BRA','Tocantins',114948,NULL,NULL),(391,'Garanhuns','BRA','Pernambuco',114603,NULL,NULL),(392,'Vitória de Santo Antão','BRA','Pernambuco',113595,NULL,NULL),(393,'Santa Rita','BRA','Paraíba',113135,NULL,NULL),(394,'Barbacena','BRA','Minas Gerais',113079,NULL,NULL),(395,'Abaetetuba','BRA','Pará',111258,NULL,NULL),(396,'Jaú','BRA','São Paulo',109965,NULL,NULL),(397,'Lauro de Freitas','BRA','Bahia',109236,NULL,NULL),(398,'Franco da Rocha','BRA','São Paulo',108964,NULL,NULL),(399,'Teixeira de Freitas','BRA','Bahia',108441,NULL,NULL),(400,'Varginha','BRA','Minas Gerais',108314,NULL,NULL),(401,'Ribeirão Pires','BRA','São Paulo',108121,NULL,NULL),(402,'Sabará','BRA','Minas Gerais',107781,NULL,NULL),(403,'Catanduva','BRA','São Paulo',107761,NULL,NULL),(404,'Rio Verde','BRA','Goiás',107755,NULL,NULL),(405,'Botucatu','BRA','São Paulo',107663,NULL,NULL),(406,'Colatina','BRA','Espírito Santo',107354,NULL,NULL),(407,'Santa Cruz do Sul','BRA','Rio Grande do Sul',106734,NULL,NULL),(408,'Linhares','BRA','Espírito Santo',106278,NULL,NULL),(409,'Apucarana','BRA','Paraná',105114,NULL,NULL),(410,'Barretos','BRA','São Paulo',104156,NULL,NULL),(411,'Guaratinguetá','BRA','São Paulo',103433,NULL,NULL),(412,'Cachoeirinha','BRA','Rio Grande do Sul',103240,NULL,NULL),(413,'Codó','BRA','Maranhão',103153,NULL,NULL),(414,'Jaraguá do Sul','BRA','Santa Catarina',102580,NULL,NULL),(415,'Cubatão','BRA','São Paulo',102372,NULL,NULL),(416,'Itabira','BRA','Minas Gerais',102217,NULL,NULL),(417,'Itaituba','BRA','Pará',101320,NULL,NULL),(418,'Araras','BRA','São Paulo',101046,NULL,NULL),(419,'Resende','BRA','Rio de Janeiro',100627,NULL,NULL),(420,'Atibaia','BRA','São Paulo',100356,NULL,NULL),(421,'Pouso Alegre','BRA','Minas Gerais',100028,NULL,NULL),(422,'Toledo','BRA','Paraná',99387,NULL,NULL),(423,'Crato','BRA','Ceará',98965,NULL,NULL),(424,'Passos','BRA','Minas Gerais',98570,NULL,NULL),(425,'Araguari','BRA','Minas Gerais',98399,NULL,NULL),(426,'São José de Ribamar','BRA','Maranhão',98318,NULL,NULL),(427,'Pinhais','BRA','Paraná',98198,NULL,NULL),(428,'Sertãozinho','BRA','São Paulo',98140,NULL,NULL),(429,'Conselheiro Lafaiete','BRA','Minas Gerais',97507,NULL,NULL),(430,'Paulo Afonso','BRA','Bahia',97291,NULL,NULL),(431,'Angra dos Reis','BRA','Rio de Janeiro',96864,NULL,NULL),(432,'Eunápolis','BRA','Bahia',96610,NULL,NULL),(433,'Salto','BRA','São Paulo',96348,NULL,NULL),(434,'Ourinhos','BRA','São Paulo',96291,NULL,NULL),(435,'Parnamirim','BRA','Rio Grande do Norte',96210,NULL,NULL),(436,'Jacobina','BRA','Bahia',96131,NULL,NULL),(437,'Coronel Fabriciano','BRA','Minas Gerais',95933,NULL,NULL),(438,'Birigui','BRA','São Paulo',94685,NULL,NULL),(439,'Tatuí','BRA','São Paulo',93897,NULL,NULL),(440,'Ji-Paraná','BRA','Rondônia',93346,NULL,NULL),(441,'Bacabal','BRA','Maranhão',93121,NULL,NULL),(442,'Cametá','BRA','Pará',92779,NULL,NULL),(443,'Guaíba','BRA','Rio Grande do Sul',92224,NULL,NULL),(444,'São Lourenço da Mata','BRA','Pernambuco',91999,NULL,NULL),(445,'Santana do Livramento','BRA','Rio Grande do Sul',91779,NULL,NULL),(446,'Votorantim','BRA','São Paulo',91777,NULL,NULL),(447,'Campo Largo','BRA','Paraná',91203,NULL,NULL),(448,'Patos','BRA','Paraíba',90519,NULL,NULL),(449,'Ituiutaba','BRA','Minas Gerais',90507,NULL,NULL),(450,'Corumbá','BRA','Mato Grosso do Sul',90111,NULL,NULL),(451,'Palhoça','BRA','Santa Catarina',89465,NULL,NULL),(452,'Barra do Piraí','BRA','Rio de Janeiro',89388,NULL,NULL),(453,'Bento Gonçalves','BRA','Rio Grande do Sul',89254,NULL,NULL),(454,'Poá','BRA','São Paulo',89236,NULL,NULL),(455,'Águas Lindas de Goiás','BRA','Goiás',89200,NULL,NULL),(456,'London','GBR','England',7285000,NULL,NULL),(457,'Birmingham','GBR','England',1013000,NULL,NULL),(458,'Glasgow','GBR','Scotland',619680,NULL,NULL),(459,'Liverpool','GBR','England',461000,NULL,NULL),(460,'Edinburgh','GBR','Scotland',450180,NULL,NULL),(461,'Sheffield','GBR','England',431607,NULL,NULL),(462,'Manchester','GBR','England',430000,NULL,NULL),(463,'Leeds','GBR','England',424194,NULL,NULL),(464,'Bristol','GBR','England',402000,NULL,NULL),(465,'Cardiff','GBR','Wales',321000,NULL,NULL),(466,'Coventry','GBR','England',304000,NULL,NULL),(467,'Leicester','GBR','England',294000,NULL,NULL),(468,'Bradford','GBR','England',289376,NULL,NULL),(469,'Belfast','GBR','North Ireland',287500,NULL,NULL),(470,'Nottingham','GBR','England',287000,NULL,NULL),(471,'Kingston upon Hull','GBR','England',262000,NULL,NULL),(472,'Plymouth','GBR','England',253000,NULL,NULL),(473,'Stoke-on-Trent','GBR','England',252000,NULL,NULL),(474,'Wolverhampton','GBR','England',242000,NULL,NULL),(475,'Derby','GBR','England',236000,NULL,NULL),(476,'Swansea','GBR','Wales',230000,NULL,NULL),(477,'Southampton','GBR','England',216000,NULL,NULL),(478,'Aberdeen','GBR','Scotland',213070,NULL,NULL),(479,'Northampton','GBR','England',196000,NULL,NULL),(480,'Dudley','GBR','England',192171,NULL,NULL),(481,'Portsmouth','GBR','England',190000,NULL,NULL),(482,'Newcastle upon Tyne','GBR','England',189150,NULL,NULL),(483,'Sunderland','GBR','England',183310,NULL,NULL),(484,'Luton','GBR','England',183000,NULL,NULL),(485,'Swindon','GBR','England',180000,NULL,NULL),(486,'Southend-on-Sea','GBR','England',176000,NULL,NULL),(487,'Walsall','GBR','England',174739,NULL,NULL),(488,'Bournemouth','GBR','England',162000,NULL,NULL),(489,'Peterborough','GBR','England',156000,NULL,NULL),(490,'Brighton','GBR','England',156124,NULL,NULL),(491,'Blackpool','GBR','England',151000,NULL,NULL),(492,'Dundee','GBR','Scotland',146690,NULL,NULL),(493,'West Bromwich','GBR','England',146386,NULL,NULL),(494,'Reading','GBR','England',148000,NULL,NULL),(495,'Oldbury/Smethwick (Warley)','GBR','England',145542,NULL,NULL),(496,'Middlesbrough','GBR','England',145000,NULL,NULL),(497,'Huddersfield','GBR','England',143726,NULL,NULL),(498,'Oxford','GBR','England',144000,NULL,NULL),(499,'Poole','GBR','England',141000,NULL,NULL),(500,'Bolton','GBR','England',139020,NULL,NULL),(501,'Blackburn','GBR','England',140000,NULL,NULL),(502,'Newport','GBR','Wales',139000,NULL,NULL),(503,'Preston','GBR','England',135000,NULL,NULL),(504,'Stockport','GBR','England',132813,NULL,NULL),(505,'Norwich','GBR','England',124000,NULL,NULL),(506,'Rotherham','GBR','England',121380,NULL,NULL),(507,'Cambridge','GBR','England',121000,NULL,NULL),(508,'Watford','GBR','England',113080,NULL,NULL),(509,'Ipswich','GBR','England',114000,NULL,NULL),(510,'Slough','GBR','England',112000,NULL,NULL),(511,'Exeter','GBR','England',111000,NULL,NULL),(512,'Cheltenham','GBR','England',106000,NULL,NULL),(513,'Gloucester','GBR','England',107000,NULL,NULL),(514,'Saint Helens','GBR','England',106293,NULL,NULL),(515,'Sutton Coldfield','GBR','England',106001,NULL,NULL),(516,'York','GBR','England',104425,NULL,NULL),(517,'Oldham','GBR','England',103931,NULL,NULL),(518,'Basildon','GBR','England',100924,NULL,NULL),(519,'Worthing','GBR','England',100000,NULL,NULL),(520,'Chelmsford','GBR','England',97451,NULL,NULL),(521,'Colchester','GBR','England',96063,NULL,NULL),(522,'Crawley','GBR','England',97000,NULL,NULL),(523,'Gillingham','GBR','England',92000,NULL,NULL),(524,'Solihull','GBR','England',94531,NULL,NULL),(525,'Rochdale','GBR','England',94313,NULL,NULL),(526,'Birkenhead','GBR','England',93087,NULL,NULL),(527,'Worcester','GBR','England',95000,NULL,NULL),(528,'Hartlepool','GBR','England',92000,NULL,NULL),(529,'Halifax','GBR','England',91069,NULL,NULL),(530,'Woking/Byfleet','GBR','England',92000,NULL,NULL),(531,'Southport','GBR','England',90959,NULL,NULL),(532,'Maidstone','GBR','England',90878,NULL,NULL),(533,'Eastbourne','GBR','England',90000,NULL,NULL),(534,'Grimsby','GBR','England',89000,NULL,NULL),(535,'Saint Helier','GBR','Jersey',27523,NULL,NULL),(536,'Douglas','GBR','–',23487,NULL,NULL),(537,'Road Town','VGB','Tortola',8000,NULL,NULL),(538,'Bandar Seri Begawan','BRN','Brunei and Muara',21484,NULL,NULL),(539,'Sofija','BGR','Grad Sofija',1122302,NULL,NULL),(540,'Plovdiv','BGR','Plovdiv',342584,NULL,NULL),(541,'Varna','BGR','Varna',299801,NULL,NULL),(542,'Burgas','BGR','Burgas',195255,NULL,NULL),(543,'Ruse','BGR','Ruse',166467,NULL,NULL),(544,'Stara Zagora','BGR','Haskovo',147939,NULL,NULL),(545,'Pleven','BGR','Lovec',121952,NULL,NULL),(546,'Sliven','BGR','Burgas',105530,NULL,NULL),(547,'Dobric','BGR','Varna',100399,NULL,NULL),(548,'Šumen','BGR','Varna',94686,NULL,NULL),(549,'Ouagadougou','BFA','Kadiogo',824000,NULL,NULL),(550,'Bobo-Dioulasso','BFA','Houet',300000,NULL,NULL),(551,'Koudougou','BFA','Boulkiemdé',105000,NULL,NULL),(552,'Bujumbura','BDI','Bujumbura',300000,NULL,NULL),(553,'George Town','CYM','Grand Cayman',19600,NULL,NULL),(554,'Santiago de Chile','CHL','Santiago',4703954,NULL,NULL),(555,'Puente Alto','CHL','Santiago',386236,NULL,NULL),(556,'Viña del Mar','CHL','Valparaíso',312493,NULL,NULL),(557,'Valparaíso','CHL','Valparaíso',293800,NULL,NULL),(558,'Talcahuano','CHL','Bíobío',277752,NULL,NULL),(559,'Antofagasta','CHL','Antofagasta',251429,NULL,NULL),(560,'San Bernardo','CHL','Santiago',241910,NULL,NULL),(561,'Temuco','CHL','La Araucanía',233041,NULL,NULL),(562,'Concepción','CHL','Bíobío',217664,NULL,NULL),(563,'Rancagua','CHL','O´Higgins',212977,NULL,NULL),(564,'Arica','CHL','Tarapacá',189036,NULL,NULL),(565,'Talca','CHL','Maule',187557,NULL,NULL),(566,'Chillán','CHL','Bíobío',178182,NULL,NULL),(567,'Iquique','CHL','Tarapacá',177892,NULL,NULL),(568,'Los Angeles','CHL','Bíobío',158215,NULL,NULL),(569,'Puerto Montt','CHL','Los Lagos',152194,NULL,NULL),(570,'Coquimbo','CHL','Coquimbo',143353,NULL,NULL),(571,'Osorno','CHL','Los Lagos',141468,NULL,NULL),(572,'La Serena','CHL','Coquimbo',137409,NULL,NULL),(573,'Calama','CHL','Antofagasta',137265,NULL,NULL),(574,'Valdivia','CHL','Los Lagos',133106,NULL,NULL),(575,'Punta Arenas','CHL','Magallanes',125631,NULL,NULL),(576,'Copiapó','CHL','Atacama',120128,NULL,NULL),(577,'Quilpué','CHL','Valparaíso',118857,NULL,NULL),(578,'Curicó','CHL','Maule',115766,NULL,NULL),(579,'Ovalle','CHL','Coquimbo',94854,NULL,NULL),(580,'Coronel','CHL','Bíobío',93061,NULL,NULL),(581,'San Pedro de la Paz','CHL','Bíobío',91684,NULL,NULL),(582,'Melipilla','CHL','Santiago',91056,NULL,NULL),(583,'Avarua','COK','Rarotonga',11900,NULL,NULL),(584,'San José','CRI','San José',339131,NULL,NULL),(585,'Djibouti','DJI','Djibouti',383000,NULL,NULL),(586,'Roseau','DMA','St George',16243,NULL,NULL),(587,'Santo Domingo de Guzmán','DOM','Distrito Nacional',1609966,NULL,NULL),(588,'Santiago de los Caballeros','DOM','Santiago',365463,NULL,NULL),(589,'La Romana','DOM','La Romana',140204,NULL,NULL),(590,'San Pedro de Macorís','DOM','San Pedro de Macorís',124735,NULL,NULL),(591,'San Francisco de Macorís','DOM','Duarte',108485,NULL,NULL),(592,'San Felipe de Puerto Plata','DOM','Puerto Plata',89423,NULL,NULL),(593,'Guayaquil','ECU','Guayas',2070040,NULL,NULL),(594,'Quito','ECU','Pichincha',1573458,NULL,NULL),(595,'Cuenca','ECU','Azuay',270353,NULL,NULL),(596,'Machala','ECU','El Oro',210368,NULL,NULL),(597,'Santo Domingo de los Colorados','ECU','Pichincha',202111,NULL,NULL),(598,'Portoviejo','ECU','Manabí',176413,NULL,NULL),(599,'Ambato','ECU','Tungurahua',169612,NULL,NULL),(600,'Manta','ECU','Manabí',164739,NULL,NULL),(601,'Duran [Eloy Alfaro]','ECU','Guayas',152514,NULL,NULL),(602,'Ibarra','ECU','Imbabura',130643,NULL,NULL),(603,'Quevedo','ECU','Los Ríos',129631,NULL,NULL),(604,'Milagro','ECU','Guayas',124177,NULL,NULL),(605,'Loja','ECU','Loja',123875,NULL,NULL),(606,'Ríobamba','ECU','Chimborazo',123163,NULL,NULL),(607,'Esmeraldas','ECU','Esmeraldas',123045,NULL,NULL),(608,'Cairo','EGY','Kairo',6789479,NULL,NULL),(609,'Alexandria','EGY','Aleksandria',3328196,NULL,NULL),(610,'Giza','EGY','Giza',2221868,NULL,NULL),(611,'Shubra al-Khayma','EGY','al-Qalyubiya',870716,NULL,NULL),(612,'Port Said','EGY','Port Said',469533,NULL,NULL),(613,'Suez','EGY','Suez',417610,NULL,NULL),(614,'al-Mahallat al-Kubra','EGY','al-Gharbiya',395402,NULL,NULL),(615,'Tanta','EGY','al-Gharbiya',371010,NULL,NULL),(616,'al-Mansura','EGY','al-Daqahliya',369621,NULL,NULL),(617,'Luxor','EGY','Luxor',360503,NULL,NULL),(618,'Asyut','EGY','Asyut',343498,NULL,NULL),(619,'Bahtim','EGY','al-Qalyubiya',275807,NULL,NULL),(620,'Zagazig','EGY','al-Sharqiya',267351,NULL,NULL),(621,'al-Faiyum','EGY','al-Faiyum',260964,NULL,NULL),(622,'Ismailia','EGY','Ismailia',254477,NULL,NULL),(623,'Kafr al-Dawwar','EGY','al-Buhayra',231978,NULL,NULL),(624,'Assuan','EGY','Assuan',219017,NULL,NULL),(625,'Damanhur','EGY','al-Buhayra',212203,NULL,NULL),(626,'al-Minya','EGY','al-Minya',201360,NULL,NULL),(627,'Bani Suwayf','EGY','Bani Suwayf',172032,NULL,NULL),(628,'Qina','EGY','Qina',171275,NULL,NULL),(629,'Sawhaj','EGY','Sawhaj',170125,NULL,NULL),(630,'Shibin al-Kawm','EGY','al-Minufiya',159909,NULL,NULL),(631,'Bulaq al-Dakrur','EGY','Giza',148787,NULL,NULL),(632,'Banha','EGY','al-Qalyubiya',145792,NULL,NULL),(633,'Warraq al-Arab','EGY','Giza',127108,NULL,NULL),(634,'Kafr al-Shaykh','EGY','Kafr al-Shaykh',124819,NULL,NULL),(635,'Mallawi','EGY','al-Minya',119283,NULL,NULL),(636,'Bilbays','EGY','al-Sharqiya',113608,NULL,NULL),(637,'Mit Ghamr','EGY','al-Daqahliya',101801,NULL,NULL),(638,'al-Arish','EGY','Shamal Sina',100447,NULL,NULL),(639,'Talkha','EGY','al-Daqahliya',97700,NULL,NULL),(640,'Qalyub','EGY','al-Qalyubiya',97200,NULL,NULL),(641,'Jirja','EGY','Sawhaj',95400,NULL,NULL),(642,'Idfu','EGY','Qina',94200,NULL,NULL),(643,'al-Hawamidiya','EGY','Giza',91700,NULL,NULL),(644,'Disuq','EGY','Kafr al-Shaykh',91300,NULL,NULL),(645,'San Salvador','SLV','San Salvador',415346,NULL,NULL),(646,'Santa Ana','SLV','Santa Ana',139389,NULL,NULL),(647,'Mejicanos','SLV','San Salvador',138800,NULL,NULL),(648,'Soyapango','SLV','San Salvador',129800,NULL,NULL),(649,'San Miguel','SLV','San Miguel',127696,NULL,NULL),(650,'Nueva San Salvador','SLV','La Libertad',98400,NULL,NULL),(651,'Apopa','SLV','San Salvador',88800,NULL,NULL),(652,'Asmara','ERI','Maekel',431000,NULL,NULL),(653,'Madrid','ESP','Madrid',2879052,NULL,NULL),(654,'Barcelona','ESP','Katalonia',1503451,NULL,NULL),(655,'Valencia','ESP','Valencia',739412,NULL,NULL),(656,'Sevilla','ESP','Andalusia',701927,NULL,NULL),(657,'Zaragoza','ESP','Aragonia',603367,NULL,NULL),(658,'Málaga','ESP','Andalusia',530553,NULL,NULL),(659,'Bilbao','ESP','Baskimaa',357589,NULL,NULL),(660,'Las Palmas de Gran Canaria','ESP','Canary Islands',354757,NULL,NULL),(661,'Murcia','ESP','Murcia',353504,NULL,NULL),(662,'Palma de Mallorca','ESP','Balears',326993,NULL,NULL),(663,'Valladolid','ESP','Castilla and León',319998,NULL,NULL),(664,'Córdoba','ESP','Andalusia',311708,NULL,NULL),(665,'Vigo','ESP','Galicia',283670,NULL,NULL),(666,'Alicante [Alacant]','ESP','Valencia',272432,NULL,NULL),(667,'Gijón','ESP','Asturia',267980,NULL,NULL),(668,'L´Hospitalet de Llobregat','ESP','Katalonia',247986,NULL,NULL),(669,'Granada','ESP','Andalusia',244767,NULL,NULL),(670,'A Coruña (La Coruña)','ESP','Galicia',243402,NULL,NULL),(671,'Vitoria-Gasteiz','ESP','Baskimaa',217154,NULL,NULL),(672,'Santa Cruz de Tenerife','ESP','Canary Islands',213050,NULL,NULL),(673,'Badalona','ESP','Katalonia',209635,NULL,NULL),(674,'Oviedo','ESP','Asturia',200453,NULL,NULL),(675,'Móstoles','ESP','Madrid',195351,NULL,NULL),(676,'Elche [Elx]','ESP','Valencia',193174,NULL,NULL),(677,'Sabadell','ESP','Katalonia',184859,NULL,NULL),(678,'Santander','ESP','Cantabria',184165,NULL,NULL),(679,'Jerez de la Frontera','ESP','Andalusia',182660,NULL,NULL),(680,'Pamplona [Iruña]','ESP','Navarra',180483,NULL,NULL),(681,'Donostia-San Sebastián','ESP','Baskimaa',179208,NULL,NULL),(682,'Cartagena','ESP','Murcia',177709,NULL,NULL),(683,'Leganés','ESP','Madrid',173163,NULL,NULL),(684,'Fuenlabrada','ESP','Madrid',171173,NULL,NULL),(685,'Almería','ESP','Andalusia',169027,NULL,NULL),(686,'Terrassa','ESP','Katalonia',168695,NULL,NULL),(687,'Alcalá de Henares','ESP','Madrid',164463,NULL,NULL),(688,'Burgos','ESP','Castilla and León',162802,NULL,NULL),(689,'Salamanca','ESP','Castilla and León',158720,NULL,NULL),(690,'Albacete','ESP','Kastilia-La Mancha',147527,NULL,NULL),(691,'Getafe','ESP','Madrid',145371,NULL,NULL),(692,'Cádiz','ESP','Andalusia',142449,NULL,NULL),(693,'Alcorcón','ESP','Madrid',142048,NULL,NULL),(694,'Huelva','ESP','Andalusia',140583,NULL,NULL),(695,'León','ESP','Castilla and León',139809,NULL,NULL),(696,'Castellón de la Plana [Castell','ESP','Valencia',139712,NULL,NULL),(697,'Badajoz','ESP','Extremadura',136613,NULL,NULL),(698,'[San Cristóbal de] la Laguna','ESP','Canary Islands',127945,NULL,NULL),(699,'Logroño','ESP','La Rioja',127093,NULL,NULL),(700,'Santa Coloma de Gramenet','ESP','Katalonia',120802,NULL,NULL),(701,'Tarragona','ESP','Katalonia',113016,NULL,NULL),(702,'Lleida (Lérida)','ESP','Katalonia',112207,NULL,NULL),(703,'Jaén','ESP','Andalusia',109247,NULL,NULL),(704,'Ourense (Orense)','ESP','Galicia',109120,NULL,NULL),(705,'Mataró','ESP','Katalonia',104095,NULL,NULL),(706,'Algeciras','ESP','Andalusia',103106,NULL,NULL),(707,'Marbella','ESP','Andalusia',101144,NULL,NULL),(708,'Barakaldo','ESP','Baskimaa',98212,NULL,NULL),(709,'Dos Hermanas','ESP','Andalusia',94591,NULL,NULL),(710,'Santiago de Compostela','ESP','Galicia',93745,NULL,NULL),(711,'Torrejón de Ardoz','ESP','Madrid',92262,NULL,NULL),(712,'Cape Town','ZAF','Western Cape',2352121,NULL,NULL),(713,'Soweto','ZAF','Gauteng',904165,NULL,NULL),(714,'Johannesburg','ZAF','Gauteng',756653,NULL,NULL),(715,'Port Elizabeth','ZAF','Eastern Cape',752319,NULL,NULL),(716,'Pretoria','ZAF','Gauteng',658630,NULL,NULL),(717,'Inanda','ZAF','KwaZulu-Natal',634065,NULL,NULL),(718,'Durban','ZAF','KwaZulu-Natal',566120,NULL,NULL),(719,'Vanderbijlpark','ZAF','Gauteng',468931,NULL,NULL),(720,'Kempton Park','ZAF','Gauteng',442633,NULL,NULL),(721,'Alberton','ZAF','Gauteng',410102,NULL,NULL),(722,'Pinetown','ZAF','KwaZulu-Natal',378810,NULL,NULL),(723,'Pietermaritzburg','ZAF','KwaZulu-Natal',370190,NULL,NULL),(724,'Benoni','ZAF','Gauteng',365467,NULL,NULL),(725,'Randburg','ZAF','Gauteng',341288,NULL,NULL),(726,'Umlazi','ZAF','KwaZulu-Natal',339233,NULL,NULL),(727,'Bloemfontein','ZAF','Free State',334341,NULL,NULL),(728,'Vereeniging','ZAF','Gauteng',328535,NULL,NULL),(729,'Wonderboom','ZAF','Gauteng',283289,NULL,NULL),(730,'Roodepoort','ZAF','Gauteng',279340,NULL,NULL),(731,'Boksburg','ZAF','Gauteng',262648,NULL,NULL),(732,'Klerksdorp','ZAF','North West',261911,NULL,NULL),(733,'Soshanguve','ZAF','Gauteng',242727,NULL,NULL),(734,'Newcastle','ZAF','KwaZulu-Natal',222993,NULL,NULL),(735,'East London','ZAF','Eastern Cape',221047,NULL,NULL),(736,'Welkom','ZAF','Free State',203296,NULL,NULL),(737,'Kimberley','ZAF','Northern Cape',197254,NULL,NULL),(738,'Uitenhage','ZAF','Eastern Cape',192120,NULL,NULL),(739,'Chatsworth','ZAF','KwaZulu-Natal',189885,NULL,NULL),(740,'Mdantsane','ZAF','Eastern Cape',182639,NULL,NULL),(741,'Krugersdorp','ZAF','Gauteng',181503,NULL,NULL),(742,'Botshabelo','ZAF','Free State',177971,NULL,NULL),(743,'Brakpan','ZAF','Gauteng',171363,NULL,NULL),(744,'Witbank','ZAF','Mpumalanga',167183,NULL,NULL),(745,'Oberholzer','ZAF','Gauteng',164367,NULL,NULL),(746,'Germiston','ZAF','Gauteng',164252,NULL,NULL),(747,'Springs','ZAF','Gauteng',162072,NULL,NULL),(748,'Westonaria','ZAF','Gauteng',159632,NULL,NULL),(749,'Randfontein','ZAF','Gauteng',120838,NULL,NULL),(750,'Paarl','ZAF','Western Cape',105768,NULL,NULL),(751,'Potchefstroom','ZAF','North West',101817,NULL,NULL),(752,'Rustenburg','ZAF','North West',97008,NULL,NULL),(753,'Nigel','ZAF','Gauteng',96734,NULL,NULL),(754,'George','ZAF','Western Cape',93818,NULL,NULL),(755,'Ladysmith','ZAF','KwaZulu-Natal',89292,NULL,NULL),(756,'Addis Abeba','ETH','Addis Abeba',2495000,NULL,NULL),(757,'Dire Dawa','ETH','Dire Dawa',164851,NULL,NULL),(758,'Nazret','ETH','Oromia',127842,NULL,NULL),(759,'Gonder','ETH','Amhara',112249,NULL,NULL),(760,'Dese','ETH','Amhara',97314,NULL,NULL),(761,'Mekele','ETH','Tigray',96938,NULL,NULL),(762,'Bahir Dar','ETH','Amhara',96140,NULL,NULL),(763,'Stanley','FLK','East Falkland',1636,NULL,NULL),(764,'Suva','FJI','Central',77366,NULL,NULL),(765,'Quezon','PHL','National Capital Reg',2173831,NULL,NULL),(766,'Manila','PHL','National Capital Reg',1581082,NULL,NULL),(767,'Kalookan','PHL','National Capital Reg',1177604,NULL,NULL),(768,'Davao','PHL','Southern Mindanao',1147116,NULL,NULL),(769,'Cebu','PHL','Central Visayas',718821,NULL,NULL),(770,'Zamboanga','PHL','Western Mindanao',601794,NULL,NULL),(771,'Pasig','PHL','National Capital Reg',505058,NULL,NULL),(772,'Valenzuela','PHL','National Capital Reg',485433,NULL,NULL),(773,'Las Piñas','PHL','National Capital Reg',472780,NULL,NULL),(774,'Antipolo','PHL','Southern Tagalog',470866,NULL,NULL),(775,'Taguig','PHL','National Capital Reg',467375,NULL,NULL),(776,'Cagayan de Oro','PHL','Northern Mindanao',461877,NULL,NULL),(777,'Parañaque','PHL','National Capital Reg',449811,NULL,NULL),(778,'Makati','PHL','National Capital Reg',444867,NULL,NULL),(779,'Bacolod','PHL','Western Visayas',429076,NULL,NULL),(780,'General Santos','PHL','Southern Mindanao',411822,NULL,NULL),(781,'Marikina','PHL','National Capital Reg',391170,NULL,NULL),(782,'Dasmariñas','PHL','Southern Tagalog',379520,NULL,NULL),(783,'Muntinlupa','PHL','National Capital Reg',379310,NULL,NULL),(784,'Iloilo','PHL','Western Visayas',365820,NULL,NULL),(785,'Pasay','PHL','National Capital Reg',354908,NULL,NULL),(786,'Malabon','PHL','National Capital Reg',338855,NULL,NULL),(787,'San José del Monte','PHL','Central Luzon',315807,NULL,NULL),(788,'Bacoor','PHL','Southern Tagalog',305699,NULL,NULL),(789,'Iligan','PHL','Central Mindanao',285061,NULL,NULL),(790,'Calamba','PHL','Southern Tagalog',281146,NULL,NULL),(791,'Mandaluyong','PHL','National Capital Reg',278474,NULL,NULL),(792,'Butuan','PHL','Caraga',267279,NULL,NULL),(793,'Angeles','PHL','Central Luzon',263971,NULL,NULL),(794,'Tarlac','PHL','Central Luzon',262481,NULL,NULL),(795,'Mandaue','PHL','Central Visayas',259728,NULL,NULL),(796,'Baguio','PHL','CAR',252386,NULL,NULL),(797,'Batangas','PHL','Southern Tagalog',247588,NULL,NULL),(798,'Cainta','PHL','Southern Tagalog',242511,NULL,NULL),(799,'San Pedro','PHL','Southern Tagalog',231403,NULL,NULL),(800,'Navotas','PHL','National Capital Reg',230403,NULL,NULL),(801,'Cabanatuan','PHL','Central Luzon',222859,NULL,NULL),(802,'San Fernando','PHL','Central Luzon',221857,NULL,NULL),(803,'Lipa','PHL','Southern Tagalog',218447,NULL,NULL),(804,'Lapu-Lapu','PHL','Central Visayas',217019,NULL,NULL),(805,'San Pablo','PHL','Southern Tagalog',207927,NULL,NULL),(806,'Biñan','PHL','Southern Tagalog',201186,NULL,NULL),(807,'Taytay','PHL','Southern Tagalog',198183,NULL,NULL),(808,'Lucena','PHL','Southern Tagalog',196075,NULL,NULL),(809,'Imus','PHL','Southern Tagalog',195482,NULL,NULL),(810,'Olongapo','PHL','Central Luzon',194260,NULL,NULL),(811,'Binangonan','PHL','Southern Tagalog',187691,NULL,NULL),(812,'Santa Rosa','PHL','Southern Tagalog',185633,NULL,NULL),(813,'Tagum','PHL','Southern Mindanao',179531,NULL,NULL),(814,'Tacloban','PHL','Eastern Visayas',178639,NULL,NULL),(815,'Malolos','PHL','Central Luzon',175291,NULL,NULL),(816,'Mabalacat','PHL','Central Luzon',171045,NULL,NULL),(817,'Cotabato','PHL','Central Mindanao',163849,NULL,NULL),(818,'Meycauayan','PHL','Central Luzon',163037,NULL,NULL),(819,'Puerto Princesa','PHL','Southern Tagalog',161912,NULL,NULL),(820,'Legazpi','PHL','Bicol',157010,NULL,NULL),(821,'Silang','PHL','Southern Tagalog',156137,NULL,NULL),(822,'Ormoc','PHL','Eastern Visayas',154297,NULL,NULL),(823,'San Carlos','PHL','Ilocos',154264,NULL,NULL),(824,'Kabankalan','PHL','Western Visayas',149769,NULL,NULL),(825,'Talisay','PHL','Central Visayas',148110,NULL,NULL),(826,'Valencia','PHL','Northern Mindanao',147924,NULL,NULL),(827,'Calbayog','PHL','Eastern Visayas',147187,NULL,NULL),(828,'Santa Maria','PHL','Central Luzon',144282,NULL,NULL),(829,'Pagadian','PHL','Western Mindanao',142515,NULL,NULL),(830,'Cadiz','PHL','Western Visayas',141954,NULL,NULL),(831,'Bago','PHL','Western Visayas',141721,NULL,NULL),(832,'Toledo','PHL','Central Visayas',141174,NULL,NULL),(833,'Naga','PHL','Bicol',137810,NULL,NULL),(834,'San Mateo','PHL','Southern Tagalog',135603,NULL,NULL),(835,'Panabo','PHL','Southern Mindanao',133950,NULL,NULL),(836,'Koronadal','PHL','Southern Mindanao',133786,NULL,NULL),(837,'Marawi','PHL','Central Mindanao',131090,NULL,NULL),(838,'Dagupan','PHL','Ilocos',130328,NULL,NULL),(839,'Sagay','PHL','Western Visayas',129765,NULL,NULL),(840,'Roxas','PHL','Western Visayas',126352,NULL,NULL),(841,'Lubao','PHL','Central Luzon',125699,NULL,NULL),(842,'Digos','PHL','Southern Mindanao',125171,NULL,NULL),(843,'San Miguel','PHL','Central Luzon',123824,NULL,NULL),(844,'Malaybalay','PHL','Northern Mindanao',123672,NULL,NULL),(845,'Tuguegarao','PHL','Cagayan Valley',120645,NULL,NULL),(846,'Ilagan','PHL','Cagayan Valley',119990,NULL,NULL),(847,'Baliuag','PHL','Central Luzon',119675,NULL,NULL),(848,'Surigao','PHL','Caraga',118534,NULL,NULL),(849,'San Carlos','PHL','Western Visayas',118259,NULL,NULL),(850,'San Juan del Monte','PHL','National Capital Reg',117680,NULL,NULL),(851,'Tanauan','PHL','Southern Tagalog',117539,NULL,NULL),(852,'Concepcion','PHL','Central Luzon',115171,NULL,NULL),(853,'Rodriguez (Montalban)','PHL','Southern Tagalog',115167,NULL,NULL),(854,'Sariaya','PHL','Southern Tagalog',114568,NULL,NULL),(855,'Malasiqui','PHL','Ilocos',113190,NULL,NULL),(856,'General Mariano Alvarez','PHL','Southern Tagalog',112446,NULL,NULL),(857,'Urdaneta','PHL','Ilocos',111582,NULL,NULL),(858,'Hagonoy','PHL','Central Luzon',111425,NULL,NULL),(859,'San Jose','PHL','Southern Tagalog',111009,NULL,NULL),(860,'Polomolok','PHL','Southern Mindanao',110709,NULL,NULL),(861,'Santiago','PHL','Cagayan Valley',110531,NULL,NULL),(862,'Tanza','PHL','Southern Tagalog',110517,NULL,NULL),(863,'Ozamis','PHL','Northern Mindanao',110420,NULL,NULL),(864,'Mexico','PHL','Central Luzon',109481,NULL,NULL),(865,'San Jose','PHL','Central Luzon',108254,NULL,NULL),(866,'Silay','PHL','Western Visayas',107722,NULL,NULL),(867,'General Trias','PHL','Southern Tagalog',107691,NULL,NULL),(868,'Tabaco','PHL','Bicol',107166,NULL,NULL),(869,'Cabuyao','PHL','Southern Tagalog',106630,NULL,NULL),(870,'Calapan','PHL','Southern Tagalog',105910,NULL,NULL),(871,'Mati','PHL','Southern Mindanao',105908,NULL,NULL),(872,'Midsayap','PHL','Central Mindanao',105760,NULL,NULL),(873,'Cauayan','PHL','Cagayan Valley',103952,NULL,NULL),(874,'Gingoog','PHL','Northern Mindanao',102379,NULL,NULL),(875,'Dumaguete','PHL','Central Visayas',102265,NULL,NULL),(876,'San Fernando','PHL','Ilocos',102082,NULL,NULL),(877,'Arayat','PHL','Central Luzon',101792,NULL,NULL),(878,'Bayawan (Tulong)','PHL','Central Visayas',101391,NULL,NULL),(879,'Kidapawan','PHL','Central Mindanao',101205,NULL,NULL),(880,'Daraga (Locsin)','PHL','Bicol',101031,NULL,NULL),(881,'Marilao','PHL','Central Luzon',101017,NULL,NULL),(882,'Malita','PHL','Southern Mindanao',100000,NULL,NULL),(883,'Dipolog','PHL','Western Mindanao',99862,NULL,NULL),(884,'Cavite','PHL','Southern Tagalog',99367,NULL,NULL),(885,'Danao','PHL','Central Visayas',98781,NULL,NULL),(886,'Bislig','PHL','Caraga',97860,NULL,NULL),(887,'Talavera','PHL','Central Luzon',97329,NULL,NULL),(888,'Guagua','PHL','Central Luzon',96858,NULL,NULL),(889,'Bayambang','PHL','Ilocos',96609,NULL,NULL),(890,'Nasugbu','PHL','Southern Tagalog',96113,NULL,NULL),(891,'Baybay','PHL','Eastern Visayas',95630,NULL,NULL),(892,'Capas','PHL','Central Luzon',95219,NULL,NULL),(893,'Sultan Kudarat','PHL','ARMM',94861,NULL,NULL),(894,'Laoag','PHL','Ilocos',94466,NULL,NULL),(895,'Bayugan','PHL','Caraga',93623,NULL,NULL),(896,'Malungon','PHL','Southern Mindanao',93232,NULL,NULL),(897,'Santa Cruz','PHL','Southern Tagalog',92694,NULL,NULL),(898,'Sorsogon','PHL','Bicol',92512,NULL,NULL),(899,'Candelaria','PHL','Southern Tagalog',92429,NULL,NULL),(900,'Ligao','PHL','Bicol',90603,NULL,NULL),(901,'Tórshavn','FRO','Streymoyar',14542,NULL,NULL),(902,'Libreville','GAB','Estuaire',419000,NULL,NULL),(903,'Serekunda','GMB','Kombo St Mary',102600,NULL,NULL),(904,'Banjul','GMB','Banjul',42326,NULL,NULL),(905,'Tbilisi','GEO','Tbilisi',1235200,NULL,NULL),(906,'Kutaisi','GEO','Imereti',240900,NULL,NULL),(907,'Rustavi','GEO','Kvemo Kartli',155400,NULL,NULL),(908,'Batumi','GEO','Adzaria [Atšara]',137700,NULL,NULL),(909,'Sohumi','GEO','Abhasia [Aphazeti]',111700,NULL,NULL),(910,'Accra','GHA','Greater Accra',1070000,NULL,NULL),(911,'Kumasi','GHA','Ashanti',385192,NULL,NULL),(912,'Tamale','GHA','Northern',151069,NULL,NULL),(913,'Tema','GHA','Greater Accra',109975,NULL,NULL),(914,'Sekondi-Takoradi','GHA','Western',103653,NULL,NULL),(915,'Gibraltar','GIB','–',27025,NULL,NULL),(916,'Saint George´s','GRD','St George',4621,NULL,NULL),(917,'Nuuk','GRL','Kitaa',13445,NULL,NULL),(918,'Les Abymes','GLP','Grande-Terre',62947,NULL,NULL),(919,'Basse-Terre','GLP','Basse-Terre',12433,NULL,NULL),(920,'Tamuning','GUM','–',9500,NULL,NULL),(921,'Agaña','GUM','–',1139,NULL,NULL),(922,'Ciudad de Guatemala','GTM','Guatemala',823301,NULL,NULL),(923,'Mixco','GTM','Guatemala',209791,NULL,NULL),(924,'Villa Nueva','GTM','Guatemala',101295,NULL,NULL),(925,'Quetzaltenango','GTM','Quetzaltenango',90801,NULL,NULL),(926,'Conakry','GIN','Conakry',1090610,NULL,NULL),(927,'Bissau','GNB','Bissau',241000,NULL,NULL),(928,'Georgetown','GUY','Georgetown',254000,NULL,NULL),(929,'Port-au-Prince','HTI','Ouest',884472,NULL,NULL),(930,'Carrefour','HTI','Ouest',290204,NULL,NULL),(931,'Delmas','HTI','Ouest',240429,NULL,NULL),(932,'Le-Cap-Haïtien','HTI','Nord',102233,NULL,NULL),(933,'Tegucigalpa','HND','Distrito Central',813900,NULL,NULL),(934,'San Pedro Sula','HND','Cortés',383900,NULL,NULL),(935,'La Ceiba','HND','Atlántida',89200,NULL,NULL),(936,'Kowloon and New Kowloon','HKG','Kowloon and New Kowl',1987996,NULL,NULL),(937,'Victoria','HKG','Hongkong',1312637,NULL,NULL),(938,'Longyearbyen','SJM','Länsimaa',1438,NULL,NULL),(939,'Jakarta','idN','Jakarta Raya',9604900,NULL,NULL),(940,'Surabaya','idN','East Java',2663820,NULL,NULL),(941,'Bandung','idN','West Java',2429000,NULL,NULL),(942,'Medan','idN','Sumatera Utara',1843919,NULL,NULL),(943,'Palembang','idN','Sumatera Selatan',1222764,NULL,NULL),(944,'Tangerang','idN','West Java',1198300,NULL,NULL),(945,'Semarang','idN','Central Java',1104405,NULL,NULL),(946,'Ujung Pandang','idN','Sulawesi Selatan',1060257,NULL,NULL),(947,'Malang','idN','East Java',716862,NULL,NULL),(948,'Bandar Lampung','idN','Lampung',680332,NULL,NULL),(949,'Bekasi','idN','West Java',644300,NULL,NULL),(950,'Padang','idN','Sumatera Barat',534474,NULL,NULL),(951,'Surakarta','idN','Central Java',518600,NULL,NULL),(952,'Banjarmasin','idN','Kalimantan Selatan',482931,NULL,NULL),(953,'Pekan Baru','idN','Riau',438638,NULL,NULL),(954,'Denpasar','idN','Bali',435000,NULL,NULL),(955,'Yogyakarta','idN','Yogyakarta',418944,NULL,NULL),(956,'Pontianak','idN','Kalimantan Barat',409632,NULL,NULL),(957,'Samarinda','idN','Kalimantan Timur',399175,NULL,NULL),(958,'Jambi','idN','Jambi',385201,NULL,NULL),(959,'Depok','idN','West Java',365200,NULL,NULL),(960,'Cimahi','idN','West Java',344600,NULL,NULL),(961,'Balikpapan','idN','Kalimantan Timur',338752,NULL,NULL),(962,'Manado','idN','Sulawesi Utara',332288,NULL,NULL),(963,'Mataram','idN','Nusa Tenggara Barat',306600,NULL,NULL),(964,'Pekalongan','idN','Central Java',301504,NULL,NULL),(965,'Tegal','idN','Central Java',289744,NULL,NULL),(966,'Bogor','idN','West Java',285114,NULL,NULL),(967,'Ciputat','idN','West Java',270800,NULL,NULL),(968,'Pondokgede','idN','West Java',263200,NULL,NULL),(969,'Cirebon','idN','West Java',254406,NULL,NULL),(970,'Kediri','idN','East Java',253760,NULL,NULL),(971,'Ambon','idN','Molukit',249312,NULL,NULL),(972,'Jember','idN','East Java',218500,NULL,NULL),(973,'Cilacap','idN','Central Java',206900,NULL,NULL),(974,'Cimanggis','idN','West Java',205100,NULL,NULL),(975,'Pematang Siantar','idN','Sumatera Utara',203056,NULL,NULL),(976,'Purwokerto','idN','Central Java',202500,NULL,NULL),(977,'Ciomas','idN','West Java',187400,NULL,NULL),(978,'Tasikmalaya','idN','West Java',179800,NULL,NULL),(979,'Madiun','idN','East Java',171532,NULL,NULL),(980,'Bengkulu','idN','Bengkulu',146439,NULL,NULL),(981,'Karawang','idN','West Java',145000,NULL,NULL),(982,'Banda Aceh','idN','Aceh',143409,NULL,NULL),(983,'Palu','idN','Sulawesi Tengah',142800,NULL,NULL),(984,'Pasuruan','idN','East Java',134019,NULL,NULL),(985,'Kupang','idN','Nusa Tenggara Timur',129300,NULL,NULL),(986,'Tebing Tinggi','idN','Sumatera Utara',129300,NULL,NULL),(987,'Percut Sei Tuan','idN','Sumatera Utara',129000,NULL,NULL),(988,'Binjai','idN','Sumatera Utara',127222,NULL,NULL),(989,'Sukabumi','idN','West Java',125766,NULL,NULL),(990,'Waru','idN','East Java',124300,NULL,NULL),(991,'Pangkal Pinang','idN','Sumatera Selatan',124000,NULL,NULL),(992,'Magelang','idN','Central Java',123800,NULL,NULL),(993,'Blitar','idN','East Java',122600,NULL,NULL),(994,'Serang','idN','West Java',122400,NULL,NULL),(995,'Probolinggo','idN','East Java',120770,NULL,NULL),(996,'Cilegon','idN','West Java',117000,NULL,NULL),(997,'Cianjur','idN','West Java',114300,NULL,NULL),(998,'Ciparay','idN','West Java',111500,NULL,NULL),(999,'Lhokseumawe','idN','Aceh',109600,NULL,NULL),(1000,'Taman','idN','East Java',107000,NULL,NULL),(1001,'Depok','idN','Yogyakarta',106800,NULL,NULL),(1002,'Citeureup','idN','West Java',105100,NULL,NULL),(1003,'Pemalang','idN','Central Java',103500,NULL,NULL),(1004,'Klaten','idN','Central Java',103300,NULL,NULL),(1005,'Salatiga','idN','Central Java',103000,NULL,NULL),(1006,'Cibinong','idN','West Java',101300,NULL,NULL),(1007,'Palangka Raya','idN','Kalimantan Tengah',99693,NULL,NULL),(1008,'Mojokerto','idN','East Java',96626,NULL,NULL),(1009,'Purwakarta','idN','West Java',95900,NULL,NULL),(1010,'Garut','idN','West Java',95800,NULL,NULL),(1011,'Kudus','idN','Central Java',95300,NULL,NULL),(1012,'Kendari','idN','Sulawesi Tenggara',94800,NULL,NULL),(1013,'Jaya Pura','idN','West Irian',94700,NULL,NULL),(1014,'Gorontalo','idN','Sulawesi Utara',94058,NULL,NULL),(1015,'Majalaya','idN','West Java',93200,NULL,NULL),(1016,'Pondok Aren','idN','West Java',92700,NULL,NULL),(1017,'Jombang','idN','East Java',92600,NULL,NULL),(1018,'Sunggal','idN','Sumatera Utara',92300,NULL,NULL),(1019,'Batam','idN','Riau',91871,NULL,NULL),(1020,'Padang Sidempuan','idN','Sumatera Utara',91200,NULL,NULL),(1021,'Sawangan','idN','West Java',91100,NULL,NULL),(1022,'Banyuwangi','idN','East Java',89900,NULL,NULL),(1023,'Tanjung Pinang','idN','Riau',89900,NULL,NULL),(1024,'Mumbai (Bombay)','IND','Maharashtra',10500000,NULL,NULL),(1025,'Delhi','IND','Delhi',7206704,NULL,NULL),(1026,'Calcutta [Kolkata]','IND','West Bengali',4399819,NULL,NULL),(1027,'Chennai (Madras)','IND','Tamil Nadu',3841396,NULL,NULL),(1028,'Hyderabad','IND','Andhra Pradesh',2964638,NULL,NULL),(1029,'Ahmedabad','IND','Gujarat',2876710,NULL,NULL),(1030,'Bangalore','IND','Karnataka',2660088,NULL,NULL),(1031,'Kanpur','IND','Uttar Pradesh',1874409,NULL,NULL),(1032,'Nagpur','IND','Maharashtra',1624752,NULL,NULL),(1033,'Lucknow','IND','Uttar Pradesh',1619115,NULL,NULL),(1034,'Pune','IND','Maharashtra',1566651,NULL,NULL),(1035,'Surat','IND','Gujarat',1498817,NULL,NULL),(1036,'Jaipur','IND','Rajasthan',1458483,NULL,NULL),(1037,'Indore','IND','Madhya Pradesh',1091674,NULL,NULL),(1038,'Bhopal','IND','Madhya Pradesh',1062771,NULL,NULL),(1039,'Ludhiana','IND','Punjab',1042740,NULL,NULL),(1040,'Vadodara (Baroda)','IND','Gujarat',1031346,NULL,NULL),(1041,'Kalyan','IND','Maharashtra',1014557,NULL,NULL),(1042,'Madurai','IND','Tamil Nadu',977856,NULL,NULL),(1043,'Haora (Howrah)','IND','West Bengali',950435,NULL,NULL),(1044,'Varanasi (Benares)','IND','Uttar Pradesh',929270,NULL,NULL),(1045,'Patna','IND','Bihar',917243,NULL,NULL),(1046,'Srinagar','IND','Jammu and Kashmir',892506,NULL,NULL),(1047,'Agra','IND','Uttar Pradesh',891790,NULL,NULL),(1048,'Coimbatore','IND','Tamil Nadu',816321,NULL,NULL),(1049,'Thane (Thana)','IND','Maharashtra',803389,NULL,NULL),(1050,'Allahabad','IND','Uttar Pradesh',792858,NULL,NULL),(1051,'Meerut','IND','Uttar Pradesh',753778,NULL,NULL),(1052,'Vishakhapatnam','IND','Andhra Pradesh',752037,NULL,NULL),(1053,'Jabalpur','IND','Madhya Pradesh',741927,NULL,NULL),(1054,'Amritsar','IND','Punjab',708835,NULL,NULL),(1055,'Faridabad','IND','Haryana',703592,NULL,NULL),(1056,'Vijayawada','IND','Andhra Pradesh',701827,NULL,NULL),(1057,'Gwalior','IND','Madhya Pradesh',690765,NULL,NULL),(1058,'Jodhpur','IND','Rajasthan',666279,NULL,NULL),(1059,'Nashik (Nasik)','IND','Maharashtra',656925,NULL,NULL),(1060,'Hubli-Dharwad','IND','Karnataka',648298,NULL,NULL),(1061,'Solapur (Sholapur)','IND','Maharashtra',604215,NULL,NULL),(1062,'Ranchi','IND','Jharkhand',599306,NULL,NULL),(1063,'Bareilly','IND','Uttar Pradesh',587211,NULL,NULL),(1064,'Guwahati (Gauhati)','IND','Assam',584342,NULL,NULL),(1065,'Shambajinagar (Aurangabad)','IND','Maharashtra',573272,NULL,NULL),(1066,'Cochin (Kochi)','IND','Kerala',564589,NULL,NULL),(1067,'Rajkot','IND','Gujarat',559407,NULL,NULL),(1068,'Kota','IND','Rajasthan',537371,NULL,NULL),(1069,'Thiruvananthapuram (Trivandrum','IND','Kerala',524006,NULL,NULL),(1070,'Pimpri-Chinchwad','IND','Maharashtra',517083,NULL,NULL),(1071,'Jalandhar (Jullundur)','IND','Punjab',509510,NULL,NULL),(1072,'Gorakhpur','IND','Uttar Pradesh',505566,NULL,NULL),(1073,'Chandigarh','IND','Chandigarh',504094,NULL,NULL),(1074,'Mysore','IND','Karnataka',480692,NULL,NULL),(1075,'Aligarh','IND','Uttar Pradesh',480520,NULL,NULL),(1076,'Guntur','IND','Andhra Pradesh',471051,NULL,NULL),(1077,'Jamshedpur','IND','Jharkhand',460577,NULL,NULL),(1078,'Ghaziabad','IND','Uttar Pradesh',454156,NULL,NULL),(1079,'Warangal','IND','Andhra Pradesh',447657,NULL,NULL),(1080,'Raipur','IND','Chhatisgarh',438639,NULL,NULL),(1081,'Moradabad','IND','Uttar Pradesh',429214,NULL,NULL),(1082,'Durgapur','IND','West Bengali',425836,NULL,NULL),(1083,'Amravati','IND','Maharashtra',421576,NULL,NULL),(1084,'Calicut (Kozhikode)','IND','Kerala',419831,NULL,NULL),(1085,'Bikaner','IND','Rajasthan',416289,NULL,NULL),(1086,'Bhubaneswar','IND','Orissa',411542,NULL,NULL),(1087,'Kolhapur','IND','Maharashtra',406370,NULL,NULL),(1088,'Kataka (Cuttack)','IND','Orissa',403418,NULL,NULL),(1089,'Ajmer','IND','Rajasthan',402700,NULL,NULL),(1090,'Bhavnagar','IND','Gujarat',402338,NULL,NULL),(1091,'Tiruchirapalli','IND','Tamil Nadu',387223,NULL,NULL),(1092,'Bhilai','IND','Chhatisgarh',386159,NULL,NULL),(1093,'Bhiwandi','IND','Maharashtra',379070,NULL,NULL),(1094,'Saharanpur','IND','Uttar Pradesh',374945,NULL,NULL),(1095,'Ulhasnagar','IND','Maharashtra',369077,NULL,NULL),(1096,'Salem','IND','Tamil Nadu',366712,NULL,NULL),(1097,'Ujjain','IND','Madhya Pradesh',362266,NULL,NULL),(1098,'Malegaon','IND','Maharashtra',342595,NULL,NULL),(1099,'Jamnagar','IND','Gujarat',341637,NULL,NULL),(1100,'Bokaro Steel City','IND','Jharkhand',333683,NULL,NULL),(1101,'Akola','IND','Maharashtra',328034,NULL,NULL),(1102,'Belgaum','IND','Karnataka',326399,NULL,NULL),(1103,'Rajahmundry','IND','Andhra Pradesh',324851,NULL,NULL),(1104,'Nellore','IND','Andhra Pradesh',316606,NULL,NULL),(1105,'Udaipur','IND','Rajasthan',308571,NULL,NULL),(1106,'New Bombay','IND','Maharashtra',307297,NULL,NULL),(1107,'Bhatpara','IND','West Bengali',304952,NULL,NULL),(1108,'Gulbarga','IND','Karnataka',304099,NULL,NULL),(1109,'New Delhi','IND','Delhi',301297,NULL,NULL),(1110,'Jhansi','IND','Uttar Pradesh',300850,NULL,NULL),(1111,'Gaya','IND','Bihar',291675,NULL,NULL),(1112,'Kakinada','IND','Andhra Pradesh',279980,NULL,NULL),(1113,'Dhule (Dhulia)','IND','Maharashtra',278317,NULL,NULL),(1114,'Panihati','IND','West Bengali',275990,NULL,NULL),(1115,'Nanded (Nander)','IND','Maharashtra',275083,NULL,NULL),(1116,'Mangalore','IND','Karnataka',273304,NULL,NULL),(1117,'Dehra Dun','IND','Uttaranchal',270159,NULL,NULL),(1118,'Kamarhati','IND','West Bengali',266889,NULL,NULL),(1119,'Davangere','IND','Karnataka',266082,NULL,NULL),(1120,'Asansol','IND','West Bengali',262188,NULL,NULL),(1121,'Bhagalpur','IND','Bihar',253225,NULL,NULL),(1122,'Bellary','IND','Karnataka',245391,NULL,NULL),(1123,'Barddhaman (Burdwan)','IND','West Bengali',245079,NULL,NULL),(1124,'Rampur','IND','Uttar Pradesh',243742,NULL,NULL),(1125,'Jalgaon','IND','Maharashtra',242193,NULL,NULL),(1126,'Muzaffarpur','IND','Bihar',241107,NULL,NULL),(1127,'Nizamabad','IND','Andhra Pradesh',241034,NULL,NULL),(1128,'Muzaffarnagar','IND','Uttar Pradesh',240609,NULL,NULL),(1129,'Patiala','IND','Punjab',238368,NULL,NULL),(1130,'Shahjahanpur','IND','Uttar Pradesh',237713,NULL,NULL),(1131,'Kurnool','IND','Andhra Pradesh',236800,NULL,NULL),(1132,'Tiruppur (Tirupper)','IND','Tamil Nadu',235661,NULL,NULL),(1133,'Rohtak','IND','Haryana',233400,NULL,NULL),(1134,'South Dum Dum','IND','West Bengali',232811,NULL,NULL),(1135,'Mathura','IND','Uttar Pradesh',226691,NULL,NULL),(1136,'Chandrapur','IND','Maharashtra',226105,NULL,NULL),(1137,'Barahanagar (Baranagar)','IND','West Bengali',224821,NULL,NULL),(1138,'Darbhanga','IND','Bihar',218391,NULL,NULL),(1139,'Siliguri (Shiliguri)','IND','West Bengali',216950,NULL,NULL),(1140,'Raurkela','IND','Orissa',215489,NULL,NULL),(1141,'Ambattur','IND','Tamil Nadu',215424,NULL,NULL),(1142,'Panipat','IND','Haryana',215218,NULL,NULL),(1143,'Firozabad','IND','Uttar Pradesh',215128,NULL,NULL),(1144,'Ichalkaranji','IND','Maharashtra',214950,NULL,NULL),(1145,'Jammu','IND','Jammu and Kashmir',214737,NULL,NULL),(1146,'Ramagundam','IND','Andhra Pradesh',214384,NULL,NULL),(1147,'Eluru','IND','Andhra Pradesh',212866,NULL,NULL),(1148,'Brahmapur','IND','Orissa',210418,NULL,NULL),(1149,'Alwar','IND','Rajasthan',205086,NULL,NULL),(1150,'Pondicherry','IND','Pondicherry',203065,NULL,NULL),(1151,'Thanjavur','IND','Tamil Nadu',202013,NULL,NULL),(1152,'Bihar Sharif','IND','Bihar',201323,NULL,NULL),(1153,'Tuticorin','IND','Tamil Nadu',199854,NULL,NULL),(1154,'Imphal','IND','Manipur',198535,NULL,NULL),(1155,'Latur','IND','Maharashtra',197408,NULL,NULL),(1156,'Sagar','IND','Madhya Pradesh',195346,NULL,NULL),(1157,'Farrukhabad-cum-Fatehgarh','IND','Uttar Pradesh',194567,NULL,NULL),(1158,'Sangli','IND','Maharashtra',193197,NULL,NULL),(1159,'Parbhani','IND','Maharashtra',190255,NULL,NULL),(1160,'Nagar Coil','IND','Tamil Nadu',190084,NULL,NULL),(1161,'Bijapur','IND','Karnataka',186939,NULL,NULL),(1162,'Kukatpalle','IND','Andhra Pradesh',185378,NULL,NULL),(1163,'Bally','IND','West Bengali',184474,NULL,NULL),(1164,'Bhilwara','IND','Rajasthan',183965,NULL,NULL),(1165,'Ratlam','IND','Madhya Pradesh',183375,NULL,NULL),(1166,'Avadi','IND','Tamil Nadu',183215,NULL,NULL),(1167,'Dindigul','IND','Tamil Nadu',182477,NULL,NULL),(1168,'Ahmadnagar','IND','Maharashtra',181339,NULL,NULL),(1169,'Bilaspur','IND','Chhatisgarh',179833,NULL,NULL),(1170,'Shimoga','IND','Karnataka',179258,NULL,NULL),(1171,'Kharagpur','IND','West Bengali',177989,NULL,NULL),(1172,'Mira Bhayandar','IND','Maharashtra',175372,NULL,NULL),(1173,'Vellore','IND','Tamil Nadu',175061,NULL,NULL),(1174,'Jalna','IND','Maharashtra',174985,NULL,NULL),(1175,'Burnpur','IND','West Bengali',174933,NULL,NULL),(1176,'Anantapur','IND','Andhra Pradesh',174924,NULL,NULL),(1177,'Allappuzha (Alleppey)','IND','Kerala',174666,NULL,NULL),(1178,'Tirupati','IND','Andhra Pradesh',174369,NULL,NULL),(1179,'Karnal','IND','Haryana',173751,NULL,NULL),(1180,'Burhanpur','IND','Madhya Pradesh',172710,NULL,NULL),(1181,'Hisar (Hissar)','IND','Haryana',172677,NULL,NULL),(1182,'Tiruvottiyur','IND','Tamil Nadu',172562,NULL,NULL),(1183,'Mirzapur-cum-Vindhyachal','IND','Uttar Pradesh',169336,NULL,NULL),(1184,'Secunderabad','IND','Andhra Pradesh',167461,NULL,NULL),(1185,'Nadiad','IND','Gujarat',167051,NULL,NULL),(1186,'Dewas','IND','Madhya Pradesh',164364,NULL,NULL),(1187,'Murwara (Katni)','IND','Madhya Pradesh',163431,NULL,NULL),(1188,'Ganganagar','IND','Rajasthan',161482,NULL,NULL),(1189,'Vizianagaram','IND','Andhra Pradesh',160359,NULL,NULL),(1190,'Erode','IND','Tamil Nadu',159232,NULL,NULL),(1191,'Machilipatnam (Masulipatam)','IND','Andhra Pradesh',159110,NULL,NULL),(1192,'Bhatinda (Bathinda)','IND','Punjab',159042,NULL,NULL),(1193,'Raichur','IND','Karnataka',157551,NULL,NULL),(1194,'Agartala','IND','Tripura',157358,NULL,NULL),(1195,'Arrah (Ara)','IND','Bihar',157082,NULL,NULL),(1196,'Satna','IND','Madhya Pradesh',156630,NULL,NULL),(1197,'Lalbahadur Nagar','IND','Andhra Pradesh',155500,NULL,NULL),(1198,'Aizawl','IND','Mizoram',155240,NULL,NULL),(1199,'Uluberia','IND','West Bengali',155172,NULL,NULL),(1200,'Katihar','IND','Bihar',154367,NULL,NULL),(1201,'Cuddalore','IND','Tamil Nadu',153086,NULL,NULL),(1202,'Hugli-Chinsurah','IND','West Bengali',151806,NULL,NULL),(1203,'Dhanbad','IND','Jharkhand',151789,NULL,NULL),(1204,'Raiganj','IND','West Bengali',151045,NULL,NULL),(1205,'Sambhal','IND','Uttar Pradesh',150869,NULL,NULL),(1206,'Durg','IND','Chhatisgarh',150645,NULL,NULL),(1207,'Munger (Monghyr)','IND','Bihar',150112,NULL,NULL),(1208,'Kanchipuram','IND','Tamil Nadu',150100,NULL,NULL),(1209,'North Dum Dum','IND','West Bengali',149965,NULL,NULL),(1210,'Karimnagar','IND','Andhra Pradesh',148583,NULL,NULL),(1211,'Bharatpur','IND','Rajasthan',148519,NULL,NULL),(1212,'Sikar','IND','Rajasthan',148272,NULL,NULL),(1213,'Hardwar (Haridwar)','IND','Uttaranchal',147305,NULL,NULL),(1214,'Dabgram','IND','West Bengali',147217,NULL,NULL),(1215,'Morena','IND','Madhya Pradesh',147124,NULL,NULL),(1216,'Noida','IND','Uttar Pradesh',146514,NULL,NULL),(1217,'Hapur','IND','Uttar Pradesh',146262,NULL,NULL),(1218,'Bhusawal','IND','Maharashtra',145143,NULL,NULL),(1219,'Khandwa','IND','Madhya Pradesh',145133,NULL,NULL),(1220,'Yamuna Nagar','IND','Haryana',144346,NULL,NULL),(1221,'Sonipat (Sonepat)','IND','Haryana',143922,NULL,NULL),(1222,'Tenali','IND','Andhra Pradesh',143726,NULL,NULL),(1223,'Raurkela Civil Township','IND','Orissa',140408,NULL,NULL),(1224,'Kollam (Quilon)','IND','Kerala',139852,NULL,NULL),(1225,'Kumbakonam','IND','Tamil Nadu',139483,NULL,NULL),(1226,'Ingraj Bazar (English Bazar)','IND','West Bengali',139204,NULL,NULL),(1227,'Timkur','IND','Karnataka',138903,NULL,NULL),(1228,'Amroha','IND','Uttar Pradesh',137061,NULL,NULL),(1229,'Serampore','IND','West Bengali',137028,NULL,NULL),(1230,'Chapra','IND','Bihar',136877,NULL,NULL),(1231,'Pali','IND','Rajasthan',136842,NULL,NULL),(1232,'Maunath Bhanjan','IND','Uttar Pradesh',136697,NULL,NULL),(1233,'Adoni','IND','Andhra Pradesh',136182,NULL,NULL),(1234,'Jaunpur','IND','Uttar Pradesh',136062,NULL,NULL),(1235,'Tirunelveli','IND','Tamil Nadu',135825,NULL,NULL),(1236,'Bahraich','IND','Uttar Pradesh',135400,NULL,NULL),(1237,'Gadag Betigeri','IND','Karnataka',134051,NULL,NULL),(1238,'Proddatur','IND','Andhra Pradesh',133914,NULL,NULL),(1239,'Chittoor','IND','Andhra Pradesh',133462,NULL,NULL),(1240,'Barrackpur','IND','West Bengali',133265,NULL,NULL),(1241,'Bharuch (Broach)','IND','Gujarat',133102,NULL,NULL),(1242,'Naihati','IND','West Bengali',132701,NULL,NULL),(1243,'Shillong','IND','Meghalaya',131719,NULL,NULL),(1244,'Sambalpur','IND','Orissa',131138,NULL,NULL),(1245,'Junagadh','IND','Gujarat',130484,NULL,NULL),(1246,'Rae Bareli','IND','Uttar Pradesh',129904,NULL,NULL),(1247,'Rewa','IND','Madhya Pradesh',128981,NULL,NULL),(1248,'Gurgaon','IND','Haryana',128608,NULL,NULL),(1249,'Khammam','IND','Andhra Pradesh',127992,NULL,NULL),(1250,'Bulandshahr','IND','Uttar Pradesh',127201,NULL,NULL),(1251,'Navsari','IND','Gujarat',126089,NULL,NULL),(1252,'Malkajgiri','IND','Andhra Pradesh',126066,NULL,NULL),(1253,'Midnapore (Medinipur)','IND','West Bengali',125498,NULL,NULL),(1254,'Miraj','IND','Maharashtra',125407,NULL,NULL),(1255,'Raj Nandgaon','IND','Chhatisgarh',125371,NULL,NULL),(1256,'Alandur','IND','Tamil Nadu',125244,NULL,NULL),(1257,'Puri','IND','Orissa',125199,NULL,NULL),(1258,'Navadwip','IND','West Bengali',125037,NULL,NULL),(1259,'Sirsa','IND','Haryana',125000,NULL,NULL),(1260,'Korba','IND','Chhatisgarh',124501,NULL,NULL),(1261,'Faizabad','IND','Uttar Pradesh',124437,NULL,NULL),(1262,'Etawah','IND','Uttar Pradesh',124072,NULL,NULL),(1263,'Pathankot','IND','Punjab',123930,NULL,NULL),(1264,'Gandhinagar','IND','Gujarat',123359,NULL,NULL),(1265,'Palghat (Palakkad)','IND','Kerala',123289,NULL,NULL),(1266,'Veraval','IND','Gujarat',123000,NULL,NULL),(1267,'Hoshiarpur','IND','Punjab',122705,NULL,NULL),(1268,'Ambala','IND','Haryana',122596,NULL,NULL),(1269,'Sitapur','IND','Uttar Pradesh',121842,NULL,NULL),(1270,'Bhiwani','IND','Haryana',121629,NULL,NULL),(1271,'Cuddapah','IND','Andhra Pradesh',121463,NULL,NULL),(1272,'Bhimavaram','IND','Andhra Pradesh',121314,NULL,NULL),(1273,'Krishnanagar','IND','West Bengali',121110,NULL,NULL),(1274,'Chandannagar','IND','West Bengali',120378,NULL,NULL),(1275,'Mandya','IND','Karnataka',120265,NULL,NULL),(1276,'Dibrugarh','IND','Assam',120127,NULL,NULL),(1277,'Nandyal','IND','Andhra Pradesh',119813,NULL,NULL),(1278,'Balurghat','IND','West Bengali',119796,NULL,NULL),(1279,'Neyveli','IND','Tamil Nadu',118080,NULL,NULL),(1280,'Fatehpur','IND','Uttar Pradesh',117675,NULL,NULL),(1281,'Mahbubnagar','IND','Andhra Pradesh',116833,NULL,NULL),(1282,'Budaun','IND','Uttar Pradesh',116695,NULL,NULL),(1283,'Porbandar','IND','Gujarat',116671,NULL,NULL),(1284,'Silchar','IND','Assam',115483,NULL,NULL),(1285,'Berhampore (Baharampur)','IND','West Bengali',115144,NULL,NULL),(1286,'Purnea (Purnia)','IND','Jharkhand',114912,NULL,NULL),(1287,'Bankura','IND','West Bengali',114876,NULL,NULL),(1288,'Rajapalaiyam','IND','Tamil Nadu',114202,NULL,NULL),(1289,'Titagarh','IND','West Bengali',114085,NULL,NULL),(1290,'Halisahar','IND','West Bengali',114028,NULL,NULL),(1291,'Hathras','IND','Uttar Pradesh',113285,NULL,NULL),(1292,'Bhir (Bid)','IND','Maharashtra',112434,NULL,NULL),(1293,'Pallavaram','IND','Tamil Nadu',111866,NULL,NULL),(1294,'Anand','IND','Gujarat',110266,NULL,NULL),(1295,'Mango','IND','Jharkhand',110024,NULL,NULL),(1296,'Santipur','IND','West Bengali',109956,NULL,NULL),(1297,'Bhind','IND','Madhya Pradesh',109755,NULL,NULL),(1298,'Gondiya','IND','Maharashtra',109470,NULL,NULL),(1299,'Tiruvannamalai','IND','Tamil Nadu',109196,NULL,NULL),(1300,'Yeotmal (Yavatmal)','IND','Maharashtra',108578,NULL,NULL),(1301,'Kulti-Barakar','IND','West Bengali',108518,NULL,NULL),(1302,'Moga','IND','Punjab',108304,NULL,NULL),(1303,'Shivapuri','IND','Madhya Pradesh',108277,NULL,NULL),(1304,'Bidar','IND','Karnataka',108016,NULL,NULL),(1305,'Guntakal','IND','Andhra Pradesh',107592,NULL,NULL),(1306,'Unnao','IND','Uttar Pradesh',107425,NULL,NULL),(1307,'Barasat','IND','West Bengali',107365,NULL,NULL),(1308,'Tambaram','IND','Tamil Nadu',107187,NULL,NULL),(1309,'Abohar','IND','Punjab',107163,NULL,NULL),(1310,'Pilibhit','IND','Uttar Pradesh',106605,NULL,NULL),(1311,'Valparai','IND','Tamil Nadu',106523,NULL,NULL),(1312,'Gonda','IND','Uttar Pradesh',106078,NULL,NULL),(1313,'Surendranagar','IND','Gujarat',105973,NULL,NULL),(1314,'Qutubullapur','IND','Andhra Pradesh',105380,NULL,NULL),(1315,'Beawar','IND','Rajasthan',105363,NULL,NULL),(1316,'Hindupur','IND','Andhra Pradesh',104651,NULL,NULL),(1317,'Gandhidham','IND','Gujarat',104585,NULL,NULL),(1318,'Haldwani-cum-Kathgodam','IND','Uttaranchal',104195,NULL,NULL),(1319,'Tellicherry (Thalassery)','IND','Kerala',103579,NULL,NULL),(1320,'Wardha','IND','Maharashtra',102985,NULL,NULL),(1321,'Rishra','IND','West Bengali',102649,NULL,NULL),(1322,'Bhuj','IND','Gujarat',102176,NULL,NULL),(1323,'Modinagar','IND','Uttar Pradesh',101660,NULL,NULL),(1324,'Gudivada','IND','Andhra Pradesh',101656,NULL,NULL),(1325,'Basirhat','IND','West Bengali',101409,NULL,NULL),(1326,'Uttarpara-Kotrung','IND','West Bengali',100867,NULL,NULL),(1327,'Ongole','IND','Andhra Pradesh',100836,NULL,NULL),(1328,'North Barrackpur','IND','West Bengali',100513,NULL,NULL),(1329,'Guna','IND','Madhya Pradesh',100490,NULL,NULL),(1330,'Haldia','IND','West Bengali',100347,NULL,NULL),(1331,'Habra','IND','West Bengali',100223,NULL,NULL),(1332,'Kanchrapara','IND','West Bengali',100194,NULL,NULL),(1333,'Tonk','IND','Rajasthan',100079,NULL,NULL),(1334,'Champdani','IND','West Bengali',98818,NULL,NULL),(1335,'Orai','IND','Uttar Pradesh',98640,NULL,NULL),(1336,'Pudukkottai','IND','Tamil Nadu',98619,NULL,NULL),(1337,'Sasaram','IND','Bihar',98220,NULL,NULL),(1338,'Hazaribag','IND','Jharkhand',97712,NULL,NULL),(1339,'Palayankottai','IND','Tamil Nadu',97662,NULL,NULL),(1340,'Banda','IND','Uttar Pradesh',97227,NULL,NULL),(1341,'Godhra','IND','Gujarat',96813,NULL,NULL),(1342,'Hospet','IND','Karnataka',96322,NULL,NULL),(1343,'Ashoknagar-Kalyangarh','IND','West Bengali',96315,NULL,NULL),(1344,'Achalpur','IND','Maharashtra',96216,NULL,NULL),(1345,'Patan','IND','Gujarat',96109,NULL,NULL),(1346,'Mandasor','IND','Madhya Pradesh',95758,NULL,NULL),(1347,'Damoh','IND','Madhya Pradesh',95661,NULL,NULL),(1348,'Satara','IND','Maharashtra',95133,NULL,NULL),(1349,'Meerut Cantonment','IND','Uttar Pradesh',94876,NULL,NULL),(1350,'Dehri','IND','Bihar',94526,NULL,NULL),(1351,'Delhi Cantonment','IND','Delhi',94326,NULL,NULL),(1352,'Chhindwara','IND','Madhya Pradesh',93731,NULL,NULL),(1353,'Bansberia','IND','West Bengali',93447,NULL,NULL),(1354,'Nagaon','IND','Assam',93350,NULL,NULL),(1355,'Kanpur Cantonment','IND','Uttar Pradesh',93109,NULL,NULL),(1356,'Vidisha','IND','Madhya Pradesh',92917,NULL,NULL),(1357,'Bettiah','IND','Bihar',92583,NULL,NULL),(1358,'Purulia','IND','Jharkhand',92574,NULL,NULL),(1359,'Hassan','IND','Karnataka',90803,NULL,NULL),(1360,'Ambala Sadar','IND','Haryana',90712,NULL,NULL),(1361,'Baidyabati','IND','West Bengali',90601,NULL,NULL),(1362,'Morvi','IND','Gujarat',90357,NULL,NULL),(1363,'Raigarh','IND','Chhatisgarh',89166,NULL,NULL),(1364,'Vejalpur','IND','Gujarat',89053,NULL,NULL),(1365,'Baghdad','IRQ','Baghdad',4336000,NULL,NULL),(1366,'Mosul','IRQ','Ninawa',879000,NULL,NULL),(1367,'Irbil','IRQ','Irbil',485968,NULL,NULL),(1368,'Kirkuk','IRQ','al-Tamim',418624,NULL,NULL),(1369,'Basra','IRQ','Basra',406296,NULL,NULL),(1370,'al-Sulaymaniya','IRQ','al-Sulaymaniya',364096,NULL,NULL),(1371,'al-Najaf','IRQ','al-Najaf',309010,NULL,NULL),(1372,'Karbala','IRQ','Karbala',296705,NULL,NULL),(1373,'al-Hilla','IRQ','Babil',268834,NULL,NULL),(1374,'al-Nasiriya','IRQ','DhiQar',265937,NULL,NULL),(1375,'al-Amara','IRQ','Maysan',208797,NULL,NULL),(1376,'al-Diwaniya','IRQ','al-Qadisiya',196519,NULL,NULL),(1377,'al-Ramadi','IRQ','al-Anbar',192556,NULL,NULL),(1378,'al-Kut','IRQ','Wasit',183183,NULL,NULL),(1379,'Baquba','IRQ','Diyala',114516,NULL,NULL),(1380,'Teheran','IRN','Teheran',6758845,NULL,NULL),(1381,'Mashhad','IRN','Khorasan',1887405,NULL,NULL),(1382,'Esfahan','IRN','Esfahan',1266072,NULL,NULL),(1383,'Tabriz','IRN','East Azerbaidzan',1191043,NULL,NULL),(1384,'Shiraz','IRN','Fars',1053025,NULL,NULL),(1385,'Karaj','IRN','Teheran',940968,NULL,NULL),(1386,'Ahvaz','IRN','Khuzestan',804980,NULL,NULL),(1387,'Qom','IRN','Qom',777677,NULL,NULL),(1388,'Kermanshah','IRN','Kermanshah',692986,NULL,NULL),(1389,'Urmia','IRN','West Azerbaidzan',435200,NULL,NULL),(1390,'Zahedan','IRN','Sistan va Baluchesta',419518,NULL,NULL),(1391,'Rasht','IRN','Gilan',417748,NULL,NULL),(1392,'Hamadan','IRN','Hamadan',401281,NULL,NULL),(1393,'Kerman','IRN','Kerman',384991,NULL,NULL),(1394,'Arak','IRN','Markazi',380755,NULL,NULL),(1395,'Ardebil','IRN','Ardebil',340386,NULL,NULL),(1396,'Yazd','IRN','Yazd',326776,NULL,NULL),(1397,'Qazvin','IRN','Qazvin',291117,NULL,NULL),(1398,'Zanjan','IRN','Zanjan',286295,NULL,NULL),(1399,'Sanandaj','IRN','Kordestan',277808,NULL,NULL),(1400,'Bandar-e-Abbas','IRN','Hormozgan',273578,NULL,NULL),(1401,'Khorramabad','IRN','Lorestan',272815,NULL,NULL),(1402,'Eslamshahr','IRN','Teheran',265450,NULL,NULL),(1403,'Borujerd','IRN','Lorestan',217804,NULL,NULL),(1404,'Abadan','IRN','Khuzestan',206073,NULL,NULL),(1405,'Dezful','IRN','Khuzestan',202639,NULL,NULL),(1406,'Kashan','IRN','Esfahan',201372,NULL,NULL),(1407,'Sari','IRN','Mazandaran',195882,NULL,NULL),(1408,'Gorgan','IRN','Golestan',188710,NULL,NULL),(1409,'Najafabad','IRN','Esfahan',178498,NULL,NULL),(1410,'Sabzevar','IRN','Khorasan',170738,NULL,NULL),(1411,'Khomeynishahr','IRN','Esfahan',165888,NULL,NULL),(1412,'Amol','IRN','Mazandaran',159092,NULL,NULL),(1413,'Neyshabur','IRN','Khorasan',158847,NULL,NULL),(1414,'Babol','IRN','Mazandaran',158346,NULL,NULL),(1415,'Khoy','IRN','West Azerbaidzan',148944,NULL,NULL),(1416,'Malayer','IRN','Hamadan',144373,NULL,NULL),(1417,'Bushehr','IRN','Bushehr',143641,NULL,NULL),(1418,'Qaemshahr','IRN','Mazandaran',143286,NULL,NULL),(1419,'Qarchak','IRN','Teheran',142690,NULL,NULL),(1420,'Qods','IRN','Teheran',138278,NULL,NULL),(1421,'Sirjan','IRN','Kerman',135024,NULL,NULL),(1422,'Bojnurd','IRN','Khorasan',134835,NULL,NULL),(1423,'Maragheh','IRN','East Azerbaidzan',132318,NULL,NULL),(1424,'Birjand','IRN','Khorasan',127608,NULL,NULL),(1425,'Ilam','IRN','Ilam',126346,NULL,NULL),(1426,'Bukan','IRN','West Azerbaidzan',120020,NULL,NULL),(1427,'Masjed-e-Soleyman','IRN','Khuzestan',116883,NULL,NULL),(1428,'Saqqez','IRN','Kordestan',115394,NULL,NULL),(1429,'Gonbad-e Qabus','IRN','Mazandaran',111253,NULL,NULL),(1430,'Saveh','IRN','Qom',111245,NULL,NULL),(1431,'Mahabad','IRN','West Azerbaidzan',107799,NULL,NULL),(1432,'Varamin','IRN','Teheran',107233,NULL,NULL),(1433,'Andimeshk','IRN','Khuzestan',106923,NULL,NULL),(1434,'Khorramshahr','IRN','Khuzestan',105636,NULL,NULL),(1435,'Shahrud','IRN','Semnan',104765,NULL,NULL),(1436,'Marv Dasht','IRN','Fars',103579,NULL,NULL),(1437,'Zabol','IRN','Sistan va Baluchesta',100887,NULL,NULL),(1438,'Shahr-e Kord','IRN','Chaharmahal va Bakht',100477,NULL,NULL),(1439,'Bandar-e Anzali','IRN','Gilan',98500,NULL,NULL),(1440,'Rafsanjan','IRN','Kerman',98300,NULL,NULL),(1441,'Marand','IRN','East Azerbaidzan',96400,NULL,NULL),(1442,'Torbat-e Heydariyeh','IRN','Khorasan',94600,NULL,NULL),(1443,'Jahrom','IRN','Fars',94200,NULL,NULL),(1444,'Semnan','IRN','Semnan',91045,NULL,NULL),(1445,'Miandoab','IRN','West Azerbaidzan',90100,NULL,NULL),(1446,'Qomsheh','IRN','Esfahan',89800,NULL,NULL),(1447,'Dublin','IRL','Leinster',481854,NULL,NULL),(1448,'Cork','IRL','Munster',127187,NULL,NULL),(1449,'Reykjavík','ISL','Höfuðborgarsvæði',109184,NULL,NULL),(1450,'Jerusalem','ISR','Jerusalem',633700,NULL,NULL),(1451,'Tel Aviv-Jaffa','ISR','Tel Aviv',348100,NULL,NULL),(1452,'Haifa','ISR','Haifa',265700,NULL,NULL),(1453,'Rishon Le Ziyyon','ISR','Ha Merkaz',188200,NULL,NULL),(1454,'Beerseba','ISR','Ha Darom',163700,NULL,NULL),(1455,'Holon','ISR','Tel Aviv',163100,NULL,NULL),(1456,'Petah Tiqwa','ISR','Ha Merkaz',159400,NULL,NULL),(1457,'Ashdod','ISR','Ha Darom',155800,NULL,NULL),(1458,'Netanya','ISR','Ha Merkaz',154900,NULL,NULL),(1459,'Bat Yam','ISR','Tel Aviv',137000,NULL,NULL),(1460,'Bene Beraq','ISR','Tel Aviv',133900,NULL,NULL),(1461,'Ramat Gan','ISR','Tel Aviv',126900,NULL,NULL),(1462,'Ashqelon','ISR','Ha Darom',92300,NULL,NULL),(1463,'Rehovot','ISR','Ha Merkaz',90300,NULL,NULL),(1464,'Roma','ITA','Latium',2643581,NULL,NULL),(1465,'Milano','ITA','Lombardia',1300977,NULL,NULL),(1466,'Napoli','ITA','Campania',1002619,NULL,NULL),(1467,'Torino','ITA','Piemonte',903705,NULL,NULL),(1468,'Palermo','ITA','Sisilia',683794,NULL,NULL),(1469,'Genova','ITA','Liguria',636104,NULL,NULL),(1470,'Bologna','ITA','Emilia-Romagna',381161,NULL,NULL),(1471,'Firenze','ITA','Toscana',376662,NULL,NULL),(1472,'Catania','ITA','Sisilia',337862,NULL,NULL),(1473,'Bari','ITA','Apulia',331848,NULL,NULL),(1474,'Venezia','ITA','Veneto',277305,NULL,NULL),(1475,'Messina','ITA','Sisilia',259156,NULL,NULL),(1476,'Verona','ITA','Veneto',255268,NULL,NULL),(1477,'Trieste','ITA','Friuli-Venezia Giuli',216459,NULL,NULL),(1478,'Padova','ITA','Veneto',211391,NULL,NULL),(1479,'Taranto','ITA','Apulia',208214,NULL,NULL),(1480,'Brescia','ITA','Lombardia',191317,NULL,NULL),(1481,'Reggio di Calabria','ITA','Calabria',179617,NULL,NULL),(1482,'Modena','ITA','Emilia-Romagna',176022,NULL,NULL),(1483,'Prato','ITA','Toscana',172473,NULL,NULL),(1484,'Parma','ITA','Emilia-Romagna',168717,NULL,NULL),(1485,'Cagliari','ITA','Sardinia',165926,NULL,NULL),(1486,'Livorno','ITA','Toscana',161673,NULL,NULL),(1487,'Perugia','ITA','Umbria',156673,NULL,NULL),(1488,'Foggia','ITA','Apulia',154891,NULL,NULL),(1489,'Reggio nell´ Emilia','ITA','Emilia-Romagna',143664,NULL,NULL),(1490,'Salerno','ITA','Campania',142055,NULL,NULL),(1491,'Ravenna','ITA','Emilia-Romagna',138418,NULL,NULL),(1492,'Ferrara','ITA','Emilia-Romagna',132127,NULL,NULL),(1493,'Rimini','ITA','Emilia-Romagna',131062,NULL,NULL),(1494,'Syrakusa','ITA','Sisilia',126282,NULL,NULL),(1495,'Sassari','ITA','Sardinia',120803,NULL,NULL),(1496,'Monza','ITA','Lombardia',119516,NULL,NULL),(1497,'Bergamo','ITA','Lombardia',117837,NULL,NULL),(1498,'Pescara','ITA','Abruzzit',115698,NULL,NULL),(1499,'Latina','ITA','Latium',114099,NULL,NULL),(1500,'Vicenza','ITA','Veneto',109738,NULL,NULL),(1501,'Terni','ITA','Umbria',107770,NULL,NULL),(1502,'Forlì','ITA','Emilia-Romagna',107475,NULL,NULL),(1503,'Trento','ITA','Trentino-Alto Adige',104906,NULL,NULL),(1504,'Novara','ITA','Piemonte',102037,NULL,NULL),(1505,'Piacenza','ITA','Emilia-Romagna',98384,NULL,NULL),(1506,'Ancona','ITA','Marche',98329,NULL,NULL),(1507,'Lecce','ITA','Apulia',98208,NULL,NULL),(1508,'Bolzano','ITA','Trentino-Alto Adige',97232,NULL,NULL),(1509,'Catanzaro','ITA','Calabria',96700,NULL,NULL),(1510,'La Spezia','ITA','Liguria',95504,NULL,NULL),(1511,'Udine','ITA','Friuli-Venezia Giuli',94932,NULL,NULL),(1512,'Torre del Greco','ITA','Campania',94505,NULL,NULL),(1513,'Andria','ITA','Apulia',94443,NULL,NULL),(1514,'Brindisi','ITA','Apulia',93454,NULL,NULL),(1515,'Giugliano in Campania','ITA','Campania',93286,NULL,NULL),(1516,'Pisa','ITA','Toscana',92379,NULL,NULL),(1517,'Barletta','ITA','Apulia',91904,NULL,NULL),(1518,'Arezzo','ITA','Toscana',91729,NULL,NULL),(1519,'Alessandria','ITA','Piemonte',90289,NULL,NULL),(1520,'Cesena','ITA','Emilia-Romagna',89852,NULL,NULL),(1521,'Pesaro','ITA','Marche',88987,NULL,NULL),(1522,'Dili','TMP','Dili',47900,NULL,NULL),(1523,'Wien','AUT','Wien',1608144,NULL,NULL),(1524,'Graz','AUT','Steiermark',240967,NULL,NULL),(1525,'Linz','AUT','North Austria',188022,NULL,NULL),(1526,'Salzburg','AUT','Salzburg',144247,NULL,NULL),(1527,'Innsbruck','AUT','Tiroli',111752,NULL,NULL),(1528,'Klagenfurt','AUT','Kärnten',91141,NULL,NULL),(1529,'Spanish Town','JAM','St. Catherine',110379,NULL,NULL),(1530,'Kingston','JAM','St. Andrew',103962,NULL,NULL),(1531,'Portmore','JAM','St. Andrew',99799,NULL,NULL),(1532,'Tokyo','JPN','Tokyo-to',7980230,NULL,NULL),(1533,'Jokohama [Yokohama]','JPN','Kanagawa',3339594,NULL,NULL),(1534,'Osaka','JPN','Osaka',2595674,NULL,NULL),(1535,'Nagoya','JPN','Aichi',2154376,NULL,NULL),(1536,'Sapporo','JPN','Hokkaido',1790886,NULL,NULL),(1537,'Kioto','JPN','Kyoto',1461974,NULL,NULL),(1538,'Kobe','JPN','Hyogo',1425139,NULL,NULL),(1539,'Fukuoka','JPN','Fukuoka',1308379,NULL,NULL),(1540,'Kawasaki','JPN','Kanagawa',1217359,NULL,NULL),(1541,'Hiroshima','JPN','Hiroshima',1119117,NULL,NULL),(1542,'Kitakyushu','JPN','Fukuoka',1016264,NULL,NULL),(1543,'Sendai','JPN','Miyagi',989975,NULL,NULL),(1544,'Chiba','JPN','Chiba',863930,NULL,NULL),(1545,'Sakai','JPN','Osaka',797735,NULL,NULL),(1546,'Kumamoto','JPN','Kumamoto',656734,NULL,NULL),(1547,'Okayama','JPN','Okayama',624269,NULL,NULL),(1548,'Sagamihara','JPN','Kanagawa',586300,NULL,NULL),(1549,'Hamamatsu','JPN','Shizuoka',568796,NULL,NULL),(1550,'Kagoshima','JPN','Kagoshima',549977,NULL,NULL),(1551,'Funabashi','JPN','Chiba',545299,NULL,NULL),(1552,'Higashiosaka','JPN','Osaka',517785,NULL,NULL),(1553,'Hachioji','JPN','Tokyo-to',513451,NULL,NULL),(1554,'Niigata','JPN','Niigata',497464,NULL,NULL),(1555,'Amagasaki','JPN','Hyogo',481434,NULL,NULL),(1556,'Himeji','JPN','Hyogo',475167,NULL,NULL),(1557,'Shizuoka','JPN','Shizuoka',473854,NULL,NULL),(1558,'Urawa','JPN','Saitama',469675,NULL,NULL),(1559,'Matsuyama','JPN','Ehime',466133,NULL,NULL),(1560,'Matsudo','JPN','Chiba',461126,NULL,NULL),(1561,'Kanazawa','JPN','Ishikawa',455386,NULL,NULL),(1562,'Kawaguchi','JPN','Saitama',452155,NULL,NULL),(1563,'Ichikawa','JPN','Chiba',441893,NULL,NULL),(1564,'Omiya','JPN','Saitama',441649,NULL,NULL),(1565,'Utsunomiya','JPN','Tochigi',440353,NULL,NULL),(1566,'Oita','JPN','Oita',433401,NULL,NULL),(1567,'Nagasaki','JPN','Nagasaki',432759,NULL,NULL),(1568,'Yokosuka','JPN','Kanagawa',430200,NULL,NULL),(1569,'Kurashiki','JPN','Okayama',425103,NULL,NULL),(1570,'Gifu','JPN','Gifu',408007,NULL,NULL),(1571,'Hirakata','JPN','Osaka',403151,NULL,NULL),(1572,'Nishinomiya','JPN','Hyogo',397618,NULL,NULL),(1573,'Toyonaka','JPN','Osaka',396689,NULL,NULL),(1574,'Wakayama','JPN','Wakayama',391233,NULL,NULL),(1575,'Fukuyama','JPN','Hiroshima',376921,NULL,NULL),(1576,'Fujisawa','JPN','Kanagawa',372840,NULL,NULL),(1577,'Asahikawa','JPN','Hokkaido',364813,NULL,NULL),(1578,'Machida','JPN','Tokyo-to',364197,NULL,NULL),(1579,'Nara','JPN','Nara',362812,NULL,NULL),(1580,'Takatsuki','JPN','Osaka',361747,NULL,NULL),(1581,'Iwaki','JPN','Fukushima',361737,NULL,NULL),(1582,'Nagano','JPN','Nagano',361391,NULL,NULL),(1583,'Toyohashi','JPN','Aichi',360066,NULL,NULL),(1584,'Toyota','JPN','Aichi',346090,NULL,NULL),(1585,'Suita','JPN','Osaka',345750,NULL,NULL),(1586,'Takamatsu','JPN','Kagawa',332471,NULL,NULL),(1587,'Koriyama','JPN','Fukushima',330335,NULL,NULL),(1588,'Okazaki','JPN','Aichi',328711,NULL,NULL),(1589,'Kawagoe','JPN','Saitama',327211,NULL,NULL),(1590,'Tokorozawa','JPN','Saitama',325809,NULL,NULL),(1591,'Toyama','JPN','Toyama',325790,NULL,NULL),(1592,'Kochi','JPN','Kochi',324710,NULL,NULL),(1593,'Kashiwa','JPN','Chiba',320296,NULL,NULL),(1594,'Akita','JPN','Akita',314440,NULL,NULL),(1595,'Miyazaki','JPN','Miyazaki',303784,NULL,NULL),(1596,'Koshigaya','JPN','Saitama',301446,NULL,NULL),(1597,'Naha','JPN','Okinawa',299851,NULL,NULL),(1598,'Aomori','JPN','Aomori',295969,NULL,NULL),(1599,'Hakodate','JPN','Hokkaido',294788,NULL,NULL),(1600,'Akashi','JPN','Hyogo',292253,NULL,NULL),(1601,'Yokkaichi','JPN','Mie',288173,NULL,NULL),(1602,'Fukushima','JPN','Fukushima',287525,NULL,NULL),(1603,'Morioka','JPN','Iwate',287353,NULL,NULL),(1604,'Maebashi','JPN','Gumma',284473,NULL,NULL),(1605,'Kasugai','JPN','Aichi',282348,NULL,NULL),(1606,'Otsu','JPN','Shiga',282070,NULL,NULL),(1607,'Ichihara','JPN','Chiba',279280,NULL,NULL),(1608,'Yao','JPN','Osaka',276421,NULL,NULL),(1609,'Ichinomiya','JPN','Aichi',270828,NULL,NULL),(1610,'Tokushima','JPN','Tokushima',269649,NULL,NULL),(1611,'Kakogawa','JPN','Hyogo',266281,NULL,NULL),(1612,'Ibaraki','JPN','Osaka',261020,NULL,NULL),(1613,'Neyagawa','JPN','Osaka',257315,NULL,NULL),(1614,'Shimonoseki','JPN','Yamaguchi',257263,NULL,NULL),(1615,'Yamagata','JPN','Yamagata',255617,NULL,NULL),(1616,'Fukui','JPN','Fukui',254818,NULL,NULL),(1617,'Hiratsuka','JPN','Kanagawa',254207,NULL,NULL),(1618,'Mito','JPN','Ibaragi',246559,NULL,NULL),(1619,'Sasebo','JPN','Nagasaki',244240,NULL,NULL),(1620,'Hachinohe','JPN','Aomori',242979,NULL,NULL),(1621,'Takasaki','JPN','Gumma',239124,NULL,NULL),(1622,'Shimizu','JPN','Shizuoka',239123,NULL,NULL),(1623,'Kurume','JPN','Fukuoka',235611,NULL,NULL),(1624,'Fuji','JPN','Shizuoka',231527,NULL,NULL),(1625,'Soka','JPN','Saitama',222768,NULL,NULL),(1626,'Fuchu','JPN','Tokyo-to',220576,NULL,NULL),(1627,'Chigasaki','JPN','Kanagawa',216015,NULL,NULL),(1628,'Atsugi','JPN','Kanagawa',212407,NULL,NULL),(1629,'Numazu','JPN','Shizuoka',211382,NULL,NULL),(1630,'Ageo','JPN','Saitama',209442,NULL,NULL),(1631,'Yamato','JPN','Kanagawa',208234,NULL,NULL),(1632,'Matsumoto','JPN','Nagano',206801,NULL,NULL),(1633,'Kure','JPN','Hiroshima',206504,NULL,NULL),(1634,'Takarazuka','JPN','Hyogo',205993,NULL,NULL),(1635,'Kasukabe','JPN','Saitama',201838,NULL,NULL),(1636,'Chofu','JPN','Tokyo-to',201585,NULL,NULL),(1637,'Odawara','JPN','Kanagawa',200171,NULL,NULL),(1638,'Kofu','JPN','Yamanashi',199753,NULL,NULL),(1639,'Kushiro','JPN','Hokkaido',197608,NULL,NULL),(1640,'Kishiwada','JPN','Osaka',197276,NULL,NULL),(1641,'Hitachi','JPN','Ibaragi',196622,NULL,NULL),(1642,'Nagaoka','JPN','Niigata',192407,NULL,NULL),(1643,'Itami','JPN','Hyogo',190886,NULL,NULL),(1644,'Uji','JPN','Kyoto',188735,NULL,NULL),(1645,'Suzuka','JPN','Mie',184061,NULL,NULL),(1646,'Hirosaki','JPN','Aomori',177522,NULL,NULL),(1647,'Ube','JPN','Yamaguchi',175206,NULL,NULL),(1648,'Kodaira','JPN','Tokyo-to',174984,NULL,NULL),(1649,'Takaoka','JPN','Toyama',174380,NULL,NULL),(1650,'Obihiro','JPN','Hokkaido',173685,NULL,NULL),(1651,'Tomakomai','JPN','Hokkaido',171958,NULL,NULL),(1652,'Saga','JPN','Saga',170034,NULL,NULL),(1653,'Sakura','JPN','Chiba',168072,NULL,NULL),(1654,'Kamakura','JPN','Kanagawa',167661,NULL,NULL),(1655,'Mitaka','JPN','Tokyo-to',167268,NULL,NULL),(1656,'Izumi','JPN','Osaka',166979,NULL,NULL),(1657,'Hino','JPN','Tokyo-to',166770,NULL,NULL),(1658,'Hadano','JPN','Kanagawa',166512,NULL,NULL),(1659,'Ashikaga','JPN','Tochigi',165243,NULL,NULL),(1660,'Tsu','JPN','Mie',164543,NULL,NULL),(1661,'Sayama','JPN','Saitama',162472,NULL,NULL),(1662,'Yachiyo','JPN','Chiba',161222,NULL,NULL),(1663,'Tsukuba','JPN','Ibaragi',160768,NULL,NULL),(1664,'Tachikawa','JPN','Tokyo-to',159430,NULL,NULL),(1665,'Kumagaya','JPN','Saitama',157171,NULL,NULL),(1666,'Moriguchi','JPN','Osaka',155941,NULL,NULL),(1667,'Otaru','JPN','Hokkaido',155784,NULL,NULL),(1668,'Anjo','JPN','Aichi',153823,NULL,NULL),(1669,'Narashino','JPN','Chiba',152849,NULL,NULL),(1670,'Oyama','JPN','Tochigi',152820,NULL,NULL),(1671,'Ogaki','JPN','Gifu',151758,NULL,NULL),(1672,'Matsue','JPN','Shimane',149821,NULL,NULL),(1673,'Kawanishi','JPN','Hyogo',149794,NULL,NULL),(1674,'Hitachinaka','JPN','Tokyo-to',148006,NULL,NULL),(1675,'Niiza','JPN','Saitama',147744,NULL,NULL),(1676,'Nagareyama','JPN','Chiba',147738,NULL,NULL),(1677,'Tottori','JPN','Tottori',147523,NULL,NULL),(1678,'Tama','JPN','Ibaragi',146712,NULL,NULL),(1679,'Iruma','JPN','Saitama',145922,NULL,NULL),(1680,'Ota','JPN','Gumma',145317,NULL,NULL),(1681,'Omuta','JPN','Fukuoka',142889,NULL,NULL),(1682,'Komaki','JPN','Aichi',139827,NULL,NULL),(1683,'Ome','JPN','Tokyo-to',139216,NULL,NULL),(1684,'Kadoma','JPN','Osaka',138953,NULL,NULL),(1685,'Yamaguchi','JPN','Yamaguchi',138210,NULL,NULL),(1686,'Higashimurayama','JPN','Tokyo-to',136970,NULL,NULL),(1687,'Yonago','JPN','Tottori',136461,NULL,NULL),(1688,'Matsubara','JPN','Osaka',135010,NULL,NULL),(1689,'Musashino','JPN','Tokyo-to',134426,NULL,NULL),(1690,'Tsuchiura','JPN','Ibaragi',134072,NULL,NULL),(1691,'Joetsu','JPN','Niigata',133505,NULL,NULL),(1692,'Miyakonojo','JPN','Miyazaki',133183,NULL,NULL),(1693,'Misato','JPN','Saitama',132957,NULL,NULL),(1694,'Kakamigahara','JPN','Gifu',131831,NULL,NULL),(1695,'Daito','JPN','Osaka',130594,NULL,NULL),(1696,'Seto','JPN','Aichi',130470,NULL,NULL),(1697,'Kariya','JPN','Aichi',127969,NULL,NULL),(1698,'Urayasu','JPN','Chiba',127550,NULL,NULL),(1699,'Beppu','JPN','Oita',127486,NULL,NULL),(1700,'Niihama','JPN','Ehime',127207,NULL,NULL),(1701,'Minoo','JPN','Osaka',127026,NULL,NULL),(1702,'Fujieda','JPN','Shizuoka',126897,NULL,NULL),(1703,'Abiko','JPN','Chiba',126670,NULL,NULL),(1704,'Nobeoka','JPN','Miyazaki',125547,NULL,NULL),(1705,'Tondabayashi','JPN','Osaka',125094,NULL,NULL),(1706,'Ueda','JPN','Nagano',124217,NULL,NULL),(1707,'Kashihara','JPN','Nara',124013,NULL,NULL),(1708,'Matsusaka','JPN','Mie',123582,NULL,NULL),(1709,'Isesaki','JPN','Gumma',123285,NULL,NULL),(1710,'Zama','JPN','Kanagawa',122046,NULL,NULL),(1711,'Kisarazu','JPN','Chiba',121967,NULL,NULL),(1712,'Noda','JPN','Chiba',121030,NULL,NULL),(1713,'Ishinomaki','JPN','Miyagi',120963,NULL,NULL),(1714,'Fujinomiya','JPN','Shizuoka',119714,NULL,NULL),(1715,'Kawachinagano','JPN','Osaka',119666,NULL,NULL),(1716,'Imabari','JPN','Ehime',119357,NULL,NULL),(1717,'Aizuwakamatsu','JPN','Fukushima',119287,NULL,NULL),(1718,'Higashihiroshima','JPN','Hiroshima',119166,NULL,NULL),(1719,'Habikino','JPN','Osaka',118968,NULL,NULL),(1720,'Ebetsu','JPN','Hokkaido',118805,NULL,NULL),(1721,'Hofu','JPN','Yamaguchi',118751,NULL,NULL),(1722,'Kiryu','JPN','Gumma',118326,NULL,NULL),(1723,'Okinawa','JPN','Okinawa',117748,NULL,NULL),(1724,'Yaizu','JPN','Shizuoka',117258,NULL,NULL),(1725,'Toyokawa','JPN','Aichi',115781,NULL,NULL),(1726,'Ebina','JPN','Kanagawa',115571,NULL,NULL),(1727,'Asaka','JPN','Saitama',114815,NULL,NULL),(1728,'Higashikurume','JPN','Tokyo-to',111666,NULL,NULL),(1729,'Ikoma','JPN','Nara',111645,NULL,NULL),(1730,'Kitami','JPN','Hokkaido',111295,NULL,NULL),(1731,'Koganei','JPN','Tokyo-to',110969,NULL,NULL),(1732,'Iwatsuki','JPN','Saitama',110034,NULL,NULL),(1733,'Mishima','JPN','Shizuoka',109699,NULL,NULL),(1734,'Handa','JPN','Aichi',108600,NULL,NULL),(1735,'Muroran','JPN','Hokkaido',108275,NULL,NULL),(1736,'Komatsu','JPN','Ishikawa',107937,NULL,NULL),(1737,'Yatsushiro','JPN','Kumamoto',107661,NULL,NULL),(1738,'Iida','JPN','Nagano',107583,NULL,NULL),(1739,'Tokuyama','JPN','Yamaguchi',107078,NULL,NULL),(1740,'Kokubunji','JPN','Tokyo-to',106996,NULL,NULL),(1741,'Akishima','JPN','Tokyo-to',106914,NULL,NULL),(1742,'Iwakuni','JPN','Yamaguchi',106647,NULL,NULL),(1743,'Kusatsu','JPN','Shiga',106232,NULL,NULL),(1744,'Kuwana','JPN','Mie',106121,NULL,NULL),(1745,'Sanda','JPN','Hyogo',105643,NULL,NULL),(1746,'Hikone','JPN','Shiga',105508,NULL,NULL),(1747,'Toda','JPN','Saitama',103969,NULL,NULL),(1748,'Tajimi','JPN','Gifu',103171,NULL,NULL),(1749,'Ikeda','JPN','Osaka',102710,NULL,NULL),(1750,'Fukaya','JPN','Saitama',102156,NULL,NULL),(1751,'Ise','JPN','Mie',101732,NULL,NULL),(1752,'Sakata','JPN','Yamagata',101651,NULL,NULL),(1753,'Kasuga','JPN','Fukuoka',101344,NULL,NULL),(1754,'Kamagaya','JPN','Chiba',100821,NULL,NULL),(1755,'Tsuruoka','JPN','Yamagata',100713,NULL,NULL),(1756,'Hoya','JPN','Tokyo-to',100313,NULL,NULL),(1757,'Nishio','JPN','Chiba',100032,NULL,NULL),(1758,'Tokai','JPN','Aichi',99738,NULL,NULL),(1759,'Inazawa','JPN','Aichi',98746,NULL,NULL),(1760,'Sakado','JPN','Saitama',98221,NULL,NULL),(1761,'Isehara','JPN','Kanagawa',98123,NULL,NULL),(1762,'Takasago','JPN','Hyogo',97632,NULL,NULL),(1763,'Fujimi','JPN','Saitama',96972,NULL,NULL),(1764,'Urasoe','JPN','Okinawa',96002,NULL,NULL),(1765,'Yonezawa','JPN','Yamagata',95592,NULL,NULL),(1766,'Konan','JPN','Aichi',95521,NULL,NULL),(1767,'Yamatokoriyama','JPN','Nara',95165,NULL,NULL),(1768,'Maizuru','JPN','Kyoto',94784,NULL,NULL),(1769,'Onomichi','JPN','Hiroshima',93756,NULL,NULL),(1770,'Higashimatsuyama','JPN','Saitama',93342,NULL,NULL),(1771,'Kimitsu','JPN','Chiba',93216,NULL,NULL),(1772,'Isahaya','JPN','Nagasaki',93058,NULL,NULL),(1773,'Kanuma','JPN','Tochigi',93053,NULL,NULL),(1774,'Izumisano','JPN','Osaka',92583,NULL,NULL),(1775,'Kameoka','JPN','Kyoto',92398,NULL,NULL),(1776,'Mobara','JPN','Chiba',91664,NULL,NULL),(1777,'Narita','JPN','Chiba',91470,NULL,NULL),(1778,'Kashiwazaki','JPN','Niigata',91229,NULL,NULL),(1779,'Tsuyama','JPN','Okayama',91170,NULL,NULL),(1780,'Sanaa','YEM','Sanaa',503600,NULL,NULL),(1781,'Aden','YEM','Aden',398300,NULL,NULL),(1782,'Taizz','YEM','Taizz',317600,NULL,NULL),(1783,'Hodeida','YEM','Hodeida',298500,NULL,NULL),(1784,'al-Mukalla','YEM','Hadramawt',122400,NULL,NULL),(1785,'Ibb','YEM','Ibb',103300,NULL,NULL),(1786,'Amman','JOR','Amman',1000000,NULL,NULL),(1787,'al-Zarqa','JOR','al-Zarqa',389815,NULL,NULL),(1788,'Irbid','JOR','Irbid',231511,NULL,NULL),(1789,'al-Rusayfa','JOR','al-Zarqa',137247,NULL,NULL),(1790,'Wadi al-Sir','JOR','Amman',89104,NULL,NULL),(1791,'Flying Fish Cove','CXR','–',700,NULL,NULL),(1792,'Beograd','YUG','Central Serbia',1204000,NULL,NULL),(1793,'Novi Sad','YUG','Vojvodina',179626,NULL,NULL),(1794,'Niš','YUG','Central Serbia',175391,NULL,NULL),(1795,'Priština','YUG','Kosovo and Metohija',155496,NULL,NULL),(1796,'Kragujevac','YUG','Central Serbia',147305,NULL,NULL),(1797,'Podgorica','YUG','Montenegro',135000,NULL,NULL),(1798,'Subotica','YUG','Vojvodina',100386,NULL,NULL),(1799,'Prizren','YUG','Kosovo and Metohija',92303,NULL,NULL),(1800,'Phnom Penh','KHM','Phnom Penh',570155,NULL,NULL),(1801,'Battambang','KHM','Battambang',129800,NULL,NULL),(1802,'Siem Reap','KHM','Siem Reap',105100,NULL,NULL),(1803,'Douala','CMR','Littoral',1448300,NULL,NULL),(1804,'Yaoundé','CMR','Centre',1372800,NULL,NULL),(1805,'Garoua','CMR','Nord',177000,NULL,NULL),(1806,'Maroua','CMR','Extrême-Nord',143000,NULL,NULL),(1807,'Bamenda','CMR','Nord-Ouest',138000,NULL,NULL),(1808,'Bafoussam','CMR','Ouest',131000,NULL,NULL),(1809,'Nkongsamba','CMR','Littoral',112454,NULL,NULL),(1810,'Montréal','CAN','Québec',1016376,NULL,NULL),(1811,'Calgary','CAN','Alberta',768082,NULL,NULL),(1812,'Toronto','CAN','Ontario',688275,NULL,NULL),(1813,'North York','CAN','Ontario',622632,NULL,NULL),(1814,'Winnipeg','CAN','Manitoba',618477,NULL,NULL),(1815,'Edmonton','CAN','Alberta',616306,NULL,NULL),(1816,'Mississauga','CAN','Ontario',608072,NULL,NULL),(1817,'Scarborough','CAN','Ontario',594501,NULL,NULL),(1818,'Vancouver','CAN','British Colombia',514008,NULL,NULL),(1819,'Etobicoke','CAN','Ontario',348845,NULL,NULL),(1820,'London','CAN','Ontario',339917,NULL,NULL),(1821,'Hamilton','CAN','Ontario',335614,NULL,NULL),(1822,'Ottawa','CAN','Ontario',335277,NULL,NULL),(1823,'Laval','CAN','Québec',330393,NULL,NULL),(1824,'Surrey','CAN','British Colombia',304477,NULL,NULL),(1825,'Brampton','CAN','Ontario',296711,NULL,NULL),(1826,'Windsor','CAN','Ontario',207588,NULL,NULL),(1827,'Saskatoon','CAN','Saskatchewan',193647,NULL,NULL),(1828,'Kitchener','CAN','Ontario',189959,NULL,NULL),(1829,'Markham','CAN','Ontario',189098,NULL,NULL),(1830,'Regina','CAN','Saskatchewan',180400,NULL,NULL),(1831,'Burnaby','CAN','British Colombia',179209,NULL,NULL),(1832,'Québec','CAN','Québec',167264,NULL,NULL),(1833,'York','CAN','Ontario',154980,NULL,NULL),(1834,'Richmond','CAN','British Colombia',148867,NULL,NULL),(1835,'Vaughan','CAN','Ontario',147889,NULL,NULL),(1836,'Burlington','CAN','Ontario',145150,NULL,NULL),(1837,'Oshawa','CAN','Ontario',140173,NULL,NULL),(1838,'Oakville','CAN','Ontario',139192,NULL,NULL),(1839,'Saint Catharines','CAN','Ontario',136216,NULL,NULL),(1840,'Longueuil','CAN','Québec',127977,NULL,NULL),(1841,'Richmond Hill','CAN','Ontario',116428,NULL,NULL),(1842,'Thunder Bay','CAN','Ontario',115913,NULL,NULL),(1843,'Nepean','CAN','Ontario',115100,NULL,NULL),(1844,'Cape Breton','CAN','Nova Scotia',114733,NULL,NULL),(1845,'East York','CAN','Ontario',114034,NULL,NULL),(1846,'Halifax','CAN','Nova Scotia',113910,NULL,NULL),(1847,'Cambridge','CAN','Ontario',109186,NULL,NULL),(1848,'Gloucester','CAN','Ontario',107314,NULL,NULL),(1849,'Abbotsford','CAN','British Colombia',105403,NULL,NULL),(1850,'Guelph','CAN','Ontario',103593,NULL,NULL),(1851,'Saint John´s','CAN','Newfoundland',101936,NULL,NULL),(1852,'Coquitlam','CAN','British Colombia',101820,NULL,NULL),(1853,'Saanich','CAN','British Colombia',101388,NULL,NULL),(1854,'Gatineau','CAN','Québec',100702,NULL,NULL),(1855,'Delta','CAN','British Colombia',95411,NULL,NULL),(1856,'Sudbury','CAN','Ontario',92686,NULL,NULL),(1857,'Kelowna','CAN','British Colombia',89442,NULL,NULL),(1858,'Barrie','CAN','Ontario',89269,NULL,NULL),(1859,'Praia','CPV','São Tiago',94800,NULL,NULL),(1860,'Almaty','KAZ','Almaty Qalasy',1129400,NULL,NULL),(1861,'Qaraghandy','KAZ','Qaraghandy',436900,NULL,NULL),(1862,'Shymkent','KAZ','South Kazakstan',360100,NULL,NULL),(1863,'Taraz','KAZ','Taraz',330100,NULL,NULL),(1864,'Astana','KAZ','Astana',311200,NULL,NULL),(1865,'Öskemen','KAZ','East Kazakstan',311000,NULL,NULL),(1866,'Pavlodar','KAZ','Pavlodar',300500,NULL,NULL),(1867,'Semey','KAZ','East Kazakstan',269600,NULL,NULL),(1868,'Aqtöbe','KAZ','Aqtöbe',253100,NULL,NULL),(1869,'Qostanay','KAZ','Qostanay',221400,NULL,NULL),(1870,'Petropavl','KAZ','North Kazakstan',203500,NULL,NULL),(1871,'Oral','KAZ','West Kazakstan',195500,NULL,NULL),(1872,'Temirtau','KAZ','Qaraghandy',170500,NULL,NULL),(1873,'Qyzylorda','KAZ','Qyzylorda',157400,NULL,NULL),(1874,'Aqtau','KAZ','Mangghystau',143400,NULL,NULL),(1875,'Atyrau','KAZ','Atyrau',142500,NULL,NULL),(1876,'Ekibastuz','KAZ','Pavlodar',127200,NULL,NULL),(1877,'Kökshetau','KAZ','North Kazakstan',123400,NULL,NULL),(1878,'Rudnyy','KAZ','Qostanay',109500,NULL,NULL),(1879,'Taldyqorghan','KAZ','Almaty',98000,NULL,NULL),(1880,'Zhezqazghan','KAZ','Qaraghandy',90000,NULL,NULL),(1881,'Nairobi','KEN','Nairobi',2290000,NULL,NULL),(1882,'Mombasa','KEN','Coast',461753,NULL,NULL),(1883,'Kisumu','KEN','Nyanza',192733,NULL,NULL),(1884,'Nakuru','KEN','Rift Valley',163927,NULL,NULL),(1885,'Machakos','KEN','Eastern',116293,NULL,NULL),(1886,'Eldoret','KEN','Rift Valley',111882,NULL,NULL),(1887,'Meru','KEN','Eastern',94947,NULL,NULL),(1888,'Nyeri','KEN','Central',91258,NULL,NULL),(1889,'Bangui','CAF','Bangui',524000,NULL,NULL),(1890,'Shanghai','CHN','Shanghai',9696300,NULL,NULL),(1891,'Peking','CHN','Peking',7472000,NULL,NULL),(1892,'Chongqing','CHN','Chongqing',6351600,NULL,NULL),(1893,'Tianjin','CHN','Tianjin',5286800,NULL,NULL),(1894,'Wuhan','CHN','Hubei',4344600,NULL,NULL),(1895,'Harbin','CHN','Heilongjiang',4289800,NULL,NULL),(1896,'Shenyang','CHN','Liaoning',4265200,NULL,NULL),(1897,'Kanton [Guangzhou]','CHN','Guangdong',4256300,NULL,NULL),(1898,'Chengdu','CHN','Sichuan',3361500,NULL,NULL),(1899,'Nanking [Nanjing]','CHN','Jiangsu',2870300,NULL,NULL),(1900,'Changchun','CHN','Jilin',2812000,NULL,NULL),(1901,'Xi´an','CHN','Shaanxi',2761400,NULL,NULL),(1902,'Dalian','CHN','Liaoning',2697000,NULL,NULL),(1903,'Qingdao','CHN','Shandong',2596000,NULL,NULL),(1904,'Jinan','CHN','Shandong',2278100,NULL,NULL),(1905,'Hangzhou','CHN','Zhejiang',2190500,NULL,NULL),(1906,'Zhengzhou','CHN','Henan',2107200,NULL,NULL),(1907,'Shijiazhuang','CHN','Hebei',2041500,NULL,NULL),(1908,'Taiyuan','CHN','Shanxi',1968400,NULL,NULL),(1909,'Kunming','CHN','Yunnan',1829500,NULL,NULL),(1910,'Changsha','CHN','Hunan',1809800,NULL,NULL),(1911,'Nanchang','CHN','Jiangxi',1691600,NULL,NULL),(1912,'Fuzhou','CHN','Fujian',1593800,NULL,NULL),(1913,'Lanzhou','CHN','Gansu',1565800,NULL,NULL),(1914,'Guiyang','CHN','Guizhou',1465200,NULL,NULL),(1915,'Ningbo','CHN','Zhejiang',1371200,NULL,NULL),(1916,'Hefei','CHN','Anhui',1369100,NULL,NULL),(1917,'Urumtši [Ürümqi]','CHN','Xinxiang',1310100,NULL,NULL),(1918,'Anshan','CHN','Liaoning',1200000,NULL,NULL),(1919,'Fushun','CHN','Liaoning',1200000,NULL,NULL),(1920,'Nanning','CHN','Guangxi',1161800,NULL,NULL),(1921,'Zibo','CHN','Shandong',1140000,NULL,NULL),(1922,'Qiqihar','CHN','Heilongjiang',1070000,NULL,NULL),(1923,'Jilin','CHN','Jilin',1040000,NULL,NULL),(1924,'Tangshan','CHN','Hebei',1040000,NULL,NULL),(1925,'Baotou','CHN','Inner Mongolia',980000,NULL,NULL),(1926,'Shenzhen','CHN','Guangdong',950500,NULL,NULL),(1927,'Hohhot','CHN','Inner Mongolia',916700,NULL,NULL),(1928,'Handan','CHN','Hebei',840000,NULL,NULL),(1929,'Wuxi','CHN','Jiangsu',830000,NULL,NULL),(1930,'Xuzhou','CHN','Jiangsu',810000,NULL,NULL),(1931,'Datong','CHN','Shanxi',800000,NULL,NULL),(1932,'Yichun','CHN','Heilongjiang',800000,NULL,NULL),(1933,'Benxi','CHN','Liaoning',770000,NULL,NULL),(1934,'Luoyang','CHN','Henan',760000,NULL,NULL),(1935,'Suzhou','CHN','Jiangsu',710000,NULL,NULL),(1936,'Xining','CHN','Qinghai',700200,NULL,NULL),(1937,'Huainan','CHN','Anhui',700000,NULL,NULL),(1938,'Jixi','CHN','Heilongjiang',683885,NULL,NULL),(1939,'Daqing','CHN','Heilongjiang',660000,NULL,NULL),(1940,'Fuxin','CHN','Liaoning',640000,NULL,NULL),(1941,'Amoy [Xiamen]','CHN','Fujian',627500,NULL,NULL),(1942,'Liuzhou','CHN','Guangxi',610000,NULL,NULL),(1943,'Shantou','CHN','Guangdong',580000,NULL,NULL),(1944,'Jinzhou','CHN','Liaoning',570000,NULL,NULL),(1945,'Mudanjiang','CHN','Heilongjiang',570000,NULL,NULL),(1946,'Yinchuan','CHN','Ningxia',544500,NULL,NULL),(1947,'Changzhou','CHN','Jiangsu',530000,NULL,NULL),(1948,'Zhangjiakou','CHN','Hebei',530000,NULL,NULL),(1949,'Dandong','CHN','Liaoning',520000,NULL,NULL),(1950,'Hegang','CHN','Heilongjiang',520000,NULL,NULL),(1951,'Kaifeng','CHN','Henan',510000,NULL,NULL),(1952,'Jiamusi','CHN','Heilongjiang',493409,NULL,NULL),(1953,'Liaoyang','CHN','Liaoning',492559,NULL,NULL),(1954,'Hengyang','CHN','Hunan',487148,NULL,NULL),(1955,'Baoding','CHN','Hebei',483155,NULL,NULL),(1956,'Hunjiang','CHN','Jilin',482043,NULL,NULL),(1957,'Xinxiang','CHN','Henan',473762,NULL,NULL),(1958,'Huangshi','CHN','Hubei',457601,NULL,NULL),(1959,'Haikou','CHN','Hainan',454300,NULL,NULL),(1960,'Yantai','CHN','Shandong',452127,NULL,NULL),(1961,'Bengbu','CHN','Anhui',449245,NULL,NULL),(1962,'Xiangtan','CHN','Hunan',441968,NULL,NULL),(1963,'Weifang','CHN','Shandong',428522,NULL,NULL),(1964,'Wuhu','CHN','Anhui',425740,NULL,NULL),(1965,'Pingxiang','CHN','Jiangxi',425579,NULL,NULL),(1966,'Yingkou','CHN','Liaoning',421589,NULL,NULL),(1967,'Anyang','CHN','Henan',420332,NULL,NULL),(1968,'Panzhihua','CHN','Sichuan',415466,NULL,NULL),(1969,'Pingdingshan','CHN','Henan',410775,NULL,NULL),(1970,'Xiangfan','CHN','Hubei',410407,NULL,NULL),(1971,'Zhuzhou','CHN','Hunan',409924,NULL,NULL),(1972,'Jiaozuo','CHN','Henan',409100,NULL,NULL),(1973,'Wenzhou','CHN','Zhejiang',401871,NULL,NULL),(1974,'Zhangjiang','CHN','Guangdong',400997,NULL,NULL),(1975,'Zigong','CHN','Sichuan',393184,NULL,NULL),(1976,'Shuangyashan','CHN','Heilongjiang',386081,NULL,NULL),(1977,'Zaozhuang','CHN','Shandong',380846,NULL,NULL),(1978,'Yakeshi','CHN','Inner Mongolia',377869,NULL,NULL),(1979,'Yichang','CHN','Hubei',371601,NULL,NULL),(1980,'Zhenjiang','CHN','Jiangsu',368316,NULL,NULL),(1981,'Huaibei','CHN','Anhui',366549,NULL,NULL),(1982,'Qinhuangdao','CHN','Hebei',364972,NULL,NULL),(1983,'Guilin','CHN','Guangxi',364130,NULL,NULL),(1984,'Liupanshui','CHN','Guizhou',363954,NULL,NULL),(1985,'Panjin','CHN','Liaoning',362773,NULL,NULL),(1986,'Yangquan','CHN','Shanxi',362268,NULL,NULL),(1987,'Jinxi','CHN','Liaoning',357052,NULL,NULL),(1988,'Liaoyuan','CHN','Jilin',354141,NULL,NULL),(1989,'Lianyungang','CHN','Jiangsu',354139,NULL,NULL),(1990,'Xianyang','CHN','Shaanxi',352125,NULL,NULL),(1991,'Tai´an','CHN','Shandong',350696,NULL,NULL),(1992,'Chifeng','CHN','Inner Mongolia',350077,NULL,NULL),(1993,'Shaoguan','CHN','Guangdong',350043,NULL,NULL),(1994,'Nantong','CHN','Jiangsu',343341,NULL,NULL),(1995,'Leshan','CHN','Sichuan',341128,NULL,NULL),(1996,'Baoji','CHN','Shaanxi',337765,NULL,NULL),(1997,'Linyi','CHN','Shandong',324720,NULL,NULL),(1998,'Tonghua','CHN','Jilin',324600,NULL,NULL),(1999,'Siping','CHN','Jilin',317223,NULL,NULL),(2000,'Changzhi','CHN','Shanxi',317144,NULL,NULL),(2001,'Tengzhou','CHN','Shandong',315083,NULL,NULL),(2002,'Chaozhou','CHN','Guangdong',313469,NULL,NULL),(2003,'Yangzhou','CHN','Jiangsu',312892,NULL,NULL),(2004,'Dongwan','CHN','Guangdong',308669,NULL,NULL),(2005,'Ma´anshan','CHN','Anhui',305421,NULL,NULL),(2006,'Foshan','CHN','Guangdong',303160,NULL,NULL),(2007,'Yueyang','CHN','Hunan',302800,NULL,NULL),(2008,'Xingtai','CHN','Hebei',302789,NULL,NULL),(2009,'Changde','CHN','Hunan',301276,NULL,NULL),(2010,'Shihezi','CHN','Xinxiang',299676,NULL,NULL),(2011,'Yancheng','CHN','Jiangsu',296831,NULL,NULL),(2012,'Jiujiang','CHN','Jiangxi',291187,NULL,NULL),(2013,'Dongying','CHN','Shandong',281728,NULL,NULL),(2014,'Shashi','CHN','Hubei',281352,NULL,NULL),(2015,'Xintai','CHN','Shandong',281248,NULL,NULL),(2016,'Jingdezhen','CHN','Jiangxi',281183,NULL,NULL),(2017,'Tongchuan','CHN','Shaanxi',280657,NULL,NULL),(2018,'Zhongshan','CHN','Guangdong',278829,NULL,NULL),(2019,'Shiyan','CHN','Hubei',273786,NULL,NULL),(2020,'Tieli','CHN','Heilongjiang',265683,NULL,NULL),(2021,'Jining','CHN','Shandong',265248,NULL,NULL),(2022,'Wuhai','CHN','Inner Mongolia',264081,NULL,NULL),(2023,'Mianyang','CHN','Sichuan',262947,NULL,NULL),(2024,'Luzhou','CHN','Sichuan',262892,NULL,NULL),(2025,'Zunyi','CHN','Guizhou',261862,NULL,NULL),(2026,'Shizuishan','CHN','Ningxia',257862,NULL,NULL),(2027,'Neijiang','CHN','Sichuan',256012,NULL,NULL),(2028,'Tongliao','CHN','Inner Mongolia',255129,NULL,NULL),(2029,'Tieling','CHN','Liaoning',254842,NULL,NULL),(2030,'Wafangdian','CHN','Liaoning',251733,NULL,NULL),(2031,'Anqing','CHN','Anhui',250718,NULL,NULL),(2032,'Shaoyang','CHN','Hunan',247227,NULL,NULL),(2033,'Laiwu','CHN','Shandong',246833,NULL,NULL),(2034,'Chengde','CHN','Hebei',246799,NULL,NULL),(2035,'Tianshui','CHN','Gansu',244974,NULL,NULL),(2036,'Nanyang','CHN','Henan',243303,NULL,NULL),(2037,'Cangzhou','CHN','Hebei',242708,NULL,NULL),(2038,'Yibin','CHN','Sichuan',241019,NULL,NULL),(2039,'Huaiyin','CHN','Jiangsu',239675,NULL,NULL),(2040,'Dunhua','CHN','Jilin',235100,NULL,NULL),(2041,'Yanji','CHN','Jilin',230892,NULL,NULL),(2042,'Jiangmen','CHN','Guangdong',230587,NULL,NULL),(2043,'Tongling','CHN','Anhui',228017,NULL,NULL),(2044,'Suihua','CHN','Heilongjiang',227881,NULL,NULL),(2045,'Gongziling','CHN','Jilin',226569,NULL,NULL),(2046,'Xiantao','CHN','Hubei',222884,NULL,NULL),(2047,'Chaoyang','CHN','Liaoning',222394,NULL,NULL),(2048,'Ganzhou','CHN','Jiangxi',220129,NULL,NULL),(2049,'Huzhou','CHN','Zhejiang',218071,NULL,NULL),(2050,'Baicheng','CHN','Jilin',217987,NULL,NULL),(2051,'Shangzi','CHN','Heilongjiang',215373,NULL,NULL),(2052,'Yangjiang','CHN','Guangdong',215196,NULL,NULL),(2053,'Qitaihe','CHN','Heilongjiang',214957,NULL,NULL),(2054,'Gejiu','CHN','Yunnan',214294,NULL,NULL),(2055,'Jiangyin','CHN','Jiangsu',213659,NULL,NULL),(2056,'Hebi','CHN','Henan',212976,NULL,NULL),(2057,'Jiaxing','CHN','Zhejiang',211526,NULL,NULL),(2058,'Wuzhou','CHN','Guangxi',210452,NULL,NULL),(2059,'Meihekou','CHN','Jilin',209038,NULL,NULL),(2060,'Xuchang','CHN','Henan',208815,NULL,NULL),(2061,'Liaocheng','CHN','Shandong',207844,NULL,NULL),(2062,'Haicheng','CHN','Liaoning',205560,NULL,NULL),(2063,'Qianjiang','CHN','Hubei',205504,NULL,NULL),(2064,'Baiyin','CHN','Gansu',204970,NULL,NULL),(2065,'Bei´an','CHN','Heilongjiang',204899,NULL,NULL),(2066,'Yixing','CHN','Jiangsu',200824,NULL,NULL),(2067,'Laizhou','CHN','Shandong',198664,NULL,NULL),(2068,'Qaramay','CHN','Xinxiang',197602,NULL,NULL),(2069,'Acheng','CHN','Heilongjiang',197595,NULL,NULL),(2070,'Dezhou','CHN','Shandong',195485,NULL,NULL),(2071,'Nanping','CHN','Fujian',195064,NULL,NULL),(2072,'Zhaoqing','CHN','Guangdong',194784,NULL,NULL),(2073,'Beipiao','CHN','Liaoning',194301,NULL,NULL),(2074,'Fengcheng','CHN','Jiangxi',193784,NULL,NULL),(2075,'Fuyu','CHN','Jilin',192981,NULL,NULL),(2076,'Xinyang','CHN','Henan',192509,NULL,NULL),(2077,'Dongtai','CHN','Jiangsu',192247,NULL,NULL),(2078,'Yuci','CHN','Shanxi',191356,NULL,NULL),(2079,'Honghu','CHN','Hubei',190772,NULL,NULL),(2080,'Ezhou','CHN','Hubei',190123,NULL,NULL),(2081,'Heze','CHN','Shandong',189293,NULL,NULL),(2082,'Daxian','CHN','Sichuan',188101,NULL,NULL),(2083,'Linfen','CHN','Shanxi',187309,NULL,NULL),(2084,'Tianmen','CHN','Hubei',186332,NULL,NULL),(2085,'Yiyang','CHN','Hunan',185818,NULL,NULL),(2086,'Quanzhou','CHN','Fujian',185154,NULL,NULL),(2087,'Rizhao','CHN','Shandong',185048,NULL,NULL),(2088,'Deyang','CHN','Sichuan',182488,NULL,NULL),(2089,'Guangyuan','CHN','Sichuan',182241,NULL,NULL),(2090,'Changshu','CHN','Jiangsu',181805,NULL,NULL),(2091,'Zhangzhou','CHN','Fujian',181424,NULL,NULL),(2092,'Hailar','CHN','Inner Mongolia',180650,NULL,NULL),(2093,'Nanchong','CHN','Sichuan',180273,NULL,NULL),(2094,'Jiutai','CHN','Jilin',180130,NULL,NULL),(2095,'Zhaodong','CHN','Heilongjiang',179976,NULL,NULL),(2096,'Shaoxing','CHN','Zhejiang',179818,NULL,NULL),(2097,'Fuyang','CHN','Anhui',179572,NULL,NULL),(2098,'Maoming','CHN','Guangdong',178683,NULL,NULL),(2099,'Qujing','CHN','Yunnan',178669,NULL,NULL),(2100,'Ghulja','CHN','Xinxiang',177193,NULL,NULL),(2101,'Jiaohe','CHN','Jilin',176367,NULL,NULL),(2102,'Puyang','CHN','Henan',175988,NULL,NULL),(2103,'Huadian','CHN','Jilin',175873,NULL,NULL),(2104,'Jiangyou','CHN','Sichuan',175753,NULL,NULL),(2105,'Qashqar','CHN','Xinxiang',174570,NULL,NULL),(2106,'Anshun','CHN','Guizhou',174142,NULL,NULL),(2107,'Fuling','CHN','Sichuan',173878,NULL,NULL),(2108,'Xinyu','CHN','Jiangxi',173524,NULL,NULL),(2109,'Hanzhong','CHN','Shaanxi',169930,NULL,NULL),(2110,'Danyang','CHN','Jiangsu',169603,NULL,NULL),(2111,'Chenzhou','CHN','Hunan',169400,NULL,NULL),(2112,'Xiaogan','CHN','Hubei',166280,NULL,NULL),(2113,'Shangqiu','CHN','Henan',164880,NULL,NULL),(2114,'Zhuhai','CHN','Guangdong',164747,NULL,NULL),(2115,'Qingyuan','CHN','Guangdong',164641,NULL,NULL),(2116,'Aqsu','CHN','Xinxiang',164092,NULL,NULL),(2117,'Jining','CHN','Inner Mongolia',163552,NULL,NULL),(2118,'Xiaoshan','CHN','Zhejiang',162930,NULL,NULL),(2119,'Zaoyang','CHN','Hubei',162198,NULL,NULL),(2120,'Xinghua','CHN','Jiangsu',161910,NULL,NULL),(2121,'Hami','CHN','Xinxiang',161315,NULL,NULL),(2122,'Huizhou','CHN','Guangdong',161023,NULL,NULL),(2123,'Jinmen','CHN','Hubei',160794,NULL,NULL),(2124,'Sanming','CHN','Fujian',160691,NULL,NULL),(2125,'Ulanhot','CHN','Inner Mongolia',159538,NULL,NULL),(2126,'Korla','CHN','Xinxiang',159344,NULL,NULL),(2127,'Wanxian','CHN','Sichuan',156823,NULL,NULL),(2128,'Rui´an','CHN','Zhejiang',156468,NULL,NULL),(2129,'Zhoushan','CHN','Zhejiang',156317,NULL,NULL),(2130,'Liangcheng','CHN','Shandong',156307,NULL,NULL),(2131,'Jiaozhou','CHN','Shandong',153364,NULL,NULL),(2132,'Taizhou','CHN','Jiangsu',152442,NULL,NULL),(2133,'Suzhou','CHN','Anhui',151862,NULL,NULL),(2134,'Yichun','CHN','Jiangxi',151585,NULL,NULL),(2135,'Taonan','CHN','Jilin',150168,NULL,NULL),(2136,'Pingdu','CHN','Shandong',150123,NULL,NULL),(2137,'Ji´an','CHN','Jiangxi',148583,NULL,NULL),(2138,'Longkou','CHN','Shandong',148362,NULL,NULL),(2139,'Langfang','CHN','Hebei',148105,NULL,NULL),(2140,'Zhoukou','CHN','Henan',146288,NULL,NULL),(2141,'Suining','CHN','Sichuan',146086,NULL,NULL),(2142,'Yulin','CHN','Guangxi',144467,NULL,NULL),(2143,'Jinhua','CHN','Zhejiang',144280,NULL,NULL),(2144,'Liu´an','CHN','Anhui',144248,NULL,NULL),(2145,'Shuangcheng','CHN','Heilongjiang',142659,NULL,NULL),(2146,'Suizhou','CHN','Hubei',142302,NULL,NULL),(2147,'Ankang','CHN','Shaanxi',142170,NULL,NULL),(2148,'Weinan','CHN','Shaanxi',140169,NULL,NULL),(2149,'Longjing','CHN','Jilin',139417,NULL,NULL),(2150,'Da´an','CHN','Jilin',138963,NULL,NULL),(2151,'Lengshuijiang','CHN','Hunan',137994,NULL,NULL),(2152,'Laiyang','CHN','Shandong',137080,NULL,NULL),(2153,'Xianning','CHN','Hubei',136811,NULL,NULL),(2154,'Dali','CHN','Yunnan',136554,NULL,NULL),(2155,'Anda','CHN','Heilongjiang',136446,NULL,NULL),(2156,'Jincheng','CHN','Shanxi',136396,NULL,NULL),(2157,'Longyan','CHN','Fujian',134481,NULL,NULL),(2158,'Xichang','CHN','Sichuan',134419,NULL,NULL),(2159,'Wendeng','CHN','Shandong',133910,NULL,NULL),(2160,'Hailun','CHN','Heilongjiang',133565,NULL,NULL),(2161,'Binzhou','CHN','Shandong',133555,NULL,NULL),(2162,'Linhe','CHN','Inner Mongolia',133183,NULL,NULL),(2163,'Wuwei','CHN','Gansu',133101,NULL,NULL),(2164,'Duyun','CHN','Guizhou',132971,NULL,NULL),(2165,'Mishan','CHN','Heilongjiang',132744,NULL,NULL),(2166,'Shangrao','CHN','Jiangxi',132455,NULL,NULL),(2167,'Changji','CHN','Xinxiang',132260,NULL,NULL),(2168,'Meixian','CHN','Guangdong',132156,NULL,NULL),(2169,'Yushu','CHN','Jilin',131861,NULL,NULL),(2170,'Tiefa','CHN','Liaoning',131807,NULL,NULL),(2171,'Huai´an','CHN','Jiangsu',131149,NULL,NULL),(2172,'Leiyang','CHN','Hunan',130115,NULL,NULL),(2173,'Zalantun','CHN','Inner Mongolia',130031,NULL,NULL),(2174,'Weihai','CHN','Shandong',128888,NULL,NULL),(2175,'Loudi','CHN','Hunan',128418,NULL,NULL),(2176,'Qingzhou','CHN','Shandong',128258,NULL,NULL),(2177,'Qidong','CHN','Jiangsu',126872,NULL,NULL),(2178,'Huaihua','CHN','Hunan',126785,NULL,NULL),(2179,'Luohe','CHN','Henan',126438,NULL,NULL),(2180,'Chuzhou','CHN','Anhui',125341,NULL,NULL),(2181,'Kaiyuan','CHN','Liaoning',124219,NULL,NULL),(2182,'Linqing','CHN','Shandong',123958,NULL,NULL),(2183,'Chaohu','CHN','Anhui',123676,NULL,NULL),(2184,'Laohekou','CHN','Hubei',123366,NULL,NULL),(2185,'Dujiangyan','CHN','Sichuan',123357,NULL,NULL),(2186,'Zhumadian','CHN','Henan',123232,NULL,NULL),(2187,'Linchuan','CHN','Jiangxi',121949,NULL,NULL),(2188,'Jiaonan','CHN','Shandong',121397,NULL,NULL),(2189,'Sanmenxia','CHN','Henan',120523,NULL,NULL),(2190,'Heyuan','CHN','Guangdong',120101,NULL,NULL),(2191,'Manzhouli','CHN','Inner Mongolia',120023,NULL,NULL),(2192,'Lhasa','CHN','Tibet',120000,NULL,NULL),(2193,'Lianyuan','CHN','Hunan',118858,NULL,NULL),(2194,'Kuytun','CHN','Xinxiang',118553,NULL,NULL),(2195,'Puqi','CHN','Hubei',117264,NULL,NULL),(2196,'Hongjiang','CHN','Hunan',116188,NULL,NULL),(2197,'Qinzhou','CHN','Guangxi',114586,NULL,NULL),(2198,'Renqiu','CHN','Hebei',114256,NULL,NULL),(2199,'Yuyao','CHN','Zhejiang',114065,NULL,NULL),(2200,'Guigang','CHN','Guangxi',114025,NULL,NULL),(2201,'Kaili','CHN','Guizhou',113958,NULL,NULL),(2202,'Yan´an','CHN','Shaanxi',113277,NULL,NULL),(2203,'Beihai','CHN','Guangxi',112673,NULL,NULL),(2204,'Xuangzhou','CHN','Anhui',112673,NULL,NULL),(2205,'Quzhou','CHN','Zhejiang',112373,NULL,NULL),(2206,'Yong´an','CHN','Fujian',111762,NULL,NULL),(2207,'Zixing','CHN','Hunan',110048,NULL,NULL),(2208,'Liyang','CHN','Jiangsu',109520,NULL,NULL),(2209,'Yizheng','CHN','Jiangsu',109268,NULL,NULL),(2210,'Yumen','CHN','Gansu',109234,NULL,NULL),(2211,'Liling','CHN','Hunan',108504,NULL,NULL),(2212,'Yuncheng','CHN','Shanxi',108359,NULL,NULL),(2213,'Shanwei','CHN','Guangdong',107847,NULL,NULL),(2214,'Cixi','CHN','Zhejiang',107329,NULL,NULL),(2215,'Yuanjiang','CHN','Hunan',107004,NULL,NULL),(2216,'Bozhou','CHN','Anhui',106346,NULL,NULL),(2217,'Jinchang','CHN','Gansu',105287,NULL,NULL),(2218,'Fu´an','CHN','Fujian',105265,NULL,NULL),(2219,'Suqian','CHN','Jiangsu',105021,NULL,NULL),(2220,'Shishou','CHN','Hubei',104571,NULL,NULL),(2221,'Hengshui','CHN','Hebei',104269,NULL,NULL),(2222,'Danjiangkou','CHN','Hubei',103211,NULL,NULL),(2223,'Fujin','CHN','Heilongjiang',103104,NULL,NULL),(2224,'Sanya','CHN','Hainan',102820,NULL,NULL),(2225,'Guangshui','CHN','Hubei',102770,NULL,NULL),(2226,'Huangshan','CHN','Anhui',102628,NULL,NULL),(2227,'Xingcheng','CHN','Liaoning',102384,NULL,NULL),(2228,'Zhucheng','CHN','Shandong',102134,NULL,NULL),(2229,'Kunshan','CHN','Jiangsu',102052,NULL,NULL),(2230,'Haining','CHN','Zhejiang',100478,NULL,NULL),(2231,'Pingliang','CHN','Gansu',99265,NULL,NULL),(2232,'Fuqing','CHN','Fujian',99193,NULL,NULL),(2233,'Xinzhou','CHN','Shanxi',98667,NULL,NULL),(2234,'Jieyang','CHN','Guangdong',98531,NULL,NULL),(2235,'Zhangjiagang','CHN','Jiangsu',97994,NULL,NULL),(2236,'Tong Xian','CHN','Peking',97168,NULL,NULL),(2237,'Ya´an','CHN','Sichuan',95900,NULL,NULL),(2238,'Jinzhou','CHN','Liaoning',95761,NULL,NULL),(2239,'Emeishan','CHN','Sichuan',94000,NULL,NULL),(2240,'Enshi','CHN','Hubei',93056,NULL,NULL),(2241,'Bose','CHN','Guangxi',93009,NULL,NULL),(2242,'Yuzhou','CHN','Henan',92889,NULL,NULL),(2243,'Kaiyuan','CHN','Yunnan',91999,NULL,NULL),(2244,'Tumen','CHN','Jilin',91471,NULL,NULL),(2245,'Putian','CHN','Fujian',91030,NULL,NULL),(2246,'Linhai','CHN','Zhejiang',90870,NULL,NULL),(2247,'Xilin Hot','CHN','Inner Mongolia',90646,NULL,NULL),(2248,'Shaowu','CHN','Fujian',90286,NULL,NULL),(2249,'Junan','CHN','Shandong',90222,NULL,NULL),(2250,'Huaying','CHN','Sichuan',89400,NULL,NULL),(2251,'Pingyi','CHN','Shandong',89373,NULL,NULL),(2252,'Huangyan','CHN','Zhejiang',89288,NULL,NULL),(2253,'Bishkek','KGZ','Bishkek shaary',589400,NULL,NULL),(2254,'Osh','KGZ','Osh',222700,NULL,NULL),(2255,'Bikenibeu','KIR','South Tarawa',5055,NULL,NULL),(2256,'Bairiki','KIR','South Tarawa',2226,NULL,NULL),(2257,'Santafé de Bogotá','COL','Santafé de Bogotá',6260862,NULL,NULL),(2258,'Cali','COL','Valle',2077386,NULL,NULL),(2259,'Medellín','COL','Antioquia',1861265,NULL,NULL),(2260,'Barranquilla','COL','Atlántico',1223260,NULL,NULL),(2261,'Cartagena','COL','Bolívar',805757,NULL,NULL),(2262,'Cúcuta','COL','Norte de Santander',606932,NULL,NULL),(2263,'Bucaramanga','COL','Santander',515555,NULL,NULL),(2264,'Ibagué','COL','Tolima',393664,NULL,NULL),(2265,'Pereira','COL','Risaralda',381725,NULL,NULL),(2266,'Santa Marta','COL','Magdalena',359147,NULL,NULL),(2267,'Manizales','COL','Caldas',337580,NULL,NULL),(2268,'Bello','COL','Antioquia',333470,NULL,NULL),(2269,'Pasto','COL','Nariño',332396,NULL,NULL),(2270,'Neiva','COL','Huila',300052,NULL,NULL),(2271,'Soledad','COL','Atlántico',295058,NULL,NULL),(2272,'Armenia','COL','Quindío',288977,NULL,NULL),(2273,'Villavicencio','COL','Meta',273140,NULL,NULL),(2274,'Soacha','COL','Cundinamarca',272058,NULL,NULL),(2275,'Valledupar','COL','Cesar',263247,NULL,NULL),(2276,'Montería','COL','Córdoba',248245,NULL,NULL),(2277,'Itagüí','COL','Antioquia',228985,NULL,NULL),(2278,'Palmira','COL','Valle',226509,NULL,NULL),(2279,'Buenaventura','COL','Valle',224336,NULL,NULL),(2280,'Floridablanca','COL','Santander',221913,NULL,NULL),(2281,'Sincelejo','COL','Sucre',220704,NULL,NULL),(2282,'Popayán','COL','Cauca',200719,NULL,NULL),(2283,'Barrancabermeja','COL','Santander',178020,NULL,NULL),(2284,'Dos Quebradas','COL','Risaralda',159363,NULL,NULL),(2285,'Tuluá','COL','Valle',152488,NULL,NULL),(2286,'Envigado','COL','Antioquia',135848,NULL,NULL),(2287,'Cartago','COL','Valle',125884,NULL,NULL),(2288,'Girardot','COL','Cundinamarca',110963,NULL,NULL),(2289,'Buga','COL','Valle',110699,NULL,NULL),(2290,'Tunja','COL','Boyacá',109740,NULL,NULL),(2291,'Florencia','COL','Caquetá',108574,NULL,NULL),(2292,'Maicao','COL','La Guajira',108053,NULL,NULL),(2293,'Sogamoso','COL','Boyacá',107728,NULL,NULL),(2294,'Giron','COL','Santander',90688,NULL,NULL),(2295,'Moroni','COM','Njazidja',36000,NULL,NULL),(2296,'Brazzaville','COG','Brazzaville',950000,NULL,NULL),(2297,'Pointe-Noire','COG','Kouilou',500000,NULL,NULL),(2298,'Kinshasa','COD','Kinshasa',5064000,NULL,NULL),(2299,'Lubumbashi','COD','Shaba',851381,NULL,NULL),(2300,'Mbuji-Mayi','COD','East Kasai',806475,NULL,NULL),(2301,'Kolwezi','COD','Shaba',417810,NULL,NULL),(2302,'Kisangani','COD','Haute-Zaïre',417517,NULL,NULL),(2303,'Kananga','COD','West Kasai',393030,NULL,NULL),(2304,'Likasi','COD','Shaba',299118,NULL,NULL),(2305,'Bukavu','COD','South Kivu',201569,NULL,NULL),(2306,'Kikwit','COD','Bandundu',182142,NULL,NULL),(2307,'Tshikapa','COD','West Kasai',180860,NULL,NULL),(2308,'Matadi','COD','Bas-Zaïre',172730,NULL,NULL),(2309,'Mbandaka','COD','Equateur',169841,NULL,NULL),(2310,'Mwene-Ditu','COD','East Kasai',137459,NULL,NULL),(2311,'Boma','COD','Bas-Zaïre',135284,NULL,NULL),(2312,'Uvira','COD','South Kivu',115590,NULL,NULL),(2313,'Butembo','COD','North Kivu',109406,NULL,NULL),(2314,'Goma','COD','North Kivu',109094,NULL,NULL),(2315,'Kalemie','COD','Shaba',101309,NULL,NULL),(2316,'Bantam','CCK','Home Island',503,NULL,NULL),(2317,'West Island','CCK','West Island',167,NULL,NULL),(2318,'Pyongyang','PRK','Pyongyang-si',2484000,NULL,NULL),(2319,'Hamhung','PRK','Hamgyong N',709730,NULL,NULL),(2320,'Chongjin','PRK','Hamgyong P',582480,NULL,NULL),(2321,'Nampo','PRK','Nampo-si',566200,NULL,NULL),(2322,'Sinuiju','PRK','Pyongan P',326011,NULL,NULL),(2323,'Wonsan','PRK','Kangwon',300148,NULL,NULL),(2324,'Phyongsong','PRK','Pyongan N',272934,NULL,NULL),(2325,'Sariwon','PRK','Hwanghae P',254146,NULL,NULL),(2326,'Haeju','PRK','Hwanghae N',229172,NULL,NULL),(2327,'Kanggye','PRK','Chagang',223410,NULL,NULL),(2328,'Kimchaek','PRK','Hamgyong P',179000,NULL,NULL),(2329,'Hyesan','PRK','Yanggang',178020,NULL,NULL),(2330,'Kaesong','PRK','Kaesong-si',171500,NULL,NULL),(2331,'Seoul','KOR','Seoul',9981619,NULL,NULL),(2332,'Pusan','KOR','Pusan',3804522,NULL,NULL),(2333,'Inchon','KOR','Inchon',2559424,NULL,NULL),(2334,'Taegu','KOR','Taegu',2548568,NULL,NULL),(2335,'Taejon','KOR','Taejon',1425835,NULL,NULL),(2336,'Kwangju','KOR','Kwangju',1368341,NULL,NULL),(2337,'Ulsan','KOR','Kyongsangnam',1084891,NULL,NULL),(2338,'Songnam','KOR','Kyonggi',869094,NULL,NULL),(2339,'Puchon','KOR','Kyonggi',779412,NULL,NULL),(2340,'Suwon','KOR','Kyonggi',755550,NULL,NULL),(2341,'Anyang','KOR','Kyonggi',591106,NULL,NULL),(2342,'Chonju','KOR','Chollabuk',563153,NULL,NULL),(2343,'Chongju','KOR','Chungchongbuk',531376,NULL,NULL),(2344,'Koyang','KOR','Kyonggi',518282,NULL,NULL),(2345,'Ansan','KOR','Kyonggi',510314,NULL,NULL),(2346,'Pohang','KOR','Kyongsangbuk',508899,NULL,NULL),(2347,'Chang-won','KOR','Kyongsangnam',481694,NULL,NULL),(2348,'Masan','KOR','Kyongsangnam',441242,NULL,NULL),(2349,'Kwangmyong','KOR','Kyonggi',350914,NULL,NULL),(2350,'Chonan','KOR','Chungchongnam',330259,NULL,NULL),(2351,'Chinju','KOR','Kyongsangnam',329886,NULL,NULL),(2352,'Iksan','KOR','Chollabuk',322685,NULL,NULL),(2353,'Pyongtaek','KOR','Kyonggi',312927,NULL,NULL),(2354,'Kumi','KOR','Kyongsangbuk',311431,NULL,NULL),(2355,'Uijongbu','KOR','Kyonggi',276111,NULL,NULL),(2356,'Kyongju','KOR','Kyongsangbuk',272968,NULL,NULL),(2357,'Kunsan','KOR','Chollabuk',266569,NULL,NULL),(2358,'Cheju','KOR','Cheju',258511,NULL,NULL),(2359,'Kimhae','KOR','Kyongsangnam',256370,NULL,NULL),(2360,'Sunchon','KOR','Chollanam',249263,NULL,NULL),(2361,'Mokpo','KOR','Chollanam',247452,NULL,NULL),(2362,'Yong-in','KOR','Kyonggi',242643,NULL,NULL),(2363,'Wonju','KOR','Kang-won',237460,NULL,NULL),(2364,'Kunpo','KOR','Kyonggi',235233,NULL,NULL),(2365,'Chunchon','KOR','Kang-won',234528,NULL,NULL),(2366,'Namyangju','KOR','Kyonggi',229060,NULL,NULL),(2367,'Kangnung','KOR','Kang-won',220403,NULL,NULL),(2368,'Chungju','KOR','Chungchongbuk',205206,NULL,NULL),(2369,'Andong','KOR','Kyongsangbuk',188443,NULL,NULL),(2370,'Yosu','KOR','Chollanam',183596,NULL,NULL),(2371,'Kyongsan','KOR','Kyongsangbuk',173746,NULL,NULL),(2372,'Paju','KOR','Kyonggi',163379,NULL,NULL),(2373,'Yangsan','KOR','Kyongsangnam',163351,NULL,NULL),(2374,'Ichon','KOR','Kyonggi',155332,NULL,NULL),(2375,'Asan','KOR','Chungchongnam',154663,NULL,NULL),(2376,'Koje','KOR','Kyongsangnam',147562,NULL,NULL),(2377,'Kimchon','KOR','Kyongsangbuk',147027,NULL,NULL),(2378,'Nonsan','KOR','Chungchongnam',146619,NULL,NULL),(2379,'Kuri','KOR','Kyonggi',142173,NULL,NULL),(2380,'Chong-up','KOR','Chollabuk',139111,NULL,NULL),(2381,'Chechon','KOR','Chungchongbuk',137070,NULL,NULL),(2382,'Sosan','KOR','Chungchongnam',134746,NULL,NULL),(2383,'Shihung','KOR','Kyonggi',133443,NULL,NULL),(2384,'Tong-yong','KOR','Kyongsangnam',131717,NULL,NULL),(2385,'Kongju','KOR','Chungchongnam',131229,NULL,NULL),(2386,'Yongju','KOR','Kyongsangbuk',131097,NULL,NULL),(2387,'Chinhae','KOR','Kyongsangnam',125997,NULL,NULL),(2388,'Sangju','KOR','Kyongsangbuk',124116,NULL,NULL),(2389,'Poryong','KOR','Chungchongnam',122604,NULL,NULL),(2390,'Kwang-yang','KOR','Chollanam',122052,NULL,NULL),(2391,'Miryang','KOR','Kyongsangnam',121501,NULL,NULL),(2392,'Hanam','KOR','Kyonggi',115812,NULL,NULL),(2393,'Kimje','KOR','Chollabuk',115427,NULL,NULL),(2394,'Yongchon','KOR','Kyongsangbuk',113511,NULL,NULL),(2395,'Sachon','KOR','Kyongsangnam',113494,NULL,NULL),(2396,'Uiwang','KOR','Kyonggi',108788,NULL,NULL),(2397,'Naju','KOR','Chollanam',107831,NULL,NULL),(2398,'Namwon','KOR','Chollabuk',103544,NULL,NULL),(2399,'Tonghae','KOR','Kang-won',95472,NULL,NULL),(2400,'Mun-gyong','KOR','Kyongsangbuk',92239,NULL,NULL),(2401,'Athenai','GRC','Attika',772072,NULL,NULL),(2402,'Thessaloniki','GRC','Central Macedonia',383967,NULL,NULL),(2403,'Pireus','GRC','Attika',182671,NULL,NULL),(2404,'Patras','GRC','West Greece',153344,NULL,NULL),(2405,'Peristerion','GRC','Attika',137288,NULL,NULL),(2406,'Herakleion','GRC','Crete',116178,NULL,NULL),(2407,'Kallithea','GRC','Attika',114233,NULL,NULL),(2408,'Larisa','GRC','Thessalia',113090,NULL,NULL),(2409,'Zagreb','HRV','Grad Zagreb',706770,NULL,NULL),(2410,'Split','HRV','Split-Dalmatia',189388,NULL,NULL),(2411,'Rijeka','HRV','Primorje-Gorski Kota',167964,NULL,NULL),(2412,'Osijek','HRV','Osijek-Baranja',104761,NULL,NULL),(2413,'La Habana','CUB','La Habana',2256000,NULL,NULL),(2414,'Santiago de Cuba','CUB','Santiago de Cuba',433180,NULL,NULL),(2415,'Camagüey','CUB','Camagüey',298726,NULL,NULL),(2416,'Holguín','CUB','Holguín',249492,NULL,NULL),(2417,'Santa Clara','CUB','Villa Clara',207350,NULL,NULL),(2418,'Guantánamo','CUB','Guantánamo',205078,NULL,NULL),(2419,'Pinar del Río','CUB','Pinar del Río',142100,NULL,NULL),(2420,'Bayamo','CUB','Granma',141000,NULL,NULL),(2421,'Cienfuegos','CUB','Cienfuegos',132770,NULL,NULL),(2422,'Victoria de las Tunas','CUB','Las Tunas',132350,NULL,NULL),(2423,'Matanzas','CUB','Matanzas',123273,NULL,NULL),(2424,'Manzanillo','CUB','Granma',109350,NULL,NULL),(2425,'Sancti-Spíritus','CUB','Sancti-Spíritus',100751,NULL,NULL),(2426,'Ciego de Ávila','CUB','Ciego de Ávila',98505,NULL,NULL),(2427,'al-Salimiya','KWT','Hawalli',130215,NULL,NULL),(2428,'Jalib al-Shuyukh','KWT','Hawalli',102178,NULL,NULL),(2429,'Kuwait','KWT','al-Asima',28859,NULL,NULL),(2430,'Nicosia','CYP','Nicosia',195000,NULL,NULL),(2431,'Limassol','CYP','Limassol',154400,NULL,NULL),(2432,'Vientiane','LAO','Viangchan',531800,NULL,NULL),(2433,'Savannakhet','LAO','Savannakhet',96652,NULL,NULL),(2434,'Riga','LVA','Riika',764328,NULL,NULL),(2435,'Daugavpils','LVA','Daugavpils',114829,NULL,NULL),(2436,'Liepaja','LVA','Liepaja',89439,NULL,NULL),(2437,'Maseru','LSO','Maseru',297000,NULL,NULL),(2438,'Beirut','LBN','Beirut',1100000,NULL,NULL),(2439,'Tripoli','LBN','al-Shamal',240000,NULL,NULL),(2440,'Monrovia','LBR','Montserrado',850000,NULL,NULL),(2441,'Tripoli','LBY','Tripoli',1682000,NULL,NULL),(2442,'Bengasi','LBY','Bengasi',804000,NULL,NULL),(2443,'Misrata','LBY','Misrata',121669,NULL,NULL),(2444,'al-Zawiya','LBY','al-Zawiya',89338,NULL,NULL),(2445,'Schaan','LIE','Schaan',5346,NULL,NULL),(2446,'Vaduz','LIE','Vaduz',5043,NULL,NULL),(2447,'Vilnius','LTU','Vilna',577969,NULL,NULL),(2448,'Kaunas','LTU','Kaunas',412639,NULL,NULL),(2449,'Klaipeda','LTU','Klaipeda',202451,NULL,NULL),(2450,'Šiauliai','LTU','Šiauliai',146563,NULL,NULL),(2451,'Panevezys','LTU','Panevezys',133695,NULL,NULL),(2452,'Luxembourg [Luxemburg/Lëtzebuerg]','LUX','Luxembourg',80700,NULL,NULL),(2453,'El-Aaiún','ESH','El-Aaiún',169000,NULL,NULL),(2454,'Macao','MAC','Macau',437500,NULL,NULL),(2455,'Antananarivo','MDG','Antananarivo',675669,NULL,NULL),(2456,'Toamasina','MDG','Toamasina',127441,NULL,NULL),(2457,'Antsirabé','MDG','Antananarivo',120239,NULL,NULL),(2458,'Mahajanga','MDG','Mahajanga',100807,NULL,NULL),(2459,'Fianarantsoa','MDG','Fianarantsoa',99005,NULL,NULL),(2460,'Skopje','MKD','Skopje',444299,NULL,NULL),(2461,'Blantyre','MWI','Blantyre',478155,NULL,NULL),(2462,'Lilongwe','MWI','Lilongwe',435964,NULL,NULL),(2463,'Male','MDV','Maale',71000,NULL,NULL),(2464,'Kuala Lumpur','MYS','Wilayah Persekutuan',1297526,NULL,NULL),(2465,'Ipoh','MYS','Perak',382853,NULL,NULL),(2466,'Johor Baharu','MYS','Johor',328436,NULL,NULL),(2467,'Petaling Jaya','MYS','Selangor',254350,NULL,NULL),(2468,'Kelang','MYS','Selangor',243355,NULL,NULL),(2469,'Kuala Terengganu','MYS','Terengganu',228119,NULL,NULL),(2470,'Pinang','MYS','Pulau Pinang',219603,NULL,NULL),(2471,'Kota Bharu','MYS','Kelantan',219582,NULL,NULL),(2472,'Kuantan','MYS','Pahang',199484,NULL,NULL),(2473,'Taiping','MYS','Perak',183261,NULL,NULL),(2474,'Seremban','MYS','Negeri Sembilan',182869,NULL,NULL),(2475,'Kuching','MYS','Sarawak',148059,NULL,NULL),(2476,'Sibu','MYS','Sarawak',126381,NULL,NULL),(2477,'Sandakan','MYS','Sabah',125841,NULL,NULL),(2478,'Alor Setar','MYS','Kedah',124412,NULL,NULL),(2479,'Selayang Baru','MYS','Selangor',124228,NULL,NULL),(2480,'Sungai Petani','MYS','Kedah',114763,NULL,NULL),(2481,'Shah Alam','MYS','Selangor',102019,NULL,NULL),(2482,'Bamako','MLI','Bamako',809552,NULL,NULL),(2483,'Birkirkara','MLT','Outer Harbour',21445,NULL,NULL),(2484,'Valletta','MLT','Inner Harbour',7073,NULL,NULL),(2485,'Casablanca','MAR','Casablanca',2940623,NULL,NULL),(2486,'Rabat','MAR','Rabat-Salé-Zammour-Z',623457,NULL,NULL),(2487,'Marrakech','MAR','Marrakech-Tensift-Al',621914,NULL,NULL),(2488,'Fès','MAR','Fès-Boulemane',541162,NULL,NULL),(2489,'Tanger','MAR','Tanger-Tétouan',521735,NULL,NULL),(2490,'Salé','MAR','Rabat-Salé-Zammour-Z',504420,NULL,NULL),(2491,'Meknès','MAR','Meknès-Tafilalet',460000,NULL,NULL),(2492,'Oujda','MAR','Oriental',365382,NULL,NULL),(2493,'Kénitra','MAR','Gharb-Chrarda-Béni H',292600,NULL,NULL),(2494,'Tétouan','MAR','Tanger-Tétouan',277516,NULL,NULL),(2495,'Safi','MAR','Doukkala-Abda',262300,NULL,NULL),(2496,'Agadir','MAR','Souss Massa-Draâ',155244,NULL,NULL),(2497,'Mohammedia','MAR','Casablanca',154706,NULL,NULL),(2498,'Khouribga','MAR','Chaouia-Ouardigha',152090,NULL,NULL),(2499,'Beni-Mellal','MAR','Tadla-Azilal',140212,NULL,NULL),(2500,'Témara','MAR','Rabat-Salé-Zammour-Z',126303,NULL,NULL),(2501,'El Jadida','MAR','Doukkala-Abda',119083,NULL,NULL),(2502,'Nador','MAR','Oriental',112450,NULL,NULL),(2503,'Ksar el Kebir','MAR','Tanger-Tétouan',107065,NULL,NULL),(2504,'Settat','MAR','Chaouia-Ouardigha',96200,NULL,NULL),(2505,'Taza','MAR','Taza-Al Hoceima-Taou',92700,NULL,NULL),(2506,'El Araich','MAR','Tanger-Tétouan',90400,NULL,NULL),(2507,'Dalap-Uliga-Darrit','MHL','Majuro',28000,NULL,NULL),(2508,'Fort-de-France','MTQ','Fort-de-France',94050,NULL,NULL),(2509,'Nouakchott','MRT','Nouakchott',667300,NULL,NULL),(2510,'Nouâdhibou','MRT','Dakhlet Nouâdhibou',97600,NULL,NULL),(2511,'Port-Louis','MUS','Port-Louis',138200,NULL,NULL),(2512,'Beau Bassin-Rose Hill','MUS','Plaines Wilhelms',100616,NULL,NULL),(2513,'Vacoas-Phoenix','MUS','Plaines Wilhelms',98464,NULL,NULL),(2514,'Mamoutzou','MYT','Mamoutzou',12000,NULL,NULL),(2515,'Ciudad de México','MEX','Distrito Federal',8591309,NULL,NULL),(2516,'Guadalajara','MEX','Jalisco',1647720,NULL,NULL),(2517,'Ecatepec de Morelos','MEX','México',1620303,NULL,NULL),(2518,'Puebla','MEX','Puebla',1346176,NULL,NULL),(2519,'Nezahualcóyotl','MEX','México',1224924,NULL,NULL),(2520,'Juárez','MEX','Chihuahua',1217818,NULL,NULL),(2521,'Tijuana','MEX','Baja California',1212232,NULL,NULL),(2522,'León','MEX','Guanajuato',1133576,NULL,NULL),(2523,'Monterrey','MEX','Nuevo León',1108499,NULL,NULL),(2524,'Zapopan','MEX','Jalisco',1002239,NULL,NULL),(2525,'Naucalpan de Juárez','MEX','México',857511,NULL,NULL),(2526,'Mexicali','MEX','Baja California',764902,NULL,NULL),(2527,'Culiacán','MEX','Sinaloa',744859,NULL,NULL),(2528,'Acapulco de Juárez','MEX','Guerrero',721011,NULL,NULL),(2529,'Tlalnepantla de Baz','MEX','México',720755,NULL,NULL),(2530,'Mérida','MEX','Yucatán',703324,NULL,NULL),(2531,'Chihuahua','MEX','Chihuahua',670208,NULL,NULL),(2532,'San Luis Potosí','MEX','San Luis Potosí',669353,NULL,NULL),(2533,'Guadalupe','MEX','Nuevo León',668780,NULL,NULL),(2534,'Toluca','MEX','México',665617,NULL,NULL),(2535,'Aguascalientes','MEX','Aguascalientes',643360,NULL,NULL),(2536,'Querétaro','MEX','Querétaro de Arteaga',639839,NULL,NULL),(2537,'Morelia','MEX','Michoacán de Ocampo',619958,NULL,NULL),(2538,'Hermosillo','MEX','Sonora',608697,NULL,NULL),(2539,'Saltillo','MEX','Coahuila de Zaragoza',577352,NULL,NULL),(2540,'Torreón','MEX','Coahuila de Zaragoza',529093,NULL,NULL),(2541,'Centro (Villahermosa)','MEX','Tabasco',519873,NULL,NULL),(2542,'San Nicolás de los Garza','MEX','Nuevo León',495540,NULL,NULL),(2543,'Durango','MEX','Durango',490524,NULL,NULL),(2544,'Chimalhuacán','MEX','México',490245,NULL,NULL),(2545,'Tlaquepaque','MEX','Jalisco',475472,NULL,NULL),(2546,'Atizapán de Zaragoza','MEX','México',467262,NULL,NULL),(2547,'Veracruz','MEX','Veracruz',457119,NULL,NULL),(2548,'Cuautitlán Izcalli','MEX','México',452976,NULL,NULL),(2549,'Irapuato','MEX','Guanajuato',440039,NULL,NULL),(2550,'Tuxtla Gutiérrez','MEX','Chiapas',433544,NULL,NULL),(2551,'Tultitlán','MEX','México',432411,NULL,NULL),(2552,'Reynosa','MEX','Tamaulipas',419776,NULL,NULL),(2553,'Benito Juárez','MEX','Quintana Roo',419276,NULL,NULL),(2554,'Matamoros','MEX','Tamaulipas',416428,NULL,NULL),(2555,'Xalapa','MEX','Veracruz',390058,NULL,NULL),(2556,'Celaya','MEX','Guanajuato',382140,NULL,NULL),(2557,'Mazatlán','MEX','Sinaloa',380265,NULL,NULL),(2558,'Ensenada','MEX','Baja California',369573,NULL,NULL),(2559,'Ahome','MEX','Sinaloa',358663,NULL,NULL),(2560,'Cajeme','MEX','Sonora',355679,NULL,NULL),(2561,'Cuernavaca','MEX','Morelos',337966,NULL,NULL),(2562,'Tonalá','MEX','Jalisco',336109,NULL,NULL),(2563,'Valle de Chalco Solidaridad','MEX','México',323113,NULL,NULL),(2564,'Nuevo Laredo','MEX','Tamaulipas',310277,NULL,NULL),(2565,'Tepic','MEX','Nayarit',305025,NULL,NULL),(2566,'Tampico','MEX','Tamaulipas',294789,NULL,NULL),(2567,'Ixtapaluca','MEX','México',293160,NULL,NULL),(2568,'Apodaca','MEX','Nuevo León',282941,NULL,NULL),(2569,'Guasave','MEX','Sinaloa',277201,NULL,NULL),(2570,'Gómez Palacio','MEX','Durango',272806,NULL,NULL),(2571,'Tapachula','MEX','Chiapas',271141,NULL,NULL),(2572,'Nicolás Romero','MEX','México',269393,NULL,NULL),(2573,'Coatzacoalcos','MEX','Veracruz',267037,NULL,NULL),(2574,'Uruapan','MEX','Michoacán de Ocampo',265211,NULL,NULL),(2575,'Victoria','MEX','Tamaulipas',262686,NULL,NULL),(2576,'Oaxaca de Juárez','MEX','Oaxaca',256848,NULL,NULL),(2577,'Coacalco de Berriozábal','MEX','México',252270,NULL,NULL),(2578,'Pachuca de Soto','MEX','Hidalgo',244688,NULL,NULL),(2579,'General Escobedo','MEX','Nuevo León',232961,NULL,NULL),(2580,'Salamanca','MEX','Guanajuato',226864,NULL,NULL),(2581,'Santa Catarina','MEX','Nuevo León',226573,NULL,NULL),(2582,'Tehuacán','MEX','Puebla',225943,NULL,NULL),(2583,'Chalco','MEX','México',222201,NULL,NULL),(2584,'Cárdenas','MEX','Tabasco',216903,NULL,NULL),(2585,'Campeche','MEX','Campeche',216735,NULL,NULL),(2586,'La Paz','MEX','México',213045,NULL,NULL),(2587,'Othón P. Blanco (Chetumal)','MEX','Quintana Roo',208014,NULL,NULL),(2588,'Texcoco','MEX','México',203681,NULL,NULL),(2589,'La Paz','MEX','Baja California Sur',196708,NULL,NULL),(2590,'Metepec','MEX','México',194265,NULL,NULL),(2591,'Monclova','MEX','Coahuila de Zaragoza',193657,NULL,NULL),(2592,'Huixquilucan','MEX','México',193156,NULL,NULL),(2593,'Chilpancingo de los Bravo','MEX','Guerrero',192509,NULL,NULL),(2594,'Puerto Vallarta','MEX','Jalisco',183741,NULL,NULL),(2595,'Fresnillo','MEX','Zacatecas',182744,NULL,NULL),(2596,'Ciudad Madero','MEX','Tamaulipas',182012,NULL,NULL),(2597,'Soledad de Graciano Sánchez','MEX','San Luis Potosí',179956,NULL,NULL),(2598,'San Juan del Río','MEX','Querétaro',179300,NULL,NULL),(2599,'San Felipe del Progreso','MEX','México',177330,NULL,NULL),(2600,'Córdoba','MEX','Veracruz',176952,NULL,NULL),(2601,'Tecámac','MEX','México',172410,NULL,NULL),(2602,'Ocosingo','MEX','Chiapas',171495,NULL,NULL),(2603,'Carmen','MEX','Campeche',171367,NULL,NULL),(2604,'Lázaro Cárdenas','MEX','Michoacán de Ocampo',170878,NULL,NULL),(2605,'Jiutepec','MEX','Morelos',170428,NULL,NULL),(2606,'Papantla','MEX','Veracruz',170123,NULL,NULL),(2607,'Comalcalco','MEX','Tabasco',164640,NULL,NULL),(2608,'Zamora','MEX','Michoacán de Ocampo',161191,NULL,NULL),(2609,'Nogales','MEX','Sonora',159103,NULL,NULL),(2610,'Huimanguillo','MEX','Tabasco',158335,NULL,NULL),(2611,'Cuautla','MEX','Morelos',153132,NULL,NULL),(2612,'Minatitlán','MEX','Veracruz',152983,NULL,NULL),(2613,'Poza Rica de Hidalgo','MEX','Veracruz',152678,NULL,NULL),(2614,'Ciudad Valles','MEX','San Luis Potosí',146411,NULL,NULL),(2615,'Navolato','MEX','Sinaloa',145396,NULL,NULL),(2616,'San Luis Río Colorado','MEX','Sonora',145276,NULL,NULL),(2617,'Pénjamo','MEX','Guanajuato',143927,NULL,NULL),(2618,'San Andrés Tuxtla','MEX','Veracruz',142251,NULL,NULL),(2619,'Guanajuato','MEX','Guanajuato',141215,NULL,NULL),(2620,'Navojoa','MEX','Sonora',140495,NULL,NULL),(2621,'Zitácuaro','MEX','Michoacán de Ocampo',137970,NULL,NULL),(2622,'Boca del Río','MEX','Veracruz-Llave',135721,NULL,NULL),(2623,'Allende','MEX','Guanajuato',134645,NULL,NULL),(2624,'Silao','MEX','Guanajuato',134037,NULL,NULL),(2625,'Macuspana','MEX','Tabasco',133795,NULL,NULL),(2626,'San Juan Bautista Tuxtepec','MEX','Oaxaca',133675,NULL,NULL),(2627,'San Cristóbal de las Casas','MEX','Chiapas',132317,NULL,NULL),(2628,'Valle de Santiago','MEX','Guanajuato',130557,NULL,NULL),(2629,'Guaymas','MEX','Sonora',130108,NULL,NULL),(2630,'Colima','MEX','Colima',129454,NULL,NULL),(2631,'Dolores Hidalgo','MEX','Guanajuato',128675,NULL,NULL),(2632,'Lagos de Moreno','MEX','Jalisco',127949,NULL,NULL),(2633,'Piedras Negras','MEX','Coahuila de Zaragoza',127898,NULL,NULL),(2634,'Altamira','MEX','Tamaulipas',127490,NULL,NULL),(2635,'Túxpam','MEX','Veracruz',126475,NULL,NULL),(2636,'San Pedro Garza García','MEX','Nuevo León',126147,NULL,NULL),(2637,'Cuauhtémoc','MEX','Chihuahua',124279,NULL,NULL),(2638,'Manzanillo','MEX','Colima',124014,NULL,NULL),(2639,'Iguala de la Independencia','MEX','Guerrero',123883,NULL,NULL),(2640,'Zacatecas','MEX','Zacatecas',123700,NULL,NULL),(2641,'Tlajomulco de Zúñiga','MEX','Jalisco',123220,NULL,NULL),(2642,'Tulancingo de Bravo','MEX','Hidalgo',121946,NULL,NULL),(2643,'Zinacantepec','MEX','México',121715,NULL,NULL),(2644,'San Martín Texmelucan','MEX','Puebla',121093,NULL,NULL),(2645,'Tepatitlán de Morelos','MEX','Jalisco',118948,NULL,NULL),(2646,'Martínez de la Torre','MEX','Veracruz',118815,NULL,NULL),(2647,'Orizaba','MEX','Veracruz',118488,NULL,NULL),(2648,'Apatzingán','MEX','Michoacán de Ocampo',117849,NULL,NULL),(2649,'Atlixco','MEX','Puebla',117019,NULL,NULL),(2650,'Delicias','MEX','Chihuahua',116132,NULL,NULL),(2651,'Ixtlahuaca','MEX','México',115548,NULL,NULL),(2652,'El Mante','MEX','Tamaulipas',112453,NULL,NULL),(2653,'Lerdo','MEX','Durango',112272,NULL,NULL),(2654,'Almoloya de Juárez','MEX','México',110550,NULL,NULL),(2655,'Acámbaro','MEX','Guanajuato',110487,NULL,NULL),(2656,'Acuña','MEX','Coahuila de Zaragoza',110388,NULL,NULL),(2657,'Guadalupe','MEX','Zacatecas',108881,NULL,NULL),(2658,'Huejutla de Reyes','MEX','Hidalgo',108017,NULL,NULL),(2659,'Hidalgo','MEX','Michoacán de Ocampo',106198,NULL,NULL),(2660,'Los Cabos','MEX','Baja California Sur',105199,NULL,NULL),(2661,'Comitán de Domínguez','MEX','Chiapas',104986,NULL,NULL),(2662,'Cunduacán','MEX','Tabasco',104164,NULL,NULL),(2663,'Río Bravo','MEX','Tamaulipas',103901,NULL,NULL),(2664,'Temapache','MEX','Veracruz',102824,NULL,NULL),(2665,'Chilapa de Alvarez','MEX','Guerrero',102716,NULL,NULL),(2666,'Hidalgo del Parral','MEX','Chihuahua',100881,NULL,NULL),(2667,'San Francisco del Rincón','MEX','Guanajuato',100149,NULL,NULL),(2668,'Taxco de Alarcón','MEX','Guerrero',99907,NULL,NULL),(2669,'Zumpango','MEX','México',99781,NULL,NULL),(2670,'San Pedro Cholula','MEX','Puebla',99734,NULL,NULL),(2671,'Lerma','MEX','México',99714,NULL,NULL),(2672,'Tecomán','MEX','Colima',99296,NULL,NULL),(2673,'Las Margaritas','MEX','Chiapas',97389,NULL,NULL),(2674,'Cosoleacaque','MEX','Veracruz',97199,NULL,NULL),(2675,'San Luis de la Paz','MEX','Guanajuato',96763,NULL,NULL),(2676,'José Azueta','MEX','Guerrero',95448,NULL,NULL),(2677,'Santiago Ixcuintla','MEX','Nayarit',95311,NULL,NULL),(2678,'San Felipe','MEX','Guanajuato',95305,NULL,NULL),(2679,'Tejupilco','MEX','México',94934,NULL,NULL),(2680,'Tantoyuca','MEX','Veracruz',94709,NULL,NULL),(2681,'Salvatierra','MEX','Guanajuato',94322,NULL,NULL),(2682,'Tultepec','MEX','México',93364,NULL,NULL),(2683,'Temixco','MEX','Morelos',92686,NULL,NULL),(2684,'Matamoros','MEX','Coahuila de Zaragoza',91858,NULL,NULL),(2685,'Pánuco','MEX','Veracruz',90551,NULL,NULL),(2686,'El Fuerte','MEX','Sinaloa',89556,NULL,NULL),(2687,'Tierra Blanca','MEX','Veracruz',89143,NULL,NULL),(2688,'Weno','FSM','Chuuk',22000,NULL,NULL),(2689,'Palikir','FSM','Pohnpei',8600,NULL,NULL),(2690,'Chisinau','MDA','Chisinau',719900,NULL,NULL),(2691,'Tiraspol','MDA','Dnjestria',194300,NULL,NULL),(2692,'Balti','MDA','Balti',153400,NULL,NULL),(2693,'Bender (Tîghina)','MDA','Bender (Tîghina)',125700,NULL,NULL),(2694,'Monte-Carlo','MCO','–',13154,NULL,NULL),(2695,'Monaco-Ville','MCO','–',1234,NULL,NULL),(2696,'Ulan Bator','MNG','Ulaanbaatar',773700,NULL,NULL),(2697,'Plymouth','MSR','Plymouth',2000,NULL,NULL),(2698,'Maputo','MOZ','Maputo',1018938,NULL,NULL),(2699,'Matola','MOZ','Maputo',424662,NULL,NULL),(2700,'Beira','MOZ','Sofala',397368,NULL,NULL),(2701,'Nampula','MOZ','Nampula',303346,NULL,NULL),(2702,'Chimoio','MOZ','Manica',171056,NULL,NULL),(2703,'Naçala-Porto','MOZ','Nampula',158248,NULL,NULL),(2704,'Quelimane','MOZ','Zambézia',150116,NULL,NULL),(2705,'Mocuba','MOZ','Zambézia',124700,NULL,NULL),(2706,'Tete','MOZ','Tete',101984,NULL,NULL),(2707,'Xai-Xai','MOZ','Gaza',99442,NULL,NULL),(2708,'Gurue','MOZ','Zambézia',99300,NULL,NULL),(2709,'Maxixe','MOZ','Inhambane',93985,NULL,NULL),(2710,'Rangoon (Yangon)','MMR','Rangoon [Yangon]',3361700,NULL,NULL),(2711,'Mandalay','MMR','Mandalay',885300,NULL,NULL),(2712,'Moulmein (Mawlamyine)','MMR','Mon',307900,NULL,NULL),(2713,'Pegu (Bago)','MMR','Pegu [Bago]',190900,NULL,NULL),(2714,'Bassein (Pathein)','MMR','Irrawaddy [Ayeyarwad',183900,NULL,NULL),(2715,'Monywa','MMR','Sagaing',138600,NULL,NULL),(2716,'Sittwe (Akyab)','MMR','Rakhine',137600,NULL,NULL),(2717,'Taunggyi (Taunggye)','MMR','Shan',131500,NULL,NULL),(2718,'Meikhtila','MMR','Mandalay',129700,NULL,NULL),(2719,'Mergui (Myeik)','MMR','Tenasserim [Tanintha',122700,NULL,NULL),(2720,'Lashio (Lasho)','MMR','Shan',107600,NULL,NULL),(2721,'Prome (Pyay)','MMR','Pegu [Bago]',105700,NULL,NULL),(2722,'Henzada (Hinthada)','MMR','Irrawaddy [Ayeyarwad',104700,NULL,NULL),(2723,'Myingyan','MMR','Mandalay',103600,NULL,NULL),(2724,'Tavoy (Dawei)','MMR','Tenasserim [Tanintha',96800,NULL,NULL),(2725,'Pagakku (Pakokku)','MMR','Magwe [Magway]',94800,NULL,NULL),(2726,'Windhoek','NAM','Khomas',169000,NULL,NULL),(2727,'Yangor','NRU','–',4050,NULL,NULL),(2728,'Yaren','NRU','–',559,NULL,NULL),(2729,'Kathmandu','NPL','Central',591835,NULL,NULL),(2730,'Biratnagar','NPL','Eastern',157764,NULL,NULL),(2731,'Pokhara','NPL','Western',146318,NULL,NULL),(2732,'Lalitapur','NPL','Central',145847,NULL,NULL),(2733,'Birgunj','NPL','Central',90639,NULL,NULL),(2734,'Managua','NIC','Managua',959000,NULL,NULL),(2735,'León','NIC','León',123865,NULL,NULL),(2736,'Chinandega','NIC','Chinandega',97387,NULL,NULL),(2737,'Masaya','NIC','Masaya',88971,NULL,NULL),(2738,'Niamey','NER','Niamey',420000,NULL,NULL),(2739,'Zinder','NER','Zinder',120892,NULL,NULL),(2740,'Maradi','NER','Maradi',112965,NULL,NULL),(2741,'Lagos','NGA','Lagos',1518000,NULL,NULL),(2742,'Ibadan','NGA','Oyo & Osun',1432000,NULL,NULL),(2743,'Ogbomosho','NGA','Oyo & Osun',730000,NULL,NULL),(2744,'Kano','NGA','Kano & Jigawa',674100,NULL,NULL),(2745,'Oshogbo','NGA','Oyo & Osun',476800,NULL,NULL),(2746,'Ilorin','NGA','Kwara & Kogi',475800,NULL,NULL),(2747,'Abeokuta','NGA','Ogun',427400,NULL,NULL),(2748,'Port Harcourt','NGA','Rivers & Bayelsa',410000,NULL,NULL),(2749,'Zaria','NGA','Kaduna',379200,NULL,NULL),(2750,'Ilesha','NGA','Oyo & Osun',378400,NULL,NULL),(2751,'Onitsha','NGA','Anambra & Enugu & Eb',371900,NULL,NULL),(2752,'Iwo','NGA','Oyo & Osun',362000,NULL,NULL),(2753,'Ado-Ekiti','NGA','Ondo & Ekiti',359400,NULL,NULL),(2754,'Abuja','NGA','Federal Capital Dist',350100,NULL,NULL),(2755,'Kaduna','NGA','Kaduna',342200,NULL,NULL),(2756,'Mushin','NGA','Lagos',333200,NULL,NULL),(2757,'Maiduguri','NGA','Borno & Yobe',320000,NULL,NULL),(2758,'Enugu','NGA','Anambra & Enugu & Eb',316100,NULL,NULL),(2759,'Ede','NGA','Oyo & Osun',307100,NULL,NULL),(2760,'Aba','NGA','Imo & Abia',298900,NULL,NULL),(2761,'Ife','NGA','Oyo & Osun',296800,NULL,NULL),(2762,'Ila','NGA','Oyo & Osun',264000,NULL,NULL),(2763,'Oyo','NGA','Oyo & Osun',256400,NULL,NULL),(2764,'Ikerre','NGA','Ondo & Ekiti',244600,NULL,NULL),(2765,'Benin City','NGA','Edo & Delta',229400,NULL,NULL),(2766,'Iseyin','NGA','Oyo & Osun',217300,NULL,NULL),(2767,'Katsina','NGA','Katsina',206500,NULL,NULL),(2768,'Jos','NGA','Plateau & Nassarawa',206300,NULL,NULL),(2769,'Sokoto','NGA','Sokoto & Kebbi & Zam',204900,NULL,NULL),(2770,'Ilobu','NGA','Oyo & Osun',199000,NULL,NULL),(2771,'Offa','NGA','Kwara & Kogi',197200,NULL,NULL),(2772,'Ikorodu','NGA','Lagos',184900,NULL,NULL),(2773,'Ilawe-Ekiti','NGA','Ondo & Ekiti',184500,NULL,NULL),(2774,'Owo','NGA','Ondo & Ekiti',183500,NULL,NULL),(2775,'Ikirun','NGA','Oyo & Osun',181400,NULL,NULL),(2776,'Shaki','NGA','Oyo & Osun',174500,NULL,NULL),(2777,'Calabar','NGA','Cross River',174400,NULL,NULL),(2778,'Ondo','NGA','Ondo & Ekiti',173600,NULL,NULL),(2779,'Akure','NGA','Ondo & Ekiti',162300,NULL,NULL),(2780,'Gusau','NGA','Sokoto & Kebbi & Zam',158000,NULL,NULL),(2781,'Ijebu-Ode','NGA','Ogun',156400,NULL,NULL),(2782,'Effon-Alaiye','NGA','Oyo & Osun',153100,NULL,NULL),(2783,'Kumo','NGA','Bauchi & Gombe',148000,NULL,NULL),(2784,'Shomolu','NGA','Lagos',147700,NULL,NULL),(2785,'Oka-Akoko','NGA','Ondo & Ekiti',142900,NULL,NULL),(2786,'Ikare','NGA','Ondo & Ekiti',140800,NULL,NULL),(2787,'Sapele','NGA','Edo & Delta',139200,NULL,NULL),(2788,'Deba Habe','NGA','Bauchi & Gombe',138600,NULL,NULL),(2789,'Minna','NGA','Niger',136900,NULL,NULL),(2790,'Warri','NGA','Edo & Delta',126100,NULL,NULL),(2791,'Bida','NGA','Niger',125500,NULL,NULL),(2792,'Ikire','NGA','Oyo & Osun',123300,NULL,NULL),(2793,'Makurdi','NGA','Benue',123100,NULL,NULL),(2794,'Lafia','NGA','Plateau & Nassarawa',122500,NULL,NULL),(2795,'Inisa','NGA','Oyo & Osun',119800,NULL,NULL),(2796,'Shagamu','NGA','Ogun',117200,NULL,NULL),(2797,'Awka','NGA','Anambra & Enugu & Eb',111200,NULL,NULL),(2798,'Gombe','NGA','Bauchi & Gombe',107800,NULL,NULL),(2799,'Igboho','NGA','Oyo & Osun',106800,NULL,NULL),(2800,'Ejigbo','NGA','Oyo & Osun',105900,NULL,NULL),(2801,'Agege','NGA','Lagos',105000,NULL,NULL),(2802,'Ise-Ekiti','NGA','Ondo & Ekiti',103400,NULL,NULL),(2803,'Ugep','NGA','Cross River',102600,NULL,NULL),(2804,'Epe','NGA','Lagos',101000,NULL,NULL),(2805,'Alofi','NIU','–',682,NULL,NULL),(2806,'Kingston','NFK','–',800,NULL,NULL),(2807,'Oslo','NOR','Oslo',508726,NULL,NULL),(2808,'Bergen','NOR','Hordaland',230948,NULL,NULL),(2809,'Trondheim','NOR','Sør-Trøndelag',150166,NULL,NULL),(2810,'Stavanger','NOR','Rogaland',108848,NULL,NULL),(2811,'Bærum','NOR','Akershus',101340,NULL,NULL),(2812,'Abidjan','CIV','Abidjan',2500000,NULL,NULL),(2813,'Bouaké','CIV','Bouaké',329850,NULL,NULL),(2814,'Yamoussoukro','CIV','Yamoussoukro',130000,NULL,NULL),(2815,'Daloa','CIV','Daloa',121842,NULL,NULL),(2816,'Korhogo','CIV','Korhogo',109445,NULL,NULL),(2817,'al-Sib','OMN','Masqat',155000,NULL,NULL),(2818,'Salala','OMN','Zufar',131813,NULL,NULL),(2819,'Bawshar','OMN','Masqat',107500,NULL,NULL),(2820,'Suhar','OMN','al-Batina',90814,NULL,NULL),(2821,'Masqat','OMN','Masqat',51969,NULL,NULL),(2822,'Karachi','PAK','Sindh',9269265,NULL,NULL),(2823,'Lahore','PAK','Punjab',5063499,NULL,NULL),(2824,'Faisalabad','PAK','Punjab',1977246,NULL,NULL),(2825,'Rawalpindi','PAK','Punjab',1406214,NULL,NULL),(2826,'Multan','PAK','Punjab',1182441,NULL,NULL),(2827,'Hyderabad','PAK','Sindh',1151274,NULL,NULL),(2828,'Gujranwala','PAK','Punjab',1124749,NULL,NULL),(2829,'Peshawar','PAK','Nothwest Border Prov',988005,NULL,NULL),(2830,'Quetta','PAK','Baluchistan',560307,NULL,NULL),(2831,'Islamabad','PAK','Islamabad',524500,NULL,NULL),(2832,'Sargodha','PAK','Punjab',455360,NULL,NULL),(2833,'Sialkot','PAK','Punjab',417597,NULL,NULL),(2834,'Bahawalpur','PAK','Punjab',403408,NULL,NULL),(2835,'Sukkur','PAK','Sindh',329176,NULL,NULL),(2836,'Jhang','PAK','Punjab',292214,NULL,NULL),(2837,'Sheikhupura','PAK','Punjab',271875,NULL,NULL),(2838,'Larkana','PAK','Sindh',270366,NULL,NULL),(2839,'Gujrat','PAK','Punjab',250121,NULL,NULL),(2840,'Mardan','PAK','Nothwest Border Prov',244511,NULL,NULL),(2841,'Kasur','PAK','Punjab',241649,NULL,NULL),(2842,'Rahim Yar Khan','PAK','Punjab',228479,NULL,NULL),(2843,'Sahiwal','PAK','Punjab',207388,NULL,NULL),(2844,'Okara','PAK','Punjab',200901,NULL,NULL),(2845,'Wah','PAK','Punjab',198400,NULL,NULL),(2846,'Dera Ghazi Khan','PAK','Punjab',188100,NULL,NULL),(2847,'Mirpur Khas','PAK','Sind',184500,NULL,NULL),(2848,'Nawabshah','PAK','Sind',183100,NULL,NULL),(2849,'Mingora','PAK','Nothwest Border Prov',174500,NULL,NULL),(2850,'Chiniot','PAK','Punjab',169300,NULL,NULL),(2851,'Kamoke','PAK','Punjab',151000,NULL,NULL),(2852,'Mandi Burewala','PAK','Punjab',149900,NULL,NULL),(2853,'Jhelum','PAK','Punjab',145800,NULL,NULL),(2854,'Sadiqabad','PAK','Punjab',141500,NULL,NULL),(2855,'Jacobabad','PAK','Sind',137700,NULL,NULL),(2856,'Shikarpur','PAK','Sind',133300,NULL,NULL),(2857,'Khanewal','PAK','Punjab',133000,NULL,NULL),(2858,'Hafizabad','PAK','Punjab',130200,NULL,NULL),(2859,'Kohat','PAK','Nothwest Border Prov',125300,NULL,NULL),(2860,'Muzaffargarh','PAK','Punjab',121600,NULL,NULL),(2861,'Khanpur','PAK','Punjab',117800,NULL,NULL),(2862,'Gojra','PAK','Punjab',115000,NULL,NULL),(2863,'Bahawalnagar','PAK','Punjab',109600,NULL,NULL),(2864,'Muridke','PAK','Punjab',108600,NULL,NULL),(2865,'Pak Pattan','PAK','Punjab',107800,NULL,NULL),(2866,'Abottabad','PAK','Nothwest Border Prov',106000,NULL,NULL),(2867,'Tando Adam','PAK','Sind',103400,NULL,NULL),(2868,'Jaranwala','PAK','Punjab',103300,NULL,NULL),(2869,'Khairpur','PAK','Sind',102200,NULL,NULL),(2870,'Chishtian Mandi','PAK','Punjab',101700,NULL,NULL),(2871,'Daska','PAK','Punjab',101500,NULL,NULL),(2872,'Dadu','PAK','Sind',98600,NULL,NULL),(2873,'Mandi Bahauddin','PAK','Punjab',97300,NULL,NULL),(2874,'Ahmadpur East','PAK','Punjab',96000,NULL,NULL),(2875,'Kamalia','PAK','Punjab',95300,NULL,NULL),(2876,'Khuzdar','PAK','Baluchistan',93100,NULL,NULL),(2877,'Vihari','PAK','Punjab',92300,NULL,NULL),(2878,'Dera Ismail Khan','PAK','Nothwest Border Prov',90400,NULL,NULL),(2879,'Wazirabad','PAK','Punjab',89700,NULL,NULL),(2880,'Nowshera','PAK','Nothwest Border Prov',89400,NULL,NULL),(2881,'Koror','PLW','Koror',12000,NULL,NULL),(2882,'Ciudad de Panamá','PAN','Panamá',471373,NULL,NULL),(2883,'San Miguelito','PAN','San Miguelito',315382,NULL,NULL),(2884,'Port Moresby','PNG','National Capital Dis',247000,NULL,NULL),(2885,'Asunción','PRY','Asunción',557776,NULL,NULL),(2886,'Ciudad del Este','PRY','Alto Paraná',133881,NULL,NULL),(2887,'San Lorenzo','PRY','Central',133395,NULL,NULL),(2888,'Lambaré','PRY','Central',99681,NULL,NULL),(2889,'Fernando de la Mora','PRY','Central',95287,NULL,NULL),(2890,'Lima','PER','Lima',6464693,NULL,NULL),(2891,'Arequipa','PER','Arequipa',762000,NULL,NULL),(2892,'Trujillo','PER','La Libertad',652000,NULL,NULL),(2893,'Chiclayo','PER','Lambayeque',517000,NULL,NULL),(2894,'Callao','PER','Callao',424294,NULL,NULL),(2895,'Iquitos','PER','Loreto',367000,NULL,NULL),(2896,'Chimbote','PER','Ancash',336000,NULL,NULL),(2897,'Huancayo','PER','Junín',327000,NULL,NULL),(2898,'Piura','PER','Piura',325000,NULL,NULL),(2899,'Cusco','PER','Cusco',291000,NULL,NULL),(2900,'Pucallpa','PER','Ucayali',220866,NULL,NULL),(2901,'Tacna','PER','Tacna',215683,NULL,NULL),(2902,'Ica','PER','Ica',194820,NULL,NULL),(2903,'Sullana','PER','Piura',147361,NULL,NULL),(2904,'Juliaca','PER','Puno',142576,NULL,NULL),(2905,'Huánuco','PER','Huanuco',129688,NULL,NULL),(2906,'Ayacucho','PER','Ayacucho',118960,NULL,NULL),(2907,'Chincha Alta','PER','Ica',110016,NULL,NULL),(2908,'Cajamarca','PER','Cajamarca',108009,NULL,NULL),(2909,'Puno','PER','Puno',101578,NULL,NULL),(2910,'Ventanilla','PER','Callao',101056,NULL,NULL),(2911,'Castilla','PER','Piura',90642,NULL,NULL),(2912,'Adamstown','PCN','–',42,NULL,NULL),(2913,'Garapan','MNP','Saipan',9200,NULL,NULL),(2914,'Lisboa','PRT','Lisboa',563210,NULL,NULL),(2915,'Porto','PRT','Porto',273060,NULL,NULL),(2916,'Amadora','PRT','Lisboa',122106,NULL,NULL),(2917,'Coímbra','PRT','Coímbra',96100,NULL,NULL),(2918,'Braga','PRT','Braga',90535,NULL,NULL),(2919,'San Juan','PRI','San Juan',434374,NULL,NULL),(2920,'Bayamón','PRI','Bayamón',224044,NULL,NULL),(2921,'Ponce','PRI','Ponce',186475,NULL,NULL),(2922,'Carolina','PRI','Carolina',186076,NULL,NULL),(2923,'Caguas','PRI','Caguas',140502,NULL,NULL),(2924,'Arecibo','PRI','Arecibo',100131,NULL,NULL),(2925,'Guaynabo','PRI','Guaynabo',100053,NULL,NULL),(2926,'Mayagüez','PRI','Mayagüez',98434,NULL,NULL),(2927,'Toa Baja','PRI','Toa Baja',94085,NULL,NULL),(2928,'Warszawa','POL','Mazowieckie',1615369,NULL,NULL),(2929,'Lódz','POL','Lodzkie',800110,NULL,NULL),(2930,'Kraków','POL','Malopolskie',738150,NULL,NULL),(2931,'Wroclaw','POL','Dolnoslaskie',636765,NULL,NULL),(2932,'Poznan','POL','Wielkopolskie',576899,NULL,NULL),(2933,'Gdansk','POL','Pomorskie',458988,NULL,NULL),(2934,'Szczecin','POL','Zachodnio-Pomorskie',416988,NULL,NULL),(2935,'Bydgoszcz','POL','Kujawsko-Pomorskie',386855,NULL,NULL),(2936,'Lublin','POL','Lubelskie',356251,NULL,NULL),(2937,'Katowice','POL','Slaskie',345934,NULL,NULL),(2938,'Bialystok','POL','Podlaskie',283937,NULL,NULL),(2939,'Czestochowa','POL','Slaskie',257812,NULL,NULL),(2940,'Gdynia','POL','Pomorskie',253521,NULL,NULL),(2941,'Sosnowiec','POL','Slaskie',244102,NULL,NULL),(2942,'Radom','POL','Mazowieckie',232262,NULL,NULL),(2943,'Kielce','POL','Swietokrzyskie',212383,NULL,NULL),(2944,'Gliwice','POL','Slaskie',212164,NULL,NULL),(2945,'Torun','POL','Kujawsko-Pomorskie',206158,NULL,NULL),(2946,'Bytom','POL','Slaskie',205560,NULL,NULL),(2947,'Zabrze','POL','Slaskie',200177,NULL,NULL),(2948,'Bielsko-Biala','POL','Slaskie',180307,NULL,NULL),(2949,'Olsztyn','POL','Warminsko-Mazurskie',170904,NULL,NULL),(2950,'Rzeszów','POL','Podkarpackie',162049,NULL,NULL),(2951,'Ruda Slaska','POL','Slaskie',159665,NULL,NULL),(2952,'Rybnik','POL','Slaskie',144582,NULL,NULL),(2953,'Walbrzych','POL','Dolnoslaskie',136923,NULL,NULL),(2954,'Tychy','POL','Slaskie',133178,NULL,NULL),(2955,'Dabrowa Górnicza','POL','Slaskie',131037,NULL,NULL),(2956,'Plock','POL','Mazowieckie',131011,NULL,NULL),(2957,'Elblag','POL','Warminsko-Mazurskie',129782,NULL,NULL),(2958,'Opole','POL','Opolskie',129553,NULL,NULL),(2959,'Gorzów Wielkopolski','POL','Lubuskie',126019,NULL,NULL),(2960,'Wloclawek','POL','Kujawsko-Pomorskie',123373,NULL,NULL),(2961,'Chorzów','POL','Slaskie',121708,NULL,NULL),(2962,'Tarnów','POL','Malopolskie',121494,NULL,NULL),(2963,'Zielona Góra','POL','Lubuskie',118182,NULL,NULL),(2964,'Koszalin','POL','Zachodnio-Pomorskie',112375,NULL,NULL),(2965,'Legnica','POL','Dolnoslaskie',109335,NULL,NULL),(2966,'Kalisz','POL','Wielkopolskie',106641,NULL,NULL),(2967,'Grudziadz','POL','Kujawsko-Pomorskie',102434,NULL,NULL),(2968,'Slupsk','POL','Pomorskie',102370,NULL,NULL),(2969,'Jastrzebie-Zdrój','POL','Slaskie',102294,NULL,NULL),(2970,'Jaworzno','POL','Slaskie',97929,NULL,NULL),(2971,'Jelenia Góra','POL','Dolnoslaskie',93901,NULL,NULL),(2972,'Malabo','GNQ','Bioko',40000,NULL,NULL),(2973,'Doha','QAT','Doha',355000,NULL,NULL),(2974,'Paris','FRA','Île-de-France',2125246,NULL,NULL),(2975,'Marseille','FRA','Provence-Alpes-Côte',798430,NULL,NULL),(2976,'Lyon','FRA','Rhône-Alpes',445452,NULL,NULL),(2977,'Toulouse','FRA','Midi-Pyrénées',390350,NULL,NULL),(2978,'Nice','FRA','Provence-Alpes-Côte',342738,NULL,NULL),(2979,'Nantes','FRA','Pays de la Loire',270251,NULL,NULL),(2980,'Strasbourg','FRA','Alsace',264115,NULL,NULL),(2981,'Montpellier','FRA','Languedoc-Roussillon',225392,NULL,NULL),(2982,'Bordeaux','FRA','Aquitaine',215363,NULL,NULL),(2983,'Rennes','FRA','Haute-Normandie',206229,NULL,NULL),(2984,'Le Havre','FRA','Champagne-Ardenne',190905,NULL,NULL),(2985,'Reims','FRA','Nord-Pas-de-Calais',187206,NULL,NULL),(2986,'Lille','FRA','Rhône-Alpes',184657,NULL,NULL),(2987,'St-Étienne','FRA','Bretagne',180210,NULL,NULL),(2988,'Toulon','FRA','Provence-Alpes-Côte',160639,NULL,NULL),(2989,'Grenoble','FRA','Rhône-Alpes',153317,NULL,NULL),(2990,'Angers','FRA','Pays de la Loire',151279,NULL,NULL),(2991,'Dijon','FRA','Bourgogne',149867,NULL,NULL),(2992,'Brest','FRA','Bretagne',149634,NULL,NULL),(2993,'Le Mans','FRA','Pays de la Loire',146105,NULL,NULL),(2994,'Clermont-Ferrand','FRA','Auvergne',137140,NULL,NULL),(2995,'Amiens','FRA','Picardie',135501,NULL,NULL),(2996,'Aix-en-Provence','FRA','Provence-Alpes-Côte',134222,NULL,NULL),(2997,'Limoges','FRA','Limousin',133968,NULL,NULL),(2998,'Nîmes','FRA','Languedoc-Roussillon',133424,NULL,NULL),(2999,'Tours','FRA','Centre',132820,NULL,NULL),(3000,'Villeurbanne','FRA','Rhône-Alpes',124215,NULL,NULL),(3001,'Metz','FRA','Lorraine',123776,NULL,NULL),(3002,'Besançon','FRA','Franche-Comté',117733,NULL,NULL),(3003,'Caen','FRA','Basse-Normandie',113987,NULL,NULL),(3004,'Orléans','FRA','Centre',113126,NULL,NULL),(3005,'Mulhouse','FRA','Alsace',110359,NULL,NULL),(3006,'Rouen','FRA','Haute-Normandie',106592,NULL,NULL),(3007,'Boulogne-Billancourt','FRA','Île-de-France',106367,NULL,NULL),(3008,'Perpignan','FRA','Languedoc-Roussillon',105115,NULL,NULL),(3009,'Nancy','FRA','Lorraine',103605,NULL,NULL),(3010,'Roubaix','FRA','Nord-Pas-de-Calais',96984,NULL,NULL),(3011,'Argenteuil','FRA','Île-de-France',93961,NULL,NULL),(3012,'Tourcoing','FRA','Nord-Pas-de-Calais',93540,NULL,NULL),(3013,'Montreuil','FRA','Île-de-France',90674,NULL,NULL),(3014,'Cayenne','GUF','Cayenne',50699,NULL,NULL),(3015,'Faaa','PYF','Tahiti',25888,NULL,NULL),(3016,'Papeete','PYF','Tahiti',25553,NULL,NULL),(3017,'Saint-Denis','REU','Saint-Denis',131480,NULL,NULL),(3018,'Bucuresti','ROM','Bukarest',2016131,NULL,NULL),(3019,'Iasi','ROM','Iasi',348070,NULL,NULL),(3020,'Constanta','ROM','Constanta',342264,NULL,NULL),(3021,'Cluj-Napoca','ROM','Cluj',332498,NULL,NULL),(3022,'Galati','ROM','Galati',330276,NULL,NULL),(3023,'Timisoara','ROM','Timis',324304,NULL,NULL),(3024,'Brasov','ROM','Brasov',314225,NULL,NULL),(3025,'Craiova','ROM','Dolj',313530,NULL,NULL),(3026,'Ploiesti','ROM','Prahova',251348,NULL,NULL),(3027,'Braila','ROM','Braila',233756,NULL,NULL),(3028,'Oradea','ROM','Bihor',222239,NULL,NULL),(3029,'Bacau','ROM','Bacau',209235,NULL,NULL),(3030,'Pitesti','ROM','Arges',187170,NULL,NULL),(3031,'Arad','ROM','Arad',184408,NULL,NULL),(3032,'Sibiu','ROM','Sibiu',169611,NULL,NULL),(3033,'Târgu Mures','ROM','Mures',165153,NULL,NULL),(3034,'Baia Mare','ROM','Maramures',149665,NULL,NULL),(3035,'Buzau','ROM','Buzau',148372,NULL,NULL),(3036,'Satu Mare','ROM','Satu Mare',130059,NULL,NULL),(3037,'Botosani','ROM','Botosani',128730,NULL,NULL),(3038,'Piatra Neamt','ROM','Neamt',125070,NULL,NULL),(3039,'Râmnicu Vâlcea','ROM','Vâlcea',119741,NULL,NULL),(3040,'Suceava','ROM','Suceava',118549,NULL,NULL),(3041,'Drobeta-Turnu Severin','ROM','Mehedinti',117865,NULL,NULL),(3042,'Târgoviste','ROM','Dâmbovita',98980,NULL,NULL),(3043,'Focsani','ROM','Vrancea',98979,NULL,NULL),(3044,'Târgu Jiu','ROM','Gorj',98524,NULL,NULL),(3045,'Tulcea','ROM','Tulcea',96278,NULL,NULL),(3046,'Resita','ROM','Caras-Severin',93976,NULL,NULL),(3047,'Kigali','RWA','Kigali',286000,NULL,NULL),(3048,'Stockholm','SWE','Lisboa',750348,NULL,NULL),(3049,'Gothenburg [Göteborg]','SWE','West Götanmaan län',466990,NULL,NULL),(3050,'Malmö','SWE','Skåne län',259579,NULL,NULL),(3051,'Uppsala','SWE','Uppsala län',189569,NULL,NULL),(3052,'Linköping','SWE','East Götanmaan län',133168,NULL,NULL),(3053,'Västerås','SWE','Västmanlands län',126328,NULL,NULL),(3054,'Örebro','SWE','Örebros län',124207,NULL,NULL),(3055,'Norrköping','SWE','East Götanmaan län',122199,NULL,NULL),(3056,'Helsingborg','SWE','Skåne län',117737,NULL,NULL),(3057,'Jönköping','SWE','Jönköpings län',117095,NULL,NULL),(3058,'Umeå','SWE','Västerbottens län',104512,NULL,NULL),(3059,'Lund','SWE','Skåne län',98948,NULL,NULL),(3060,'Borås','SWE','West Götanmaan län',96883,NULL,NULL),(3061,'Sundsvall','SWE','Västernorrlands län',93126,NULL,NULL),(3062,'Gävle','SWE','Gävleborgs län',90742,NULL,NULL),(3063,'Jamestown','SHN','Saint Helena',1500,NULL,NULL),(3064,'Basseterre','KNA','St George Basseterre',11600,NULL,NULL),(3065,'Castries','LCA','Castries',2301,NULL,NULL),(3066,'Kingstown','VCT','St George',17100,NULL,NULL),(3067,'Saint-Pierre','SPM','Saint-Pierre',5808,NULL,NULL),(3068,'Berlin','DEU','Berliini',3386667,NULL,NULL),(3069,'Hamburg','DEU','Hamburg',1704735,NULL,NULL),(3070,'Munich [München]','DEU','Baijeri',1194560,NULL,NULL),(3071,'Köln','DEU','Nordrhein-Westfalen',962507,NULL,NULL),(3072,'Frankfurt am Main','DEU','Hessen',643821,NULL,NULL),(3073,'Essen','DEU','Nordrhein-Westfalen',599515,NULL,NULL),(3074,'Dortmund','DEU','Nordrhein-Westfalen',590213,NULL,NULL),(3075,'Stuttgart','DEU','Baden-Württemberg',582443,NULL,NULL),(3076,'Düsseldorf','DEU','Nordrhein-Westfalen',568855,NULL,NULL),(3077,'Bremen','DEU','Bremen',540330,NULL,NULL),(3078,'Duisburg','DEU','Nordrhein-Westfalen',519793,NULL,NULL),(3079,'Hannover','DEU','Niedersachsen',514718,NULL,NULL),(3080,'Leipzig','DEU','Saksi',489532,NULL,NULL),(3081,'Nürnberg','DEU','Baijeri',486628,NULL,NULL),(3082,'Dresden','DEU','Saksi',476668,NULL,NULL),(3083,'Bochum','DEU','Nordrhein-Westfalen',392830,NULL,NULL),(3084,'Wuppertal','DEU','Nordrhein-Westfalen',368993,NULL,NULL),(3085,'Bielefeld','DEU','Nordrhein-Westfalen',321125,NULL,NULL),(3086,'Mannheim','DEU','Baden-Württemberg',307730,NULL,NULL),(3087,'Bonn','DEU','Nordrhein-Westfalen',301048,NULL,NULL),(3088,'Gelsenkirchen','DEU','Nordrhein-Westfalen',281979,NULL,NULL),(3089,'Karlsruhe','DEU','Baden-Württemberg',277204,NULL,NULL),(3090,'Wiesbaden','DEU','Hessen',268716,NULL,NULL),(3091,'Münster','DEU','Nordrhein-Westfalen',264670,NULL,NULL),(3092,'Mönchengladbach','DEU','Nordrhein-Westfalen',263697,NULL,NULL),(3093,'Chemnitz','DEU','Saksi',263222,NULL,NULL),(3094,'Augsburg','DEU','Baijeri',254867,NULL,NULL),(3095,'Halle/Saale','DEU','Anhalt Sachsen',254360,NULL,NULL),(3096,'Braunschweig','DEU','Niedersachsen',246322,NULL,NULL),(3097,'Aachen','DEU','Nordrhein-Westfalen',243825,NULL,NULL),(3098,'Krefeld','DEU','Nordrhein-Westfalen',241769,NULL,NULL),(3099,'Magdeburg','DEU','Anhalt Sachsen',235073,NULL,NULL),(3100,'Kiel','DEU','Schleswig-Holstein',233795,NULL,NULL),(3101,'Oberhausen','DEU','Nordrhein-Westfalen',222349,NULL,NULL),(3102,'Lübeck','DEU','Schleswig-Holstein',213326,NULL,NULL),(3103,'Hagen','DEU','Nordrhein-Westfalen',205201,NULL,NULL),(3104,'Rostock','DEU','Mecklenburg-Vorpomme',203279,NULL,NULL),(3105,'Freiburg im Breisgau','DEU','Baden-Württemberg',202455,NULL,NULL),(3106,'Erfurt','DEU','Thüringen',201267,NULL,NULL),(3107,'Kassel','DEU','Hessen',196211,NULL,NULL),(3108,'Saarbrücken','DEU','Saarland',183836,NULL,NULL),(3109,'Mainz','DEU','Rheinland-Pfalz',183134,NULL,NULL),(3110,'Hamm','DEU','Nordrhein-Westfalen',181804,NULL,NULL),(3111,'Herne','DEU','Nordrhein-Westfalen',175661,NULL,NULL),(3112,'Mülheim an der Ruhr','DEU','Nordrhein-Westfalen',173895,NULL,NULL),(3113,'Solingen','DEU','Nordrhein-Westfalen',165583,NULL,NULL),(3114,'Osnabrück','DEU','Niedersachsen',164539,NULL,NULL),(3115,'Ludwigshafen am Rhein','DEU','Rheinland-Pfalz',163771,NULL,NULL),(3116,'Leverkusen','DEU','Nordrhein-Westfalen',160841,NULL,NULL),(3117,'Oldenburg','DEU','Niedersachsen',154125,NULL,NULL),(3118,'Neuss','DEU','Nordrhein-Westfalen',149702,NULL,NULL),(3119,'Heidelberg','DEU','Baden-Württemberg',139672,NULL,NULL),(3120,'Darmstadt','DEU','Hessen',137776,NULL,NULL),(3121,'Paderborn','DEU','Nordrhein-Westfalen',137647,NULL,NULL),(3122,'Potsdam','DEU','Brandenburg',128983,NULL,NULL),(3123,'Würzburg','DEU','Baijeri',127350,NULL,NULL),(3124,'Regensburg','DEU','Baijeri',125236,NULL,NULL),(3125,'Recklinghausen','DEU','Nordrhein-Westfalen',125022,NULL,NULL),(3126,'Göttingen','DEU','Niedersachsen',124775,NULL,NULL),(3127,'Bremerhaven','DEU','Bremen',122735,NULL,NULL),(3128,'Wolfsburg','DEU','Niedersachsen',121954,NULL,NULL),(3129,'Bottrop','DEU','Nordrhein-Westfalen',121097,NULL,NULL),(3130,'Remscheid','DEU','Nordrhein-Westfalen',120125,NULL,NULL),(3131,'Heilbronn','DEU','Baden-Württemberg',119526,NULL,NULL),(3132,'Pforzheim','DEU','Baden-Württemberg',117227,NULL,NULL),(3133,'Offenbach am Main','DEU','Hessen',116627,NULL,NULL),(3134,'Ulm','DEU','Baden-Württemberg',116103,NULL,NULL),(3135,'Ingolstadt','DEU','Baijeri',114826,NULL,NULL),(3136,'Gera','DEU','Thüringen',114718,NULL,NULL),(3137,'Salzgitter','DEU','Niedersachsen',112934,NULL,NULL),(3138,'Cottbus','DEU','Brandenburg',110894,NULL,NULL),(3139,'Reutlingen','DEU','Baden-Württemberg',110343,NULL,NULL),(3140,'Fürth','DEU','Baijeri',109771,NULL,NULL),(3141,'Siegen','DEU','Nordrhein-Westfalen',109225,NULL,NULL),(3142,'Koblenz','DEU','Rheinland-Pfalz',108003,NULL,NULL),(3143,'Moers','DEU','Nordrhein-Westfalen',106837,NULL,NULL),(3144,'Bergisch Gladbach','DEU','Nordrhein-Westfalen',106150,NULL,NULL),(3145,'Zwickau','DEU','Saksi',104146,NULL,NULL),(3146,'Hildesheim','DEU','Niedersachsen',104013,NULL,NULL),(3147,'Witten','DEU','Nordrhein-Westfalen',103384,NULL,NULL),(3148,'Schwerin','DEU','Mecklenburg-Vorpomme',102878,NULL,NULL),(3149,'Erlangen','DEU','Baijeri',100750,NULL,NULL),(3150,'Kaiserslautern','DEU','Rheinland-Pfalz',100025,NULL,NULL),(3151,'Trier','DEU','Rheinland-Pfalz',99891,NULL,NULL),(3152,'Jena','DEU','Thüringen',99779,NULL,NULL),(3153,'Iserlohn','DEU','Nordrhein-Westfalen',99474,NULL,NULL),(3154,'Gütersloh','DEU','Nordrhein-Westfalen',95028,NULL,NULL),(3155,'Marl','DEU','Nordrhein-Westfalen',93735,NULL,NULL),(3156,'Lünen','DEU','Nordrhein-Westfalen',92044,NULL,NULL),(3157,'Düren','DEU','Nordrhein-Westfalen',91092,NULL,NULL),(3158,'Ratingen','DEU','Nordrhein-Westfalen',90951,NULL,NULL),(3159,'Velbert','DEU','Nordrhein-Westfalen',89881,NULL,NULL),(3160,'Esslingen am Neckar','DEU','Baden-Württemberg',89667,NULL,NULL),(3161,'Honiara','SLB','Honiara',50100,NULL,NULL),(3162,'Lusaka','ZMB','Lusaka',1317000,NULL,NULL),(3163,'Ndola','ZMB','Copperbelt',329200,NULL,NULL),(3164,'Kitwe','ZMB','Copperbelt',288600,NULL,NULL),(3165,'Kabwe','ZMB','Central',154300,NULL,NULL),(3166,'Chingola','ZMB','Copperbelt',142400,NULL,NULL),(3167,'Mufulira','ZMB','Copperbelt',123900,NULL,NULL),(3168,'Luanshya','ZMB','Copperbelt',118100,NULL,NULL),(3169,'Apia','WSM','Upolu',35900,NULL,NULL),(3170,'Serravalle','SMR','Serravalle/Dogano',4802,NULL,NULL),(3171,'San Marino','SMR','San Marino',2294,NULL,NULL),(3172,'São Tomé','STP','Aqua Grande',49541,NULL,NULL),(3173,'Riyadh','SAU','Riyadh',3324000,NULL,NULL),(3174,'Jedda','SAU','Mekka',2046300,NULL,NULL),(3175,'Mekka','SAU','Mekka',965700,NULL,NULL),(3176,'Medina','SAU','Medina',608300,NULL,NULL),(3177,'al-Dammam','SAU','al-Sharqiya',482300,NULL,NULL),(3178,'al-Taif','SAU','Mekka',416100,NULL,NULL),(3179,'Tabuk','SAU','Tabuk',292600,NULL,NULL),(3180,'Burayda','SAU','al-Qasim',248600,NULL,NULL),(3181,'al-Hufuf','SAU','al-Sharqiya',225800,NULL,NULL),(3182,'al-Mubarraz','SAU','al-Sharqiya',219100,NULL,NULL),(3183,'Khamis Mushayt','SAU','Asir',217900,NULL,NULL),(3184,'Hail','SAU','Hail',176800,NULL,NULL),(3185,'al-Kharj','SAU','Riad',152100,NULL,NULL),(3186,'al-Khubar','SAU','al-Sharqiya',141700,NULL,NULL),(3187,'Jubayl','SAU','al-Sharqiya',140800,NULL,NULL),(3188,'Hafar al-Batin','SAU','al-Sharqiya',137800,NULL,NULL),(3189,'al-Tuqba','SAU','al-Sharqiya',125700,NULL,NULL),(3190,'Yanbu','SAU','Medina',119800,NULL,NULL),(3191,'Abha','SAU','Asir',112300,NULL,NULL),(3192,'Ara´ar','SAU','al-Khudud al-Samaliy',108100,NULL,NULL),(3193,'al-Qatif','SAU','al-Sharqiya',98900,NULL,NULL),(3194,'al-Hawiya','SAU','Mekka',93900,NULL,NULL),(3195,'Unayza','SAU','Qasim',91100,NULL,NULL),(3196,'Najran','SAU','Najran',91000,NULL,NULL),(3197,'Pikine','SEN','Cap-Vert',855287,NULL,NULL),(3198,'Dakar','SEN','Cap-Vert',785071,NULL,NULL),(3199,'Thiès','SEN','Thiès',248000,NULL,NULL),(3200,'Kaolack','SEN','Kaolack',199000,NULL,NULL),(3201,'Ziguinchor','SEN','Ziguinchor',192000,NULL,NULL),(3202,'Rufisque','SEN','Cap-Vert',150000,NULL,NULL),(3203,'Saint-Louis','SEN','Saint-Louis',132400,NULL,NULL),(3204,'Mbour','SEN','Thiès',109300,NULL,NULL),(3205,'Diourbel','SEN','Diourbel',99400,NULL,NULL),(3206,'Victoria','SYC','Mahé',41000,NULL,NULL),(3207,'Freetown','SLE','Western',850000,NULL,NULL),(3208,'Singapore','SGP','–',4017733,NULL,NULL),(3209,'Bratislava','SVK','Bratislava',448292,NULL,NULL),(3210,'Košice','SVK','Východné Slovensko',241874,NULL,NULL),(3211,'Prešov','SVK','Východné Slovensko',93977,NULL,NULL),(3212,'Ljubljana','SVN','Osrednjeslovenska',270986,NULL,NULL),(3213,'Maribor','SVN','Podravska',115532,NULL,NULL),(3214,'Mogadishu','SOM','Banaadir',997000,NULL,NULL),(3215,'Hargeysa','SOM','Woqooyi Galbeed',90000,NULL,NULL),(3216,'Kismaayo','SOM','Jubbada Hoose',90000,NULL,NULL),(3217,'Colombo','LKA','Western',645000,NULL,NULL),(3218,'Dehiwala','LKA','Western',203000,NULL,NULL),(3219,'Moratuwa','LKA','Western',190000,NULL,NULL),(3220,'Jaffna','LKA','Northern',149000,NULL,NULL),(3221,'Kandy','LKA','Central',140000,NULL,NULL),(3222,'Sri Jayawardenepura Kotte','LKA','Western',118000,NULL,NULL),(3223,'Negombo','LKA','Western',100000,NULL,NULL),(3224,'Omdurman','SDN','Khartum',1271403,NULL,NULL),(3225,'Khartum','SDN','Khartum',947483,NULL,NULL),(3226,'Sharq al-Nil','SDN','Khartum',700887,NULL,NULL),(3227,'Port Sudan','SDN','al-Bahr al-Ahmar',308195,NULL,NULL),(3228,'Kassala','SDN','Kassala',234622,NULL,NULL),(3229,'Obeid','SDN','Kurdufan al-Shamaliy',229425,NULL,NULL),(3230,'Nyala','SDN','Darfur al-Janubiya',227183,NULL,NULL),(3231,'Wad Madani','SDN','al-Jazira',211362,NULL,NULL),(3232,'al-Qadarif','SDN','al-Qadarif',191164,NULL,NULL),(3233,'Kusti','SDN','al-Bahr al-Abyad',173599,NULL,NULL),(3234,'al-Fashir','SDN','Darfur al-Shamaliya',141884,NULL,NULL),(3235,'Juba','SDN','Bahr al-Jabal',114980,NULL,NULL),(3236,'Helsinki [Helsingfors]','FIN','Newmaa',555474,NULL,NULL),(3237,'Espoo','FIN','Newmaa',213271,NULL,NULL),(3238,'Tampere','FIN','Pirkanmaa',195468,NULL,NULL),(3239,'Vantaa','FIN','Newmaa',178471,NULL,NULL),(3240,'Turku [Åbo]','FIN','Varsinais-Suomi',172561,NULL,NULL),(3241,'Oulu','FIN','Pohjois-Pohjanmaa',120753,NULL,NULL),(3242,'Lahti','FIN','Päijät-Häme',96921,NULL,NULL),(3243,'Paramaribo','SUR','Paramaribo',112000,NULL,NULL),(3244,'Mbabane','SWZ','Hhohho',61000,NULL,NULL),(3245,'Zürich','CHE','Zürich',336800,NULL,NULL),(3246,'Geneve','CHE','Geneve',173500,NULL,NULL),(3247,'Basel','CHE','Basel-Stadt',166700,NULL,NULL),(3248,'Bern','CHE','Bern',122700,NULL,NULL),(3249,'Lausanne','CHE','Vaud',114500,NULL,NULL),(3250,'Damascus','SYR','Damascus',1347000,NULL,NULL),(3251,'Aleppo','SYR','Aleppo',1261983,NULL,NULL),(3252,'Hims','SYR','Hims',507404,NULL,NULL),(3253,'Hama','SYR','Hama',343361,NULL,NULL),(3254,'Latakia','SYR','Latakia',264563,NULL,NULL),(3255,'al-Qamishliya','SYR','al-Hasaka',144286,NULL,NULL),(3256,'Dayr al-Zawr','SYR','Dayr al-Zawr',140459,NULL,NULL),(3257,'Jaramana','SYR','Damaskos',138469,NULL,NULL),(3258,'Duma','SYR','Damaskos',131158,NULL,NULL),(3259,'al-Raqqa','SYR','al-Raqqa',108020,NULL,NULL),(3260,'Idlib','SYR','Idlib',91081,NULL,NULL),(3261,'Dushanbe','TJK','Karotegin',524000,NULL,NULL),(3262,'Khujand','TJK','Khujand',161500,NULL,NULL),(3263,'Taipei','TWN','Taipei',2641312,NULL,NULL),(3264,'Kaohsiung','TWN','Kaohsiung',1475505,NULL,NULL),(3265,'Taichung','TWN','Taichung',940589,NULL,NULL),(3266,'Tainan','TWN','Tainan',728060,NULL,NULL),(3267,'Panchiao','TWN','Taipei',523850,NULL,NULL),(3268,'Chungho','TWN','Taipei',392176,NULL,NULL),(3269,'Keelung (Chilung)','TWN','Keelung',385201,NULL,NULL),(3270,'Sanchung','TWN','Taipei',380084,NULL,NULL),(3271,'Hsinchuang','TWN','Taipei',365048,NULL,NULL),(3272,'Hsinchu','TWN','Hsinchu',361958,NULL,NULL),(3273,'Chungli','TWN','Taoyuan',318649,NULL,NULL),(3274,'Fengshan','TWN','Kaohsiung',318562,NULL,NULL),(3275,'Taoyuan','TWN','Taoyuan',316438,NULL,NULL),(3276,'Chiayi','TWN','Chiayi',265109,NULL,NULL),(3277,'Hsintien','TWN','Taipei',263603,NULL,NULL),(3278,'Changhwa','TWN','Changhwa',227715,NULL,NULL),(3279,'Yungho','TWN','Taipei',227700,NULL,NULL),(3280,'Tucheng','TWN','Taipei',224897,NULL,NULL),(3281,'Pingtung','TWN','Pingtung',214727,NULL,NULL),(3282,'Yungkang','TWN','Tainan',193005,NULL,NULL),(3283,'Pingchen','TWN','Taoyuan',188344,NULL,NULL),(3284,'Tali','TWN','Taichung',171940,NULL,NULL),(3285,'Taiping','TWN','',165524,NULL,NULL),(3286,'Pate','TWN','Taoyuan',161700,NULL,NULL),(3287,'Fengyuan','TWN','Taichung',161032,NULL,NULL),(3288,'Luchou','TWN','Taipei',160516,NULL,NULL),(3289,'Hsichuh','TWN','Taipei',154976,NULL,NULL),(3290,'Shulin','TWN','Taipei',151260,NULL,NULL),(3291,'Yuanlin','TWN','Changhwa',126402,NULL,NULL),(3292,'Yangmei','TWN','Taoyuan',126323,NULL,NULL),(3293,'Taliao','TWN','',115897,NULL,NULL),(3294,'Kueishan','TWN','',112195,NULL,NULL),(3295,'Tanshui','TWN','Taipei',111882,NULL,NULL),(3296,'Taitung','TWN','Taitung',111039,NULL,NULL),(3297,'Hualien','TWN','Hualien',108407,NULL,NULL),(3298,'Nantou','TWN','Nantou',104723,NULL,NULL),(3299,'Lungtan','TWN','Taipei',103088,NULL,NULL),(3300,'Touliu','TWN','Yünlin',98900,NULL,NULL),(3301,'Tsaotun','TWN','Nantou',96800,NULL,NULL),(3302,'Kangshan','TWN','Kaohsiung',92200,NULL,NULL),(3303,'Ilan','TWN','Ilan',92000,NULL,NULL),(3304,'Miaoli','TWN','Miaoli',90000,NULL,NULL),(3305,'Dar es Salaam','TZA','Dar es Salaam',1747000,NULL,NULL),(3306,'Dodoma','TZA','Dodoma',189000,NULL,NULL),(3307,'Mwanza','TZA','Mwanza',172300,NULL,NULL),(3308,'Zanzibar','TZA','Zanzibar West',157634,NULL,NULL),(3309,'Tanga','TZA','Tanga',137400,NULL,NULL),(3310,'Mbeya','TZA','Mbeya',130800,NULL,NULL),(3311,'Morogoro','TZA','Morogoro',117800,NULL,NULL),(3312,'Arusha','TZA','Arusha',102500,NULL,NULL),(3313,'Moshi','TZA','Kilimanjaro',96800,NULL,NULL),(3314,'Tabora','TZA','Tabora',92800,NULL,NULL),(3315,'København','DNK','København',495699,NULL,NULL),(3316,'Århus','DNK','Århus',284846,NULL,NULL),(3317,'Odense','DNK','Fyn',183912,NULL,NULL),(3318,'Aalborg','DNK','Nordjylland',161161,NULL,NULL),(3319,'Frederiksberg','DNK','Frederiksberg',90327,NULL,NULL),(3320,'Bangkok','THA','Bangkok',6320174,NULL,NULL),(3321,'Nonthaburi','THA','Nonthaburi',292100,NULL,NULL),(3322,'Nakhon Ratchasima','THA','Nakhon Ratchasima',181400,NULL,NULL),(3323,'Chiang Mai','THA','Chiang Mai',171100,NULL,NULL),(3324,'Udon Thani','THA','Udon Thani',158100,NULL,NULL),(3325,'Hat Yai','THA','Songkhla',148632,NULL,NULL),(3326,'Khon Kaen','THA','Khon Kaen',126500,NULL,NULL),(3327,'Pak Kret','THA','Nonthaburi',126055,NULL,NULL),(3328,'Nakhon Sawan','THA','Nakhon Sawan',123800,NULL,NULL),(3329,'Ubon Ratchathani','THA','Ubon Ratchathani',116300,NULL,NULL),(3330,'Songkhla','THA','Songkhla',94900,NULL,NULL),(3331,'Nakhon Pathom','THA','Nakhon Pathom',94100,NULL,NULL),(3332,'Lomé','TGO','Maritime',375000,NULL,NULL),(3333,'Fakaofo','TKL','Fakaofo',300,NULL,NULL),(3334,'Nuku´alofa','TON','Tongatapu',22400,NULL,NULL),(3335,'Chaguanas','TTO','Caroni',56601,NULL,NULL),(3336,'Port-of-Spain','TTO','Port-of-Spain',43396,NULL,NULL),(3337,'N´Djaména','TCD','Chari-Baguirmi',530965,NULL,NULL),(3338,'Moundou','TCD','Logone Occidental',99500,NULL,NULL),(3339,'Praha','CZE','Hlavní mesto Praha',1181126,NULL,NULL),(3340,'Brno','CZE','Jizní Morava',381862,NULL,NULL),(3341,'Ostrava','CZE','Severní Morava',320041,NULL,NULL),(3342,'Plzen','CZE','Zapadní Cechy',166759,NULL,NULL),(3343,'Olomouc','CZE','Severní Morava',102702,NULL,NULL),(3344,'Liberec','CZE','Severní Cechy',99155,NULL,NULL),(3345,'Ceské Budejovice','CZE','Jizní Cechy',98186,NULL,NULL),(3346,'Hradec Králové','CZE','Východní Cechy',98080,NULL,NULL),(3347,'Ústí nad Labem','CZE','Severní Cechy',95491,NULL,NULL),(3348,'Pardubice','CZE','Východní Cechy',91309,NULL,NULL),(3349,'Tunis','TUN','Tunis',690600,NULL,NULL),(3350,'Sfax','TUN','Sfax',257800,NULL,NULL),(3351,'Ariana','TUN','Ariana',197000,NULL,NULL),(3352,'Ettadhamen','TUN','Ariana',178600,NULL,NULL),(3353,'Sousse','TUN','Sousse',145900,NULL,NULL),(3354,'Kairouan','TUN','Kairouan',113100,NULL,NULL),(3355,'Biserta','TUN','Biserta',108900,NULL,NULL),(3356,'Gabès','TUN','Gabès',106600,NULL,NULL),(3357,'Istanbul','TUR','Istanbul',8787958,NULL,NULL),(3358,'Ankara','TUR','Ankara',3038159,NULL,NULL),(3359,'Izmir','TUR','Izmir',2130359,NULL,NULL),(3360,'Adana','TUR','Adana',1131198,NULL,NULL),(3361,'Bursa','TUR','Bursa',1095842,NULL,NULL),(3362,'Gaziantep','TUR','Gaziantep',789056,NULL,NULL),(3363,'Konya','TUR','Konya',628364,NULL,NULL),(3364,'Mersin (Içel)','TUR','Içel',587212,NULL,NULL),(3365,'Antalya','TUR','Antalya',564914,NULL,NULL),(3366,'Diyarbakir','TUR','Diyarbakir',479884,NULL,NULL),(3367,'Kayseri','TUR','Kayseri',475657,NULL,NULL),(3368,'Eskisehir','TUR','Eskisehir',470781,NULL,NULL),(3369,'Sanliurfa','TUR','Sanliurfa',405905,NULL,NULL),(3370,'Samsun','TUR','Samsun',339871,NULL,NULL),(3371,'Malatya','TUR','Malatya',330312,NULL,NULL),(3372,'Gebze','TUR','Kocaeli',264170,NULL,NULL),(3373,'Denizli','TUR','Denizli',253848,NULL,NULL),(3374,'Sivas','TUR','Sivas',246642,NULL,NULL),(3375,'Erzurum','TUR','Erzurum',246535,NULL,NULL),(3376,'Tarsus','TUR','Adana',246206,NULL,NULL),(3377,'Kahramanmaras','TUR','Kahramanmaras',245772,NULL,NULL),(3378,'Elâzig','TUR','Elâzig',228815,NULL,NULL),(3379,'Van','TUR','Van',219319,NULL,NULL),(3380,'Sultanbeyli','TUR','Istanbul',211068,NULL,NULL),(3381,'Izmit (Kocaeli)','TUR','Kocaeli',210068,NULL,NULL),(3382,'Manisa','TUR','Manisa',207148,NULL,NULL),(3383,'Batman','TUR','Batman',203793,NULL,NULL),(3384,'Balikesir','TUR','Balikesir',196382,NULL,NULL),(3385,'Sakarya (Adapazari)','TUR','Sakarya',190641,NULL,NULL),(3386,'Iskenderun','TUR','Hatay',153022,NULL,NULL),(3387,'Osmaniye','TUR','Osmaniye',146003,NULL,NULL),(3388,'Çorum','TUR','Çorum',145495,NULL,NULL),(3389,'Kütahya','TUR','Kütahya',144761,NULL,NULL),(3390,'Hatay (Antakya)','TUR','Hatay',143982,NULL,NULL),(3391,'Kirikkale','TUR','Kirikkale',142044,NULL,NULL),(3392,'Adiyaman','TUR','Adiyaman',141529,NULL,NULL),(3393,'Trabzon','TUR','Trabzon',138234,NULL,NULL),(3394,'Ordu','TUR','Ordu',133642,NULL,NULL),(3395,'Aydin','TUR','Aydin',128651,NULL,NULL),(3396,'Usak','TUR','Usak',128162,NULL,NULL),(3397,'Edirne','TUR','Edirne',123383,NULL,NULL),(3398,'Çorlu','TUR','Tekirdag',123300,NULL,NULL),(3399,'Isparta','TUR','Isparta',121911,NULL,NULL),(3400,'Karabük','TUR','Karabük',118285,NULL,NULL),(3401,'Kilis','TUR','Kilis',118245,NULL,NULL),(3402,'Alanya','TUR','Antalya',117300,NULL,NULL),(3403,'Kiziltepe','TUR','Mardin',112000,NULL,NULL),(3404,'Zonguldak','TUR','Zonguldak',111542,NULL,NULL),(3405,'Siirt','TUR','Siirt',107100,NULL,NULL),(3406,'Viransehir','TUR','Sanliurfa',106400,NULL,NULL),(3407,'Tekirdag','TUR','Tekirdag',106077,NULL,NULL),(3408,'Karaman','TUR','Karaman',104200,NULL,NULL),(3409,'Afyon','TUR','Afyon',103984,NULL,NULL),(3410,'Aksaray','TUR','Aksaray',102681,NULL,NULL),(3411,'Ceyhan','TUR','Adana',102412,NULL,NULL),(3412,'Erzincan','TUR','Erzincan',102304,NULL,NULL),(3413,'Bismil','TUR','Diyarbakir',101400,NULL,NULL),(3414,'Nazilli','TUR','Aydin',99900,NULL,NULL),(3415,'Tokat','TUR','Tokat',99500,NULL,NULL),(3416,'Kars','TUR','Kars',93000,NULL,NULL),(3417,'Inegöl','TUR','Bursa',90500,NULL,NULL),(3418,'Bandirma','TUR','Balikesir',90200,NULL,NULL),(3419,'Ashgabat','TKM','Ahal',540600,NULL,NULL),(3420,'Chärjew','TKM','Lebap',189200,NULL,NULL),(3421,'Dashhowuz','TKM','Dashhowuz',141800,NULL,NULL),(3422,'Mary','TKM','Mary',101000,NULL,NULL),(3423,'Cockburn Town','TCA','Grand Turk',4800,NULL,NULL),(3424,'Funafuti','TUV','Funafuti',4600,NULL,NULL),(3425,'Kampala','UGA','Central',890800,NULL,NULL),(3426,'Kyiv','UKR','Kiova',2624000,NULL,NULL),(3427,'Harkova [Harkiv]','UKR','Harkova',1500000,NULL,NULL),(3428,'Dnipropetrovsk','UKR','Dnipropetrovsk',1103000,NULL,NULL),(3429,'Donetsk','UKR','Donetsk',1050000,NULL,NULL),(3430,'Odesa','UKR','Odesa',1011000,NULL,NULL),(3431,'Zaporizzja','UKR','Zaporizzja',848000,NULL,NULL),(3432,'Lviv','UKR','Lviv',788000,NULL,NULL),(3433,'Kryvyi Rig','UKR','Dnipropetrovsk',703000,NULL,NULL),(3434,'Mykolajiv','UKR','Mykolajiv',508000,NULL,NULL),(3435,'Mariupol','UKR','Donetsk',490000,NULL,NULL),(3436,'Lugansk','UKR','Lugansk',469000,NULL,NULL),(3437,'Vinnytsja','UKR','Vinnytsja',391000,NULL,NULL),(3438,'Makijivka','UKR','Donetsk',384000,NULL,NULL),(3439,'Herson','UKR','Herson',353000,NULL,NULL),(3440,'Sevastopol','UKR','Krim',348000,NULL,NULL),(3441,'Simferopol','UKR','Krim',339000,NULL,NULL),(3442,'Pultava [Poltava]','UKR','Pultava',313000,NULL,NULL),(3443,'Tšernigiv','UKR','Tšernigiv',313000,NULL,NULL),(3444,'Tšerkasy','UKR','Tšerkasy',309000,NULL,NULL),(3445,'Gorlivka','UKR','Donetsk',299000,NULL,NULL),(3446,'Zytomyr','UKR','Zytomyr',297000,NULL,NULL),(3447,'Sumy','UKR','Sumy',294000,NULL,NULL),(3448,'Dniprodzerzynsk','UKR','Dnipropetrovsk',270000,NULL,NULL),(3449,'Kirovograd','UKR','Kirovograd',265000,NULL,NULL),(3450,'Hmelnytskyi','UKR','Hmelnytskyi',262000,NULL,NULL),(3451,'Tšernivtsi','UKR','Tšernivtsi',259000,NULL,NULL),(3452,'Rivne','UKR','Rivne',245000,NULL,NULL),(3453,'Krementšuk','UKR','Pultava',239000,NULL,NULL),(3454,'Ivano-Frankivsk','UKR','Ivano-Frankivsk',237000,NULL,NULL),(3455,'Ternopil','UKR','Ternopil',236000,NULL,NULL),(3456,'Lutsk','UKR','Volynia',217000,NULL,NULL),(3457,'Bila Tserkva','UKR','Kiova',215000,NULL,NULL),(3458,'Kramatorsk','UKR','Donetsk',186000,NULL,NULL),(3459,'Melitopol','UKR','Zaporizzja',169000,NULL,NULL),(3460,'Kertš','UKR','Krim',162000,NULL,NULL),(3461,'Nikopol','UKR','Dnipropetrovsk',149000,NULL,NULL),(3462,'Berdjansk','UKR','Zaporizzja',130000,NULL,NULL),(3463,'Pavlograd','UKR','Dnipropetrovsk',127000,NULL,NULL),(3464,'Sjeverodonetsk','UKR','Lugansk',127000,NULL,NULL),(3465,'Slovjansk','UKR','Donetsk',127000,NULL,NULL),(3466,'Uzgorod','UKR','Taka-Karpatia',127000,NULL,NULL),(3467,'Altševsk','UKR','Lugansk',119000,NULL,NULL),(3468,'Lysytšansk','UKR','Lugansk',116000,NULL,NULL),(3469,'Jevpatorija','UKR','Krim',112000,NULL,NULL),(3470,'Kamjanets-Podilskyi','UKR','Hmelnytskyi',109000,NULL,NULL),(3471,'Jenakijeve','UKR','Donetsk',105000,NULL,NULL),(3472,'Krasnyi Lutš','UKR','Lugansk',101000,NULL,NULL),(3473,'Stahanov','UKR','Lugansk',101000,NULL,NULL),(3474,'Oleksandrija','UKR','Kirovograd',99000,NULL,NULL),(3475,'Konotop','UKR','Sumy',96000,NULL,NULL),(3476,'Kostjantynivka','UKR','Donetsk',95000,NULL,NULL),(3477,'Berdytšiv','UKR','Zytomyr',90000,NULL,NULL),(3478,'Izmajil','UKR','Odesa',90000,NULL,NULL),(3479,'Šostka','UKR','Sumy',90000,NULL,NULL),(3480,'Uman','UKR','Tšerkasy',90000,NULL,NULL),(3481,'Brovary','UKR','Kiova',89000,NULL,NULL),(3482,'Mukatševe','UKR','Taka-Karpatia',89000,NULL,NULL),(3483,'Budapest','HUN','Budapest',1811552,NULL,NULL),(3484,'Debrecen','HUN','Hajdú-Bihar',203648,NULL,NULL),(3485,'Miskolc','HUN','Borsod-Abaúj-Zemplén',172357,NULL,NULL),(3486,'Szeged','HUN','Csongrád',158158,NULL,NULL),(3487,'Pécs','HUN','Baranya',157332,NULL,NULL),(3488,'Györ','HUN','Györ-Moson-Sopron',127119,NULL,NULL),(3489,'Nyiregyháza','HUN','Szabolcs-Szatmár-Ber',112419,NULL,NULL),(3490,'Kecskemét','HUN','Bács-Kiskun',105606,NULL,NULL),(3491,'Székesfehérvár','HUN','Fejér',105119,NULL,NULL),(3492,'Montevideo','URY','Montevideo',1236000,NULL,NULL),(3493,'Nouméa','NCL','–',76293,NULL,NULL),(3494,'Auckland','NZL','Auckland',381800,NULL,NULL),(3495,'Christchurch','NZL','Canterbury',324200,NULL,NULL),(3496,'Manukau','NZL','Auckland',281800,NULL,NULL),(3497,'North Shore','NZL','Auckland',187700,NULL,NULL),(3498,'Waitakere','NZL','Auckland',170600,NULL,NULL),(3499,'Wellington','NZL','Wellington',166700,NULL,NULL),(3500,'Dunedin','NZL','Dunedin',119600,NULL,NULL),(3501,'Hamilton','NZL','Hamilton',117100,NULL,NULL),(3502,'Lower Hutt','NZL','Wellington',98100,NULL,NULL),(3503,'Toskent','UZB','Toskent Shahri',2117500,NULL,NULL),(3504,'Namangan','UZB','Namangan',370500,NULL,NULL),(3505,'Samarkand','UZB','Samarkand',361800,NULL,NULL),(3506,'Andijon','UZB','Andijon',318600,NULL,NULL),(3507,'Buhoro','UZB','Buhoro',237100,NULL,NULL),(3508,'Karsi','UZB','Qashqadaryo',194100,NULL,NULL),(3509,'Nukus','UZB','Karakalpakistan',194100,NULL,NULL),(3510,'Kükon','UZB','Fargona',190100,NULL,NULL),(3511,'Fargona','UZB','Fargona',180500,NULL,NULL),(3512,'Circik','UZB','Toskent',146400,NULL,NULL),(3513,'Margilon','UZB','Fargona',140800,NULL,NULL),(3514,'Ürgenc','UZB','Khorazm',138900,NULL,NULL),(3515,'Angren','UZB','Toskent',128000,NULL,NULL),(3516,'Cizah','UZB','Cizah',124800,NULL,NULL),(3517,'Navoi','UZB','Navoi',116300,NULL,NULL),(3518,'Olmalik','UZB','Toskent',114900,NULL,NULL),(3519,'Termiz','UZB','Surkhondaryo',109500,NULL,NULL),(3520,'Minsk','BLR','Horad Minsk',1674000,NULL,NULL),(3521,'Gomel','BLR','Gomel',475000,NULL,NULL),(3522,'Mogiljov','BLR','Mogiljov',356000,NULL,NULL),(3523,'Vitebsk','BLR','Vitebsk',340000,NULL,NULL),(3524,'Grodno','BLR','Grodno',302000,NULL,NULL),(3525,'Brest','BLR','Brest',286000,NULL,NULL),(3526,'Bobruisk','BLR','Mogiljov',221000,NULL,NULL),(3527,'Baranovitši','BLR','Brest',167000,NULL,NULL),(3528,'Borisov','BLR','Minsk',151000,NULL,NULL),(3529,'Pinsk','BLR','Brest',130000,NULL,NULL),(3530,'Orša','BLR','Vitebsk',124000,NULL,NULL),(3531,'Mozyr','BLR','Gomel',110000,NULL,NULL),(3532,'Novopolotsk','BLR','Vitebsk',106000,NULL,NULL),(3533,'Lida','BLR','Grodno',101000,NULL,NULL),(3534,'Soligorsk','BLR','Minsk',101000,NULL,NULL),(3535,'Molodetšno','BLR','Minsk',97000,NULL,NULL),(3536,'Mata-Utu','WLF','Wallis',1137,NULL,NULL),(3537,'Port-Vila','VUT','Shefa',33700,NULL,NULL),(3538,'Città del Vaticano','VAT','–',455,NULL,NULL),(3539,'Caracas','VEN','Distrito Federal',1975294,NULL,NULL),(3540,'Maracaíbo','VEN','Zulia',1304776,NULL,NULL),(3541,'Barquisimeto','VEN','Lara',877239,NULL,NULL),(3542,'Valencia','VEN','Carabobo',794246,NULL,NULL),(3543,'Ciudad Guayana','VEN','Bolívar',663713,NULL,NULL),(3544,'Petare','VEN','Miranda',488868,NULL,NULL),(3545,'Maracay','VEN','Aragua',444443,NULL,NULL),(3546,'Barcelona','VEN','Anzoátegui',322267,NULL,NULL),(3547,'Maturín','VEN','Monagas',319726,NULL,NULL),(3548,'San Cristóbal','VEN','Táchira',319373,NULL,NULL),(3549,'Ciudad Bolívar','VEN','Bolívar',301107,NULL,NULL),(3550,'Cumaná','VEN','Sucre',293105,NULL,NULL),(3551,'Mérida','VEN','Mérida',224887,NULL,NULL),(3552,'Cabimas','VEN','Zulia',221329,NULL,NULL),(3553,'Barinas','VEN','Barinas',217831,NULL,NULL),(3554,'Turmero','VEN','Aragua',217499,NULL,NULL),(3555,'Baruta','VEN','Miranda',207290,NULL,NULL),(3556,'Puerto Cabello','VEN','Carabobo',187722,NULL,NULL),(3557,'Santa Ana de Coro','VEN','Falcón',185766,NULL,NULL),(3558,'Los Teques','VEN','Miranda',178784,NULL,NULL),(3559,'Punto Fijo','VEN','Falcón',167215,NULL,NULL),(3560,'Guarenas','VEN','Miranda',165889,NULL,NULL),(3561,'Acarigua','VEN','Portuguesa',158954,NULL,NULL),(3562,'Puerto La Cruz','VEN','Anzoátegui',155700,NULL,NULL),(3563,'Ciudad Losada','VEN','',134501,NULL,NULL),(3564,'Guacara','VEN','Carabobo',131334,NULL,NULL),(3565,'Valera','VEN','Trujillo',130281,NULL,NULL),(3566,'Guanare','VEN','Portuguesa',125621,NULL,NULL),(3567,'Carúpano','VEN','Sucre',119639,NULL,NULL),(3568,'Catia La Mar','VEN','Distrito Federal',117012,NULL,NULL),(3569,'El Tigre','VEN','Anzoátegui',116256,NULL,NULL),(3570,'Guatire','VEN','Miranda',109121,NULL,NULL),(3571,'Calabozo','VEN','Guárico',107146,NULL,NULL),(3572,'Pozuelos','VEN','Anzoátegui',105690,NULL,NULL),(3573,'Ciudad Ojeda','VEN','Zulia',99354,NULL,NULL),(3574,'Ocumare del Tuy','VEN','Miranda',97168,NULL,NULL),(3575,'Valle de la Pascua','VEN','Guárico',95927,NULL,NULL),(3576,'Araure','VEN','Portuguesa',94269,NULL,NULL),(3577,'San Fernando de Apure','VEN','Apure',93809,NULL,NULL),(3578,'San Felipe','VEN','Yaracuy',90940,NULL,NULL),(3579,'El Limón','VEN','Aragua',90000,NULL,NULL),(3580,'Moscow','RUS','Moscow (City)',8389200,NULL,NULL),(3581,'St Petersburg','RUS','Pietari',4694000,NULL,NULL),(3582,'Novosibirsk','RUS','Novosibirsk',1398800,NULL,NULL),(3583,'Nizni Novgorod','RUS','Nizni Novgorod',1357000,NULL,NULL),(3584,'Jekaterinburg','RUS','Sverdlovsk',1266300,NULL,NULL),(3585,'Samara','RUS','Samara',1156100,NULL,NULL),(3586,'Omsk','RUS','Omsk',1148900,NULL,NULL),(3587,'Kazan','RUS','Tatarstan',1101000,NULL,NULL),(3588,'Ufa','RUS','Baškortostan',1091200,NULL,NULL),(3589,'Tšeljabinsk','RUS','Tšeljabinsk',1083200,NULL,NULL),(3590,'Rostov-na-Donu','RUS','Rostov-na-Donu',1012700,NULL,NULL),(3591,'Perm','RUS','Perm',1009700,NULL,NULL),(3592,'Volgograd','RUS','Volgograd',993400,NULL,NULL),(3593,'Voronez','RUS','Voronez',907700,NULL,NULL),(3594,'Krasnojarsk','RUS','Krasnojarsk',875500,NULL,NULL),(3595,'Saratov','RUS','Saratov',874000,NULL,NULL),(3596,'Toljatti','RUS','Samara',722900,NULL,NULL),(3597,'Uljanovsk','RUS','Uljanovsk',667400,NULL,NULL),(3598,'Izevsk','RUS','Udmurtia',652800,NULL,NULL),(3599,'Krasnodar','RUS','Krasnodar',639000,NULL,NULL),(3600,'Jaroslavl','RUS','Jaroslavl',616700,NULL,NULL),(3601,'Habarovsk','RUS','Habarovsk',609400,NULL,NULL),(3602,'Vladivostok','RUS','Primorje',606200,NULL,NULL),(3603,'Irkutsk','RUS','Irkutsk',593700,NULL,NULL),(3604,'Barnaul','RUS','Altai',580100,NULL,NULL),(3605,'Novokuznetsk','RUS','Kemerovo',561600,NULL,NULL),(3606,'Penza','RUS','Penza',532200,NULL,NULL),(3607,'Rjazan','RUS','Rjazan',529900,NULL,NULL),(3608,'Orenburg','RUS','Orenburg',523600,NULL,NULL),(3609,'Lipetsk','RUS','Lipetsk',521000,NULL,NULL),(3610,'Nabereznyje Tšelny','RUS','Tatarstan',514700,NULL,NULL),(3611,'Tula','RUS','Tula',506100,NULL,NULL),(3612,'Tjumen','RUS','Tjumen',503400,NULL,NULL),(3613,'Kemerovo','RUS','Kemerovo',492700,NULL,NULL),(3614,'Astrahan','RUS','Astrahan',486100,NULL,NULL),(3615,'Tomsk','RUS','Tomsk',482100,NULL,NULL),(3616,'Kirov','RUS','Kirov',466200,NULL,NULL),(3617,'Ivanovo','RUS','Ivanovo',459200,NULL,NULL),(3618,'Tšeboksary','RUS','Tšuvassia',459200,NULL,NULL),(3619,'Brjansk','RUS','Brjansk',457400,NULL,NULL),(3620,'Tver','RUS','Tver',454900,NULL,NULL),(3621,'Kursk','RUS','Kursk',443500,NULL,NULL),(3622,'Magnitogorsk','RUS','Tšeljabinsk',427900,NULL,NULL),(3623,'Kaliningrad','RUS','Kaliningrad',424400,NULL,NULL),(3624,'Nizni Tagil','RUS','Sverdlovsk',390900,NULL,NULL),(3625,'Murmansk','RUS','Murmansk',376300,NULL,NULL),(3626,'Ulan-Ude','RUS','Burjatia',370400,NULL,NULL),(3627,'Kurgan','RUS','Kurgan',364700,NULL,NULL),(3628,'Arkangeli','RUS','Arkangeli',361800,NULL,NULL),(3629,'Sotši','RUS','Krasnodar',358600,NULL,NULL),(3630,'Smolensk','RUS','Smolensk',353400,NULL,NULL),(3631,'Orjol','RUS','Orjol',344500,NULL,NULL),(3632,'Stavropol','RUS','Stavropol',343300,NULL,NULL),(3633,'Belgorod','RUS','Belgorod',342000,NULL,NULL),(3634,'Kaluga','RUS','Kaluga',339300,NULL,NULL),(3635,'Vladimir','RUS','Vladimir',337100,NULL,NULL),(3636,'Mahatškala','RUS','Dagestan',332800,NULL,NULL),(3637,'Tšerepovets','RUS','Vologda',324400,NULL,NULL),(3638,'Saransk','RUS','Mordva',314800,NULL,NULL),(3639,'Tambov','RUS','Tambov',312000,NULL,NULL),(3640,'Vladikavkaz','RUS','North Ossetia-Alania',310100,NULL,NULL),(3641,'Tšita','RUS','Tšita',309900,NULL,NULL),(3642,'Vologda','RUS','Vologda',302500,NULL,NULL),(3643,'Veliki Novgorod','RUS','Novgorod',299500,NULL,NULL),(3644,'Komsomolsk-na-Amure','RUS','Habarovsk',291600,NULL,NULL),(3645,'Kostroma','RUS','Kostroma',288100,NULL,NULL),(3646,'Volzski','RUS','Volgograd',286900,NULL,NULL),(3647,'Taganrog','RUS','Rostov-na-Donu',284400,NULL,NULL),(3648,'Petroskoi','RUS','Karjala',282100,NULL,NULL),(3649,'Bratsk','RUS','Irkutsk',277600,NULL,NULL),(3650,'Dzerzinsk','RUS','Nizni Novgorod',277100,NULL,NULL),(3651,'Surgut','RUS','Hanti-Mansia',274900,NULL,NULL),(3652,'Orsk','RUS','Orenburg',273900,NULL,NULL),(3653,'Sterlitamak','RUS','Baškortostan',265200,NULL,NULL),(3654,'Angarsk','RUS','Irkutsk',264700,NULL,NULL),(3655,'Joškar-Ola','RUS','Marinmaa',249200,NULL,NULL),(3656,'Rybinsk','RUS','Jaroslavl',239600,NULL,NULL),(3657,'Prokopjevsk','RUS','Kemerovo',237300,NULL,NULL),(3658,'Niznevartovsk','RUS','Hanti-Mansia',233900,NULL,NULL),(3659,'Naltšik','RUS','Kabardi-Balkaria',233400,NULL,NULL),(3660,'Syktyvkar','RUS','Komi',229700,NULL,NULL),(3661,'Severodvinsk','RUS','Arkangeli',229300,NULL,NULL),(3662,'Bijsk','RUS','Altai',225000,NULL,NULL),(3663,'Niznekamsk','RUS','Tatarstan',223400,NULL,NULL),(3664,'Blagoveštšensk','RUS','Amur',222000,NULL,NULL),(3665,'Šahty','RUS','Rostov-na-Donu',221800,NULL,NULL),(3666,'Staryi Oskol','RUS','Belgorod',213800,NULL,NULL),(3667,'Zelenograd','RUS','Moscow (City)',207100,NULL,NULL),(3668,'Balakovo','RUS','Saratov',206000,NULL,NULL),(3669,'Novorossijsk','RUS','Krasnodar',203300,NULL,NULL),(3670,'Pihkova','RUS','Pihkova',201500,NULL,NULL),(3671,'Zlatoust','RUS','Tšeljabinsk',196900,NULL,NULL),(3672,'Jakutsk','RUS','Saha (Jakutia)',195400,NULL,NULL),(3673,'Podolsk','RUS','Moskova',194300,NULL,NULL),(3674,'Petropavlovsk-Kamtšatski','RUS','Kamtšatka',194100,NULL,NULL),(3675,'Kamensk-Uralski','RUS','Sverdlovsk',190600,NULL,NULL),(3676,'Engels','RUS','Saratov',189000,NULL,NULL),(3677,'Syzran','RUS','Samara',186900,NULL,NULL),(3678,'Grozny','RUS','Tšetšenia',186000,NULL,NULL),(3679,'Novotšerkassk','RUS','Rostov-na-Donu',184400,NULL,NULL),(3680,'Berezniki','RUS','Perm',181900,NULL,NULL),(3681,'Juzno-Sahalinsk','RUS','Sahalin',179200,NULL,NULL),(3682,'Volgodonsk','RUS','Rostov-na-Donu',178200,NULL,NULL),(3683,'Abakan','RUS','Hakassia',169200,NULL,NULL),(3684,'Maikop','RUS','Adygea',167300,NULL,NULL),(3685,'Miass','RUS','Tšeljabinsk',166200,NULL,NULL),(3686,'Armavir','RUS','Krasnodar',164900,NULL,NULL),(3687,'Ljubertsy','RUS','Moskova',163900,NULL,NULL),(3688,'Rubtsovsk','RUS','Altai',162600,NULL,NULL),(3689,'Kovrov','RUS','Vladimir',159900,NULL,NULL),(3690,'Nahodka','RUS','Primorje',157700,NULL,NULL),(3691,'Ussurijsk','RUS','Primorje',157300,NULL,NULL),(3692,'Salavat','RUS','Baškortostan',156800,NULL,NULL),(3693,'Mytištši','RUS','Moskova',155700,NULL,NULL),(3694,'Kolomna','RUS','Moskova',150700,NULL,NULL),(3695,'Elektrostal','RUS','Moskova',147000,NULL,NULL),(3696,'Murom','RUS','Vladimir',142400,NULL,NULL),(3697,'Kolpino','RUS','Pietari',141200,NULL,NULL),(3698,'Norilsk','RUS','Krasnojarsk',140800,NULL,NULL),(3699,'Almetjevsk','RUS','Tatarstan',140700,NULL,NULL),(3700,'Novomoskovsk','RUS','Tula',138100,NULL,NULL),(3701,'Dimitrovgrad','RUS','Uljanovsk',137000,NULL,NULL),(3702,'Pervouralsk','RUS','Sverdlovsk',136100,NULL,NULL),(3703,'Himki','RUS','Moskova',133700,NULL,NULL),(3704,'Balašiha','RUS','Moskova',132900,NULL,NULL),(3705,'Nevinnomyssk','RUS','Stavropol',132600,NULL,NULL),(3706,'Pjatigorsk','RUS','Stavropol',132500,NULL,NULL),(3707,'Korolev','RUS','Moskova',132400,NULL,NULL),(3708,'Serpuhov','RUS','Moskova',132000,NULL,NULL),(3709,'Odintsovo','RUS','Moskova',127400,NULL,NULL),(3710,'Orehovo-Zujevo','RUS','Moskova',124900,NULL,NULL),(3711,'Kamyšin','RUS','Volgograd',124600,NULL,NULL),(3712,'Novotšeboksarsk','RUS','Tšuvassia',123400,NULL,NULL),(3713,'Tšerkessk','RUS','Karatšai-Tšerkessia',121700,NULL,NULL),(3714,'Atšinsk','RUS','Krasnojarsk',121600,NULL,NULL),(3715,'Magadan','RUS','Magadan',121000,NULL,NULL),(3716,'Mitšurinsk','RUS','Tambov',120700,NULL,NULL),(3717,'Kislovodsk','RUS','Stavropol',120400,NULL,NULL),(3718,'Jelets','RUS','Lipetsk',119400,NULL,NULL),(3719,'Seversk','RUS','Tomsk',118600,NULL,NULL),(3720,'Noginsk','RUS','Moskova',117200,NULL,NULL),(3721,'Velikije Luki','RUS','Pihkova',116300,NULL,NULL),(3722,'Novokuibyševsk','RUS','Samara',116200,NULL,NULL),(3723,'Neftekamsk','RUS','Baškortostan',115700,NULL,NULL),(3724,'Leninsk-Kuznetski','RUS','Kemerovo',113800,NULL,NULL),(3725,'Oktjabrski','RUS','Baškortostan',111500,NULL,NULL),(3726,'Sergijev Posad','RUS','Moskova',111100,NULL,NULL),(3727,'Arzamas','RUS','Nizni Novgorod',110700,NULL,NULL),(3728,'Kiseljovsk','RUS','Kemerovo',110000,NULL,NULL),(3729,'Novotroitsk','RUS','Orenburg',109600,NULL,NULL),(3730,'Obninsk','RUS','Kaluga',108300,NULL,NULL),(3731,'Kansk','RUS','Krasnojarsk',107400,NULL,NULL),(3732,'Glazov','RUS','Udmurtia',106300,NULL,NULL),(3733,'Solikamsk','RUS','Perm',106000,NULL,NULL),(3734,'Sarapul','RUS','Udmurtia',105700,NULL,NULL),(3735,'Ust-Ilimsk','RUS','Irkutsk',105200,NULL,NULL),(3736,'Štšolkovo','RUS','Moskova',104900,NULL,NULL),(3737,'Mezduretšensk','RUS','Kemerovo',104400,NULL,NULL),(3738,'Usolje-Sibirskoje','RUS','Irkutsk',103500,NULL,NULL),(3739,'Elista','RUS','Kalmykia',103300,NULL,NULL),(3740,'Novošahtinsk','RUS','Rostov-na-Donu',101900,NULL,NULL),(3741,'Votkinsk','RUS','Udmurtia',101700,NULL,NULL),(3742,'Kyzyl','RUS','Tyva',101100,NULL,NULL),(3743,'Serov','RUS','Sverdlovsk',100400,NULL,NULL),(3744,'Zelenodolsk','RUS','Tatarstan',100200,NULL,NULL),(3745,'Zeleznodoroznyi','RUS','Moskova',100100,NULL,NULL),(3746,'Kinešma','RUS','Ivanovo',100000,NULL,NULL),(3747,'Kuznetsk','RUS','Penza',98200,NULL,NULL),(3748,'Uhta','RUS','Komi',98000,NULL,NULL),(3749,'Jessentuki','RUS','Stavropol',97900,NULL,NULL),(3750,'Tobolsk','RUS','Tjumen',97600,NULL,NULL),(3751,'Neftejugansk','RUS','Hanti-Mansia',97400,NULL,NULL),(3752,'Bataisk','RUS','Rostov-na-Donu',97300,NULL,NULL),(3753,'Nojabrsk','RUS','Yamalin Nenetsia',97300,NULL,NULL),(3754,'Balašov','RUS','Saratov',97100,NULL,NULL),(3755,'Zeleznogorsk','RUS','Kursk',96900,NULL,NULL),(3756,'Zukovski','RUS','Moskova',96500,NULL,NULL),(3757,'Anzero-Sudzensk','RUS','Kemerovo',96100,NULL,NULL),(3758,'Bugulma','RUS','Tatarstan',94100,NULL,NULL),(3759,'Zeleznogorsk','RUS','Krasnojarsk',94000,NULL,NULL),(3760,'Novouralsk','RUS','Sverdlovsk',93300,NULL,NULL),(3761,'Puškin','RUS','Pietari',92900,NULL,NULL),(3762,'Vorkuta','RUS','Komi',92600,NULL,NULL),(3763,'Derbent','RUS','Dagestan',92300,NULL,NULL),(3764,'Kirovo-Tšepetsk','RUS','Kirov',91600,NULL,NULL),(3765,'Krasnogorsk','RUS','Moskova',91000,NULL,NULL),(3766,'Klin','RUS','Moskova',90000,NULL,NULL),(3767,'Tšaikovski','RUS','Perm',90000,NULL,NULL),(3768,'Novyi Urengoi','RUS','Yamalin Nenetsia',89800,NULL,NULL),(3769,'Ho Chi Minh City','VNM','Ho Chi Minh City',3980000,NULL,NULL),(3770,'Hanoi','VNM','Hanoi',1410000,NULL,NULL),(3771,'Haiphong','VNM','Haiphong',783133,NULL,NULL),(3772,'Da Nang','VNM','Quang Nam-Da Nang',382674,NULL,NULL),(3773,'Biên Hoa','VNM','Dong Nai',282095,NULL,NULL),(3774,'Nha Trang','VNM','Khanh Hoa',221331,NULL,NULL),(3775,'Hue','VNM','Thua Thien-Hue',219149,NULL,NULL),(3776,'Can Tho','VNM','Can Tho',215587,NULL,NULL),(3777,'Cam Pha','VNM','Quang Binh',209086,NULL,NULL),(3778,'Nam Dinh','VNM','Nam Ha',171699,NULL,NULL),(3779,'Quy Nhon','VNM','Binh Dinh',163385,NULL,NULL),(3780,'Vung Tau','VNM','Ba Ria-Vung Tau',145145,NULL,NULL),(3781,'Rach Gia','VNM','Kien Giang',141132,NULL,NULL),(3782,'Long Xuyen','VNM','An Giang',132681,NULL,NULL),(3783,'Thai Nguyen','VNM','Bac Thai',127643,NULL,NULL),(3784,'Hong Gai','VNM','Quang Ninh',127484,NULL,NULL),(3785,'Phan Thiêt','VNM','Binh Thuan',114236,NULL,NULL),(3786,'Cam Ranh','VNM','Khanh Hoa',114041,NULL,NULL),(3787,'Vinh','VNM','Nghe An',112455,NULL,NULL),(3788,'My Tho','VNM','Tien Giang',108404,NULL,NULL),(3789,'Da Lat','VNM','Lam Dong',106409,NULL,NULL),(3790,'Buon Ma Thuot','VNM','Dac Lac',97044,NULL,NULL),(3791,'Tallinn','EST','Harjumaa',403981,NULL,NULL),(3792,'Tartu','EST','Tartumaa',101246,NULL,NULL),(3793,'New York','USA','New York',8008278,NULL,NULL),(3794,'Los Angeles','USA','California',3694820,NULL,NULL),(3795,'Chicago','USA','Illinois',2896016,NULL,NULL),(3796,'Houston','USA','Texas',1953631,NULL,NULL),(3797,'Philadelphia','USA','Pennsylvania',1517550,NULL,NULL),(3798,'Phoenix','USA','Arizona',1321045,NULL,NULL),(3799,'San Diego','USA','California',1223400,NULL,NULL),(3800,'Dallas','USA','Texas',1188580,NULL,NULL),(3801,'San Antonio','USA','Texas',1144646,NULL,NULL),(3802,'Detroit','USA','Michigan',951270,NULL,NULL),(3803,'San Jose','USA','California',894943,NULL,NULL),(3804,'Indianapolis','USA','Indiana',791926,NULL,NULL),(3805,'San Francisco','USA','California',776733,NULL,NULL),(3806,'Jacksonville','USA','Florida',735167,NULL,NULL),(3807,'Columbus','USA','Ohio',711470,NULL,NULL),(3808,'Austin','USA','Texas',656562,NULL,NULL),(3809,'Baltimore','USA','Maryland',651154,NULL,NULL),(3810,'Memphis','USA','Tennessee',650100,NULL,NULL),(3811,'Milwaukee','USA','Wisconsin',596974,NULL,NULL),(3812,'Boston','USA','Massachusetts',589141,NULL,NULL),(3813,'Washington','USA','District of Columbia',572059,NULL,NULL),(3814,'Nashville-Davidson','USA','Tennessee',569891,NULL,NULL),(3815,'El Paso','USA','Texas',563662,NULL,NULL),(3816,'Seattle','USA','Washington',563374,NULL,NULL),(3817,'Denver','USA','Colorado',554636,NULL,NULL),(3818,'Charlotte','USA','North Carolina',540828,NULL,NULL),(3819,'Fort Worth','USA','Texas',534694,NULL,NULL),(3820,'Portland','USA','Oregon',529121,NULL,NULL),(3821,'Oklahoma City','USA','Oklahoma',506132,NULL,NULL),(3822,'Tucson','USA','Arizona',486699,NULL,NULL),(3823,'New Orleans','USA','Louisiana',484674,NULL,NULL),(3824,'Las Vegas','USA','Nevada',478434,NULL,NULL),(3825,'Cleveland','USA','Ohio',478403,NULL,NULL),(3826,'Long Beach','USA','California',461522,NULL,NULL),(3827,'Albuquerque','USA','New Mexico',448607,NULL,NULL),(3828,'Kansas City','USA','Missouri',441545,NULL,NULL),(3829,'Fresno','USA','California',427652,NULL,NULL),(3830,'Virginia Beach','USA','Virginia',425257,NULL,NULL),(3831,'Atlanta','USA','Georgia',416474,NULL,NULL),(3832,'Sacramento','USA','California',407018,NULL,NULL),(3833,'Oakland','USA','California',399484,NULL,NULL),(3834,'Mesa','USA','Arizona',396375,NULL,NULL),(3835,'Tulsa','USA','Oklahoma',393049,NULL,NULL),(3836,'Omaha','USA','Nebraska',390007,NULL,NULL),(3837,'Minneapolis','USA','Minnesota',382618,NULL,NULL),(3838,'Honolulu','USA','Hawaii',371657,NULL,NULL),(3839,'Miami','USA','Florida',362470,NULL,NULL),(3840,'Colorado Springs','USA','Colorado',360890,NULL,NULL),(3841,'Saint Louis','USA','Missouri',348189,NULL,NULL),(3842,'Wichita','USA','Kansas',344284,NULL,NULL),(3843,'Santa Ana','USA','California',337977,NULL,NULL),(3844,'Pittsburgh','USA','Pennsylvania',334563,NULL,NULL),(3845,'Arlington','USA','Texas',332969,NULL,NULL),(3846,'Cincinnati','USA','Ohio',331285,NULL,NULL),(3847,'Anaheim','USA','California',328014,NULL,NULL),(3848,'Toledo','USA','Ohio',313619,NULL,NULL),(3849,'Tampa','USA','Florida',303447,NULL,NULL),(3850,'Buffalo','USA','New York',292648,NULL,NULL),(3851,'Saint Paul','USA','Minnesota',287151,NULL,NULL),(3852,'Corpus Christi','USA','Texas',277454,NULL,NULL),(3853,'Aurora','USA','Colorado',276393,NULL,NULL),(3854,'Raleigh','USA','North Carolina',276093,NULL,NULL),(3855,'Newark','USA','New Jersey',273546,NULL,NULL),(3856,'Lexington-Fayette','USA','Kentucky',260512,NULL,NULL),(3857,'Anchorage','USA','Alaska',260283,NULL,NULL),(3858,'Louisville','USA','Kentucky',256231,NULL,NULL),(3859,'Riverside','USA','California',255166,NULL,NULL),(3860,'Saint Petersburg','USA','Florida',248232,NULL,NULL),(3861,'Bakersfield','USA','California',247057,NULL,NULL),(3862,'Stockton','USA','California',243771,NULL,NULL),(3863,'Birmingham','USA','Alabama',242820,NULL,NULL),(3864,'Jersey City','USA','New Jersey',240055,NULL,NULL),(3865,'Norfolk','USA','Virginia',234403,NULL,NULL),(3866,'Baton Rouge','USA','Louisiana',227818,NULL,NULL),(3867,'Hialeah','USA','Florida',226419,NULL,NULL),(3868,'Lincoln','USA','Nebraska',225581,NULL,NULL),(3869,'Greensboro','USA','North Carolina',223891,NULL,NULL),(3870,'Plano','USA','Texas',222030,NULL,NULL),(3871,'Rochester','USA','New York',219773,NULL,NULL),(3872,'Glendale','USA','Arizona',218812,NULL,NULL),(3873,'Akron','USA','Ohio',217074,NULL,NULL),(3874,'Garland','USA','Texas',215768,NULL,NULL),(3875,'Madison','USA','Wisconsin',208054,NULL,NULL),(3876,'Fort Wayne','USA','Indiana',205727,NULL,NULL),(3877,'Fremont','USA','California',203413,NULL,NULL),(3878,'Scottsdale','USA','Arizona',202705,NULL,NULL),(3879,'Montgomery','USA','Alabama',201568,NULL,NULL),(3880,'Shreveport','USA','Louisiana',200145,NULL,NULL),(3881,'Augusta-Richmond County','USA','Georgia',199775,NULL,NULL),(3882,'Lubbock','USA','Texas',199564,NULL,NULL),(3883,'Chesapeake','USA','Virginia',199184,NULL,NULL),(3884,'Mobile','USA','Alabama',198915,NULL,NULL),(3885,'Des Moines','USA','Iowa',198682,NULL,NULL),(3886,'Grand Rapids','USA','Michigan',197800,NULL,NULL),(3887,'Richmond','USA','Virginia',197790,NULL,NULL),(3888,'Yonkers','USA','New York',196086,NULL,NULL),(3889,'Spokane','USA','Washington',195629,NULL,NULL),(3890,'Glendale','USA','California',194973,NULL,NULL),(3891,'Tacoma','USA','Washington',193556,NULL,NULL),(3892,'Irving','USA','Texas',191615,NULL,NULL),(3893,'Huntington Beach','USA','California',189594,NULL,NULL),(3894,'Modesto','USA','California',188856,NULL,NULL),(3895,'Durham','USA','North Carolina',187035,NULL,NULL),(3896,'Columbus','USA','Georgia',186291,NULL,NULL),(3897,'Orlando','USA','Florida',185951,NULL,NULL),(3898,'Boise City','USA','Idaho',185787,NULL,NULL),(3899,'Winston-Salem','USA','North Carolina',185776,NULL,NULL),(3900,'San Bernardino','USA','California',185401,NULL,NULL),(3901,'Jackson','USA','Mississippi',184256,NULL,NULL),(3902,'Little Rock','USA','Arkansas',183133,NULL,NULL),(3903,'Salt Lake City','USA','Utah',181743,NULL,NULL),(3904,'Reno','USA','Nevada',180480,NULL,NULL),(3905,'Newport News','USA','Virginia',180150,NULL,NULL),(3906,'Chandler','USA','Arizona',176581,NULL,NULL),(3907,'Laredo','USA','Texas',176576,NULL,NULL),(3908,'Henderson','USA','Nevada',175381,NULL,NULL),(3909,'Arlington','USA','Virginia',174838,NULL,NULL),(3910,'Knoxville','USA','Tennessee',173890,NULL,NULL),(3911,'Amarillo','USA','Texas',173627,NULL,NULL),(3912,'Providence','USA','Rhode Island',173618,NULL,NULL),(3913,'Chula Vista','USA','California',173556,NULL,NULL),(3914,'Worcester','USA','Massachusetts',172648,NULL,NULL),(3915,'Oxnard','USA','California',170358,NULL,NULL),(3916,'Dayton','USA','Ohio',166179,NULL,NULL),(3917,'Garden Grove','USA','California',165196,NULL,NULL),(3918,'Oceanside','USA','California',161029,NULL,NULL),(3919,'Tempe','USA','Arizona',158625,NULL,NULL),(3920,'Huntsville','USA','Alabama',158216,NULL,NULL),(3921,'Ontario','USA','California',158007,NULL,NULL),(3922,'Chattanooga','USA','Tennessee',155554,NULL,NULL),(3923,'Fort Lauderdale','USA','Florida',152397,NULL,NULL),(3924,'Springfield','USA','Massachusetts',152082,NULL,NULL),(3925,'Springfield','USA','Missouri',151580,NULL,NULL),(3926,'Santa Clarita','USA','California',151088,NULL,NULL),(3927,'Salinas','USA','California',151060,NULL,NULL),(3928,'Tallahassee','USA','Florida',150624,NULL,NULL),(3929,'Rockford','USA','Illinois',150115,NULL,NULL),(3930,'Pomona','USA','California',149473,NULL,NULL),(3931,'Metairie','USA','Louisiana',149428,NULL,NULL),(3932,'Paterson','USA','New Jersey',149222,NULL,NULL),(3933,'Overland Park','USA','Kansas',149080,NULL,NULL),(3934,'Santa Rosa','USA','California',147595,NULL,NULL),(3935,'Syracuse','USA','New York',147306,NULL,NULL),(3936,'Kansas City','USA','Kansas',146866,NULL,NULL),(3937,'Hampton','USA','Virginia',146437,NULL,NULL),(3938,'Lakewood','USA','Colorado',144126,NULL,NULL),(3939,'Vancouver','USA','Washington',143560,NULL,NULL),(3940,'Irvine','USA','California',143072,NULL,NULL),(3941,'Aurora','USA','Illinois',142990,NULL,NULL),(3942,'Moreno Valley','USA','California',142381,NULL,NULL),(3943,'Pasadena','USA','California',141674,NULL,NULL),(3944,'Hayward','USA','California',140030,NULL,NULL),(3945,'Brownsville','USA','Texas',139722,NULL,NULL),(3946,'Bridgeport','USA','Connecticut',139529,NULL,NULL),(3947,'Hollywood','USA','Florida',139357,NULL,NULL),(3948,'Warren','USA','Michigan',138247,NULL,NULL),(3949,'Torrance','USA','California',137946,NULL,NULL),(3950,'Eugene','USA','Oregon',137893,NULL,NULL),(3951,'Pembroke Pines','USA','Florida',137427,NULL,NULL),(3952,'Salem','USA','Oregon',136924,NULL,NULL),(3953,'Pasadena','USA','Texas',133936,NULL,NULL),(3954,'Escondido','USA','California',133559,NULL,NULL),(3955,'Sunnyvale','USA','California',131760,NULL,NULL),(3956,'Savannah','USA','Georgia',131510,NULL,NULL),(3957,'Fontana','USA','California',128929,NULL,NULL),(3958,'Orange','USA','California',128821,NULL,NULL),(3959,'Naperville','USA','Illinois',128358,NULL,NULL),(3960,'Alexandria','USA','Virginia',128283,NULL,NULL),(3961,'Rancho Cucamonga','USA','California',127743,NULL,NULL),(3962,'Grand Prairie','USA','Texas',127427,NULL,NULL),(3963,'East Los Angeles','USA','California',126379,NULL,NULL),(3964,'Fullerton','USA','California',126003,NULL,NULL),(3965,'Corona','USA','California',124966,NULL,NULL),(3966,'Flint','USA','Michigan',124943,NULL,NULL),(3967,'Paradise','USA','Nevada',124682,NULL,NULL),(3968,'Mesquite','USA','Texas',124523,NULL,NULL),(3969,'Sterling Heights','USA','Michigan',124471,NULL,NULL),(3970,'Sioux Falls','USA','South Dakota',123975,NULL,NULL),(3971,'New Haven','USA','Connecticut',123626,NULL,NULL),(3972,'Topeka','USA','Kansas',122377,NULL,NULL),(3973,'Concord','USA','California',121780,NULL,NULL),(3974,'Evansville','USA','Indiana',121582,NULL,NULL),(3975,'Hartford','USA','Connecticut',121578,NULL,NULL),(3976,'Fayetteville','USA','North Carolina',121015,NULL,NULL),(3977,'Cedar Rapids','USA','Iowa',120758,NULL,NULL),(3978,'Elizabeth','USA','New Jersey',120568,NULL,NULL),(3979,'Lansing','USA','Michigan',119128,NULL,NULL),(3980,'Lancaster','USA','California',118718,NULL,NULL),(3981,'Fort Collins','USA','Colorado',118652,NULL,NULL),(3982,'Coral Springs','USA','Florida',117549,NULL,NULL),(3983,'Stamford','USA','Connecticut',117083,NULL,NULL),(3984,'Thousand Oaks','USA','California',117005,NULL,NULL),(3985,'Vallejo','USA','California',116760,NULL,NULL),(3986,'Palmdale','USA','California',116670,NULL,NULL),(3987,'Columbia','USA','South Carolina',116278,NULL,NULL),(3988,'El Monte','USA','California',115965,NULL,NULL),(3989,'Abilene','USA','Texas',115930,NULL,NULL),(3990,'North Las Vegas','USA','Nevada',115488,NULL,NULL),(3991,'Ann Arbor','USA','Michigan',114024,NULL,NULL),(3992,'Beaumont','USA','Texas',113866,NULL,NULL),(3993,'Waco','USA','Texas',113726,NULL,NULL),(3994,'Macon','USA','Georgia',113336,NULL,NULL),(3995,'Independence','USA','Missouri',113288,NULL,NULL),(3996,'Peoria','USA','Illinois',112936,NULL,NULL),(3997,'Inglewood','USA','California',112580,NULL,NULL),(3998,'Springfield','USA','Illinois',111454,NULL,NULL),(3999,'Simi Valley','USA','California',111351,NULL,NULL),(4000,'Lafayette','USA','Louisiana',110257,NULL,NULL),(4001,'Gilbert','USA','Arizona',109697,NULL,NULL),(4002,'Carrollton','USA','Texas',109576,NULL,NULL),(4003,'Bellevue','USA','Washington',109569,NULL,NULL),(4004,'West Valley City','USA','Utah',108896,NULL,NULL),(4005,'Clarksville','USA','Tennessee',108787,NULL,NULL),(4006,'Costa Mesa','USA','California',108724,NULL,NULL),(4007,'Peoria','USA','Arizona',108364,NULL,NULL),(4008,'South Bend','USA','Indiana',107789,NULL,NULL),(4009,'Downey','USA','California',107323,NULL,NULL),(4010,'Waterbury','USA','Connecticut',107271,NULL,NULL),(4011,'Manchester','USA','New Hampshire',107006,NULL,NULL),(4012,'Allentown','USA','Pennsylvania',106632,NULL,NULL),(4013,'McAllen','USA','Texas',106414,NULL,NULL),(4014,'Joliet','USA','Illinois',106221,NULL,NULL),(4015,'Lowell','USA','Massachusetts',105167,NULL,NULL),(4016,'Provo','USA','Utah',105166,NULL,NULL),(4017,'West Covina','USA','California',105080,NULL,NULL),(4018,'Wichita Falls','USA','Texas',104197,NULL,NULL),(4019,'Erie','USA','Pennsylvania',103717,NULL,NULL),(4020,'Daly City','USA','California',103621,NULL,NULL),(4021,'Citrus Heights','USA','California',103455,NULL,NULL),(4022,'Norwalk','USA','California',103298,NULL,NULL),(4023,'Gary','USA','Indiana',102746,NULL,NULL),(4024,'Berkeley','USA','California',102743,NULL,NULL),(4025,'Santa Clara','USA','California',102361,NULL,NULL),(4026,'Green Bay','USA','Wisconsin',102313,NULL,NULL),(4027,'Cape Coral','USA','Florida',102286,NULL,NULL),(4028,'Arvada','USA','Colorado',102153,NULL,NULL),(4029,'Pueblo','USA','Colorado',102121,NULL,NULL),(4030,'Sandy','USA','Utah',101853,NULL,NULL),(4031,'Athens-Clarke County','USA','Georgia',101489,NULL,NULL),(4032,'Cambridge','USA','Massachusetts',101355,NULL,NULL),(4033,'Westminster','USA','Colorado',100940,NULL,NULL),(4034,'San Buenaventura','USA','California',100916,NULL,NULL),(4035,'Portsmouth','USA','Virginia',100565,NULL,NULL),(4036,'Livonia','USA','Michigan',100545,NULL,NULL),(4037,'Burbank','USA','California',100316,NULL,NULL),(4038,'Clearwater','USA','Florida',99936,NULL,NULL),(4039,'Midland','USA','Texas',98293,NULL,NULL),(4040,'Davenport','USA','Iowa',98256,NULL,NULL),(4041,'Mission Viejo','USA','California',98049,NULL,NULL),(4042,'Miami Beach','USA','Florida',97855,NULL,NULL),(4043,'Sunrise Manor','USA','Nevada',95362,NULL,NULL),(4044,'New Bedford','USA','Massachusetts',94780,NULL,NULL),(4045,'El Cajon','USA','California',94578,NULL,NULL),(4046,'Norman','USA','Oklahoma',94193,NULL,NULL),(4047,'Richmond','USA','California',94100,NULL,NULL),(4048,'Albany','USA','New York',93994,NULL,NULL),(4049,'Brockton','USA','Massachusetts',93653,NULL,NULL),(4050,'Roanoke','USA','Virginia',93357,NULL,NULL),(4051,'Billings','USA','Montana',92988,NULL,NULL),(4052,'Compton','USA','California',92864,NULL,NULL),(4053,'Gainesville','USA','Florida',92291,NULL,NULL),(4054,'Fairfield','USA','California',92256,NULL,NULL),(4055,'Arden-Arcade','USA','California',92040,NULL,NULL),(4056,'San Mateo','USA','California',91799,NULL,NULL),(4057,'Visalia','USA','California',91762,NULL,NULL),(4058,'Boulder','USA','Colorado',91238,NULL,NULL),(4059,'Cary','USA','North Carolina',91213,NULL,NULL),(4060,'Santa Monica','USA','California',91084,NULL,NULL),(4061,'Fall River','USA','Massachusetts',90555,NULL,NULL),(4062,'Kenosha','USA','Wisconsin',89447,NULL,NULL),(4063,'Elgin','USA','Illinois',89408,NULL,NULL),(4064,'Odessa','USA','Texas',89293,NULL,NULL),(4065,'Carson','USA','California',89089,NULL,NULL),(4066,'Charleston','USA','South Carolina',89063,NULL,NULL),(4067,'Charlotte Amalie','VIR','St Thomas',13000,NULL,NULL),(4068,'Harare','ZWE','Harare',1410000,NULL,NULL),(4069,'Bulawayo','ZWE','Bulawayo',621742,NULL,NULL),(4070,'Chitungwiza','ZWE','Harare',274912,NULL,NULL),(4071,'Mount Darwin','ZWE','Harare',164362,NULL,NULL),(4072,'Mutare','ZWE','Manicaland',131367,NULL,NULL),(4073,'Gweru','ZWE','Midlands',128037,NULL,NULL),(4074,'Gaza','PSE','Gaza',353632,NULL,NULL),(4075,'Khan Yunis','PSE','Khan Yunis',123175,NULL,NULL),(4076,'Hebron','PSE','Hebron',119401,NULL,NULL),(4077,'Jabaliya','PSE','North Gaza',113901,NULL,NULL),(4078,'Nablus','PSE','Nablus',100231,NULL,NULL),(4079,'Rafah','PSE','Rafah',92020,NULL,NULL);
/*!40000 ALTER TABLE `pivot_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cleaning_batch_items`
--

DROP TABLE IF EXISTS `pivot_cleaning_batch_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cleaning_batch_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cleaning_batch_id` int unsigned NOT NULL,
  `set_id` int unsigned NOT NULL,
  `set_uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `available` int NOT NULL DEFAULT '0',
  `total_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cleaning_batch_items_cleaning_batch_id_foreign` (`cleaning_batch_id`),
  KEY `cleaning_batch_items_set_id_foreign` (`set_id`),
  CONSTRAINT `cleaning_batch_items_cleaning_batch_id_foreign` FOREIGN KEY (`cleaning_batch_id`) REFERENCES `pivot_cleaning_batches` (`id`),
  CONSTRAINT `cleaning_batch_items_set_id_foreign` FOREIGN KEY (`set_id`) REFERENCES `pivot_sets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cleaning_batch_items`
--

LOCK TABLES `pivot_cleaning_batch_items` WRITE;
/*!40000 ALTER TABLE `pivot_cleaning_batch_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_cleaning_batch_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cleaning_batch_processes`
--

DROP TABLE IF EXISTS `pivot_cleaning_batch_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cleaning_batch_processes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cleaning_batch_id` int unsigned NOT NULL,
  `batch_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cleaning_process_id` int unsigned NOT NULL,
  `cleaning_process_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cleaning_process_specifications` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sequence` int NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `reject_date` datetime DEFAULT NULL,
  `stop_date` datetime DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL,
  `last_activity_by` int unsigned DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '1 => PENDING, 2 => UNDERPROCESS, 3 => PROCESSED, 4 => REJECTED, 5 => STOPPED, 6 => DELETED',
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `finished_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cleaning_batch_processes_cleaning_batch_id_foreign` (`cleaning_batch_id`),
  KEY `cleaning_batch_processes_created_by_foreign` (`created_by`),
  KEY `cleaning_batch_processes_last_activity_by_foreign` (`last_activity_by`),
  KEY `cleaning_batch_processes_finished_by_foreign` (`finished_by`),
  KEY `cleaning_batch_processes_cleaning_process_id_foreign` (`cleaning_process_id`),
  CONSTRAINT `cleaning_batch_processes_cleaning_batch_id_foreign` FOREIGN KEY (`cleaning_batch_id`) REFERENCES `pivot_cleaning_batches` (`id`),
  CONSTRAINT `cleaning_batch_processes_cleaning_process_id_foreign` FOREIGN KEY (`cleaning_process_id`) REFERENCES `pivot_cleaning_processes` (`id`),
  CONSTRAINT `cleaning_batch_processes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `pivot_users` (`id`),
  CONSTRAINT `cleaning_batch_processes_finished_by_foreign` FOREIGN KEY (`finished_by`) REFERENCES `pivot_users` (`id`),
  CONSTRAINT `cleaning_batch_processes_last_activity_by_foreign` FOREIGN KEY (`last_activity_by`) REFERENCES `pivot_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cleaning_batch_processes`
--

LOCK TABLES `pivot_cleaning_batch_processes` WRITE;
/*!40000 ALTER TABLE `pivot_cleaning_batch_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_cleaning_batch_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cleaning_batches`
--

DROP TABLE IF EXISTS `pivot_cleaning_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cleaning_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cleaning_cycle_id` int unsigned NOT NULL,
  `owner_id` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '1 => PENDING, 2 => UNDERPROCESS, 3 => PROCESSED, 4 => REJECTED, 5 => STOPPED, 6 => DELETED',
  `batch_create_date` date NOT NULL DEFAULT '2022-12-26',
  `start_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `reject_date` datetime DEFAULT NULL,
  `stop_date` datetime DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL,
  `current_running_process_id` int unsigned DEFAULT NULL,
  `current_running_process_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `current_running_process_specifications` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `current_department_id` int unsigned NOT NULL COMMENT 'Current Department ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cleaning_batches_batch_no_unique` (`batch_no`),
  KEY `cleaning_batches_owner_id_foreign` (`owner_id`),
  KEY `cleaning_batches_created_by_foreign` (`created_by`),
  KEY `cleaning_batches_cleaning_cycle_id_foreign` (`cleaning_cycle_id`),
  CONSTRAINT `cleaning_batches_cleaning_cycle_id_foreign` FOREIGN KEY (`cleaning_cycle_id`) REFERENCES `pivot_cleaning_cycles` (`id`),
  CONSTRAINT `cleaning_batches_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `pivot_users` (`id`),
  CONSTRAINT `cleaning_batches_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `pivot_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cleaning_batches`
--

LOCK TABLES `pivot_cleaning_batches` WRITE;
/*!40000 ALTER TABLE `pivot_cleaning_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_cleaning_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cleaning_cycle_process`
--

DROP TABLE IF EXISTS `pivot_cleaning_cycle_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cleaning_cycle_process` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cleaning_cycle_id` int unsigned NOT NULL,
  `cleaning_process_id` int unsigned NOT NULL,
  `sequence` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cleaning_cycle_process_cleaning_cycle_id_foreign` (`cleaning_cycle_id`),
  KEY `cleaning_cycle_process_cleaning_process_id_foreign` (`cleaning_process_id`),
  CONSTRAINT `cleaning_cycle_process_cleaning_cycle_id_foreign` FOREIGN KEY (`cleaning_cycle_id`) REFERENCES `pivot_cleaning_cycles` (`id`),
  CONSTRAINT `cleaning_cycle_process_cleaning_process_id_foreign` FOREIGN KEY (`cleaning_process_id`) REFERENCES `pivot_cleaning_processes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cleaning_cycle_process`
--

LOCK TABLES `pivot_cleaning_cycle_process` WRITE;
/*!40000 ALTER TABLE `pivot_cleaning_cycle_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_cleaning_cycle_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cleaning_cycles`
--

DROP TABLE IF EXISTS `pivot_cleaning_cycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cleaning_cycles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_deactivated` tinyint(1) NOT NULL DEFAULT '0',
  `deactivated_on` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cleaning_cycles_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `cleaning_cycles_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cleaning_cycles`
--

LOCK TABLES `pivot_cleaning_cycles` WRITE;
/*!40000 ALTER TABLE `pivot_cleaning_cycles` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_cleaning_cycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cleaning_inventory_types`
--

DROP TABLE IF EXISTS `pivot_cleaning_inventory_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cleaning_inventory_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cleaning_inventory_types`
--

LOCK TABLES `pivot_cleaning_inventory_types` WRITE;
/*!40000 ALTER TABLE `pivot_cleaning_inventory_types` DISABLE KEYS */;
INSERT INTO `pivot_cleaning_inventory_types` VALUES (1,'Instrument','2017-07-12 23:14:52','2017-07-12 23:14:52'),(2,'Tray','2017-07-12 23:14:52','2017-07-12 23:14:52'),(3,'Assembly','2017-07-12 23:14:52','2017-07-12 23:14:52'),(4,'Non Instrument','2017-07-12 23:14:52','2017-07-12 23:14:52');
/*!40000 ALTER TABLE `pivot_cleaning_inventory_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cleaning_process_inventory`
--

DROP TABLE IF EXISTS `pivot_cleaning_process_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cleaning_process_inventory` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cleaning_process_id` int unsigned NOT NULL,
  `cleaning_inventory_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cleaning_process_inventory_cleaning_process_id_foreign` (`cleaning_process_id`),
  KEY `cleaning_process_inventory_cleaning_inventory_id_foreign` (`cleaning_inventory_id`),
  CONSTRAINT `cleaning_process_inventory_cleaning_inventory_id_foreign` FOREIGN KEY (`cleaning_inventory_id`) REFERENCES `pivot_cleaning_inventory_types` (`id`),
  CONSTRAINT `cleaning_process_inventory_cleaning_process_id_foreign` FOREIGN KEY (`cleaning_process_id`) REFERENCES `pivot_cleaning_processes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cleaning_process_inventory`
--

LOCK TABLES `pivot_cleaning_process_inventory` WRITE;
/*!40000 ALTER TABLE `pivot_cleaning_process_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_cleaning_process_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cleaning_processes`
--

DROP TABLE IF EXISTS `pivot_cleaning_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cleaning_processes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hospital_id` int unsigned NOT NULL,
  `specifications` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cleaning_processes_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `cleaning_processes_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cleaning_processes`
--

LOCK TABLES `pivot_cleaning_processes` WRITE;
/*!40000 ALTER TABLE `pivot_cleaning_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_cleaning_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_consumable_types`
--

DROP TABLE IF EXISTS `pivot_consumable_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_consumable_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_consumable_types`
--

LOCK TABLES `pivot_consumable_types` WRITE;
/*!40000 ALTER TABLE `pivot_consumable_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_consumable_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_consumables`
--

DROP TABLE IF EXISTS `pivot_consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_consumables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `consumable_type_id` int unsigned DEFAULT NULL,
  `count` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `special_notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consumables_consumable_type_id_foreign` (`consumable_type_id`),
  CONSTRAINT `consumables_consumable_type_id_foreign` FOREIGN KEY (`consumable_type_id`) REFERENCES `pivot_consumable_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_consumables`
--

LOCK TABLES `pivot_consumables` WRITE;
/*!40000 ALTER TABLE `pivot_consumables` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_consumables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_contact_function`
--

DROP TABLE IF EXISTS `pivot_contact_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_contact_function` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hospital_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_function_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_contact_function`
--

LOCK TABLES `pivot_contact_function` WRITE;
/*!40000 ALTER TABLE `pivot_contact_function` DISABLE KEYS */;
INSERT INTO `pivot_contact_function` VALUES (2,'Biomedical','2019-10-01 06:20:06','2019-10-01 06:20:06',0),(3,'Finance / Accounting','2019-10-01 06:20:06','2019-10-01 06:20:06',0),(4,'Operations','2019-10-01 06:20:06','2019-10-01 06:20:06',0),(5,'Marketing','2019-10-01 06:20:06','2019-10-01 06:20:06',0),(6,'General Administration','2019-10-01 06:20:06','2019-10-01 06:20:06',0),(8,'Management','2019-10-01 06:20:06','2019-10-01 06:20:06',0),(9,'CSSD','2019-10-01 06:20:06','2019-10-01 06:20:06',0);
/*!40000 ALTER TABLE `pivot_contact_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_countries`
--

DROP TABLE IF EXISTS `pivot_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(52) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `continent` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `region` varchar(26) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `surface_area` decimal(10,2) NOT NULL,
  `indep_year` int NOT NULL,
  `population` int unsigned NOT NULL,
  `life_expectancy` decimal(3,1) NOT NULL,
  `gnp` decimal(10,2) NOT NULL,
  `gnp_old` decimal(10,2) NOT NULL,
  `local_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `government_form` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `head_of_state` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `capital` int unsigned NOT NULL,
  `code2` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_countries`
--

LOCK TABLES `pivot_countries` WRITE;
/*!40000 ALTER TABLE `pivot_countries` DISABLE KEYS */;
INSERT INTO `pivot_countries` VALUES (1,'','Country','','',0.00,0,0,0.0,0.00,0.00,'Select Country','','',0,''),(2,'ABW','Aruba','North America','Caribbean',193.00,0,103000,78.4,828.00,793.00,'Aruba','Nonmetropolitan Territory of The Netherlands','Beatrix',129,'AW'),(3,'AFG','Afghanistan','Asia','Southern and Central Asia',652090.00,1919,22720000,45.9,5976.00,0.00,'Afganistan/Afqanestan','Islamic Emirate','Mohammad Omar',1,'AF'),(4,'AGO','Angola','Africa','Central Africa',1246700.00,1975,12878000,38.3,6648.00,7984.00,'Angola','Republic','José Eduardo dos Santos',56,'AO'),(5,'AIA','Anguilla','North America','Caribbean',96.00,0,8000,76.1,63.20,0.00,'Anguilla','Dependent Territory of the UK','Elisabeth II',62,'AI'),(6,'ALB','Albania','Europe','Southern Europe',28748.00,1912,3401200,71.6,3205.00,2500.00,'Shqipëria','Republic','Rexhep Mejdani',34,'AL'),(7,'AND','Andorra','Europe','Southern Europe',468.00,1278,78000,83.5,1630.00,0.00,'Andorra','Parliamentary Coprincipality','',55,'AD'),(8,'ANT','Netherlands Antilles','North America','Caribbean',800.00,0,217000,74.7,1941.00,0.00,'Nederlandse Antillen','Nonmetropolitan Territory of The Netherlands','Beatrix',33,'AN'),(9,'ARE','United Arab Emirates','Asia','Middle East',83600.00,1971,2441000,74.1,37966.00,36846.00,'Al-Imarat al-´Arabiya al-Muttahida','Emirate Federation','Zayid bin Sultan al-Nahayan',65,'AE'),(10,'ARG','Argentina','South America','South America',2780400.00,1816,37032000,75.1,340238.00,323310.00,'Argentina','Federal Republic','Fernando de la Rúa',69,'AR'),(11,'ARM','Armenia','Asia','Middle East',29800.00,1991,3520000,66.4,1813.00,1627.00,'Hajastan','Republic','Robert Kotšarjan',126,'AM'),(12,'ASM','American Samoa','Oceania','Polynesia',199.00,0,68000,75.1,334.00,0.00,'Amerika Samoa','US Territory','George W. Bush',54,'AS'),(13,'ATA','Antarctica','Antarctica','Antarctica',13120000.00,0,0,0.0,0.00,0.00,'–','Co-administrated','',0,'AQ'),(14,'ATF','French Southern territories','Antarctica','Antarctica',7780.00,0,0,0.0,0.00,0.00,'Terres australes françaises','Nonmetropolitan Territory of France','Jacques Chirac',0,'TF'),(15,'ATG','Antigua and Barbuda','North America','Caribbean',442.00,1981,68000,70.5,612.00,584.00,'Antigua and Barbuda','Constitutional Monarchy','Elisabeth II',63,'AG'),(16,'AUS','Australia','Oceania','Australia and New Zealand',7741220.00,1901,18886000,79.8,351182.00,392911.00,'Australia','Constitutional Monarchy, Federation','Elisabeth II',135,'AU'),(17,'AUT','Austria','Europe','Western Europe',83859.00,1918,8091800,77.7,211860.00,206025.00,'Österreich','Federal Republic','Thomas Klestil',1523,'AT'),(18,'AZE','Azerbaijan','Asia','Middle East',86600.00,1991,7734000,62.9,4127.00,4100.00,'Azärbaycan','Federal Republic','Heydär Äliyev',144,'AZ'),(19,'BDI','Burundi','Africa','Eastern Africa',27834.00,1962,6695000,46.2,903.00,982.00,'Burundi/Uburundi','Republic','Pierre Buyoya',552,'BI'),(20,'BEL','Belgium','Europe','Western Europe',30518.00,1830,10239000,77.8,249704.00,243948.00,'België/Belgique','Constitutional Monarchy, Federation','Albert II',179,'BE'),(21,'BEN','Benin','Africa','Western Africa',112622.00,1960,6097000,50.2,2357.00,2141.00,'Bénin','Republic','Mathieu Kérékou',187,'BJ'),(22,'BFA','Burkina Faso','Africa','Western Africa',274000.00,1960,11937000,46.7,2425.00,2201.00,'Burkina Faso','Republic','Blaise Compaoré',549,'BF'),(23,'BGD','Bangladesh','Asia','Southern and Central Asia',143998.00,1971,129155000,60.2,32852.00,31966.00,'Bangladesh','Republic','Shahabuddin Ahmad',150,'BD'),(24,'BGR','Bulgaria','Europe','Eastern Europe',110994.00,1908,8190900,70.9,12178.00,10169.00,'Balgarija','Republic','Petar Stojanov',539,'BG'),(25,'BHR','Bahrain','Asia','Middle East',694.00,1971,617000,73.0,6366.00,6097.00,'Al-Bahrayn','Monarchy (Emirate)','Hamad ibn Isa al-Khalifa',149,'BH'),(26,'BHS','Bahamas','North America','Caribbean',13878.00,1973,307000,71.1,3527.00,3347.00,'The Bahamas','Constitutional Monarchy','Elisabeth II',148,'BS'),(27,'BIH','Bosnia and Herzegovina','Europe','Southern Europe',51197.00,1992,3972000,71.5,2841.00,0.00,'Bosna i Hercegovina','Federal Republic','Ante Jelavic',201,'BA'),(28,'BLR','Belarus','Europe','Eastern Europe',207600.00,1991,10236000,68.0,13714.00,0.00,'Belarus','Republic','Aljaksandr Lukašenka',3520,'BY'),(29,'BLZ','Belize','North America','Central America',22696.00,1981,241000,70.9,630.00,616.00,'Belize','Constitutional Monarchy','Elisabeth II',185,'BZ'),(30,'BMU','Bermuda','North America','North America',53.00,0,65000,76.9,2328.00,2190.00,'Bermuda','Dependent Territory of the UK','Elisabeth II',191,'BM'),(31,'BOL','Bolivia','South America','South America',1098581.00,1825,8329000,63.7,8571.00,7967.00,'Bolivia','Republic','Hugo Bánzer Suárez',194,'BO'),(32,'BRA','Brazil','South America','South America',8547403.00,1822,170115000,62.9,776739.00,804108.00,'Brasil','Federal Republic','Fernando Henrique Cardoso',211,'BR'),(33,'BRB','Barbados','North America','Caribbean',430.00,1966,270000,73.0,2223.00,2186.00,'Barbados','Constitutional Monarchy','Elisabeth II',174,'BB'),(34,'BRN','Brunei','Asia','Southeast Asia',5765.00,1984,328000,73.6,11705.00,12460.00,'Brunei Darussalam','Monarchy (Sultanate)','Haji Hassan al-Bolkiah',538,'BN'),(35,'BTN','Bhutan','Asia','Southern and Central Asia',47000.00,1910,2124000,52.4,372.00,383.00,'Druk-Yul','Monarchy','Jigme Singye Wangchuk',192,'BT'),(36,'BVT','Bouvet Island','Antarctica','Antarctica',59.00,0,0,0.0,0.00,0.00,'Bouvetøya','Dependent Territory of Norway','Harald V',0,'BV'),(37,'BWA','Botswana','Africa','Southern Africa',581730.00,1966,1622000,39.3,4834.00,4935.00,'Botswana','Republic','Festus G. Mogae',204,'BW'),(38,'CAF','Central African Republic','Africa','Central Africa',622984.00,1960,3615000,44.0,1054.00,993.00,'Centrafrique/Bê-Afrîka','Republic','Ange-Félix Patassé',1889,'CF'),(39,'CAN','Canada','North America','North America',9970610.00,1867,31147000,79.4,598862.00,625626.00,'Canada','Constitutional Monarchy, Federation','Elisabeth II',1822,'CA'),(40,'CCK','Cocos (Keeling) Islands','Oceania','Australia and New Zealand',14.00,0,600,0.0,0.00,0.00,'Cocos (Keeling) Islands','Territory of Australia','Elisabeth II',2317,'CC'),(41,'CHE','Switzerland','Europe','Western Europe',41284.00,1499,7160400,79.6,264478.00,256092.00,'Schweiz/Suisse/Svizzera/Svizra','Federation','Adolf Ogi',3248,'CH'),(42,'CHL','Chile','South America','South America',756626.00,1810,15211000,75.7,72949.00,75780.00,'Chile','Republic','Ricardo Lagos Escobar',554,'CL'),(43,'CHN','China','Asia','Eastern Asia',9572900.00,-1523,1277558000,71.4,982268.00,917719.00,'Zhongquo','People\'sRepublic','Jiang Zemin',1891,'CN'),(44,'CIV','Côte d’Ivoire','Africa','Western Africa',322463.00,1960,14786000,45.2,11345.00,10285.00,'Côte d’Ivoire','Republic','Laurent Gbagbo',2814,'CI'),(45,'CMR','Cameroon','Africa','Central Africa',475442.00,1960,15085000,54.8,9174.00,8596.00,'Cameroun/Cameroon','Republic','Paul Biya',1804,'CM'),(46,'COD','Congo, The Democratic Republic of the','Africa','Central Africa',2344858.00,1960,51654000,48.8,6964.00,2474.00,'République Démocratique du Congo','Republic','Joseph Kabila',2298,'CD'),(47,'COG','Congo','Africa','Central Africa',342000.00,1960,2943000,47.4,2108.00,2287.00,'Congo','Republic','Denis Sassou-Nguesso',2296,'CG'),(48,'COK','Cook Islands','Oceania','Polynesia',236.00,0,20000,71.1,100.00,0.00,'The Cook Islands','Nonmetropolitan Territory of New Zealand','Elisabeth II',583,'CK'),(49,'COL','Colombia','South America','South America',1138914.00,1810,42321000,70.3,102896.00,105116.00,'Colombia','Republic','Andrés Pastrana Arango',2257,'CO'),(50,'COM','Comoros','Africa','Eastern Africa',1862.00,1975,578000,60.0,4401.00,4361.00,'Komori/Comores','Republic','Azali Assoumani',2295,'KM'),(51,'CPV','Cape Verde','Africa','Western Africa',4033.00,1975,428000,68.9,435.00,420.00,'Cabo Verde','Republic','António Mascarenhas Monteiro',1859,'CV'),(52,'CRI','Costa Rica','North America','Central America',51100.00,1821,4023000,75.8,10226.00,9757.00,'Costa Rica','Republic','Miguel Ángel Rodríguez Echeverría',584,'CR'),(53,'CUB','Cuba','North America','Caribbean',110861.00,1902,11201000,76.2,17843.00,18862.00,'Cuba','Socialistic Republic','Fidel Castro Ruz',2413,'CU'),(54,'CXR','Christmas Island','Oceania','Australia and New Zealand',135.00,0,2500,0.0,0.00,0.00,'Christmas Island','Territory of Australia','Elisabeth II',1791,'CX'),(55,'CYM','Cayman Islands','North America','Caribbean',264.00,0,38000,78.9,1263.00,1186.00,'Cayman Islands','Dependent Territory of the UK','Elisabeth II',553,'KY'),(56,'CYP','Cyprus','Asia','Middle East',9251.00,1960,754700,76.7,9333.00,8246.00,'Kýpros/Kibris','Republic','Glafkos Klerides',2430,'CY'),(57,'CZE','Czech Republic','Europe','Eastern Europe',78866.00,1993,10278100,74.5,55017.00,52037.00,'¸esko','Republic','Václav Havel',3339,'CZ'),(58,'DEU','Germany','Europe','Western Europe',357022.00,1955,82164700,77.4,2133367.00,2102826.00,'Deutschland','Federal Republic','Johannes Rau',3068,'DE'),(59,'DJI','Djibouti','Africa','Eastern Africa',23200.00,1977,638000,50.8,382.00,373.00,'Djibouti/Jibuti','Republic','Ismail Omar Guelleh',585,'DJ'),(60,'DMA','Dominica','North America','Caribbean',751.00,1978,71000,73.4,256.00,243.00,'Dominica','Republic','Vernon Shaw',586,'DM'),(61,'DNK','Denmark','Europe','Nordic Countries',43094.00,800,5330000,76.5,174099.00,169264.00,'Danmark','Constitutional Monarchy','Margrethe II',3315,'DK'),(62,'DOM','Dominican Republic','North America','Caribbean',48511.00,1844,8495000,73.2,15846.00,15076.00,'República Dominicana','Republic','Hipólito Mejía Domínguez',587,'DO'),(63,'DZA','Algeria','Africa','Northern Africa',2381741.00,1962,31471000,69.7,49982.00,46966.00,'Al-Jaza’ir/Algérie','Republic','Abdelaziz Bouteflika',35,'DZ'),(64,'ECU','Ecuador','South America','South America',283561.00,1822,12646000,71.1,19770.00,19769.00,'Ecuador','Republic','Gustavo Noboa Bejarano',594,'EC'),(65,'EGY','Egypt','Africa','Northern Africa',1001449.00,1922,68470000,63.3,82710.00,75617.00,'Misr','Republic','Hosni Mubarak',608,'EG'),(66,'ERI','Eritrea','Africa','Eastern Africa',117600.00,1993,3850000,55.8,650.00,755.00,'Ertra','Republic','Isayas Afewerki [Isaias Afwerki]',652,'ER'),(67,'ESH','Western Sahara','Africa','Northern Africa',266000.00,0,293000,49.8,60.00,0.00,'As-Sahrawiya','Occupied by Marocco','Mohammed Abdel Aziz',2453,'EH'),(68,'ESP','Spain','Europe','Southern Europe',505992.00,1492,39441700,78.8,553233.00,532031.00,'España','Constitutional Monarchy','Juan Carlos I',653,'ES'),(69,'EST','Estonia','Europe','Baltic Countries',45227.00,1991,1439200,69.5,5328.00,3371.00,'Eesti','Republic','Lennart Meri',3791,'EE'),(70,'ETH','Ethiopia','Africa','Eastern Africa',1104300.00,-1000,62565000,45.2,6353.00,6180.00,'YeItyop´iya','Republic','Negasso Gidada',756,'ET'),(71,'FIN','Finland','Europe','Nordic Countries',338145.00,1917,5171300,77.4,121914.00,119833.00,'Suomi','Republic','Tarja Halonen',3236,'FI'),(72,'FJI','Fiji Islands','Oceania','Melanesia',18274.00,1970,817000,67.9,1536.00,2149.00,'Fiji Islands','Republic','Josefa Iloilo',764,'FJ'),(73,'FLK','Falkland Islands','South America','South America',12173.00,0,2000,0.0,0.00,0.00,'Falkland Islands','Dependent Territory of the UK','Elisabeth II',763,'FK'),(74,'FRA','France','Europe','Western Europe',551500.00,843,59225700,78.8,1424285.00,1392448.00,'France','Republic','Jacques Chirac',2974,'FR'),(75,'FRO','Faroe Islands','Europe','Nordic Countries',1399.00,0,43000,78.4,0.00,0.00,'Føroyar','Part of Denmark','Margrethe II',901,'FO'),(76,'FSM','Micronesia, Federated States of','Oceania','Micronesia',702.00,1990,119000,68.6,212.00,0.00,'Micronesia','Federal Republic','Leo A. Falcam',2689,'FM'),(77,'GAB','Gabon','Africa','Central Africa',267668.00,1960,1226000,50.1,5493.00,5279.00,'Le Gabon','Republic','Omar Bongo',902,'GA'),(78,'GBR','United Kingdom','Europe','British Islands',242900.00,1066,59623400,77.7,1378330.00,1296830.00,'United Kingdom','Constitutional Monarchy','Elisabeth II',456,'GB'),(79,'GEO','Georgia','Asia','Middle East',69700.00,1991,4968000,64.5,6064.00,5924.00,'Sakartvelo','Republic','Eduard Ševardnadze',905,'GE'),(80,'GHA','Ghana','Africa','Western Africa',238533.00,1957,20212000,57.4,7137.00,6884.00,'Ghana','Republic','John Kufuor',910,'GH'),(81,'GIB','Gibraltar','Europe','Southern Europe',6.00,0,25000,79.0,258.00,0.00,'Gibraltar','Dependent Territory of the UK','Elisabeth II',915,'GI'),(82,'GIN','Guinea','Africa','Western Africa',245857.00,1958,7430000,45.6,2352.00,2383.00,'Guinée','Republic','Lansana Conté',926,'GN'),(83,'GLP','Guadeloupe','North America','Caribbean',1705.00,0,456000,77.0,3501.00,0.00,'Guadeloupe','Overseas Department of France','Jacques Chirac',919,'GP'),(84,'GMB','Gambia','Africa','Western Africa',11295.00,1965,1305000,53.2,320.00,325.00,'The Gambia','Republic','Yahya Jammeh',904,'GM'),(85,'GNB','Guinea-Bissau','Africa','Western Africa',36125.00,1974,1213000,49.0,293.00,272.00,'Guiné-Bissau','Republic','Kumba Ialá',927,'GW'),(86,'GNQ','Equatorial Guinea','Africa','Central Africa',28051.00,1968,453000,53.6,283.00,542.00,'Guinea Ecuatorial','Republic','Teodoro Obiang Nguema Mbasogo',2972,'GQ'),(87,'GRC','Greece','Europe','Southern Europe',131626.00,1830,10545700,78.4,120724.00,119946.00,'Elláda','Republic','Kostis Stefanopoulos',2401,'GR'),(88,'GRD','Grenada','North America','Caribbean',344.00,1974,94000,64.5,318.00,0.00,'Grenada','Constitutional Monarchy','Elisabeth II',916,'GD'),(89,'GRL','Greenland','North America','North America',2166090.00,0,56000,68.1,0.00,0.00,'Kalaallit Nunaat/Grønland','Part of Denmark','Margrethe II',917,'GL'),(90,'GTM','Guatemala','North America','Central America',108889.00,1821,11385000,66.2,19008.00,17797.00,'Guatemala','Republic','Alfonso Portillo Cabrera',922,'GT'),(91,'GUF','French Guiana','South America','South America',90000.00,0,181000,76.1,681.00,0.00,'Guyane française','Overseas Department of France','Jacques Chirac',3014,'GF'),(92,'GUM','Guam','Oceania','Micronesia',549.00,0,168000,77.8,1197.00,1136.00,'Guam','US Territory','George W. Bush',921,'GU'),(93,'GUY','Guyana','South America','South America',214969.00,1966,861000,64.0,722.00,743.00,'Guyana','Republic','Bharrat Jagdeo',928,'GY'),(94,'HKG','Hong Kong','Asia','Eastern Asia',1075.00,0,6782000,79.5,166448.00,173610.00,'Xianggang/Hong Kong','Special Administrative Region of China','Jiang Zemin',937,'HK'),(95,'HMD','Heard Island and McDonald Islands','Antarctica','Antarctica',359.00,0,0,0.0,0.00,0.00,'Heard and McDonald Islands','Territory of Australia','Elisabeth II',0,'HM'),(96,'HND','Honduras','North America','Central America',112088.00,1838,6485000,69.9,5333.00,4697.00,'Honduras','Republic','Carlos Roberto Flores Facussé',933,'HN'),(97,'HRV','Croatia','Europe','Southern Europe',56538.00,1991,4473000,73.7,20208.00,19300.00,'Hrvatska','Republic','Štipe Mesic',2409,'HR'),(98,'HTI','Haiti','North America','Caribbean',27750.00,1804,8222000,49.2,3459.00,3107.00,'Haïti/Dayti','Republic','Jean-Bertrand Aristide',929,'HT'),(99,'HUN','Hungary','Europe','Eastern Europe',93030.00,1918,10043200,71.4,48267.00,45914.00,'Magyarország','Republic','Ferenc Mádl',3483,'HU'),(100,'IDN','Indonesia','Asia','Southeast Asia',1904569.00,1945,212107000,68.0,84982.00,215002.00,'Indonesia','Republic','Abdurrahman Wahid',939,'ID'),(101,'IND','India','Asia','Southern and Central Asia',3287263.00,1947,1013662000,62.5,447114.00,430572.00,'Bharat/India','Federal Republic','Kocheril Raman Narayanan',1109,'IN'),(102,'IOT','British Indian Ocean Territory','Africa','Eastern Africa',78.00,0,0,0.0,0.00,0.00,'British Indian Ocean Territory','Dependent Territory of the UK','Elisabeth II',0,'IO'),(103,'IRL','Ireland','Europe','British Islands',70273.00,1921,3775100,76.8,75921.00,73132.00,'Ireland/Éire','Republic','Mary McAleese',1447,'IE'),(104,'IRN','Iran','Asia','Southern and Central Asia',1648195.00,1906,67702000,69.7,195746.00,160151.00,'Iran','Islamic Republic','Ali Mohammad Khatami-Ardakani',1380,'IR'),(105,'IRQ','Iraq','Asia','Middle East',438317.00,1932,23115000,66.5,11500.00,0.00,'Al-´Iraq','Republic','Saddam Hussein al-Takriti',1365,'IQ'),(106,'ISL','Iceland','Europe','Nordic Countries',103000.00,1944,279000,79.4,8255.00,7474.00,'Ísland','Republic','Ólafur Ragnar Grímsson',1449,'IS'),(107,'ISR','Israel','Asia','Middle East',21056.00,1948,6217000,78.6,97477.00,98577.00,'Yisra’el/Isra’il','Republic','Moshe Katzav',1450,'IL'),(108,'ITA','Italy','Europe','Southern Europe',301316.00,1861,57680000,79.0,1161755.00,1145372.00,'Italia','Republic','Carlo Azeglio Ciampi',1464,'IT'),(109,'JAM','Jamaica','North America','Caribbean',10990.00,1962,2583000,75.2,6871.00,6722.00,'Jamaica','Constitutional Monarchy','Elisabeth II',1530,'JM'),(110,'JOR','Jordan','Asia','Middle East',88946.00,1946,5083000,77.4,7526.00,7051.00,'Al-Urdunn','Constitutional Monarchy','Abdullah II',1786,'JO'),(111,'JPN','Japan','Asia','Eastern Asia',377829.00,-660,126714000,80.7,3787042.00,4192638.00,'Nihon/Nippon','Constitutional Monarchy','Akihito',1532,'JP'),(112,'KAZ','Kazakstan','Asia','Southern and Central Asia',2724900.00,1991,16223000,63.2,24375.00,23383.00,'Qazaqstan','Republic','Nursultan Nazarbajev',1864,'KZ'),(113,'KEN','Kenya','Africa','Eastern Africa',580367.00,1963,30080000,48.0,9217.00,10241.00,'Kenya','Republic','Daniel arap Moi',1881,'KE'),(114,'KGZ','Kyrgyzstan','Asia','Southern and Central Asia',199900.00,1991,4699000,63.4,1626.00,1767.00,'Kyrgyzstan','Republic','Askar Akajev',2253,'KG'),(115,'KHM','Cambodia','Asia','Southeast Asia',181035.00,1953,11168000,56.5,5121.00,5670.00,'Kâmpuchéa','Constitutional Monarchy','Norodom Sihanouk',1800,'KH'),(116,'KIR','Kiribati','Oceania','Micronesia',726.00,1979,83000,59.8,40.70,0.00,'Kiribati','Republic','Teburoro Tito',2256,'KI'),(117,'KNA','Saint Kitts and Nevis','North America','Caribbean',261.00,1983,38000,70.7,299.00,0.00,'Saint Kitts and Nevis','Constitutional Monarchy','Elisabeth II',3064,'KN'),(118,'KOR','South Korea','Asia','Eastern Asia',99434.00,1948,46844000,74.4,320749.00,442544.00,'Taehan Min’guk (Namhan)','Republic','Kim Dae-jung',2331,'KR'),(119,'KWT','Kuwait','Asia','Middle East',17818.00,1961,1972000,76.1,27037.00,30373.00,'Al-Kuwayt','Constitutional Monarchy (Emirate)','Jabir al-Ahmad al-Jabir al-Sabah',2429,'KW'),(120,'LAO','Laos','Asia','Southeast Asia',236800.00,1953,5433000,53.1,1292.00,1746.00,'Lao','Republic','Khamtay Siphandone',2432,'LA'),(121,'LBN','Lebanon','Asia','Middle East',10400.00,1941,3282000,71.3,17121.00,15129.00,'Lubnan','Republic','Émile Lahoud',2438,'LB'),(122,'LBR','Liberia','Africa','Western Africa',111369.00,1847,3154000,51.0,2012.00,0.00,'Liberia','Republic','Charles Taylor',2440,'LR'),(123,'LBY','Libyan Arab Jamahiriya','Africa','Northern Africa',1759540.00,1951,5605000,75.5,44806.00,40562.00,'Libiya','Socialistic State','Muammar al-Qadhafi',2441,'LY'),(124,'LCA','Saint Lucia','North America','Caribbean',622.00,1979,154000,72.3,571.00,0.00,'Saint Lucia','Constitutional Monarchy','Elisabeth II',3065,'LC'),(125,'LIE','Liechtenstein','Europe','Western Europe',160.00,1806,32300,78.8,1119.00,1084.00,'Liechtenstein','Constitutional Monarchy','Hans-Adam II',2446,'LI'),(126,'LKA','Sri Lanka','Asia','Southern and Central Asia',65610.00,1948,18827000,71.8,15706.00,15091.00,'Sri Lanka/Ilankai','Republic','Chandrika Kumaratunga',3217,'LK'),(127,'LSO','Lesotho','Africa','Southern Africa',30355.00,1966,2153000,50.8,1061.00,1161.00,'Lesotho','Constitutional Monarchy','Letsie III',2437,'LS'),(128,'LTU','Lithuania','Europe','Baltic Countries',65301.00,1991,3698500,69.1,10692.00,9585.00,'Lietuva','Republic','Valdas Adamkus',2447,'LT'),(129,'LUX','Luxembourg','Europe','Western Europe',2586.00,1867,435700,77.1,16321.00,15519.00,'Luxembourg/Lëtzebuerg','Constitutional Monarchy','Henri',2452,'LU'),(130,'LVA','Latvia','Europe','Baltic Countries',64589.00,1991,2424200,68.4,6398.00,5639.00,'Latvija','Republic','Vaira Vike-Freiberga',2434,'LV'),(131,'MAC','Macao','Asia','Eastern Asia',18.00,0,473000,81.6,5749.00,5940.00,'Macau/Aomen','Special Administrative Region of China','Jiang Zemin',2454,'MO'),(132,'MAR','Morocco','Africa','Northern Africa',446550.00,1956,28351000,69.1,36124.00,33514.00,'Al-Maghrib','Constitutional Monarchy','Mohammed VI',2486,'MA'),(133,'MCO','Monaco','Europe','Western Europe',1.50,1861,34000,78.8,776.00,0.00,'Monaco','Constitutional Monarchy','Rainier III',2695,'MC'),(134,'MDA','Moldova','Europe','Eastern Europe',33851.00,1991,4380000,64.5,1579.00,1872.00,'Moldova','Republic','Vladimir Voronin',2690,'MD'),(135,'MDG','Madagascar','Africa','Eastern Africa',587041.00,1960,15942000,55.0,3750.00,3545.00,'Madagasikara/Madagascar','Federal Republic','Didier Ratsiraka',2455,'MG'),(136,'MDV','Maldives','Asia','Southern and Central Asia',298.00,1965,286000,62.2,199.00,0.00,'Dhivehi Raajje/Maldives','Republic','Maumoon Abdul Gayoom',2463,'MV'),(137,'MEX','Mexico','North America','Central America',1958201.00,1810,98881000,71.5,414972.00,401461.00,'México','Federal Republic','Vicente Fox Quesada',2515,'MX'),(138,'MHL','Marshall Islands','Oceania','Micronesia',181.00,1990,64000,65.5,97.00,0.00,'Marshall Islands/Majol','Republic','Kessai Note',2507,'MH'),(139,'MKD','Macedonia','Europe','Southern Europe',25713.00,1991,2024000,73.8,1694.00,1915.00,'Makedonija','Republic','Boris Trajkovski',2460,'MK'),(140,'MLI','Mali','Africa','Western Africa',1240192.00,1960,11234000,46.7,2642.00,2453.00,'Mali','Republic','Alpha Oumar Konaré',2482,'ML'),(141,'MLT','Malta','Europe','Southern Europe',316.00,1964,380200,77.9,3512.00,3338.00,'Malta','Republic','Guido de Marco',2484,'MT'),(142,'MMR','Myanmar','Asia','Southeast Asia',676578.00,1948,45611000,54.9,180375.00,171028.00,'Myanma Pye','Republic','kenraali Than Shwe',2710,'MM'),(143,'MNG','Mongolia','Asia','Eastern Asia',1566500.00,1921,2662000,67.3,1043.00,933.00,'Mongol Uls','Republic','Natsagiin Bagabandi',2696,'MN'),(144,'MNP','Northern Mariana Islands','Oceania','Micronesia',464.00,0,78000,75.5,0.00,0.00,'Northern Mariana Islands','Commonwealth of the US','George W. Bush',2913,'MP'),(145,'MOZ','Mozambique','Africa','Eastern Africa',801590.00,1975,19680000,37.5,2891.00,2711.00,'Moçambique','Republic','Joaquím A. Chissano',2698,'MZ'),(146,'MRT','Mauritania','Africa','Western Africa',1025520.00,1960,2670000,50.8,998.00,1081.00,'Muritaniya/Mauritanie','Republic','Maaouiya Ould Sid´Ahmad Taya',2509,'MR'),(147,'MSR','Montserrat','North America','Caribbean',102.00,0,11000,78.0,109.00,0.00,'Montserrat','Dependent Territory of the UK','Elisabeth II',2697,'MS'),(148,'MTQ','Martinique','North America','Caribbean',1102.00,0,395000,78.3,2731.00,2559.00,'Martinique','Overseas Department of France','Jacques Chirac',2508,'MQ'),(149,'MUS','Mauritius','Africa','Eastern Africa',2040.00,1968,1158000,71.0,4251.00,4186.00,'Mauritius','Republic','Cassam Uteem',2511,'MU'),(150,'MWI','Malawi','Africa','Eastern Africa',118484.00,1964,10925000,37.6,1687.00,2527.00,'Malawi','Republic','Bakili Muluzi',2462,'MW'),(151,'MYS','Malaysia','Asia','Southeast Asia',329758.00,1957,22244000,70.8,69213.00,97884.00,'Malaysia','Constitutional Monarchy, Federation','Salahuddin Abdul Aziz Shah Alhaj',2464,'MY'),(152,'MYT','Mayotte','Africa','Eastern Africa',373.00,0,149000,59.5,0.00,0.00,'Mayotte','Territorial Collectivity of France','Jacques Chirac',2514,'YT'),(153,'NAM','Namibia','Africa','Southern Africa',824292.00,1990,1726000,42.5,3101.00,3384.00,'Namibia','Republic','Sam Nujoma',2726,'NA'),(154,'NCL','New Caledonia','Oceania','Melanesia',18575.00,0,214000,72.8,3563.00,0.00,'Nouvelle-Calédonie','Nonmetropolitan Territory of France','Jacques Chirac',3493,'NC'),(155,'NER','Niger','Africa','Western Africa',1267000.00,1960,10730000,41.3,1706.00,1580.00,'Niger','Republic','Mamadou Tandja',2738,'NE'),(156,'NFK','Norfolk Island','Oceania','Australia and New Zealand',36.00,0,2000,0.0,0.00,0.00,'Norfolk Island','Territory of Australia','Elisabeth II',2806,'NF'),(157,'NGA','Nigeria','Africa','Western Africa',923768.00,1960,111506000,51.6,65707.00,58623.00,'Nigeria','Federal Republic','Olusegun Obasanjo',2754,'NG'),(158,'NIC','Nicaragua','North America','Central America',130000.00,1838,5074000,68.7,1988.00,2023.00,'Nicaragua','Republic','Arnoldo Alemán Lacayo',2734,'NI'),(159,'NIU','Niue','Oceania','Polynesia',260.00,0,2000,0.0,0.00,0.00,'Niue','Nonmetropolitan Territory of New Zealand','Elisabeth II',2805,'NU'),(160,'NLD','Netherlands','Europe','Western Europe',41526.00,1581,15864000,78.3,371362.00,360478.00,'Nederland','Constitutional Monarchy','Beatrix',5,'NL'),(161,'NOR','Norway','Europe','Nordic Countries',323877.00,1905,4478500,78.7,145895.00,153370.00,'Norge','Constitutional Monarchy','Harald V',2807,'NO'),(162,'NPL','Nepal','Asia','Southern and Central Asia',147181.00,1769,23930000,57.8,4768.00,4837.00,'Nepal','Constitutional Monarchy','Gyanendra Bir Bikram',2729,'NP'),(163,'NRU','Nauru','Oceania','Micronesia',21.00,1968,12000,60.8,197.00,0.00,'Naoero/Nauru','Republic','Bernard Dowiyogo',2728,'NR'),(164,'NZL','New Zealand','Oceania','Australia and New Zealand',270534.00,1907,3862000,77.8,54669.00,64960.00,'New Zealand/Aotearoa','Constitutional Monarchy','Elisabeth II',3499,'NZ'),(165,'OMN','Oman','Asia','Middle East',309500.00,1951,2542000,71.8,16904.00,16153.00,'´Uman','Monarchy (Sultanate)','Qabus ibn Sa´id',2821,'OM'),(166,'PAK','Pakistan','Asia','Southern and Central Asia',796095.00,1947,156483000,61.1,61289.00,58549.00,'Pakistan','Republic','Mohammad Rafiq Tarar',2831,'PK'),(167,'PAN','Panama','North America','Central America',75517.00,1903,2856000,75.5,9131.00,8700.00,'Panamá','Republic','Mireya Elisa Moscoso Rodríguez',2882,'PA'),(168,'PCN','Pitcairn','Oceania','Polynesia',49.00,0,50,0.0,0.00,0.00,'Pitcairn','Dependent Territory of the UK','Elisabeth II',2912,'PN'),(169,'PER','Peru','South America','South America',1285216.00,1821,25662000,70.0,64140.00,65186.00,'Perú/Piruw','Republic','Valentin Paniagua Corazao',2890,'PE'),(170,'PHL','Philippines','Asia','Southeast Asia',300000.00,1946,75967000,67.5,65107.00,82239.00,'Pilipinas','Republic','Gloria Macapagal-Arroyo',766,'PH'),(171,'PLW','Palau','Oceania','Micronesia',459.00,1994,19000,68.6,105.00,0.00,'Belau/Palau','Republic','Kuniwo Nakamura',2881,'PW'),(172,'PNG','Papua New Guinea','Oceania','Melanesia',462840.00,1975,4807000,63.1,4988.00,6328.00,'Papua New Guinea/Papua Niugini','Constitutional Monarchy','Elisabeth II',2884,'PG'),(173,'POL','Poland','Europe','Eastern Europe',323250.00,1918,38653600,73.2,151697.00,135636.00,'Polska','Republic','Aleksander Kwasniewski',2928,'PL'),(174,'PRI','Puerto Rico','North America','Caribbean',8875.00,0,3869000,75.6,34100.00,32100.00,'Puerto Rico','Commonwealth of the US','George W. Bush',2919,'PR'),(175,'PRK','North Korea','Asia','Eastern Asia',120538.00,1948,24039000,70.7,5332.00,0.00,'Choson Minjujuui In´min Konghwaguk (Bukhan)','Socialistic Republic','Kim Jong-il',2318,'KP'),(176,'PRT','Portugal','Europe','Southern Europe',91982.00,1143,9997600,75.8,105954.00,102133.00,'Portugal','Republic','Jorge Sampãio',2914,'PT'),(177,'PRY','Paraguay','South America','South America',406752.00,1811,5496000,73.7,8444.00,9555.00,'Paraguay','Republic','Luis Ángel González Macchi',2885,'PY'),(178,'PSE','Palestine','Asia','Middle East',6257.00,0,3101000,71.4,4173.00,0.00,'Filastin','Autonomous Area','Yasser (Yasir) Arafat',4074,'PS'),(179,'PYF','French Polynesia','Oceania','Polynesia',4000.00,0,235000,74.8,818.00,781.00,'Polynésie française','Nonmetropolitan Territory of France','Jacques Chirac',3016,'PF'),(180,'QAT','Qatar','Asia','Middle East',11000.00,1971,599000,72.4,9472.00,8920.00,'Qatar','Monarchy','Hamad ibn Khalifa al-Thani',2973,'QA'),(181,'REU','Réunion','Africa','Eastern Africa',2510.00,0,699000,72.7,8287.00,7988.00,'Réunion','Overseas Department of France','Jacques Chirac',3017,'RE'),(182,'ROM','Romania','Europe','Eastern Europe',238391.00,1878,22455500,69.9,38158.00,34843.00,'România','Republic','Ion Iliescu',3018,'RO'),(183,'RUS','Russian Federation','Europe','Eastern Europe',17075400.00,1991,146934000,67.2,276608.00,442989.00,'Rossija','Federal Republic','Vladimir Putin',3580,'RU'),(184,'RWA','Rwanda','Africa','Eastern Africa',26338.00,1962,7733000,39.3,2036.00,1863.00,'Rwanda/Urwanda','Republic','Paul Kagame',3047,'RW'),(185,'SAU','Saudi Arabia','Asia','Middle East',2149690.00,1932,21607000,67.8,137635.00,146171.00,'Al-´Arabiya as-Sa´udiya','Monarchy','Fahd ibn Abdul-Aziz al-Sa´ud',3173,'SA'),(186,'SDN','Sudan','Africa','Northern Africa',2505813.00,1956,29490000,56.6,10162.00,0.00,'As-Sudan','Islamic Republic','Omar Hassan Ahmad al-Bashir',3225,'SD'),(187,'SEN','Senegal','Africa','Western Africa',196722.00,1960,9481000,62.2,4787.00,4542.00,'Sénégal/Sounougal','Republic','Abdoulaye Wade',3198,'SN'),(188,'SGP','Singapore','Asia','Southeast Asia',618.00,1965,3567000,80.1,86503.00,96318.00,'Singapore/Singapura/Xinjiapo/Singapur','Republic','Sellapan Rama Nathan',3208,'SG'),(189,'SGS','South Georgia and the South Sandwich Islands','Antarctica','Antarctica',3903.00,0,0,0.0,0.00,0.00,'South Georgia and the South Sandwich Islands','Dependent Territory of the UK','Elisabeth II',0,'GS'),(190,'SHN','Saint Helena','Africa','Western Africa',314.00,0,6000,76.8,0.00,0.00,'Saint Helena','Dependent Territory of the UK','Elisabeth II',3063,'SH'),(191,'SJM','Svalbard and Jan Mayen','Europe','Nordic Countries',62422.00,0,3200,0.0,0.00,0.00,'Svalbard og Jan Mayen','Dependent Territory of Norway','Harald V',938,'SJ'),(192,'SLB','Solomon Islands','Oceania','Melanesia',28896.00,1978,444000,71.3,182.00,220.00,'Solomon Islands','Constitutional Monarchy','Elisabeth II',3161,'SB'),(193,'SLE','Sierra Leone','Africa','Western Africa',71740.00,1961,4854000,45.3,746.00,858.00,'Sierra Leone','Republic','Ahmed Tejan Kabbah',3207,'SL'),(194,'SLV','El Salvador','North America','Central America',21041.00,1841,6276000,69.7,11863.00,11203.00,'El Salvador','Republic','Francisco Guillermo Flores Pérez',645,'SV'),(195,'SMR','San Marino','Europe','Southern Europe',61.00,885,27000,81.1,510.00,0.00,'San Marino','Republic','',3171,'SM'),(196,'SOM','Somalia','Africa','Eastern Africa',637657.00,1960,10097000,46.2,935.00,0.00,'Soomaaliya','Republic','Abdiqassim Salad Hassan',3214,'SO'),(197,'SPM','Saint Pierre and Miquelon','North America','North America',242.00,0,7000,77.6,0.00,0.00,'Saint-Pierre-et-Miquelon','Territorial Collectivity of France','Jacques Chirac',3067,'PM'),(198,'STP','Sao Tome and Principe','Africa','Central Africa',964.00,1975,147000,65.3,6.00,0.00,'São Tomé e Príncipe','Republic','Miguel Trovoada',3172,'ST'),(199,'SUR','Suriname','South America','South America',163265.00,1975,417000,71.4,870.00,706.00,'Suriname','Republic','Ronald Venetiaan',3243,'SR'),(200,'SVK','Slovakia','Europe','Eastern Europe',49012.00,1993,5398700,73.7,20594.00,19452.00,'Slovensko','Republic','Rudolf Schuster',3209,'SK'),(201,'SVN','Slovenia','Europe','Southern Europe',20256.00,1991,1987800,74.9,19756.00,18202.00,'Slovenija','Republic','Milan Kucan',3212,'SI'),(202,'SWE','Sweden','Europe','Nordic Countries',449964.00,836,8861400,79.6,226492.00,227757.00,'Sverige','Constitutional Monarchy','Carl XVI Gustaf',3048,'SE'),(203,'SWZ','Swaziland','Africa','Southern Africa',17364.00,1968,1008000,40.4,1206.00,1312.00,'kaNgwane','Monarchy','Mswati III',3244,'SZ'),(204,'SYC','Seychelles','Africa','Eastern Africa',455.00,1976,77000,70.4,536.00,539.00,'Sesel/Seychelles','Republic','France-Albert René',3206,'SC'),(205,'SYR','Syria','Asia','Middle East',185180.00,1941,16125000,68.5,65984.00,64926.00,'Suriya','Republic','Bashar al-Assad',3250,'SY'),(206,'TCA','Turks and Caicos Islands','North America','Caribbean',430.00,0,17000,73.3,96.00,0.00,'The Turks and Caicos Islands','Dependent Territory of the UK','Elisabeth II',3423,'TC'),(207,'TCD','Chad','Africa','Central Africa',1284000.00,1960,7651000,50.5,1208.00,1102.00,'Tchad/Tshad','Republic','Idriss Déby',3337,'TD'),(208,'TGO','Togo','Africa','Western Africa',56785.00,1960,4629000,54.7,1449.00,1400.00,'Togo','Republic','Gnassingbé Eyadéma',3332,'TG'),(209,'THA','Thailand','Asia','Southeast Asia',513115.00,1350,61399000,68.6,116416.00,153907.00,'Prathet Thai','Constitutional Monarchy','Bhumibol Adulyadej',3320,'TH'),(210,'TJK','Tajikistan','Asia','Southern and Central Asia',143100.00,1991,6188000,64.1,1990.00,1056.00,'Toçikiston','Republic','Emomali Rahmonov',3261,'TJ'),(211,'TKL','Tokelau','Oceania','Polynesia',12.00,0,2000,0.0,0.00,0.00,'Tokelau','Nonmetropolitan Territory of New Zealand','Elisabeth II',3333,'TK'),(212,'TKM','Turkmenistan','Asia','Southern and Central Asia',488100.00,1991,4459000,60.9,4397.00,2000.00,'Türkmenostan','Republic','Saparmurad Nijazov',3419,'TM'),(213,'TMP','East Timor','Asia','Southeast Asia',14874.00,0,885000,46.0,0.00,0.00,'Timor Timur','Administrated by the UN','José Alexandre Gusmão',1522,'TP'),(214,'TON','Tonga','Oceania','Polynesia',650.00,1970,99000,67.9,146.00,170.00,'Tonga','Monarchy','Taufa\'ahau Tupou IV',3334,'TO'),(215,'TTO','Trinidad and Tobago','North America','Caribbean',5130.00,1962,1295000,68.0,6232.00,5867.00,'Trinidad and Tobago','Republic','Arthur N. R. Robinson',3336,'TT'),(216,'TUN','Tunisia','Africa','Northern Africa',163610.00,1956,9586000,73.7,20026.00,18898.00,'Tunis/Tunisie','Republic','Zine al-Abidine Ben Ali',3349,'TN'),(217,'TUR','Turkey','Asia','Middle East',774815.00,1923,66591000,71.0,210721.00,189122.00,'Türkiye','Republic','Ahmet Necdet Sezer',3358,'TR'),(218,'TUV','Tuvalu','Oceania','Polynesia',26.00,1978,12000,66.3,6.00,0.00,'Tuvalu','Constitutional Monarchy','Elisabeth II',3424,'TV'),(219,'TWN','Taiwan','Asia','Eastern Asia',36188.00,1945,22256000,76.4,256254.00,263451.00,'T’ai-wan','Republic','Chen Shui-bian',3263,'TW'),(220,'TZA','Tanzania','Africa','Eastern Africa',883749.00,1961,33517000,52.3,8005.00,7388.00,'Tanzania','Republic','Benjamin William Mkapa',3306,'TZ'),(221,'UGA','Uganda','Africa','Eastern Africa',241038.00,1962,21778000,42.9,6313.00,6887.00,'Uganda','Republic','Yoweri Museveni',3425,'UG'),(222,'UKR','Ukraine','Europe','Eastern Europe',603700.00,1991,50456000,66.0,42168.00,49677.00,'Ukrajina','Republic','Leonid Kutšma',3426,'UA'),(223,'UMI','United States Minor Outlying Islands','Oceania','Micronesia/Caribbean',16.00,0,0,0.0,0.00,0.00,'United States Minor Outlying Islands','Dependent Territory of the US','George W. Bush',0,'UM'),(224,'URY','Uruguay','South America','South America',175016.00,1828,3337000,75.2,20831.00,19967.00,'Uruguay','Republic','Jorge Batlle Ibáñez',3492,'UY'),(225,'USA','United States','North America','North America',9363520.00,1776,278357000,77.1,8510700.00,8110900.00,'United States','Federal Republic','George W. Bush',3813,'US'),(226,'UZB','Uzbekistan','Asia','Southern and Central Asia',447400.00,1991,24318000,63.7,14194.00,21300.00,'Uzbekiston','Republic','Islam Karimov',3503,'UZ'),(227,'VAT','Holy See (Vatican City State)','Europe','Southern Europe',0.40,1929,1000,0.0,9.00,0.00,'Santa Sede/Città del Vaticano','Independent Church State','Johannes Paavali II',3538,'VA'),(228,'VCT','Saint Vincent and the Grenadines','North America','Caribbean',388.00,1979,114000,72.3,285.00,0.00,'Saint Vincent and the Grenadines','Constitutional Monarchy','Elisabeth II',3066,'VC'),(229,'VEN','Venezuela','South America','South America',912050.00,1811,24170000,73.1,95023.00,88434.00,'Venezuela','Federal Republic','Hugo Chávez Frías',3539,'VE'),(230,'VGB','Virgin Islands, British','North America','Caribbean',151.00,0,21000,75.4,612.00,573.00,'British Virgin Islands','Dependent Territory of the UK','Elisabeth II',537,'VG'),(231,'VIR','Virgin Islands, U.S.','North America','Caribbean',347.00,0,93000,78.1,0.00,0.00,'Virgin Islands of the United States','US Territory','George W. Bush',4067,'VI'),(232,'VNM','Vietnam','Asia','Southeast Asia',331689.00,1945,79832000,69.3,21929.00,22834.00,'Viêt Nam','Socialistic Republic','Trân Duc Luong',3770,'VN'),(233,'VUT','Vanuatu','Oceania','Melanesia',12189.00,1980,190000,60.6,261.00,246.00,'Vanuatu','Republic','John Bani',3537,'VU'),(234,'WLF','Wallis and Futuna','Oceania','Polynesia',200.00,0,15000,0.0,0.00,0.00,'Wallis-et-Futuna','Nonmetropolitan Territory of France','Jacques Chirac',3536,'WF'),(235,'WSM','Samoa','Oceania','Polynesia',2831.00,1962,180000,69.2,141.00,157.00,'Samoa','Parlementary Monarchy','Malietoa Tanumafili II',3169,'WS'),(236,'YEM','Yemen','Asia','Middle East',527968.00,1918,18112000,59.8,6041.00,5729.00,'Al-Yaman','Republic','Ali Abdallah Salih',1780,'YE'),(237,'YUG','Yugoslavia','Europe','Southern Europe',102173.00,1918,10640000,72.4,17000.00,0.00,'Jugoslavija','Federal Republic','Vojislav Koštunica',1792,'YU'),(238,'ZAF','South Africa','Africa','Southern Africa',1221037.00,1910,40377000,51.1,116729.00,129092.00,'South Africa','Republic','Thabo Mbeki',716,'ZA'),(239,'ZMB','Zambia','Africa','Eastern Africa',752618.00,1964,9169000,37.2,3377.00,3922.00,'Zambia','Republic','Frederick Chiluba',3162,'ZM'),(240,'ZWE','Zimbabwe','Africa','Eastern Africa',390757.00,1980,11669000,37.8,5951.00,8670.00,'Zimbabwe','Republic','Robert G. Mugabe',4068,'ZW');
/*!40000 ALTER TABLE `pivot_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cycle_masters`
--

DROP TABLE IF EXISTS `pivot_cycle_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cycle_masters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `cycle_type` enum('Load','Test') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Load',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `duration_in_mins` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reason_for_faliure` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hospital_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cycle_masters`
--

LOCK TABLES `pivot_cycle_masters` WRITE;
/*!40000 ALTER TABLE `pivot_cycle_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_cycle_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_cycle_types`
--

DROP TABLE IF EXISTS `pivot_cycle_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_cycle_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_cycle_types`
--

LOCK TABLES `pivot_cycle_types` WRITE;
/*!40000 ALTER TABLE `pivot_cycle_types` DISABLE KEYS */;
INSERT INTO `pivot_cycle_types` VALUES (1,'Cycle ty[e1','2020-08-15 08:11:23','2020-08-15 08:11:23'),(2,'Load','2020-08-15 08:12:19','2020-08-15 08:12:19'),(3,'Test','2020-08-15 08:12:58','2020-08-15 08:12:58');
/*!40000 ALTER TABLE `pivot_cycle_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_department_locations`
--

DROP TABLE IF EXISTS `pivot_department_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_department_locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int unsigned NOT NULL,
  `owner_id` int unsigned NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_locations_department_id_foreign` (`department_id`),
  KEY `department_locations_owner_id_foreign` (`owner_id`),
  CONSTRAINT `department_locations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `pivot_departments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `department_locations_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_department_locations`
--

LOCK TABLES `pivot_department_locations` WRITE;
/*!40000 ALTER TABLE `pivot_department_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_department_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_department_types`
--

DROP TABLE IF EXISTS `pivot_department_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_department_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_department_types`
--

LOCK TABLES `pivot_department_types` WRITE;
/*!40000 ALTER TABLE `pivot_department_types` DISABLE KEYS */;
INSERT INTO `pivot_department_types` VALUES (1,'Central Sterile Services','Department that reprocesses instruments and other sterile goods','{\"modules\":{\"hospital_module\":{\"hospital_view\":true},\"instrument_master_module\":{\"instrument_master_view\":true},\"set_masters_module\":{\"set_masters_view\":true},\"users_module\":{\"users_view\":true},\"user_role_permissions_module\":{\"user_role_permissions_view\":true},\"inventory_home_module\":{\"inventory_home_view\":true},\"instruments_module\":{\"instruments_view\":true},\"sets_module\":{\"sets_view\":true},\"rfid_tag_addition_module\":{\"rfid_tag_addition_view\":true},\"rfid_tag_removal_module\":{\"rfid_tag_removal_view\":true},\"manual_status_module\":{\"manual_status_view\":true},\"vendors_module\":{\"vendors_view\":true},\"can_view_cost_data\":{\"can_view_cost_data\":true},\"can_view_charge_code\":{\"can_view_charge_code\":true},\"can_approve_import_of_new_inventory_from_HIS\":{\"can_approve_import_of_new_inventory_from_HIS\":true},\"new_indent_module\":{\"new_indent_view\":true},\"receive_indents_module\":{\"new_indent_view\":true},\"new_repair_slip_module\":{\"new_repair_slip_view\":true},\"repair_receipt_note_module\":{\"repair_receipt_note_view\":true},\"condemn_instrument_module\":{\"condemn_instrument_view\":true},\"tag_removal_module\":{\"tag_removal_view\":true},\"repair_reports_module\":{\"repair_reports_view\":true},\"receive_instruments_sets_module\":{\"receive_instruments_sets_view\":true},\"receipt_reports_module\":{\"receipt_reports_view\":true},\"pack_new_non_instrument_pack_module\":{\"pack_new_non_instrument_pack_view\":true},\"pack_new_set_module\":{\"pack_new_set_view\":true},\"override_shortage_in_set_module\":{\"override_shortage_in_set_view\":true},\"packing_reports_module\":{\"packing_reports_view\":true},\"sterilisation_batch_module\":{\"sterilisation_batch_view\":true},\"stop_rerun_batch_module\":{\"stop_rerun_batch_view\":true},\"reject_batch_module\":{\"reject_batch_view\":true},\"recall_batch_module\":{\"recall_batch_view\":true},\"finish_batch_module\":{\"finish_batch_view\":true},\"batch_reports_module\":{\"batch_reports_view\":true},\"new_dispatch_list_module\":{\"new_dispatch_list_view\":true},\"dispatch_reports_module\":{\"dispatch_reports_view\":true},\"sending_orders_module\":{\"sending_orders_view\":true},\"sending_sets_module\":{\"sending_sets_view\":true},\"sending_orders_summary_module\":{\"sending_orders_summary_view\":true},\"cssd_set_store_module\":{\"cssd_set_store_view\":true},\"new_incident_module\":{\"new_incident_view\":true},\"reply_to_incident_module\":{\"reply_to_incident_view\":true},\"resolve_incidents_module\":{\"resolve_incidents_view\":true},\"receive_repair_requests_module\":{\"receive_repair_requests_view\":true},\"return_repaired_items_module\":{\"return_repaired_items_view\":true},\"repair_reports_bio_module\":{\"repair_reports_bio_view\":true},\"receive_indents_purchase_module\":{\"receive_indents_purchase_view\":true},\"handover_indented_items_module\":{\"handover_indented_items_view\":true},\"indent_reports_purchase_module\":{\"indent_reports_purchase_view\":true},\"dashboard_module\":{\"dashboard_view\":true},\"hospital_master_module\":{\"hospital_master_view\":true},\"admin_role_module\":{\"admin_role_view\":true},\"reader_model_module\":{\"reader_model_view\":true},\"department_type_module\":{\"department_type_view\":true},\"admin_customisation_module\":{\"admin_customisation_view\":true},\"global_detach_rights_for_set_inventory\":{\"global_detach_rights_for_set_inventory\":true},\"can_view_api_logs\":{\"can_view_api_logs\":true},\"can_edit_customisation\":{\"can_edit_customisation\":true},\"can_setup_and_edit_sterilisation_master\":{\"can_setup_and_edit_sterilisation_master\":true},\"can_maintain_surgeries_and_procedures\":{\"can_maintain_surgeries_and_procedures\":true},\"can_view_Reports\":{\"can_view_Reports\":true},\"can_daily_summary_report_module\":{\"can_daily_summary_report_view\":true},\"can_incident_summary_report_module\":{\"can_incident_summary_report_view\":true},\"can_set_opening_consumption_report_module\":{\"can_set_opening_consumption_report_view\":true},\"ni_masters_module\":{\"ni_masters_view\":true},\"noninstrument_inventory_module\":{\"noninstrument_inventory_view\":true},\"ni_inventory_packs_module\":{\"ni_inventory_packs_view\":true},\"ni_inventory_packs_summary_module\":{\"ni_inventory_packs_summary_view\":true}}}','2017-07-13 04:44:52','2022-10-21 05:48:23'),(2,'End-User','Department that uses instruments and other sterile goods','{\"modules\":{\"hospital_module\":{\"hospital_view\":true},\"new_indent_module\":{\"new_indent_view\":true},\"receive_indents_module\":{\"new_indent_view\":true},\"new_repair_slip_module\":{\"new_repair_slip_view\":true},\"repair_receipt_note_module\":{\"repair_receipt_note_view\":true},\"condemn_instrument_module\":{\"condemn_instrument_view\":true},\"repair_reports_module\":{\"repair_reports_view\":true},\"acknowledge_sets_module\":{\"acknowledge_sets_view\":true},\"set_request_module\":{\"set_request_view\":true},\"surgical_whiteboard_module\":{\"surgical_whiteboard_view\":true},\"return_used_sets_module\":{\"return_used_sets_view\":true},\"mark_missing_faulty_instruments_module\":{\"mark_missing_faulty_instruments_view\":true},\"dashboard_module\":{\"dashboard_view\":true},\"can_view_case_schedules\":{\"can_view_case_schedules\":true},\"can_update_case_schedules\":{\"can_update_case_schedules\":true},\"can_view_consumption_tracking\":{\"can_view_consumption_tracking\":true},\"can_update_consumption_tracking\":{\"can_update_consumption_tracking\":true},\"can_maintain_surgeries_and_procedures\":{\"can_maintain_surgeries_and_procedures\":true},\"can_view_Reports\":{\"can_view_Reports\":true},\"can_ud_activity_summary_report_module\":{\"can_ud_activity_summary_report_view\":true},\"can_set_opening_consumption_report_module\":{\"can_set_opening_consumption_report_view\":true}}}','2017-07-13 04:44:52','2022-09-25 05:54:49'),(3,'Bio-medical','Department that handles repairs of instruments',NULL,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(4,'Purchase','Department that handles indents of instruments',NULL,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(5,'Billing','Department that handles patient billing',NULL,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(6,'Stores','Department that issues new instruments and goods for use',NULL,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(7,'System Integration','Department that handles api logs',NULL,'2017-07-13 04:44:52','2017-07-13 04:44:52');
/*!40000 ALTER TABLE `pivot_department_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_departments`
--

DROP TABLE IF EXISTS `pivot_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `department_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL,
  `owner_id` int unsigned NOT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_owner_id_foreign` (`owner_id`),
  CONSTRAINT `departments_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_departments`
--

LOCK TABLES `pivot_departments` WRITE;
/*!40000 ALTER TABLE `pivot_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_discard_comments`
--

DROP TABLE IF EXISTS `pivot_discard_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_discard_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int unsigned NOT NULL,
  `discarded_by` int unsigned NOT NULL,
  `discarded_on` date NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_discard_comments`
--

LOCK TABLES `pivot_discard_comments` WRITE;
/*!40000 ALTER TABLE `pivot_discard_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_discard_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_disinfectant_types`
--

DROP TABLE IF EXISTS `pivot_disinfectant_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_disinfectant_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `temperature` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_disinfectant_types`
--

LOCK TABLES `pivot_disinfectant_types` WRITE;
/*!40000 ALTER TABLE `pivot_disinfectant_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_disinfectant_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_dispatch`
--

DROP TABLE IF EXISTS `pivot_dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_dispatch` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `request_id` int unsigned NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `dispatched_by` int unsigned NOT NULL,
  `dispatched_to_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `porter_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dispatch_date` date NOT NULL,
  `ackn_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dispatch_request_id_foreign` (`request_id`),
  KEY `dispatch_hospital_id_foreign` (`hospital_id`),
  KEY `dispatch_dispatched_by_foreign` (`dispatched_by`),
  CONSTRAINT `dispatch_dispatched_by_foreign` FOREIGN KEY (`dispatched_by`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dispatch_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dispatch_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `pivot_requests` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_dispatch`
--

LOCK TABLES `pivot_dispatch` WRITE;
/*!40000 ALTER TABLE `pivot_dispatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_dispatch_details`
--

DROP TABLE IF EXISTS `pivot_dispatch_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_dispatch_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dispatch_id` int unsigned NOT NULL,
  `set_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dispatch_details_dispatch_id_foreign` (`dispatch_id`),
  KEY `dispatch_details_set_id_foreign` (`set_id`),
  CONSTRAINT `dispatch_details_dispatch_id_foreign` FOREIGN KEY (`dispatch_id`) REFERENCES `pivot_dispatch` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dispatch_details_set_id_foreign` FOREIGN KEY (`set_id`) REFERENCES `pivot_sets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_dispatch_details`
--

LOCK TABLES `pivot_dispatch_details` WRITE;
/*!40000 ALTER TABLE `pivot_dispatch_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_dispatch_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_dispatch_new`
--

DROP TABLE IF EXISTS `pivot_dispatch_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_dispatch_new` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `hospital_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `department_id` int unsigned NOT NULL,
  `current_department_id` int unsigned NOT NULL,
  `porter_id` int unsigned NOT NULL,
  `dispatch_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('PARTIAL','SENT','SAVED','UNDERPROCESS','PARTIAL_ACK','PARTIAL_REJ','ACKNOWLEDGED','RETURNED','REJECTED','DELETED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sent_date` timestamp NOT NULL DEFAULT '2019-10-01 06:19:48',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_dispatch_new`
--

LOCK TABLES `pivot_dispatch_new` WRITE;
/*!40000 ALTER TABLE `pivot_dispatch_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_dispatch_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_dispatch_sets`
--

DROP TABLE IF EXISTS `pivot_dispatch_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_dispatch_sets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dispatch_id` int unsigned NOT NULL,
  `set_id` int unsigned NOT NULL,
  `set_uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `available` int NOT NULL DEFAULT '0',
  `total_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('SAVED','SENT','ACKNOWLEDGED','REJECTED','DELETED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `department_id` int NOT NULL COMMENT 'User Department ID',
  `ackn_by` int NOT NULL COMMENT 'User ID',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'User Comments',
  `porter_id` int NOT NULL DEFAULT '0' COMMENT 'Porter ID Both for UD and CSSD',
  `sent_date` timestamp NOT NULL DEFAULT '2019-10-01 06:19:48',
  `found_by` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0' COMMENT '1 for by reader and 2 for by dmcode',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_dispatch_sets`
--

LOCK TABLES `pivot_dispatch_sets` WRITE;
/*!40000 ALTER TABLE `pivot_dispatch_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_dispatch_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_download_csv_report`
--

DROP TABLE IF EXISTS `pivot_download_csv_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_download_csv_report` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int NOT NULL,
  `request_by` int DEFAULT NULL,
  `filter_by` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `instrument_type` enum('SET','INSTRUMENT','ASSEMBLY') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'SET',
  `status` enum('PENDING','INPROGRESS','FAILED','SUCCESS') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'PENDING',
  `station` enum('INVENTORY','ACTIVITY_LOGS') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'ACTIVITY_LOGS',
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_download_csv_report`
--

LOCK TABLES `pivot_download_csv_report` WRITE;
/*!40000 ALTER TABLE `pivot_download_csv_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_download_csv_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_equipment_cycles`
--

DROP TABLE IF EXISTS `pivot_equipment_cycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_equipment_cycles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `equipment_id` int DEFAULT NULL,
  `cycle_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_equipment_cycles`
--

LOCK TABLES `pivot_equipment_cycles` WRITE;
/*!40000 ALTER TABLE `pivot_equipment_cycles` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_equipment_cycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_failed_jobs`
--

DROP TABLE IF EXISTS `pivot_failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_failed_jobs`
--

LOCK TABLES `pivot_failed_jobs` WRITE;
/*!40000 ALTER TABLE `pivot_failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_field_formatting`
--

DROP TABLE IF EXISTS `pivot_field_formatting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_field_formatting` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `field_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `format` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_field_formatting`
--

LOCK TABLES `pivot_field_formatting` WRITE;
/*!40000 ALTER TABLE `pivot_field_formatting` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_field_formatting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_hospital_additional_info`
--

DROP TABLE IF EXISTS `pivot_hospital_additional_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_hospital_additional_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `port` int DEFAULT NULL,
  `hospital_id` int unsigned NOT NULL,
  `sender_ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_additional_info_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `hospital_additional_info_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_hospital_additional_info`
--

LOCK TABLES `pivot_hospital_additional_info` WRITE;
/*!40000 ALTER TABLE `pivot_hospital_additional_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_hospital_additional_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_hospital_beds`
--

DROP TABLE IF EXISTS `pivot_hospital_beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_hospital_beds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hospital_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hospital_beds_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_hospital_beds`
--

LOCK TABLES `pivot_hospital_beds` WRITE;
/*!40000 ALTER TABLE `pivot_hospital_beds` DISABLE KEYS */;
INSERT INTO `pivot_hospital_beds` VALUES (1,'Select No. of Beds','2022-12-29 05:57:44','2022-12-29 05:57:44',0),(2,'0 - 100','2022-12-29 05:57:44','2022-12-29 05:57:44',0),(3,'101 - 500','2022-12-29 05:57:44','2022-12-29 05:57:44',0),(4,'501 - 1000','2022-12-29 05:57:44','2022-12-29 05:57:44',0),(5,'Over 1000','2022-12-29 05:57:44','2022-12-29 05:57:44',0);
/*!40000 ALTER TABLE `pivot_hospital_beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_hospital_departments`
--

DROP TABLE IF EXISTS `pivot_hospital_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_hospital_departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `department_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_departments_hospital_id_foreign` (`hospital_id`),
  KEY `hospital_departments_department_id_foreign` (`department_id`),
  CONSTRAINT `hospital_departments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `pivot_departments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hospital_departments_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_hospital_departments`
--

LOCK TABLES `pivot_hospital_departments` WRITE;
/*!40000 ALTER TABLE `pivot_hospital_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_hospital_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_hospital_profile`
--

DROP TABLE IF EXISTS `pivot_hospital_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_hospital_profile` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `hospital_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'INR',
  `currency_locale` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'auto',
  `max_no_of_user` tinyint NOT NULL DEFAULT '0',
  `upcoming_expiry_limit` int NOT NULL DEFAULT '75',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hospital_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pincode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `registration_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `billing_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `billing_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `billing_country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `billing_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `billing_pincode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_type_2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_beds` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_person_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_person_designation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_person_phoneno` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_person_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_person_first_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_person_last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_person_function` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `profile_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_hospital_profile`
--

LOCK TABLES `pivot_hospital_profile` WRITE;
/*!40000 ALTER TABLE `pivot_hospital_profile` DISABLE KEYS */;
INSERT INTO `pivot_hospital_profile` VALUES (1,3,'IND-Mumbai (Bombay)-PIVO1','INR','auto',100,75,'','','','eyJpdiI6Ik9UblZmNEorYVJrRlY3OEo2UzdYQVE9PSIsInZhbHVlIjoiQkRoclwvb3FTUWxGbmFCOFBBWTJ5NWFTWDdcL1grSmR4bDBnNWQxSmQrdnQ0PSIsIm1hYyI6ImRlYTk3NjhjNGM4MzAwZDM0NGI1YWNhODhmMTQ3YTgyNDQ3NDRmZTEyYjFmZTliMDZhMmE0NGIyMzY0MGZhMzYifQ==','RFH','eyJpdiI6IkkxcFFGN3R2UXdBV1M2T2xxVGhLZUE9PSIsInZhbHVlIjoieitVVDVvVElLVkt3aWFVeHpQcGJjZTNaRTFPSnFCOWpHRmcyVDY0U25LNUZXditDNWJZdUw0YTJPemwyRnhlaiIsIm1hYyI6Ijc3YmZmN2RjODgyOTU1M2I3OGZiMDdmNTE2MDA2MDBjNGQ5OWI4ZTM2ZWM3YTc1MmUxOTBlZWYyNDg3NmE0YzIifQ==','eyJpdiI6IlUwTkVGYWM3d1VxM0tEZ0JqZXNXK1E9PSIsInZhbHVlIjoiQ1poZDY4ZzNFbDJTSlJjZmphblhvZz09IiwibWFjIjoiNDE2NzMxZWY1NTdjMTYxYzExMDM3YTliN2IxMWUxODk1MTRjNjU4ZDFjOTliZGVhM2FmNzY3ZTkyODQ4ZjU0ZCJ9','IND','Mumbai (Bombay)','302020','PSF-1122','Pivot Health Tech','Mumbai','IND','Mumbai (Bombay)','302020','2','3','4','1','Manager','eyJpdiI6ImVPeXhPUERZSE1vV1BUUTU3eGJua3c9PSIsInZhbHVlIjoiaXJkQVJ5S3p3aVM3UWp5WlF3STBZZ1llZzJOa1JvZHBjeDdtTXF6VnArQT0iLCJtYWMiOiI2NmYyM2ViOTNmZjFkNzc0NDg2OGI3ZGRlMmViYjIyOWEzMWVmOTQ5ZThkM2Q1YWM4MmMxYWRkYTkwYmQ0YTQxIn0=','','eyJpdiI6IlIzdms5V0Y2YktBbDltNGpldE85cnc9PSIsInZhbHVlIjoiamkyR2xuREdaYmxHVDczbDd3WkNydmY5NXZVcjJLNjlzdXh2MFV0RnNTYz0iLCJtYWMiOiI4NWE4ZWFlOGMxOWIzMGUyOTFkZWM0OThkYTczMjI0Y2FjNzEwMDM4NWRiMzg0OTIyNzdhMDgzZWMwM2U1NDkyIn0=','2022-12-29 06:00:02','2022-12-29 06:00:02','eyJpdiI6IkNOUXp0bWZKSjRVMk1jR242UFR6c3c9PSIsInZhbHVlIjoiY1dPS2hEdXp3YXNvVDNHVGVvUEY5dz09IiwibWFjIjoiMGQxMjJkM2ViMmJjMzI1NWZiNWNjMjBlZWJlNWE4ZDc1ODc2YTFiZTA2Y2U4YTg4YmVhNzY0NmQ1ZmU2OTNkMCJ9','PSF','9','UTC');
/*!40000 ALTER TABLE `pivot_hospital_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_hospital_roles`
--

DROP TABLE IF EXISTS `pivot_hospital_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_hospital_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `department_type_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_roles_hospital_id_foreign` (`hospital_id`),
  KEY `hospital_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `hospital_roles_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hospital_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `pivot_roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_hospital_roles`
--

LOCK TABLES `pivot_hospital_roles` WRITE;
/*!40000 ALTER TABLE `pivot_hospital_roles` DISABLE KEYS */;
INSERT INTO `pivot_hospital_roles` VALUES (1,1,2,0,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(2,1,3,0,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(3,1,4,0,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(4,1,5,0,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(5,1,6,0,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(6,1,7,0,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(7,1,8,0,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(8,1,9,0,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(9,1,10,0,'2017-07-13 04:44:52','2017-07-13 04:44:52'),(277,3,239,1,'2022-12-29 06:00:02','2022-12-29 06:00:02'),(278,3,240,1,'2022-12-29 06:00:02','2022-12-29 06:00:02'),(279,3,241,1,'2022-12-29 06:00:02','2022-12-29 06:00:02'),(280,3,242,1,'2022-12-29 06:00:02','2022-12-29 06:00:02'),(281,3,243,1,'2022-12-29 06:00:02','2022-12-29 06:00:02'),(282,3,244,2,'2022-12-29 06:00:02','2022-12-29 06:00:02'),(283,3,245,2,'2022-12-29 06:00:02','2022-12-29 06:00:02'),(284,3,246,2,'2022-12-29 06:00:02','2022-12-29 06:00:02');
/*!40000 ALTER TABLE `pivot_hospital_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_hospital_shortcodes`
--

DROP TABLE IF EXISTS `pivot_hospital_shortcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_hospital_shortcodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned DEFAULT NULL,
  `short_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_hospital_shortcodes`
--

LOCK TABLES `pivot_hospital_shortcodes` WRITE;
/*!40000 ALTER TABLE `pivot_hospital_shortcodes` DISABLE KEYS */;
INSERT INTO `pivot_hospital_shortcodes` VALUES (1,3,'AA','2022-12-29 06:00:02','2022-12-29 06:00:02');
/*!40000 ALTER TABLE `pivot_hospital_shortcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_hospital_sites`
--

DROP TABLE IF EXISTS `pivot_hospital_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_hospital_sites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hospital_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hospital_sites_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_hospital_sites`
--

LOCK TABLES `pivot_hospital_sites` WRITE;
/*!40000 ALTER TABLE `pivot_hospital_sites` DISABLE KEYS */;
INSERT INTO `pivot_hospital_sites` VALUES (1,'Select Site','2017-07-13 04:44:52','2017-07-13 04:44:52',0),(2,'Single Site','2017-07-13 04:44:52','2017-07-13 04:44:52',0),(3,'Multi Site','2017-07-13 04:44:52','2017-07-13 04:44:52',0);
/*!40000 ALTER TABLE `pivot_hospital_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_hospital_types`
--

DROP TABLE IF EXISTS `pivot_hospital_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_hospital_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hospital_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hospital_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_hospital_types`
--

LOCK TABLES `pivot_hospital_types` WRITE;
/*!40000 ALTER TABLE `pivot_hospital_types` DISABLE KEYS */;
INSERT INTO `pivot_hospital_types` VALUES (1,'Select Type ','2017-07-13 04:44:52','2017-07-13 04:44:52',0),(2,'Private','2017-07-13 04:44:52','2017-07-13 04:44:52',0),(3,'Government','2017-07-13 04:44:52','2017-07-13 04:44:52',0);
/*!40000 ALTER TABLE `pivot_hospital_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_hospital_users`
--

DROP TABLE IF EXISTS `pivot_hospital_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_hospital_users` (
  `hospital_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `hospital_users_user_id_foreign` (`user_id`),
  CONSTRAINT `hospital_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_hospital_users`
--

LOCK TABLES `pivot_hospital_users` WRITE;
/*!40000 ALTER TABLE `pivot_hospital_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_hospital_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_incident_actions`
--

DROP TABLE IF EXISTS `pivot_incident_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_incident_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` int unsigned NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'instrument/set action mark_as_found etc',
  `action_by` int unsigned NOT NULL COMMENT 'Supervisor ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `new_instrument_id` int unsigned NOT NULL COMMENT 'In case of instrument replace',
  `incident_action_type` enum('instrument','set') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `incident_instrument_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_incident_actions`
--

LOCK TABLES `pivot_incident_actions` WRITE;
/*!40000 ALTER TABLE `pivot_incident_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_incident_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_incident_history`
--

DROP TABLE IF EXISTS `pivot_incident_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_incident_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` int unsigned NOT NULL COMMENT 'Incidnet ID',
  `hospital_id` int unsigned NOT NULL COMMENT 'Hospital ID',
  `old_incident` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Old Incident Data',
  `new_incident` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'New Incident Data',
  `old_action` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Old Incident Action Table Data',
  `new_action` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'New Incident Action Table Data',
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'comment',
  `action_by` int unsigned NOT NULL COMMENT 'Supervisor ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_incident_history`
--

LOCK TABLES `pivot_incident_history` WRITE;
/*!40000 ALTER TABLE `pivot_incident_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_incident_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_incident_instrument_history`
--

DROP TABLE IF EXISTS `pivot_incident_instrument_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_incident_instrument_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int NOT NULL,
  `incident_instrument_id` int NOT NULL,
  `incident_id` int NOT NULL,
  `hospital_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `old_action` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `new_action` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_incident_instrument_history`
--

LOCK TABLES `pivot_incident_instrument_history` WRITE;
/*!40000 ALTER TABLE `pivot_incident_instrument_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_incident_instrument_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_incident_instrument_sub_parts`
--

DROP TABLE IF EXISTS `pivot_incident_instrument_sub_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_incident_instrument_sub_parts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int NOT NULL,
  `sub_part_id` bigint NOT NULL DEFAULT '0',
  `raised_by` int NOT NULL DEFAULT '0',
  `incident_id` int NOT NULL,
  `type_id` tinyint NOT NULL DEFAULT '0' COMMENT 'for know that Instrument type Normal Instrument or Assembly.',
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `incident_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('DONE','PENDING','DISCUSSION','REPLY','RESOLVE','ASSIGN','REOPEN','OPEN') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'PENDING',
  `user_id` int NOT NULL,
  `linked_incident_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_incident_instrument_sub_parts`
--

LOCK TABLES `pivot_incident_instrument_sub_parts` WRITE;
/*!40000 ALTER TABLE `pivot_incident_instrument_sub_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_incident_instrument_sub_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_incident_instruments`
--

DROP TABLE IF EXISTS `pivot_incident_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_incident_instruments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int NOT NULL,
  `raised_by` int NOT NULL DEFAULT '0',
  `sub_part_id` bigint NOT NULL DEFAULT '0',
  `incident_id` int NOT NULL,
  `incident_department` int DEFAULT NULL,
  `last_found_department` int DEFAULT NULL,
  `incident_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_found_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type_id` tinyint NOT NULL DEFAULT '0' COMMENT 'for know that Instrument type Normal Instrument or Assembly.',
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `incident_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('DONE','PENDING','DISCUSSION','REPLY','RESOLVE','ASSIGN','REOPEN','OPEN') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'PENDING',
  `user_id` int NOT NULL,
  `linked_incident_id` int NOT NULL,
  `assembly_override` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0' COMMENT '1 for true and 0 for false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_incident_instruments`
--

LOCK TABLES `pivot_incident_instruments` WRITE;
/*!40000 ALTER TABLE `pivot_incident_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_incident_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_incident_repair_ticket`
--

DROP TABLE IF EXISTS `pivot_incident_repair_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_incident_repair_ticket` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `repair_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `incident_id` int NOT NULL,
  `type_id` tinyint NOT NULL DEFAULT '0' COMMENT 'for know that Instrument type Normal Instrument or Assembly.',
  `instrument_id` int NOT NULL,
  `sub_part_id` bigint NOT NULL DEFAULT '0',
  `incident_instrument_id` int NOT NULL,
  `incident_instrument_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` int NOT NULL,
  `user_id` int NOT NULL,
  `repair_vendor_id` int NOT NULL,
  `set_id` int NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `instrument_data` json NOT NULL,
  `estimated_return_date` datetime NOT NULL COMMENT 'Estimated Date Time When Creating new repair Ticket',
  `is_updated_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0' COMMENT 'If Instrument is in Flow will 0 else 1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_incident_repair_ticket`
--

LOCK TABLES `pivot_incident_repair_ticket` WRITE;
/*!40000 ALTER TABLE `pivot_incident_repair_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_incident_repair_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_incident_sub_part_actions`
--

DROP TABLE IF EXISTS `pivot_incident_sub_part_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_incident_sub_part_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` int unsigned NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'instrument/set action mark_as_found etc',
  `action_by` int unsigned NOT NULL COMMENT 'Supervisor ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `new_instrument_id` int unsigned NOT NULL COMMENT 'In case of instrument replace',
  `incident_action_type` enum('instrument','set') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `incident_sub_part_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_incident_sub_part_actions`
--

LOCK TABLES `pivot_incident_sub_part_actions` WRITE;
/*!40000 ALTER TABLE `pivot_incident_sub_part_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_incident_sub_part_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_incident_types`
--

DROP TABLE IF EXISTS `pivot_incident_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_incident_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `incident_types_name_hospital_id_unique` (`name`,`hospital_id`),
  KEY `incident_types_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `incident_types_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_incident_types`
--

LOCK TABLES `pivot_incident_types` WRITE;
/*!40000 ALTER TABLE `pivot_incident_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_incident_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_approval_logs`
--

DROP TABLE IF EXISTS `pivot_instrument_approval_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_approval_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'instruments',
  `user_id` int NOT NULL,
  `action_date` date NOT NULL,
  `import_date` date NOT NULL,
  `hospital_id` int NOT NULL,
  `instrument_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `requested_qty` int DEFAULT NULL,
  `received_qty` int DEFAULT NULL,
  `new_value` json DEFAULT NULL,
  `old_value` json DEFAULT NULL,
  `edited_fields` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `provisional_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('APPROVED','REJECTED','DELETED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'APPROVED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_approval_logs`
--

LOCK TABLES `pivot_instrument_approval_logs` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_approval_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instrument_approval_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_category`
--

DROP TABLE IF EXISTS `pivot_instrument_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int unsigned NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instrument_category_category_name_hospital_id_unique` (`category_name`,`hospital_id`),
  KEY `instrument_category_hospital_id_foreign` (`hospital_id`),
  KEY `instrument_category_type_id_foreign` (`type_id`),
  CONSTRAINT `instrument_category_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `instrument_category_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `pivot_instrument_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_category`
--

LOCK TABLES `pivot_instrument_category` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instrument_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_discard_comment`
--

DROP TABLE IF EXISTS `pivot_instrument_discard_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_discard_comment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discarded_by` int NOT NULL,
  `discarded_on` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_discard_comment`
--

LOCK TABLES `pivot_instrument_discard_comment` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_discard_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instrument_discard_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_log_activities`
--

DROP TABLE IF EXISTS `pivot_instrument_log_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_log_activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `instrument_id` int DEFAULT NULL COMMENT 'Instrument table ID',
  `hospital_id` int DEFAULT NULL,
  `action_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Status change (Missing mark, damage mark, etc)',
  `old_workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Old workflow status before change',
  `workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Workflow status after change',
  `station` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'At which job change was done (packing / returning etc.)',
  `usage_count` int NOT NULL COMMENT 'Usage count before action taken.',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `department_id` int DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set_id` int unsigned NOT NULL,
  `set_unique_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `instrument_data` json NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `receiving_department_id` int NOT NULL DEFAULT '0',
  `receiving_porter_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_log_activities`
--

LOCK TABLES `pivot_instrument_log_activities` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_log_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instrument_log_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_logs`
--

DROP TABLE IF EXISTS `pivot_instrument_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int unsigned NOT NULL,
  `date` date NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'current state name',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'current location name',
  `department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handled_by` int unsigned NOT NULL COMMENT 'User ID',
  `hospital_id` int DEFAULT NULL,
  `old_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci COMMENT 'dump of old instrument record in database',
  `new_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci COMMENT 'dump of new instrument record in database',
  `read_by` int unsigned NOT NULL COMMENT 'Reader ID if available otherwise set to 0',
  `batch_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'NULL' COMMENT 'Damaged Image Of Instrument',
  `created_at_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_found_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_found_department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `incident_department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `incident_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `open_set_status` tinyint NOT NULL DEFAULT '0',
  `ster_batch_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `old_instrument_id` int unsigned NOT NULL,
  `new_instrument_id` int unsigned NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `source` int unsigned NOT NULL COMMENT 'Source Department ID',
  `found_by` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0' COMMENT '1 for by reader and 2 for by dmcode',
  `receiving_department_id` int NOT NULL DEFAULT '0',
  `receiving_porter_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `instrument_logs_created_at_module_index` (`created_at`,`module`),
  KEY `instrument_logs_created_at_date_index` (`created_at_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_logs`
--

LOCK TABLES `pivot_instrument_logs` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instrument_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_master`
--

DROP TABLE IF EXISTS `pivot_instrument_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_master` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  `age` int unsigned NOT NULL,
  `max_use_cycle` int NOT NULL DEFAULT '10',
  `category_id` int unsigned NOT NULL,
  `instrument_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `instrument_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `disinfection_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `handling_instructions` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vendor_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `instrument_master_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `charge_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code_generation_type` enum('auto','manual') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instrument_master_instrument_code_unique` (`instrument_code`),
  KEY `instrument_master_type_id_foreign` (`type_id`),
  KEY `instrument_master_category_id_foreign` (`category_id`),
  CONSTRAINT `instrument_master_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `pivot_instrument_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `instrument_master_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `pivot_instrument_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_master`
--

LOCK TABLES `pivot_instrument_master` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instrument_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_sub_part`
--

DROP TABLE IF EXISTS `pivot_instrument_sub_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_sub_part` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_master_id` int unsigned NOT NULL,
  `belong_instrument_id` int NOT NULL,
  `short_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `datamatrix_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sub_part_master_id` int NOT NULL,
  `instrument_master_code` int DEFAULT NULL,
  `used_subpart_id` bigint NOT NULL DEFAULT '0',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `ud_dep_id` int NOT NULL,
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `latest_damage_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_tagged` enum('NO','YES') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_of_tagging` datetime DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location_id` int unsigned NOT NULL,
  `department_id` int unsigned NOT NULL,
  `last_sending_department_id` int NOT NULL DEFAULT '0' COMMENT 'Last User (CSSD,UD) Department ID',
  `last_user_department_id` int NOT NULL DEFAULT '0' COMMENT 'Last User (Only UD) Department ID (UD STORE DEPARTMENT ID)',
  `last_read_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Last Read by Mobile or Fixed Reader',
  `last_read_department_id` int NOT NULL DEFAULT '0' COMMENT 'Last reader department id',
  `last_read_location_id` int NOT NULL DEFAULT '0' COMMENT 'Last reader location id',
  `current_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `vendor_id` int NOT NULL,
  `vendor_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `vendor_item_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vendor_uid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rfid_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_of_purchase` date NOT NULL,
  `warranty_from` date NOT NULL,
  `warranty_to` date NOT NULL,
  `expiry_date` date NOT NULL,
  `serial_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lot_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('UNASSIGNED','ASSIGNED','OK','REPAIR','MISSING','LOST','CONDEMNED','OUTOFDATE','USED','DAMAGED','PROCESSING','RECALLED','INUSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usage_count` int NOT NULL DEFAULT '0',
  `sterlization_expiry` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `owner_id` int unsigned NOT NULL,
  `instrument_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `state` enum('OK','REPAIR','MISSING','LOST','CONDEMNED','OUTOFDATE','USED','DAMAGED') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usability_status` enum('INACTIVE','ACTIVE','DEFECTIVE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `workflow_status` enum('UNASSIGNED','DISCARDED','ASSIGNED','INUSE','PROCESSING','AVAILABLE','RECALLED','OUTOFDATE','USED','INACTIVE','MISSING','DAMAGED','REPAIR','LOST','CONDEMNED','RETURNED','FOUND','REPAIR RETURN','CONSUMED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `old_workflow_status` json NOT NULL,
  `member_status` enum('OK','REPAIR','MISSING','LOST','CONDEMNED','OUTOFDATE','USED','DAMAGED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'OK',
  `last_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `instrument_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `transit` tinyint NOT NULL DEFAULT '0',
  `last_used` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `instruments_instrument_master_id_foreign` (`instrument_master_id`),
  KEY `instruments_owner_id_foreign` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_sub_part`
--

LOCK TABLES `pivot_instrument_sub_part` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_sub_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instrument_sub_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_sub_part_log_activities`
--

DROP TABLE IF EXISTS `pivot_instrument_sub_part_log_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_sub_part_log_activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `instrument_id` int DEFAULT NULL COMMENT 'Instrument table ID',
  `sub_part_id` int NOT NULL,
  `hospital_id` int DEFAULT NULL,
  `action_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Status change (Missing mark, damage mark, etc)',
  `old_workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Old workflow status before change',
  `workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Workflow status after change',
  `station` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'At which job change was done (packing / returning etc.)',
  `usage_count` int NOT NULL COMMENT 'Usage count before action taken.',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `department_id` int DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set_id` int unsigned NOT NULL,
  `set_unique_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `instrument_data` json NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_sub_part_log_activities`
--

LOCK TABLES `pivot_instrument_sub_part_log_activities` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_sub_part_log_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instrument_sub_part_log_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_sub_part_logs`
--

DROP TABLE IF EXISTS `pivot_instrument_sub_part_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_sub_part_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int unsigned NOT NULL,
  `sub_part_instrument_id` int NOT NULL,
  `sub_part_master_id` int NOT NULL,
  `date` date NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'current state name',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'current location name',
  `department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handled_by` int unsigned NOT NULL COMMENT 'User ID',
  `hospital_id` int DEFAULT NULL,
  `old_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'dump of old instrument record in database',
  `new_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'dump of new instrument record in database',
  `read_by` int unsigned NOT NULL COMMENT 'Reader ID if available otherwise set to 0',
  `batch_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'NULL' COMMENT 'Damaged Image Of Instrument',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_found_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_found_department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `incident_department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `incident_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `open_set_status` tinyint NOT NULL DEFAULT '0',
  `ster_batch_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `old_instrument_id` int unsigned NOT NULL,
  `new_instrument_id` int unsigned NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `source` int unsigned NOT NULL COMMENT 'Source Department ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_sub_part_logs`
--

LOCK TABLES `pivot_instrument_sub_part_logs` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_sub_part_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instrument_sub_part_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_sub_parts_master`
--

DROP TABLE IF EXISTS `pivot_instrument_sub_parts_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_sub_parts_master` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `instrument_master_id` int unsigned NOT NULL,
  `qty` int unsigned NOT NULL DEFAULT '0',
  `part_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `sub_part_mastercode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sub_part_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_sub_parts_master`
--

LOCK TABLES `pivot_instrument_sub_parts_master` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_sub_parts_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instrument_sub_parts_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instrument_types`
--

DROP TABLE IF EXISTS `pivot_instrument_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instrument_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hospital_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instrument_types_type_name_unique` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instrument_types`
--

LOCK TABLES `pivot_instrument_types` WRITE;
/*!40000 ALTER TABLE `pivot_instrument_types` DISABLE KEYS */;
INSERT INTO `pivot_instrument_types` VALUES (1,'Tray','2017-07-14 04:44:52','2017-07-14 04:44:52',0),(2,'Instrument','2017-07-14 04:44:52','2017-07-14 04:44:52',0),(3,'Assembly','2017-07-14 04:44:52','2017-07-14 04:44:52',0);
/*!40000 ALTER TABLE `pivot_instrument_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_instruments`
--

DROP TABLE IF EXISTS `pivot_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_instruments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_master_id` int unsigned NOT NULL,
  `instrument_master_code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `provisional_instrument_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `short_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `old_short_codes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `datamatrix_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type_id` tinyint NOT NULL,
  `loose_pack` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-> Normal instrument, 1-> Loose pack',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `ud_dep_id` int NOT NULL,
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `latest_damage_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_tagged` enum('NO','YES') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_of_tagging` datetime DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location_id` int unsigned NOT NULL,
  `at_cleaning_station_flag` tinyint(1) NOT NULL DEFAULT '0',
  `department_id` int unsigned NOT NULL,
  `last_sending_department_id` int NOT NULL DEFAULT '0' COMMENT 'Last User (CSSD,UD) Department ID',
  `last_user_department_id` int NOT NULL DEFAULT '0' COMMENT 'Last User (Only UD) Department ID (UD STORE DEPARTMENT ID)',
  `last_read_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Last Read by Mobile or Fixed Reader',
  `last_read_department_id` int NOT NULL DEFAULT '0' COMMENT 'Last reader department id',
  `last_read_location_id` int NOT NULL DEFAULT '0' COMMENT 'Last reader location id',
  `current_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `vendor_id` int NOT NULL,
  `vendor_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `vendor_item_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vendor_uid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rfid_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_of_purchase` date NOT NULL,
  `warranty_from` date NOT NULL,
  `warranty_to` date NOT NULL,
  `expiry_date` date NOT NULL,
  `serial_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lot_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('UNASSIGNED','ASSIGNED','OK','REPAIR','MISSING','LOST','CONDEMNED','OUTOFDATE','USED','DAMAGED','PROCESSING','RECALLED','INUSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usage_count` int NOT NULL DEFAULT '0',
  `sterlization_expiry` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `owner_id` int unsigned NOT NULL,
  `instrument_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `state` enum('OK','REPAIR','MISSING','LOST','CONDEMNED','OUTOFDATE','USED','DAMAGED') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usability_status` enum('INACTIVE','ACTIVE','DEFECTIVE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `workflow_status` enum('UNASSIGNED','ASSIGNED','INUSE','PROCESSING','AVAILABLE','RECALLED','OUTOFDATE','USED','INACTIVE','MISSING','DAMAGED','REPAIR','LOST','CONDEMNED','RETURNED','D&M','UNDERMAINTENANCE','FOUND','REPAIR RETURN','CONSUMED','PENDING','REJECTED','DELETED','DISCARDED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `old_workflow_status` json NOT NULL,
  `member_status` enum('OK','REPAIR','MISSING','LOST','CONDEMNED','OUTOFDATE','USED','DAMAGED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'OK',
  `last_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `instrument_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `charge_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transit` tinyint NOT NULL DEFAULT '0',
  `last_used` datetime NOT NULL,
  `optional_field1` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `optional_field2` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `optional_field3` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `optional_field4` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `optional_field5` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `optional_field6` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `optional_field7` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `optional_field8` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `optional_field9` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `optional_field10` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `api_ref_no` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `import_date_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `consumed_status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instruments_instrument_master_id_foreign` (`instrument_master_id`),
  KEY `instruments_owner_id_foreign` (`owner_id`),
  KEY `DISCARDED` (`member_status`),
  CONSTRAINT `instruments_instrument_master_id_foreign` FOREIGN KEY (`instrument_master_id`) REFERENCES `pivot_instrument_master` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `instruments_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_instruments`
--

LOCK TABLES `pivot_instruments` WRITE;
/*!40000 ALTER TABLE `pivot_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_inventory_request_api_logs`
--

DROP TABLE IF EXISTS `pivot_inventory_request_api_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_inventory_request_api_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `api_request_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hospital_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('SUCCESS','PARTIAL SUCCESS','FAILED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'SUCCESS',
  `api_request_type` enum('Inventory','Case Schedule','Consumption Tracking') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `request_type` enum('ADD','UPDATE','DELETE','CANCEL','GET') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'ADD',
  `api_callback_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `api_callback_status_code` bigint DEFAULT NULL,
  `api_callback_message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `message_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_inventory_request_api_logs`
--

LOCK TABLES `pivot_inventory_request_api_logs` WRITE;
/*!40000 ALTER TABLE `pivot_inventory_request_api_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_inventory_request_api_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_item_master_types`
--

DROP TABLE IF EXISTS `pivot_item_master_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_item_master_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_item_master_types`
--

LOCK TABLES `pivot_item_master_types` WRITE;
/*!40000 ALTER TABLE `pivot_item_master_types` DISABLE KEYS */;
INSERT INTO `pivot_item_master_types` VALUES (1,'SINGLEUSE','2022-07-18 04:31:02','2022-07-18 04:31:02'),(2,'REUSEABLE','2022-07-18 04:31:02','2022-07-18 04:31:02');
/*!40000 ALTER TABLE `pivot_item_master_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_jobs`
--

DROP TABLE IF EXISTS `pivot_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_jobs`
--

LOCK TABLES `pivot_jobs` WRITE;
/*!40000 ALTER TABLE `pivot_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_loaner_purpose_codes`
--

DROP TABLE IF EXISTS `pivot_loaner_purpose_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_loaner_purpose_codes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loaner_purpose_codes_name_hospital_id_unique` (`name`,`hospital_id`),
  KEY `loaner_purpose_codes_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `loaner_purpose_codes_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_loaner_purpose_codes`
--

LOCK TABLES `pivot_loaner_purpose_codes` WRITE;
/*!40000 ALTER TABLE `pivot_loaner_purpose_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_loaner_purpose_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_loaner_types`
--

DROP TABLE IF EXISTS `pivot_loaner_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_loaner_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_loaner_types`
--

LOCK TABLES `pivot_loaner_types` WRITE;
/*!40000 ALTER TABLE `pivot_loaner_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_loaner_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_loaners`
--

DROP TABLE IF EXISTS `pivot_loaners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_loaners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `loaner_type_id` int unsigned DEFAULT NULL,
  `count` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `special_notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loaners_loaner_type_id_foreign` (`loaner_type_id`),
  CONSTRAINT `loaners_loaner_type_id_foreign` FOREIGN KEY (`loaner_type_id`) REFERENCES `pivot_loaner_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_loaners`
--

LOCK TABLES `pivot_loaners` WRITE;
/*!40000 ALTER TABLE `pivot_loaners` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_loaners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_log_errors`
--

DROP TABLE IF EXISTS `pivot_log_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_log_errors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `message` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` int DEFAULT NULL,
  `file` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `line` int DEFAULT NULL,
  `trace` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `request_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_errors_request_id_index` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_log_errors`
--

LOCK TABLES `pivot_log_errors` WRITE;
/*!40000 ALTER TABLE `pivot_log_errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_log_errors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_log_ips`
--

DROP TABLE IF EXISTS `pivot_log_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_log_ips` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `loc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `org` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `total_c` int DEFAULT '0',
  `total_c_error` int DEFAULT '0',
  `is_finished` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_ips_ip_unique` (`ip`),
  KEY `log_ips_country_index` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_log_ips`
--

LOCK TABLES `pivot_log_ips` WRITE;
/*!40000 ALTER TABLE `pivot_log_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_log_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_log_queries`
--

DROP TABLE IF EXISTS `pivot_log_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_log_queries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `query` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bindings` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `time` double(8,2) DEFAULT NULL,
  `connection_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_elequent` tinyint DEFAULT NULL,
  `request_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_queries_request_id_index` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_log_queries`
--

LOCK TABLES `pivot_log_queries` WRITE;
/*!40000 ALTER TABLE `pivot_log_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_log_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_log_requests`
--

DROP TABLE IF EXISTS `pivot_log_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_log_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `action` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `parameters` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `route_uri` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `route_static_prefix` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `session_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `session_data` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `queries_total_time` double(8,2) DEFAULT '0.00',
  `queries_total_count` int DEFAULT '0',
  `queries_not_elequent_count` int DEFAULT '0',
  `exec_time` double(8,2) DEFAULT NULL,
  `has_errors` tinyint DEFAULT '0',
  `is_json_response` tinyint DEFAULT '0',
  `archive_tag` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_log_requests`
--

LOCK TABLES `pivot_log_requests` WRITE;
/*!40000 ALTER TABLE `pivot_log_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_log_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_loose_instruments`
--

DROP TABLE IF EXISTS `pivot_loose_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_loose_instruments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int NOT NULL,
  `set_id` int NOT NULL,
  `returned` tinyint NOT NULL,
  `porter_id` int NOT NULL,
  `department_id` int NOT NULL,
  `workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `instrument_data` json NOT NULL,
  `hospital_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_loose_instruments`
--

LOCK TABLES `pivot_loose_instruments` WRITE;
/*!40000 ALTER TABLE `pivot_loose_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_loose_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_loose_instruments_bulkpack_batches`
--

DROP TABLE IF EXISTS `pivot_loose_instruments_bulkpack_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_loose_instruments_bulkpack_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_loose_instruments_bulkpack_batches`
--

LOCK TABLES `pivot_loose_instruments_bulkpack_batches` WRITE;
/*!40000 ALTER TABLE `pivot_loose_instruments_bulkpack_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_loose_instruments_bulkpack_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_loose_sub_parts`
--

DROP TABLE IF EXISTS `pivot_loose_sub_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_loose_sub_parts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int NOT NULL,
  `sub_part_id` int NOT NULL,
  `set_id` int NOT NULL,
  `returned` tinyint NOT NULL,
  `porter_id` int NOT NULL,
  `department_id` int NOT NULL,
  `workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sub_part_data` json NOT NULL,
  `hospital_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_loose_sub_parts`
--

LOCK TABLES `pivot_loose_sub_parts` WRITE;
/*!40000 ALTER TABLE `pivot_loose_sub_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_loose_sub_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_message_to`
--

DROP TABLE IF EXISTS `pivot_message_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_message_to` (
  `message_id` int unsigned NOT NULL,
  `user_to` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_message_to`
--

LOCK TABLES `pivot_message_to` WRITE;
/*!40000 ALTER TABLE `pivot_message_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_message_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_messages`
--

DROP TABLE IF EXISTS `pivot_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int unsigned NOT NULL,
  `to` int unsigned NOT NULL,
  `from` int unsigned NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `action_descriptor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `instrument_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `read` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `deleted` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `action_type` enum('SET','INSTRUMENT','COMMENT','SUBPART') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'COMMENT',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_messages`
--

LOCK TABLES `pivot_messages` WRITE;
/*!40000 ALTER TABLE `pivot_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_migrations`
--

DROP TABLE IF EXISTS `pivot_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_migrations`
--

LOCK TABLES `pivot_migrations` WRITE;
/*!40000 ALTER TABLE `pivot_migrations` DISABLE KEYS */;
INSERT INTO `pivot_migrations` VALUES (1,'2014_01_07_073615_create_tagged_table',1),(2,'2014_01_07_073615_create_tags_table',1),(3,'2014_07_02_230147_migration_cartalyst_sentinel',1),(4,'2016_06_01_000001_create_oauth_auth_codes_table',1),(5,'2016_06_01_000002_create_oauth_access_tokens_table',1),(6,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(7,'2016_06_01_000004_create_oauth_clients_table',1),(8,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(9,'2016_06_29_073615_create_tag_groups_table',1),(10,'2016_06_29_073615_update_tags_table',1),(11,'2017_05_18_063756_create_modules_action_tables',1),(12,'2017_05_24_110439_create_custom_tables',1),(13,'2017_06_02_060558_create_pivot_db_schema',1),(14,'2017_06_30_075543_create_countries_cities_tables',1),(15,'2017_07_05_115526_alter_users_table',1),(16,'2017_07_07_110728_create_patients_table',1),(17,'2017_07_07_135821_create_new_custom_table',1),(18,'2017_07_10_130810_create_loaners_consumables_table',1),(19,'2017_07_14_124059_update_pivot_profile',1),(20,'2017_07_14_133323_pivot_function',1),(21,'2017_07_15_110201_alter_pivot_reader_types',1),(22,'2017_07_17_052557_create_set_instruments_table',1),(23,'2017_07_17_063650_delete_pivot_departments_field',1),(24,'2017_07_17_141238_alter_pivot_contact_function',1),(25,'2017_07_18_060328_pivot_disinfectant',1),(26,'2017_07_18_071136_create_requests_table',1),(27,'2017_07_18_084111_create_hospital_types_table',1),(28,'2017_07_18_091625_alter_hospital_sites_table',1),(29,'2017_07_18_094802_alter_hospital_beds_table',1),(30,'2017_07_19_090732_add_new_filed_users_table',1),(31,'2017_07_19_092358_alter_pivot_profile_name',1),(32,'2017_07_19_101356_create_pivot_rfids_table',1),(33,'2017_07_19_125017_create_pivot_hospital_users',1),(34,'2017_07_21_061134_alter_instrument_types',1),(35,'2017_07_21_064856_alter_role_users_table',1),(36,'2017_07_21_080358_alter_hospital_types',1),(37,'2017_07_21_103119_create_route_permission_table',1),(38,'2017_07_25_120630_update_status_to_requests_table',1),(39,'2017_07_25_122429_create_sterilization_types_table',1),(40,'2017_07_25_140248_alter_users_table_mobile',1),(41,'2017_07_26_063320_alter_users_table_4_employeecode',1),(42,'2017_07_27_055709_add_order_id_to_requests_table',1),(43,'2017_07_28_064820_create_sterilization_table',1),(44,'2017_07_28_102603_add_hospital_id_to_requests_patients_surgeries_table',1),(45,'2017_07_31_092636_add_status_to_requests_table',1),(46,'2017_07_31_120146_alter_user_table_title',1),(47,'2017_07_31_134139_alter_departments_table_contactperson',1),(48,'2017_08_01_074853_create_dispatch_table',1),(49,'2017_08_02_061417_alter_user_table_for_timezone',1),(50,'2017_08_03_115437_alter_set_table_added_state_column',1),(51,'2017_08_04_074024_alter_contact_function_table',1),(52,'2017_08_04_074605_create_contact_function_table',1),(53,'2017_08_04_114834_alter_contact_function_table_for_hospitalid',1),(54,'2017_08_04_121742_alter_hospital_profile_table_for_hospital_code',1),(55,'2017_08_08_071424_alter_reader_types_table_for_manufacturer',1),(56,'2017_08_08_094712_alter_reader_types_table_for_code',1),(57,'2017_08_08_110607_add_consumption_report_to_patient_procedure_table',1),(58,'2017_08_10_051930_alter_roles_table_for_hospital_id',1),(59,'2017_08_12_064511_alter_instrument_table_add_state_column',1),(60,'2017_08_12_112343_alter_set_table_add_available_status_enum',1),(61,'2017_08_14_060056_create_title_table',1),(62,'2017_08_14_060432_add_used_status_to_sets_table',1),(63,'2017_08_14_061047_add_used_status_to_instruments_table',1),(64,'2017_08_14_091601_create_reader_model_type_table',1),(65,'2017_08_16_061619_create_menu_based_tables',1),(66,'2017_08_16_081950_add_damaged_to_instruments_table',1),(67,'2017_08_17_074603_alter_set_status_added_notused_status',1),(68,'2017_08_17_094424_create_hospital_additional_info_table',1),(69,'2017_08_18_051428_alter_sterilization_table_add_enum_status',1),(70,'2017_08_18_061202_alter_batches_table_added_column_is_removed',1),(71,'2017_08_18_092601_alter_hospital_roles_table',1),(72,'2017_08_18_120521_alter_sterilization_type_table',1),(73,'2017_08_22_061559_add_sender_id_to_hospital_additional_info_table',1),(74,'2017_08_24_104605_alter_instruments_table',1),(75,'2017_08_24_115104_alter_role_users_table_for_dept_id',1),(76,'2017_08_26_072145_alter_request_table',1),(77,'2017_08_26_135532_alter_disinfectant_types_table_for_sterilization_process',1),(78,'2017_08_28_045232_alter_set_and_instrument_table',1),(79,'2017_08_28_061618_instrument_and_set_logs_tables',1),(80,'2017_08_29_070913_alter_instrumentlogs_setlogs_table',1),(81,'2017_09_04_063800_alter_instruments_table_to_insert_enum_values',1),(82,'2017_09_05_074208_alter_pivot_readers_table',1),(83,'2017_09_05_123054_alter_set_table_stelization_count_added',1),(84,'2017_09_07_054711_pivot_register_devices_table',1),(85,'2017_09_07_101337_add_field_pivot_register_devices_table',1),(86,'2017_09_11_121935_create_csv_upload_table',1),(87,'2017_09_12_043507_alter_set_table',1),(88,'2017_09_12_113010_add_field_csv_upload_table',1),(89,'2017_09_12_130823_add_batch__process_log_table',1),(90,'2017_09_13_083655_add_dispatchnew_table',1),(91,'2017_09_15_112350_create_pivot_alert_incident_table',1),(92,'2017_09_15_121312_alter_setsLog_instrumentLogs_table',1),(93,'2017_09_18_062004_create_pivot_summary_table',1),(94,'2017_09_20_090854_alter_insrument_and_set_table',1),(95,'2017_09_20_125338_alter_hospital_profile_table_for_timezone',1),(96,'2017_09_21_071011_add_new_patient_table',1),(97,'2017_09_26_084449_alter_dispatch_new_table_added_status',1),(98,'2017_09_28_175140_alter_users_table_for_dateformat',1),(99,'2017_09_29_122649_create_action_logs_table',1),(100,'2017_10_03_092744_alter_dispatch_new_table',1),(101,'2017_10_03_132034_create_users_table',1),(102,'2017_10_03_132115_add_field_batch_process_log',1),(103,'2017_10_03_154254_alter_instrument_and_instrument_master_table',1),(104,'2017_10_04_162030_alter_dispatch_table_status',1),(105,'2017_10_09_052524_add_return_set_table',1),(106,'2017_10_09_085332_alter_dispatch_new_table_for_saved_status',1),(107,'2017_10_09_114859_alter_instrument_table',1),(108,'2017_10_09_125409_alter_sterilization_dateTime',1),(109,'2017_10_11_110535_alter_dispatch_sets_table_field',1),(110,'2017_10_11_133743_alter_summary_logs_add_hospital_id',1),(111,'2017_10_11_134644_alter_dispatch_new_table_for_underprocess_status',1),(112,'2017_10_12_072954_add_new_field_sets_table',1),(113,'2017_10_12_074623_alter_set_table_added_oldworkflowstatus',1),(114,'2017_10_23_094555_alter_set_log_table_for_sending_dispatch',1),(115,'2017_10_23_125351_alter_dispatch_new_table_for_enums_partial_rej_and_partial_ack',1),(116,'2017_10_23_125920_alter_set_logs_expiry_date',1),(117,'2017_10_23_133829_alter_dispatch_new_table_for_enums_acknowledged_and_returned',1),(118,'2017_10_25_103058_alter_packDate_in_SetTable',1),(119,'2017_10_27_114716_alter_set_and_setlogs_table',1),(120,'2017_10_27_124831_alter_setExpiryDate',1),(121,'2017_10_27_151135_alter_instrument_and_instrumentlogs_table',1),(122,'2017_10_30_062149_alter_sterilization_table_for_add_enum_for_delete',1),(123,'2017_10_30_090817_add_field_sets_table',1),(124,'2017_10_31_065313_alter_sterlisation_batch_table',1),(125,'2017_10_31_112914_alter_instrument_log_table',1),(126,'2017_10_31_123851_add_new_field_set_logs_table',1),(127,'2017_11_01_121025_alter_dispatch_sets_table',1),(128,'2017_11_02_070041_drop_column_sets_table',1),(129,'2017_11_02_103731_alter_set_log_table_and_instrument',1),(130,'2017_11_06_083314_alter_reader_table_for_timeout',1),(131,'2017_11_06_123133_alter_set_table_added_source_column',1),(132,'2017_11_10_120407_alter_dispatch_new_table_added_rejected_status',1),(133,'2017_11_13_064112_alter_patients_surgeries_table_added_complete_column',1),(134,'2017_11_14_112850_alter_instrument_master_added_column_max_use',1),(135,'2017_11_16_100538_alter_set_instrument_table_added_column',1),(136,'2017_11_16_111420_alter_alert_incidents_table_for_module_name',1),(137,'2017_11_23_062932_alter_upload_csv_table_for_type_datatype_change',1),(138,'2017_11_24_085802_alter_alert_incidents',1),(139,'2017_11_27_091248_add_thread_table',1),(140,'2017_11_28_063530_alter_setlogs_with_source',1),(141,'2017_11_28_072049_alter_instrumentlogs_with_source',1),(142,'2017_11_28_103814_added_incident_actions_table',1),(143,'2017_11_29_054638_alter_incident_actions_table',1),(144,'2017_11_29_073136_alter_sterilize_table_with_currentDepartment_id',1),(145,'2017_11_29_085945_alter_incidents_table',1),(146,'2017_11_30_054359_addded_incident_history_table',1),(147,'2017_12_05_123035_added_new_table_for_set_instrument_actions',1),(148,'2017_12_07_064812_added_swb_set_with_instrument_actions',1),(149,'2017_12_18_092739_update_patients_surgeries_and_set_log_table',1),(150,'2017_12_27_122107_added_field_into_alert_incident_table',1),(151,'2018_01_02_083810_added_set_uniid_field_into_alert_incident_table',1),(152,'2018_01_02_094831_added_batch_id_column_alert_incident_table',1),(153,'2018_01_05_132411_add_old_comment_set_field_table',1),(154,'2018_01_06_073101_alter_dispacth_new_table',1),(155,'2018_01_09_120502_add_packing_summary_tables',1),(156,'2018_01_11_092108_change_surgery_set_and_instrument_json_data',1),(157,'2018_01_11_105039_adding_column_dispatch_sets_ackn_by',1),(158,'2018_01_18_084919_create_instrument_log_activity_table',1),(159,'2018_01_22_072035_set_log_activity_table_added',1),(160,'2018_01_23_124610_create_sessions_table',1),(161,'2018_01_31_125138_updateset_table_added_old_transit_state',1),(162,'2018_02_02_073131_add_set_table_sending_last_read_last_user_dp_column',1),(163,'2018_02_13_110354_alter_dispatch_sets_table_for_comment',1),(164,'2018_02_14_131958_alter_instrument_table_for_usagecount',1),(165,'2018_02_15_090911_alter_instrument_log_table_for_image',1),(166,'2018_03_01_073358_alter_upload_csv_table_enum_add_vendor',1),(167,'2018_03_05_094148_add_dispatch_sets_porter_id',1),(168,'2018_03_07_083523_add_set_activity_table_start_date_end_date_time',1),(169,'2018_03_12_062908_alter_batch_sets_table_for_porter_id',1),(170,'2018_03_16_070121_AlterUploadCsvAddEnums',1),(171,'2018_03_20_120503_add_image_column_into_incident_table',1),(172,'2018_03_26_071023_add_incident_instruments',1),(173,'2018_03_27_065006_alter_reader_table_for_deactivate_reason',1),(174,'2018_03_27_123830_add_incident_instrument_history',1),(175,'2018_03_29_063351_repair_table_create',1),(176,'2018_03_29_065126_create_mismatch_instrument_table',1),(177,'2018_03_30_091329_packed_instrument_added_column_packing_time_workflow',1),(178,'2018_03_31_065417_alter_mismatch_instrument_table_for_setid',1),(179,'2018_03_31_070101_create_mismatch_sets_table',1),(180,'2018_04_02_151528_added_linked_instrument_id',1),(181,'2018_04_04_085037_add_reply_comment_table',1),(182,'2018_04_06_121815_add_message_to_table',1),(183,'2018_04_07_082444_alter_table_for_incident_comment_action_type',1),(184,'2018_04_12_112216_user_activity_log',1),(185,'2018_04_18_091408_add_reciept_log_and_images_table_added',1),(186,'2018_04_23_083522_add_receipt_number',1),(187,'2018_04_25_051936_aleter_repair_receipt_table_column',1),(188,'2018_04_25_125624_alter_repair_ticket_added_column',1),(189,'2018_04_30_131344_added_column_on_set_activity_table',1),(190,'2018_05_02_093711_edit_instrument_log_activity_table',1),(191,'2018_05_10_084446_instrument_log_activities_added_image_column',1),(192,'2018_05_14_064540_create_reader_master_table',1),(193,'2018_05_30_075052_alter_sterilization_batches_table_for_finish_date',1),(194,'2018_06_01_060226_change_surgical_action_type',1),(195,'2018_06_05_074049_added_packing_meterial_table',1),(196,'2018_06_05_133335_set_table_added_member_status_loose_instrument',1),(197,'2018_06_11_103612_instrument_loose_table_adding',1),(198,'2018_06_11_121519_add_enum_returned_in_instruments_table',1),(199,'2018_06_26_120621_add_incident_instrument_type',1),(200,'2018_07_02_113838_set_log_activity_added_batch-status',1),(201,'2018_07_05_121401_added_column_sr_no_and_prefix_into_tables',1),(202,'2018_07_06_050447_added_table_serial_number_table',1),(203,'2018_07_30_105936_alter_hospitalprofile_table_for_address_type_text',1),(204,'2018_07_31_071526_added_packing_indicator_table',1),(205,'2018_07_31_094217_alter_sets_table_pk_indicator_id',1),(206,'2018_08_02_094339_alter_indicator_table_for_short_name',1),(207,'2018_08_02_123649_added_latest_damage_image_on_instrument',1),(208,'2018_08_03_052306_alter_sets_logs_table_for_indicators',1),(209,'2018_08_08_115545_alter_sessions_for_created_at_table',1),(210,'2018_08_13_094823_alter_loose_ins_table_for_department_id',1),(211,'2018_08_16_061724_alter_table_set_logs_for_instruments_count_table',1),(212,'2018_08_20_101348_alter_instruments_for_date_of_taggingtable',1),(213,'2018_08_30_091013_alter_instrument_logs_for_open_set_status_table',1),(214,'2018_09_03_065626_alter_instrument_logs_last_found_location_table',1),(215,'2018_10_04_113130_alter_instrument_logs_last_found_department_table',1),(216,'2018_10_12_105659_create_temp_table_for_logs_table',1),(217,'2018_10_29_074424_update_set_master_forReason_For_Deactivation_table',1),(218,'2018_11_05_094935_create_non_instrument_inventory_categories_table',1),(219,'2018_11_05_095844_create_unit_of_measurement_table',1),(220,'2018_11_12_091944_create_non-instrument_items_table',1),(221,'2018_11_15_122241_alter_packing_material_table',1),(222,'2018_11_16_092707_alter_non_instrument_items_fortracibilty_table',1),(223,'2018_11_26_113233_add_instrument_sub_parts_master_table',1),(224,'2018_11_28_084849_create_sub_part_instrument_table',1),(225,'2018_11_30_101508_alter_instruments_for_type_id_table',1),(226,'2018_12_04_073801_create_instrument_sub_part_logs_table',1),(227,'2018_12_13_104642_create_set_sub_parts_instruments_table',1),(228,'2018_12_26_105006_alter_rfids_forenum_type_add_table',1),(229,'2018_12_31_093710_alter_set_table_for_master_id',1),(230,'2019_01_08_070827_alter_instruments_for_newenum_table',1),(231,'2019_01_09_112753_alter_packed_instruments_for_new_fields_table',1),(232,'2019_01_13_100729_alter_inatruments_sub_parts_table_for_used_sub_part_table',1),(233,'2019_01_21_103719_rename_stnk_column',1),(234,'2019_02_06_124420_alter_instruments_for_new_enum_table',1),(235,'2019_02_08_092238_alter_pivot_incident_repair_ticket_table',1),(236,'2019_02_22_102632_add_enum_outdated_with_reprocessing_workflow_status_in_pivot_sets_table',1),(237,'2019_02_25_062411_alter_instruments_and_sub_parts_table',1),(238,'2019_02_25_073432_create_new_table_for_incidents_sub_parts_table',1),(239,'2019_02_25_084205_create_hospital_shortcodes_table',1),(240,'2019_02_25_084402_create_assets_type_shortcodes_table',1),(241,'2019_02_26_060512_add_instrument_qrcode_in_instruments_and_subpart_table',1),(242,'2019_02_26_095131_change_short_code_column_in_assets_type_shortcodes_table',1),(243,'2019_02_26_111420_add_set_qrcode_in_pivot_sets_table',1),(244,'2019_02_26_121329_change_qrcode_name_in_set_instrument_and_subpart_table',1),(245,'2019_02_27_062536_add_enum_outdated_at_ud_in_workflow_status_of_pivot_sets_table',1),(246,'2019_02_27_064457_add_qr_code_in_sets_instruments_subpart_table',1),(247,'2019_03_04_091515_aleter_instruments_for_undermaintinance_for_ws_table',1),(248,'2019_03_05_111944_create_incident_sub_part_actions_table',1),(249,'2019_03_13_071917_add_loose_pack_in_instruments_table',1),(250,'2019_03_13_084247_alter_incident_instruments_override_assembly_table',1),(251,'2019_03_15_104816_update_sets_table_for_count',1),(252,'2019_03_26_130518_alter_sets_table_for_incomplete_assembly',1),(253,'2019_03_28_113059_create_loose_instruments_bulk_pack_batches_table',1),(254,'2019_03_29_065509_alter_sterilization_batches_for_count_table',1),(255,'2019_03_29_091138_alter_dispatch_sets_for_count_table',1),(256,'2019_04_01_062626_update_sets_table_for_category_id',1),(257,'2019_04_02_124619_create_temp_table_for_logs',1),(258,'2019_04_03_073529_set_table_for_extra_field',1),(259,'2019_04_16_072758_create_loose_sub_parts_table',1),(260,'2019_04_24_144716_alter_loose_instruments_bulk_pack_batches_table',1),(261,'2019_04_25_050545_alter_temp_table_for_logs_new_enum',1),(262,'2019_04_29_102000_create_download_csv_report_table',1),(263,'2019_05_02_124401_alter_incident_repair_ticket_for_inatrument_name',1),(264,'2019_05_16_054513_alter_instruments_and_sub_parts_table_for_new_workflow_status',1),(265,'2019_05_29_090210_alter_instrument_table_for_old_worflow_status',1),(266,'2019_06_12_095030_alter_sessions_table_for_hospital_id',1),(267,'2019_06_28_074334_create_subpart_incident_history',1),(268,'2019_07_15_130854_alter_subpart_instrument_table_history',1),(269,'2019_08_21_052131_alter_reader_table_for_is_deleted',1),(270,'2019_08_30_114605_alter_vendor_table_for_name',1),(271,'2019_09_10_111657_alter_set_table_for_STERILISATIONRECALL',1),(272,'2019_09_11_113713_alter_set_table_for_STERILISATIONRECALLR',1),(273,'2019_09_17_091908_alter_temp_table_for_logs_for_sending_department_id',1),(274,'2019_09_20_093209_alter_sets_table',1),(275,'2019_09_23_063726_alter_set_master_instruments_for_sequence',1),(276,'2019_09_23_130419_update_packed_instrument_found_by_reader',1),(277,'2019_09_27_102344_create_migration_sequence_for_set_instrument_table',1),(278,'2019_09_27_114904_alter_packed_set_table',1),(280,'2019_10_09_120941_alter_alert_incidents_for_is_read_and_is_archived',2),(281,'2019_10_15_073118_alter_hospital_profile_for_upcoming_expiry_limit',3),(282,'2019_10_16_044410_alter_messages__action_descriptors',4),(284,'2019_10_24_120854_alter_dispatch_sets_table_with_foundBy',6),(285,'2019_10_30_095956_alter_sterilization_batches_with_found_by',7),(286,'2019_10_23_102002_alter_hospital_profile_currency_locale',8),(288,'2019_11_06_130343_alter_non_instrument_items_for_dm_code',9),(289,'2019_11_09_045546_alter_instruments_table_for_new_ws',10),(290,'2019_11_11_062257_alter_instruments_log_with_found_by',11),(291,'2019_11_11_075505_alter_return_sets_with_found_by',11),(292,'2019_11_19_085520_alter_patients_surgeries_for_end_date',12),(293,'2019_11_26_101608_create_audits_table',13),(294,'2019_11_28_102803_create_inventory_request_table',14),(295,'2019_11_29_090445_create_inventory_request_api_logs',14),(296,'2019_12_02_084613_alter_instrument_for_pending_ws',15),(297,'2019_12_03_110911_alter_instrument_for_rejected_ws',16),(298,'2019_12_03_111546_create_instrument_approval_logs',16),(299,'2019_12_04_095155_alter_inventory_api_request_logs',17),(300,'2019_12_04_114735_alter_inventory_request_table',17),(301,'2019_12_04_134222_alter_instrument_for_provisonal_instrument_id',18),(302,'2019_12_05_065725_alter_user_table_for_his_intigration',19),(303,'2019_12_10_110810_alter_instrument_table_for_optional_fields',20),(304,'2019_12_10_111841_create_optional_field_mapping',20),(305,'2019_12_12_093527_alter_optional_field_table_with_enum',21),(306,'2019_12_13_134636_alter_inventory_requests_for_uuid',22),(307,'2019_12_18_093342_alter_inventory_request_api_logs_fo_change_field_name',23),(308,'2019_12_19_105522_alter_inventory_request_api_logs_for_status_field',24),(309,'2019_12_24_131432_alter_instrument_table_for_api_ref_no',25),(312,'2020_01_03_064610_create_bulk_approval_request',26),(313,'2020_01_06_062129_create_bulk_approval_csv_logs',26),(314,'2020_01_15_113750_alter_reader_table_for_original_short_name',27),(315,'2020_01_16_075305_alter_instrument_import_date_type_change',28),(316,'2020_01_28_103729_alter_users_table_for_api_integration',29),(317,'2020_01_28_131624_alter_inventory_requests_for_callback_data',30),(318,'2020_01_29_113715_alter_patients_surgeries_for_status',31),(319,'2020_01_30_073328_alter_inventory_request_api_logg_for_callback',31),(320,'2020_01_31_060224_alter_patients_surgeries_for_case_id',32),(321,'2020_02_03_124940_alter_patient_surgries_table_with_locationid',32),(322,'2020_02_04_071603_alter_inventory_request_api_logs_for_api_request_type',32),(323,'2020_02_05_123836_alter_patients_surgries_table_with_prefix',33),(324,'2020_02_06_104907_alter_inventory_request_api_logs_for_api_type',34),(325,'2020_02_06_122958_alter_patients_surgeries_table_with_sr_no',34),(326,'2020_02_10_112256_alter_patients_surgeries_for_request_id_and_api_sheduled_user',35),(327,'2020_02_12_080053_alter_patient_surgeries_table_with_status',36),(328,'2020_02_13_051935_alter_patients_surgeries_for_wheelin_time_and_wheelout_time',37),(329,'2018_07_15_113730_create_log_requests_table',38),(330,'2018_07_15_113731_create_log_errors_table',38),(331,'2018_07_15_113732_create_log_queries_table',38),(332,'2018_07_15_113740_create_log_ips_table',38),(333,'2020_03_04_070411_alter_set_master_table_for_packing_material',39),(334,'2020_03_11_070230_alter_hospital_user_table_for_mapping_hospital_id',40),(335,'2020_03_16_120917_alter_patient_surgries_with_comment',41),(336,'2020_05_14_073122_create_patients_surgeries_for_update_enum_table',42),(337,'2020_07_28_154339_create_cycle_master',43),(338,'2020_07_30_085009_create_equipment_cycles',43),(339,'2020_07_31_061824_create_test_cycles',44),(340,'2020_08_05_115545_create_cycle_types',45),(341,'2020_08_05_144710_create_reason_for_cycle_failurs',45),(342,'2020_08_11_105542_create_set_indicators',46),(343,'2020_08_14_055705_alter_sterilization_for_cycle_type',47),(344,'2020_08_15_075336_alter_sterilization_for_cycle_no',48),(345,'2020_08_18_032229_alter_sterilization_for_finished_by_table',49),(346,'2020_08_21_034739_create_sterilization_cycle_reports_table',50),(347,'2020_09_01_074524_create_sterilization_logs_table',51),(348,'2020_09_08_030228_alter_incidents_for_incident_department_table',51),(349,'2020_10_12_112101_alter_department_types_table',52),(350,'2020_10_20_113531_alter_sterilization_for_reject_date_table',53),(352,'2021_03_03_085132_create_instrument_discard_comment_table',54),(354,'2021_03_05_070357_add_extra__enum_to__instruments__table',55),(356,'2021_03_05_085001_create_discard_comments_table',56),(357,'2021_03_24_094323_alter_single_use_device_column_to_users_table',57),(359,'2021_03_25_064925_alter_instrument_master_code_generation_type',58),(360,'2021_03_30_042319_alter_modify_enums_in_instrumet_master_table',59),(361,'2021_04_23_063232_alter_column_visit_id_to_table_pivot_patients_surgeries',60),(362,'2021_03_05_083215_alter_extra_new_enum_to_instruments_table',61),(364,'2021_05_17_092608_alter_delete_enum_both_dispatch_tables',62),(368,'2021_05_26_053554_alter_rewrite_enums_of_ws_in_instruments_table',63),(369,'2021_07_14_053451_alter_table_surgeon_names_increase_varchar_limit',63),(373,'2021_03_05_113349_create_discard_comments_table',64),(374,'2021_07_14_060424_alter_table_surgeon_names_increase_varchar_limit',65),(375,'2021_07_28_113028_create_user_verifies_table',66),(378,'2021_07_29_113028_create_user_verifies_table',67),(379,'2021_08_03_080949_alter_user_status_column_in_users_table',67),(381,'2021_08_11_122931_alter_column_login_attempt_to_users_table',68),(382,'2021_10_29_074754_create_surgical_specialities_table',69),(383,'2021_11_09_104133_alter_workorderstatus_column_to_users_table',70),(385,'2021_11_15_093125_create_procedure_masters_table',71),(386,'2022_02_01_060714_alter_image_column_to_set_releated_tables',72),(387,'2022_05_19_045151_alter_old_short_code_column_to_instruments_table',73),(388,'2022_06_10_065130_alter_non_instrument_column_to_users_table',74),(389,'2022_06_16_070325_alter_prefix_and_seriesno_to_non_instrument_items_table',75),(390,'2022_06_16_101017_alter_prefix_and_seriesno_to_non_instrument_inventory_categories_table',76),(393,'2022_06_17_104841_create_pack_masters_table',77),(394,'2022_06_17_105651_create_pack_master_items_table',77),(395,'2022_06_27_052039_alter_new_enum_to_upload_csv_table',78),(396,'2022_07_07_071226_create_applicable_processes_table',79),(397,'2022_07_13_054836_create_item_master_types_table',80),(399,'2022_07_13_061739_alter_new_columns_to_non_instrument_items_table',81),(402,'2022_07_14_095506_alter_new_columns_to_pack_master_table',82),(403,'2022_07_21_063000_create_reorder_levels_table',83),(411,'2022_08_11_125405_create_parent_packs_table',84),(412,'2022_08_11_130240_create_n_i_packs_table',84),(413,'2022_08_11_135459_create_n_i_bulk_pack_batches_table',84),(414,'2022_08_17_054543_create_ni_pack_serial_numbers_table',84),(416,'2022_08_29_054923_alter_packing_material_column_to_non_instrument_items_table',85),(417,'2022_08_29_124734_create_ni_item_logs_table',86),(421,'2022_09_13_103733_alter_coloum_sterprocessid_to_non_instrument_items_table',87),(424,'2022_09_28_124456_alter_charge_code_column_into_some_exiting_tables',88),(425,'2022_10_04_073245_alter_create_receiving_department_into_set_logs_tables',89),(426,'2022_09_19_112943_create_webhook_table',90),(427,'2022_09_21_120456_create_jobs_table',90),(428,'2022_09_21_122139_create_failed_jobs_table',90),(431,'2022_09_27_063910_create_optional_field_values',91),(432,'2022_09_27_072549_alter_table_optional_field_mapping_add_searchable_column',91),(435,'2022_10_10_055704_alter_optional_field_mapping_update_applies_to',92),(436,'2022_10_10_060704_alter_receiving_depart_and_porter_id_colums',93),(437,'2022_10_12_063058_alter_table_optional_field_values_update_hospital_foreign_key',94),(438,'2022_10_19_172002_alter_new_enum_to_optional_field_mapping_table',95),(439,'2022_10_27_104255_alter_new_columns_to_optional_field_values_table',96),(444,'2022_10_28_171545_create_non_instrument_api_datas_table',97),(446,'2022_10_31_061155_alter_mapping_code_colums_to_item_and_pack_master_table',98),(449,'2022_11_02_101624_alter_master_type_to_ni_api_data_table',99),(450,'2022_11_09_101648_create_table_non_instruments',100),(451,'2022_11_11_130353_alter_table_non_instruments_add_columns',101),(452,'2022_11_14_070532_add_index_pivot_instrument_logs',102),(458,'2022_11_14_090601_alter_location_column_and_type_change_to_non_instrument',103),(459,'2022_11_15_055150_update_bulk_approval_csv_request_add_type_column',104),(460,'2022_11_15_060558_update_non_instrument_api_data_add_is_csv_process_column',104),(461,'2022_11_16_111912_update_instrument_approval_logs_add_type_column',105),(462,'2022_11_17_111223_alter_tbale_non_instruments_add_quantities_columns',106),(463,'2022_11_17_123706_alter_table_instruments_approval_logs_add_quantities_columns',106),(464,'2022_11_18_081624_update_table_names_for_non_instruments',106),(465,'2022_11_18_083044_alter_table_non_instrument_pack_master_add_ready_to_use_column',106),(466,'2022_10_26_115807_alter_table_patient_surgery_add_case_type_column',107),(467,'2022_11_23_075441_alter_table_webhook_update_foreign_key',108),(468,'2022_11_18_092633_add_created_at_date_to_pivot_instrument_logs',109),(469,'2022_11_24_114832_create_ni_api_inventory_manages_table',110),(473,'2022_12_01_120842_create_presets_table',111),(474,'2022_11_30_100521_alter_table_patient_surgeries_update_case_type_column',112),(475,'2022_12_16_073659_alter_table_update_api_request_type_enum',112),(476,'2022_11_29_125723_add_cleaning_station_flag_to_users',113),(477,'2022_12_02_071514_create_cleaning_inventory_types_table',113),(478,'2022_12_02_071833_create_cleaning_processes_table',113),(479,'2022_12_02_071840_create_cleaning_cycles_table',113),(480,'2022_12_02_072905_create_cleaning_process_inventory_table',113),(481,'2022_12_02_073107_create_cleaning_cycle_process_table',113),(482,'2022_12_07_062713_create_cleaning_batch_table',113),(483,'2022_12_07_062832_create_cleaning_batch_processes_table',113),(484,'2022_12_15_052443_add_at_cleaning_station_flag_to_sets',113),(485,'2022_12_17_112746_create_cleaning_batch_items_table',113);
/*!40000 ALTER TABLE `pivot_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_mismatch_instruments`
--

DROP TABLE IF EXISTS `pivot_mismatch_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_mismatch_instruments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `set_uniqid_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `owner_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `last_department_id` int unsigned NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `workflow_status` enum('UNASSIGNED','ASSIGNED','INUSE','PROCESSING','AVAILABLE','RECALLED','OUTOFDATE','USED','INACTIVE','MISSING','DAMAGED','REPAIR','LOST','CONDEMNED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `transit` tinyint NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_mismatch_instruments`
--

LOCK TABLES `pivot_mismatch_instruments` WRITE;
/*!40000 ALTER TABLE `pivot_mismatch_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_mismatch_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_mismatch_sets`
--

DROP TABLE IF EXISTS `pivot_mismatch_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_mismatch_sets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `set_id` int unsigned NOT NULL,
  `set_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set_unique_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_department_id` int unsigned NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `old_workflow_status` enum('UNASSIGNED','ASSIGNED','INUSE','PROCESSING','AVAILABLE','RECALLED','OUTOFDATE','USED','INACTIVE','MISSING','DAMAGED','REPAIR','LOST','CONDEMNED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `new_workflow_status` enum('UNASSIGNED','ASSIGNED','INUSE','PROCESSING','AVAILABLE','RECALLED','OUTOFDATE','USED','INACTIVE','MISSING','DAMAGED','REPAIR','LOST','CONDEMNED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `transit` tinyint NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_mismatch_sets`
--

LOCK TABLES `pivot_mismatch_sets` WRITE;
/*!40000 ALTER TABLE `pivot_mismatch_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_mismatch_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_module_actions`
--

DROP TABLE IF EXISTS `pivot_module_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_module_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `module_detail_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_actions_module_detail_id_foreign` (`module_detail_id`),
  CONSTRAINT `module_actions_module_detail_id_foreign` FOREIGN KEY (`module_detail_id`) REFERENCES `pivot_module_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_module_actions`
--

LOCK TABLES `pivot_module_actions` WRITE;
/*!40000 ALTER TABLE `pivot_module_actions` DISABLE KEYS */;
INSERT INTO `pivot_module_actions` VALUES (1,1,'Hospital View','hospital_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(2,2,'Instrument Masters View','instrument_master_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(3,3,'Set master View','set_masters_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(4,4,'Non Instrument Packs View','non_instrument_packs_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(5,5,'Users View','users_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(6,6,'User Role & Permissions View','user_role_permissions_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(7,7,'Inventory Home View','inventory_home_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(8,8,'Instruments View','instruments_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(9,9,'Sets View','sets_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(10,10,'RFID Tag Addition View','rfid_tag_addition_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(11,11,'RFID Tag Removal View','rfid_tag_removal_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(12,12,'Manual Status Changes Of Sets And Instruments View','manual_status_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(13,13,'Vendors View','vendors_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(14,14,'New indent View','new_indent_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(15,15,'Receive Indent View','new_indent_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(16,16,'New Repair Slip View','new_repair_slip_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(17,17,'Repair Receipt Note View','repair_receipt_note_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(18,18,'Condemn Instrument View','condemn_instrument_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(19,19,'Tag Removal View','tag_removal_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(20,20,'Repair Reports View','repair_reports_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(21,21,'Receive Instruments & Sets View','receive_instruments_sets_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(22,22,'Receipt Reports View','receipt_reports_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(23,23,'Pack New Non-Instrument Pack View','pack_new_non_instrument_pack_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(24,24,'Pack New Set View','pack_new_set_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(25,25,'Override Shortage In Set View','override_shortage_in_set_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(26,26,'Packing Reports View','packing_reports_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(27,27,'Sterilisation Batch View','sterilisation_batch_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(28,28,'Stop & Rerun Batch View','stop_rerun_batch_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(29,29,'Reject Batch View','reject_batch_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(30,30,'Recall Batch View','recall_batch_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(31,31,'Finish Batch View','finish_batch_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(32,32,'Batch Reports View','batch_reports_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(33,33,'New Dispatch List View','new_dispatch_list_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(34,34,'Dispatch Reports View','dispatch_reports_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(35,35,'Sending Orders View','sending_orders_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(36,36,'Sending Sets View','sending_sets_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(37,37,'Sending Orders Summary View','sending_orders_summary_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(38,38,'CSSD Set Store View','cssd_set_store_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(39,39,'Create New Loaners View','create_new_loaners_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(40,40,'Return Loaners View','return_loaners_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(41,41,'New Incident View','new_incident_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(42,42,'Reply To Incident View','reply_to_incident_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(43,43,'Resolve Incidents View','resolve_incidents_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(44,44,'Activity View','activity_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(45,45,'Inventory Reports View','inventory_reports_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(46,46,'Acknowledge Sets View','acknowledge_sets_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(47,47,'Set Request View','set_request_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(48,48,'Surgical Whiteboard View','surgical_whiteboard_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(49,49,'Return Used Sets View','return_used_sets_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(50,50,'Mark Missing & Faulty Instruments View','mark_missing_faulty_instruments_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(51,51,'Receive Repair Requests View','receive_repair_requests_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(52,52,'Return Repaired Items View','return_repaired_items_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(53,53,'Repair Reports View','repair_reports_bio_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(54,54,'Receive Indents View','receive_indents_purchase_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(55,55,'Handover Indented Items View','handover_indented_items_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(56,56,'Indent Reports View','indent_reports_purchase_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(57,57,'Dashboard View','dashboard_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(58,58,'Hospital Master View','hospital_master_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(59,59,'Admin Roles View','admin_role_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(60,60,'Reader Model View','reader_model_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(61,61,'Department Type View','department_type_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(62,62,'Admin Customisation View','admin_customisation_view','2017-05-18 05:58:51','2017-05-18 05:58:51'),(63,63,'Can view Case Schedules','can_view_case_schedules','2021-10-25 05:34:44','2021-10-25 05:34:44'),(64,64,'Can update Case Schedules','can_update_case_schedules','2021-10-25 05:34:44','2021-10-25 05:34:44'),(65,65,'Can View Consumption Tracking','can_view_consumption_tracking','2021-10-25 05:51:18','2021-10-25 05:51:18'),(66,66,'Can Update Consumption Tracking','can_update_consumption_tracking','2021-10-25 05:51:18','2021-10-25 05:51:18'),(67,67,'Global Detach Rights for Set Inventory','global_detach_rights_for_set_inventory','2021-10-25 05:52:18','2021-10-25 05:52:18'),(68,68,'Can view API logs','can_view_api_logs','2021-10-25 05:56:28','2021-10-25 05:56:28'),(69,69,'Can edit Customisations','can_edit_customisation','2021-10-25 05:57:10','2021-10-25 05:57:10'),(70,70,'Can setup and edit Sterilisation Masters','can_setup_and_edit_sterilisation_master','2021-10-25 05:57:53','2021-10-25 05:57:53'),(71,71,'Can maintain surgeries and procedures','can_maintain_surgeries_and_procedures','2021-10-26 03:05:46','2021-10-26 03:05:46'),(72,72,'Can map inventory masters for surgeries and procedures','can_map_inventory_masters_for_surgeries_and_procedures','2021-10-26 03:05:47','2021-10-26 03:05:47'),(73,73,'Can create special requests for surgeries and procedures','can_create_special_requests_for_surgeries_and_procedures','2021-10-26 03:05:47','2021-10-26 03:05:47'),(74,74,'Can update buffer / emergency stocks','Can_update_buffer_emergency_stocks','2021-10-26 03:05:47','2021-10-26 03:05:47'),(75,75,'Can View Reports','can_view_Reports','2022-07-12 13:26:17','2022-07-12 13:26:17'),(76,76,'Can View Daily Summary Report','can_daily_summary_report_view','2022-07-12 13:26:17','2022-07-12 13:26:17'),(77,77,'Can View Incident Summary Report','can_incident_summary_report_view','2022-07-12 13:26:17','2022-07-12 13:26:17'),(78,78,'Can View UD Activity Summary Report','can_ud_activity_summary_report_view','2022-07-12 13:26:17','2022-07-12 13:26:17'),(79,79,'Can View UD Activity Summary Report','can_set_opening_consumption_report_view','2022-07-12 13:26:17','2022-07-12 13:26:17'),(80,80,'Non Instruments Inventory View','ni_inventory_view','2022-07-18 05:58:51','2022-07-18 05:58:51'),(81,81,'Can Create NI Masters View','ni_masters_view','2022-08-31 06:10:14','2022-08-31 06:10:14'),(82,82,'Can View NI Inventory View','noninstrument_inventory_view','2022-08-31 06:10:14','2022-08-31 06:10:14'),(83,83,'Can Pack NI Items/Packs View','ni_inventory_packs_view','2022-08-31 06:10:14','2022-08-31 06:10:14'),(84,84,'Can View NI Packs Summary View','ni_inventory_packs_summary_view','2022-08-31 06:10:14','2022-08-31 06:10:14'),(85,85,'Can View Cost Data','can_view_cost_data','2022-09-26 01:28:14','2022-09-26 01:28:14'),(86,86,'Can View Charge Code','can_view_charge_code','2022-09-26 03:32:34','2022-09-26 03:32:34'),(87,87,'Can approve import of new inventory from HIS','can_approve_import_of_new_inventory_from_HIS','2022-09-29 03:45:17','2022-09-29 03:45:17'),(88,88,'Can Manage Cleaning Masters View','cleaning_masters_view','2022-12-26 01:15:28','2022-12-26 01:15:28'),(89,89,'Can View Cleaning Station','cleaning_station_view','2022-12-26 01:15:28','2022-12-26 01:15:28'),(90,90,'Cleaning Batch View','cleaning_station_batch_view','2022-12-26 01:15:29','2022-12-26 01:15:29');
/*!40000 ALTER TABLE `pivot_module_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_module_details`
--

DROP TABLE IF EXISTS `pivot_module_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_module_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `module_group_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_details_value_unique` (`value`),
  KEY `module_details_module_group_id_foreign` (`module_group_id`),
  CONSTRAINT `module_details_module_group_id_foreign` FOREIGN KEY (`module_group_id`) REFERENCES `pivot_module_grouping` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_module_details`
--

LOCK TABLES `pivot_module_details` WRITE;
/*!40000 ALTER TABLE `pivot_module_details` DISABLE KEYS */;
INSERT INTO `pivot_module_details` VALUES (1,1,'Hospital','hospital_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(2,2,'Instrument Masters','instrument_master_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(3,2,'Set Masters','set_masters_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(4,2,'Non Instrument Packs','non_instrument_packs_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(5,3,'Users','users_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(6,3,'User Role & Permissions','user_role_permissions_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(7,4,'Inventory Home','inventory_home_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(8,4,'Instruments','instruments_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(9,4,'Sets','sets_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(10,4,'Can Add RFID tag','rfid_tag_addition_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(11,4,'Can Remove RFID Tag','rfid_tag_removal_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(12,4,'Can Change Status Of Sets And Instruments','manual_status_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(13,4,'Vendors ','vendors_module','2017-05-18 05:58:51','2017-05-18 05:58:51'),(14,5,'Can raise New Indent','new_indent_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(15,5,'Can Receive Indented items','receive_indents_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(16,6,'Can make New Repair Slip','new_repair_slip_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(17,6,'Can make Repair Receipt','repair_receipt_note_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(18,6,'Can authorise Condemning an Instrument','condemn_instrument_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(19,6,'Tag Removal','tag_removal_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(20,6,'Can View Repair Reports','repair_reports_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(21,7,'Can Receive Instruments & Sets','receive_instruments_sets_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(22,7,'Can view Receipt Reports','receipt_reports_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(23,8,'Can Pack New Non-Instrument Pack','pack_new_non_instrument_pack_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(24,8,'Can Pack New Set','pack_new_set_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(25,8,'Can Over-ride Shortage In Set','override_shortage_in_set_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(26,8,'Can View Packing Reports','packing_reports_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(27,9,'Can Create & Edit Sterilisation Batch','sterilisation_batch_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(28,9,'Can Stop & Rerun Sterilisation Batch','stop_rerun_batch_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(29,9,'Can Reject Sterilisation Batch','reject_batch_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(30,9,'Can Recall Batch','recall_batch_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(31,9,'Can Finish Batch','finish_batch_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(32,9,'Can View Batch Reports','batch_reports_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(33,10,'Can Sent Sets to users ','new_dispatch_list_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(34,10,'Can View Dispatch Reports ','dispatch_reports_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(35,10,'Can Send Special Orders','sending_orders_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(36,10,'Sending Sets','sending_sets_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(37,10,'Can View Orders','sending_orders_summary_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(38,11,'View CSSD Set Store','cssd_set_store_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(39,12,'Can Create New Loaners','create_new_loaners_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(40,12,'Can Return Loaners','return_loaners_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(41,13,'Can Raise New Incident Report','new_incident_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(42,13,'Can Reply To Incident Report','reply_to_incident_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(43,13,'Can Resolve Incident Reports','resolve_incidents_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(44,14,'Can View Activity Reports','activity_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(45,14,'Can View Inventory Reports','inventory_reports_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(46,15,'Can Acknowledge Received Sets','acknowledge_sets_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(47,15,'Can raise a special Set Request','set_request_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(48,15,'Can use Surgical Whiteboard ','surgical_whiteboard_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(49,15,'Can Return Used Sets','return_used_sets_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(50,15,'Can Mark Missing & Faulty Instruments','mark_missing_faulty_instruments_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(51,16,'Receive Repair Requests','receive_repair_requests_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(52,16,'Return Repaired Items','return_repaired_items_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(53,16,'Repair Reports','repair_reports_bio_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(54,17,'Can Receive Indents','receive_indents_purchase_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(55,17,'Can Handover Indented Items','handover_indented_items_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(56,17,'Can View Indent Reports','indent_reports_purchase_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(57,18,'Dashboard','dashboard_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(58,19,'Hospital Master','hospital_master_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(59,19,'Manage Roles','admin_role_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(60,19,'Reader Model','reader_model_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(61,19,'Department Type','department_type_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(62,19,'Customisation','admin_customisation_module','2017-05-19 04:31:02','2017-05-19 04:31:02'),(63,20,'Can view Case Schedules','can_view_case_schedules','2021-10-25 05:34:44','2021-10-25 05:34:44'),(64,20,'Can update Case Schedules','can_update_case_schedules','2021-10-25 05:34:44','2021-10-25 05:34:44'),(65,21,'Can View Consumption Tracking','can_view_consumption_tracking','2021-10-25 05:51:17','2021-10-25 05:51:17'),(66,21,'Can Update Consumption Tracking','can_update_consumption_tracking','2021-10-25 05:51:18','2021-10-25 05:51:18'),(67,22,'Global Detach Rights for Set Inventory','global_detach_rights_for_set_inventory','2021-10-25 05:52:18','2021-10-25 05:52:18'),(68,23,'Can view API logs','can_view_api_logs','2021-10-25 05:56:27','2021-10-25 05:56:27'),(69,24,'Can edit Customisations','can_edit_customisation','2021-10-25 05:57:10','2021-10-25 05:57:10'),(70,25,'Can setup and edit Sterilisation Masters','can_setup_and_edit_sterilisation_master','2021-10-25 05:57:53','2021-10-25 05:57:53'),(71,26,'Can maintain surgeries and procedures','can_maintain_surgeries_and_procedures','2021-10-26 03:05:46','2021-10-26 03:05:46'),(72,26,'Can map inventory masters for surgeries and procedures','can_map_inventory_masters_for_surgeries_and_procedures','2021-10-26 03:05:47','2021-10-26 03:05:47'),(73,26,'Can create special requests for surgeries and procedures','can_create_special_requests_for_surgeries_and_procedures','2021-10-26 03:05:47','2021-10-26 03:05:47'),(74,26,'Can update buffer / emergency stocks','Can_update_buffer_emergency_stocks','2021-10-26 03:05:47','2021-10-26 03:05:47'),(75,27,'Can View Reports','can_view_Reports','2022-07-12 13:26:17','2022-07-12 13:26:17'),(76,27,'Can View Daily Summary Report','can_daily_summary_report_module','2022-07-12 13:26:17','2022-07-12 13:26:17'),(77,27,'Can View Incident Summary Report','can_incident_summary_report_module','2022-07-12 13:26:17','2022-07-12 13:26:17'),(78,27,'Can View UD Activity Summary Report','can_ud_activity_summary_report_module','2022-07-12 13:26:17','2022-07-12 13:26:17'),(79,27,'Can View Set Open & Consumption Summary Report','can_set_opening_consumption_report_module','2022-07-12 13:26:17','2022-07-12 13:26:17'),(80,4,'Non Instruments','ni_inventory_module','2022-07-18 04:31:02','2022-07-18 04:31:02'),(81,28,'Can Create NI Masters','ni_masters_module','2022-08-31 06:10:14','2022-08-31 06:10:14'),(82,28,'Can View NI Inventory','noninstrument_inventory_module','2022-08-31 06:10:14','2022-08-31 06:10:14'),(83,28,'Can Pack NI Items/Packs','ni_inventory_packs_module','2022-08-31 06:10:14','2022-08-31 06:10:14'),(84,28,'Can View NI Packs Summary','ni_inventory_packs_summary_module','2022-08-31 06:10:14','2022-08-31 06:10:14'),(85,4,'Can View Cost Data','can_view_cost_data','2022-09-26 01:28:14','2022-09-26 01:28:14'),(86,4,'Can View Charge Code','can_view_charge_code','2022-09-26 03:32:34','2022-09-26 03:32:34'),(87,4,'Can approve import of new inventory from HIS','can_approve_import_of_new_inventory_from_HIS','2022-09-26 03:32:34','2022-09-26 03:32:34'),(88,29,'Can Manage Cleaning Master','cleaning_masters_module','2022-12-26 01:15:28','2022-12-26 01:15:28'),(89,29,'Can View Cleaning Station','cleaning_station_module','2022-12-26 01:15:28','2022-12-26 01:15:28'),(90,29,'Can Create & Edit Cleaning Batch','cleaning_station_batch_module','2022-12-26 01:15:28','2022-12-26 01:15:28');
/*!40000 ALTER TABLE `pivot_module_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_module_grouping`
--

DROP TABLE IF EXISTS `pivot_module_grouping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_module_grouping` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_grouping_value_unique` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_module_grouping`
--

LOCK TABLES `pivot_module_grouping` WRITE;
/*!40000 ALTER TABLE `pivot_module_grouping` DISABLE KEYS */;
INSERT INTO `pivot_module_grouping` VALUES (1,'Hospital Master','hospital_master','2017-05-18 05:53:23','2017-05-18 05:53:23'),(2,'Inventory Master','inventory_master','2017-05-19 04:31:02','2017-05-19 04:31:02'),(3,'User Master','user_master','2017-05-19 04:31:02','2017-05-19 04:31:02'),(4,'Maintain inventory','maintain_inventory','2017-05-19 04:31:02','2017-05-19 04:31:02'),(5,'Indenting','indenting','2017-05-19 04:31:02','2017-05-19 04:31:02'),(6,'Repairs','repairs','2017-05-19 04:31:02','2017-05-19 04:31:02'),(7,'Receive Station','receiving_station','2017-05-19 04:31:02','2017-05-19 04:31:02'),(8,'Packing Station','packing_station','2017-05-19 04:31:02','2017-05-19 04:31:02'),(9,'Sterilisation Station','Sterilisation station','2017-05-19 04:31:02','2017-05-19 04:31:02'),(10,'Sending Station','sending_station','2017-05-19 04:31:02','2017-05-19 04:31:02'),(11,'CSSD Set Store','cssd_set_store','2017-05-19 04:31:02','2017-05-19 04:31:02'),(12,'Consignment / Loaner Items','consignment_loaner_items','2017-05-19 04:31:02','2017-05-19 04:31:02'),(13,'Incident Reporting','incident_reports','2017-05-19 04:31:02','2017-05-19 04:31:02'),(14,'Reports','reports','2017-05-19 04:31:02','2017-05-19 04:31:02'),(15,'User Department like OT / ICU','instrument_user_department_like_ot_icu','2017-05-19 04:31:02','2017-05-19 04:31:02'),(16,'Bio Medical','bio_medical','2017-05-19 04:31:02','2017-05-19 04:31:02'),(17,'Purchase / Stores Department','purchase_store_department','2017-05-19 04:31:02','2017-05-19 04:31:02'),(18,'Dashboard','dashboard','2017-05-19 04:31:02','2017-05-19 04:31:02'),(19,'Pivot Admin','pivot_admin','2017-05-19 04:31:02','2017-05-19 04:31:02'),(20,'Case Schedules','case_schedule','2021-10-25 05:34:44','2021-10-25 05:34:44'),(21,'Consumption Tracking','consumption_tracking','2021-10-25 05:51:17','2021-10-25 05:51:17'),(22,'Special Permissions','special_permissions','2021-10-25 05:52:18','2021-10-25 05:52:18'),(23,'System Integration','system_integration','2021-10-25 05:56:27','2021-10-25 05:56:27'),(24,'Customization','customization','2021-10-25 05:57:10','2021-10-25 05:57:10'),(25,'Sterilisation Masters','sterilisation_masters','2021-10-25 05:57:53','2021-10-25 05:57:53'),(26,'Procedure Masters','procedure_masters','2021-10-26 03:05:46','2021-10-26 03:05:46'),(27,'MIS Reports','MIS Reports','2022-07-12 13:26:17','2022-07-12 13:26:17'),(28,'Non Instrument Inventory Permissions','non_instrument_inventory_permissions','2022-08-31 06:08:48','2022-08-31 06:08:48'),(29,'Cleaning Station Permissions','cleaning_station_permissions','2022-12-26 01:15:28','2022-12-26 01:15:28');
/*!40000 ALTER TABLE `pivot_module_grouping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_ni_api_inventory_manages`
--

DROP TABLE IF EXISTS `pivot_ni_api_inventory_manages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_ni_api_inventory_manages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int NOT NULL,
  `master_id` int NOT NULL,
  `master_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `master_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_received_qty` int NOT NULL DEFAULT '0',
  `total_packed_qty` int NOT NULL DEFAULT '0',
  `total_sterile_qty` int NOT NULL DEFAULT '0',
  `stock_qty` int NOT NULL DEFAULT '0' COMMENT 'It is an balance qty',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_ni_api_inventory_manages`
--

LOCK TABLES `pivot_ni_api_inventory_manages` WRITE;
/*!40000 ALTER TABLE `pivot_ni_api_inventory_manages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_ni_api_inventory_manages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_ni_item_logs`
--

DROP TABLE IF EXISTS `pivot_ni_item_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_ni_item_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int unsigned NOT NULL,
  `date` date NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'current state name',
  `department` int NOT NULL,
  `handled_by` int unsigned NOT NULL COMMENT 'User ID',
  `hospital_id` int DEFAULT NULL,
  `old_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'dump of old instrument record in database',
  `new_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'dump of new instrument record in database',
  `batch_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_ni_item_logs`
--

LOCK TABLES `pivot_ni_item_logs` WRITE;
/*!40000 ALTER TABLE `pivot_ni_item_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_ni_item_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_ni_pack_serial_numbers`
--

DROP TABLE IF EXISTS `pivot_ni_pack_serial_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_ni_pack_serial_numbers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `short_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'item or pack master short codes',
  `master_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'master type item or pack',
  `count` int NOT NULL COMMENT 'total count of serial_number',
  `owner_id` int NOT NULL COMMENT 'Hospital ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_ni_pack_serial_numbers`
--

LOCK TABLES `pivot_ni_pack_serial_numbers` WRITE;
/*!40000 ALTER TABLE `pivot_ni_pack_serial_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_ni_pack_serial_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_non_instrument_api_data`
--

DROP TABLE IF EXISTS `pivot_non_instrument_api_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_non_instrument_api_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `api_request_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `master_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `master_type` enum('ITEM','PACK') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mapping_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hospital_id` int NOT NULL,
  `quantity` int NOT NULL,
  `api_request_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_process` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0' COMMENT '1 for processed and 0 for new request 2 for unprocessed',
  `is_csv_process` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_non_instrument_api_data`
--

LOCK TABLES `pivot_non_instrument_api_data` WRITE;
/*!40000 ALTER TABLE `pivot_non_instrument_api_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_non_instrument_api_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_non_instrument_batches`
--

DROP TABLE IF EXISTS `pivot_non_instrument_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_non_instrument_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ni_pack_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `department_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_non_instrument_batches`
--

LOCK TABLES `pivot_non_instrument_batches` WRITE;
/*!40000 ALTER TABLE `pivot_non_instrument_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_non_instrument_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_non_instrument_inventory_categories`
--

DROP TABLE IF EXISTS `pivot_non_instrument_inventory_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_non_instrument_inventory_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `hospital_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_non_instrument_inventory_categories`
--

LOCK TABLES `pivot_non_instrument_inventory_categories` WRITE;
/*!40000 ALTER TABLE `pivot_non_instrument_inventory_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_non_instrument_inventory_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_non_instrument_master`
--

DROP TABLE IF EXISTS `pivot_non_instrument_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_non_instrument_master` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `loose_pack` tinyint NOT NULL DEFAULT '0',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `short_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mapping_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `short_code_type` enum('AUTO','MANUAL') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('Single use','Reusable') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Single use',
  `item_type_id` int unsigned NOT NULL,
  `max_usage_cycle` smallint DEFAULT NULL,
  `packing_material_id` int NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `starting_department_id` int unsigned NOT NULL,
  `starting_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sterilization_process_id` int NOT NULL,
  `inventory_category_id` int unsigned NOT NULL,
  `unit_of_measurement_id` int unsigned NOT NULL,
  `traceability` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `process_id1` int DEFAULT NULL,
  `process_id2` int DEFAULT NULL,
  `process_id3` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `charge_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_non_instrument_master`
--

LOCK TABLES `pivot_non_instrument_master` WRITE;
/*!40000 ALTER TABLE `pivot_non_instrument_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_non_instrument_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_non_instrument_pack_master`
--

DROP TABLE IF EXISTS `pivot_non_instrument_pack_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_non_instrument_pack_master` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int unsigned NOT NULL,
  `pack_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ready_to_use` tinyint NOT NULL DEFAULT '0',
  `ni_category_id` int unsigned DEFAULT NULL,
  `packing_material_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `starting_department_id` int unsigned NOT NULL,
  `starting_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sterilization_process_id` int DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pack_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mapping_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `short_code_type` enum('AUTO','MANUAL') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `traceability` tinyint NOT NULL DEFAULT '0',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `process_id1` int DEFAULT NULL,
  `process_id2` int DEFAULT NULL,
  `process_id3` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `charge_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pack_masters_pack_code_unique` (`pack_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_non_instrument_pack_master`
--

LOCK TABLES `pivot_non_instrument_pack_master` WRITE;
/*!40000 ALTER TABLE `pivot_non_instrument_pack_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_non_instrument_pack_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_non_instrument_pack_master_items`
--

DROP TABLE IF EXISTS `pivot_non_instrument_pack_master_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_non_instrument_pack_master_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pack_master_id` int unsigned NOT NULL,
  `non_instrument_item_id` int unsigned NOT NULL,
  `count` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sequence` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_non_instrument_pack_master_items`
--

LOCK TABLES `pivot_non_instrument_pack_master_items` WRITE;
/*!40000 ALTER TABLE `pivot_non_instrument_pack_master_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_non_instrument_pack_master_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_non_instrument_packs`
--

DROP TABLE IF EXISTS `pivot_non_instrument_packs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_non_instrument_packs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_pack_id` int NOT NULL,
  `master_id` int NOT NULL,
  `master_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `pack_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sr_no` int NOT NULL,
  `pack_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `department_id` int NOT NULL,
  `packing_date` datetime NOT NULL DEFAULT '2022-08-17 00:00:00',
  `expiry_date` datetime NOT NULL DEFAULT '2022-08-17 00:00:00',
  `workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `old_workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packing_material_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_non_instrument_packs`
--

LOCK TABLES `pivot_non_instrument_packs` WRITE;
/*!40000 ALTER TABLE `pivot_non_instrument_packs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_non_instrument_packs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_non_instrument_packs_meta`
--

DROP TABLE IF EXISTS `pivot_non_instrument_packs_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_non_instrument_packs_meta` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packed_by` int NOT NULL,
  `owner_id` int NOT NULL,
  `master_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `master_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pack_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `unit_of_measurement_id` int NOT NULL,
  `category_id` int NOT NULL,
  `packing_material_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_non_instrument_packs_meta`
--

LOCK TABLES `pivot_non_instrument_packs_meta` WRITE;
/*!40000 ALTER TABLE `pivot_non_instrument_packs_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_non_instrument_packs_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_non_instruments`
--

DROP TABLE IF EXISTS `pivot_non_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_non_instruments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `non_instrument_master_id` int unsigned NOT NULL,
  `non_instrument_master_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `non_instrument_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `provisional_instrument_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type_id` tinyint NOT NULL,
  `loose_pack` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-> Normal instrument, 1-> Loose pack',
  `instrument_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mapping_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `requested_qty` int NOT NULL DEFAULT '0',
  `received_qty` int NOT NULL DEFAULT '0',
  `total_qty` int NOT NULL DEFAULT '0',
  `unit_of_measurement_id` int NOT NULL,
  `ud_dep_id` int NOT NULL,
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `owner_id` int unsigned NOT NULL,
  `current_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location_id` int unsigned NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `department_id` int unsigned NOT NULL,
  `category_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `vendor_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `vendor_item_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vendor_uid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_of_purchase` date NOT NULL,
  `warranty_from` date NOT NULL,
  `warranty_to` date NOT NULL,
  `expiry_date` date NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `workflow_status` enum('UNASSIGNED','ASSIGNED','INUSE','PROCESSING','AVAILABLE','RECALLED','OUTOFDATE','USED','INACTIVE','MISSING','DAMAGED','REPAIR','LOST','CONDEMNED','RETURNED','D&M','UNDERMAINTENANCE','FOUND','REPAIR RETURN','CONSUMED','PENDING','REJECTED','DELETED','DISCARDED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'UNASSIGNED',
  `usage_count` int NOT NULL DEFAULT '0',
  `api_ref_no` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `non_instruments_owner_id_foreign` (`owner_id`),
  CONSTRAINT `non_instruments_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `pivot_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_non_instruments`
--

LOCK TABLES `pivot_non_instruments` WRITE;
/*!40000 ALTER TABLE `pivot_non_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_non_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_oauth_access_tokens`
--

DROP TABLE IF EXISTS `pivot_oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `client_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_oauth_access_tokens`
--

LOCK TABLES `pivot_oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `pivot_oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_oauth_auth_codes`
--

DROP TABLE IF EXISTS `pivot_oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `client_id` int NOT NULL,
  `scopes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_oauth_auth_codes`
--

LOCK TABLES `pivot_oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `pivot_oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_oauth_clients`
--

DROP TABLE IF EXISTS `pivot_oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_oauth_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_oauth_clients`
--

LOCK TABLES `pivot_oauth_clients` WRITE;
/*!40000 ALTER TABLE `pivot_oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `pivot_oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_oauth_personal_access_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_oauth_personal_access_clients`
--

LOCK TABLES `pivot_oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `pivot_oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `pivot_oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_oauth_refresh_tokens`
--

LOCK TABLES `pivot_oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `pivot_oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_optional_field_mapping`
--

DROP TABLE IF EXISTS `pivot_optional_field_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_optional_field_mapping` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int NOT NULL,
  `api_field_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `display_field_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `original_field_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `request_for` enum('SEARCHABLE','NORMAL') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'NORMAL',
  `required` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `searchable` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `applies_to` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` enum('Numeric','Alphanumeric','Date','Text','Boolean') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `default_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_optional_field_mapping`
--

LOCK TABLES `pivot_optional_field_mapping` WRITE;
/*!40000 ALTER TABLE `pivot_optional_field_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_optional_field_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_optional_field_values`
--

DROP TABLE IF EXISTS `pivot_optional_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_optional_field_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `optional_field_mapping_id` int unsigned NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `display_field_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `entity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `entity_id` int NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `required` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `searchable` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Numeric','Alphanumeric','Date','Text','Boolean') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Numeric',
  `default_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `optional_field_values_hospital_id_foreign` (`hospital_id`),
  KEY `optional_field_values_optional_field_mapping_id_foreign` (`optional_field_mapping_id`),
  CONSTRAINT `optional_field_values_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `optional_field_values_optional_field_mapping_id_foreign` FOREIGN KEY (`optional_field_mapping_id`) REFERENCES `pivot_optional_field_mapping` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_optional_field_values`
--

LOCK TABLES `pivot_optional_field_values` WRITE;
/*!40000 ALTER TABLE `pivot_optional_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_optional_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_packed_instrument`
--

DROP TABLE IF EXISTS `pivot_packed_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_packed_instrument` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `packed_set_id` int NOT NULL COMMENT 'Packed Table ID',
  `instrument_id` int NOT NULL COMMENT 'Instrument ID',
  `type_id` int NOT NULL,
  `set_uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Set Uniqid',
  `reader_id` int NOT NULL COMMENT 'Reader ID',
  `found_by_reader` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `instrument_workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Instrument Workflow Status',
  `instrument_packing_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Instrument Packing Status e.g PACKED,MISSING,REPLACED,DAMAGED',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Instrument comment',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `packing_time_instrument_workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_packed_instrument`
--

LOCK TABLES `pivot_packed_instrument` WRITE;
/*!40000 ALTER TABLE `pivot_packed_instrument` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_packed_instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_packed_instrument_sub_parts`
--

DROP TABLE IF EXISTS `pivot_packed_instrument_sub_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_packed_instrument_sub_parts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `packed_set_id` int NOT NULL COMMENT 'Packed Table ID',
  `instrument_id` int NOT NULL COMMENT 'Instrument ID',
  `sub_part_id` int NOT NULL,
  `set_uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Set Uniqid',
  `reader_id` int NOT NULL COMMENT 'Reader ID',
  `found_by_reader` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `instrument_workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Instrument Workflow Status',
  `instrument_packing_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Instrument Packing Status e.g PACKED,MISSING,REPLACED,DAMAGED',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Instrument comment',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `packing_time_instrument_workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_packed_instrument_sub_parts`
--

LOCK TABLES `pivot_packed_instrument_sub_parts` WRITE;
/*!40000 ALTER TABLE `pivot_packed_instrument_sub_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_packed_instrument_sub_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_packed_set`
--

DROP TABLE IF EXISTS `pivot_packed_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_packed_set` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `packed_unique_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Packed uniqid',
  `hospital_id` int NOT NULL COMMENT 'Hospital ID',
  `set_id` int NOT NULL COMMENT 'Set ID',
  `set_uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Set Uniqid',
  `set_member_status` enum('FULLSET','LOANERSET','SHORTSET','OVERRIDE','INCOMPLETE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Set Member Status',
  `set_workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'PACKED' COMMENT 'Set Workflow Status',
  `reader_id` int NOT NULL COMMENT 'Reader ID',
  `found_by_reader` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `packing_date` datetime NOT NULL DEFAULT '2019-10-01 00:00:00',
  `expiry_date` datetime NOT NULL DEFAULT '2019-10-01 00:00:00',
  `packed_by` int NOT NULL COMMENT 'Packed By User ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_packed_set`
--

LOCK TABLES `pivot_packed_set` WRITE;
/*!40000 ALTER TABLE `pivot_packed_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_packed_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_packing_indicator`
--

DROP TABLE IF EXISTS `pivot_packing_indicator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_packing_indicator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_packing_indicator`
--

LOCK TABLES `pivot_packing_indicator` WRITE;
/*!40000 ALTER TABLE `pivot_packing_indicator` DISABLE KEYS */;
INSERT INTO `pivot_packing_indicator` VALUES (1,'Biological Indicator','BI','3','2022-12-29 06:00:02','2022-12-29 06:00:02'),(2,'Chemical Indicator Class 1','CI-1','3','2022-12-29 06:00:02','2022-12-29 06:00:02'),(3,'Chemical Indicator Class 2','CI-2','3','2022-12-29 06:00:02','2022-12-29 06:00:02'),(4,'Chemical Indicator Class 3','CI-3','3','2022-12-29 06:00:02','2022-12-29 06:00:02'),(5,'Chemical Indicator Class 4','CI-4','3','2022-12-29 06:00:02','2022-12-29 06:00:02'),(6,'Chemical Indicator Class 5','CI-5','3','2022-12-29 06:00:02','2022-12-29 06:00:02');
/*!40000 ALTER TABLE `pivot_packing_indicator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_packing_material`
--

DROP TABLE IF EXISTS `pivot_packing_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_packing_material` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `days` tinyint NOT NULL DEFAULT '0',
  `months` tinyint NOT NULL DEFAULT '0',
  `hospital_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_packing_material`
--

LOCK TABLES `pivot_packing_material` WRITE;
/*!40000 ALTER TABLE `pivot_packing_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_packing_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_parent_menu_items`
--

DROP TABLE IF EXISTS `pivot_parent_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_parent_menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `seq` int unsigned NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `has_submenu` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_parent_menu_items`
--

LOCK TABLES `pivot_parent_menu_items` WRITE;
/*!40000 ALTER TABLE `pivot_parent_menu_items` DISABLE KEYS */;
INSERT INTO `pivot_parent_menu_items` VALUES (1,1,'Receiving Station',' fa-icons-outer receive','hospital/job/station/receiving/receiveitems',0,'2021-01-06 00:16:23','2021-01-06 00:16:23'),(2,2,'Packing Station',' fa-icons-outer packing','pack/add',1,'2021-01-06 00:16:23','2021-01-06 00:16:23'),(3,3,'Sterilization Station',' fa-icons-outer str','hospital/job/station/sterilisation',1,'2021-01-06 00:16:23','2021-01-06 00:16:23'),(4,4,'Sending Station',' fa-icons-outer send','hospital/job/station/sending',1,'2021-01-06 00:16:23','2021-01-06 00:16:23'),(5,5,'Incoming Inventory',' fa-icons-outer inventory','sets/store/user?tab=incominginventory',0,'2021-01-06 00:16:23','2021-01-06 00:16:23'),(6,6,'Surgical Whiteboard',' fa-icons-outer whiteboard','surgical',0,'2021-01-06 00:16:23','2021-01-06 00:16:23'),(7,7,'Return used sets',' fa-icons-outer return','sets/used/return',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(8,8,'Transfer sets',' fa-th-large','sets/store/user?tab=sterile',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(9,9,'CSSD Set Store',' fa-icons-outer return','sets/store/cssd',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(10,10,'UD Set Store',' fa-icons-outer set_store','sets/store/user?tab=sterile',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(11,11,'Alerts/Incidents',' fa-icons-outer incident','incidents',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(12,12,'Repair',' fa-icons-outer repairnew','repair/list',1,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(13,13,'Maintain Inventory',' fa-icons-outer inventory','inventory/home',1,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(14,14,'Setup','cog','inventory/masters/home',1,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(15,15,'Manage Hospitals',' fa-hospital-o','admin/user/list',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(16,16,'Manage Department Types',' fa-sitemap','admin/departmenttype/list',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(17,17,'Customization',' fa-th-large','customization/fieldsetting',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(18,18,'Manage Reader Models',' fa-sliders','admin/readermodel/list',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(19,19,'Case Schedule','icons-outer fa-case-schedule','case/schedule/list',0,'2021-01-06 07:01:30','2021-01-06 07:01:30'),(20,20,'Consumption Tracking','icons-outer consumption','consumption/tracking',0,'2021-01-06 07:48:28','2021-01-06 07:48:28'),(21,19,'Permission Setup',' fa-sitemap','admin/permission/setup',0,'2021-01-06 07:50:59','2021-01-06 07:50:59'),(22,1,'Reports',' fa-icons-outer log_ac','misreports',0,'2022-07-12 13:26:17','2022-07-12 13:26:17'),(23,9,'Non Instrument','fa fa-cart-plus','noninstruments/pack',1,'2022-08-31 06:10:14','2022-08-31 06:10:14'),(24,1,'Cleaning Station','clean str','hospital/job/station/cleaning',1,'2022-12-26 01:15:28','2022-12-26 01:15:28');
/*!40000 ALTER TABLE `pivot_parent_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_parent_submenu_items`
--

DROP TABLE IF EXISTS `pivot_parent_submenu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_parent_submenu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_item_id` int unsigned NOT NULL,
  `seq` int NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `has_submenu` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_submenu_items_parent_item_id_foreign` (`parent_item_id`),
  CONSTRAINT `parent_submenu_items_parent_item_id_foreign` FOREIGN KEY (`parent_item_id`) REFERENCES `pivot_parent_menu_items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_parent_submenu_items`
--

LOCK TABLES `pivot_parent_submenu_items` WRITE;
/*!40000 ALTER TABLE `pivot_parent_submenu_items` DISABLE KEYS */;
INSERT INTO `pivot_parent_submenu_items` VALUES (1,2,1,'Pack Set',' fa-icons-outer pack-sets-grey','pack/add',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(2,2,2,'Pack Instruments',' fa-icons-outer packins_pouch','pack/looseinstruments',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(3,2,3,'Packed Sets',' fa-icons-outer packed-sets-grey','pack/packed/sets',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(4,3,1,'Home',' fa-home','hospital/job/station/sterilisation',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(5,3,2,'New Batch',' fa-th-list','hospital/job/station/sterilisation/batch/new',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(6,4,1,'Home',' fa-home','hospital/job/station/sending',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(7,4,2,'New Dispatch',' fa-icons-outer dispatch-grey','hospital/job/station/sending/orders',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(8,12,1,'Home',' fa-home','repair/list',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(9,12,2,'New Repair Slip',' fa-icons-outer repairadd','repair/create/new',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(10,13,1,'Home',' fa-home','inventory/home',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(11,13,2,'Add Instrument',' fa-icons-outer instrumentadd-grey','instruments/add',0,'2021-01-06 00:16:24','2021-01-06 00:16:24'),(12,13,3,'Add Set',' fa-icons-outer addset-grey','set/add',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(13,13,5,'Vendors',' fa-icons-outer vendors-grey','hospital/vendor',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(14,14,1,'Hospital Setup',' fa-hospital-o','hospital/profile',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(15,14,2,'Users & Roles',' fa-user-plus','hospital/user/list',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(16,14,3,'Inventory Masters',' fa-icons-outer inven-masters-grey','inventory/masters/home',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(17,14,4,'Non-instrument Items','fa fa-cart-plus','inventory/non-instruments/home',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(18,14,4,'Sterilization Master',' fa fa-icons-outer ster-master-grey','sterilization/master',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(19,14,5,'Customization',' fa fa-icons-outer customization-grey','hospital/customization',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(20,2,3,'Packing Summaries',' fa fa-file-text','pack/packingsummaries',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(21,13,4,'Approve Inventory','fa fa-check-circle-o','inventory/approval/home',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(22,14,6,'Procedure Master',' fa fa-icons-outer ster-master-grey','procedure/master',0,'2021-10-26 03:05:46','2021-10-26 03:05:46'),(23,13,4,'Non Instrument Inventory','fa fa-cart-plus','ni/inventory/home',0,'2022-07-18 04:03:56','2022-07-18 04:03:56'),(24,2,4,'Pack Non Instruments',' fa-icons-outer packins_pouch','pack/noninstruments',0,'2022-07-28 06:17:09','2022-07-28 06:17:09'),(25,23,4,'NonInstrument Masters',' fa-icons-outer inven-masters-grey','ni/masters/home',0,'2022-08-31 06:10:14','2022-08-31 06:10:14'),(26,23,3,'NonInstrument Inventory',' fa fa-fw fa-fa fa-cart-plus ','noninstrument/inventory/home',0,'2022-08-31 06:10:14','2022-08-31 06:10:14'),(27,23,1,'Pack NonInstruments',' fa-icons-outer packins_pouch','noninstruments/pack',0,'2022-08-31 06:10:14','2022-08-31 06:10:14'),(28,23,2,'Packing Summary',' fa fa-file-text','ni/packingsummary',0,'2022-08-31 06:10:14','2022-08-31 06:10:14'),(29,24,1,'Home',' fa-home','hospital/job/station/cleaning',0,'2022-12-26 01:15:28','2022-12-26 01:15:28'),(30,24,2,'New Batch',' fa-th-list','hospital/job/station/cleaning/batch/new',0,'2022-12-26 01:15:28','2022-12-26 01:15:28'),(31,14,4,'Cleaning Master',' fa fa-clean','cleaning/master?tab=cyclemaster',0,'2022-12-26 01:15:28','2022-12-26 01:15:28');
/*!40000 ALTER TABLE `pivot_parent_submenu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_patient_procedure`
--

DROP TABLE IF EXISTS `pivot_patient_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_patient_procedure` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned DEFAULT NULL,
  `surgery_id` int unsigned DEFAULT NULL,
  `consumption_report` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `surgery_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_procedure_patient_id_foreign` (`patient_id`),
  KEY `patient_procedure_surgery_id_foreign` (`surgery_id`),
  CONSTRAINT `patient_procedure_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `pivot_patients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `patient_procedure_surgery_id_foreign` FOREIGN KEY (`surgery_id`) REFERENCES `pivot_surgeries` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_patient_procedure`
--

LOCK TABLES `pivot_patient_procedure` WRITE;
/*!40000 ALTER TABLE `pivot_patient_procedure` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_patient_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_patient_statuses`
--

DROP TABLE IF EXISTS `pivot_patient_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_patient_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_patient_statuses`
--

LOCK TABLES `pivot_patient_statuses` WRITE;
/*!40000 ALTER TABLE `pivot_patient_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_patient_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_patients`
--

DROP TABLE IF EXISTS `pivot_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_patients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned DEFAULT NULL,
  `internal_patient_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `external_patient_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `patient_set_id` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `marital` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patients_status_foreign` (`status`),
  KEY `patients_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `patients_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `patients_status_foreign` FOREIGN KEY (`status`) REFERENCES `pivot_patient_statuses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_patients`
--

LOCK TABLES `pivot_patients` WRITE;
/*!40000 ALTER TABLE `pivot_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_patients_surgeries`
--

DROP TABLE IF EXISTS `pivot_patients_surgeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_patients_surgeries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `case_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `case_type` enum('IP','OP','ER') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'IP',
  `request_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `api_schedule_user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `visit_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `patient_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'patient_id',
  `hospital_id` int unsigned NOT NULL,
  `surgeon_id` int unsigned NOT NULL,
  `department_id` int NOT NULL,
  `location_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `start_date` datetime NOT NULL,
  `finish_date` datetime DEFAULT NULL,
  `wheelin_date_time` datetime DEFAULT NULL,
  `wheelout_date_time` datetime DEFAULT NULL,
  `surgery_status` enum('SCHEDULED','COMPLETED','RESCHEDULED','CANCELLED','INPROGRESS') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `surgery_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'surgery_name ',
  `procedure` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'procedure name',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `completed` enum('1','0') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_patients_surgeries`
--

LOCK TABLES `pivot_patients_surgeries` WRITE;
/*!40000 ALTER TABLE `pivot_patients_surgeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_patients_surgeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_persistences`
--

DROP TABLE IF EXISTS `pivot_persistences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_persistences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persistences_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_persistences`
--

LOCK TABLES `pivot_persistences` WRITE;
/*!40000 ALTER TABLE `pivot_persistences` DISABLE KEYS */;
INSERT INTO `pivot_persistences` VALUES (1,1,'3iJbfYKB0j3vxQZRfm3ClUzhuXZJYxxp','2022-12-29 05:51:59','2022-12-29 05:51:59'),(2,1,'T1lQrNucqOwQKd0esCEfxZzM4QDyOzDG','2022-12-29 05:54:50','2022-12-29 05:54:50');
/*!40000 ALTER TABLE `pivot_persistences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_porter_names`
--

DROP TABLE IF EXISTS `pivot_porter_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_porter_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `porter_names_name_hospital_id_unique` (`name`,`hospital_id`),
  KEY `porter_names_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `porter_names_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_porter_names`
--

LOCK TABLES `pivot_porter_names` WRITE;
/*!40000 ALTER TABLE `pivot_porter_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_porter_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_presets`
--

DROP TABLE IF EXISTS `pivot_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_presets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `equipment_id` int unsigned NOT NULL,
  `cycle_id` int unsigned NOT NULL,
  `indicator_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `presets_hospital_id_foreign` (`hospital_id`),
  KEY `presets_equipment_id_foreign` (`equipment_id`),
  KEY `presets_cycle_id_foreign` (`cycle_id`),
  CONSTRAINT `presets_cycle_id_foreign` FOREIGN KEY (`cycle_id`) REFERENCES `pivot_cycle_masters` (`id`),
  CONSTRAINT `presets_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `pivot_sterilization_types` (`id`),
  CONSTRAINT `presets_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_presets`
--

LOCK TABLES `pivot_presets` WRITE;
/*!40000 ALTER TABLE `pivot_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_procedure_masters`
--

DROP TABLE IF EXISTS `pivot_procedure_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_procedure_masters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `owner_id` int unsigned NOT NULL,
  `procedure_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `procedure_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `speciality_id` int unsigned NOT NULL,
  `department_id` int unsigned NOT NULL,
  `mapping_status` tinyint(1) NOT NULL DEFAULT '0',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `lead_mins` int NOT NULL DEFAULT '0',
  `lead_hours` int NOT NULL DEFAULT '0',
  `lead_days` int NOT NULL DEFAULT '0',
  `cpt_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_procedure_masters`
--

LOCK TABLES `pivot_procedure_masters` WRITE;
/*!40000 ALTER TABLE `pivot_procedure_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_procedure_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_procedure_surgeons`
--

DROP TABLE IF EXISTS `pivot_procedure_surgeons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_procedure_surgeons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `procedure_id` int unsigned DEFAULT NULL,
  `surgeon_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `procedure_surgeons_procedure_id_foreign` (`procedure_id`),
  KEY `procedure_surgeons_surgeon_id_foreign` (`surgeon_id`),
  CONSTRAINT `procedure_surgeons_procedure_id_foreign` FOREIGN KEY (`procedure_id`) REFERENCES `pivot_patient_procedure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `procedure_surgeons_surgeon_id_foreign` FOREIGN KEY (`surgeon_id`) REFERENCES `pivot_surgeon_names` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_procedure_surgeons`
--

LOCK TABLES `pivot_procedure_surgeons` WRITE;
/*!40000 ALTER TABLE `pivot_procedure_surgeons` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_procedure_surgeons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_reader_master`
--

DROP TABLE IF EXISTS `pivot_reader_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_reader_master` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reader_type_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_reader_master`
--

LOCK TABLES `pivot_reader_master` WRITE;
/*!40000 ALTER TABLE `pivot_reader_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_reader_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_reader_model_types`
--

DROP TABLE IF EXISTS `pivot_reader_model_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_reader_model_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reader_model_types_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_reader_model_types`
--

LOCK TABLES `pivot_reader_model_types` WRITE;
/*!40000 ALTER TABLE `pivot_reader_model_types` DISABLE KEYS */;
INSERT INTO `pivot_reader_model_types` VALUES (1,'Mobile','2019-10-01 06:20:06','2019-10-01 06:20:06'),(2,'Fixed','2019-10-01 06:20:06','2019-10-01 06:20:06');
/*!40000 ALTER TABLE `pivot_reader_model_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_reader_types`
--

DROP TABLE IF EXISTS `pivot_reader_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_reader_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `manufacturer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reader_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_information` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reader_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_reader_types`
--

LOCK TABLES `pivot_reader_types` WRITE;
/*!40000 ALTER TABLE `pivot_reader_types` DISABLE KEYS */;
INSERT INTO `pivot_reader_types` VALUES (1,'32-ASTRASTR','ASTRA EX6','Astra Limited','2','Astra Limited','2019-10-01 07:05:58','2021-09-05 23:56:43','1630905999_6135a68f31dda.jpeg'),(2,'32-XERAXERA','XERAFY SURFACE','XERAFY','2','DEV','2020-07-15 07:38:40','2021-09-05 23:55:01','1630905894_6135a626265d5.png');
/*!40000 ALTER TABLE `pivot_reader_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_readers`
--

DROP TABLE IF EXISTS `pivot_readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_readers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int NOT NULL,
  `readers_id` int unsigned NOT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `original_short_name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `department_id` int unsigned NOT NULL,
  `ipaddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `imei` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location_id` int unsigned NOT NULL,
  `status` enum('1','0') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `online` enum('1','0') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `timeout` int NOT NULL DEFAULT '2000',
  `min_power` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `max_power` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Reason For Deactivation',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '0 for false and 1 is true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `readers_location_id_foreign` (`location_id`),
  KEY `readers_readers_id_foreign` (`readers_id`),
  KEY `readers_department_id_foreign` (`department_id`),
  CONSTRAINT `readers_readers_id_foreign` FOREIGN KEY (`readers_id`) REFERENCES `pivot_reader_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_readers`
--

LOCK TABLES `pivot_readers` WRITE;
/*!40000 ALTER TABLE `pivot_readers` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_reason_for_cycle_failures`
--

DROP TABLE IF EXISTS `pivot_reason_for_cycle_failures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_reason_for_cycle_failures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_reason_for_cycle_failures`
--

LOCK TABLES `pivot_reason_for_cycle_failures` WRITE;
/*!40000 ALTER TABLE `pivot_reason_for_cycle_failures` DISABLE KEYS */;
INSERT INTO `pivot_reason_for_cycle_failures` VALUES (1,'Inappropriate Packing or Loading','2020-08-15 08:15:40','2020-08-15 08:15:40'),(2,'Poor Steam Quality','2020-08-15 08:15:40','2020-08-15 08:15:40'),(3,'Vacuum Failure','2020-08-15 08:15:40','2020-08-15 08:15:40'),(4,'Inadequate Temperatures','2020-08-15 08:15:40','2020-08-15 08:15:40'),(5,'Inadequate precleaning of instruments','2020-08-15 08:15:40','2020-08-15 08:15:40'),(6,'Improper maintenance of equipment','2020-08-15 08:15:40','2020-08-15 08:15:40'),(7,'Cycle time too short','2020-08-15 08:15:40','2020-08-15 08:15:40'),(8,'Temperature too low','2020-08-15 08:15:40','2020-08-15 08:15:40'),(9,'Overloading','2020-08-15 08:15:40','2020-08-15 08:15:40'),(10,'Improper loading of sterilizer chamber','2020-08-15 08:15:40','2020-08-15 08:15:40'),(11,'Incompatible packaging material','2020-08-15 08:15:40','2020-08-15 08:15:40'),(12,'Interruption of sterilization cycle to add or remove an item','2020-08-15 08:15:40','2020-08-15 08:15:40');
/*!40000 ALTER TABLE `pivot_reason_for_cycle_failures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_register_devices`
--

DROP TABLE IF EXISTS `pivot_register_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_register_devices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int NOT NULL,
  `device_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_register_devices`
--

LOCK TABLES `pivot_register_devices` WRITE;
/*!40000 ALTER TABLE `pivot_register_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_register_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_reminders`
--

DROP TABLE IF EXISTS `pivot_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_reminders`
--

LOCK TABLES `pivot_reminders` WRITE;
/*!40000 ALTER TABLE `pivot_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_reorder_levels`
--

DROP TABLE IF EXISTS `pivot_reorder_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_reorder_levels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_reorder_levels`
--

LOCK TABLES `pivot_reorder_levels` WRITE;
/*!40000 ALTER TABLE `pivot_reorder_levels` DISABLE KEYS */;
INSERT INTO `pivot_reorder_levels` VALUES (1,'Needs reorder','2022-07-21 01:36:48','2022-07-21 01:36:48'),(2,'Well stocked','2022-07-21 01:37:15','2022-07-21 01:37:15'),(3,'Finishing fast','2022-07-21 01:37:15','2022-07-21 01:37:15');
/*!40000 ALTER TABLE `pivot_reorder_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_repair_receipt`
--

DROP TABLE IF EXISTS `pivot_repair_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_repair_receipt` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL COMMENT 'created by',
  `repair_ticket_id` int unsigned NOT NULL COMMENT 'Repair Ticket Table ID',
  `invoice_date` datetime NOT NULL COMMENT 'Invoice Date Time When Returned Repair Instrument From Vendor',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `repair_ticket_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Repair Ticket Status When Receipt Created',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estimated_return_date` datetime NOT NULL COMMENT 'Estimated Date Time receipt',
  `invoice_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Invoice Number',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_repair_receipt`
--

LOCK TABLES `pivot_repair_receipt` WRITE;
/*!40000 ALTER TABLE `pivot_repair_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_repair_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_repair_ticket_images`
--

DROP TABLE IF EXISTS `pivot_repair_ticket_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_repair_ticket_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL COMMENT 'uploaded by',
  `repair_ticket_id` int unsigned NOT NULL COMMENT 'Repair Ticket Table ID',
  `repair_ticket_data` json NOT NULL COMMENT 'Repair Ticket Table Data',
  `repair_ticket_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Repair Ticket Status',
  `image_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Repair Ticket Image Name',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_repair_ticket_images`
--

LOCK TABLES `pivot_repair_ticket_images` WRITE;
/*!40000 ALTER TABLE `pivot_repair_ticket_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_repair_ticket_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_repair_ticket_logs`
--

DROP TABLE IF EXISTS `pivot_repair_ticket_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_repair_ticket_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL COMMENT 'created by',
  `repair_ticket_id` int unsigned NOT NULL COMMENT 'Repair Ticket Table ID',
  `repair_ticket_data` json NOT NULL COMMENT 'Repair Ticket Table Data',
  `repair_ticket_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Repair Ticket Status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_repair_ticket_logs`
--

LOCK TABLES `pivot_repair_ticket_logs` WRITE;
/*!40000 ALTER TABLE `pivot_repair_ticket_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_repair_ticket_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_reply`
--

DROP TABLE IF EXISTS `pivot_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_reply` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int unsigned NOT NULL,
  `from` int unsigned NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_reply`
--

LOCK TABLES `pivot_reply` WRITE;
/*!40000 ALTER TABLE `pivot_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_request_types`
--

DROP TABLE IF EXISTS `pivot_request_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_request_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `object_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Sets',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_request_types`
--

LOCK TABLES `pivot_request_types` WRITE;
/*!40000 ALTER TABLE `pivot_request_types` DISABLE KEYS */;
INSERT INTO `pivot_request_types` VALUES (1,'Sets','Sets','2017-07-13 04:44:52','2017-07-13 04:44:52');
/*!40000 ALTER TABLE `pivot_request_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_requests`
--

DROP TABLE IF EXISTS `pivot_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned DEFAULT NULL,
  `order_id` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `request_item` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `procedure_id` int unsigned DEFAULT NULL,
  `request_type` int unsigned DEFAULT NULL,
  `request_date` date NOT NULL,
  `requested_by` int unsigned DEFAULT NULL,
  `status` enum('UNDERPROCESS','PENDING','OVERDUE','RECEIVED','COMPLETED','AVAILABLE','REJECTED') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `department_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `completion_date` date DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requests_request_type_foreign` (`request_type`),
  KEY `requests_requested_by_foreign` (`requested_by`),
  KEY `requests_procedure_id_foreign` (`procedure_id`),
  KEY `requests_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `requests_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `requests_procedure_id_foreign` FOREIGN KEY (`procedure_id`) REFERENCES `pivot_patient_procedure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `requests_request_type_foreign` FOREIGN KEY (`request_type`) REFERENCES `pivot_request_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `requests_requested_by_foreign` FOREIGN KEY (`requested_by`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_requests`
--

LOCK TABLES `pivot_requests` WRITE;
/*!40000 ALTER TABLE `pivot_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_return_batch`
--

DROP TABLE IF EXISTS `pivot_return_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_return_batch` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `owner_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `batch_date` datetime NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_return_batch`
--

LOCK TABLES `pivot_return_batch` WRITE;
/*!40000 ALTER TABLE `pivot_return_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_return_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_return_sets`
--

DROP TABLE IF EXISTS `pivot_return_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_return_sets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int unsigned NOT NULL,
  `set_id` int unsigned NOT NULL,
  `porter` int NOT NULL DEFAULT '0' COMMENT 'Porter ID Both for Retrun Sets',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `found_by` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0' COMMENT '1 for by reader and 2 for by dmcode',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_return_sets`
--

LOCK TABLES `pivot_return_sets` WRITE;
/*!40000 ALTER TABLE `pivot_return_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_return_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_rfids`
--

DROP TABLE IF EXISTS `pivot_rfids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_rfids` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rfid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('SET','INSTRUMENT','ASSEMBLY') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'SET',
  `type_id` int unsigned NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_rfids`
--

LOCK TABLES `pivot_rfids` WRITE;
/*!40000 ALTER TABLE `pivot_rfids` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_rfids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_role_users`
--

DROP TABLE IF EXISTS `pivot_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_role_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `department_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_role_users`
--

LOCK TABLES `pivot_role_users` WRITE;
/*!40000 ALTER TABLE `pivot_role_users` DISABLE KEYS */;
INSERT INTO `pivot_role_users` VALUES (1,1,1,0,NULL,NULL),(2,2,1,0,NULL,NULL),(3,3,2,0,'2022-12-29 06:00:02','2022-12-29 06:00:02');
/*!40000 ALTER TABLE `pivot_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_roles`
--

DROP TABLE IF EXISTS `pivot_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_roles`
--

LOCK TABLES `pivot_roles` WRITE;
/*!40000 ALTER TABLE `pivot_roles` DISABLE KEYS */;
INSERT INTO `pivot_roles` VALUES (1,1,'admin','Administrator','','{\"modules\":{\"hospital_master_module\":{\"hospital_master_view\":true,\"hospital_master_add\":true,\"hospital_master_edit\":true,\"hospital_master_remove\":true},\"admin_role_module\":{\"admin_role_view\":true,\"admin_role_add\":true,\"admin_role_edit\":true,\"admin_role_remove\":true},\"reader_model_module\":{\"reader_model_view\":true,\"reader_model_add\":true,\"reader_model_edit\":true,\"reader_model_remove\":true},\"department_type_module\":{\"department_type_view\":true,\"department_type_add\":true,\"department_type_edit\":true,\"department_type_remove\":true},\"admin_customisation_module\":{\"admin_customisation_view\":true,\"admin_customisation_add\":true,\"admin_customisation_edit\":true,\"admin_customisation_remove\":true},\"admin_permission_setup\":{\"can_view_admin_permission_setup\":true}}}','2019-10-01 06:20:05','2019-10-01 06:20:05'),(2,1,'hospital','Hospital','','{\"modules\":{\"hospital_module\":{\"hospital_view\":true,\"hospital_add\":true,\"hospital_edit\":true,\"hospital_remove\":true},\"users_module\":{\"users_view\":true,\"users_add\":true,\"users_edit\":true,\"users_remove\":true},\"user_role_permissions_module\":{\"user_role_permissions_view\":true,\"user_role_permissions_add\":true,\"user_role_permissions_edit\":true,\"user_role_permissions_remove\":true}}}','2019-10-01 06:20:05','2019-10-01 06:20:05'),(3,1,'super_admin','Super Admin','','{\"modules\":{\"instrument_master_module\":{\"instrument_master_view\":true},\"set_masters_module\":{\"set_masters_view\":true},\"inventory_home_module\":{\"inventory_home_view\":true},\"instruments_module\":{\"instruments_view\":true},\"sets_module\":{\"sets_view\":true},\"can_view_cost_data\":{\"can_view_cost_data\":true},\"new_indent_module\":{\"new_indent_view\":true},\"receive_indents_module\":{\"new_indent_view\":true},\"new_repair_slip_module\":{\"new_repair_slip_view\":true},\"repair_receipt_note_module\":{\"repair_receipt_note_view\":true},\"condemn_instrument_module\":{\"condemn_instrument_view\":true},\"tag_removal_module\":{\"tag_removal_view\":true},\"repair_reports_module\":{\"repair_reports_view\":true},\"pack_new_non_instrument_pack_module\":{\"pack_new_non_instrument_pack_view\":true},\"pack_new_set_module\":{\"pack_new_set_view\":true},\"override_shortage_in_set_module\":{\"override_shortage_in_set_view\":true},\"packing_reports_module\":{\"packing_reports_view\":true},\"new_incident_module\":{\"new_incident_view\":true},\"reply_to_incident_module\":{\"reply_to_incident_view\":true},\"resolve_incidents_module\":{\"resolve_incidents_view\":true}}}','2019-10-01 06:20:05','2020-01-30 07:29:50'),(4,1,'supervisor','Supervisor','','{\"modules\":{\"hospital_module\":{\"hospital_view\":true},\"instrument_master_module\":{\"instrument_master_view\":true},\"set_masters_module\":{\"set_masters_view\":true},\"inventory_home_module\":{\"inventory_home_view\":true},\"instruments_module\":{\"instruments_view\":true},\"sets_module\":{\"sets_view\":true},\"rfid_tag_addition_module\":{\"rfid_tag_addition_view\":true},\"rfid_tag_removal_module\":{\"rfid_tag_removal_view\":true},\"manual_status_module\":{\"manual_status_view\":true},\"vendors_module\":{\"vendors_view\":true},\"can_approve_import_of_new_inventory_from_HIS\":{\"can_approve_import_of_new_inventory_from_HIS\":true},\"new_indent_module\":{\"new_indent_view\":true},\"receive_indents_module\":{\"new_indent_view\":true},\"new_repair_slip_module\":{\"new_repair_slip_view\":true},\"repair_receipt_note_module\":{\"repair_receipt_note_view\":true},\"condemn_instrument_module\":{\"condemn_instrument_view\":true},\"tag_removal_module\":{\"tag_removal_view\":true},\"repair_reports_module\":{\"repair_reports_view\":true},\"receive_instruments_sets_module\":{\"receive_instruments_sets_view\":true},\"receipt_reports_module\":{\"receipt_reports_view\":true},\"pack_new_non_instrument_pack_module\":{\"pack_new_non_instrument_pack_view\":true},\"pack_new_set_module\":{\"pack_new_set_view\":true},\"override_shortage_in_set_module\":{\"override_shortage_in_set_view\":true},\"packing_reports_module\":{\"packing_reports_view\":true},\"sterilisation_batch_module\":{\"sterilisation_batch_view\":true},\"stop_rerun_batch_module\":{\"stop_rerun_batch_view\":true},\"reject_batch_module\":{\"reject_batch_view\":true},\"recall_batch_module\":{\"recall_batch_view\":true},\"finish_batch_module\":{\"finish_batch_view\":true},\"batch_reports_module\":{\"batch_reports_view\":true},\"new_dispatch_list_module\":{\"new_dispatch_list_view\":true},\"dispatch_reports_module\":{\"dispatch_reports_view\":true},\"sending_orders_module\":{\"sending_orders_view\":true},\"sending_sets_module\":{\"sending_sets_view\":true},\"sending_orders_summary_module\":{\"sending_orders_summary_view\":true},\"cssd_set_store_module\":{\"cssd_set_store_view\":true},\"new_incident_module\":{\"new_incident_view\":true},\"reply_to_incident_module\":{\"reply_to_incident_view\":true},\"resolve_incidents_module\":{\"resolve_incidents_view\":true},\"activity_module\":{\"activity_view\":true},\"inventory_reports_module\":{\"inventory_reports_view\":true},\"receive_repair_requests_module\":{\"receive_repair_requests_view\":true},\"return_repaired_items_module\":{\"return_repaired_items_view\":true},\"repair_reports_bio_module\":{\"repair_reports_bio_view\":true},\"receive_indents_purchase_module\":{\"receive_indents_purchase_view\":true},\"handover_indented_items_module\":{\"handover_indented_items_view\":true},\"indent_reports_purchase_module\":{\"indent_reports_purchase_view\":true},\"dashboard_module\":{\"dashboard_view\":true}}}','2019-10-01 06:20:05','2020-01-30 08:08:03'),(5,1,'deco_technician','Decontamination Area Technician','','{\"modules\":{\"department_module\":{\"department_view\":true,\"department_add\":true,\"department_edit\":true,\"department_remove\":true}}}','2019-10-01 06:20:05','2019-10-01 06:20:05'),(6,1,'pack_technician','Packing Technician','','{\"modules\":{\"department_module\":{\"department_view\":true,\"department_add\":true,\"department_edit\":true,\"department_remove\":true}}}','2019-10-01 06:20:05','2019-10-01 06:20:05'),(7,1,'ster_technician','Sterile Technician','','{\"modules\":{\"department_module\":{\"department_view\":true,\"department_add\":true,\"department_edit\":true,\"department_remove\":true}}}','2019-10-01 06:20:05','2019-10-01 06:20:05'),(8,1,'ward_manager','OT Manager / Ward Manager','','{\"modules\":{\"acknowledge_sets_module\":{\"acknowledge_sets_view\":true},\"set_request_module\":{\"set_request_view\":true},\"surgical_whiteboard_module\":{\"surgical_whiteboard_view\":true},\"return_used_sets_module\":{\"return_used_sets_view\":true},\"mark_missing_faulty_instruments_module\":{\"mark_missing_faulty_instruments_view\":true},\"receive_repair_requests_module\":{\"receive_repair_requests_view\":true},\"return_repaired_items_module\":{\"return_repaired_items_view\":true},\"repair_reports_bio_module\":{\"repair_reports_bio_view\":true},\"receive_indents_purchase_module\":{\"receive_indents_purchase_view\":true},\"handover_indented_items_module\":{\"handover_indented_items_view\":true},\"indent_reports_purchase_module\":{\"indent_reports_purchase_view\":true},\"dashboard_module\":{\"dashboard_view\":true}}}','2019-10-01 06:20:05','2019-10-21 09:45:40'),(9,1,'ot_circ_nurse','OT Circulating Nurse (or Nurse In Other User Department)','','{\"modules\":{\"new_repair_slip_module\":{\"new_repair_slip_view\":true},\"repair_receipt_note_module\":{\"repair_receipt_note_view\":true},\"condemn_instrument_module\":{\"condemn_instrument_view\":true},\"tag_removal_module\":{\"tag_removal_view\":true},\"repair_reports_module\":{\"repair_reports_view\":true},\"new_incident_module\":{\"new_incident_view\":true},\"reply_to_incident_module\":{\"reply_to_incident_view\":true},\"resolve_incidents_module\":{\"resolve_incidents_view\":true},\"acknowledge_sets_module\":{\"acknowledge_sets_view\":true},\"set_request_module\":{\"set_request_view\":true},\"surgical_whiteboard_module\":{\"surgical_whiteboard_view\":true},\"return_used_sets_module\":{\"return_used_sets_view\":true},\"mark_missing_faulty_instruments_module\":{\"mark_missing_faulty_instruments_view\":true},\"receive_repair_requests_module\":{\"receive_repair_requests_view\":true},\"return_repaired_items_module\":{\"return_repaired_items_view\":true},\"repair_reports_bio_module\":{\"repair_reports_bio_view\":true},\"receive_indents_purchase_module\":{\"receive_indents_purchase_view\":true},\"handover_indented_items_module\":{\"handover_indented_items_view\":true},\"indent_reports_purchase_module\":{\"indent_reports_purchase_view\":true},\"dashboard_module\":{\"dashboard_view\":true}}}','2019-10-01 06:20:05','2019-10-18 07:39:20'),(10,1,'ot_scrub_nurse','OT Scrub Nurse (or nurse in other user department)','','{\"modules\":{\"instrument_master_module\":{\"instrument_master_view\":true},\"set_masters_module\":{\"set_masters_view\":true},\"non_instrument_packs_module\":{\"non_instrument_packs_view\":true},\"inventory_home_module\":{\"inventory_home_view\":true},\"instruments_module\":{\"instruments_view\":true},\"sets_module\":{\"sets_view\":true},\"rfid_tag_addition_module\":{\"rfid_tag_addition_view\":true},\"rfid_tag_removal_module\":{\"rfid_tag_removal_view\":true},\"manual_status_module\":{\"manual_status_view\":true},\"vendors_module\":{\"vendors_view\":true},\"can_view_cost_data\":{\"can_view_cost_data\":true},\"new_incident_module\":{\"new_incident_view\":true},\"reply_to_incident_module\":{\"reply_to_incident_view\":true},\"resolve_incidents_module\":{\"resolve_incidents_view\":true},\"activity_module\":{\"activity_view\":true},\"inventory_reports_module\":{\"inventory_reports_view\":true},\"acknowledge_sets_module\":{\"acknowledge_sets_view\":true},\"set_request_module\":{\"set_request_view\":true},\"surgical_whiteboard_module\":{\"surgical_whiteboard_view\":true},\"return_used_sets_module\":{\"return_used_sets_view\":true},\"mark_missing_faulty_instruments_module\":{\"mark_missing_faulty_instruments_view\":true},\"receive_repair_requests_module\":{\"receive_repair_requests_view\":true},\"return_repaired_items_module\":{\"return_repaired_items_view\":true},\"repair_reports_bio_module\":{\"repair_reports_bio_view\":true},\"receive_indents_purchase_module\":{\"receive_indents_purchase_view\":true},\"handover_indented_items_module\":{\"handover_indented_items_view\":true},\"indent_reports_purchase_module\":{\"indent_reports_purchase_view\":true},\"dashboard_module\":{\"dashboard_view\":true}}}','2019-10-01 06:20:05','2019-11-01 11:18:21'),(239,3,'super_admin','Super Admin','','{\"modules\":{\"instrument_master_module\":{\"instrument_master_view\":true},\"set_masters_module\":{\"set_masters_view\":true},\"inventory_home_module\":{\"inventory_home_view\":true},\"instruments_module\":{\"instruments_view\":true},\"sets_module\":{\"sets_view\":true},\"can_view_cost_data\":{\"can_view_cost_data\":true},\"new_indent_module\":{\"new_indent_view\":true},\"receive_indents_module\":{\"new_indent_view\":true},\"new_repair_slip_module\":{\"new_repair_slip_view\":true},\"repair_receipt_note_module\":{\"repair_receipt_note_view\":true},\"condemn_instrument_module\":{\"condemn_instrument_view\":true},\"tag_removal_module\":{\"tag_removal_view\":true},\"repair_reports_module\":{\"repair_reports_view\":true},\"pack_new_non_instrument_pack_module\":{\"pack_new_non_instrument_pack_view\":true},\"pack_new_set_module\":{\"pack_new_set_view\":true},\"override_shortage_in_set_module\":{\"override_shortage_in_set_view\":true},\"packing_reports_module\":{\"packing_reports_view\":true},\"new_incident_module\":{\"new_incident_view\":true},\"reply_to_incident_module\":{\"reply_to_incident_view\":true},\"resolve_incidents_module\":{\"resolve_incidents_view\":true}}}',NULL,NULL),(240,3,'supervisor','Supervisor','','{\"modules\":{\"hospital_module\":{\"hospital_view\":true},\"instrument_master_module\":{\"instrument_master_view\":true},\"set_masters_module\":{\"set_masters_view\":true},\"inventory_home_module\":{\"inventory_home_view\":true},\"instruments_module\":{\"instruments_view\":true},\"sets_module\":{\"sets_view\":true},\"rfid_tag_addition_module\":{\"rfid_tag_addition_view\":true},\"rfid_tag_removal_module\":{\"rfid_tag_removal_view\":true},\"manual_status_module\":{\"manual_status_view\":true},\"vendors_module\":{\"vendors_view\":true},\"can_approve_import_of_new_inventory_from_HIS\":{\"can_approve_import_of_new_inventory_from_HIS\":true},\"new_indent_module\":{\"new_indent_view\":true},\"receive_indents_module\":{\"new_indent_view\":true},\"new_repair_slip_module\":{\"new_repair_slip_view\":true},\"repair_receipt_note_module\":{\"repair_receipt_note_view\":true},\"condemn_instrument_module\":{\"condemn_instrument_view\":true},\"tag_removal_module\":{\"tag_removal_view\":true},\"repair_reports_module\":{\"repair_reports_view\":true},\"receive_instruments_sets_module\":{\"receive_instruments_sets_view\":true},\"receipt_reports_module\":{\"receipt_reports_view\":true},\"pack_new_non_instrument_pack_module\":{\"pack_new_non_instrument_pack_view\":true},\"pack_new_set_module\":{\"pack_new_set_view\":true},\"override_shortage_in_set_module\":{\"override_shortage_in_set_view\":true},\"packing_reports_module\":{\"packing_reports_view\":true},\"sterilisation_batch_module\":{\"sterilisation_batch_view\":true},\"stop_rerun_batch_module\":{\"stop_rerun_batch_view\":true},\"reject_batch_module\":{\"reject_batch_view\":true},\"recall_batch_module\":{\"recall_batch_view\":true},\"finish_batch_module\":{\"finish_batch_view\":true},\"batch_reports_module\":{\"batch_reports_view\":true},\"new_dispatch_list_module\":{\"new_dispatch_list_view\":true},\"dispatch_reports_module\":{\"dispatch_reports_view\":true},\"sending_orders_module\":{\"sending_orders_view\":true},\"sending_sets_module\":{\"sending_sets_view\":true},\"sending_orders_summary_module\":{\"sending_orders_summary_view\":true},\"cssd_set_store_module\":{\"cssd_set_store_view\":true},\"new_incident_module\":{\"new_incident_view\":true},\"reply_to_incident_module\":{\"reply_to_incident_view\":true},\"resolve_incidents_module\":{\"resolve_incidents_view\":true},\"activity_module\":{\"activity_view\":true},\"inventory_reports_module\":{\"inventory_reports_view\":true},\"receive_repair_requests_module\":{\"receive_repair_requests_view\":true},\"return_repaired_items_module\":{\"return_repaired_items_view\":true},\"repair_reports_bio_module\":{\"repair_reports_bio_view\":true},\"receive_indents_purchase_module\":{\"receive_indents_purchase_view\":true},\"handover_indented_items_module\":{\"handover_indented_items_view\":true},\"indent_reports_purchase_module\":{\"indent_reports_purchase_view\":true},\"dashboard_module\":{\"dashboard_view\":true}}}',NULL,NULL),(241,3,'deco_technician','Decontamination Area Technician','','{\"modules\":{\"department_module\":{\"department_view\":true,\"department_add\":true,\"department_edit\":true,\"department_remove\":true}}}',NULL,NULL),(242,3,'pack_technician','Packing Technician','','{\"modules\":{\"department_module\":{\"department_view\":true,\"department_add\":true,\"department_edit\":true,\"department_remove\":true}}}',NULL,NULL),(243,3,'ster_technician','Sterile Technician','','{\"modules\":{\"department_module\":{\"department_view\":true,\"department_add\":true,\"department_edit\":true,\"department_remove\":true}}}',NULL,NULL),(244,3,'ward_manager','OT Manager / Ward Manager','','{\"modules\":{\"acknowledge_sets_module\":{\"acknowledge_sets_view\":true},\"set_request_module\":{\"set_request_view\":true},\"surgical_whiteboard_module\":{\"surgical_whiteboard_view\":true},\"return_used_sets_module\":{\"return_used_sets_view\":true},\"mark_missing_faulty_instruments_module\":{\"mark_missing_faulty_instruments_view\":true},\"receive_repair_requests_module\":{\"receive_repair_requests_view\":true},\"return_repaired_items_module\":{\"return_repaired_items_view\":true},\"repair_reports_bio_module\":{\"repair_reports_bio_view\":true},\"receive_indents_purchase_module\":{\"receive_indents_purchase_view\":true},\"handover_indented_items_module\":{\"handover_indented_items_view\":true},\"indent_reports_purchase_module\":{\"indent_reports_purchase_view\":true},\"dashboard_module\":{\"dashboard_view\":true}}}',NULL,NULL),(245,3,'ot_circ_nurse','OT Circulating Nurse (or Nurse In Other User Department)','','{\"modules\":{\"new_repair_slip_module\":{\"new_repair_slip_view\":true},\"repair_receipt_note_module\":{\"repair_receipt_note_view\":true},\"condemn_instrument_module\":{\"condemn_instrument_view\":true},\"tag_removal_module\":{\"tag_removal_view\":true},\"repair_reports_module\":{\"repair_reports_view\":true},\"new_incident_module\":{\"new_incident_view\":true},\"reply_to_incident_module\":{\"reply_to_incident_view\":true},\"resolve_incidents_module\":{\"resolve_incidents_view\":true},\"acknowledge_sets_module\":{\"acknowledge_sets_view\":true},\"set_request_module\":{\"set_request_view\":true},\"surgical_whiteboard_module\":{\"surgical_whiteboard_view\":true},\"return_used_sets_module\":{\"return_used_sets_view\":true},\"mark_missing_faulty_instruments_module\":{\"mark_missing_faulty_instruments_view\":true},\"receive_repair_requests_module\":{\"receive_repair_requests_view\":true},\"return_repaired_items_module\":{\"return_repaired_items_view\":true},\"repair_reports_bio_module\":{\"repair_reports_bio_view\":true},\"receive_indents_purchase_module\":{\"receive_indents_purchase_view\":true},\"handover_indented_items_module\":{\"handover_indented_items_view\":true},\"indent_reports_purchase_module\":{\"indent_reports_purchase_view\":true},\"dashboard_module\":{\"dashboard_view\":true}}}',NULL,NULL),(246,3,'ot_scrub_nurse','OT Scrub Nurse (or nurse in other user department)','','{\"modules\":{\"instrument_master_module\":{\"instrument_master_view\":true},\"set_masters_module\":{\"set_masters_view\":true},\"non_instrument_packs_module\":{\"non_instrument_packs_view\":true},\"inventory_home_module\":{\"inventory_home_view\":true},\"instruments_module\":{\"instruments_view\":true},\"sets_module\":{\"sets_view\":true},\"rfid_tag_addition_module\":{\"rfid_tag_addition_view\":true},\"rfid_tag_removal_module\":{\"rfid_tag_removal_view\":true},\"manual_status_module\":{\"manual_status_view\":true},\"vendors_module\":{\"vendors_view\":true},\"can_view_cost_data\":{\"can_view_cost_data\":true},\"new_incident_module\":{\"new_incident_view\":true},\"reply_to_incident_module\":{\"reply_to_incident_view\":true},\"resolve_incidents_module\":{\"resolve_incidents_view\":true},\"activity_module\":{\"activity_view\":true},\"inventory_reports_module\":{\"inventory_reports_view\":true},\"acknowledge_sets_module\":{\"acknowledge_sets_view\":true},\"set_request_module\":{\"set_request_view\":true},\"surgical_whiteboard_module\":{\"surgical_whiteboard_view\":true},\"return_used_sets_module\":{\"return_used_sets_view\":true},\"mark_missing_faulty_instruments_module\":{\"mark_missing_faulty_instruments_view\":true},\"receive_repair_requests_module\":{\"receive_repair_requests_view\":true},\"return_repaired_items_module\":{\"return_repaired_items_view\":true},\"repair_reports_bio_module\":{\"repair_reports_bio_view\":true},\"receive_indents_purchase_module\":{\"receive_indents_purchase_view\":true},\"handover_indented_items_module\":{\"handover_indented_items_view\":true},\"indent_reports_purchase_module\":{\"indent_reports_purchase_view\":true},\"dashboard_module\":{\"dashboard_view\":true}}}',NULL,NULL);
/*!40000 ALTER TABLE `pivot_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_route_permissions`
--

DROP TABLE IF EXISTS `pivot_route_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_route_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `route` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_route_permissions`
--

LOCK TABLES `pivot_route_permissions` WRITE;
/*!40000 ALTER TABLE `pivot_route_permissions` DISABLE KEYS */;
INSERT INTO `pivot_route_permissions` VALUES (1,'hospital/job/station/receiving/receiveitems','receive_instruments_sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(2,'pack/add','pack_new_set_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(3,'pack/packed/sets','pack_new_set_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(4,'hospital/job/station/sterilisation','batch_reports_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(5,'hospital/job/station/sterilisation/batch/new','sterilisation_batch_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(6,'hospital/job/station/sending/ordersummary','sending_orders_summary_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(7,'hospital/job/station/sending','sending_orders_summary_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(8,'hospital/job/station/sending/orders','sending_orders_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(9,'set/add','sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(10,'readers/list','hospital_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(11,'surgical','surgical_whiteboard_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(12,'admin/departmenttype/list','department_type_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(13,'admin/user/list','hospital_master_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(14,'admin/roles/list','admin_role_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(15,'admin/readermodel/list','reader_model_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(16,'customization/fieldsetting','admin_customisation_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(17,'inventory/home','inventory_home_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(18,'inventory/approval/home','can_approve_import_of_new_inventory_from_HIS','2021-01-04 04:06:57','2021-01-04 04:06:57'),(19,'instruments/add','instruments_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(20,'verification/new','verification_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(21,'verification/history','verification_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(22,'hospital/profile','hospital_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(23,'department/list','hospital_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(24,'hospital/user/list','users_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(25,'inventory/masters/home','instrument_master_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(26,'instruments/master/add','instrument_master_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(27,'sets/master/add','set_masters_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(28,'customization/defaultmasters','admin_customisation_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(29,'sets','sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(30,'hospital/roles/list','user_role_permissions_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(31,'inventory/masters/home','set_masters_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(32,'inventory/non-instruments/home','non_instrument_packs_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(33,'sets/used/list','return_used_sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(34,'sets/used/return','return_used_sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(35,'sets/store/returned/list','return_used_sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(36,'hospital/customization/fieldsetting','hospital_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(37,'hospital/customization/defaultmasters','hospital_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(38,'hospital/sterilization','hospital_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(39,'hospital/sterilization/add','hospital_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(40,'hospital/additional/info','hospital_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(41,'hospital/vendor','vendors_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(42,'hospital/vendor/add','vendors_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(43,'sets/request/list','set_request_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(44,'hospital/sterilization/process/add','hospital_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(45,'incident/report','new_incident_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(46,'incidents','new_incident_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(47,'sets/store/home','return_used_sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(48,'sets/store/cssd','cssd_set_store_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(49,'sets/store/user','return_used_sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(50,'sets/store/user?tab=incominginventory','return_used_sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(51,'sets/store/user?tab=nonsterile','return_used_sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(52,'sets/store/user?tab=sterile','return_used_sets_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(53,'sterilization/master','can_setup_and_edit_sterilisation_master','2021-01-04 04:06:57','2021-01-04 04:06:57'),(54,'hospital/customization','can_edit_customisation','2021-01-04 04:06:57','2021-01-04 04:06:57'),(55,'dashboard','dashboard_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(56,'repair/list','new_incident_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(57,'repair/create/new','new_incident_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(58,'pack/looseinstruments','pack_new_set_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(59,'pack/packingsummaries','pack_new_set_view','2021-01-04 04:06:57','2021-01-04 04:06:57'),(60,'case/schedule/list','can_view_case_schedules','2021-01-04 04:08:40','2021-01-04 04:08:40'),(61,'consumption/tracking','can_view_consumption_tracking','2021-01-04 04:09:29','2021-01-04 04:09:29'),(62,'admin/permission/setup','can_view_admin_permission_setup','2021-01-06 07:01:30','2021-01-06 07:01:30'),(63,'procedure/master','can_maintain_surgeries_and_procedures','2021-10-26 03:05:47','2021-10-26 03:05:47'),(64,'misreports','can_view_Reports','2022-07-12 13:26:17','2022-07-12 13:26:17'),(65,'daily/summary/report','can_daily_summary_report_view','2022-07-12 13:26:17','2022-07-12 13:26:17'),(66,'incident/summary/report','can_incident_summary_report_view','2022-07-12 13:26:17','2022-07-12 13:26:17'),(67,'ud/activity/summary/report','can_ud_activity_summary_report_view','2022-07-12 13:26:17','2022-07-12 13:26:17'),(68,'set/open-consumption/report','can_set_opening_consumption_report_view','2022-07-12 13:26:17','2022-07-12 13:26:17'),(69,'ni/inventory/home','ni_inventory_view','2022-07-18 04:03:56','2022-07-18 04:03:56'),(70,'pack/noninstruments','pack_new_non_instrument_pack_view','2022-07-28 06:17:09','2022-07-28 06:17:09'),(71,'ni/masters/home','ni_masters_view','2022-08-31 06:10:14','2022-08-31 06:10:14'),(72,'noninstrument/inventory/home','noninstrument_inventory_view','2022-08-31 06:10:14','2022-08-31 06:10:14'),(73,'noninstruments/pack','ni_inventory_packs_view','2022-08-31 06:10:14','2022-08-31 06:10:14'),(74,'ni/packingsummary','ni_inventory_packs_summary_view','2022-08-31 06:10:14','2022-08-31 06:10:14'),(75,'cleaning/master?tab=cyclemaster','cleaning_masters_view','2022-12-26 01:15:28','2022-12-26 01:15:28'),(76,'hospital/job/station/cleaning','cleaning_station_view','2022-12-26 01:15:28','2022-12-26 01:15:28'),(77,'hospital/job/station/cleaning/batch/new','cleaning_station_batch_view','2022-12-26 01:15:29','2022-12-26 01:15:29');
/*!40000 ALTER TABLE `pivot_route_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_schema_field_settings`
--

DROP TABLE IF EXISTS `pivot_schema_field_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_schema_field_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `schema_id` int unsigned NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `serial_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reset_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schema_field_settings_schema_id_foreign` (`schema_id`),
  CONSTRAINT `schema_field_settings_schema_id_foreign` FOREIGN KEY (`schema_id`) REFERENCES `pivot_schema_fields` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_schema_field_settings`
--

LOCK TABLES `pivot_schema_field_settings` WRITE;
/*!40000 ALTER TABLE `pivot_schema_field_settings` DISABLE KEYS */;
INSERT INTO `pivot_schema_field_settings` VALUES (1,1,'LO','001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(2,2,'DP','001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(3,3,'','1','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(4,4,'EQ','001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(5,5,'SP','001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(6,6,'','001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(7,7,'','001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(8,8,'SM','0001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(9,9,'','0001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(10,10,'IM','001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(11,11,'HOSP','00001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(12,12,'IC','001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(13,13,'TC','01','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(14,14,'SC','001','2122-12-29 11:30:01','2022-12-29 06:00:01','2022-12-29 06:00:01'),(15,15,'ST','001','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(16,16,'SD','01','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(17,17,'SD','01','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(18,18,'TR','01','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(19,19,'RT','01','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(20,20,'RC','01','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(21,21,'RP','01','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(22,22,'IN','01','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(23,23,'CA','01','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(24,24,'CAS','001','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(25,25,'NIC','001','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(26,26,'NI','001','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(27,27,'','0001','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02'),(28,28,'LBP','001','2122-12-29 11:30:02','2022-12-29 06:00:02','2022-12-29 06:00:02');
/*!40000 ALTER TABLE `pivot_schema_field_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_schema_fields`
--

DROP TABLE IF EXISTS `pivot_schema_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_schema_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `schema_field` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schema_fields_schema_field_hospital_id_unique` (`schema_field`,`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_schema_fields`
--

LOCK TABLES `pivot_schema_fields` WRITE;
/*!40000 ALTER TABLE `pivot_schema_fields` DISABLE KEYS */;
INSERT INTO `pivot_schema_fields` VALUES (1,3,'department_locations','2022-12-29 06:00:01','2022-12-29 06:00:01'),(2,3,'departments','2022-12-29 06:00:01','2022-12-29 06:00:01'),(3,3,'readers','2022-12-29 06:00:01','2022-12-29 06:00:01'),(4,3,'sterilization_types','2022-12-29 06:00:01','2022-12-29 06:00:01'),(5,3,'disinfectant_types','2022-12-29 06:00:01','2022-12-29 06:00:01'),(6,3,'sets','2022-12-29 06:00:01','2022-12-29 06:00:01'),(7,3,'loose_instrument','2022-12-29 06:00:01','2022-12-29 06:00:01'),(8,3,'sets_master','2022-12-29 06:00:01','2022-12-29 06:00:01'),(9,3,'instruments','2022-12-29 06:00:01','2022-12-29 06:00:01'),(10,3,'instrument_master','2022-12-29 06:00:01','2022-12-29 06:00:01'),(11,3,'hospital_profile','2022-12-29 06:00:01','2022-12-29 06:00:01'),(12,3,'instrument_category','2022-12-29 06:00:01','2022-12-29 06:00:01'),(13,3,'tray_category','2022-12-29 06:00:01','2022-12-29 06:00:01'),(14,3,'set_category','2022-12-29 06:00:01','2022-12-29 06:00:01'),(15,3,'sterilization','2022-12-29 06:00:01','2022-12-29 06:00:01'),(16,3,'dispatch','2022-12-29 06:00:02','2022-12-29 06:00:02'),(17,3,'dispatch_new','2022-12-29 06:00:02','2022-12-29 06:00:02'),(18,3,'transfer_set','2022-12-29 06:00:02','2022-12-29 06:00:02'),(19,3,'return_batch','2022-12-29 06:00:02','2022-12-29 06:00:02'),(20,3,'receiving_batch','2022-12-29 06:00:02','2022-12-29 06:00:02'),(21,3,'incident_repair_ticket','2022-12-29 06:00:02','2022-12-29 06:00:02'),(22,3,'alert_incidents','2022-12-29 06:00:02','2022-12-29 06:00:02'),(23,3,'surgical_actions','2022-12-29 06:00:02','2022-12-29 06:00:02'),(24,3,'patients_surgeries','2022-12-29 06:00:02','2022-12-29 06:00:02'),(25,3,'non_instrument_category','2022-12-29 06:00:02','2022-12-29 06:00:02'),(26,3,'non_instrument_inventory','2022-12-29 06:00:02','2022-12-29 06:00:02'),(27,3,'instrument_sub_part','2022-12-29 06:00:02','2022-12-29 06:00:02'),(28,3,'loose_instruments_bulkpack_batches','2022-12-29 06:00:02','2022-12-29 06:00:02');
/*!40000 ALTER TABLE `pivot_schema_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_serial_numbers`
--

DROP TABLE IF EXISTS `pivot_serial_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_serial_numbers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'table name',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'e.g Tray Cat or Ins Cat',
  `count` int NOT NULL COMMENT 'total count of serial_number',
  `owner_id` int NOT NULL COMMENT 'Hospital ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_serial_numbers`
--

LOCK TABLES `pivot_serial_numbers` WRITE;
/*!40000 ALTER TABLE `pivot_serial_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_serial_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_sessions`
--

DROP TABLE IF EXISTS `pivot_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_sessions` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `hospital_id` int NOT NULL DEFAULT '0',
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `payload` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_sessions`
--

LOCK TABLES `pivot_sessions` WRITE;
/*!40000 ALTER TABLE `pivot_sessions` DISABLE KEYS */;
INSERT INTO `pivot_sessions` VALUES ('M0JnNls4Z5FI6raGvhB7Wm47bUQXczxoYFYcqIWp',1,0,NULL,NULL,'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR3ZMRHQwU1d2eHdYcFVVT3RSVEU0TlQzR3kzbFc0YWdaSFFBY2s1ciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxNzoiY3VycmVudF91c2VyX2RhdGEiO2E6Mzp7czo3OiJyb2xlX2lkIjtpOjE7czo3OiJ1c2VyX2lkIjtpOjE7czoxMzoiZGVwYXJ0bWVudF9pZCI7aTowO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL3VzZXIvbGlzdCI7fX0=',1672313464,NULL,'2022-12-29 06:01:04'),('SXPztsG40becyvoXeTvLbmlZbgPYzP5SS7uaPAVS',1,0,NULL,NULL,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWDZUU2hKUE9jZWE1VDl3VDVndEw4WEdaY3BDY0N2TENDTnFFaVU4UiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1672312919,NULL,NULL);
/*!40000 ALTER TABLE `pivot_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_set_category`
--

DROP TABLE IF EXISTS `pivot_set_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_set_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `set_category_category_name_hospital_id_unique` (`category_name`,`hospital_id`),
  KEY `set_category_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `set_category_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_set_category`
--

LOCK TABLES `pivot_set_category` WRITE;
/*!40000 ALTER TABLE `pivot_set_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_set_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_set_indicators`
--

DROP TABLE IF EXISTS `pivot_set_indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_set_indicators` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `set_id` int DEFAULT NULL,
  `batch_id` int DEFAULT NULL,
  `indicator_id` int DEFAULT NULL,
  `indicator_lotnumber` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `indicator_uniqueid` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_set_indicators`
--

LOCK TABLES `pivot_set_indicators` WRITE;
/*!40000 ALTER TABLE `pivot_set_indicators` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_set_indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_set_instruments`
--

DROP TABLE IF EXISTS `pivot_set_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_set_instruments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `set_id` int unsigned NOT NULL,
  `instrument_id` int unsigned NOT NULL,
  `sequence` double NOT NULL DEFAULT '1',
  `asset_type` enum('ID','CODE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type_id` int NOT NULL,
  `instrument_master_id` int unsigned NOT NULL,
  `instrument_rfid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `temp` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `set_instruments_set_id_foreign` (`set_id`),
  CONSTRAINT `set_instruments_set_id_foreign` FOREIGN KEY (`set_id`) REFERENCES `pivot_sets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_set_instruments`
--

LOCK TABLES `pivot_set_instruments` WRITE;
/*!40000 ALTER TABLE `pivot_set_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_set_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_set_log_activities`
--

DROP TABLE IF EXISTS `pivot_set_log_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_set_log_activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `set_id` int DEFAULT NULL COMMENT 'Set table ID',
  `hospital_id` int DEFAULT NULL,
  `batch_id` int DEFAULT NULL COMMENT 'Batch Tablle ID (Sterlization Sending Batch etc)',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Actions FINISH,FINALIZE etc',
  `old_workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Old workflow status before change',
  `workflow_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Workflow status after change',
  `station` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'station',
  `job` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'At which job change was done (packing / returning etc.)',
  `comments` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Comments',
  `reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'reason when user marking reject or transfer etc',
  `department_id` int DEFAULT NULL,
  `receiving_department_id` int NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `set_data` json NOT NULL,
  `surgicalaction_id` int NOT NULL COMMENT 'surgicalaction_id id',
  `batch_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_set_log_activities`
--

LOCK TABLES `pivot_set_log_activities` WRITE;
/*!40000 ALTER TABLE `pivot_set_log_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_set_log_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_set_log_related_instruments`
--

DROP TABLE IF EXISTS `pivot_set_log_related_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_set_log_related_instruments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `set_log_activity_id` int unsigned NOT NULL,
  `instrument_master_id` int unsigned NOT NULL,
  `instrument_data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_set_log_related_instruments`
--

LOCK TABLES `pivot_set_log_related_instruments` WRITE;
/*!40000 ALTER TABLE `pivot_set_log_related_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_set_log_related_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_set_logs`
--

DROP TABLE IF EXISTS `pivot_set_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_set_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `set_id` int unsigned NOT NULL,
  `date` date NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'current state name',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'current location name',
  `department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handled_by` int unsigned NOT NULL COMMENT 'User ID',
  `hospital_id` int DEFAULT NULL,
  `instruments_count` tinyint NOT NULL DEFAULT '0',
  `old_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'dump of old instrument record in database',
  `new_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'dump of new instrument record in database',
  `read_by` int unsigned NOT NULL COMMENT 'Reader ID if available otherwise set to 0',
  `batch_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `event_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'module name',
  `dispatch_batch_no` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'batch Id.',
  `batch_date` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'batch date',
  `expiry_date` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `porter` int NOT NULL COMMENT 'sending station dispatch to porter',
  `dispatch_to` int NOT NULL COMMENT 'dispatch sent to department on sending station',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `receiving_department_id` int NOT NULL,
  `source` int unsigned NOT NULL COMMENT 'Source Department ID',
  `patient_id` int NOT NULL COMMENT 'patients_surgeries table id',
  `indicator_id` int NOT NULL,
  `indicator_lotnumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `indicator_uniqueid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_set_logs`
--

LOCK TABLES `pivot_set_logs` WRITE;
/*!40000 ALTER TABLE `pivot_set_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_set_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_set_master_instruments`
--

DROP TABLE IF EXISTS `pivot_set_master_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_set_master_instruments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `set_master_id` int unsigned NOT NULL,
  `instrument_master_id` int unsigned NOT NULL,
  `count` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sequence` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `set_master_instruments_set_master_id_foreign` (`set_master_id`),
  KEY `set_master_instruments_instrument_master_id_foreign` (`instrument_master_id`),
  CONSTRAINT `set_master_instruments_instrument_master_id_foreign` FOREIGN KEY (`instrument_master_id`) REFERENCES `pivot_instrument_master` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `set_master_instruments_set_master_id_foreign` FOREIGN KEY (`set_master_id`) REFERENCES `pivot_sets_master` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_set_master_instruments`
--

LOCK TABLES `pivot_set_master_instruments` WRITE;
/*!40000 ALTER TABLE `pivot_set_master_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_set_master_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_set_sub_part_instruments`
--

DROP TABLE IF EXISTS `pivot_set_sub_part_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_set_sub_part_instruments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `set_id` int unsigned NOT NULL,
  `sub_part_id` int unsigned NOT NULL,
  `belong_instrument_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `asset_type` enum('ID','CODE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type_id` int NOT NULL,
  `instrument_master_id` int unsigned NOT NULL,
  `instrument_rfid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `temp` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `set_instruments_set_id_foreign` (`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_set_sub_part_instruments`
--

LOCK TABLES `pivot_set_sub_part_instruments` WRITE;
/*!40000 ALTER TABLE `pivot_set_sub_part_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_set_sub_part_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_sets`
--

DROP TABLE IF EXISTS `pivot_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_sets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `extra_column` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `master_id` int NOT NULL,
  `master_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int NOT NULL DEFAULT '0',
  `owner_id` int unsigned NOT NULL,
  `set_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `current_status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `incident_status` tinyint NOT NULL DEFAULT '0',
  `short_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `datamatrix_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `available` int NOT NULL DEFAULT '0',
  `total_count` int NOT NULL DEFAULT '0',
  `incomplete_assembly` tinyint NOT NULL DEFAULT '0',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `ud_dep_id` int NOT NULL,
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `set_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rfid_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `location_id` int unsigned NOT NULL,
  `at_cleaning_station_flag` tinyint(1) NOT NULL DEFAULT '0',
  `department_id` int unsigned NOT NULL,
  `old_last_user_department_id` int NOT NULL DEFAULT '0' COMMENT 'OLd Last User (Only UD) Department ID (UD STORE DEPARTMENT ID)',
  `last_sending_department_id` int NOT NULL DEFAULT '0' COMMENT 'Last User (CSSD,UD) Department ID',
  `last_user_department_id` int NOT NULL DEFAULT '0' COMMENT 'Last User (Only UD) Department ID (UD STORE DEPARTMENT ID)',
  `last_read_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Last Read by Mobile or Fixed Reader',
  `last_read_department_id` int NOT NULL DEFAULT '0' COMMENT 'Last reader department id',
  `last_read_location_id` int NOT NULL DEFAULT '0' COMMENT 'Last reader location id',
  `current_location` int unsigned NOT NULL,
  `packing_date` datetime NOT NULL DEFAULT '2019-10-01 00:00:00',
  `expiry_date` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` enum('ISSUED','STORED','ASSIGNED','OPENED','RETURN','WASHING','PACKED','UNDERPROCESS','STERILISED','OUTOFDATE','REJECTED','RECALLED','UNPACK','AVAILABLE','USED','NOTUSED') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` enum('FULLSET','OVERRIDE','INCOMPLETE','REJECTED','USED') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sterilization_count` int NOT NULL DEFAULT '0',
  `usability_status` enum('USABLE','UNUSABLE','INACTIVE','USED','ACTIVE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'UNUSABLE',
  `workflow_status` enum('CLEANING','PACKED','UNDERSTERILISATION','STERILISATIONREJECT','STERILIZED','STERILESTORAGE','OUTOFDATE','ISSUED','ASSIGNEDTOPATIENT','ASSIGNEDTOOT','OPENED','REJECTED','RETURNED','UNDERMAINTENANCE','NEWSET','INACTIVE','CONDEMN','NEWLOANERRECEIVED','LOANERRETURNED','UNSTERILESTORAGE','OUTOFDATE+R','OUTOFDATE@UD','STERILISATIONRECALL','STERILISATIONRECALL@UD','STERILISATIONRECALL+R') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'CLEANING',
  `member_status` enum('FULLSET','LOANERSET','SHORTSET','OVERRIDE','INCOMPLETE','LOOSEINSTRUMENT') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `transit` tinyint NOT NULL DEFAULT '0',
  `transit_to_cssd` tinyint NOT NULL DEFAULT '0',
  `rejection_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `old_workflow_status` enum('CLEANING','PACKED','UNDERSTERILISATION','STERILISATIONREJECT','STERILIZED','STERILESTORAGE','OUTOFDATE','ISSUED','ASSIGNEDTOPATIENT','ASSIGNEDTOOT','OPENED','REJECTED','RETURNED','UNDERMAINTENANCE','NEWSET','INACTIVE','CONDEMN','NEWLOANERRECEIVED','LOANERRETURNED','UNSTERILESTORAGE','OUTOFDATE+R','OUTOFDATE@UD','STERILISATIONRECALL','STERILISATIONRECALL@UD') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `old_user_id` int NOT NULL,
  `uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packing_material_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `period` int unsigned NOT NULL,
  `days` int unsigned NOT NULL,
  `source` int unsigned NOT NULL COMMENT 'Source Department ID',
  `destination` int unsigned NOT NULL COMMENT 'Destination Department ID',
  `old_comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `old_transite_state` int NOT NULL DEFAULT '0' COMMENT 'Old Transite State when using SWB',
  `material_id` int NOT NULL,
  `indicator_id` int NOT NULL,
  `indicator_lotnumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `indicator_uniqueid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `charge_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sets_master_code_foreign` (`master_code`),
  KEY `sets_owner_id_foreign` (`owner_id`),
  CONSTRAINT `sets_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_sets`
--

LOCK TABLES `pivot_sets` WRITE;
/*!40000 ALTER TABLE `pivot_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_sets_master`
--

DROP TABLE IF EXISTS `pivot_sets_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_sets_master` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int unsigned NOT NULL,
  `set_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `surgeon_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `packing_material_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `set_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_deactivated` tinyint NOT NULL DEFAULT '0',
  `reason_for_deactivation` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `charge_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sets_master_set_code_unique` (`set_code`),
  KEY `sets_master_owner_id_foreign` (`owner_id`),
  KEY `sets_master_category_id_foreign` (`category_id`),
  CONSTRAINT `sets_master_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `pivot_set_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sets_master_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_sets_master`
--

LOCK TABLES `pivot_sets_master` WRITE;
/*!40000 ALTER TABLE `pivot_sets_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_sets_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_sterilization`
--

DROP TABLE IF EXISTS `pivot_sterilization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_sterilization` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `finished_by` int DEFAULT NULL,
  `cycle_id` int DEFAULT NULL,
  `cycle_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `owner_id` int unsigned NOT NULL,
  `sterilization_type` int unsigned NOT NULL,
  `current_department_id` int unsigned NOT NULL COMMENT 'Current Department ID',
  `cycle_type` enum('Load','Test') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Load',
  `batch_date` datetime NOT NULL DEFAULT '2019-10-01 06:19:49',
  `start_date` datetime NOT NULL DEFAULT '2019-10-01 06:19:49',
  `finish_date` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Batch Finish Date',
  `expiry_date` datetime NOT NULL DEFAULT '2019-10-01 06:19:49',
  `reject_date` datetime DEFAULT NULL,
  `status` enum('SAVED','UNDERPROCESS','PROCESSED','REJECTED','STOPPED','DELETED','PASSED','FAILED') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sterilization_sterilization_type_foreign` (`sterilization_type`),
  KEY `sterilization_owner_id_foreign` (`owner_id`),
  CONSTRAINT `sterilization_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sterilization_sterilization_type_foreign` FOREIGN KEY (`sterilization_type`) REFERENCES `pivot_sterilization_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_sterilization`
--

LOCK TABLES `pivot_sterilization` WRITE;
/*!40000 ALTER TABLE `pivot_sterilization` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_sterilization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_sterilization_batches`
--

DROP TABLE IF EXISTS `pivot_sterilization_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_sterilization_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sterilization_id` int unsigned NOT NULL,
  `set_id` int unsigned NOT NULL,
  `set_uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `available` int NOT NULL DEFAULT '0',
  `total_count` int NOT NULL DEFAULT '0',
  `is_removed` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `found_by` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0' COMMENT '1 for by reader and 2 for by dmcode',
  PRIMARY KEY (`id`),
  KEY `sterilization_batches_sterilization_id_foreign` (`sterilization_id`),
  KEY `sterilization_batches_set_id_foreign` (`set_id`),
  CONSTRAINT `sterilization_batches_set_id_foreign` FOREIGN KEY (`set_id`) REFERENCES `pivot_sets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sterilization_batches_sterilization_id_foreign` FOREIGN KEY (`sterilization_id`) REFERENCES `pivot_sterilization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_sterilization_batches`
--

LOCK TABLES `pivot_sterilization_batches` WRITE;
/*!40000 ALTER TABLE `pivot_sterilization_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_sterilization_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_sterilization_disinfections`
--

DROP TABLE IF EXISTS `pivot_sterilization_disinfections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_sterilization_disinfections` (
  `sterilization_id` int unsigned NOT NULL,
  `disinfectant_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `sterilization_disinfections_sterilization_id_foreign` (`sterilization_id`),
  KEY `sterilization_disinfections_disinfectant_id_foreign` (`disinfectant_id`),
  CONSTRAINT `sterilization_disinfections_disinfectant_id_foreign` FOREIGN KEY (`disinfectant_id`) REFERENCES `pivot_disinfectant_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sterilization_disinfections_sterilization_id_foreign` FOREIGN KEY (`sterilization_id`) REFERENCES `pivot_sterilization_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_sterilization_disinfections`
--

LOCK TABLES `pivot_sterilization_disinfections` WRITE;
/*!40000 ALTER TABLE `pivot_sterilization_disinfections` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_sterilization_disinfections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_sterilization_logs`
--

DROP TABLE IF EXISTS `pivot_sterilization_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_sterilization_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cycle_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `equipemnt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cycle_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cycle_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `cycle_created_by` int DEFAULT NULL,
  `cycle_finished_by` int DEFAULT NULL,
  `last_activity_by` int DEFAULT NULL,
  `current_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_sterilization_logs`
--

LOCK TABLES `pivot_sterilization_logs` WRITE;
/*!40000 ALTER TABLE `pivot_sterilization_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_sterilization_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_sterilization_types`
--

DROP TABLE IF EXISTS `pivot_sterilization_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_sterilization_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sterilization_types_name_hospital_id_unique` (`name`,`hospital_id`),
  KEY `sterilization_types_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `sterilization_types_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_sterilization_types`
--

LOCK TABLES `pivot_sterilization_types` WRITE;
/*!40000 ALTER TABLE `pivot_sterilization_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_sterilization_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_submenu_childmenu_items`
--

DROP TABLE IF EXISTS `pivot_submenu_childmenu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_submenu_childmenu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `submenu_item_id` int unsigned NOT NULL,
  `seq` int NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `has_submenu` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submenu_childmenu_items_submenu_item_id_foreign` (`submenu_item_id`),
  CONSTRAINT `submenu_childmenu_items_submenu_item_id_foreign` FOREIGN KEY (`submenu_item_id`) REFERENCES `pivot_parent_submenu_items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_submenu_childmenu_items`
--

LOCK TABLES `pivot_submenu_childmenu_items` WRITE;
/*!40000 ALTER TABLE `pivot_submenu_childmenu_items` DISABLE KEYS */;
INSERT INTO `pivot_submenu_childmenu_items` VALUES (1,13,1,'Home',' fa-home','hospital/vendor',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(2,13,2,'Add Vendor',' fa-icons-outer add-vendors-grey','hospital/vendor/add',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(3,15,1,'Roles & Permissions',' fa-users','hospital/roles/list',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(4,15,2,'Users',' fa-users','hospital/user/list',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(5,16,1,'Home',' fa-database','inventory/masters/home',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(6,16,2,'Instrument Masters',' fa-icons-outer instrumentmaster-grey instrumentmaster22','instruments/master/add',0,'2021-01-06 00:16:25','2021-01-06 00:16:25'),(7,16,3,'Set Masters',' fa-icons-outer masterset-grey','sets/master/add',0,'2021-01-06 00:16:25','2021-01-06 00:16:25');
/*!40000 ALTER TABLE `pivot_submenu_childmenu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_subpart_incident_history`
--

DROP TABLE IF EXISTS `pivot_subpart_incident_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_subpart_incident_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int NOT NULL,
  `incident_instrument_id` int NOT NULL,
  `subpart_id` tinyint NOT NULL DEFAULT '0',
  `incident_id` int NOT NULL,
  `hospital_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `old_action` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `new_action` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_subpart_incident_history`
--

LOCK TABLES `pivot_subpart_incident_history` WRITE;
/*!40000 ALTER TABLE `pivot_subpart_incident_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_subpart_incident_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_summary_logs`
--

DROP TABLE IF EXISTS `pivot_summary_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_summary_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type_id` int unsigned NOT NULL,
  `date` date NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'current state name',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'current location name',
  `department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'current department id',
  `hospital_id` int unsigned NOT NULL,
  `handled_by` int unsigned NOT NULL COMMENT 'User ID',
  `batch_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `old_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'dump of old instrument record in database',
  `new_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'dump of new instrument record in database',
  `read_by` int unsigned NOT NULL COMMENT 'Reader ID if available otherwise set to 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_summary_logs`
--

LOCK TABLES `pivot_summary_logs` WRITE;
/*!40000 ALTER TABLE `pivot_summary_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_summary_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_surgeon_names`
--

DROP TABLE IF EXISTS `pivot_surgeon_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_surgeon_names` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hospital_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `surgeon_names_name_hospital_id_unique` (`name`,`hospital_id`),
  KEY `surgeon_names_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `surgeon_names_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_surgeon_names`
--

LOCK TABLES `pivot_surgeon_names` WRITE;
/*!40000 ALTER TABLE `pivot_surgeon_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_surgeon_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_surgeries`
--

DROP TABLE IF EXISTS `pivot_surgeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_surgeries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surgeries_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `surgeries_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_surgeries`
--

LOCK TABLES `pivot_surgeries` WRITE;
/*!40000 ALTER TABLE `pivot_surgeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_surgeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_surgery_sets`
--

DROP TABLE IF EXISTS `pivot_surgery_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_surgery_sets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `surgery_id` int unsigned DEFAULT NULL,
  `set_id` int unsigned DEFAULT NULL,
  `set_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surgery_sets_surgery_id_foreign` (`surgery_id`),
  KEY `surgery_sets_set_id_foreign` (`set_id`),
  CONSTRAINT `surgery_sets_set_id_foreign` FOREIGN KEY (`set_id`) REFERENCES `pivot_sets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `surgery_sets_surgery_id_foreign` FOREIGN KEY (`surgery_id`) REFERENCES `pivot_surgeries` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_surgery_sets`
--

LOCK TABLES `pivot_surgery_sets` WRITE;
/*!40000 ALTER TABLE `pivot_surgery_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_surgery_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_surgical_actions`
--

DROP TABLE IF EXISTS `pivot_surgical_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_surgical_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `surgical_unique_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Surgical uniqid',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `sr_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `surgery_id` int NOT NULL COMMENT 'patients_surgeries table ID',
  `hospital_id` int NOT NULL COMMENT 'Hospital ID',
  `user_id` int NOT NULL COMMENT 'User ID',
  `status` enum('INPROGRESS','CLOSED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Surgery Status',
  `sets_with_instrument_actions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Session selected sets with instruments action',
  `instruments_actions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `instruments_finish_actions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tab` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'user selected surgery tab',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `surgical_raw_data` json NOT NULL COMMENT 'surgical sets with instrument raw data',
  `department_data` json NOT NULL COMMENT 'current department data',
  `sets_start_date` json NOT NULL COMMENT 'set start date',
  `reader_id` int NOT NULL COMMENT 'reader id',
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'module',
  `batchid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'log batchid id',
  `finised` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_surgical_actions`
--

LOCK TABLES `pivot_surgical_actions` WRITE;
/*!40000 ALTER TABLE `pivot_surgical_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_surgical_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_surgical_set_actions`
--

DROP TABLE IF EXISTS `pivot_surgical_set_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_surgical_set_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `surgical_action_id` int NOT NULL COMMENT 'surgical_actions table ID',
  `hospital_id` int NOT NULL COMMENT 'Hospital ID',
  `user_id` int NOT NULL COMMENT 'User ID',
  `set_id` int NOT NULL COMMENT 'Set ID',
  `instruments_actions` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `instruments_finish_actions` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_surgical_set_actions`
--

LOCK TABLES `pivot_surgical_set_actions` WRITE;
/*!40000 ALTER TABLE `pivot_surgical_set_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_surgical_set_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_surgical_specialities`
--

DROP TABLE IF EXISTS `pivot_surgical_specialities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_surgical_specialities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hospital_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `surgical_specialities_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_surgical_specialities`
--

LOCK TABLES `pivot_surgical_specialities` WRITE;
/*!40000 ALTER TABLE `pivot_surgical_specialities` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_surgical_specialities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_tagging_tag_groups`
--

DROP TABLE IF EXISTS `pivot_tagging_tag_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_tagging_tag_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagging_tag_groups_slug_index` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_tagging_tag_groups`
--

LOCK TABLES `pivot_tagging_tag_groups` WRITE;
/*!40000 ALTER TABLE `pivot_tagging_tag_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_tagging_tag_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_tagging_tagged`
--

DROP TABLE IF EXISTS `pivot_tagging_tagged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_tagging_tagged` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `taggable_id` int unsigned NOT NULL,
  `taggable_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tag_slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagging_tagged_taggable_id_index` (`taggable_id`),
  KEY `tagging_tagged_taggable_type_index` (`taggable_type`),
  KEY `tagging_tagged_tag_slug_index` (`tag_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_tagging_tagged`
--

LOCK TABLES `pivot_tagging_tagged` WRITE;
/*!40000 ALTER TABLE `pivot_tagging_tagged` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_tagging_tagged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_tagging_tags`
--

DROP TABLE IF EXISTS `pivot_tagging_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_tagging_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tag_group_id` int unsigned DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `suggest` tinyint(1) NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tagging_tags_slug_index` (`slug`),
  KEY `tagging_tags_tag_group_id_foreign` (`tag_group_id`),
  CONSTRAINT `tagging_tags_tag_group_id_foreign` FOREIGN KEY (`tag_group_id`) REFERENCES `pivot_tagging_tag_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_tagging_tags`
--

LOCK TABLES `pivot_tagging_tags` WRITE;
/*!40000 ALTER TABLE `pivot_tagging_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_tagging_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_temp_table_for_logs`
--

DROP TABLE IF EXISTS `pivot_temp_table_for_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_temp_table_for_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `department_id` int unsigned NOT NULL,
  `location_id` int unsigned NOT NULL,
  `sending_department_id` int NOT NULL DEFAULT '0',
  `reader_id` int unsigned NOT NULL,
  `handled_by` int unsigned NOT NULL,
  `json_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('pending','inprogress','success','failed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'pending',
  `station` enum('PACKING','RECEIVING','SURGICAL WHITEBOARD','RETURNING','LOOSE INSTRUMENT PACK') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'PACKING',
  `batch_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set_log_uniqid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_temp_table_for_logs`
--

LOCK TABLES `pivot_temp_table_for_logs` WRITE;
/*!40000 ALTER TABLE `pivot_temp_table_for_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_temp_table_for_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_test_cycles`
--

DROP TABLE IF EXISTS `pivot_test_cycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_test_cycles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cycle_id` int DEFAULT NULL,
  `cycle_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `indicators` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `reason` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `comment` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sterilization_id` int DEFAULT NULL,
  `report_file_name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_test_cycles`
--

LOCK TABLES `pivot_test_cycles` WRITE;
/*!40000 ALTER TABLE `pivot_test_cycles` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_test_cycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_threads`
--

DROP TABLE IF EXISTS `pivot_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_threads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('INCIDENT') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type_id` int unsigned NOT NULL,
  `priority` enum('LOW','MEDIUM','HIGH') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_threads`
--

LOCK TABLES `pivot_threads` WRITE;
/*!40000 ALTER TABLE `pivot_threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_throttle`
--

DROP TABLE IF EXISTS `pivot_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_throttle`
--

LOCK TABLES `pivot_throttle` WRITE;
/*!40000 ALTER TABLE `pivot_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_title`
--

DROP TABLE IF EXISTS `pivot_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_title` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_title`
--

LOCK TABLES `pivot_title` WRITE;
/*!40000 ALTER TABLE `pivot_title` DISABLE KEYS */;
INSERT INTO `pivot_title` VALUES (1,'Mr.','2019-10-01 06:20:06','2019-10-01 06:20:06'),(2,'Mrs.','2019-10-01 06:20:06','2019-10-01 06:20:06'),(3,'Ms.','2019-10-01 06:20:06','2019-10-01 06:20:06'),(4,'Dr.','2019-10-01 06:20:06','2019-10-01 06:20:06');
/*!40000 ALTER TABLE `pivot_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_unit_of_measurement`
--

DROP TABLE IF EXISTS `pivot_unit_of_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_unit_of_measurement` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_unit_of_measurement`
--

LOCK TABLES `pivot_unit_of_measurement` WRITE;
/*!40000 ALTER TABLE `pivot_unit_of_measurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_unit_of_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_upload_csv`
--

DROP TABLE IF EXISTS `pivot_upload_csv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_upload_csv` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int NOT NULL,
  `user_id` int NOT NULL,
  `department_id` int NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('PENDING','INPROGRESS','COMPLETE','FAILED') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('Add Instrument','Add Set','Add Instrument Master','Add Set Master','Add Vendor','Add Instrument Category','Add Tray Category','Add Set Category','Add Porter','Add Incident Type','Add Surgeon','Add Item Master','Add Pack Master') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_upload_csv`
--

LOCK TABLES `pivot_upload_csv` WRITE;
/*!40000 ALTER TABLE `pivot_upload_csv` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_upload_csv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_user_activity`
--

DROP TABLE IF EXISTS `pivot_user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_user_activity` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_user_activity`
--

LOCK TABLES `pivot_user_activity` WRITE;
/*!40000 ALTER TABLE `pivot_user_activity` DISABLE KEYS */;
INSERT INTO `pivot_user_activity` VALUES (1,1,'http://localhost:8000/admin/user/list','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-29 05:56:01','2022-12-29 05:56:01'),(2,1,'http://localhost:8000/admin/user/list','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-29 05:56:37','2022-12-29 05:56:37'),(3,1,'http://localhost:8000/admin/create/user','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-29 05:56:39','2022-12-29 05:56:39'),(4,1,'http://localhost:8000/customization/fieldsetting','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-29 05:56:42','2022-12-29 05:56:42'),(5,1,'http://localhost:8000/customization/fieldsetting','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-29 05:57:44','2022-12-29 05:57:44'),(6,1,'http://localhost:8000/admin/user/list','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-29 05:57:48','2022-12-29 05:57:48'),(7,1,'http://localhost:8000/admin/create/user','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-29 05:57:50','2022-12-29 05:57:50'),(8,1,'http://localhost:8000/admin/user/list','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-29 06:00:03','2022-12-29 06:00:03');
/*!40000 ALTER TABLE `pivot_user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_user_departments`
--

DROP TABLE IF EXISTS `pivot_user_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_user_departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `department_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_departments_user_id_foreign` (`user_id`),
  KEY `user_departments_department_id_foreign` (`department_id`),
  CONSTRAINT `user_departments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `pivot_departments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_departments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_user_departments`
--

LOCK TABLES `pivot_user_departments` WRITE;
/*!40000 ALTER TABLE `pivot_user_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_user_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_users`
--

DROP TABLE IF EXISTS `pivot_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_type` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_format` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'jS M, Y',
  `mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `report_to` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `employee_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `his_intigration_inventory` smallint NOT NULL DEFAULT '0',
  `his_intigration_case_schedules` smallint NOT NULL DEFAULT '0',
  `his_intigration_consumption_reporting` smallint NOT NULL DEFAULT '0',
  `his_noninstrument_tracking` smallint NOT NULL DEFAULT '0',
  `mapping_hospital_id` int DEFAULT NULL,
  `single_use_device` smallint NOT NULL DEFAULT '0',
  `old_single_use_device` smallint NOT NULL DEFAULT '0',
  `enable_cleaning_station` tinyint(1) NOT NULL DEFAULT '0',
  `workorder_status` smallint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_status` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `login_attempt` int NOT NULL DEFAULT '0',
  `email_verification_status` enum('UNVERIFIED','VERIFIED','SENT') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'UNVERIFIED',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_users`
--

LOCK TABLES `pivot_users` WRITE;
/*!40000 ALTER TABLE `pivot_users` DISABLE KEYS */;
INSERT INTO `pivot_users` VALUES (1,'admin@xornor.co','$2y$10$52HO5sO64DkF8lBPHVEWOe/EDK1o9RnalJ9wtQCLzXfNp/p8hrIlq','{\"admin\":true}','2022-12-29 05:54:50','','eyJpdiI6InFvWkJSYnVuVDh3a0NBeldWS1BcLzF3PT0iLCJ2YWx1ZSI6ImZQaVg1RXpNbnlvcnprdTR5MzNMK2c9PSIsIm1hYyI6ImM4NzE0ZGE2NGNlZWM2YmI1NDAwNDkwYzE4YjU1MTlhOTVmZjdlYjQ2MGIxOWYwYjBmNTZmYjFmNjhkZjcwN2UifQ==','eyJpdiI6IlB0UWFhOVJ3Ukp3K2J0QnhnWkpnZXc9PSIsInZhbHVlIjoiWUF4Y0JKUkhIbFdoRFhpYjlLSnVJUT09IiwibWFjIjoiY2M3Y2I3NDhhNmMxOWZkYzY2ZWU1NmIyMjljZThiODc5ODYzZjQxYzJjOTAzMzRjODc5NmEzZTVmOTE5MGZlYyJ9',NULL,1,'1630904364_6135a02c309b8.jpeg','Asia/Kolkata','jS M, Y','','','eyJpdiI6ImVCblwvT0d3citSYUFvVVArVVFRVnlRPT0iLCJ2YWx1ZSI6IjhIeVYxYTFCbThSWUx1T2d4RkJpK2c9PSIsIm1hYyI6ImYxZjI3N2IzYzM0OThhYTY1MTcwYTk4YTIzZTQxMzI3ZmM1MmNjNDE3Y2U5YTZhMDc4Yjk4MGE1ZTgwMjI4MmIifQ==',0,0,0,0,NULL,0,0,0,0,'2019-10-01 06:20:05','2022-12-29 05:54:50','1',0,'UNVERIFIED'),(2,'radhika@pivotsmartflow.com','$2y$10$agTOSSYYoMF7jVzflwVwWOU9cWs.QMCiXU3YwbUsMohLseRrj8pye','{\"admin\":true}','2022-10-07 11:43:53','Mrs.','eyJpdiI6IlwvY0x2T3k4VEJMeGNyWmdFZ21DWjFRPT0iLCJ2YWx1ZSI6Ik1aS1NDSUhTMW5HdWE3ZnhGTVNza3c9PSIsIm1hYyI6IjZlODU3YzVhODMyNWYyZGExZTNkMDhkYmVmMWUyOGVkNmQ4MjQ5ODNhMTQ5MjZlZmQyMmJmNWQyNmJiZDI5MmEifQ==','eyJpdiI6Ik4xWnRMcDV0RFRjNnlmclwvUVl4bENRPT0iLCJ2YWx1ZSI6IjZtU0dzYWw0cGFsdmNJRGFwR1U0SGc9PSIsIm1hYyI6Ijc1NTAxMzJhOThjZjg0ZTM5OWUzNmJlMDNjMTkyNmQwOTAzMDU0NjA1MDkwY2JjNTJmZGJkMGU3MTJkODkxOWUifQ==',NULL,1,'','Asia/Kolkata','jS M, Y','','','eyJpdiI6ImVHQXNcL3M1VkdSeHJXd212dk15SnBBPT0iLCJ2YWx1ZSI6IjN1a0dyOTFjeHNPQnJNdzZEQTdieFE9PSIsIm1hYyI6IjBlZjYzYjk4YWIzOTA4YzFkMzBlYzU1NTM4YWMwNmI2MGE0NDQzM2E1NzM3MWM0MWI3N2VhNzI4NDNjMjlmZDgifQ==',0,0,0,0,NULL,0,0,0,0,'2019-10-01 06:20:05','2022-10-09 02:29:51','1',0,'UNVERIFIED'),(3,'ashish@pivotsmartflow.com','$2y$10$ABY6ZOb4Imtq9vLVTOV.vOq0kBqIERZW3LzTnZAqF6t5A32aqMwr.','{\"hospital\":true}',NULL,'1','eyJpdiI6IkFVTU5VNVpKVUJEOWpnY0k0RW5uSnc9PSIsInZhbHVlIjoiZ2RlekZpanFNMG1hbUQ0M1BOakptQT09IiwibWFjIjoiYzQ5YTlhNmVkYjliYjc2MjFlMjdhOTUyZDU3NWM3NGNhZTBlODYxZmFhZTg2ZGM1OTAzMzc4YTlmN2NmY2RjZSJ9','eyJpdiI6InZiSXpqNVNIK0p4SHJiN2ExczVKZFE9PSIsInZhbHVlIjoiZnJ4NDhOakwyMFFOSVVXWXlGdklFZz09IiwibWFjIjoiM2QxZGYyODlmMDExOGZiNTI2NmE4OTg1NzMxOTljOWU5NzExMmYzZmRhM2EwNzAwMjU2ZWUwZTFiZDVjM2RjNCJ9',NULL,2,'','UTC','jS M, Y','','','eyJpdiI6InFLa0lNT0o5M0NEYjE0MEdOaG13Y2c9PSIsInZhbHVlIjoiVFBONGhOYmxENEhRXC9ja1ZEaGc5dFZsZjd4cWwzMFgxbFwvVFpcL3Y3MEpTQT0iLCJtYWMiOiJiNjRlNTM5MGU3NWQxOGQ2MmQ0ODUzZGJlMjcwMWNjNTIxNmQ0MWMxMGE5YTA5ODI5NGUzMDVmNTIwMzQyMDgyIn0=',1,1,1,0,908,0,0,0,0,'2022-12-29 06:00:01','2022-12-29 06:00:01','1',0,'UNVERIFIED');
/*!40000 ALTER TABLE `pivot_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_users_verify`
--

DROP TABLE IF EXISTS `pivot_users_verify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_users_verify` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token_status` tinyint(1) NOT NULL DEFAULT '0',
  `token_expiry_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_verify_user_id_unique` (`user_id`),
  UNIQUE KEY `users_verify_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_users_verify`
--

LOCK TABLES `pivot_users_verify` WRITE;
/*!40000 ALTER TABLE `pivot_users_verify` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_users_verify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_vendors`
--

DROP TABLE IF EXISTS `pivot_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_vendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  `vendor_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `original_vendor_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendors_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `vendors_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_vendors`
--

LOCK TABLES `pivot_vendors` WRITE;
/*!40000 ALTER TABLE `pivot_vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_webhooks`
--

DROP TABLE IF EXISTS `pivot_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_id` int unsigned NOT NULL,
  `event_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom_headers` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_enable` tinyint(1) NOT NULL DEFAULT '0',
  `auth_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_token_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_token` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webhooks_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `webhooks_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `pivot_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_webhooks`
--

LOCK TABLES `pivot_webhooks` WRITE;
/*!40000 ALTER TABLE `pivot_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pivot_webhooks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-29 17:01:11
