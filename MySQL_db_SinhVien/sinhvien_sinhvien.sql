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
-- Table structure for table `sinhvien`
--

DROP TABLE IF EXISTS `sinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinhvien` (
  `SinhvienID` int NOT NULL AUTO_INCREMENT,
  `KhoaID` int DEFAULT NULL,
  `Hoten` varchar(45) DEFAULT NULL,
  `Gioitinh` varchar(45) DEFAULT NULL,
  `Ngaysinh` date DEFAULT NULL,
  `Noisinh` varchar(45) DEFAULT NULL,
  `Hocbong` int DEFAULT NULL,
  PRIMARY KEY (`SinhvienID`),
  KEY `fk_sv_khoa_idx` (`KhoaID`),
  CONSTRAINT `fk_sv_khoa` FOREIGN KEY (`KhoaID`) REFERENCES `khoa` (`KhoaID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinhvien`
--

LOCK TABLES `sinhvien` WRITE;
/*!40000 ALTER TABLE `sinhvien` DISABLE KEYS */;
INSERT INTO `sinhvien` VALUES (1,1,'Trần Ngọc Lâm','nam','1997-02-05','Hà Nội',100000),(2,1,'Nguyễn Văn Ngọc','nam','1997-04-03','Hưng Yên',150000),(3,1,'Hoàng Thùy Lan','nữ','1998-04-05','Lào Cai',80000),(4,2,'Trương Công Minh','nam','1996-04-06','Hải Phòng',250000),(5,3,'Trịnh Thùy Linh','nữ','1999-03-02','Hà Nội',90000),(6,3,'Mai Anh Tuấn','nam','1998-04-04','Hà Nội',0),(7,4,'Tạ Ngọc Hải','nam','1998-04-02','Quảng Ninh',0),(8,4,'Trần Văn Ban','nam','1997-01-06','Thanh Hóa',150000),(9,5,'Lâm Tâm Như','nữ','1999-04-03','Thái Bình',0),(10,5,'Hà Văn Chiến','nam','2000-03-03','Đồng Nai',250000),(11,6,'Nguyễn Công Hoan','nam','2001-04-02','Thái Bình',350000),(12,6,'Trần Quang Minh','nam','2001-05-03','Hà Nội',0),(13,6,'Phan Ngọc Toản','nam','2000-04-02','Hưng Yên',0),(14,6,'Mai Thị Thu Hà','nữ','1999-04-02','Thái Bình',450000),(15,6,'Trương Ngọc Ánh','nữ','1997-03-06','Hải Phòng',0);
/*!40000 ALTER TABLE `sinhvien` ENABLE KEYS */;
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
