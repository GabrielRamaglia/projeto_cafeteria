CREATE DATABASE  IF NOT EXISTS `db_cafearoma` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_cafearoma`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: db_cafearoma
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `prod_ingesp`
--

DROP TABLE IF EXISTS `prod_ingesp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_ingesp` (
  `id_prod_ingEsp` int NOT NULL AUTO_INCREMENT,
  `id_produto_fk` int DEFAULT NULL,
  `id_especial_fk` int DEFAULT NULL,
  `quantidade` int NOT NULL,
  `unidade_medida` varchar(10) NOT NULL,
  PRIMARY KEY (`id_prod_ingEsp`),
  KEY `id_produto_fk` (`id_produto_fk`),
  KEY `id_especial_fk` (`id_especial_fk`),
  CONSTRAINT `prod_ingesp_ibfk_1` FOREIGN KEY (`id_produto_fk`) REFERENCES `tb_produto` (`id_produto`),
  CONSTRAINT `prod_ingesp_ibfk_2` FOREIGN KEY (`id_especial_fk`) REFERENCES `tb_ingesp` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_ingesp`
--

LOCK TABLES `prod_ingesp` WRITE;
/*!40000 ALTER TABLE `prod_ingesp` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_ingesp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_promo`
--

DROP TABLE IF EXISTS `prod_promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_promo` (
  `id_prod_promo` int NOT NULL AUTO_INCREMENT,
  `id_produto_fk` int DEFAULT NULL,
  `id_promo_fk` int DEFAULT NULL,
  `porcen_promo_desc` decimal(4,2) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`id_prod_promo`),
  KEY `id_produto_fk` (`id_produto_fk`),
  KEY `id_promo_fk` (`id_promo_fk`),
  CONSTRAINT `prod_promo_ibfk_1` FOREIGN KEY (`id_produto_fk`) REFERENCES `tb_produto` (`id_produto`),
  CONSTRAINT `prod_promo_ibfk_2` FOREIGN KEY (`id_promo_fk`) REFERENCES `tb_promocao` (`id_promocao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_promo`
--

LOCK TABLES `prod_promo` WRITE;
/*!40000 ALTER TABLE `prod_promo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(15) NOT NULL,
  `sobrenome` varchar(35) NOT NULL,
  `sexo` enum('F','M') DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente_endereco`
--

DROP TABLE IF EXISTS `tb_cliente_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente_endereco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente_fk` int DEFAULT NULL,
  `id_endereco_fk` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente_fk` (`id_cliente_fk`),
  KEY `id_endereco_fk` (`id_endereco_fk`),
  CONSTRAINT `tb_cliente_endereco_ibfk_1` FOREIGN KEY (`id_cliente_fk`) REFERENCES `tb_cliente` (`id_cliente`),
  CONSTRAINT `tb_cliente_endereco_ibfk_2` FOREIGN KEY (`id_endereco_fk`) REFERENCES `tb_local_cliente` (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente_endereco`
--

LOCK TABLES `tb_cliente_endereco` WRITE;
/*!40000 ALTER TABLE `tb_cliente_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_emailfunc`
--

DROP TABLE IF EXISTS `tb_emailfunc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_emailfunc` (
  `registro_func_fk` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  KEY `registro_func_fk` (`registro_func_fk`),
  CONSTRAINT `tb_emailfunc_ibfk_1` FOREIGN KEY (`registro_func_fk`) REFERENCES `tb_funcionario` (`registro_func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_emailfunc`
--

LOCK TABLES `tb_emailfunc` WRITE;
/*!40000 ALTER TABLE `tb_emailfunc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_emailfunc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_enderecofunc`
--

DROP TABLE IF EXISTS `tb_enderecofunc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_enderecofunc` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) NOT NULL,
  `endereco` varchar(35) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `complemento` varchar(15) DEFAULT NULL,
  `cep` char(8) NOT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_enderecofunc`
--

LOCK TABLES `tb_enderecofunc` WRITE;
/*!40000 ALTER TABLE `tb_enderecofunc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_enderecofunc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_filial`
--

DROP TABLE IF EXISTS `tb_filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_filial` (
  `id_filial` int NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `localizacao` varchar(40) NOT NULL,
  PRIMARY KEY (`id_filial`),
  UNIQUE KEY `cnpj` (`cnpj`),
  UNIQUE KEY `nome` (`nome`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefone` (`telefone`),
  UNIQUE KEY `localizacao` (`localizacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_filial`
--

LOCK TABLES `tb_filial` WRITE;
/*!40000 ALTER TABLE `tb_filial` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_funcionario` (
  `id_func` int NOT NULL AUTO_INCREMENT,
  `registro_func` int NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `nome` varchar(15) NOT NULL,
  `sobrenome` varchar(35) NOT NULL,
  `sexo` enum('F','M') NOT NULL,
  `remuneracao` decimal(6,2) NOT NULL,
  `setor` varchar(15) NOT NULL,
  `id_endereco_func_fk` int DEFAULT NULL,
  `id_filial_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_func`),
  UNIQUE KEY `registro_func` (`registro_func`),
  UNIQUE KEY `CPF` (`CPF`),
  KEY `id_endereco_func_fk` (`id_endereco_func_fk`),
  KEY `id_filial_fk` (`id_filial_fk`),
  CONSTRAINT `tb_funcionario_ibfk_1` FOREIGN KEY (`id_endereco_func_fk`) REFERENCES `tb_enderecofunc` (`id_endereco`),
  CONSTRAINT `tb_funcionario_ibfk_2` FOREIGN KEY (`id_filial_fk`) REFERENCES `tb_filial` (`id_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionario`
--

LOCK TABLES `tb_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ingesp`
--

DROP TABLE IF EXISTS `tb_ingesp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ingesp` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `valor` decimal(4,2) NOT NULL,
  `quatidade` int NOT NULL,
  `unidade_med` char(3) NOT NULL,
  `validade` date NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ingesp`
--

LOCK TABLES `tb_ingesp` WRITE;
/*!40000 ALTER TABLE `tb_ingesp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ingesp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_local_cliente`
--

DROP TABLE IF EXISTS `tb_local_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_local_cliente` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) NOT NULL,
  `endereco` varchar(35) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `complemento` varchar(15) DEFAULT NULL,
  `cep` char(8) NOT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_local_cliente`
--

LOCK TABLES `tb_local_cliente` WRITE;
/*!40000 ALTER TABLE `tb_local_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_local_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_nf`
--

DROP TABLE IF EXISTS `tb_nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_nf` (
  `id_nf` int NOT NULL AUTO_INCREMENT,
  `num_nf` int NOT NULL,
  `data_hr` datetime DEFAULT NULL,
  `status_nf` enum('Emitida','cancelada','aguardando') DEFAULT NULL,
  PRIMARY KEY (`id_nf`),
  UNIQUE KEY `num_nf` (`num_nf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_nf`
--

LOCK TABLES `tb_nf` WRITE;
/*!40000 ALTER TABLE `tb_nf` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedi_prod`
--

DROP TABLE IF EXISTS `tb_pedi_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pedi_prod` (
  `id_pedi_Prod` int NOT NULL AUTO_INCREMENT,
  `id_pedido_fk` int NOT NULL,
  `id_produto_fk` int DEFAULT NULL,
  `quant_prod` float DEFAULT NULL,
  PRIMARY KEY (`id_pedi_Prod`,`id_pedido_fk`),
  KEY `id_pedido_fk` (`id_pedido_fk`),
  KEY `id_produto_fk` (`id_produto_fk`),
  CONSTRAINT `tb_pedi_prod_ibfk_1` FOREIGN KEY (`id_pedido_fk`) REFERENCES `tb_pedido` (`id_pedido`),
  CONSTRAINT `tb_pedi_prod_ibfk_2` FOREIGN KEY (`id_produto_fk`) REFERENCES `tb_produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedi_prod`
--

LOCK TABLES `tb_pedi_prod` WRITE;
/*!40000 ALTER TABLE `tb_pedi_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pedi_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido`
--

DROP TABLE IF EXISTS `tb_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `data_pedido` date NOT NULL,
  `hora_pedido` time NOT NULL,
  `forma_pgto` enum('Credito','Débito','Pix','Dinheiro') DEFAULT NULL,
  `id_cliente_fk` int DEFAULT NULL,
  `id_nf_fk` int DEFAULT NULL,
  `id_filial_fk` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente_fk` (`id_cliente_fk`),
  KEY `id_nf_fk` (`id_nf_fk`),
  KEY `id_filial_fk` (`id_filial_fk`),
  CONSTRAINT `tb_pedido_ibfk_1` FOREIGN KEY (`id_cliente_fk`) REFERENCES `tb_cliente` (`id_cliente`),
  CONSTRAINT `tb_pedido_ibfk_2` FOREIGN KEY (`id_nf_fk`) REFERENCES `tb_nf` (`id_nf`),
  CONSTRAINT `tb_pedido_ibfk_3` FOREIGN KEY (`id_filial_fk`) REFERENCES `tb_filial` (`id_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido`
--

LOCK TABLES `tb_pedido` WRITE;
/*!40000 ALTER TABLE `tb_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `valor` decimal(4,2) NOT NULL,
  `quatidade` int NOT NULL,
  `unidade_med` char(3) NOT NULL,
  `validade` date NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_promocao`
--

DROP TABLE IF EXISTS `tb_promocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_promocao` (
  `id_promocao` int NOT NULL AUTO_INCREMENT,
  `nome_promo` varchar(15) DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id_promocao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_promocao`
--

LOCK TABLES `tb_promocao` WRITE;
/*!40000 ALTER TABLE `tb_promocao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_promocao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telcliente`
--

DROP TABLE IF EXISTS `tb_telcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_telcliente` (
  `id_cliente_fk` int NOT NULL,
  `telefone_cliente` varchar(13) NOT NULL,
  PRIMARY KEY (`id_cliente_fk`,`telefone_cliente`),
  CONSTRAINT `tb_telcliente_ibfk_1` FOREIGN KEY (`id_cliente_fk`) REFERENCES `tb_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telcliente`
--

LOCK TABLES `tb_telcliente` WRITE;
/*!40000 ALTER TABLE `tb_telcliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_telcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telfunc`
--

DROP TABLE IF EXISTS `tb_telfunc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_telfunc` (
  `registro_func_fk` int DEFAULT NULL,
  `telefone` varchar(13) DEFAULT NULL,
  KEY `registro_func_fk` (`registro_func_fk`),
  CONSTRAINT `tb_telfunc_ibfk_1` FOREIGN KEY (`registro_func_fk`) REFERENCES `tb_funcionario` (`registro_func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telfunc`
--

LOCK TABLES `tb_telfunc` WRITE;
/*!40000 ALTER TABLE `tb_telfunc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_telfunc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-28 16:46:54
