-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'random_secret_token','7f1c7392c7b1cce2841a698c64f33ae915044208d9d216c294b5c754c22d2bee','[\"*\"]','2024-01-02 18:37:36',NULL,'2024-01-01 12:22:58','2024-01-02 18:37:36'),(2,'App\\Models\\User',1,'random_secret_token','5bc2e14bb686d7db93a55a41919e1bab0491ebb1a42b8111f33e378b2438946e','[\"*\"]',NULL,NULL,'2024-01-01 13:43:25','2024-01-01 13:43:25'),(3,'App\\Models\\User',1,'random_secret_token','595fb8d86c26e56aa47e91618a6d2e961fed6097edae87f1ab081aec40cb8f0f','[\"*\"]',NULL,NULL,'2024-01-01 13:47:55','2024-01-01 13:47:55');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jamil Gerlach','admin@admin.com','2023-12-31 17:26:11','$2y$12$RvfmcqPk/644OFyFzIhpge8iXaiQFbjMliuCW9g0HeLg/lozjeCyS','AoFPdycbA6','2023-12-31 17:26:13','2023-12-31 17:26:13'),(2,'Lexi Bashirian','gennaro80@example.org','2024-01-01 13:51:58','$2y$04$ndUSjweUxDmGfZrl4WZVMuSpszdAUKBkqFatHA8BBijuN0/TLBzKK','iW4fAKZwci','2024-01-01 13:51:58','2024-01-01 13:51:58'),(3,'Marcellus Kemmer','asha54@example.net','2024-01-01 13:52:24','$2y$04$putd97Qf/NNb8tnD1oawfOlQAN8AC7tgn.IYlPe3eoVU1IIr8IvdK','n5HGuRSVqr','2024-01-01 13:52:24','2024-01-01 13:52:24'),(4,'Lura Franecki','clement.cassin@example.net','2024-01-01 13:52:38','$2y$04$rak64IhuwMfj1x4GTc4koeEAldKls10gxDnxELFVi3x0D36Ix5X0K','XAMvy9vzJl','2024-01-01 13:52:39','2024-01-01 13:52:39'),(5,'Casandra Kerluke','emmet11@example.com','2024-01-01 13:53:04','$2y$04$n4T1OnMxvXFk2m/O7W1DM.fUElnmiH.ipc.FT0ZZwRE90ljPw1vRa','ypkG94jict','2024-01-01 13:53:04','2024-01-01 13:53:04'),(6,'Miss Rubye Brakus','jesus.walter@example.org','2024-01-01 13:53:12','$2y$04$HCBCIgNGdTxsu1pUY/pvE..6gEB3Mbh17dJo8mEnlx1ISHX4W0Jt2','cN4cVaDcWt','2024-01-01 13:53:13','2024-01-01 13:53:13'),(7,'Maryse Haag','zboncak.julio@example.net','2024-01-01 13:56:58','$2y$04$bd6zfXceMIJvbuEIl14XOeie3sn2l/AhT4ABCqod58BUdZt/3LYHi','5a6nqvRH9z','2024-01-01 13:56:58','2024-01-01 13:56:58'),(8,'Mrs. Rita Schamberger DVM','nader.bethany@example.com','2024-01-01 13:57:28','$2y$04$3ufY2.IJAQXmKfEZFBMLd.uyuDntucNiCKr1rxPxXalEs925i8bmi','IldOzQepdK','2024-01-01 13:57:28','2024-01-01 13:57:28'),(9,'Gayle Reinger','general.conroy@example.org','2024-01-01 13:57:57','$2y$04$K5RwFg7fvpPv7NB.KGMsq.5U.wLBFTI01qbjCChawbJAC1uV.H1HC','o5pJVkBVIx','2024-01-01 13:57:57','2024-01-01 13:57:57'),(10,'Lambert Littel','tomas.harris@example.com','2024-01-01 13:58:27','$2y$04$2Tii2cEzxKQnoay5jiu.WOozeS5rOYI0FQM.1CFg6LodebksvZJEi','WQ0LKTHx2E','2024-01-01 13:58:27','2024-01-01 13:58:27'),(11,'Ayla Johns','verla.mueller@example.org','2024-01-02 09:21:25','$2y$04$7wINks8Q1dLtFGTspg8mVeAftNM.dhsMWrMnY7Cu1/k7eWmCqWONG','Z6rIksULlV','2024-01-02 09:21:25','2024-01-02 09:21:25'),(12,'Jalon Hill','adriana21@example.net','2024-01-02 09:22:19','$2y$04$A60KEyziakw3YiqWIeGygec5u9G8./lIbWkLE6F9Vsz.Tmdt5NQ2C','quDLF4P0uT','2024-01-02 09:22:19','2024-01-02 09:22:19'),(13,'Trever Auer','rupton@example.com','2024-01-02 09:26:34','$2y$04$q19JjOasJfDclPUK3RqwieKI5wHzqFRI9OEdslSCrngjcQ8tYUM9a','436tKt5f1s','2024-01-02 09:26:34','2024-01-02 09:26:34'),(14,'Bettie Klocko','yhammes@example.net','2024-01-02 09:27:01','$2y$04$6y9OrXaKZf/VNIcB0WKPl.E8eR/0lew.oJdok2RXTT78ZsgPx9N1W','KvOyFvPb4g','2024-01-02 09:27:01','2024-01-02 09:27:01'),(15,'Karli Turner','halie98@example.net','2024-01-02 09:34:10','$2y$04$jBBgPO3YxInw8pkBd0TsjuvfEWRItTKedDAbGqmoX3ItN0yDaCB.i','LmnU7YmKJL','2024-01-02 09:34:10','2024-01-02 09:34:10'),(16,'Devin Jerde','adah.cronin@example.org','2024-01-02 09:34:56','$2y$04$DQgUqrvEYsrpOk/YMcJCcOnp6WGlePBAFzTzFwr2IuCOooiC3cTGG','WtXiatL7jj','2024-01-02 09:34:56','2024-01-02 09:34:56'),(17,'Mariah Dicki III','deven50@example.net','2024-01-02 09:40:20','$2y$04$M.R82B3JvmsY.lj6U0D/seNTtBprXvRjl1s7upRRoys0R0k4Sltxy','3QOHtZ3dHe','2024-01-02 09:40:20','2024-01-02 09:40:20'),(18,'Carroll King','shaina.ullrich@example.com','2024-01-02 09:40:50','$2y$04$LWsLndEe1qczoVWV.41Jg.o6vUtbtpsmmrp8DPATn6ms1d78asmqK','ASfTDoAcWX','2024-01-02 09:40:50','2024-01-02 09:40:50'),(19,'Cedrick Kunde Sr.','marjory70@example.org','2024-01-02 09:42:22','$2y$04$znOuqZ.OImX9JSGjt5wvjuclPeKp/KyMRHzt6XDv9H5Uquzwl/3kq','rdk76P3DF4','2024-01-02 09:42:22','2024-01-02 09:42:22'),(20,'Dr. William Weissnat III','mueller.laurianne@example.com','2024-01-02 09:42:40','$2y$04$09S4D3m02TRMaIg5a2DqfuAnzGKOe2SKrRPj.Y5Mt89zMDHB3LRcO','GgcOoZuUNW','2024-01-02 09:42:40','2024-01-02 09:42:40'),(21,'Prof. Ryley Krajcik V','selena.bogan@example.com','2024-01-02 09:47:22','$2y$04$MTOGso35XR7uCfOHu/DuK.kAY4dMg/9rOiBKiPzdYQrrCAWZbXeCK','l6JmUQXQDh','2024-01-02 09:47:22','2024-01-02 09:47:22'),(22,'Rachael Lockman','hoeger.gerson@example.com','2024-01-02 09:50:25','$2y$04$zcfubsY79legTzCG0FFAcuhmKYxBhFVVr.EAmzozKlvTzJmDiVZVu','QubbpzS5RE','2024-01-02 09:50:25','2024-01-02 09:50:25'),(23,'Judy Collins IV','citlalli35@example.com','2024-01-02 09:51:57','$2y$04$0fAZim5nJ/7G6yruKbhyPumgu9gYglsK8udOML1qwsekn.xcg9yK.','bFfLDN9TAS','2024-01-02 09:51:57','2024-01-02 09:51:57'),(24,'Gregg Medhurst','mcglynn.elyssa@example.net','2024-01-02 09:52:37','$2y$04$VTRuN0ClDJ8qKtSaQZ4zuONzN7H3/oCxeqoAyiLgL720BfLdk5QfW','pxBUa5eEyN','2024-01-02 09:52:37','2024-01-02 09:52:37'),(25,'D\'angelo Wilkinson','coy76@example.net','2024-01-02 09:54:04','$2y$04$U1SRoz/5kJt12q2j7b2TguVxsIKeauCIgbADoN.uuhtVQEvSRtREK','jXWxIAMfMn','2024-01-02 09:54:04','2024-01-02 09:54:04'),(26,'Jerel Cummerata III','bvandervort@example.com','2024-01-02 09:58:08','$2y$04$sgtIo7efVc4TOjhvD0.sN.Y7HXgKf1qyW.BQETg4WZsOBYFfrslhm','4CQWCEt0bC','2024-01-02 09:58:08','2024-01-02 09:58:08');
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

-- Dump completed on 2024-01-03  5:54:29
