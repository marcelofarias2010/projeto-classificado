-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: brasilclassificados
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `categoria_cod` int DEFAULT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_categoria_categoria1_idx` (`categoria_cod`),
  CONSTRAINT `fk_categoria_categoria1` FOREIGN KEY (`categoria_cod`) REFERENCES `categoria` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificado`
--

DROP TABLE IF EXISTS `classificado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificado` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `tipo` varchar(1) NOT NULL COMMENT 'Venda, troca, doação ou outro',
  `valor` decimal(10,2) NOT NULL,
  `status` int NOT NULL,
  `perfil` int NOT NULL,
  `usuario_cod` int NOT NULL,
  `categoria_cod` int NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_classificado_usuario1_idx` (`usuario_cod`),
  KEY `fk_classificado_categoria1_idx` (`categoria_cod`),
  CONSTRAINT `fk_classificado_categoria1` FOREIGN KEY (`categoria_cod`) REFERENCES `categoria` (`cod`),
  CONSTRAINT `fk_classificado_usuario1` FOREIGN KEY (`usuario_cod`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificado`
--

LOCK TABLES `classificado` WRITE;
/*!40000 ALTER TABLE `classificado` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `mensagem` varchar(500) NOT NULL,
  `data` datetime NOT NULL,
  `status` int NOT NULL,
  `classificado_cod` int NOT NULL,
  `usuario_cod` int NOT NULL,
  `comentario_cod` int DEFAULT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_comentario_classificado1_idx` (`classificado_cod`),
  KEY `fk_comentario_usuario1_idx` (`usuario_cod`),
  KEY `fk_comentario_comentario1_idx` (`comentario_cod`),
  CONSTRAINT `fk_comentario_classificado1` FOREIGN KEY (`classificado_cod`) REFERENCES `classificado` (`cod`),
  CONSTRAINT `fk_comentario_comentario1` FOREIGN KEY (`comentario_cod`) REFERENCES `comentario` (`cod`),
  CONSTRAINT `fk_comentario_usuario1` FOREIGN KEY (`usuario_cod`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  `data` datetime NOT NULL,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `rua` varchar(100) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `complemento` varchar(20) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `usuario_cod` int NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_endereco_usuario_idx` (`usuario_cod`),
  CONSTRAINT `fk_endereco_usuario` FOREIGN KEY (`usuario_cod`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagens`
--

DROP TABLE IF EXISTS `imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagens` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `imagem` varchar(100) NOT NULL,
  `classificado_cod` int NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_imagens_classificado1_idx` (`classificado_cod`),
  CONSTRAINT `fk_imagens_classificado1` FOREIGN KEY (`classificado_cod`) REFERENCES `classificado` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagens`
--

LOCK TABLES `imagens` WRITE;
/*!40000 ALTER TABLE `imagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `tipo` int NOT NULL,
  `numero` varchar(20) NOT NULL,
  `usuario_cod` int NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_telefone_usuario1_idx` (`usuario_cod`),
  CONSTRAINT `fk_telefone_usuario1` FOREIGN KEY (`usuario_cod`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `nascimento` date NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `status` int NOT NULL,
  `permissao` int NOT NULL,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-11 11:55:43
