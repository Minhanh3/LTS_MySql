CREATE DATABASE  IF NOT EXISTS `sinhvien` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sinhvien`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sinhvien
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `ketqua`
--

DROP TABLE IF EXISTS `ketqua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ketqua` (
  `KetquaID` int NOT NULL AUTO_INCREMENT,
  `SinhvienID` int DEFAULT NULL,
  `MonhocID` int DEFAULT NULL,
  `Lanthi` int DEFAULT NULL,
  `Diemthi` float DEFAULT NULL,
  PRIMARY KEY (`KetquaID`),
  KEY `fk_kq_sv_idx` (`SinhvienID`),
  KEY `fk_kq_monhoc_idx` (`MonhocID`),
  CONSTRAINT `fk_kq_monhoc` FOREIGN KEY (`MonhocID`) REFERENCES `monhoc` (`MonhocID`),
  CONSTRAINT `fk_kq_sv` FOREIGN KEY (`SinhvienID`) REFERENCES `sinhvien` (`SinhvienID`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ketqua`
--

LOCK TABLES `ketqua` WRITE;
/*!40000 ALTER TABLE `ketqua` DISABLE KEYS */;
INSERT INTO `ketqua` VALUES (1,1,1,1,5.6),(2,2,1,1,9.2),(3,3,1,1,9.8),(4,4,1,1,4.5),(5,4,1,2,6.7),(6,6,1,1,4.5),(7,7,1,1,4.5),(8,8,1,1,7.8),(9,14,1,1,3.5),(10,14,1,2,5.6),(11,5,2,1,3.4),(12,6,2,1,4.5),(13,7,2,1,8),(14,8,2,1,9),(15,9,2,1,6.7),(16,10,2,1,4.5),(17,10,2,2,7),(18,11,2,1,5),(19,3,3,1,6),(20,4,3,1,7),(21,5,3,1,8),(22,6,3,1,4.7),(23,7,3,1,8),(24,8,3,1,4),(25,8,3,2,6),(26,11,4,1,8),(27,12,4,1,9),(28,13,4,1,8),(29,14,4,1,9),(30,15,4,1,8),(31,3,4,1,7),(32,4,4,1,6),(33,5,4,1,8),(34,6,5,1,5.6),(35,7,5,1,7),(36,8,5,1,8),(37,9,5,1,6),(38,2,5,1,9.3),(39,1,5,1,7),(40,12,5,1,6),(41,11,5,1,5.8),(42,1,6,1,4),(43,1,6,2,9.6),(44,2,6,1,9.4),(45,3,6,1,6),(46,4,6,1,8),(47,5,6,1,4),(48,5,6,2,7),(49,9,6,1,8),(50,2,7,1,9),(51,3,7,1,9),(52,4,7,1,6),(53,5,7,1,7),(54,6,7,1,8),(55,7,7,1,6),(56,8,7,1,5),(57,9,7,1,6),(58,1,7,1,5.9),(59,10,7,1,6),(60,11,7,1,8),(61,12,8,1,4),(62,12,8,2,8),(63,13,8,1,7),(64,14,8,1,6),(65,15,8,1,9),(66,9,9,1,7),(67,8,9,1,7),(68,7,9,1,4),(69,7,9,2,9.8),(70,6,9,1,9.5),(71,5,9,1,8),(72,4,9,1,7),(73,3,10,1,9),(74,2,10,1,4.5),(75,1,10,1,6),(76,8,10,1,7),(77,9,10,1,8),(78,14,10,1,3),(79,14,10,2,8),(80,5,10,1,6.8),(81,4,10,1,7.8),(82,6,10,1,6.7),(83,7,10,1,8.8),(84,10,10,1,7),(85,11,10,1,7.7),(86,12,10,1,6.7),(87,13,10,1,9),(88,15,10,1,7.8);
/*!40000 ALTER TABLE `ketqua` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-12 20:25:20
