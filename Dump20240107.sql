CREATE DATABASE  IF NOT EXISTS `tanda_1_1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tanda_1_1`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tanda_1_1
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user track',7,'add_usertrack'),(26,'Can change user track',7,'change_usertrack'),(27,'Can delete user track',7,'delete_usertrack'),(28,'Can view user track',7,'view_usertrack'),(29,'Can add track',8,'add_track'),(30,'Can change track',8,'change_track'),(31,'Can delete track',8,'delete_track'),(32,'Can view track',8,'view_track'),(33,'Can add room track',9,'add_roomtrack'),(34,'Can change room track',9,'change_roomtrack'),(35,'Can delete room track',9,'delete_roomtrack'),(36,'Can view room track',9,'view_roomtrack'),(37,'Can add room',10,'add_room'),(38,'Can change room',10,'change_room'),(39,'Can delete room',10,'delete_room'),(40,'Can view room',10,'view_room');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$WCkPDXgzrUWVsN9ftWP0q8$uT2iuUOBFtqLkaUcMLowFiu8XMItGpMbY9BdU4wcVqI=','2024-01-03 09:40:08.093436',1,'tanda_boss','','','',1,1,'2024-01-03 09:39:26.312207'),(2,'pbkdf2_sha256$720000$McAlnXuC2yF6Sl06tkCYt7$YUJwS8EDqMO1bRApXslSH4YXYZ897KJFPo92o8AxmYA=','2024-01-05 07:10:58.904757',1,'theadmin','','','',1,1,'2024-01-04 09:07:24.376962');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'player','room'),(9,'player','roomtrack'),(8,'search','track'),(7,'search','usertrack'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-03 09:37:18.199176'),(2,'auth','0001_initial','2024-01-03 09:37:19.001390'),(3,'admin','0001_initial','2024-01-03 09:37:19.267381'),(4,'admin','0002_logentry_remove_auto_add','2024-01-03 09:37:19.289820'),(5,'admin','0003_logentry_add_action_flag_choices','2024-01-03 09:37:19.310816'),(6,'contenttypes','0002_remove_content_type_name','2024-01-03 09:37:19.485802'),(7,'auth','0002_alter_permission_name_max_length','2024-01-03 09:37:19.600781'),(8,'auth','0003_alter_user_email_max_length','2024-01-03 09:37:19.671781'),(9,'auth','0004_alter_user_username_opts','2024-01-03 09:37:19.693768'),(10,'auth','0005_alter_user_last_login_null','2024-01-03 09:37:19.790776'),(11,'auth','0006_require_contenttypes_0002','2024-01-03 09:37:19.794773'),(12,'auth','0007_alter_validators_add_error_messages','2024-01-03 09:37:19.804900'),(13,'auth','0008_alter_user_username_max_length','2024-01-03 09:37:19.924912'),(14,'auth','0009_alter_user_last_name_max_length','2024-01-03 09:37:20.050915'),(15,'auth','0010_alter_group_name_max_length','2024-01-03 09:37:20.100138'),(16,'auth','0011_update_proxy_permissions','2024-01-03 09:37:20.120110'),(17,'auth','0012_alter_user_first_name_max_length','2024-01-03 09:37:20.255313'),(18,'sessions','0001_initial','2024-01-03 09:37:20.326789'),(19,'search','0001_initial','2024-01-05 07:34:18.429351'),(20,'player','0001_initial','2024-01-06 11:29:03.215282');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1364n8g8rj6gzgz29pioig7pbmrg9du9','.eJxVjDsOwjAQBe_iGll4HfyhpOcM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uzAnX43QjzQ9oG-I7tNuk8tWUeSW-K3mnX14nledndv4OKvX5rKkBQjjaKlyFAyCBchL0Yw94JoiWR4MBG6yBTsViQzImGmI3JzOr9ARGDOUs:1rLeM6:FSRwIHMzu0WYPZwmRRSBG9RwNcWzrkud46mUqMJxYMY','2024-01-19 07:10:58.920810'),('jtc4zbkdq8gmoujx1qjsu5zmxc9d6535','.eJxVjDsOwjAQBe_iGll4HfyhpOcM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uzAnX43QjzQ9oG-I7tNuk8tWUeSW-K3mnX14nledndv4OKvX5rKkBQjjaKlyFAyCBchL0Yw94JoiWR4MBG6yBTsViQzImGmI3JzOr9ARGDOUs:1rLKGS:dWKuhJGchIboDAwncXNcAPLV2NGxZNkzbaSF4tNIEcg','2024-01-18 09:43:48.345555');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_room`
--

DROP TABLE IF EXISTS `player_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `player_room_user_id_9b57b449_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_room`
--

LOCK TABLES `player_room` WRITE;
/*!40000 ALTER TABLE `player_room` DISABLE KEYS */;
INSERT INTO `player_room` VALUES (1,2);
/*!40000 ALTER TABLE `player_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_roomtrack`
--

DROP TABLE IF EXISTS `player_roomtrack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_roomtrack` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_playing` tinyint(1) NOT NULL,
  `vote` int NOT NULL,
  `room_id` bigint NOT NULL,
  `track_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_roomtrack_room_id_e1d89d99_fk_player_room_id` (`room_id`),
  KEY `player_roomtrack_track_id_215c267f_fk_search_track_id` (`track_id`),
  CONSTRAINT `player_roomtrack_room_id_e1d89d99_fk_player_room_id` FOREIGN KEY (`room_id`) REFERENCES `player_room` (`id`),
  CONSTRAINT `player_roomtrack_track_id_215c267f_fk_search_track_id` FOREIGN KEY (`track_id`) REFERENCES `search_track` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_roomtrack`
--

LOCK TABLES `player_roomtrack` WRITE;
/*!40000 ALTER TABLE `player_roomtrack` DISABLE KEYS */;
INSERT INTO `player_roomtrack` VALUES (404,0,0,1,16),(405,1,0,1,13),(406,0,0,1,34),(407,0,0,1,1),(408,0,0,1,2),(409,0,0,1,23),(410,0,0,1,19);
/*!40000 ALTER TABLE `player_roomtrack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_track`
--

DROP TABLE IF EXISTS `search_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_track` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `track_id` varchar(255) NOT NULL,
  `track_name` varchar(255) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `coverArt` varchar(255) NOT NULL,
  `duration` int NOT NULL,
  `playability` tinyint(1) NOT NULL,
  `preview_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_track`
--

LOCK TABLES `search_track` WRITE;
/*!40000 ALTER TABLE `search_track` DISABLE KEYS */;
INSERT INTO `search_track` VALUES (1,'4EWCNWgDS8707fNSZ1oaA5','Heartless','[{\'name\': \'Kanye West\'}]','https://i.scdn.co/image/ab67616d00001e02346d77e155d854735410ed18',211000,1,'https://p.scdn.co/mp3-preview/920b09535e94d18179265783aeb8b3ccb2495977?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(2,'1JhGcvVRdJoteIf56GkGwf','Princesa','[{\'name\': \'Grupo Marca Registrada\'}]','https://i.scdn.co/image/ab67616d00001e02ee5c88fd3f52fefe04615485',151486,1,'https://p.scdn.co/mp3-preview/e0288d41212f9a1c1fa4c6627e0338ad83aa2668?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(3,'6DCZcSspjsKoFjzjrWoCdn','God\'s Plan','[{\'name\': \'Drake\'}]','https://i.scdn.co/image/ab67616d00001e02f907de96b9a4fbc04accc0d5',198973,1,'https://p.scdn.co/mp3-preview/a90a7912992fdfd494c99027c31eb9002b592ed3?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(4,'3F5CgOj3wFlRv51JsHbxhe','Jimmy Cooks (feat. 21 Savage)','[{\'name\': \'Drake\'}, {\'name\': \'21 Savage\'}]','https://i.scdn.co/image/ab67616d00001e028dc0d801766a5aa6a33cbe37',218364,1,'https://p.scdn.co/mp3-preview/0859116d6b69da68199ee5d8153bf9e33771267c?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(5,'3RmJZRbK81v6NgJsTomiLr','Dude','[{\'name\': \'Eddie Zuko\'}]','https://i.scdn.co/image/ab67616d00001e02e985e14d593d91136bde2436',129032,1,'https://p.scdn.co/mp3-preview/4485a9416719d391cc46bae1117f0d01e07ba45b?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(6,'6gQUbFwwdYXlKdmqRoWKJe','Dude (Looks Like A Lady)','[{\'name\': \'Aerosmith\'}]','https://i.scdn.co/image/ab67616d00001e02a8a965df6a845b265ee19106',265773,1,'https://p.scdn.co/mp3-preview/7057ad9c5de1d636a154ed03e8d4b840e9bafc56?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(7,'7LRMbd3LEoV5wZJvXT1Lwb','T.N.T.','[{\'name\': \'AC/DC\'}]','https://i.scdn.co/image/ab67616d00001e02286a0837ff3424065a735e0a',214666,1,'https://p.scdn.co/mp3-preview/b057af7c776de98ed5aa2a73bd3f5b9e6c84459d?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(8,'0LAcM6I7ijW4VVW0aytl1t','One (Remastered)','[{\'name\': \'Metallica\'}]','https://i.scdn.co/image/ab67616d00001e02be54746b374358970b5e617a',446145,1,'https://p.scdn.co/mp3-preview/6e6f8324c485631dcfe1d23c664c1057428dcc6a?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(9,'285pBltuF7vW8TeWk8hdRR','Lucid Dreams','[{\'name\': \'Juice WRLD\'}]','https://i.scdn.co/image/ab67616d00001e02f7db43292a6a99b21b51d5b4',239835,1,'https://p.scdn.co/mp3-preview/85ba40ef782e993bac9ee1c945f90c123b11ffec?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(10,'3T06rGO2dVEntMvym0vpQu','Empty','[{\'name\': \'Juice WRLD\'}]','https://i.scdn.co/image/ab67616d00001e028b27d35aa2c6dcf99895d664',248431,1,'https://p.scdn.co/mp3-preview/804cea05a488e04a89cb445299a1f55a8578ed44?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(11,'5TXDeTFVRVY7Cvt0Dw4vWW','Revenge','[{\'name\': \'XXXTENTACION\'}]','https://i.scdn.co/image/ab67616d00001e02203c89bd4391468eea4cc3f5',120026,1,'https://p.scdn.co/mp3-preview/8f5fe8bb510463b2da20325c8600200bf2984d83?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(12,'2ZRo7axmMPeSVUvDbGkJah','Hope','[{\'name\': \'XXXTENTACION\'}]','https://i.scdn.co/image/ab67616d00001e02806c160566580d6335d1f16c',110886,1,'https://p.scdn.co/mp3-preview/c4ef442e8854f5861e38967f01408e3cba9e1a7a?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(13,'4xhsWYTOGcal8zt0J161CU','Lovin On Me','[{\'name\': \'Jack Harlow\'}]','https://i.scdn.co/image/ab67616d00001e02fcf4adae77baba5d0169e8e8',138411,1,'https://p.scdn.co/mp3-preview/eeeb6151d0049367b3ad3db0389e9e3b116c0774?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(14,'1a73gcEg6h6Re6hHXoVltJ','FTCU','[{\'name\': \'Nicki Minaj\'}]','https://i.scdn.co/image/ab67616d00001e02651e1dbc0b5218f2306181a1',172137,1,'https://p.scdn.co/mp3-preview/c7bb59bb3ff6d3989868d7b43becb4bd22fd2a75?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(15,'4rXLjWdF2ZZpXCVTfWcshS','fukumean','[{\'name\': \'Gunna\'}]','https://i.scdn.co/image/ab67616d00001e02017d5e26552345c4b1575b6c',125040,1,'https://p.scdn.co/mp3-preview/f237ab921af697ba9b49e12fa167c2ce1a82d6b4?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(16,'4KULAymBBJcPRpk1yO4dOG','I Remember Everything (feat. Kacey Musgraves)','[{\'name\': \'Zach Bryan\'}, {\'name\': \'Kacey Musgraves\'}]','https://i.scdn.co/image/ab67616d00001e02e5a25ed08d1e7e0fbb440cef',227195,1,'https://p.scdn.co/mp3-preview/22b240f7ef2eff38bd12fb0c94dfea5e1d70e20a?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(17,'5BbdKBZO0TH0GhfxUfyhL9','Freestyle','[{\'name\': \'Lil Baby\'}]','https://i.scdn.co/image/ab67616d00001e025067cc9332e2fdc69ea7b7a9',162053,1,'https://p.scdn.co/mp3-preview/e3f686c55f7e5e9a08013dd6b52f1d542e628b49?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(18,'0mflMxspEfB0VbI1kyLiAv','Stick Season','[{\'name\': \'Noah Kahan\'}]','https://i.scdn.co/image/ab67616d00001e026ee35072df1af802cca09918',182346,1,'https://p.scdn.co/mp3-preview/0495eca339f32d0acaa62ca9be55d2b815ccc4e3?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(19,'2YSzYUF3jWqb9YP9VXmpjE','IDGAF (feat. Yeat)','[{\'name\': \'Drake\'}, {\'name\': \'Yeat\'}]','https://i.scdn.co/image/ab67616d00001e027d384516b23347e92a587ed1',260111,1,'https://p.scdn.co/mp3-preview/c23e9088d5bbab9edfb8e6c37af8e8eee0016e39?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(20,'5f4Hy5mw5SRaUgXX9c6P5S','Sum 2 Prove','[{\'name\': \'Lil Baby\'}]','https://i.scdn.co/image/ab67616d00001e02f46a9ad551acbdab8f72fd89',205760,1,'https://p.scdn.co/mp3-preview/c084bf3405f83b50eb487fcee9bee869181d4a6c?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(21,'5XVdHRf4CAJ2Jm0uMIy5qY','La Víctima','[{\'name\': \'Xavi\'}]','https://i.scdn.co/image/ab67616d00001e020e8dc9720dd03d86627fa54b',156345,1,'https://p.scdn.co/mp3-preview/9e30f31b8bbd2d11c42bf193403103ddabecb16f?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(22,'4MjDJD8cW7iVeWInc2Bdyj','MONACO','[{\'name\': \'Bad Bunny\'}]','https://i.scdn.co/image/ab67616d00001e027b1fc51ff3257b5286a1ecec',267194,1,'https://p.scdn.co/mp3-preview/f80c7cc394457fc77cd6668a715b039fd86404f9?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(23,'5yY9lUy8nbvjM1Uyo1Uqoc','Life Is Good (feat. Drake)','[{\'name\': \'Future\'}, {\'name\': \'Drake\'}]','https://i.scdn.co/image/ab67616d00001e028a01c7b77a34378a62f46402',237735,1,'https://p.scdn.co/mp3-preview/f7e8ac5cc4f6b702718ac3e2e280e270ac16facc?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(24,'6CvTEtGagmzQvkUzzyKR9k','HARLEY QUINN','[{\'name\': \'Fuerza Regida\'}, {\'name\': \'Marshmello\'}]','https://i.scdn.co/image/ab67616d00001e02ad57982065339f7dc2058efe',143327,1,'https://p.scdn.co/mp3-preview/2845f30873601167f8970f2d64f53cda26441b7a?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(25,'30LZU3ReFIndjHLfaahreM','Save Me (with Lainey Wilson)','[{\'name\': \'Jelly Roll\'}]','https://i.scdn.co/image/ab67616d00001e02026adcf853fad0af470a9fbb',237493,1,'https://p.scdn.co/mp3-preview/d21ceef23c1830d5cfb948f9ff7de8e898f15f56?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(26,'2BcMwX1MPV6ZHP4tUT9uq6','Knife Talk (with 21 Savage ft. Project Pat)','[{\'name\': \'Drake\'}, {\'name\': \'21 Savage\'}, {\'name\': \'Project Pat\'}]','https://i.scdn.co/image/ab67616d00001e02cd945b4e3de57edd28481a3f',242965,1,'https://p.scdn.co/mp3-preview/85d634aaeb6d71c27f5e83bb713fa5c57eb393c9?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(27,'34oWbFBfGEElvgO0a5c9V4','No Flockin\'','[{\'name\': \'Kodak Black\'}]','https://i.scdn.co/image/ab67616d00001e0218f77961dfb9d67895bd9ddb',165290,1,'https://p.scdn.co/mp3-preview/cce2da7f051dc07a53b988234a0388cd1377fd40?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(28,'1dGr1c8CrMLDpV6mPbImSI','Lover','[{\'name\': \'Taylor Swift\'}]','https://i.scdn.co/image/ab67616d00001e02e787cffec20aa2a396a61647',221306,1,'https://p.scdn.co/mp3-preview/aad996e106de5278d8387dc838e8f08105dcd588?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(29,'7MSWxMumjz6lHj7oRApNbg','White Horse','[{\'name\': \'Chris Stapleton\'}]','https://i.scdn.co/image/ab67616d00001e024676b161854d2215819f0d32',267893,1,'https://p.scdn.co/mp3-preview/aa7d59c7b2dac00975557a592d0f01419cc18401?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(30,'6Jv7kjGkhY2fT4yuBF3aTz','Lover, You Should\'ve Come Over','[{\'name\': \'Jeff Buckley\'}]','https://i.scdn.co/image/ab67616d00001e026a760642a56847027428cb61',404213,1,'https://p.scdn.co/mp3-preview/a846c60d4880f6b3901df7c7b3f6d156f4807f8c?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(31,'1ucnuV88gFTfR3BalmznDk','Lover Is a Day','[{\'name\': \'Cuco\'}]','https://i.scdn.co/image/ab67616d00001e02b1c091e32aad5310ebbdd558',456000,1,'https://p.scdn.co/mp3-preview/fbef3cdacb1636624f4a3bbc2050b008414dd1d7?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(32,'0qXP5fMhxGzxALOkXYUxfP','Loverboy','[{\'name\': \'A-Wall\'}]','https://i.scdn.co/image/ab67616d00001e02642f3d8e8208bd784d377b0d',224520,1,'https://p.scdn.co/mp3-preview/31722612c1d7563f1d24f4b242982553f49582e8?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(33,'41PWz0hAiU9FqsmjR9Wh62','Lovers And Friends','[{\'name\': \'Lil Jon & The East Side Boyz\'}, {\'name\': \'USHER\'}, {\'name\': \'Ludacris\'}]','https://i.scdn.co/image/ab67616d00001e024ab521cf16202a5bc5f72cfe',260600,1,'https://p.scdn.co/mp3-preview/02770b9d1930f1f8bd22b20b2fd65857a8b04dd3?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(34,'6dBUzqjtbnIa1TwYbyw5CM','Lovers Rock','[{\'name\': \'TV Girl\'}]','https://i.scdn.co/image/ab67616d00001e02e1bc1af856b42dd7fdba9f84',213920,1,'https://p.scdn.co/mp3-preview/922a42db5aa8f8d335725697b7d7a12af6808f3a?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(35,'4C39qLcJ2WZEdkXTiDC6qd','(No More) Paddy\'s Lament','[{\'name\': \'Flogging Molly\'}]','https://i.scdn.co/image/ab67616d00001e025e13f2676afb8c481d8fae1d',204680,1,'https://p.scdn.co/mp3-preview/dc5de6175648b7f9c87ee7acf4ea16ab1acc9bb5?cid=d8a5ed958d274c2e8ee717e6a4b0971d'),(36,'2L8cFPItBljPNJgPjTnuIf','No Flex Zone','[{\'name\': \'Rae Sremmurd\'}]','https://i.scdn.co/image/ab67616d00001e024ca3fb4517ff722918877460',231066,1,'https://p.scdn.co/mp3-preview/56c77039ece177e40301a3286074e1c149c5a854?cid=d8a5ed958d274c2e8ee717e6a4b0971d');
/*!40000 ALTER TABLE `search_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_usertrack`
--

DROP TABLE IF EXISTS `search_usertrack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_usertrack` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `track_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `search_usertrack_track_id_7daf6f90_fk_search_track_id` (`track_id`),
  KEY `search_usertrack_user_id_53990480_fk_auth_user_id` (`user_id`),
  CONSTRAINT `search_usertrack_track_id_7daf6f90_fk_search_track_id` FOREIGN KEY (`track_id`) REFERENCES `search_track` (`id`),
  CONSTRAINT `search_usertrack_user_id_53990480_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_usertrack`
--

LOCK TABLES `search_usertrack` WRITE;
/*!40000 ALTER TABLE `search_usertrack` DISABLE KEYS */;
INSERT INTO `search_usertrack` VALUES (1,1,2),(2,2,2),(3,3,2),(4,4,2),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(9,9,2),(10,10,2),(11,11,2),(12,12,2),(13,13,2),(14,14,2),(15,15,2),(16,16,2),(17,17,2),(18,18,2),(19,19,2),(20,20,2),(21,21,2),(22,22,2),(23,23,2),(24,24,2),(25,25,2),(26,26,2),(27,27,2),(28,28,2),(29,29,2),(30,30,2),(31,31,2),(32,32,2),(33,33,2),(34,34,2),(35,35,2),(36,36,2);
/*!40000 ALTER TABLE `search_usertrack` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-07 23:07:28
