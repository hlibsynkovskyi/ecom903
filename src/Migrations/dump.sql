-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ecom903
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.19.04.1

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
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `values_list` json NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_FA7AEFFB12469DE2` (`category_id`),
  CONSTRAINT `FK_FA7AEFFB12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES (1,2,'Диагональ экрана','[\"9\\\"\", \"10\\\"\", \"11\\\"\", \"13\\\"\", \"14\\\"\", \"15,6\\\"\", \"17\\\"\"]'),(2,2,'Вес','[\"1\", \"1,5\", \"2\", \"2,2\", \"2,7\", \"3\"]');
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_value`
--

DROP TABLE IF EXISTS `attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FE4FBB82B6E62EFA` (`attribute_id`),
  KEY `IDX_FE4FBB824584665A` (`product_id`),
  CONSTRAINT `FK_FE4FBB824584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_FE4FBB82B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_value`
--

LOCK TABLES `attribute_value` WRITE;
/*!40000 ALTER TABLE `attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3AF34668727ACA70` (`parent_id`),
  CONSTRAINT `FK_3AF34668727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Бытовая техника 5454',NULL),(2,'Ноутбуки 2',NULL),(3,'Еще категория',2);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_62809DB01AD5CDBF` (`cart_id`),
  KEY `IDX_62809DB04584665A` (`product_id`),
  CONSTRAINT `FK_62809DB01AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_62809DB04584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,4,'test',24234,1),(2,1,2,'Мышь',10000,1),(3,2,2,'Мышь',10000,11),(4,2,1,'Ноутбук',1500000,7),(5,2,3,'Телевизор',800000,2),(6,2,4,'test',24234,2),(9,4,1,'Ноутбук',1500000,1),(10,4,3,'Телевизор',800000,1),(12,3,2,'Мышь',10000,1),(13,3,1,'Ноутбук',1500000,1),(14,5,1,'Ноутбук',1500000,1),(15,5,3,'Телевизор',800000,1),(16,6,1,'Ноутбук',1500000,1),(17,6,3,'Телевизор',800000,1),(18,7,1,'Ноутбук',1500000,1),(19,7,3,'Телевизор',800000,1),(20,9,3,'Телевизор',800000,1),(21,9,1,'Ноутбук',1500000,1),(22,9,2,'Мышь',10000,1),(23,11,2,'Мышь',10000,1);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordered_at` datetime DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E52FFDEEA76ED395` (`user_id`),
  CONSTRAINT `FK_E52FFDEEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,NULL,34234,2,NULL,NULL,NULL,'',NULL),(2,NULL,12258468,22,NULL,NULL,NULL,'',NULL),(3,NULL,1510000,2,NULL,NULL,NULL,'',NULL),(4,NULL,2300000,2,NULL,NULL,NULL,'',NULL),(5,NULL,2300000,2,1,'Admin','Site','admin@shop.com',NULL),(6,'2019-08-07 20:28:00',2300000,2,1,'Admin','Site','admin@shop.com','вап ывап ывап ывап'),(7,'2019-08-07 21:00:23',2300000,2,1,'Admin','Site','admin@shop.com','dfg dfg dfhgj r fg fhg'),(8,'2019-08-07 21:00:42',0,0,NULL,'Admin','Site','admin@shop.com','dfg dfg dfhgj r fg fhg'),(9,'2019-08-07 21:01:07',2310000,3,1,'Admin','Site','admin@shop.com','sdfg sdfg sdfg'),(10,'2019-08-07 21:01:08',0,0,NULL,'Admin','Site','admin@shop.com','sdfg sdfg sdfg'),(11,'2019-08-07 21:02:07',10000,1,1,'Admin','Site','admin@shop.com','dhhfdhdgh');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8263FFCE4584665A` (`product_id`),
  CONSTRAINT `FK_64617F034584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (5,1,'xiaomi-mi-nb-pro-main.jpg','xiaomi-mi-nb-pro-main.jpg','image/jpeg'),(6,2,'full_msg-867-black_1.jpg','full_msg-867-black_1.jpg','image/jpeg'),(7,3,'morsh-5d2f5ca33bca1857851463.jpeg','morsh.jpeg','image/jpeg');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `is_top` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B3BA5A5A12469DE2` (`category_id`),
  CONSTRAINT `FK_B3BA5A5A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Ноутбук',1500000,'Удобный ноут для работы',1,2),(2,'Мышь',10000,NULL,1,NULL),(3,'Телевизор',800000,NULL,1,NULL),(4,'test',24234,'sdfgsdfg',1,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_checked` tinyint(1) NOT NULL DEFAULT '0',
  `email_check_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@shop.com','[\"ROLE_ADMIN\"]','$argon2i$v=19$m=1024,t=2,p=2$LlVzMDl0UmNZOUFoMHNUVg$H1+/JgY4IQ5tyD9MIxU18uyxb2t5KGqH5EUhaQVdEuc','Admin','Site',NULL,0,NULL),(2,'user@email.com','[]','$argon2i$v=19$m=1024,t=2,p=2$c0puQnJYSUR4c1RVRVVKbw$oSMDtDo/sT0gA5UgfIGJ72GypkWHD8714ZM2Y3vgrZI','test','Tester','address',0,NULL),(3,'user1@email.com','[]','$argon2i$v=19$m=1024,t=2,p=2$T2JkQS9Wa2dlNHB6ZDJPag$HOg0frol1fSODflTkvCDScaelsjvlCbHKqeYBrjeXSw','testte','ghfgh','dgdfg',0,NULL),(4,'user123@email.com','[]','$argon2i$v=19$m=1024,t=2,p=2$emxjam9MN3JueXNsdjVaUg$GWgn8b6w06w4+s1NrbAaTwRPr6IuplrvPUvS8QxHN9k','1','1','1',0,'827f1dd2b6d49569615249862d2139ea'),(5,'user1234@email.com','[]','$argon2i$v=19$m=1024,t=2,p=2$Tk1kWFBld3lNRVhCQjhTUw$QH6669i6K3e8jhKk/6D3j2e7FHbA1koGn3gggPU/vnA','1','1','1',0,'81cc58d08904862cd6a3d562789040ce'),(6,'user12345@email.com','[]','$argon2i$v=19$m=1024,t=2,p=2$NzhaMVRrVXZaMi5pWHMxTg$5rOrXETaIDUTJZ7rp6Euc1U2zv0tP3/5MYxZXkw0ulE','1','1','1',0,'df9a6d2fac7602c75a40602402a9e5df'),(7,'user123456@email.com','[]','$argon2i$v=19$m=1024,t=2,p=2$enhuMS56czdkSllMN3Q1NQ$LEjOIb1Pr5rxbt/L5kWC/VjBRXWHQf0IE/bb/t7oUJI','1','1','1',0,'a3c41b12014e7d23ee70f90a44b14561'),(8,'user7@email.com','[]','$argon2i$v=19$m=1024,t=2,p=2$Mm9qNFBYYlZyUUFpcmRLUw$ybF5zwRTsKSdtSHd16pcqUKJUaCQ+2KR+ehnvlKb+Fs','First','Last','1',1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-26 20:29:57
