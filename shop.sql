-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_account`
--

DROP TABLE IF EXISTS `account_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `level` smallint NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account`
--

LOCK TABLES `account_account` WRITE;
/*!40000 ALTER TABLE `account_account` DISABLE KEYS */;
INSERT INTO `account_account` VALUES (20,'pbkdf2_sha256$600000$VeJVAaCWhAtKAjNxzW6fZb$LBqtiEIkBrM1yxvt12Vx2JrDXM4MNaRTGC7U44kdz2M=',NULL,0,'admin','','','',0,1,'2023-11-13 08:21:28.045441',1,NULL),(21,'pbkdf2_sha256$600000$8GeBErdtybSnpLm0W0Qcsg$7rQT1upo4917moMXnmDSoMVNEJSJGedMMeLZD7KaBGk=',NULL,0,'鏈辨亽鏍?,'','','',0,1,'2023-11-14 15:02:30.974280',1,NULL);
/*!40000 ALTER TABLE `account_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_account_groups`
--

DROP TABLE IF EXISTS `account_account_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_account_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_account_groups_account_id_group_id_33a11f43_uniq` (`account_id`,`group_id`),
  KEY `account_account_groups_group_id_31ca8e7b_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_account_groups_account_id_7aa27e9f_fk_account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `account_account_groups_group_id_31ca8e7b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account_groups`
--

LOCK TABLES `account_account_groups` WRITE;
/*!40000 ALTER TABLE `account_account_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_account_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_account_user_permissions`
--

DROP TABLE IF EXISTS `account_account_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_account_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_account_user_per_account_id_permission_id_fa4fbca7_uniq` (`account_id`,`permission_id`),
  KEY `account_account_user_permission_id_e6a453ba_fk_auth_perm` (`permission_id`),
  CONSTRAINT `account_account_user_account_id_8c2c4a68_fk_account_a` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `account_account_user_permission_id_e6a453ba_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account_user_permissions`
--

LOCK TABLES `account_account_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_account_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_account_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_shop`
--

DROP TABLE IF EXISTS `account_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_shop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `image` varchar(100) NOT NULL,
  `score` smallint NOT NULL,
  `description` longtext NOT NULL DEFAULT (_utf8mb3'1'),
  `account_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_shop_account_id_65ca659b_fk_account_account_id` (`account_id`),
  CONSTRAINT `account_shop_account_id_65ca659b_fk_account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_shop`
--

LOCK TABLES `account_shop` WRITE;
/*!40000 ALTER TABLE `account_shop` DISABLE KEYS */;
INSERT INTO `account_shop` VALUES (1,'鏃ュ父搴楅摵','static/account/images/楝煎垁娴风惔鐑?k鐢佃剳妗岄潰澹佺焊80572.jpg',5,'1',20),(2,'鏃ュ父搴楅摵','static/account/images/Re浠庨浂寮€濮嬬殑寮備笘鐣岀敓娲婚浄濮?k鍔ㄦ极澹佺焊03869.jpg',3,'1',21);
/*!40000 ALTER TABLE `account_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_shopproduct`
--

DROP TABLE IF EXISTS `account_shopproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_shopproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `shop_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_shopproduct_account_id_3a256c05_fk_account_account_id` (`account_id`),
  KEY `account_shopproduct_product_id_9028990f_fk_product_product_id` (`product_id`),
  KEY `account_shopproduct_shop_id_00d7d353_fk_account_shop_id` (`shop_id`),
  CONSTRAINT `account_shopproduct_account_id_3a256c05_fk_account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `account_shopproduct_product_id_9028990f_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `account_shopproduct_shop_id_00d7d353_fk_account_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `account_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_shopproduct`
--

LOCK TABLES `account_shopproduct` WRITE;
/*!40000 ALTER TABLE `account_shopproduct` DISABLE KEYS */;
INSERT INTO `account_shopproduct` VALUES (1,21,1,1),(2,20,2,1);
/*!40000 ALTER TABLE `account_shopproduct` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add wx user',6,'add_wxuser'),(22,'Can change wx user',6,'change_wxuser'),(23,'Can delete wx user',6,'delete_wxuser'),(24,'Can view wx user',6,'view_wxuser'),(25,'Can add user product cart',7,'add_userproductcart'),(26,'Can change user product cart',7,'change_userproductcart'),(27,'Can delete user product cart',7,'delete_userproductcart'),(28,'Can view user product cart',7,'view_userproductcart'),(29,'Can add user order',8,'add_userorder'),(30,'Can change user order',8,'change_userorder'),(31,'Can delete user order',8,'delete_userorder'),(32,'Can view user order',8,'view_userorder'),(33,'Can add user address',9,'add_useraddress'),(34,'Can change user address',9,'change_useraddress'),(35,'Can delete user address',9,'delete_useraddress'),(36,'Can view user address',9,'view_useraddress'),(37,'Can add product',10,'add_product'),(38,'Can change product',10,'change_product'),(39,'Can delete product',10,'delete_product'),(40,'Can view product',10,'view_product'),(41,'Can add type',11,'add_type'),(42,'Can change type',11,'change_type'),(43,'Can delete type',11,'delete_type'),(44,'Can view type',11,'view_type'),(45,'Can add product img',12,'add_productimg'),(46,'Can change product img',12,'change_productimg'),(47,'Can delete product img',12,'delete_productimg'),(48,'Can view product img',12,'view_productimg'),(49,'Can add type classify',13,'add_typeclassify'),(50,'Can change type classify',13,'change_typeclassify'),(51,'Can delete type classify',13,'delete_typeclassify'),(52,'Can view type classify',13,'view_typeclassify'),(53,'Can add user',14,'add_account'),(54,'Can change user',14,'change_account'),(55,'Can delete user',14,'delete_account'),(56,'Can view user',14,'view_account'),(57,'Can add shop product',15,'add_shopproduct'),(58,'Can change shop product',15,'change_shopproduct'),(59,'Can delete shop product',15,'delete_shopproduct'),(60,'Can view shop product',15,'view_shopproduct'),(61,'Can add shop',16,'add_shop'),(62,'Can change shop',16,'change_shop'),(63,'Can delete shop',16,'delete_shop'),(64,'Can view shop',16,'view_shop'),(65,'Can add three type',17,'add_threetype'),(66,'Can change three type',17,'change_threetype'),(67,'Can delete three type',17,'delete_threetype'),(68,'Can view three type',17,'view_threetype'),(69,'Can add one type',13,'add_onetype'),(70,'Can change one type',13,'change_onetype'),(71,'Can delete one type',13,'delete_onetype'),(72,'Can view one type',13,'view_onetype'),(73,'Can add comment image',18,'add_commentimage'),(74,'Can change comment image',18,'change_commentimage'),(75,'Can delete comment image',18,'delete_commentimage'),(76,'Can view comment image',18,'view_commentimage'),(77,'Can add comment',19,'add_comment'),(78,'Can change comment',19,'change_comment'),(79,'Can delete comment',19,'delete_comment'),(80,'Can view comment',19,'view_comment'),(81,'Can add comment upvote',20,'add_commentupvote'),(82,'Can change comment upvote',20,'change_commentupvote'),(83,'Can delete comment upvote',20,'delete_commentupvote'),(84,'Can view comment upvote',20,'view_commentupvote'),(85,'Can add coupon',21,'add_coupon'),(86,'Can change coupon',21,'change_coupon'),(87,'Can delete coupon',21,'delete_coupon'),(88,'Can view coupon',21,'view_coupon'),(89,'Can add index carousel',22,'add_indexcarousel'),(90,'Can change index carousel',22,'change_indexcarousel'),(91,'Can delete index carousel',22,'delete_indexcarousel'),(92,'Can view index carousel',22,'view_indexcarousel'),(93,'Can add index suggest',23,'add_indexsuggest'),(94,'Can change index suggest',23,'change_indexsuggest'),(95,'Can delete index suggest',23,'delete_indexsuggest'),(96,'Can view index suggest',23,'view_indexsuggest'),(97,'Can add index seckill',24,'add_indexseckill'),(98,'Can change index seckill',24,'change_indexseckill'),(99,'Can delete index seckill',24,'delete_indexseckill'),(100,'Can view index seckill',24,'view_indexseckill'),(101,'Can add product property group',25,'add_productpropertygroup'),(102,'Can change product property group',25,'change_productpropertygroup'),(103,'Can delete product property group',25,'delete_productpropertygroup'),(104,'Can view product property group',25,'view_productpropertygroup'),(105,'Can add product property',26,'add_productproperty'),(106,'Can change product property',26,'change_productproperty'),(107,'Can delete product property',26,'delete_productproperty'),(108,'Can view product property',26,'view_productproperty'),(109,'Can add product spec',26,'add_productspec'),(110,'Can change product spec',26,'change_productspec'),(111,'Can delete product spec',26,'delete_productspec'),(112,'Can view product spec',26,'view_productspec'),(113,'Can add product spec group',25,'add_productspecgroup'),(114,'Can change product spec group',25,'change_productspecgroup'),(115,'Can delete product spec group',25,'delete_productspecgroup'),(116,'Can view product spec group',25,'view_productspecgroup');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` longtext NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_product_id_fcb90737_fk_product_product_id` (`product_id`),
  KEY `comment_comment_user_id_6078e57b_fk_User_wxuser_id` (`user_id`),
  CONSTRAINT `comment_comment_product_id_fcb90737_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_User_wxuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_wxuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
INSERT INTO `comment_comment` VALUES (1,'杩欎釜鍟嗗搧闈炲父濂藉悆',1,60),(2,'闈炲父good',2,60);
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_commentimage`
--

DROP TABLE IF EXISTS `comment_commentimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_commentimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `comment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_commentimage_comment_id_669cddea_fk_comment_comment_id` (`comment_id`),
  CONSTRAINT `comment_commentimage_comment_id_669cddea_fk_comment_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_commentimage`
--

LOCK TABLES `comment_commentimage` WRITE;
/*!40000 ALTER TABLE `comment_commentimage` DISABLE KEYS */;
INSERT INTO `comment_commentimage` VALUES (1,'static/comment/images/鍒濋煶鏈潵4k鐢佃剳妗岄潰澹佺焊83821.jpg',1),(2,'static/comment/images/澶滄櫄鍔ㄦ极鎴垮瓙4k楂樻竻澹佺焊71028.jpg',1),(3,'static/comment/images/鍔ㄦ极浜虹墿02楂樻竻鐢佃剳妗岄潰4k澹佺焊74156.jpg',1),(4,'static/comment/images/澶滄櫄鍔ㄦ极鎴垮瓙4k楂樻竻澹佺焊71028_u57Nc06.jpg',2),(5,'static/comment/images/灏戝コ椹熬杈?k鍔ㄦ极澹佺焊24465.jpg',2);
/*!40000 ALTER TABLE `comment_commentimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_commentupvote`
--

DROP TABLE IF EXISTS `comment_commentupvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_commentupvote` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `comment_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_commentupvote_comment_id_2be311ea_fk_comment_comment_id` (`comment_id`),
  KEY `comment_commentupvote_user_id_b7eb4c03_fk_User_wxuser_id` (`user_id`),
  CONSTRAINT `comment_commentupvote_comment_id_2be311ea_fk_comment_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_commentupvote_user_id_b7eb4c03_fk_User_wxuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_wxuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_commentupvote`
--

LOCK TABLES `comment_commentupvote` WRITE;
/*!40000 ALTER TABLE `comment_commentupvote` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_commentupvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_coupon`
--

DROP TABLE IF EXISTS `coupon_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(10,1) NOT NULL,
  `valve` int NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint NOT NULL,
  `count` int NOT NULL,
  `status` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_coupon`
--

LOCK TABLES `coupon_coupon` WRITE;
/*!40000 ALTER TABLE `coupon_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_coupon` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_account_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'account','account'),(16,'account','shop'),(15,'account','shopproduct'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(19,'comment','comment'),(18,'comment','commentimage'),(20,'comment','commentupvote'),(4,'contenttypes','contenttype'),(21,'coupon','coupon'),(22,'index','indexcarousel'),(24,'index','indexseckill'),(23,'index','indexsuggest'),(13,'product','onetype'),(10,'product','product'),(12,'product','productimg'),(26,'product','productspec'),(25,'product','productspecgroup'),(17,'product','threetype'),(11,'product','type'),(5,'sessions','session'),(9,'User','useraddress'),(8,'User','userorder'),(7,'User','userproductcart'),(6,'User','wxuser');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'User','0001_initial','2023-11-06 08:38:02.491443'),(2,'User','0002_userproductcart_userorder_useraddress','2023-11-08 06:36:21.985326'),(4,'contenttypes','0001_initial','2023-11-08 14:52:00.268473'),(5,'contenttypes','0002_remove_content_type_name','2023-11-08 14:52:00.314838'),(6,'auth','0001_initial','2023-11-08 14:52:00.484178'),(7,'auth','0002_alter_permission_name_max_length','2023-11-08 14:52:00.534081'),(8,'auth','0003_alter_user_email_max_length','2023-11-08 14:52:00.540092'),(9,'auth','0004_alter_user_username_opts','2023-11-08 14:52:00.545137'),(10,'auth','0005_alter_user_last_login_null','2023-11-08 14:52:00.551131'),(11,'auth','0006_require_contenttypes_0002','2023-11-08 14:52:00.554129'),(12,'auth','0007_alter_validators_add_error_messages','2023-11-08 14:52:00.558128'),(13,'auth','0008_alter_user_username_max_length','2023-11-08 14:52:00.563215'),(14,'auth','0009_alter_user_last_name_max_length','2023-11-08 14:52:00.568560'),(15,'auth','0010_alter_group_name_max_length','2023-11-08 14:52:00.579605'),(16,'auth','0011_update_proxy_permissions','2023-11-08 14:52:00.586523'),(17,'auth','0012_alter_user_first_name_max_length','2023-11-08 14:52:00.591231'),(18,'account','0001_initial','2023-11-08 14:52:00.916185'),(19,'admin','0001_initial','2023-11-08 14:52:01.026616'),(20,'admin','0002_logentry_remove_auto_add','2023-11-08 14:52:01.034611'),(21,'admin','0003_logentry_add_action_flag_choices','2023-11-08 14:52:01.041612'),(23,'sessions','0001_initial','2023-11-08 14:52:01.089640'),(27,'product','0001_initial','2023-11-09 00:32:19.691209'),(28,'product','0002_remove_product_image_product_image','2023-11-09 00:53:21.206777'),(29,'product','0003_remove_product_image_productimg_product','2023-11-09 01:16:57.657069'),(30,'product','0004_threetype_rename_typeclassify_onetype','2023-11-09 10:14:11.634531'),(31,'User','0003_userorder_product_userproductcart_product_and_more','2023-11-09 10:14:11.725614'),(32,'User','0004_userorder_order_number_alter_userorder_deliver_time_and_more','2023-11-09 10:14:11.887907'),(33,'User','0005_alter_wxuser_avatar_alter_wxuser_openid_and_more','2023-11-09 10:31:45.284392'),(34,'product','0005_delete_onetype_delete_threetype','2023-11-12 14:09:44.704701'),(35,'account','0002_shopproduct_product_shopproduct_shop_and_more','2023-11-12 14:09:44.826667'),(36,'comment','0001_initial','2023-11-12 14:11:09.824708'),(37,'coupon','0001_initial','2023-11-12 14:11:09.836710'),(38,'index','0001_initial','2023-11-12 15:01:27.444164'),(39,'account','0003_shopproduct_account_alter_shop_account_and_more','2023-11-13 14:19:03.860751'),(40,'comment','0002_remove_comment_upvote_alter_comment_product_and_more','2023-11-13 14:52:55.995018'),(41,'User','0006_alter_userorder_status','2023-11-13 16:24:09.917967'),(42,'account','0004_alter_shopproduct_account','2023-11-13 16:24:09.932222'),(43,'coupon','0002_alter_coupon_status','2023-11-13 16:24:09.936200'),(44,'product','0006_alter_product_cover_alter_product_type_and_more','2023-11-13 16:24:09.976960'),(45,'index','0002_alter_indexcarousel_product_and_more','2023-11-13 16:24:10.010912'),(46,'product','0007_product_description_alter_product_cover_and_more','2023-11-14 02:55:52.657718'),(47,'product','0008_alter_productimg_img_url','2023-11-14 12:45:22.826264'),(48,'product','0009_alter_productimg_img_url','2023-11-14 12:49:48.433075'),(49,'account','0005_shop_description','2023-11-14 15:17:26.840681'),(50,'account','0006_alter_account_level','2023-11-14 15:57:18.073730'),(51,'product','0010_alter_productimg_img_url','2023-11-14 15:57:18.082837'),(52,'product','0011_rename_img_url_productimg_image','2023-11-14 15:57:18.103212'),(53,'product','0012_productproperty_property_name','2023-11-15 04:57:47.534752'),(54,'account','0007_rename_img_url_shop_image','2023-11-15 05:10:14.912175'),(55,'product','0013_productpropertygroup_group_image','2023-11-15 09:33:08.747129'),(56,'product','0014_rename_productproperty_productspec_and_more','2023-11-15 13:53:24.068057'),(57,'account','0008_account_avatar_alter_shop_image','2023-11-15 14:10:11.578513'),(58,'product','0015_alter_product_cover_and_more','2023-11-15 14:10:11.590313'),(59,'account','0009_remove_shop_account_remove_shopproduct_account_and_more','2023-11-16 00:18:47.886754'),(60,'account','0010_rename_account_id_shop_account_and_more','2023-11-16 00:25:02.962666'),(61,'product','0016_alter_product_type_alter_productimg_product_and_more','2023-11-16 00:33:36.352459'),(62,'User','0007_alter_useraddress_user_alter_userorder_product_and_more','2023-11-16 00:33:37.772611'),(63,'comment','0003_alter_comment_product_alter_comment_user_and_more','2023-11-16 00:33:38.929626');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_indexcarousel`
--

DROP TABLE IF EXISTS `index_indexcarousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_indexcarousel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_indexcarousel_product_id_cbe694b2_fk_product_product_id` (`product_id`),
  CONSTRAINT `index_indexcarousel_product_id_cbe694b2_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_indexcarousel`
--

LOCK TABLES `index_indexcarousel` WRITE;
/*!40000 ALTER TABLE `index_indexcarousel` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_indexcarousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_indexseckill`
--

DROP TABLE IF EXISTS `index_indexseckill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_indexseckill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_indexseckill_product_id_e4ae7bf9_fk_product_product_id` (`product_id`),
  CONSTRAINT `index_indexseckill_product_id_e4ae7bf9_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_indexseckill`
--

LOCK TABLES `index_indexseckill` WRITE;
/*!40000 ALTER TABLE `index_indexseckill` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_indexseckill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_indexsuggest`
--

DROP TABLE IF EXISTS `index_indexsuggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_indexsuggest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_indexsuggest_product_id_8e116530_fk_product_product_id` (`product_id`),
  CONSTRAINT `index_indexsuggest_product_id_8e116530_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_indexsuggest`
--

LOCK TABLES `index_indexsuggest` WRITE;
/*!40000 ALTER TABLE `index_indexsuggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_indexsuggest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product`
--

DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `cover` varchar(100) NOT NULL,
  `type_id` bigint DEFAULT NULL,
  `description` longtext NOT NULL DEFAULT (_utf8mb3'1'),
  PRIMARY KEY (`id`),
  KEY `product_product_type_id_db92a7b7_fk_product_type_id` (`type_id`),
  CONSTRAINT `product_product_type_id_db92a7b7_fk_product_type_id` FOREIGN KEY (`type_id`) REFERENCES `product_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (1,'杩欏彧鏄竴涓晢鍝?,9.99,'static/product/images/Re浠庨浂寮€濮嬬殑寮備笘鐣岀敓娲婚浄濮?k鐢佃剳妗岄潰澹佺焊74731_bScHoFk.jpg',2,'1'),(2,'杩欏彧鏄竴涓晢鍝?,9.99,'static/product/images/Re浠庨浂寮€濮嬬殑寮備笘鐣岀敓娲婚浄濮?k鐢佃剳妗岄潰澹佺焊74731_FWWGVfb.jpg',2,'1'),(3,'杩欏彧鏄竴涓晢鍝?,9.99,'static/product/images/Re浠庨浂寮€濮嬬殑寮備笘鐣岀敓娲婚浄濮?k鐢佃剳妗岄潰澹佺焊74731_sodkAzg.jpg',2,'1'),(4,'杩欏彧鏄竴涓晢鍝?,9.99,'static/product/images/Re浠庨浂寮€濮嬬殑寮備笘鐣岀敓娲婚浄濮?k鐢佃剳妗岄潰澹佺焊74731_Ve3KS37.jpg',2,'1');
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_productimg`
--

DROP TABLE IF EXISTS `product_productimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_productimg` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `img_type` smallint NOT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_productimg_product_id_be4aaa8a_fk_product_product_id` (`product_id`),
  CONSTRAINT `product_productimg_product_id_be4aaa8a_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productimg`
--

LOCK TABLES `product_productimg` WRITE;
/*!40000 ALTER TABLE `product_productimg` DISABLE KEYS */;
INSERT INTO `product_productimg` VALUES (1,'static/product/images/DARLING_in_the_FRANXX02鍔ㄦ极澹佺焊52076_kg4B1bM.jpg',1,1),(2,'static/product/images/Fate榛戣礊寰烽珮娓呯數鑴戞闈㈠绾?0431.jpg',1,1),(3,'static/product/images/涓滀含椋熷案楝奸噾鏈ㄧ爺楂樻竻鍔ㄦ极5k甯﹂奔灞忓绾?4998.jpg',1,3),(4,'static/product/images/DARLING_in_the_FRANXX02鍔ㄦ极澹佺焊52076_o0gDWbg.jpg',0,3),(5,'static/product/169996600850daeee4-67ca-4e32-aa65-585cad7e6c5f',1,1),(6,'static/product/1699966170===8bda3b12-87c4-4e1e-b654-1c25f5a3fecd.jpg/鍔ㄦ极浣犵殑鍚嶅瓧绔嬭姳娉峰姘翠笁鍙舵闈㈠绾?5177.jpg',1,1),(7,'static/product/鍔ㄦ极浣犵殑鍚嶅瓧绔嬭姳娉峰姘翠笁鍙舵闈㈠绾?5177.jpg',1,1);
/*!40000 ALTER TABLE `product_productimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_productspec`
--

DROP TABLE IF EXISTS `product_productspec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_productspec` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `property` varchar(225) NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `property_name` varchar(225) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_productspec_product_id_929bc0d8_fk_product_product_id` (`product_id`),
  CONSTRAINT `product_productspec_product_id_929bc0d8_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productspec`
--

LOCK TABLES `product_productspec` WRITE;
/*!40000 ALTER TABLE `product_productspec` DISABLE KEYS */;
INSERT INTO `product_productspec` VALUES (1,'鍐呭瓨',1,'128G|256G'),(2,'棰滆壊',1,'榛戣壊|鐧借壊');
/*!40000 ALTER TABLE `product_productspec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_productspecgroup`
--

DROP TABLE IF EXISTS `product_productspecgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_productspecgroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group` varchar(225) NOT NULL,
  `group_price` decimal(10,2) NOT NULL,
  `group_sales` int NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `group_image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_productspecg_product_id_2106bef3_fk_product_p` (`product_id`),
  CONSTRAINT `product_productspecg_product_id_2106bef3_fk_product_p` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productspecgroup`
--

LOCK TABLES `product_productspecgroup` WRITE;
/*!40000 ALTER TABLE `product_productspecgroup` DISABLE KEYS */;
INSERT INTO `product_productspecgroup` VALUES (1,'128G|榛戣壊|8G',5000.00,20,1,'1'),(2,'128G|鐧借壊|12G',3000.00,12,1,'null');
/*!40000 ALTER TABLE `product_productspecgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `className` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,'鐢疯'),(2,'濂宠');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_useraddress`
--

DROP TABLE IF EXISTS `user_useraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_useraddress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver` varchar(32) NOT NULL,
  `address` varchar(225) NOT NULL,
  `cellphone` varchar(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `User_useraddress_user_id_a36664d0_fk_User_wxuser_id` (`user_id`),
  CONSTRAINT `User_useraddress_user_id_a36664d0_fk_User_wxuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_wxuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_useraddress`
--

LOCK TABLES `user_useraddress` WRITE;
/*!40000 ALTER TABLE `user_useraddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userorder`
--

DROP TABLE IF EXISTS `user_userorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_userorder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` smallint NOT NULL,
  `order_time` bigint DEFAULT NULL,
  `pay_time` bigint DEFAULT NULL,
  `deliver_time` bigint DEFAULT NULL,
  `received_time` bigint DEFAULT NULL,
  `postage` decimal(10,2) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `order_number` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_userorder_product_id_5775dfee_fk_product_product_id` (`product_id`),
  KEY `User_userorder_user_id_9e7a5563_fk_User_wxuser_id` (`user_id`),
  CONSTRAINT `User_userorder_product_id_5775dfee_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `User_userorder_user_id_9e7a5563_fk_User_wxuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_wxuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userorder`
--

LOCK TABLES `user_userorder` WRITE;
/*!40000 ALTER TABLE `user_userorder` DISABLE KEYS */;
INSERT INTO `user_userorder` VALUES (2,1,NULL,NULL,NULL,NULL,9.90,60,1,1699544019),(3,3,NULL,NULL,NULL,NULL,900.00,60,1,1699605721),(4,3,NULL,NULL,NULL,NULL,900.00,60,1,1699776573);
/*!40000 ALTER TABLE `user_userorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userproductcart`
--

DROP TABLE IF EXISTS `user_userproductcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_userproductcart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `User_userproductcart_product_id_e59c3cca_fk_product_product_id` (`product_id`),
  KEY `User_userproductcart_user_id_84965efa_fk_User_wxuser_id` (`user_id`),
  CONSTRAINT `User_userproductcart_product_id_e59c3cca_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `User_userproductcart_user_id_84965efa_fk_User_wxuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_wxuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userproductcart`
--

LOCK TABLES `user_userproductcart` WRITE;
/*!40000 ALTER TABLE `user_userproductcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userproductcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wxuser`
--

DROP TABLE IF EXISTS `user_wxuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_wxuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(225) NOT NULL,
  `openId` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wxuser`
--

LOCK TABLES `user_wxuser` WRITE;
/*!40000 ALTER TABLE `user_wxuser` DISABLE KEYS */;
INSERT INTO `user_wxuser` VALUES (60,'GGB','qwewqeqwrweqrewqrwe','static/User/images/鏇磋。浜哄伓鍧犲叆鐖辨渤鍠滃宸濇捣姊?k鐢佃剳妗岄潰澹佺焊37115.jpg'),(61,'GGB','qwewqeqwrweqrewqrwe','static/User/images/鏇磋。浜哄伓鍧犲叆鐖辨渤鍠滃宸濇捣姊?k鐢佃剳妗岄潰澹佺焊37115_mBf7Hb9.jpg'),(62,'GGB','qwewqeqwrweqrewqrwe','static/User/images/鏇磋。浜哄伓鍧犲叆鐖辨渤鍠滃宸濇捣姊?k鐢佃剳妗岄潰澹佺焊37115_4nI7GOK.jpg'),(63,'GGB','qwewqeqwrweqrewqrwe','static/User/images/鏇磋。浜哄伓鍧犲叆鐖辨渤鍠滃宸濇捣姊?k鐢佃剳妗岄潰澹佺焊37115_a8oPAO0.jpg'),(64,'GGB','qwewqeqwrweqrewqrwe','static/User/images/鏇磋。浜哄伓鍧犲叆鐖辨渤鍠滃宸濇捣姊?k鐢佃剳妗岄潰澹佺焊37115_8hk4Pd8.jpg'),(65,'GGB','qwewqeqwrweqrewqrwe','static/User/images/鏇磋。浜哄伓鍧犲叆鐖辨渤鍠滃宸濇捣姊?k鐢佃剳妗岄潰澹佺焊37115_7K3FvJP.jpg');
/*!40000 ALTER TABLE `user_wxuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-16 10:52:06
