/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.1.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: pmb
-- ------------------------------------------------------
-- Server version	12.1.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cache` VALUES
('pmb-online-cache-ridho1@gmail.com|127.0.0.1','i:1;',1769336525),
('pmb-online-cache-ridho1@gmail.com|127.0.0.1:timer','i:1769336525;',1769336525);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `custom_field_values`
--

DROP TABLE IF EXISTS `custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `custom_field_id` bigint(20) unsigned NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field_values_user_id_foreign` (`user_id`),
  KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`),
  CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `custom_field_values_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_values`
--

LOCK TABLES `custom_field_values` WRITE;
/*!40000 ALTER TABLE `custom_field_values` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `custom_field_values` VALUES
(1,7,1,'documents/z1RV7JEKvOFo7sxbLn0AbZ9ViktZR51UKdB4qWd6.jpg','2026-01-14 06:27:52','2026-01-14 06:27:52'),
(2,8,1,'documents/xDLU68bUdUEMIGpYY8r2gdoWFGnUWyq8Jo8cwbQm.jpg','2026-01-14 09:16:23','2026-01-14 09:16:23'),
(3,2,1,'documents/UgedDaPb5UieDaL6TsQbccWQJJi48piLkf0P2tAl.jpg','2026-01-14 19:53:14','2026-01-14 19:53:14'),
(4,2,2,'lost','2026-01-27 16:01:17','2026-01-27 16:01:17');
/*!40000 ALTER TABLE `custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` enum('registration','document') NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `custom_fields` VALUES
(1,'lol','lol','file','asd','document',0,NULL,0,'2026-01-14 06:23:41','2026-01-14 06:23:41'),
(2,'Pondok','pondok','text','Tambahkan pondok','registration',0,NULL,0,'2026-01-25 15:46:02','2026-01-25 15:46:02');
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `photo_formal` varchar(255) DEFAULT NULL,
  `ktp_scan` varchar(255) DEFAULT NULL,
  `kk_scan` varchar(255) DEFAULT NULL,
  `ijazah_scan` varchar(255) DEFAULT NULL,
  `report_scan` varchar(255) DEFAULT NULL,
  `achievement_certificate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_user_id_foreign` (`user_id`),
  CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `documents` VALUES
(1,7,'documents/ydQftNKcha0LiZWJ1DrzN6xYhEdEnXtPSYCobwp8.jpg','documents/K4Q6J1bYxIaygtzwDLrA20VDHCE2NrfCatkx6sr2.jpg','documents/IGLN1wLP6BSjl6TSXT6taGX1q853wQ0gF10t7pjN.jpg','documents/l00XzbIUsoq6505G1DjtJLTk47GE6OZifRNxNnY9.jpg','documents/137hRHFhoD5k8F2CtrpKS46AF0V2ELMtvQe3vlGP.jpg','documents/xoDBBmE9IcTTSO8b3Hh694feUD4dYqXxFULkluyc.jpg','2026-01-14 06:24:45','2026-01-14 06:24:52'),
(2,8,'documents/XzzvCBgbM5v6DPvk18pl3opfj3s4o93DhFrhZbeq.jpg',NULL,NULL,NULL,'documents/xEryOWLg2sFBRknIez790uX6cprpyPEEFZa3KfBY.jpg','documents/xKU8Kz4xazJ9AUqEqfhgGo2Zu6XsConiA8wptK1y.jpg','2026-01-14 07:19:38','2026-01-14 09:48:05'),
(3,2,'documents/Yc3Buf6EunUm3NhUDW2KBniHE2SEFOPi5Dz0zIXh.jpg','documents/jsC3atWGI6tSkndTFjsO5o9SXcKCul02CebpLOPZ.jpg','documents/bQRf3L0fTU2Bw2mjXe0O7Lwv63UbeWFP7gjro9xw.jpg','documents/6Wy2VvkeJvLE4ba4h6cbwFzMkUkZ5OP2h2flWZm4.jpg','documents/pKbJFdJ7Vdf5JmtkFu8KIqM0H9zaHV38kxt8v1mB.jpg','documents/yKMa0ILIQeOj4Bah8VSZYx9U6plu5eG4WbkPb06K.jpg','2026-01-14 19:53:14','2026-01-14 19:53:14');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `exam_answers`
--

DROP TABLE IF EXISTS `exam_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_session_id` bigint(20) unsigned NOT NULL,
  `exam_question_id` bigint(20) unsigned NOT NULL,
  `exam_option_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_answers_exam_session_id_foreign` (`exam_session_id`),
  KEY `exam_answers_exam_question_id_foreign` (`exam_question_id`),
  KEY `exam_answers_exam_option_id_foreign` (`exam_option_id`),
  CONSTRAINT `exam_answers_exam_option_id_foreign` FOREIGN KEY (`exam_option_id`) REFERENCES `exam_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_answers_exam_question_id_foreign` FOREIGN KEY (`exam_question_id`) REFERENCES `exam_questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_answers_exam_session_id_foreign` FOREIGN KEY (`exam_session_id`) REFERENCES `exam_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_answers`
--

LOCK TABLES `exam_answers` WRITE;
/*!40000 ALTER TABLE `exam_answers` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `exam_answers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `exam_options`
--

DROP TABLE IF EXISTS `exam_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_question_id` bigint(20) unsigned NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_options_exam_question_id_foreign` (`exam_question_id`),
  CONSTRAINT `exam_options_exam_question_id_foreign` FOREIGN KEY (`exam_question_id`) REFERENCES `exam_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_options`
--

LOCK TABLES `exam_options` WRITE;
/*!40000 ALTER TABLE `exam_options` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `exam_options` VALUES
(5,2,'haha',0,'2026-01-13 16:44:48','2026-01-13 16:44:48'),
(6,2,'ijo',0,'2026-01-13 16:44:48','2026-01-13 16:44:48'),
(7,2,'in ma laeff',0,'2026-01-13 16:44:48','2026-01-13 16:44:48'),
(8,2,'lmao',1,'2026-01-13 16:44:48','2026-01-13 16:44:48');
/*!40000 ALTER TABLE `exam_options` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `exam_questions`
--

DROP TABLE IF EXISTS `exam_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_id` bigint(20) unsigned NOT NULL,
  `question_text` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_questions_exam_id_foreign` (`exam_id`),
  CONSTRAINT `exam_questions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_questions`
--

LOCK TABLES `exam_questions` WRITE;
/*!40000 ALTER TABLE `exam_questions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `exam_questions` VALUES
(2,2,'asdada',NULL,'2026-01-13 16:44:48','2026-01-13 16:44:48');
/*!40000 ALTER TABLE `exam_questions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `exam_sessions`
--

DROP TABLE IF EXISTS `exam_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `exam_id` bigint(20) unsigned NOT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `status` enum('progress','done') NOT NULL DEFAULT 'progress',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_sessions_user_id_foreign` (`user_id`),
  KEY `exam_sessions_exam_id_foreign` (`exam_id`),
  CONSTRAINT `exam_sessions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_sessions`
--

LOCK TABLES `exam_sessions` WRITE;
/*!40000 ALTER TABLE `exam_sessions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `exam_sessions` VALUES
(2,2,2,NULL,NULL,0,'done','2026-01-14 19:54:47','2026-01-14 19:54:47');
/*!40000 ALTER TABLE `exam_sessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `exams` VALUES
(2,'mbuh',60,'2026-01-13 16:44:33','2026-01-13 16:44:33');
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `identities`
--

DROP TABLE IF EXISTS `identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `identities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identities_nik_unique` (`nik`),
  KEY `identities_user_id_foreign` (`user_id`),
  CONSTRAINT `identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identities`
--

LOCK TABLES `identities` WRITE;
/*!40000 ALTER TABLE `identities` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `identities` VALUES
(1,2,'riski inrahim','1234567890123456','banyuwangi','2025-12-11','L','2026-01-13 08:35:10','2026-01-27 16:03:45'),
(2,7,'jokowow','1234567890123459','banyuwangi','2026-01-23','P','2026-01-13 09:55:17','2026-01-13 09:55:17'),
(3,8,'ali nugroho saputr','1234567890987651','banyuwangi','2026-01-02','L','2026-01-14 07:17:57','2026-01-14 07:17:57');
/*!40000 ALTER TABLE `identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2025_12_23_144935_add_role_to_users_table',1),
(5,'2025_12_23_160353_add_status_to_users_table',1),
(6,'2025_12_24_000000_create_study_programs_table',1),
(7,'2025_12_25_213033_create_identities_table',1),
(8,'2025_12_25_213641_create_registrations_table',1),
(9,'2025_12_25_214022_create_documents_table',1),
(10,'2025_12_25_214626_create_payments_table',1),
(11,'2025_12_25_233134_create_validities_table',1),
(12,'2025_12_26_141949_create_registration_periods_table',1),
(13,'2025_12_26_194117_add_registration_period_id_to_registrations_table',1),
(14,'2025_12_29_123837_create_exams_table',1),
(15,'2025_12_29_123838_create_exam_questions_table',1),
(16,'2025_12_29_123843_create_exam_options_table',1),
(17,'2025_12_29_123844_create_exam_sessions_table',1),
(18,'2025_12_29_123845_create_exam_answers_table',1),
(19,'2025_12_30_191655_custom_fields',2),
(20,'2025_12_30_191723_custom_field_values',2),
(21,'2025_12_30_200032_update_graduation_year_in_registrations_table',3),
(22,'2025_12_30_204337_add_registration_period_id_to_users_table',4),
(23,'2026_01_14_111059_add_is_document_valid_to_validities_table',5),
(24,'2026_01_16_132614_create_settings_table',6),
(25,'2026_01_17_054439_add_nama_rekening_to_settings_table',7),
(26,'2026_01_17_055830_add_nama_bank_to_settings_table',8),
(27,'2026_01_25_103326_student_profiles',9),
(28,'2026_01_25_103337_student_families',9),
(29,'2026_01_25_103348_student_details',9),
(30,'2026_01_25_111723_add_pondok_to_student_profiles_table',9),
(31,'2026_01_26_133425_add_second_study_program_to_registrations_table',10),
(32,'2026_01_27_151956_add_column_nowa_to_settings',11),
(33,'2026_01_27_200240_add_column_thumb1_to_settings_table',12),
(34,'2026_01_27_203718_add_column_status_kelulusan_to_registrations_table',13),
(35,'2026_01_27_214950_add_column_nim_to_registrations_table',14);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `proof_file` varchar(255) NOT NULL,
  `status` enum('pending','success','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`),
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `payments` VALUES
(1,8,'aowkoakwowak','document/Au4sHO5lFo3TfJECt48XbZCis4xULu14hjEv6CbI.jpg','success','2026-01-14 08:20:32','2026-01-27 14:28:04'),
(2,2,'123','document/6rZdAhaRCgjQayfKzjcq1cDBZ3Wmx0scSUbAOe9X.jpg','success','2026-01-14 19:53:32','2026-01-27 14:23:41');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `registration_periods`
--

DROP TABLE IF EXISTS `registration_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_periods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_periods`
--

LOCK TABLES `registration_periods` WRITE;
/*!40000 ALTER TABLE `registration_periods` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `registration_periods` VALUES
(1,'Gelombang 2',100000,'2025-12-31 01:51:00','2026-01-31 01:51:00',1,'2025-12-30 11:52:10','2026-01-27 06:47:41'),
(2,'Gelombang 1 KADER NU',0,'2026-01-28 00:34:00','2026-02-28 00:34:00',1,'2026-01-27 10:34:19','2026-01-27 10:34:19');
/*!40000 ALTER TABLE `registration_periods` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `registration_period_id` bigint(20) unsigned DEFAULT NULL,
  `entry_path` varchar(255) NOT NULL,
  `participant_number` varchar(255) DEFAULT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `school_origin` varchar(255) NOT NULL,
  `graduation_year` int(11) NOT NULL,
  `study_program_id` bigint(20) unsigned NOT NULL,
  `study_program_id_second` bigint(20) unsigned DEFAULT NULL,
  `achievement_certificate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_kelulusan` enum('lulus','tidak_lulus','pending') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `registrations_user_id_foreign` (`user_id`),
  KEY `registrations_study_program_id_foreign` (`study_program_id`),
  KEY `registrations_registration_period_id_foreign` (`registration_period_id`),
  KEY `registrations_study_program_id_second_foreign` (`study_program_id_second`),
  CONSTRAINT `registrations_registration_period_id_foreign` FOREIGN KEY (`registration_period_id`) REFERENCES `registration_periods` (`id`),
  CONSTRAINT `registrations_study_program_id_foreign` FOREIGN KEY (`study_program_id`) REFERENCES `study_programs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `registrations_study_program_id_second_foreign` FOREIGN KEY (`study_program_id_second`) REFERENCES `study_programs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `registrations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations`
--

LOCK TABLES `registrations` WRITE;
/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `registrations` VALUES
(1,2,1,'SNBT','123','123','sman jawa',2024,2,1,NULL,'2026-01-13 08:35:10','2026-01-27 16:03:54','tidak_lulus'),
(2,7,NULL,'SNBT','12345',NULL,'sman jawir',2021,3,NULL,NULL,'2026-01-13 09:55:17','2026-01-13 09:55:17','pending'),
(3,8,1,'SNBT','12341',NULL,'sman jawa',2025,10,NULL,NULL,'2026-01-14 07:17:57','2026-01-27 14:28:05','lulus');
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sessions` VALUES
('DV9bubgbGONa76uGnexcqnYP9WcBeCjXOWcYiOwG',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN09KbENrUmx3enByRmsyS29OR05VQW5vZDVOdloxM0lhVkhoQThqTyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo2NDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2V4cG9ydC9kYXRhP3BlcmlvZF9pZD0mdHlwZT1kaXRlcmltYSI7czo1OiJyb3V0ZSI7czoxMzoiYWRtaW4ucmVwb3J0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1769555800),
('Vn399fkO3bPsYQWCHKo0OcwLnr36u7nMff3KTxym',2,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSElOd0x6V2hGN1NpY1d1RXV6Y0lzeUZTOEluMDFjUnYyOTRva3ZKaSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZm9ybXVsaXIvaXNpLWZvcm0iO3M6NToicm91dGUiO3M6MTM6InN0dWRlbnQuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=',1769555798);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rekening` varchar(255) DEFAULT '123',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nama_rekening` varchar(255) DEFAULT 'admin',
  `nama_bank` varchar(255) DEFAULT 'bca',
  `nowa` varchar(255) DEFAULT '08123456789',
  `thumb1` varchar(255) DEFAULT NULL,
  `thumb2` varchar(255) DEFAULT NULL,
  `thumb3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `settings` VALUES
(1,'12314',NULL,'2026-01-27 13:33:06','admin','BRI','6281231900751','settings/VLCxmWPGusyvSKEk3Ej861sHuk3CWCCRvblSgzWG.png','settings/vP3V8iFhMbLbbT1OpExLQI55MfeONNkyU6EFjmg3.png',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `student_details`
--

DROP TABLE IF EXISTS `student_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `registration_id` bigint(20) unsigned NOT NULL,
  `kewarganegaraan` varchar(255) NOT NULL DEFAULT 'Indonesia',
  `nisn` varchar(10) DEFAULT NULL,
  `npwp` varchar(255) DEFAULT NULL,
  `jalan` varchar(255) DEFAULT NULL,
  `dusun` varchar(255) DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kode_pos` varchar(5) DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `hp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `penerima_kps` varchar(255) DEFAULT NULL,
  `alat_transportasi` varchar(255) DEFAULT NULL,
  `jenis_tinggal` varchar(255) DEFAULT NULL,
  `kebutuhan_khusus_mahasiswa` varchar(255) DEFAULT 'Tidak Ada',
  `kebutuhan_khusus_ayah` varchar(255) DEFAULT 'Tidak Ada',
  `kebutuhan_khusus_ibu` varchar(255) DEFAULT 'Tidak Ada',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_details_registration_id_unique` (`registration_id`),
  CONSTRAINT `student_details_registration_id_foreign` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_details`
--

LOCK TABLES `student_details` WRITE;
/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `student_details` VALUES
(2,1,'Iya','1234567890','123456789012345','xxx','gen','01','12','qwdqwd','asu','1231','081231900752','0812183127321','adnan@gmail.com',NULL,NULL,NULL,'Tuna Netra','xxx',NULL,'2026-01-25 06:53:03','2026-01-27 15:21:56');
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `student_families`
--

DROP TABLE IF EXISTS `student_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_families` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `registration_id` bigint(20) unsigned NOT NULL,
  `nik_ayah` varchar(255) DEFAULT NULL,
  `nama_ayah` varchar(255) DEFAULT NULL,
  `tgl_lahir_ayah` date DEFAULT NULL,
  `pendidikan_ayah` varchar(255) DEFAULT NULL,
  `pekerjaan_ayah` varchar(255) DEFAULT NULL,
  `penghasilan_ayah` varchar(255) DEFAULT NULL,
  `nik_ibu` varchar(255) DEFAULT NULL,
  `nama_ibu` varchar(255) DEFAULT NULL,
  `tgl_lahir_ibu` date DEFAULT NULL,
  `pendidikan_ibu` varchar(255) DEFAULT NULL,
  `pekerjaan_ibu` varchar(255) DEFAULT NULL,
  `penghasilan_ibu` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_families_registration_id_foreign` (`registration_id`),
  CONSTRAINT `student_families_registration_id_foreign` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_families`
--

LOCK TABLES `student_families` WRITE;
/*!40000 ALTER TABLE `student_families` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `student_families` VALUES
(2,1,'1234567890123456','as','2025-10-16',NULL,NULL,NULL,NULL,'12312','2026-01-02',NULL,NULL,NULL,'2026-01-25 06:53:03','2026-01-27 15:17:07');
/*!40000 ALTER TABLE `student_families` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `student_profiles`
--

DROP TABLE IF EXISTS `student_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `registration_id` bigint(20) unsigned NOT NULL,
  `religion` varchar(255) NOT NULL,
  `nama_pondok` varchar(255) DEFAULT NULL,
  `alamat_pondok` varchar(255) DEFAULT NULL,
  `nisn` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_profiles_nisn_unique` (`nisn`),
  KEY `student_profiles_registration_id_foreign` (`registration_id`),
  CONSTRAINT `student_profiles_registration_id_foreign` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_profiles`
--

LOCK TABLES `student_profiles` WRITE;
/*!40000 ALTER TABLE `student_profiles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `student_profiles` VALUES
(2,1,'Kristen',NULL,NULL,'1234567890','2026-01-25 06:53:03','2026-01-25 07:05:50');
/*!40000 ALTER TABLE `student_profiles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `study_programs`
--

DROP TABLE IF EXISTS `study_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_programs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `faculty` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `study_programs_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_programs`
--

LOCK TABLES `study_programs` WRITE;
/*!40000 ALTER TABLE `study_programs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `study_programs` VALUES
(1,'Teknik Informatika','Teknik',1,'2025-12-30 11:20:54','2025-12-30 11:20:54'),
(2,'Teknik Sipil','Teknik',1,'2025-12-30 11:20:54','2025-12-30 11:20:54'),
(3,'Teknik Elektro','Teknik',1,'2025-12-30 11:20:54','2025-12-30 11:20:54'),
(4,'Sistem Informasi','Teknik',1,'2025-12-30 11:20:54','2025-12-30 11:20:54'),
(5,'Akuntansi','Ekonomi & Bisnis',1,'2025-12-30 11:20:54','2025-12-30 11:20:54'),
(6,'Manajemen','Ekonomi & Bisnis',1,'2025-12-30 11:20:54','2025-12-30 11:20:54'),
(7,'Ekonomi Pembangunan','Ekonomi & Bisnis',1,'2025-12-30 11:20:54','2025-12-30 11:20:54'),
(8,'Ilmu Komunikasi','ISIP',1,'2025-12-30 11:20:54','2025-12-30 11:20:54'),
(9,'Administrasi Publik','ISIP',1,'2025-12-30 11:20:54','2025-12-30 11:20:54'),
(10,'Hubungan Internasional','ISIP',1,'2025-12-30 11:20:54','2025-12-30 11:20:54');
/*!40000 ALTER TABLE `study_programs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `nama_ibu` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `status` varchar(255) NOT NULL DEFAULT 'invalid',
  `registration_period_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_registration_period_id_foreign` (`registration_period_id`),
  CONSTRAINT `users_registration_period_id_foreign` FOREIGN KEY (`registration_period_id`) REFERENCES `registration_periods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,'ridho','123','anjay','ridho@gmail.com',NULL,'$2y$12$WmMppcsuP/eAGPs7Ln0S.OP5JDWdj5ufI/rGInItJL3cF39t6rX3u','vAX9zJ5dkrtwEbpWct2hwOittsHavbmVxQI2k5ZsTKV3WS2hcRBYW0LzUwDQ','2025-12-30 11:21:30','2025-12-30 11:21:30','admin','pending',NULL),
(2,'adnan','123','anjay','adnan@gmail.com',NULL,'$2y$12$6eX0ru7Cxumh.Uzer6cADepksQRuo0R.OfJX7FR04w4PGtQFu.gCC','uahvcMMjVvZ1EKMzizjgW6AoSiXhZ5YGdBSioTKDcyZQ8z0PHcIJ6gh113UJ','2025-12-30 11:22:01','2026-01-27 15:15:24','user','invalid',2),
(6,'andjay','123456789012346','anjay','andjay@gmail.com',NULL,'$2y$12$DkjSD2gPVWapxRX5RLwrEO7LgBCJpLHMEIvB.7GdBmqYG6Fsf7KNa',NULL,'2026-01-13 08:35:49','2026-01-13 17:52:26','user','valid',NULL),
(7,'jokowow','123456789012345','joko emaknya','joko@gmail.com',NULL,'$2y$12$z.hYNuMoa2mrgelaYrIg8.3fWWwYStPVRyFmC94ftBmUJ1Lm2s1IK','IbfqbwoloiNMugnd6nfaClq23B97lzZL9kvslGG5gcu4FXcXauusC5zUS8sh','2026-01-13 09:52:59','2026-01-27 08:06:33','user','valid',NULL),
(8,'ali nugroho saputr','1234567890987651','suminah','ali@gmail.com',NULL,'$2y$12$qe1.t4dk5.eWcsNJgTVj1e0uSuJ9E1Rc5k1wOllRAh/RW5gAl9ZYy',NULL,'2026-01-14 07:13:57','2026-01-27 14:28:04','user','valid',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `validities`
--

DROP TABLE IF EXISTS `validities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `validities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `is_data_valid` tinyint(1) NOT NULL DEFAULT 0,
  `is_payment_valid` tinyint(1) NOT NULL DEFAULT 0,
  `is_document_valid` tinyint(4) DEFAULT NULL,
  `final_status` enum('pending','valid','invalid') NOT NULL DEFAULT 'pending',
  `admin_note` text DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `validities_user_id_foreign` (`user_id`),
  CONSTRAINT `validities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validities`
--

LOCK TABLES `validities` WRITE;
/*!40000 ALTER TABLE `validities` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `validities` VALUES
(1,7,1,1,1,'valid',NULL,'2026-01-27 08:06:33','2026-01-14 05:40:49','2026-01-27 08:06:35'),
(2,8,1,1,1,'valid','banci','2026-01-27 14:28:05','2026-01-14 07:13:57','2026-01-27 14:28:05'),
(3,2,0,1,0,'invalid','banci','2026-01-27 15:15:25','2026-01-14 19:54:23','2026-01-27 15:15:27');
/*!40000 ALTER TABLE `validities` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-01-28  6:18:26
