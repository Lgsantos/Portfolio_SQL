-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: consultas_basicas
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `ator`
--

DROP TABLE IF EXISTS `ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ator` (
  `coda` int(11) NOT NULL,
  `nomeart` varchar(20) DEFAULT NULL,
  `nomereal` varchar(20) DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `indicacaooscar` int(11) DEFAULT NULL,
  `oscar` int(11) DEFAULT NULL,
  PRIMARY KEY (`coda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ator`
--

LOCK TABLES `ator` WRITE;
/*!40000 ALTER TABLE `ator` DISABLE KEYS */;
INSERT INTO `ator` VALUES (1,'DemiMoore','MariadaSilva','USA','f',32,0,0),(2,'BradPitt','JoaoPaulo','USA','m',28,1,0),(3,'DustinHoffman','DustinHoffman','USA','f',36,2,0),(4,'JessicaLange','JessicaLange','USA','f',42,4,2),(5,'SoniaBraga','SoniaBraga','Brasil','f',45,0,0);
/*!40000 ALTER TABLE `ator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `codf` int(11) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `orcamento` int(11) DEFAULT NULL,
  `tempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'AJurada',1996,1000000,18),(2,'ALetraEscarlate',1995,10000000,24),(3,'Seven',1995,1500000,20),(4,'Tootsie',1982,50000,16),(5,'Tieta',1995,200000,18);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personagem`
--

DROP TABLE IF EXISTS `personagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personagem` (
  `coda` int(11) NOT NULL,
  `codf` int(11) NOT NULL,
  `personagem` varchar(20) DEFAULT NULL,
  `cache` int(11) DEFAULT NULL,
  PRIMARY KEY (`coda`,`codf`),
  KEY `codf` (`codf`),
  CONSTRAINT `personagem_ibfk_1` FOREIGN KEY (`coda`) REFERENCES `ator` (`coda`),
  CONSTRAINT `personagem_ibfk_2` FOREIGN KEY (`codf`) REFERENCES `filme` (`codf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personagem`
--

LOCK TABLES `personagem` WRITE;
/*!40000 ALTER TABLE `personagem` DISABLE KEYS */;
INSERT INTO `personagem` VALUES (1,1,'Mary',3000),(1,2,'Sandy',5000),(2,3,'John',5000),(3,4,'Mary',1000),(4,4,'Tootsie',2000),(5,5,'Tieta',500);
/*!40000 ALTER TABLE `personagem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-28 16:40:41
