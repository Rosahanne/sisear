CREATE DATABASE  IF NOT EXISTS `sata` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sata`;
-- MySQL dump 10.13  Distrib 5.5.61, for Win32 (AMD64)
--
-- Host: localhost    Database: sata
-- ------------------------------------------------------
-- Server version	5.5.61-log

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
-- Table structure for table `cadata`
--

DROP TABLE IF EXISTS `cadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadata` (
  `id_cadAta` int(11) NOT NULL AUTO_INCREMENT,
  `DtEmssao_cadAta` date NOT NULL,
  `Titulo_cadAta` varchar(100) NOT NULL,
  `DtInicio_cadAta` date NOT NULL,
  `DtTermino_cadAta` date NOT NULL,
  `PalavraChave_cadAta` varchar(45) NOT NULL,
  `setorReuniao_IdsetorReniao_setorReuniao` int(11) NOT NULL,
  PRIMARY KEY (`id_cadAta`,`setorReuniao_IdsetorReniao_setorReuniao`),
  KEY `fk_cadAta_setorReuniao1_idx` (`setorReuniao_IdsetorReniao_setorReuniao`),
  CONSTRAINT `fk_cadAta_setorReuniao1` FOREIGN KEY (`setorReuniao_IdsetorReniao_setorReuniao`) REFERENCES `setorreuniao` (`IdsetorReniao_setorReuniao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadata`
--

LOCK TABLES `cadata` WRITE;
/*!40000 ALTER TABLE `cadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadata_has_participanteexterno`
--

DROP TABLE IF EXISTS `cadata_has_participanteexterno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadata_has_participanteexterno` (
  `Id_cadAta` int(11) NOT NULL,
  `Id_participanteExterno` int(11) NOT NULL,
  PRIMARY KEY (`Id_cadAta`,`Id_participanteExterno`),
  KEY `fk_cadAta_has_participanteExterno2_idx` (`Id_participanteExterno`),
  KEY `fk_cadAta_has_participanteExterno1_idx` (`Id_cadAta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadata_has_participanteexterno`
--

LOCK TABLES `cadata_has_participanteexterno` WRITE;
/*!40000 ALTER TABLE `cadata_has_participanteexterno` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadata_has_participanteexterno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participanteexterno`
--

DROP TABLE IF EXISTS `participanteexterno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participanteexterno` (
  `IdPartEx_participanteExterno` int(11) NOT NULL,
  `nomePartEx_participanteExterno` varchar(60) NOT NULL,
  `empresaPartEx_participanteExterno` varchar(45) DEFAULT NULL,
  `emailPartEx_participanteExterno` varchar(45) NOT NULL,
  PRIMARY KEY (`IdPartEx_participanteExterno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participanteexterno`
--

LOCK TABLES `participanteexterno` WRITE;
/*!40000 ALTER TABLE `participanteexterno` DISABLE KEYS */;
/*!40000 ALTER TABLE `participanteexterno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantefunc`
--

DROP TABLE IF EXISTS `participantefunc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participantefunc` (
  `IdPartFunc_participanteFunc` int(11) NOT NULL,
  `nomePartFunc_participanteFunc` varchar(60) NOT NULL,
  `emailPartFunc_participanteFunc` varchar(45) NOT NULL,
  PRIMARY KEY (`IdPartFunc_participanteFunc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantefunc`
--

LOCK TABLES `participantefunc` WRITE;
/*!40000 ALTER TABLE `participantefunc` DISABLE KEYS */;
/*!40000 ALTER TABLE `participantefunc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantefunc_has_cadata`
--

DROP TABLE IF EXISTS `participantefunc_has_cadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participantefunc_has_cadata` (
  `participanteFunc_IdPartFunc_participanteFunc` int(11) NOT NULL,
  `cadAta_id_cadAta` int(11) NOT NULL,
  PRIMARY KEY (`participanteFunc_IdPartFunc_participanteFunc`,`cadAta_id_cadAta`),
  KEY `fk_participanteFunc_has_cadAta_cadAta1_idx` (`cadAta_id_cadAta`),
  KEY `fk_participanteFunc_has_cadAta_participanteFunc_idx` (`participanteFunc_IdPartFunc_participanteFunc`),
  CONSTRAINT `fk_participanteFunc_has_cadAta_participanteFunc` FOREIGN KEY (`participanteFunc_IdPartFunc_participanteFunc`) REFERENCES `participantefunc` (`IdPartFunc_participanteFunc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participanteFunc_has_cadAta_cadAta1` FOREIGN KEY (`cadAta_id_cadAta`) REFERENCES `cadata` (`id_cadAta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantefunc_has_cadata`
--

LOCK TABLES `participantefunc_has_cadata` WRITE;
/*!40000 ALTER TABLE `participantefunc_has_cadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `participantefunc_has_cadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pautareuniao`
--

DROP TABLE IF EXISTS `pautareuniao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pautareuniao` (
  `IdPauta_pautaReuniao` int(11) NOT NULL,
  `tituloPauta_pautaReuniao` varchar(150) NOT NULL,
  `descricaoPauta_pautaReuniao` text NOT NULL,
  `cadAta_id_cadAta` int(11) NOT NULL,
  PRIMARY KEY (`IdPauta_pautaReuniao`,`cadAta_id_cadAta`),
  KEY `fk_pautaReuniao_cadAta1_idx` (`cadAta_id_cadAta`),
  CONSTRAINT `fk_pautaReuniao_cadAta1` FOREIGN KEY (`cadAta_id_cadAta`) REFERENCES `cadata` (`id_cadAta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pautareuniao`
--

LOCK TABLES `pautareuniao` WRITE;
/*!40000 ALTER TABLE `pautareuniao` DISABLE KEYS */;
/*!40000 ALTER TABLE `pautareuniao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setorreuniao`
--

DROP TABLE IF EXISTS `setorreuniao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setorreuniao` (
  `IdsetorReniao_setorReuniao` int(11) NOT NULL,
  `nomeSetor_setorReuniao` varchar(45) NOT NULL,
  PRIMARY KEY (`IdsetorReniao_setorReuniao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setorreuniao`
--

LOCK TABLES `setorreuniao` WRITE;
/*!40000 ALTER TABLE `setorreuniao` DISABLE KEYS */;
/*!40000 ALTER TABLE `setorreuniao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugestaorevisao`
--

DROP TABLE IF EXISTS `sugestaorevisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sugestaorevisao` (
  `IdSugestaoRev_sugestaoRevisao` int(11) NOT NULL,
  `textoSugestao_sugestaoRevisao` text,
  `partFunc_has_cadAta_IdpantFunc_IdPartFunc_partiFunc` int(11) NOT NULL,
  `partFunc_has_cadAta_cadAta_id_cadAta` int(11) NOT NULL,
  PRIMARY KEY (`IdSugestaoRev_sugestaoRevisao`,`partFunc_has_cadAta_IdpantFunc_IdPartFunc_partiFunc`,`partFunc_has_cadAta_cadAta_id_cadAta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugestaorevisao`
--

LOCK TABLES `sugestaorevisao` WRITE;
/*!40000 ALTER TABLE `sugestaorevisao` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugestaorevisao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugestaorevisao_has_pautareuniao`
--

DROP TABLE IF EXISTS `sugestaorevisao_has_pautareuniao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sugestaorevisao_has_pautareuniao` (
  `Id_sugestaoRevisao` int(11) NOT NULL,
  `Id_pautaReuniao` int(11) NOT NULL,
  PRIMARY KEY (`Id_sugestaoRevisao`,`Id_pautaReuniao`),
  KEY `fk_sugestaoRevisao_has_pautaReuniao2_idx` (`Id_pautaReuniao`),
  KEY `fk_sugestaoRevisao_has_pautaReuniao1_idx` (`Id_sugestaoRevisao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugestaorevisao_has_pautareuniao`
--

LOCK TABLES `sugestaorevisao_has_pautareuniao` WRITE;
/*!40000 ALTER TABLE `sugestaorevisao_has_pautareuniao` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugestaorevisao_has_pautareuniao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sata'
--

--
-- Dumping routines for database 'sata'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-09  0:53:25
