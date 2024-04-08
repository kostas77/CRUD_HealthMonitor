CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `ExamResults`
--

DROP TABLE IF EXISTS `ExamResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExamResults` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL,
  `metric_id` int NOT NULL,
  `metric_result` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ExamResults_HealthMetrics1_idx` (`metric_id`),
  KEY `fk_ExamResults_Exams1_idx` (`exam_id`),
  CONSTRAINT `fk_ExamResults_Exams1` FOREIGN KEY (`exam_id`) REFERENCES `Exams` (`id`),
  CONSTRAINT `fk_ExamResults_HealthMetrics1` FOREIGN KEY (`metric_id`) REFERENCES `HealthMetrics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExamResults`
--

LOCK TABLES `ExamResults` WRITE;
/*!40000 ALTER TABLE `ExamResults` DISABLE KEYS */;
INSERT INTO `ExamResults` VALUES (1,1,2,46),(2,2,2,42),(3,3,2,44),(4,1,1,31),(5,1,3,45),(6,2,1,35),(7,2,3,38),(8,3,1,41),(9,3,3,39),(10,1,4,6),(11,2,4,7),(12,3,4,8),(13,4,1,38),(14,4,2,42),(15,4,3,42),(16,4,4,7),(17,5,1,37),(18,5,3,43),(19,5,2,44),(20,5,4,7);
/*!40000 ALTER TABLE `ExamResults` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-08 21:54:49
