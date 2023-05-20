-- MariaDB dump 10.19  Distrib 10.10.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pro2
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carritos`
--

DROP TABLE IF EXISTS `carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carritos` (
  `idCarrito` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idCarrito`),
  UNIQUE KEY `idCliente` (`idCliente`),
  CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos`
--

LOCK TABLES `carritos` WRITE;
/*!40000 ALTER TABLE `carritos` DISABLE KEYS */;
INSERT INTO `carritos` VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23);
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chefs`
--

DROP TABLE IF EXISTS `chefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chefs` (
  `idChef` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `ApellidoPaterno` varchar(100) NOT NULL,
  `ApellidoMaterno` varchar(100) NOT NULL,
  `Salario` decimal(10,2) NOT NULL,
  `idEspecialidad` int(11) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idChef`),
  UNIQUE KEY `idUsuario` (`idUsuario`),
  KEY `idEspecialidad` (`idEspecialidad`),
  CONSTRAINT `chefs_ibfk_1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidades` (`idEspecialidad`) ON DELETE CASCADE,
  CONSTRAINT `chefs_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chefs`
--

LOCK TABLES `chefs` WRITE;
/*!40000 ALTER TABLE `chefs` DISABLE KEYS */;
INSERT INTO `chefs` VALUES
(1,'Roberto','Gomez','Hernandez',15000.00,1,24),
(2,'Sergio','Molina','Lopez',14000.00,2,25),
(3,'Luisa','Rivera','Gonzalez',13000.00,3,26),
(4,'Carlos','Lopez','Hernandez',12000.00,4,27),
(5,'Patricia','Fernandez','Gomez',11000.00,5,28),
(6,'Javier','Hernandez','Molina',10000.00,6,29),
(7,'Andrea','Gonzalez','Lopez',9000.00,7,30),
(8,'Oscar','Sanchez','Hernandez',8000.00,8,31),
(9,'Monica','Ortega','Fernandez',7000.00,9,32),
(10,'Alejandro','Martinez','Hernandez',6000.00,10,33);
/*!40000 ALTER TABLE `chefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `ApellidoPaterno` varchar(100) NOT NULL,
  `ApellidoMaterno` varchar(100) NOT NULL,
  `TelefonoContacto` varchar(20) DEFAULT NULL,
  `idDireccion` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `idUsuario` (`idUsuario`),
  KEY `idDireccion` (`idDireccion`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idDireccion`) REFERENCES `direcciones` (`idDireccion`) ON DELETE CASCADE,
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES
(1,'John','Doe','Smith','555-1234',1,1),
(2,'Jane','Doe','Johnson','555-5678',2,2),
(3,'Mike','Smith','Brown','555-9012',3,3),
(4,'Lisa','Jones','Davis','555-3456',4,4),
(5,'Emily','Wilson','Moore','555-7890',5,5),
(6,'Alexander','Brown','Taylor','555-2345',6,6),
(7,'Olivia','Moore','Anderson','555-6789',7,7),
(8,'William','Davis','Martin','555-0123',8,8),
(9,'Sophia','Thomas','Clark','555-4567',9,9),
(10,'Daniel','Jackson','Lewis','555-8901',10,10),
(11,'Mia','Anderson','Hill','555-2345',11,11),
(12,'Benjamin','Martin','Walker','555-6789',12,12),
(13,'Ava','Rodriguez','Adams','555-0123',13,13),
(14,'Samuel','Clark','Harris','555-4567',14,14),
(15,'Chloe','Lewis','Turner','555-8901',15,15),
(16,'Oliver','Hill','Wright','555-2345',16,16),
(17,'Grace','Walker','Green','555-6789',17,17),
(18,'Jackson','Green','Smith','555-0123',18,18),
(19,'Harper','Adams','Johnson','555-4567',19,19),
(20,'Aiden','Hall','Brown','555-8901',20,20),
(21,'Scarlett','Wright','Taylor','555-2345',21,21),
(22,'Lucas','Harris','Davis','555-6789',22,22),
(23,'Amelia','Turner','Moore','555-0123',23,23),
(24,'Anakin','Skywalker','Omega','1234566',25,54);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colonias`
--

DROP TABLE IF EXISTS `colonias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colonias` (
  `idColonia` int(11) NOT NULL AUTO_INCREMENT,
  `Colonia` varchar(100) NOT NULL,
  `idMunicipio` int(11) NOT NULL,
  PRIMARY KEY (`idColonia`),
  KEY `idMunicipio` (`idMunicipio`),
  CONSTRAINT `colonias_ibfk_1` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonias`
--

LOCK TABLES `colonias` WRITE;
/*!40000 ALTER TABLE `colonias` DISABLE KEYS */;
INSERT INTO `colonias` VALUES
(1,'Centro',1),
(2,'Zona Norte',2),
(3,'El Progreso',3),
(4,'San Román',4),
(5,'Centro Histórico',5),
(6,'Las Palmas',6),
(7,'San Roque',7),
(8,'Mirador',8),
(9,'Polanco',9),
(10,'Centro',10),
(11,'San Javier',11),
(12,'Del Bosque',12),
(13,'Centro',13),
(14,'Providencia',14),
(15,'Centro',15),
(16,'Melchor Ocampo',16),
(17,'Del Valle',17),
(18,'Centro',18),
(19,'Obispado',19),
(20,'Reforma',20),
(21,'La Paz',21),
(22,'Juriquilla',22),
(23,'Centro',23),
(24,'Tangamanga',24),
(25,'La Becerrera',25);
/*!40000 ALTER TABLE `colonias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallescarritos`
--

DROP TABLE IF EXISTS `detallescarritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallescarritos` (
  `idDetalleCarrito` int(11) NOT NULL AUTO_INCREMENT,
  `idCarrito` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Comentarios` text DEFAULT NULL,
  PRIMARY KEY (`idDetalleCarrito`),
  UNIQUE KEY `idCarrito` (`idCarrito`,`idProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `detallescarritos_ibfk_1` FOREIGN KEY (`idCarrito`) REFERENCES `carritos` (`idCarrito`) ON DELETE CASCADE,
  CONSTRAINT `detallescarritos_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallescarritos`
--

LOCK TABLES `detallescarritos` WRITE;
/*!40000 ALTER TABLE `detallescarritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallescarritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direcciones` (
  `idDireccion` int(11) NOT NULL AUTO_INCREMENT,
  `idColonia` int(11) NOT NULL,
  `Calle` varchar(100) NOT NULL,
  `NumExterior` varchar(20) NOT NULL,
  `NumInterior` varchar(20) DEFAULT NULL,
  `CodigoPostal` varchar(10) NOT NULL,
  PRIMARY KEY (`idDireccion`),
  KEY `idColonia` (`idColonia`),
  CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`idColonia`) REFERENCES `colonias` (`idColonia`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES
(1,1,'Av. Juárez','123',NULL,'20000'),
(2,2,'Blvd. Sánchez Taboada','456',NULL,'22000'),
(3,3,'Calle Allende','789',NULL,'23000'),
(4,4,'Av. Miguel Hidalgo','321',NULL,'24000'),
(5,5,'Calle Morelos','654',NULL,'25000'),
(6,6,'Av. 20 de Noviembre','987',NULL,'28000'),
(7,7,'Calle Central','654',NULL,'29000'),
(8,8,'Blvd. Ortiz Mena','321',NULL,'31000'),
(9,9,'Av. Reforma','789',NULL,'06000'),
(10,10,'Calle Victoria','123',NULL,'34000'),
(11,11,'Av. Juárez','456',NULL,'36000'),
(12,12,'Blvd. René Juárez','789',NULL,'39000'),
(13,13,'Calle Hidalgo','321',NULL,'42000'),
(14,14,'Av. Vallarta','654',NULL,'45000'),
(15,15,'Calle Lerdo','987',NULL,'50000'),
(16,16,'Av. Madero','654',NULL,'58000'),
(17,17,'Calle Morelos','321',NULL,'62000'),
(18,18,'Blvd. Tepic-Xalisco','789',NULL,'63000'),
(19,19,'Av. Constitución','123',NULL,'64000'),
(20,20,'Calle Reforma','456',NULL,'68000'),
(21,21,'Av. Juárez','789',NULL,'72000'),
(22,22,'Blvd. Bernardo Quintana','321',NULL,'76000'),
(23,23,'Av. Tulum','654',NULL,'77500'),
(24,24,'Blvd. Salvador Nava','987',NULL,'78000'),
(25,25,'Rebelion','405','17','8888');
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregas` (
  `idEntrega` int(11) NOT NULL AUTO_INCREMENT,
  `EstadoEntrega` varchar(50) NOT NULL,
  `idPedido` int(11) NOT NULL,
  PRIMARY KEY (`idEntrega`),
  UNIQUE KEY `idPedido` (`idPedido`),
  CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` VALUES
(1,'En proceso',1),
(2,'En camino',5),
(3,'Entregado',10),
(4,'En camino',12),
(5,'En proceso',15),
(6,'Entregado',18),
(7,'En proceso',20),
(8,'Entregado',21),
(9,'En camino',23),
(10,'Entregado',2),
(11,'En proceso',7),
(12,'En camino',9),
(13,'Entregado',13),
(14,'En camino',16),
(15,'Entregado',19);
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidades` (
  `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `Especialidad` varchar(100) NOT NULL,
  PRIMARY KEY (`idEspecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES
(1,'Cocina Mexicana Tradicional'),
(2,'Cocina Mexicana Contemporánea'),
(3,'Cocina Mexicana Regional'),
(4,'Cocina Mexicana Fusion'),
(5,'Cocina Mexicana Vegetariana'),
(6,'Cocina Mexicana Vegana'),
(7,'Cocina Mexicana de Mariscos'),
(8,'Cocina Mexicana de Antojitos'),
(9,'Cocina Mexicana de Barbacoa'),
(10,'Cocina Mexicana de Tacos');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES
(1,'Aguascalientes'),
(2,'Baja California'),
(3,'Baja California Sur'),
(4,'Campeche'),
(5,'Coahuila'),
(6,'Colima'),
(7,'Chiapas'),
(8,'Chihuahua'),
(9,'Ciudad de México'),
(10,'Durango'),
(11,'Guanajuato'),
(12,'Guerrero'),
(13,'Hidalgo'),
(14,'Jalisco'),
(15,'México'),
(16,'Michoacán'),
(17,'Morelos'),
(18,'Nayarit'),
(19,'Nuevo León'),
(20,'Oaxaca'),
(21,'Puebla'),
(22,'Querétaro'),
(23,'Quintana Roo'),
(24,'San Luis Potosí');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  PRIMARY KEY (`idHorario`),
  UNIQUE KEY `Fecha` (`Fecha`,`Hora`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES
(1,'2023-05-20','18:00:00'),
(2,'2023-05-20','19:00:00'),
(3,'2023-05-20','20:00:00'),
(4,'2023-05-21','18:30:00'),
(5,'2023-05-21','19:30:00'),
(6,'2023-05-21','20:30:00'),
(7,'2023-05-22','19:00:00'),
(8,'2023-05-22','20:00:00'),
(9,'2023-05-22','21:00:00'),
(10,'2023-05-23','18:00:00'),
(11,'2023-05-23','19:00:00'),
(12,'2023-05-23','20:00:00'),
(13,'2023-05-24','18:30:00'),
(14,'2023-05-24','19:30:00'),
(15,'2023-05-24','20:30:00');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredientes` (
  `idIngrediente` int(11) NOT NULL AUTO_INCREMENT,
  `NombreIngrediente` varchar(100) NOT NULL,
  `StockIngrediente` int(11) NOT NULL,
  `idUnidad` int(11) NOT NULL,
  PRIMARY KEY (`idIngrediente`),
  KEY `idUnidad` (`idUnidad`),
  CONSTRAINT `ingredientes_ibfk_1` FOREIGN KEY (`idUnidad`) REFERENCES `unidades` (`idUnidad`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES
(1,'Harina',500,1),
(2,'Azúcar',300,1),
(3,'Sal',200,2),
(4,'Leche',1000,3),
(5,'Agua',2000,4),
(6,'Aceite',500,3),
(7,'Mantequilla',200,1),
(8,'Huevos',50,5),
(9,'Levadura',100,2),
(10,'Pollo',1000,1),
(11,'Carne',800,1),
(12,'Pescado',600,1),
(13,'Arroz',1000,2),
(14,'Frijoles',500,1),
(15,'Maíz',300,1),
(16,'Tomate',400,1),
(17,'Cebolla',300,1),
(18,'Ajo',200,1),
(19,'Pimiento',200,1),
(20,'Zanahoria',300,1),
(21,'Papa',400,1),
(22,'Brócoli',300,1),
(23,'Calabacín',200,1),
(24,'Espinacas',200,1),
(25,'Queso',500,1),
(26,'Jamón',300,1),
(27,'Pan',400,1),
(28,'Mermelada',200,1),
(29,'Nuez',300,2),
(30,'Almendra',400,2),
(31,'Avellana',200,2),
(32,'Canela',100,5),
(33,'Vainilla',100,6),
(34,'Cacao',200,2),
(35,'Café',300,2),
(36,'Té',400,2),
(37,'Azúcar glass',100,1),
(38,'Pimienta',200,2),
(39,'Orégano',100,5),
(40,'Curry',100,5);
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientesproductos`
--

DROP TABLE IF EXISTS `ingredientesproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredientesproductos` (
  `idProducto` int(11) NOT NULL,
  `idIngrediente` int(11) NOT NULL,
  `Cantidad` decimal(5,3) NOT NULL,
  PRIMARY KEY (`idProducto`,`idIngrediente`),
  KEY `idIngrediente` (`idIngrediente`),
  CONSTRAINT `ingredientesproductos_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE,
  CONSTRAINT `ingredientesproductos_ibfk_2` FOREIGN KEY (`idIngrediente`) REFERENCES `ingredientes` (`idIngrediente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientesproductos`
--

LOCK TABLES `ingredientesproductos` WRITE;
/*!40000 ALTER TABLE `ingredientesproductos` DISABLE KEYS */;
INSERT INTO `ingredientesproductos` VALUES
(1,10,0.500),
(1,14,0.200),
(1,17,0.100),
(1,27,2.000),
(1,28,0.050),
(2,16,0.300),
(2,17,0.100),
(2,19,0.100),
(2,21,0.200),
(2,24,0.200),
(3,14,0.100),
(3,16,0.200),
(3,17,0.100),
(3,20,0.200),
(3,22,0.100),
(4,4,1.000),
(4,7,0.100),
(4,8,2.000),
(4,13,0.200),
(4,14,0.100),
(5,5,1.000),
(5,9,0.050),
(5,13,0.200),
(5,14,0.100),
(5,15,0.100),
(6,6,0.100),
(6,8,1.000),
(6,14,0.100),
(6,17,0.100),
(6,21,0.200),
(7,7,0.100),
(7,8,2.000),
(7,14,0.100),
(7,16,0.200),
(7,21,0.200),
(8,8,1.000),
(8,9,0.100),
(8,13,0.100),
(8,14,0.100),
(8,27,2.000),
(9,14,0.200),
(9,17,0.100),
(9,19,0.100),
(9,21,0.200),
(9,23,0.100),
(10,10,0.500),
(10,14,0.200),
(10,16,0.200),
(10,17,0.100),
(10,21,0.200),
(11,11,0.500),
(11,14,0.200),
(11,16,0.200),
(11,17,0.100),
(11,21,0.200),
(12,12,0.500),
(12,14,0.200),
(12,16,0.200),
(12,17,0.100),
(12,21,0.200),
(13,13,0.500),
(13,14,0.200),
(13,16,0.200),
(13,17,0.100),
(13,21,0.200),
(14,14,0.200),
(14,16,0.200),
(14,17,0.100),
(14,18,0.100),
(14,19,0.100),
(15,13,0.200),
(15,14,0.100),
(15,15,0.100),
(15,16,0.100),
(15,20,0.200),
(16,10,0.300),
(16,14,0.200),
(16,16,0.200),
(16,17,0.100),
(16,21,0.200),
(17,17,0.100),
(17,18,0.100),
(17,21,0.200),
(17,22,0.100),
(17,23,0.100),
(18,14,0.200),
(18,16,0.200),
(18,17,0.100),
(18,21,0.200),
(18,25,0.200),
(19,13,0.200),
(19,14,0.100),
(19,16,0.100),
(19,17,0.100),
(19,19,0.100),
(20,14,0.200),
(20,16,0.200),
(20,17,0.100),
(20,20,0.200),
(20,21,0.200),
(21,14,0.200),
(21,16,0.200),
(21,17,0.100),
(21,21,0.200),
(21,22,0.100),
(22,14,0.200),
(22,16,0.200),
(22,17,0.100),
(22,21,0.200),
(22,24,0.100),
(23,14,0.200),
(23,16,0.200),
(23,17,0.100),
(23,21,0.200),
(23,26,0.100);
/*!40000 ALTER TABLE `ingredientesproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesas` (
  `NumMesa` int(11) NOT NULL AUTO_INCREMENT,
  `Capacidad` int(11) NOT NULL,
  `Disponible` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`NumMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES
(1,4,1),
(2,2,1),
(3,5,1),
(4,3,1),
(5,2,1),
(6,4,1),
(7,5,1),
(8,3,1),
(9,2,1),
(10,4,1),
(11,5,1),
(12,3,1),
(13,2,1),
(14,4,1),
(15,5,1),
(16,3,1),
(17,2,1),
(18,4,1),
(19,5,1),
(20,3,1),
(21,2,1),
(22,4,1),
(23,5,1);
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meseros`
--

DROP TABLE IF EXISTS `meseros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meseros` (
  `idMesero` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `ApellidoPaterno` varchar(100) NOT NULL,
  `ApellidoMaterno` varchar(100) NOT NULL,
  `Salario` decimal(10,2) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idMesero`),
  UNIQUE KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `meseros_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meseros`
--

LOCK TABLES `meseros` WRITE;
/*!40000 ALTER TABLE `meseros` DISABLE KEYS */;
INSERT INTO `meseros` VALUES
(1,'Ana','Mendoza','Gomez',8000.00,44),
(2,'Carlos','Silva','Lopez',7500.00,45),
(3,'Diana','Rodriguez','Hernandez',7000.00,46),
(4,'Manuel','Gonzalez','Lopez',6500.00,47),
(5,'Paula','Lopez','Hernandez',6000.00,48),
(6,'Roberto','Hernandez','Gomez',5500.00,49),
(7,'Sara','Gomez','Lopez',5000.00,50),
(8,'Victor','Ramirez','Hernandez',4500.00,51),
(9,'Ximena','Ortega','Gomez',4000.00,52),
(10,'Yahir','Santos','Lopez',3500.00,53);
/*!40000 ALTER TABLE `meseros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodospagos`
--

DROP TABLE IF EXISTS `metodospagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodospagos` (
  `idMetodoPago` int(11) NOT NULL AUTO_INCREMENT,
  `MetodoPago` varchar(50) NOT NULL,
  PRIMARY KEY (`idMetodoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodospagos`
--

LOCK TABLES `metodospagos` WRITE;
/*!40000 ALTER TABLE `metodospagos` DISABLE KEYS */;
INSERT INTO `metodospagos` VALUES
(1,'Tarjeta de debito'),
(2,'Tarjeta de credito'),
(3,'Efectivo');
/*!40000 ALTER TABLE `metodospagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `idMunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `Municipio` varchar(100) NOT NULL,
  `idEstado` int(11) NOT NULL,
  PRIMARY KEY (`idMunicipio`),
  KEY `idEstado` (`idEstado`),
  CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES
(1,'Aguascalientes',1),
(2,'Tijuana',2),
(3,'La Paz',3),
(4,'Campeche',4),
(5,'Saltillo',5),
(6,'Colima',6),
(7,'Tuxtla Gutiérrez',7),
(8,'Chihuahua',8),
(9,'Ciudad de México',9),
(10,'Durango',10),
(11,'Guanajuato',11),
(12,'Chilpancingo',12),
(13,'Pachuca',13),
(14,'Guadalajara',14),
(15,'Toluca',15),
(16,'Morelia',16),
(17,'Cuernavaca',17),
(18,'Tepic',18),
(19,'Monterrey',19),
(20,'Oaxaca',20),
(21,'Puebla',21),
(22,'Querétaro',22),
(23,'Cancún',23),
(24,'San Luis Potosí',24),
(25,'Comala',6);
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `NumTransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `MontoTotal` decimal(10,2) NOT NULL,
  `idMetodoPago` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  PRIMARY KEY (`NumTransaccion`),
  KEY `idMetodoPago` (`idMetodoPago`),
  KEY `idPedido` (`idPedido`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`idMetodoPago`) REFERENCES `metodospagos` (`idMetodoPago`) ON DELETE CASCADE,
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES
(1,100.00,1,1),
(2,150.50,2,2),
(3,75.25,1,3),
(4,200.00,2,4),
(5,120.75,1,5),
(6,80.50,2,6),
(7,180.25,1,7),
(8,90.00,2,8),
(9,110.50,1,9),
(10,250.75,2,10),
(11,130.00,1,11),
(12,70.50,2,12),
(13,160.25,1,13),
(14,95.00,2,14),
(15,140.50,1,15),
(16,180.75,2,16),
(17,200.00,1,17),
(18,115.50,2,18),
(19,90.25,1,19),
(20,210.00,2,20),
(21,80.75,1,21),
(22,175.50,2,22),
(23,120.25,1,23);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `FechaPedido` date NOT NULL,
  `HoraPedido` time NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES
(1,1,'2023-05-20','10:00:00'),
(2,2,'2023-05-20','11:30:00'),
(3,3,'2023-05-20','13:15:00'),
(4,4,'2023-05-21','18:30:00'),
(5,5,'2023-05-21','19:45:00'),
(6,6,'2023-05-21','20:30:00'),
(7,7,'2023-05-22','12:00:00'),
(8,8,'2023-05-22','14:30:00'),
(9,9,'2023-05-22','16:45:00'),
(10,10,'2023-05-23','17:00:00'),
(11,11,'2023-05-23','18:15:00'),
(12,12,'2023-05-23','19:30:00'),
(13,13,'2023-05-24','10:30:00'),
(14,14,'2023-05-24','12:45:00'),
(15,15,'2023-05-24','14:00:00'),
(16,16,'2023-05-25','19:00:00'),
(17,17,'2023-05-25','20:15:00'),
(18,18,'2023-05-25','21:30:00'),
(19,19,'2023-05-26','16:00:00'),
(20,20,'2023-05-26','17:45:00'),
(21,21,'2023-05-26','19:30:00'),
(22,22,'2023-05-27','13:30:00'),
(23,23,'2023-05-27','15:45:00');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosenlinea`
--

DROP TABLE IF EXISTS `pedidosenlinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidosenlinea` (
  `idPedido` int(11) NOT NULL,
  `EstadoOrden` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  UNIQUE KEY `idPedido` (`idPedido`,`EstadoOrden`),
  CONSTRAINT `pedidosenlinea_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosenlinea`
--

LOCK TABLES `pedidosenlinea` WRITE;
/*!40000 ALTER TABLE `pedidosenlinea` DISABLE KEYS */;
INSERT INTO `pedidosenlinea` VALUES
(1,1),
(2,1),
(5,0),
(7,0),
(9,0),
(10,1),
(12,1),
(13,1),
(15,0),
(16,1),
(18,1),
(19,0),
(20,0),
(21,1),
(23,0);
/*!40000 ALTER TABLE `pedidosenlinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidospresenciales`
--

DROP TABLE IF EXISTS `pedidospresenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidospresenciales` (
  `idPedido` int(11) NOT NULL,
  `NumMesa` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`,`NumMesa`),
  KEY `NumMesa` (`NumMesa`),
  CONSTRAINT `pedidospresenciales_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON DELETE CASCADE,
  CONSTRAINT `pedidospresenciales_ibfk_2` FOREIGN KEY (`NumMesa`) REFERENCES `mesas` (`NumMesa`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidospresenciales`
--

LOCK TABLES `pedidospresenciales` WRITE;
/*!40000 ALTER TABLE `pedidospresenciales` DISABLE KEYS */;
INSERT INTO `pedidospresenciales` VALUES
(3,2),
(4,8),
(6,14),
(8,6),
(11,17),
(14,11),
(17,3),
(22,9);
/*!40000 ALTER TABLE `pedidospresenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosrepartidores`
--

DROP TABLE IF EXISTS `pedidosrepartidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidosrepartidores` (
  `idPedido` int(11) NOT NULL,
  `idRepartidor` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idRepartidor` (`idRepartidor`),
  CONSTRAINT `pedidosrepartidores_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON DELETE CASCADE,
  CONSTRAINT `pedidosrepartidores_ibfk_2` FOREIGN KEY (`idRepartidor`) REFERENCES `repartidores` (`idRepartidor`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosrepartidores`
--

LOCK TABLES `pedidosrepartidores` WRITE;
/*!40000 ALTER TABLE `pedidosrepartidores` DISABLE KEYS */;
INSERT INTO `pedidosrepartidores` VALUES
(23,1),
(12,2),
(19,2),
(1,3),
(7,3),
(13,4),
(18,4),
(10,5),
(16,5),
(9,6),
(21,6),
(20,7),
(5,8),
(15,9),
(2,10);
/*!40000 ALTER TABLE `pedidosrepartidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `NombreProducto` varchar(255) NOT NULL,
  `Comida` tinyint(4) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Descripcion` text NOT NULL,
  `Imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(1,'Torta de pollo',1,50.00,'Deliciosa torta de pollo','torta_pollo.jpg'),
(2,'Ensalada César',1,40.00,'Fresca ensalada César','ensalada_cesar.jpg'),
(3,'Sopa de verduras',1,35.00,'Caliente sopa de verduras','sopa_verduras.jpg'),
(4,'Pasta Alfredo',1,55.00,'Rica pasta alfredo','pasta_alfredo.jpg'),
(5,'Hamburguesa clásica',1,60.00,'Sabrosa hamburguesa clásica','hamburguesa_clasica.jpg'),
(6,'Pizza margarita',1,65.00,'Deliciosa pizza margarita','pizza_margarita.jpg'),
(7,'Tacos al pastor',1,45.00,'Sabrosos tacos al pastor','tacos_pastor.jpg'),
(8,'Ceviche de pescado',1,70.00,'Refrescante ceviche de pescado','ceviche_pescado.jpg'),
(9,'Enchiladas verdes',1,55.00,'Sabrosas enchiladas verdes','enchiladas_verdes.jpg'),
(10,'Pastel de chocolate',1,80.00,'Delicioso pastel de chocolate','pastel_chocolate.jpg'),
(11,'Galletas de avena',1,30.00,'Crujientes galletas de avena','galletas_avena.jpg'),
(12,'Smoothie de frutas',0,45.00,'Refrescante smoothie de frutas','smoothie_frutas.jpg'),
(13,'Café americano',0,25.00,'Tradicional café americano','cafe_americano.jpg'),
(14,'Té verde',0,20.00,'Relajante té verde','te_verde.jpg'),
(15,'Jugo de naranja',0,30.00,'Refrescante jugo de naranja','jugo_naranja.jpg'),
(16,'Refresco de cola',0,35.00,'Clásico refresco de cola','refresco_cola.jpg'),
(17,'Malteada de vainilla',0,50.00,'Deliciosa malteada de vainilla','malteada_vainilla.jpg'),
(18,'Cerveza artesanal',0,60.00,'Cerveza artesanal de calidad','cerveza_artesanal.jpg'),
(19,'Vino tinto',0,75.00,'Elegante vino tinto','vino_tinto.jpg'),
(20,'Coctel Margarita',0,65.00,'Refrescante coctel Margarita','coctel_margarita.jpg'),
(21,'Whisky',0,90.00,'Whisky de alta calidad','whisky.jpg'),
(22,'Agua mineral',0,15.00,'Agua mineral natural','agua_mineral.jpg'),
(23,'Limonada',0,30.00,'Refrescante limonada casera','limonada.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productospedidos`
--

DROP TABLE IF EXISTS `productospedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productospedidos` (
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `CantidadProducto` int(11) NOT NULL,
  `Comentarios` text DEFAULT NULL,
  PRIMARY KEY (`idPedido`,`idProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `productospedidos_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON DELETE CASCADE,
  CONSTRAINT `productospedidos_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productospedidos`
--

LOCK TABLES `productospedidos` WRITE;
/*!40000 ALTER TABLE `productospedidos` DISABLE KEYS */;
INSERT INTO `productospedidos` VALUES
(1,1,1,'Sin comentarios'),
(1,2,2,'Extra aderezo'),
(1,3,1,'Sin cebolla'),
(1,4,1,'Con salsa extra'),
(2,5,2,'Sin tomate'),
(2,6,1,'Delgada'),
(2,7,3,'Picante'),
(2,8,1,'Con limón'),
(3,9,2,'Sin queso'),
(3,10,1,'Con mayonesa'),
(3,11,1,'Extra crujientes'),
(3,12,2,'Con hielo'),
(4,13,1,'Descafeinado'),
(4,14,2,'Con miel'),
(4,15,1,'Sin hielo'),
(4,16,3,'Extra grande'),
(5,17,2,'Con crema batida'),
(5,18,1,'Frío'),
(5,19,1,'Añejado'),
(5,20,2,'Sin sal'),
(6,21,1,'Con sal'),
(6,22,2,'Con hielo'),
(6,23,1,'Sin azúcar'),
(7,1,2,'Sin mayonesa'),
(7,2,1,'Extra crutones'),
(7,3,1,'Caliente'),
(7,4,2,'Con salsa picante'),
(8,5,1,'Con queso cheddar'),
(8,6,2,'Con extra tomate'),
(8,7,1,'Picante moderado'),
(8,8,3,'Con limón y cilantro'),
(9,9,2,'Sin salsa'),
(9,10,1,'Con guacamole'),
(9,11,1,'Extra picante'),
(9,12,2,'Con hielo triturado'),
(10,13,1,'Con leche'),
(10,14,2,'Con azúcar moreno'),
(10,15,1,'Con hielo'),
(10,16,3,'En vaso grande'),
(11,17,2,'Con crema batida'),
(11,18,1,'Frío'),
(11,19,1,'Añejado'),
(11,20,2,'Con sal'),
(12,21,1,'Con hielo'),
(12,22,2,'Con soda'),
(12,23,1,'Con azúcar'),
(13,1,2,'Sin mayonesa'),
(13,2,1,'Extra crutones'),
(13,3,1,'Caliente'),
(13,4,2,'Con salsa picante'),
(14,5,1,'Con queso cheddar'),
(14,6,2,'Con extra tomate'),
(14,7,1,'Picante moderado'),
(14,8,3,'Con limón y cilantro'),
(15,9,2,'Sin salsa'),
(15,10,1,'Con guacamole'),
(15,11,1,'Extra picante'),
(15,12,2,'Con hielo triturado'),
(16,13,1,'Con leche'),
(16,14,2,'Con azúcar moreno'),
(16,15,1,'Con hielo'),
(16,16,3,'En vaso grande'),
(17,17,2,'Con crema batida'),
(17,18,1,'Frío'),
(17,19,1,'Añejado'),
(17,20,2,'Con sal'),
(18,21,1,'Con hielo'),
(18,22,2,'Con soda'),
(18,23,1,'Con azúcar'),
(19,1,2,'Sin mayonesa'),
(19,2,1,'Extra crutones'),
(19,3,1,'Caliente'),
(19,4,2,'Con salsa picante'),
(20,5,1,'Con queso cheddar'),
(20,6,2,'Con extra tomate'),
(20,7,1,'Picante moderado'),
(20,8,3,'Con limón y cilantro'),
(21,9,2,'Sin salsa'),
(21,10,1,'Con guacamole'),
(21,11,1,'Extra picante'),
(21,12,2,'Con hielo triturado'),
(22,13,1,'Con leche'),
(22,14,2,'Con azúcar moreno'),
(22,15,1,'Con hielo'),
(22,16,3,'En vaso grande'),
(23,17,2,'Con crema batida'),
(23,18,1,'Frío'),
(23,19,1,'Añejado'),
(23,20,2,'Con sal');
/*!40000 ALTER TABLE `productospedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartidores`
--

DROP TABLE IF EXISTS `repartidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repartidores` (
  `idRepartidor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `ApellidoPaterno` varchar(100) NOT NULL,
  `ApellidoMaterno` varchar(100) NOT NULL,
  `Salario` decimal(10,2) NOT NULL,
  `MatriculaVehiculo` varchar(20) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idRepartidor`),
  UNIQUE KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `repartidores_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
INSERT INTO `repartidores` VALUES
(1,'Carolina','Mora','Gonzalez',10000.00,'RVG123',34),
(2,'Fernando','Rojas','Hernandez',9500.00,'FRH456',35),
(3,'Mariana','Ortiz','Gomez',9000.00,'MOG789',36),
(4,'Raul','Gallegos','Lopez',8500.00,'RGL012',37),
(5,'Ana','Lopez','Hernandez',8000.00,'ALH345',38),
(6,'Eduardo','Mendoza','Gomez',7500.00,'EMG678',39),
(7,'Marisol','Silva','Lopez',7000.00,'MSL901',40),
(8,'Rodrigo','Castillo','Hernandez',6500.00,'RCH234',41),
(9,'Isabel','Santos','Gomez',6000.00,'ISG567',42),
(10,'Ricardo','Ramirez','Lopez',5500.00,'RRL890',43);
/*!40000 ALTER TABLE `repartidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservaciones`
--

DROP TABLE IF EXISTS `reservaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservaciones` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `CantidadPersonas` int(11) NOT NULL,
  `Comentarios` text DEFAULT NULL,
  `idHorario` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `Confirmada` tinyint(1) NOT NULL,
  PRIMARY KEY (`idReserva`),
  UNIQUE KEY `idHorario` (`idHorario`,`idCliente`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`idHorario`) ON DELETE CASCADE,
  CONSTRAINT `reservaciones_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaciones`
--

LOCK TABLES `reservaciones` WRITE;
/*!40000 ALTER TABLE `reservaciones` DISABLE KEYS */;
INSERT INTO `reservaciones` VALUES
(1,4,'Ninguno',1,1,1),
(2,8,'Preferimos una mesa cerca de la ventana',2,2,1),
(3,6,'Celebración de cumpleaños',3,3,0),
(4,5,'Sin comentarios',4,4,1),
(5,10,'Reunión de negocios',5,5,1),
(6,3,'Mesa para dos personas',6,6,0),
(7,7,'Necesitamos una silla adicional',7,7,1),
(8,5,'Sin comentarios',8,8,1),
(9,9,'Celebración familiar',9,9,0),
(10,4,'Sin comentarios',10,10,1),
(11,6,'Preferimos una mesa en el jardín',11,11,1),
(12,8,'Cumpleaños sorpresa',12,12,0);
/*!40000 ALTER TABLE `reservaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservasmesas`
--

DROP TABLE IF EXISTS `reservasmesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservasmesas` (
  `NumMesa` int(11) NOT NULL,
  `idReserva` int(11) NOT NULL,
  PRIMARY KEY (`NumMesa`,`idReserva`),
  KEY `idReserva` (`idReserva`),
  CONSTRAINT `reservasmesas_ibfk_1` FOREIGN KEY (`NumMesa`) REFERENCES `mesas` (`NumMesa`) ON DELETE CASCADE,
  CONSTRAINT `reservasmesas_ibfk_2` FOREIGN KEY (`idReserva`) REFERENCES `reservaciones` (`idReserva`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservasmesas`
--

LOCK TABLES `reservasmesas` WRITE;
/*!40000 ALTER TABLE `reservasmesas` DISABLE KEYS */;
INSERT INTO `reservasmesas` VALUES
(1,1),
(2,1),
(3,2),
(4,3),
(5,3),
(6,4),
(7,5),
(8,5),
(9,6),
(10,7),
(11,7),
(12,8),
(13,9),
(14,9),
(15,10),
(16,11),
(17,11),
(18,12);
/*!40000 ALTER TABLE `reservasmesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjetas` (
  `idTarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroTarjeta` varchar(16) NOT NULL,
  `FechaVencimiento` date NOT NULL,
  `Titular` varchar(255) NOT NULL,
  PRIMARY KEY (`idTarjeta`),
  UNIQUE KEY `NumeroTarjeta` (`NumeroTarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetas`
--

LOCK TABLES `tarjetas` WRITE;
/*!40000 ALTER TABLE `tarjetas` DISABLE KEYS */;
INSERT INTO `tarjetas` VALUES
(1,'1234567890123456','2025-12-01','Juan Perez'),
(2,'9876543210987654','2024-06-01','Maria Rodriguez'),
(3,'4567890123456789','2023-10-01','Pedro Gomez'),
(4,'6543210987654321','2025-03-01','Laura Hernandez'),
(5,'7890123456789012','2024-08-01','Carlos Sanchez'),
(6,'2345678901234567','2023-05-01','Ana Torres'),
(7,'5432109876543210','2025-11-01','Diego Ramirez'),
(8,'8901234567890123','2024-04-01','Sofia Castro'),
(9,'4321098765432109','2023-09-01','Luisa Fernandez'),
(10,'3210987654321098','2025-02-01','Daniel Morales'),
(11,'2109876543210987','2024-07-01','Carolina Lopez'),
(12,'6789012345678901','2023-12-01','Roberto Ortiz'),
(13,'9876543210123456','2025-06-01','Laura Chavez'),
(14,'7654321098765432','2024-01-01','Fernando Vargas'),
(15,'5432109876543211','2023-07-01','Isabel Castro');
/*!40000 ALTER TABLE `tarjetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetaspagos`
--

DROP TABLE IF EXISTS `tarjetaspagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjetaspagos` (
  `idTarjeta` int(11) NOT NULL,
  `idPago` int(11) NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `idTarjeta` (`idTarjeta`),
  CONSTRAINT `tarjetaspagos_ibfk_1` FOREIGN KEY (`idTarjeta`) REFERENCES `tarjetas` (`idTarjeta`) ON DELETE CASCADE,
  CONSTRAINT `tarjetaspagos_ibfk_2` FOREIGN KEY (`idPago`) REFERENCES `pagos` (`NumTransaccion`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetaspagos`
--

LOCK TABLES `tarjetaspagos` WRITE;
/*!40000 ALTER TABLE `tarjetaspagos` DISABLE KEYS */;
INSERT INTO `tarjetaspagos` VALUES
(1,1),
(2,2),
(3,4),
(4,6),
(5,8),
(6,10),
(7,12),
(8,14),
(9,16),
(10,18),
(11,20),
(12,22),
(13,3),
(14,5),
(15,7);
/*!40000 ALTER TABLE `tarjetaspagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `TipoUsuario` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES
(1,'Administrador'),
(2,'Chef'),
(3,'Mesero'),
(4,'Repartidor'),
(5,'Cliente');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades` (
  `idUnidad` int(11) NOT NULL AUTO_INCREMENT,
  `TipoUnidad` varchar(50) NOT NULL,
  PRIMARY KEY (`idUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES
(1,'Kilogramo'),
(2,'Gramo'),
(3,'Litro'),
(4,'Mililitro'),
(5,'Cucharada'),
(6,'Cucharadita');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Correo` varchar(100) NOT NULL,
  `Contrasenia` varchar(350) NOT NULL,
  `Imagen` varchar(100) DEFAULT NULL,
  `idTipoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idTipoUsuario` (`idTipoUsuario`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'johndoe@example.com','pbkdf2:sha256:600000$k3ky4NCOQBFxkN5y$180f5166bf9d0c8657853de6c437da070060c612561e532e91653d93edf3fecf','nombreImagen.jpg',5),
(2,'janedoe@example.com','pbkdf2:sha256:600000$PueCNhCf1h5bQlE0$46cc3d0fb25267b3e27f911d3038d9ac2b894ae9b4a0bbf7957e96a4075bf23c','nombreImagen.jpg',5),
(3,'mike.smith@example.com','pbkdf2:sha256:600000$gNfbWI9GXLtumDFV$efab14a9149992d8bd89b3f973d8130ae6c0b19ee535390b5d38943ce25899f1','nombreImagen.jpg',5),
(4,'lisa.jones@example.com','pbkdf2:sha256:600000$tC2hVdDL8E4C2zpW$70edcfad750b274740da9e71325d6b59f4cfc130a18da9408981dcf3d8d8d9b0','nombreImagen.jpg',5),
(5,'emily.wilson@example.com','pbkdf2:sha256:600000$k3ky4NCOQBFxkN5y$180f5166bf9d0c8657853de6c437da070060c612561e532e91653d93edf3fecf','nombreImagen.jpg',5),
(6,'alexander.brown@example.com','pbkdf2:sha256:600000$PueCNhCf1h5bQlE0$46cc3d0fb25267b3e27f911d3038d9ac2b894ae9b4a0bbf7957e96a4075bf23c','nombreImagen.jpg',5),
(7,'olivia.moore@example.com','pbkdf2:sha256:600000$gNfbWI9GXLtumDFV$efab14a9149992d8bd89b3f973d8130ae6c0b19ee535390b5d38943ce25899f1','nombreImagen.jpg',5),
(8,'william.davis@example.com','pbkdf2:sha256:600000$tC2hVdDL8E4C2zpW$70edcfad750b274740da9e71325d6b59f4cfc130a18da9408981dcf3d8d8d9b0','nombreImagen.jpg',5),
(9,'sophia.thomas@example.com','pbkdf2:sha256:600000$k3ky4NCOQBFxkN5y$180f5166bf9d0c8657853de6c437da070060c612561e532e91653d93edf3fecf','nombreImagen.jpg',5),
(10,'daniel.jackson@example.com','pbkdf2:sha256:600000$PueCNhCf1h5bQlE0$46cc3d0fb25267b3e27f911d3038d9ac2b894ae9b4a0bbf7957e96a4075bf23c','nombreImagen.jpg',5),
(11,'mia.anderson@example.com','pbkdf2:sha256:600000$gNfbWI9GXLtumDFV$efab14a9149992d8bd89b3f973d8130ae6c0b19ee535390b5d38943ce25899f1','nombreImagen.jpg',5),
(12,'benjamin.martin@example.com','pbkdf2:sha256:600000$tC2hVdDL8E4C2zpW$70edcfad750b274740da9e71325d6b59f4cfc130a18da9408981dcf3d8d8d9b0','nombreImagen.jpg',5),
(13,'ava.rodriguez@example.com','pbkdf2:sha256:600000$k3ky4NCOQBFxkN5y$180f5166bf9d0c8657853de6c437da070060c612561e532e91653d93edf3fecf','nombreImagen.jpg',5),
(14,'samuel.clark@example.com','pbkdf2:sha256:600000$PueCNhCf1h5bQlE0$46cc3d0fb25267b3e27f911d3038d9ac2b894ae9b4a0bbf7957e96a4075bf23c','nombreImagen.jpg',5),
(15,'chloe.lewis@example.com','pbkdf2:sha256:600000$gNfbWI9GXLtumDFV$efab14a9149992d8bd89b3f973d8130ae6c0b19ee535390b5d38943ce25899f1','nombreImagen.jpg',5),
(16,'oliver.hill@example.com','pbkdf2:sha256:600000$tC2hVdDL8E4C2zpW$70edcfad750b274740da9e71325d6b59f4cfc130a18da9408981dcf3d8d8d9b0','nombreImagen.jpg',5),
(17,'grace.walker@example.com','pbkdf2:sha256:600000$k3ky4NCOQBFxkN5y$180f5166bf9d0c8657853de6c437da070060c612561e532e91653d93edf3fecf','nombreImagen.jpg',5),
(18,'jackson.green@example.com','pbkdf2:sha256:600000$PueCNhCf1h5bQlE0$46cc3d0fb25267b3e27f911d3038d9ac2b894ae9b4a0bbf7957e96a4075bf23c','nombreImagen.jpg',5),
(19,'harper.adams@example.com','pbkdf2:sha256:600000$gNfbWI9GXLtumDFV$efab14a9149992d8bd89b3f973d8130ae6c0b19ee535390b5d38943ce25899f1','nombreImagen.jpg',5),
(20,'aiden.hall@example.com','pbkdf2:sha256:600000$tC2hVdDL8E4C2zpW$70edcfad750b274740da9e71325d6b59f4cfc130a18da9408981dcf3d8d8d9b0','nombreImagen.jpg',5),
(21,'scarlett.wright@example.com','pbkdf2:sha256:600000$k3ky4NCOQBFxkN5y$180f5166bf9d0c8657853de6c437da070060c612561e532e91653d93edf3fecf','nombreImagen.jpg',5),
(22,'lucas.harris@example.com','pbkdf2:sha256:600000$PueCNhCf1h5bQlE0$46cc3d0fb25267b3e27f911d3038d9ac2b894ae9b4a0bbf7957e96a4075bf23c','nombreImagen.jpg',5),
(23,'amelia.turner@example.com','pbkdf2:sha256:600000$gNfbWI9GXLtumDFV$efab14a9149992d8bd89b3f973d8130ae6c0b19ee535390b5d38943ce25899f1','nombreImagen.jpg',5),
(24,'roberto.gomez@example.com','pbkdf2:sha256:600000$wfy9cPXotWhemteP$033e7ddf61a82de8630b28184db8760d19a5fb1910bf0c0c58a69c855a2d9378','nombreImagen.jpg',2),
(25,'sergio.molina@example.com','pbkdf2:sha256:600000$KehV354J2JEQYciF$62d828f14d516abebbf110cb3c634fc52196e179e920c783882af4a431578926','nombreImagen.jpg',2),
(26,'luisa.rivera@example.com','pbkdf2:sha256:600000$E97ImG5WCBdLG9QI$c059d28e350f8c990043f0a9b6dfb75fa2d32f97eeb47a6980bf8323ab277f2a','nombreImagen.jpg',2),
(27,'carlos.lopez@example.com','pbkdf2:sha256:600000$tV0K0Y3HceH5158a$9feec28c289b63d504b9b58174a229e40eba51039bae4de3f3d4aec9ec055f48','nombreImagen.jpg',2),
(28,'patricia.fernandez@example.com','pbkdf2:sha256:600000$wfy9cPXotWhemteP$033e7ddf61a82de8630b28184db8760d19a5fb1910bf0c0c58a69c855a2d9378','nombreImagen.jpg',2),
(29,'javier.hernandez@example.com','pbkdf2:sha256:600000$KehV354J2JEQYciF$62d828f14d516abebbf110cb3c634fc52196e179e920c783882af4a431578926','nombreImagen.jpg',2),
(30,'andrea.gonzalez@example.com','pbkdf2:sha256:600000$E97ImG5WCBdLG9QI$c059d28e350f8c990043f0a9b6dfb75fa2d32f97eeb47a6980bf8323ab277f2a','nombreImagen.jpg',2),
(31,'oscar.sanchez@example.com','pbkdf2:sha256:600000$tV0K0Y3HceH5158a$9feec28c289b63d504b9b58174a229e40eba51039bae4de3f3d4aec9ec055f48','nombreImagen.jpg',2),
(32,'monica.ortega@example.com','pbkdf2:sha256:600000$wfy9cPXotWhemteP$033e7ddf61a82de8630b28184db8760d19a5fb1910bf0c0c58a69c855a2d9378','nombreImagen.jpg',2),
(33,'alejandro.martinez@example.com','pbkdf2:sha256:600000$KehV354J2JEQYciF$62d828f14d516abebbf110cb3c634fc52196e179e920c783882af4a431578926','nombreImagen.jpg',2),
(34,'carolina.mora@example.com','pbkdf2:sha256:600000$wfy9cPXotWhemteP$033e7ddf61a82de8630b28184db8760d19a5fb1910bf0c0c58a69c855a2d9378','nombreImagen.jpg',4),
(35,'fernando.rojas@example.com','pbkdf2:sha256:600000$KehV354J2JEQYciF$62d828f14d516abebbf110cb3c634fc52196e179e920c783882af4a431578926','nombreImagen.jpg',4),
(36,'mariana.ortiz@example.com','pbkdf2:sha256:600000$E97ImG5WCBdLG9QI$c059d28e350f8c990043f0a9b6dfb75fa2d32f97eeb47a6980bf8323ab277f2a','nombreImagen.jpg',4),
(37,'raul.gallegos@example.com','pbkdf2:sha256:600000$tV0K0Y3HceH5158a$9feec28c289b63d504b9b58174a229e40eba51039bae4de3f3d4aec9ec055f48','nombreImagen.jpg',4),
(38,'ana.lopez@example.com','pbkdf2:sha256:600000$wfy9cPXotWhemteP$033e7ddf61a82de8630b28184db8760d19a5fb1910bf0c0c58a69c855a2d9378','nombreImagen.jpg',4),
(39,'eduardo.mendoza@example.com','pbkdf2:sha256:600000$KehV354J2JEQYciF$62d828f14d516abebbf110cb3c634fc52196e179e920c783882af4a431578926','nombreImagen.jpg',4),
(40,'marisol.silva@example.com','pbkdf2:sha256:600000$E97ImG5WCBdLG9QI$c059d28e350f8c990043f0a9b6dfb75fa2d32f97eeb47a6980bf8323ab277f2a','nombreImagen.jpg',4),
(41,'rodrigo.castillo@example.com','pbkdf2:sha256:600000$tV0K0Y3HceH5158a$9feec28c289b63d504b9b58174a229e40eba51039bae4de3f3d4aec9ec055f48','nombreImagen.jpg',4),
(42,'isabel.santos@example.com','pbkdf2:sha256:600000$wfy9cPXotWhemteP$033e7ddf61a82de8630b28184db8760d19a5fb1910bf0c0c58a69c855a2d9378','nombreImagen.jpg',4),
(43,'ricardo.ramirez@example.com','pbkdf2:sha256:600000$KehV354J2JEQYciF$62d828f14d516abebbf110cb3c634fc52196e179e920c783882af4a431578926','nombreImagen.jpg',4),
(44,'ana.mendoza@example.com','pbkdf2:sha256:600000$wfy9cPXotWhemteP$033e7ddf61a82de8630b28184db8760d19a5fb1910bf0c0c58a69c855a2d9378','nombreImagen.jpg',3),
(45,'carlos.silva@example.com','pbkdf2:sha256:600000$KehV354J2JEQYciF$62d828f14d516abebbf110cb3c634fc52196e179e920c783882af4a431578926','nombreImagen.jpg',3),
(46,'diana.rodriguez@example.com','pbkdf2:sha256:600000$E97ImG5WCBdLG9QI$c059d28e350f8c990043f0a9b6dfb75fa2d32f97eeb47a6980bf8323ab277f2a','nombreImagen.jpg',3),
(47,'manuel.gonzalez@example.com','pbkdf2:sha256:600000$tV0K0Y3HceH5158a$9feec28c289b63d504b9b58174a229e40eba51039bae4de3f3d4aec9ec055f48','nombreImagen.jpg',3),
(48,'paula.lopez@example.com','pbkdf2:sha256:600000$wfy9cPXotWhemteP$033e7ddf61a82de8630b28184db8760d19a5fb1910bf0c0c58a69c855a2d9378','nombreImagen.jpg',3),
(49,'roberto.hernandez@example.com','pbkdf2:sha256:600000$KehV354J2JEQYciF$62d828f14d516abebbf110cb3c634fc52196e179e920c783882af4a431578926','nombreImagen.jpg',3),
(50,'sara.gomez@example.com','pbkdf2:sha256:600000$E97ImG5WCBdLG9QI$c059d28e350f8c990043f0a9b6dfb75fa2d32f97eeb47a6980bf8323ab277f2a','nombreImagen.jpg',3),
(51,'victor.ramirez@example.com','pbkdf2:sha256:600000$tV0K0Y3HceH5158a$9feec28c289b63d504b9b58174a229e40eba51039bae4de3f3d4aec9ec055f48','nombreImagen.jpg',3),
(52,'ximena.ortega@example.com','pbkdf2:sha256:600000$wfy9cPXotWhemteP$033e7ddf61a82de8630b28184db8760d19a5fb1910bf0c0c58a69c855a2d9378','nombreImagen.jpg',3),
(53,'yahir.santos@example.com','pbkdf2:sha256:600000$KehV354J2JEQYciF$62d828f14d516abebbf110cb3c634fc52196e179e920c783882af4a431578926','nombreImagen.jpg',3),
(54,'anakin@gmail.com','pbkdf2:sha256:600000$4sfVwmQKKtOIyAhw$61b773ee311b26b57c06b60c537364044348d125b39f7f91bf706c5b4f626f17','Cincos.jpg',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pro2'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalcularMontoPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalcularMontoPedido`(
  IN idPedido INT,
  OUT montoTotal DECIMAL(10, 2)
)
BEGIN
  DECLARE total DECIMAL(10, 2);

  
  SELECT COUNT(*) INTO @pedidoExiste
  FROM ProductosPedidos
  WHERE idPedido = idPedido;

  IF @pedidoExiste = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El idPedido especificado no existe en la tabla ProductosPedidos.';
  END IF;

  
  SELECT SUM(pp.CantidadProducto * p.Precio) INTO total
  FROM ProductosPedidos pp
  INNER JOIN Productos p ON pp.idProducto = p.idProducto
  WHERE pp.idPedido = idPedido;

  SET montoTotal = total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalcularMontoTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalcularMontoTotal`(IN _idUsuario INT)
BEGIN
    DECLARE _idCliente INT;
    DECLARE _idCarrito INT;
    DECLARE _montoTotal DECIMAL(10, 2);
    
    
    IF NOT EXISTS(SELECT 1 FROM Usuarios WHERE idUsuario = _idUsuario) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario no existe.';
    END IF;
    
    
    SELECT idCliente INTO _idCliente FROM Clientes WHERE idUsuario = _idUsuario;

    
    SELECT idCarrito INTO _idCarrito FROM Carritos WHERE idCliente = _idCliente;
    
    
    IF _idCarrito IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El cliente no tiene un carrito asociado.';
    END IF;
    
    
    SELECT SUM(p.Precio * dc.Cantidad) INTO _montoTotal
    FROM DetallesCarritos dc
    INNER JOIN Productos p ON dc.idProducto = p.idProducto
    WHERE dc.idCarrito = _idCarrito;
    
    
    SELECT _montoTotal AS MontoTotal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarCliente`(IN p_idUsuario INT)
BEGIN
    SELECT c.idCliente, c.Nombre, c.ApellidoPaterno, c.ApellidoMaterno, c.TelefonoContacto
    FROM Clientes c
    WHERE c.idUsuario = p_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarClientes`()
BEGIN
    SELECT c.idCliente, Nombre, ApellidoPaterno, ApellidoMaterno, u.correo, TelefonoContacto
    FROM Clientes as c inner join Usuarios as u;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarIdUsuarioFullname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarIdUsuarioFullname`(
    IN p_nombre VARCHAR(50),
    IN p_apellidoPaterno VARCHAR(50),
    IN p_apellidoMaterno VARCHAR(50)
)
BEGIN
    SELECT idUsuario
    FROM Chefs
    WHERE Nombre = p_nombre AND ApellidoPaterno = p_apellidoPaterno AND ApellidoMaterno = p_apellidoMaterno
    UNION
    SELECT idUsuario
    FROM Repartidores
    WHERE Nombre = p_nombre AND ApellidoPaterno = p_apellidoPaterno AND ApellidoMaterno = p_apellidoMaterno
    UNION
    SELECT idUsuario
    FROM Meseros
    WHERE Nombre = p_nombre AND ApellidoPaterno = p_apellidoPaterno AND ApellidoMaterno = p_apellidoMaterno;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarIdUsuarioIdCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarIdUsuarioIdCliente`(IN p_idCliente INT)
BEGIN
    SELECT idUsuario
    FROM Clientes
    WHERE idCliente = p_idCliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarIngredientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarIngredientes`()
BEGIN
    SELECT idIngrediente, NombreIngrediente, StockIngrediente, TipoUnidad
    FROM Ingredientes as A inner join Unidades as B on A.idUnidad = B.idUnidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarMesa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarMesa`(
    IN p_NumMesa INT
)
BEGIN
    DECLARE mesa_encontrada INT;

    
    SELECT COUNT(*) INTO mesa_encontrada
    FROM Mesas
    WHERE NumMesa = p_NumMesa;

    IF mesa_encontrada = 0 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'La mesa especificada no existe.';
    ELSE
        
        SELECT NumMesa, Capacidad, Disponible
        FROM Mesas
        WHERE NumMesa = p_NumMesa;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarMesas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarMesas`()
BEGIN
    SELECT NumMesa, Capacidad, Disponible
    FROM Mesas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarPedidosEnProceso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarPedidosEnProceso`(IN p_idUsuario INT)
BEGIN
    DECLARE v_idCliente INT;
    DECLARE v_idPedido INT;
    DECLARE v_fechaPedido DATE;
    DECLARE v_EstadoEntrega VARCHAR(50);
    
    
    SELECT idCliente INTO v_idCliente FROM Clientes WHERE idUsuario = p_idUsuario;
    
    
    IF v_idCliente IS NULL THEN
        
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró el cliente asociado al usuario.';
    ELSE
        
        SELECT p.idPedido, p.FechaPedido, p.HoraPedido, e.EstadoEntrega
        FROM Pedidos p
        INNER JOIN Entregas e ON p.idPedido = e.idPedido
        WHERE p.idCliente = v_idCliente AND e.EstadoEntrega = 'En camino';
        
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarPedidosEntregados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarPedidosEntregados`(IN p_idUsuario INT)
BEGIN
    DECLARE v_idCliente INT;
    DECLARE v_idPedido INT;
    DECLARE v_fechaPedido DATE;
    DECLARE v_EstadoEntrega VARCHAR(50);
    
    
    SELECT idCliente INTO v_idCliente FROM Clientes WHERE idUsuario = p_idUsuario;
    
    
    IF v_idCliente IS NULL THEN
        
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró el cliente asociado al usuario.';
    ELSE
        
        SELECT p.idPedido, p.FechaPedido, p.HoraPedido, e.EstadoEntrega
        FROM Pedidos p
        INNER JOIN Entregas e ON p.idPedido = e.idPedido
        WHERE p.idCliente = v_idCliente AND e.EstadoEntrega = 'Entregado';
        
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarPersonal`()
BEGIN
   SELECT
        U.idUsuario,
        CASE
            WHEN C.idChef IS NOT NULL THEN C.Nombre
            WHEN R.idRepartidor IS NOT NULL THEN R.Nombre
            WHEN M.idMesero IS NOT NULL THEN M.Nombre
        END AS Nombre,
        CASE
            WHEN C.idChef IS NOT NULL THEN C.ApellidoPaterno
            WHEN R.idRepartidor IS NOT NULL THEN R.ApellidoPaterno
            WHEN M.idMesero IS NOT NULL THEN M.ApellidoPaterno
        END AS ApellidoPaterno,
        CASE
            WHEN C.idChef IS NOT NULL THEN C.ApellidoMaterno
            WHEN R.idRepartidor IS NOT NULL THEN R.ApellidoMaterno
            WHEN M.idMesero IS NOT NULL THEN M.ApellidoMaterno
        END AS ApellidoMaterno,
        CASE
            WHEN C.idChef IS NOT NULL THEN C.Salario
            WHEN R.idRepartidor IS NOT NULL THEN R.Salario
            WHEN M.idMesero IS NOT NULL THEN M.Salario
        END AS Salario,
        U.Correo,
        T.TipoUsuario
    FROM
        Usuarios U
        JOIN TipoUsuario T ON U.idTipoUsuario = T.idTipoUsuario
        LEFT JOIN Chefs C ON U.idUsuario = C.idUsuario
        LEFT JOIN Repartidores R ON U.idUsuario = R.idUsuario
        LEFT JOIN Meseros M ON U.idUsuario = M.idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProductos`()
BEGIN
    SELECT idProducto, NombreProducto, Comida, Precio, Descripcion, Imagen
    FROM Productos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProductosCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProductosCarrito`(IN _idUsuario INT)
BEGIN
    DECLARE _idCliente INT;
    DECLARE _idCarrito INT;
    
    
    IF NOT EXISTS(SELECT 1 FROM Usuarios WHERE idUsuario = _idUsuario) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario no existe.';
    END IF;
    
    
    SELECT idCliente INTO _idCliente FROM Clientes WHERE idUsuario = _idUsuario;
    
    
    IF _idCliente IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El cliente no existe.';
    ELSE
        SELECT idCarrito INTO _idCarrito FROM Carritos WHERE idCliente = _idCliente;
        
        IF _idCarrito IS NULL THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'El cliente no tiene un carrito asociado.';
        ELSE
            
            SELECT dc.idDetalleCarrito, dc.idCarrito, dc.idProducto, dc.Cantidad, dc.Comentarios, p.NombreProducto, p.Precio, p.Imagen
            FROM DetallesCarritos dc
            INNER JOIN Productos p ON dc.idProducto = p.idProducto
            WHERE dc.idCarrito = _idCarrito;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProductosIngredientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProductosIngredientes`(IN p_idProducto INT)
BEGIN
    SELECT A.idIngrediente, NombreIngrediente, ip.Cantidad, TipoUnidad
    FROM ingredientesProductos as ip inner join Ingredientes as A inner join Unidades as B on A.idUnidad = B.idUnidad
    where A.idIngrediente in (
        select idIngrediente
        from ingredientesproductos
        where idProducto = p_idProducto
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarReservas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarReservas`()
BEGIN
    SELECT idReserva, CantidadPersonas, Comentarios, Fecha, Hora
    FROM Reservaciones as A inner join Horarios as B on A.idHorario = B.idHorario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarVentas`()
BEGIN
    SELECT NumTransaccion, MontoTotal, MetodoPago, idPedido
    FROM Pagos as P inner join metodosPagos as M on P.idMetodoPago = M.idMetodoPago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarCantidadProductoCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarCantidadProductoCarrito`(
  IN p_idDetalleCarrito INT,
  IN p_Cantidad INT,
  IN p_Suma INT
)
BEGIN
  DECLARE v_CantidadExistente INT;
  
  
  SELECT Cantidad INTO v_CantidadExistente
  FROM DetallesCarritos
  WHERE idDetalleCarrito = p_idDetalleCarrito;
  
  
  IF p_Suma = 1 THEN
    
    UPDATE DetallesCarritos
    SET Cantidad = Cantidad + p_Cantidad
    WHERE idDetalleCarrito = p_idDetalleCarrito;
    COMMIT;
  ELSE
    
    IF v_CantidadExistente - p_Cantidad > 0 THEN
      
      UPDATE DetallesCarritos
      SET Cantidad = Cantidad - p_Cantidad
      WHERE idDetalleCarrito = p_idDetalleCarrito;
      COMMIT;
    ELSE
      
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La operación de resta resultaría en una cantidad menor o igual a 0.';
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarCarrito`(
    IN p_idCarrito INT,
    IN p_idCliente INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Carritos WHERE idCarrito = p_idCarrito;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Carritos WHERE idCliente = p_idCliente AND idCarrito != p_idCarrito;

        IF num_rows = 0 THEN
            
            UPDATE Carritos SET
                idCliente = p_idCliente
            WHERE idCarrito = p_idCarrito;
        ELSE
            SELECT 'El idCliente ya está asociado a otro carrito.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idCarrito buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarChef` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarChef`(
    IN p_idChef INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_idEspecialidad INT,
    IN p_idUsuario INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Chefs WHERE idChef = p_idChef;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Chefs WHERE idUsuario = p_idUsuario AND idChef <> p_idChef;

        IF num_rows = 0 THEN
            
            UPDATE Chefs SET
                Nombre = p_Nombre,
                ApellidoPaterno = p_ApellidoPaterno,
                ApellidoMaterno = p_ApellidoMaterno,
                Salario = p_Salario,
                idEspecialidad = p_idEspecialidad,
                idUsuario = p_idUsuario
            WHERE idChef = p_idChef;
        ELSE
            SELECT 'El idUsuario ya está siendo utilizado por otro registro.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idChef buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarCliente`(
    IN p_idCliente INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_TelefonoContacto VARCHAR(20),
    IN p_idUsuario INT
)
BEGIN
    DECLARE num_rows INT;
    DECLARE error_msg TEXT;

    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END;

    
    SELECT COUNT(*) INTO num_rows FROM Clientes WHERE idCliente = p_idCliente;

    IF num_rows > 0 THEN
        SELECT COUNT(*) INTO num_rows FROM Clientes WHERE idUsuario = p_idUsuario AND idCliente != p_idCliente;

        IF num_rows = 0 THEN
            
            UPDATE Clientes SET
                Nombre = p_Nombre,
                ApellidoPaterno = p_ApellidoPaterno,
                ApellidoMaterno = p_ApellidoMaterno,
                TelefonoContacto = p_TelefonoContacto,
                idUsuario = p_idUsuario
            WHERE idCliente = p_idCliente;
            COMMIT;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El idUsuario ya está asociado a otro cliente';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró ningún registro con el idCliente buscado';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarColonia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarColonia`(
    IN p_idColonia INT,
    IN p_Colonia VARCHAR(100)
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Colonias WHERE idColonia = p_idColonia;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Colonias WHERE Colonia = p_Colonia AND idColonia <> p_idColonia;

        IF num_rows = 0 THEN
            
            UPDATE Colonias SET
                Colonia = p_Colonia
            WHERE idColonia = p_idColonia;
        ELSE
            SELECT 'La colonia ya existe en la base de datos.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idColonia buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarDetalleCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarDetalleCarrito`(
    IN p_idDetalleCarrito INT,
    IN p_idCarrito INT,
    IN p_idProducto INT,
    IN p_Cantidad INT,
    IN p_Comentarios TEXT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM DetallesCarritos WHERE idDetalleCarrito = p_idDetalleCarrito;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM DetallesCarritos WHERE idCarrito = p_idCarrito AND idProducto = p_idProducto AND idDetalleCarrito != p_idDetalleCarrito;

        IF num_rows = 0 THEN
            
            UPDATE DetallesCarritos SET
                idCarrito = p_idCarrito,
                idProducto = p_idProducto,
                Cantidad = p_Cantidad,
                Comentarios = p_Comentarios
            WHERE idDetalleCarrito = p_idDetalleCarrito;
        ELSE
            SELECT 'La combinación idCarrito-idProducto ya existe en otro detalle de carrito.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idDetalleCarrito buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarDireccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarDireccion`(
    IN p_idDireccion INT,
    IN p_idColonia INT,
    IN p_Calle VARCHAR(100),
    IN p_NumExterior VARCHAR(20),
    IN p_NumInterior VARCHAR(20),
    IN p_CodigoPostal VARCHAR(10)
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Direcciones WHERE idDireccion = p_idDireccion;

    IF num_rows > 0 THEN
        
        UPDATE Direcciones SET
            idColonia = p_idColonia,
            Calle = p_Calle,
            NumExterior = p_NumExterior,
            NumInterior = p_NumInterior,
            CodigoPostal = p_CodigoPostal
        WHERE idDireccion = p_idDireccion;
    ELSE
        SELECT 'No se encontró ningún registro con el idDireccion buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarEntrega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarEntrega`(
    IN p_idEntrega INT,
    IN p_EstadoEntrega VARCHAR(50),
    IN p_idPedido INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Entregas WHERE idEntrega = p_idEntrega;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Entregas WHERE idPedido = p_idPedido AND idEntrega != p_idEntrega;

        IF num_rows = 0 THEN
            
            UPDATE Entregas SET EstadoEntrega = p_EstadoEntrega, idPedido = p_idPedido WHERE idEntrega = p_idEntrega;
        ELSE
            SELECT 'La combinación de idPedido ya existe en otra entrega.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idEntrega buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarEspecialidad`(
    IN p_idEspecialidad INT,
    IN p_Especialidad VARCHAR(100)
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Especialidades WHERE idEspecialidad = p_idEspecialidad;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Especialidades WHERE Especialidad = p_Especialidad AND idEspecialidad <> p_idEspecialidad;

        IF num_rows = 0 THEN
            
            UPDATE Especialidades SET
                Especialidad = p_Especialidad
            WHERE idEspecialidad = p_idEspecialidad;
        ELSE
            SELECT 'La especialidad ya está siendo utilizada por otro registro.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idEspecialidad buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarEstado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarEstado`(
    IN p_idEstado INT,
    IN p_Estado VARCHAR(50)
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Estados WHERE idEstado = p_idEstado;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Estados WHERE Estado = p_Estado AND idEstado <> p_idEstado;

        IF num_rows = 0 THEN
            
            UPDATE Estados SET
                Estado = p_Estado
            WHERE idEstado = p_idEstado;
        ELSE
            SELECT 'El estado ya existe en la base de datos.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idEstado buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarHorario`(
    IN p_idHorario INT,
    IN p_Fecha DATE,
    IN p_Hora TIME
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Horarios WHERE idHorario = p_idHorario;

    IF num_rows > 0 THEN
        
        UPDATE Horarios SET Fecha = p_Fecha, Hora = p_Hora WHERE idHorario = p_idHorario;
        SELECT 'Registro actualizado correctamente.' AS mensaje;
    ELSE
        SELECT 'No se encontró ningún registro con el id buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarIngrediente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarIngrediente`(
    IN p_idIngrediente INT,
    IN p_NombreIngrediente VARCHAR(100),
    IN p_StockIngrediente INT,
    IN p_TipoUnidad VARCHAR(255)
)
BEGIN
    DECLARE num_rows INT;
    DECLARE var_idTipoUnidad INT;
    DECLARE error_msg TEXT;

    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END;

    SELECT idUnidad INTO var_idTipoUnidad
    FROM Unidades
    WHERE TipoUnidad = p_TipoUnidad;

    IF var_idTipoUnidad IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró el tipo de unidad ingresada';
    END IF;

    
    SELECT COUNT(*) INTO num_rows FROM Ingredientes WHERE idIngrediente = p_idIngrediente;

    IF num_rows > 0 THEN
        
        UPDATE Ingredientes SET
            NombreIngrediente = p_NombreIngrediente,
            StockIngrediente = p_StockIngrediente,
            idUnidad = var_idTipoUnidad
        WHERE idIngrediente = p_idIngrediente;
        SELECT p_idIngrediente;
        COMMIT;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró ningún registro con el idIngrediente buscado';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarIngredienteProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarIngredienteProducto`(
    IN p_idProducto INT,
    IN p_idIngrediente INT,
    IN p_Cantidad DECIMAL(5, 3),
    IN p_newIdIngrediente INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM IngredientesProductos WHERE idProducto = p_idProducto AND idIngrediente = p_idIngrediente;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM IngredientesProductos WHERE idProducto = p_idProducto AND idIngrediente = p_newIdIngrediente;

        IF num_rows = 0 OR (p_idIngrediente = p_newIdIngrediente) THEN
            
            UPDATE IngredientesProductos SET
                idIngrediente = p_newIdIngrediente,
                Cantidad = p_Cantidad
            WHERE idProducto = p_idProducto AND idIngrediente = p_idIngrediente;
        ELSE
            SELECT 'La tupla idProducto-newIdIngrediente ya existe en la tabla.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con la combinación idProducto-idIngrediente buscada.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarMesa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMesa`(
    IN p_NumMesa INT,
    IN p_Capacidad INT,
    IN p_Disponible INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Mesas WHERE NumMesa = p_NumMesa;

    IF num_rows > 0 THEN
        
        UPDATE Mesas SET Capacidad = p_Capacidad, Disponible = p_Disponible WHERE NumMesa = p_NumMesa;
        
        SELECT 'Registro actualizado correctamente.' AS mensaje;
        COMMIT;
    ELSE
        SELECT 'No se encontró ningún registro con el NumMesa buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarMesaReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMesaReserva`(
    IN p_NumMesa INT,
    IN p_idReserva INT,
    IN p_NuevoNumMesa INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM ReservasMesas WHERE NumMesa = p_NumMesa AND idReserva = p_idReserva;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM ReservasMesas WHERE NumMesa = p_NuevoNumMesa AND idReserva = p_idReserva AND (NumMesa != p_NumMesa OR idReserva != p_idReserva);

        IF num_rows = 0 THEN
            
            UPDATE ReservasMesas SET NumMesa = p_NuevoNumMesa WHERE NumMesa = p_NumMesa AND idReserva = p_idReserva;
            
            SELECT 'Registro actualizado correctamente.' AS mensaje;
        ELSE
            SELECT 'La combinación de NuevoNumMesa y idReserva ya existe en otra reserva de mesa.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el NumMesa e idReserva buscados.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarMesero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMesero`(
    IN p_idMesero INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_idUsuario INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Meseros WHERE idMesero = p_idMesero;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Meseros WHERE idUsuario = p_idUsuario AND idMesero <> p_idMesero;

        IF num_rows = 0 THEN
            
            UPDATE Meseros SET
                Nombre = p_Nombre,
                ApellidoPaterno = p_ApellidoPaterno,
                ApellidoMaterno = p_ApellidoMaterno,
                Salario = p_Salario,
                idUsuario = p_idUsuario
            WHERE idMesero = p_idMesero;
        ELSE
            SELECT 'El idUsuario ya está siendo utilizado por otro registro.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idMesero buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarMetodoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMetodoPago`(
    IN p_idMetodoPago INT,
    IN p_MetodoPago VARCHAR(50)
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM MetodosPagos WHERE idMetodoPago = p_idMetodoPago;

    IF num_rows > 0 THEN
        
        UPDATE MetodosPagos SET MetodoPago = p_MetodoPago WHERE idMetodoPago = p_idMetodoPago;
    ELSE
        SELECT 'No se encontró ningún registro con el idMetodoPago buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarMunicipio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMunicipio`(
    IN p_idMunicipio INT,
    IN p_Municipio VARCHAR(100)
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Municipios WHERE idMunicipio = p_idMunicipio;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Municipios WHERE Municipio = p_Municipio AND idMunicipio <> p_idMunicipio;

        IF num_rows = 0 THEN
            
            UPDATE Municipios SET
                Municipio = p_Municipio
            WHERE idMunicipio = p_idMunicipio;
        ELSE
            SELECT 'El municipio ya existe en la base de datos.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idMunicipio buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPago`(
    IN p_NumTransaccion INT,
    IN p_MontoTotal DECIMAL(10, 2),
    IN p_idMetodoPago INT,
    IN p_idPedido INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Pagos WHERE NumTransaccion = p_NumTransaccion;

    IF num_rows > 0 THEN
        
        UPDATE Pagos SET MontoTotal = p_MontoTotal, idMetodoPago = p_idMetodoPago, idPedido = p_idPedido WHERE NumTransaccion = p_NumTransaccion;
    ELSE
        SELECT 'No se encontró ningún registro con el NumTransaccion buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPedido`(
    IN p_idPedido INT,
    IN p_idCliente INT,
    IN p_FechaPedido DATE,
    IN p_HoraPedido TIME
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Pedidos WHERE idPedido = p_idPedido;

    IF num_rows > 0 THEN
        
        UPDATE Pedidos SET idCliente = p_idCliente, FechaPedido = p_FechaPedido, HoraPedido = p_HoraPedido WHERE idPedido = p_idPedido;
    ELSE
        SELECT 'No se encontró ningún registro con el id buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarPedidoEnLinea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPedidoEnLinea`(
    IN p_idPedido INT,
    IN p_EstadoOrden INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM PedidosEnLinea WHERE idPedido = p_idPedido;

    IF num_rows > 0 THEN
        
        UPDATE PedidosEnLinea SET EstadoOrden = p_EstadoOrden WHERE idPedido = p_idPedido;
    ELSE
        SELECT 'No se encontró ningún registro con el idPedido buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarPedidoPresencial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPedidoPresencial`(
    IN p_idPedido INT,
    IN p_NumMesa INT,
    IN p_NuevoNumMesa INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM PedidosPresenciales WHERE idPedido = p_idPedido AND NumMesa = p_NumMesa;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM PedidosPresenciales WHERE idPedido = p_idPedido AND NumMesa = p_NuevoNumMesa AND (NumMesa != p_NumMesa OR idPedido != p_idPedido);

        IF num_rows = 0 THEN
            
            UPDATE PedidosPresenciales SET NumMesa = p_NuevoNumMesa WHERE idPedido = p_idPedido AND NumMesa = p_NumMesa;
        ELSE
            SELECT 'La combinación de idPedido y NuevoNumMesa ya existe en otro pedido presencial.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idPedido y NumMesa buscados.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarPedidoRepartidor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPedidoRepartidor`(
    IN p_idPedido INT,
    IN p_idRepartidor INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM PedidosRepartidores WHERE idPedido = p_idPedido;

    IF num_rows > 0 THEN
        
        UPDATE PedidosRepartidores SET idRepartidor = p_idRepartidor WHERE idPedido = p_idPedido;
    ELSE
        SELECT 'No se encontró ningún registro con el idPedido buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPersonal`(
    IN p_idUsuario INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_correo VARCHAR(100),
    IN p_TipoUsuario VARCHAR(50)
)
BEGIN
    DECLARE tipoUsuarioExistente INT;
    
    
    SELECT COUNT(*) INTO tipoUsuarioExistente
    FROM TipoUsuario
    WHERE TipoUsuario = p_TipoUsuario;
    
    IF tipoUsuarioExistente = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'TipoUsuario inválido.';
    END IF;
    
    
    IF p_TipoUsuario = 'Repartidor' THEN
        UPDATE Repartidores
        SET Nombre = p_Nombre,
            ApellidoPaterno = p_ApellidoPaterno,
            ApellidoMaterno = p_ApellidoMaterno,
            Salario = p_Salario
        WHERE idUsuario = p_idUsuario;
        
        UPDATE Usuarios
        SET Correo = p_correo,
            idTipoUsuario = (SELECT idTipoUsuario FROM TipoUsuario WHERE TipoUsuario = p_TipoUsuario)
        WHERE idUsuario = p_idUsuario;
        
    ELSEIF p_TipoUsuario = 'Chef' THEN
        UPDATE Chefs
        SET Nombre = p_Nombre,
            ApellidoPaterno = p_ApellidoPaterno,
            ApellidoMaterno = p_ApellidoMaterno,
            Salario = p_Salario
        WHERE idUsuario = p_idUsuario;
        
        UPDATE Usuarios
        SET Correo = p_correo,
            idTipoUsuario = (SELECT idTipoUsuario FROM TipoUsuario WHERE TipoUsuario = p_TipoUsuario)
        WHERE idUsuario = p_idUsuario;
        
    ELSEIF p_TipoUsuario = 'Mesero' THEN
        UPDATE Meseros
        SET Nombre = p_Nombre,
            ApellidoPaterno = p_ApellidoPaterno,
            ApellidoMaterno = p_ApellidoMaterno,
            Salario = p_Salario
        WHERE idUsuario = p_idUsuario;
        
        UPDATE Usuarios
        SET Correo = p_correo,
            idTipoUsuario = (SELECT idTipoUsuario FROM TipoUsuario WHERE TipoUsuario = p_TipoUsuario)
        WHERE idUsuario = p_idUsuario;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'TipoUsuario no válido para editar personal.';
    END IF;
    
    SELECT 'Personal actualizado correctamente.' AS mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarProducto`(
    IN p_idProducto INT,
    IN p_NombreProducto VARCHAR(255),
    IN p_Comida TINYINT,
    IN p_Precio DECIMAL(10, 2),
    IN p_Descripcion TEXT,
    IN p_Imagen VARCHAR(255)
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Productos WHERE idProducto = p_idProducto;

    IF num_rows > 0 THEN
        
        UPDATE Productos SET
            NombreProducto = p_NombreProducto,
            Comida = p_Comida,
            Precio = p_Precio,
            Descripcion = p_Descripcion,
            Imagen = p_Imagen
        WHERE idProducto = p_idProducto;
    ELSE
        SELECT 'No se encontró ningún registro con el idProducto buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarProductoPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarProductoPedido`(
    IN p_idPedido INT,
    IN p_idProducto INT,
    IN p_CantidadProducto INT,
    IN p_Comentarios TEXT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM ProductosPedidos WHERE idPedido = p_idPedido AND idProducto = p_idProducto;

    IF num_rows > 0 THEN
        
        UPDATE ProductosPedidos SET
            CantidadProducto = p_CantidadProducto,
            Comentarios = p_Comentarios
        WHERE idPedido = p_idPedido AND idProducto = p_idProducto;
    ELSE
        SELECT 'No se encontró ningún registro con el idPedido-idProducto buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarRepartidor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarRepartidor`(
    IN p_idRepartidor INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_MatriculaVehiculo VARCHAR(20),
    IN p_idUsuario INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Repartidores WHERE idRepartidor = p_idRepartidor;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Repartidores WHERE idUsuario = p_idUsuario AND idRepartidor != p_idRepartidor;

        IF num_rows = 0 THEN
            
            UPDATE Repartidores SET
                Nombre = p_Nombre,
                ApellidoPaterno = p_ApellidoPaterno,
                ApellidoMaterno = p_ApellidoMaterno,
                Salario = p_Salario,
                MatriculaVehiculo = p_MatriculaVehiculo,
                idUsuario = p_idUsuario
            WHERE idRepartidor = p_idRepartidor;
        ELSE
            SELECT 'El idUsuario ya está asociado a otro repartidor.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idRepartidor buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarReservacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarReservacion`(
    IN p_idReserva INT,
    IN p_CantidadPersonas INT,
    IN p_Comentarios TEXT,
    IN p_idHorario INT,
    IN p_idCliente INT,
    IN p_Confirmada BOOLEAN
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Reservaciones WHERE idHorario = p_idHorario AND idCliente = p_idCliente AND idReserva <> p_idReserva;

    IF num_rows > 0 THEN
        SELECT 'La combinación de idHorario e idCliente ya existe en la tabla.' AS mensaje;
    ELSE
        
        SELECT COUNT(*) INTO num_rows FROM Reservaciones WHERE idReserva = p_idReserva;

        IF num_rows > 0 THEN
            
            IF (p_CantidadPersonas, p_Comentarios, p_idHorario, p_idCliente, p_Confirmada) <> (SELECT CantidadPersonas, Comentarios, idHorario, idCliente, Confirmada FROM Reservaciones WHERE idReserva = p_idReserva) THEN
                
                UPDATE Reservaciones SET CantidadPersonas = p_CantidadPersonas, Comentarios = p_Comentarios, idHorario = p_idHorario, idCliente = p_idCliente, Confirmada = p_Confirmada WHERE idReserva = p_idReserva;
                SELECT 'Registro actualizado correctamente.' AS mensaje;
            ELSE
                SELECT 'Los parámetros tienen los mismos datos que el registro existente.' AS mensaje;
            END IF;
        ELSE
            SELECT 'No se encontró ningún registro con el id buscado.' AS mensaje;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarTarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTarjeta`(
    IN p_idTarjeta INT,
    IN p_NumeroTarjeta VARCHAR(16),
    IN p_FechaVencimiento DATE,
    IN p_Titular VARCHAR(255)
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Tarjetas WHERE idTarjeta = p_idTarjeta;

    IF num_rows > 0 THEN
        
        UPDATE Tarjetas SET NumeroTarjeta = p_NumeroTarjeta, FechaVencimiento = p_FechaVencimiento, Titular = p_Titular WHERE idTarjeta = p_idTarjeta;
    ELSE
        SELECT 'No se encontró ningún registro con el idTarjeta buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarTarjetaPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTarjetaPago`(
    IN p_idTarjeta INT,
    IN p_idPago INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM TarjetasPagos WHERE idPago = p_idPago;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM TarjetasPagos WHERE idPago = p_idPago AND idPago != p_idPago;

        IF num_rows = 0 THEN
            
            UPDATE TarjetasPagos SET idTarjeta = p_idTarjeta WHERE idPago = p_idPago;
        ELSE
            SELECT 'La combinación de idTarjeta y idPago ya existe en otra asociación de tarjeta y pago.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idPago buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarTipoUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipoUsuario`(
    IN p_idTipoUsuario INT,
    IN p_TipoUsuario VARCHAR(50)
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM TipoUsuario WHERE idTipoUsuario = p_idTipoUsuario;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM TipoUsuario WHERE TipoUsuario = p_TipoUsuario AND idTipoUsuario <> p_idTipoUsuario;

        IF num_rows = 0 THEN
            
            UPDATE TipoUsuario SET
                TipoUsuario = p_TipoUsuario
            WHERE idTipoUsuario = p_idTipoUsuario;
        ELSE
            SELECT 'El tipo de usuario ya existe en la base de datos.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idTipoUsuario buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarUnidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarUnidad`(
    IN p_idUnidad INT,
    IN p_TipoUnidad VARCHAR(50)
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Unidades WHERE idUnidad = p_idUnidad;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Unidades WHERE TipoUnidad = p_TipoUnidad AND idUnidad <> p_idUnidad;

        IF num_rows = 0 THEN
            
            UPDATE Unidades SET
                TipoUnidad = p_TipoUnidad
            WHERE idUnidad = p_idUnidad;
        ELSE
            SELECT 'El TipoUnidad ya está siendo utilizado por otro registro.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idUnidad buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarUsuario`(
    IN p_idUsuario INT,
    IN p_Correo VARCHAR(100),
    IN p_Contrasenia VARCHAR(350),
    IN p_Imagen VARCHAR(100),
    IN p_idTipoUsuario INT
)
BEGIN
    DECLARE num_rows INT;

    
    SELECT COUNT(*) INTO num_rows FROM Usuarios WHERE idUsuario = p_idUsuario;

    IF num_rows > 0 THEN
        
        SELECT COUNT(*) INTO num_rows FROM Usuarios WHERE Correo = p_Correo AND idUsuario <> p_idUsuario;

        IF num_rows = 0 THEN
            
            UPDATE Usuarios SET
                Correo = p_Correo,
                Contrasenia = p_Contrasenia,
                Imagen = p_Imagen,
                idTipoUsuario = p_idTipoUsuario
            WHERE idUsuario = p_idUsuario;
        ELSE
            SELECT 'El correo ya está siendo utilizado por otro usuario.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idUsuario buscado.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCliente`(
  IN p_idCliente INT,
  IN p_idUsuario INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  
  SELECT COUNT(*) INTO @contador
  FROM Clientes
  WHERE idCliente = p_idCliente AND idUsuario = p_idUsuario;

  IF @contador > 0 THEN
    
    DELETE FROM Usuarios
    WHERE idUsuario = p_idUsuario;
    DELETE FROM Clientes
    WHERE idCliente = p_idCliente;
    COMMIT;
  ELSE
    
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla Clientes.';
  END IF;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarIngrediente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarIngrediente`(
  IN p_idIngrediente INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  
  SELECT COUNT(*) INTO @contador
  FROM Ingredientes
  WHERE idIngrediente = p_idIngrediente;

  IF @contador > 0 THEN
    
    DELETE FROM Ingredientes
    WHERE idIngrediente = p_idIngrediente;
    COMMIT;
  ELSE
    
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla Ingredientes.';
  END IF;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarMesa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMesa`(
  IN p_NumMesa INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  
  SELECT COUNT(*) INTO @contador
  FROM Mesas
  WHERE numMesa = p_NumMesa;

  IF @contador > 0 THEN
    
    DELETE FROM Mesas
    WHERE numMesa = p_NumMesa;
    COMMIT;
  ELSE
    
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla Mesas.';
  END IF;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPersonal`(
  IN p_idUsuario INT
)
BEGIN
  DECLARE rowCount INT;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  
  SELECT COUNT(*) INTO @contador
  FROM Usuarios
  WHERE idUsuario = p_idUsuario;

  IF @contador > 0 THEN
    
    DELETE FROM Usuarios
    WHERE idUsuario = p_idUsuario;
    DELETE FROM Clientes
    WHERE idUsuario = p_idUsuario;
    
    SET rowCount = ROW_COUNT();
    
    
    IF rowCount = 0 THEN
        DELETE FROM Repartidores
        WHERE idUsuario = p_idUsuario;
        
        SET rowCount = ROW_COUNT();
        
        
        IF rowCount = 0 THEN
            DELETE FROM Chefs
            WHERE idUsuario = p_idUsuario;
        END IF;
    END IF;
    
    SELECT rowCount AS registrosEliminados;
    COMMIT;
  ELSE
    
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla Usuarios.';
  END IF;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProducto`(
  IN p_idProducto INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  
  SELECT COUNT(*) INTO @contador
  FROM Productos
  WHERE idProducto = p_idProducto;

  IF @contador > 0 THEN
    
    DELETE FROM Productos
    WHERE idProducto = p_idProducto;
    COMMIT;
  ELSE
    
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla Productos.';
  END IF;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarProductoCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProductoCarrito`(
  IN p_idDetalleCarrito INT,
  IN p_idProducto INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  
  SELECT COUNT(*) INTO @recordCount
  FROM DetallesCarritos
  WHERE idDetalleCarrito = p_idDetalleCarrito AND idProducto = p_idProducto;

  IF @recordCount > 0 THEN
    
    DELETE FROM DetallesCarritos
    WHERE idDetalleCarrito = p_idDetalleCarrito AND idProducto = p_idProducto;
  ELSE
    
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla DetallesCarritos.';
  END IF;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ExisteUsuario`(
    IN _correo VARCHAR(100),
    OUT _existe INT
)
BEGIN
    DECLARE var_count INT;

    SELECT COUNT(*) INTO var_count
    FROM Usuarios
    WHERE Correo = _correo;

    IF var_count > 0 THEN
        SET _existe = 1;
    ELSE
        SET _existe = 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IniciarSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IniciarSesion`(
    IN _username VARCHAR(50)
)
BEGIN
    DECLARE varIdUsuario INT;
    DECLARE varCorreo VARCHAR(50);
    DECLARE varContrasenia VARCHAR(350);
    DECLARE varidTipoUsuario INT;

    
    SELECT idUsuario, Correo, Contrasenia, idTipoUsuario INTO varIdUsuario, varCorreo, varContrasenia, varidTipoUsuario
    FROM Usuarios
    WHERE Correo = _username;

    
    IF varIdUsuario IS NOT NULL THEN
        SELECT varIdUsuario, varCorreo, varContrasenia, varidTipoUsuario;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCarrito`(
    IN p_idCliente INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idCarrito INTO v_Encontrado FROM Carritos WHERE idCliente = p_idCliente LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Carritos (idCliente)
        VALUES (p_idCliente);   
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarChef` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarChef`(
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_idEspecialidad INT,
    IN p_idUsuario INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idChef INTO v_Encontrado FROM Chefs WHERE Nombre = p_Nombre AND ApellidoPaterno = p_ApellidoPaterno AND ApellidoMaterno = p_ApellidoMaterno LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Chefs (Nombre, ApellidoPaterno, ApellidoMaterno, Salario, idEspecialidad, idUsuario)
        VALUES (p_Nombre, p_ApellidoPaterno, p_ApellidoMaterno, p_Salario, p_idEspecialidad, p_idUsuario);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCliente`(
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_TelefonoContacto VARCHAR(20),
    IN p_idDireccion INT,
    IN p_idUsuario INT,
    OUT p_idCliente INT
)
BEGIN
    

    
    
    
    
    
    
    

    
        
        INSERT INTO Clientes (Nombre, ApellidoPaterno, ApellidoMaterno, TelefonoContacto, idDireccion, idUsuario)
        VALUES (p_Nombre, p_ApellidoPaterno, p_ApellidoMaterno, p_TelefonoContacto, p_idDireccion, p_idUsuario);

        SET p_idCliente = LAST_INSERT_ID();
    
    
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarColonia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarColonia`(
    IN p_Colonia VARCHAR(100),
    IN p_idMunicipio INT,
    OUT p_idColonia INT
)
BEGIN
    DECLARE coloniaExistente INT;

    
    SELECT idColonia INTO coloniaExistente
    FROM Colonias
    WHERE Colonia = p_Colonia AND idMunicipio = p_idMunicipio
    LIMIT 1;

    
    IF coloniaExistente IS NULL THEN
        INSERT INTO Colonias (Colonia, idMunicipio)
        VALUES (p_Colonia, p_idMunicipio);
        SET p_idColonia = LAST_INSERT_ID();
    ELSE
        SET p_idColonia = coloniaExistente;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarDetalleCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDetalleCarrito`(
  IN p_idCarrito INT,
  IN p_idProducto INT,
  IN p_Cantidad INT,
  IN p_Comentarios TEXT,
  OUT p_idDetalleCarrito INT
)
BEGIN
  
  IF NOT EXISTS (
    SELECT 1 FROM DetallesCarritos WHERE idCarrito = p_idCarrito AND idProducto = p_idProducto
  ) THEN
    
    INSERT INTO DetallesCarritos (idCarrito, idProducto, Cantidad, Comentarios)
    VALUES (p_idCarrito, p_idProducto, p_Cantidad, p_Comentarios);

    
    SET p_idDetalleCarrito = LAST_INSERT_ID();
  ELSE
    
    UPDATE DetallesCarritos
    SET Cantidad = Cantidad + p_Cantidad
    WHERE idCarrito = p_idCarrito AND idProducto = p_idProducto;

    
    SELECT idDetalleCarrito INTO p_idDetalleCarrito
    FROM DetallesCarritos
    WHERE idCarrito = p_idCarrito AND idProducto = p_idProducto;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarDireccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDireccion`(
    IN p_idColonia INT,
    IN p_Calle VARCHAR(100),
    IN p_NumExterior VARCHAR(20),
    IN p_NumInterior VARCHAR(20),
    IN p_CodigoPostal VARCHAR(10),
    OUT p_idDireccion INT
)
SP:BEGIN
    
    SELECT idDireccion INTO p_idDireccion
    FROM Direcciones
    WHERE idColonia = p_idColonia
      AND Calle = p_Calle
      AND NumExterior = p_NumExterior
      AND IFNULL(NumInterior, '') = IFNULL(p_NumInterior, '')
      AND CodigoPostal = p_CodigoPostal
    LIMIT 1;
    
    
    IF p_idDireccion IS NOT NULL THEN
        
        LEAVE SP;
    ELSE
        
        INSERT INTO Direcciones (idColonia, Calle, NumExterior, NumInterior, CodigoPostal)
        VALUES (p_idColonia, p_Calle, p_NumExterior, p_NumInterior, p_CodigoPostal);
        
        SET p_idDireccion = LAST_INSERT_ID();
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEntrega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEntrega`(
  IN p_idPedido INT,
  IN p_EstadoEntrega VARCHAR(50),
  OUT p_IdInsertado INT
)
BEGIN
  DECLARE v_Encontrado INT;

  
  SELECT idEntrega INTO v_Encontrado
  FROM Entregas
  WHERE idPedido = p_idPedido
  LIMIT 1;

  IF v_Encontrado IS NOT NULL THEN
    
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo agregar el registro. La entrega ya existe.';
  ELSE
    
    INSERT INTO Entregas (EstadoEntrega, idPedido)
    VALUES (p_EstadoEntrega, p_idPedido);

    SET p_IdInsertado = LAST_INSERT_ID();
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEspecialidad`(
    IN p_Especialidad VARCHAR(100),
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idEspecialidad INTO v_Encontrado FROM Especialidades WHERE Especialidad = p_Especialidad LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Especialidades (Especialidad) VALUES (p_Especialidad);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEstado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEstado`(
    IN p_Estado VARCHAR(50),
    OUT p_idEstado INT
)
BEGIN
    DECLARE estadoExistente INT;

    
    SELECT idEstado INTO estadoExistente
    FROM Estados
    WHERE Estado = p_Estado
    LIMIT 1;

    
    IF estadoExistente IS NULL THEN
        INSERT INTO Estados (Estado)
        VALUES (p_Estado);
        SET p_idEstado = LAST_INSERT_ID();
    ELSE
        SET p_idEstado = estadoExistente;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarHorario`(
    IN p_Fecha DATE,
    IN p_Hora TIME,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idHorario INTO v_Encontrado FROM Horarios WHERE Fecha = p_Fecha AND Hora = p_Hora LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Horarios (Fecha, Hora) VALUES (p_Fecha, p_Hora);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarIngrediente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarIngrediente`(
  IN p_NombreIngrediente VARCHAR(100),
  IN p_StockIngrediente INT,
  IN p_idUnidad INT,
  OUT p_idIngrediente INT
)
BEGIN
  
  SELECT idIngrediente INTO p_idIngrediente
  FROM Ingredientes
  WHERE NombreIngrediente = p_NombreIngrediente;

  IF p_idIngrediente IS NULL THEN
    
    INSERT INTO Ingredientes (NombreIngrediente, StockIngrediente, idUnidad)
    VALUES (p_NombreIngrediente, p_StockIngrediente, p_idUnidad);

    
    SET p_idIngrediente = LAST_INSERT_ID();
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarIngredienteProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarIngredienteProducto`(
  IN p_idProducto INT,
  IN p_idIngrediente INT,
  IN p_Cantidad DECIMAL(5, 3)
)
BEGIN
  
  IF NOT EXISTS (
    SELECT 1
    FROM IngredientesProductos
    WHERE idProducto = p_idProducto AND idIngrediente = p_idIngrediente
  ) THEN
    
    INSERT INTO IngredientesProductos (idProducto, idIngrediente, Cantidad)
    VALUES (p_idProducto, p_idIngrediente, p_Cantidad);
  ELSE
    
    SELECT 'No se pudo agregar el registro. La tupla idProducto, idIngrediente ya existe.';
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarMesa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMesa`(
    IN p_NumMesa INT,
    IN p_Capacidad INT,
    IN p_Disponible INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT NumMesa INTO v_Encontrado FROM Mesas WHERE NumMesa = p_NumMesa LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Mesas (Capacidad, Disponible) VALUES (p_Capacidad, p_Disponible);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarMesero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMesero`(
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_idUsuario INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idMesero INTO v_Encontrado FROM Meseros WHERE Nombre = p_Nombre AND ApellidoPaterno = p_ApellidoPaterno AND ApellidoMaterno = p_ApellidoMaterno LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Meseros (Nombre, ApellidoPaterno, ApellidoMaterno, Salario, idUsuario)
        VALUES (p_Nombre, p_ApellidoPaterno, p_ApellidoMaterno, p_Salario, p_idUsuario);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarMetodoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMetodoPago`(
  IN p_MetodoPago VARCHAR(50),
  OUT p_idMetodoPago INT
)
BEGIN
  DECLARE v_idMetodoPago INT;

  
  SELECT idMetodoPago INTO v_idMetodoPago
  FROM MetodosPagos
  WHERE MetodoPago = p_MetodoPago;

  IF v_idMetodoPago IS NULL THEN
    
    INSERT INTO MetodosPagos (MetodoPago)
    VALUES (p_MetodoPago);

    
    SET p_idMetodoPago = LAST_INSERT_ID();
  ELSE
    
    SET p_idMetodoPago = -1;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarMunicipio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMunicipio`(
    IN p_Municipio VARCHAR(100),
    IN p_idEstado INT,
    OUT p_idMunicipio INT
)
BEGIN
    DECLARE municipioExistente INT;
    
    
    SELECT idMunicipio INTO municipioExistente
    FROM Municipios 
    WHERE Municipio = p_Municipio AND idEstado = p_idEstado
    LIMIT 1;
    
    IF municipioExistente IS NULL THEN
        
        INSERT INTO Municipios (Municipio, idEstado)
        VALUES (p_Municipio, p_idEstado);
        SET p_idMunicipio = LAST_INSERT_ID();
    ELSE
        
        SET p_idMunicipio = municipioExistente;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPago`(
  IN p_MontoTotal DECIMAL(10, 2),
  IN p_idMetodoPago INT,
  IN p_idPedido INT,
  OUT p_numTransaccion INT
)
BEGIN
  DECLARE v_numTransaccion INT;

  
  SELECT NumTransaccion INTO v_numTransaccion
  FROM Pagos
  WHERE idPedido = p_idPedido
  LIMIT 1;

  IF v_numTransaccion IS NOT NULL THEN
    
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El NumTransaccion ya existe en la tabla Pagos.';
  ELSE
    
    INSERT INTO Pagos (MontoTotal, idMetodoPago, idPedido)
    VALUES (p_MontoTotal, p_idMetodoPago, p_idPedido);

    
    SET p_numTransaccion = LAST_INSERT_ID();
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPedido`(
  IN p_idCliente INT,
  IN p_FechaPedido DATE,
  IN p_HoraPedido TIME,
  OUT p_IdInsertado INT
)
BEGIN
  DECLARE v_Encontrado INT;
  
  
  SELECT idPedido INTO v_Encontrado
  FROM Pedidos
  WHERE idCliente = p_idCliente
    AND FechaPedido = p_FechaPedido
    AND HoraPedido = p_HoraPedido
  LIMIT 1;
  
  IF v_Encontrado IS NOT NULL THEN
    
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se pudo agregar el registro. El pedido ya existe.';
  ELSE
    
    INSERT INTO Pedidos (idCliente, FechaPedido, HoraPedido)
    VALUES (p_idCliente, p_FechaPedido, p_HoraPedido);
    
    SET p_IdInsertado = LAST_INSERT_ID();
  END IF;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarPedidoEnLinea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPedidoEnLinea`(
  IN p_idPedido INT,
  IN p_EstadoOrden INT
)
BEGIN
  DECLARE v_Encontrado INT;

  
  SELECT idPedido INTO v_Encontrado
  FROM PedidosEnLinea
  WHERE idPedido = p_idPedido
  LIMIT 1;

  IF v_Encontrado IS NOT NULL THEN
    
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo agregar el registro. El pedido ya existe.';
  ELSE
    
    INSERT INTO PedidosEnLinea (idPedido, EstadoOrden)
    VALUES (p_idPedido, p_EstadoOrden);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarPedidoPresencial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPedidoPresencial`(
    IN p_idPedido INT,
    IN p_NumMesa INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT COUNT(*) INTO v_Encontrado FROM PedidosPresenciales WHERE idPedido = p_idPedido AND NumMesa = p_NumMesa;

    IF v_Encontrado = 0 THEN
        INSERT INTO PedidosPresenciales (idPedido, NumMesa) VALUES (p_idPedido, p_NumMesa);
        SELECT 'Registro agregado' AS Mensaje;
    ELSE
        SELECT 'No se pudo agregar el registro. La tupla idPedido-NumMesa ya existe.' AS Mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarPedidoRepartidor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPedidoRepartidor`(
    IN p_idPedido INT,
    IN p_idRepartidor INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idPedido INTO v_Encontrado FROM PedidosRepartidores WHERE idPedido = p_idPedido LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO PedidosRepartidores (idPedido, idRepartidor)
        VALUES (p_idPedido, p_idRepartidor);
        SELECT 'Registro insertado correctamente.';
    ELSE
        SELECT 'No se pudo agregar el registro. La tupla idPedido ya existe.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProducto`(
  IN p_NombreProducto VARCHAR(255),
  IN p_Comida TINYINT,
  IN p_Precio DECIMAL(10, 2),
  IN p_Descripcion TEXT,
  IN p_Imagen VARCHAR(255),
  OUT p_idProducto INT
)
BEGIN
  
  SELECT idProducto INTO p_idProducto
  FROM Productos
  WHERE NombreProducto = p_NombreProducto;

  IF p_idProducto IS NULL THEN
    
    INSERT INTO Productos (NombreProducto, Comida, Precio, Descripcion, Imagen)
    VALUES (p_NombreProducto, p_Comida, p_Precio, p_Descripcion, p_Imagen);

    
    SET p_idProducto = LAST_INSERT_ID();
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarProductoPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProductoPedido`(
  IN p_idPedido INT,
  IN p_idProducto INT,
  IN p_CantidadProducto INT,
  IN p_Comentarios TEXT
)
BEGIN
  
  IF NOT EXISTS (
    SELECT 1
    FROM ProductosPedidos
    WHERE idPedido = p_idPedido AND idProducto = p_idProducto
  ) THEN
    
    INSERT INTO ProductosPedidos (idPedido, idProducto, CantidadProducto, Comentarios)
    VALUES (p_idPedido, p_idProducto, p_CantidadProducto, p_Comentarios);
  ELSE
    
    SELECT 'No se pudo agregar el registro. La tupla idPedido, idProducto ya existe.';
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarRepartidor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarRepartidor`(
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_MatriculaVehiculo VARCHAR(20),
    IN p_idUsuario INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idRepartidor INTO v_Encontrado FROM Repartidores WHERE Nombre = p_Nombre AND ApellidoPaterno = p_ApellidoPaterno AND ApellidoMaterno = p_ApellidoMaterno LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Repartidores (Nombre, ApellidoPaterno, ApellidoMaterno, Salario, MatriculaVehiculo, idUsuario)
        VALUES (p_Nombre, p_ApellidoPaterno, p_ApellidoMaterno, p_Salario, p_MatriculaVehiculo, p_idUsuario);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarReservacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarReservacion`(
    IN p_CantidadPersonas INT,
    IN p_Comentarios TEXT,
    IN p_idHorario INT,
    IN p_idCliente INT,
    IN p_Confirmada BOOLEAN,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idReserva INTO v_Encontrado FROM Reservaciones WHERE idHorario = p_idHorario AND idCliente = p_idCliente LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Reservaciones (CantidadPersonas, Comentarios, idHorario, idCliente, Confirmada)
        VALUES (p_CantidadPersonas, p_Comentarios, p_idHorario, p_idCliente, p_Confirmada);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya tiene una reserva para ese horario';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarReservaMesa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarReservaMesa`(
    IN p_NumMesa INT,
    IN p_idReserva INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT NumMesa INTO v_Encontrado FROM ReservasMesas WHERE NumMesa = p_NumMesa AND idReserva = p_idReserva LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO ReservasMesas (NumMesa, idReserva)
        VALUES (p_NumMesa, p_idReserva);
        COMMIT;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo agregar el registro. La tupla NumMesa-idReserva ya existe';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarTarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTarjeta`(
  IN p_NumeroTarjeta VARCHAR(16),
  IN p_FechaVencimiento DATE,
  IN p_Titular VARCHAR(255),
  OUT p_idTarjeta INT
)
BEGIN
  DECLARE v_idTarjeta INT;

  
  SELECT idTarjeta INTO v_idTarjeta
  FROM Tarjetas
  WHERE NumeroTarjeta = p_NumeroTarjeta
  LIMIT 1;

  IF v_idTarjeta IS NULL THEN
    
    INSERT INTO Tarjetas (NumeroTarjeta, FechaVencimiento, Titular)
    VALUES (p_NumeroTarjeta, p_FechaVencimiento, p_Titular);

    
    SET p_idTarjeta = LAST_INSERT_ID();
  ELSE
    
    SET p_idTarjeta = v_idTarjeta;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarTarjetaPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTarjetaPago`(
  IN p_idTarjeta INT,
  IN p_NumTransaccion INT
)
BEGIN
  DECLARE v_idPago INT;

  
  SELECT NumTransaccion INTO v_idPago
  FROM Pagos
  WHERE NumTransaccion = p_NumTransaccion
  LIMIT 1;

  IF v_idPago IS NULL THEN
    
    SELECT 'No se pudo agregar el registro. NumTransaccion no existe en la tabla Pagos.' AS Mensaje;
  ELSE
    
    INSERT INTO TarjetasPagos (idTarjeta, idPago)
    VALUES (p_idTarjeta, p_NumTransaccion);

    
    SELECT 'Registro agregado correctamente.' AS Mensaje;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarTipoUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoUsuario`(
    IN p_TipoUsuario VARCHAR(50),
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idTipoUsuario INTO v_Encontrado FROM TipoUsuario WHERE TipoUsuario = p_TipoUsuario LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO TipoUsuario (TipoUsuario) VALUES (p_TipoUsuario);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarUnidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUnidad`(
  IN p_TipoUnidad VARCHAR(50),
  OUT p_idUnidad INT
)
BEGIN
  
  SELECT idUnidad INTO p_idUnidad
  FROM Unidades
  WHERE TipoUnidad = p_TipoUnidad;

  IF p_idUnidad IS NULL THEN
    
    INSERT INTO Unidades (TipoUnidad)
    VALUES (p_TipoUnidad);

    
    SET p_idUnidad = LAST_INSERT_ID();
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuario`(
    IN p_Correo VARCHAR(100),
    IN p_Contrasenia VARCHAR(350),
    IN p_Imagen VARCHAR(100),
    IN p_idTipoUsuario INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idUsuario INTO v_Encontrado FROM Usuarios WHERE Correo = p_Correo LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Usuarios (Correo, Contrasenia, Imagen, idTipoUsuario)
        VALUES (p_Correo, p_Contrasenia, p_Imagen, p_idTipoUsuario);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo ingresado ya está en uso';
        
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarProductosPorComida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarProductosPorComida`(
    IN p_Comida TINYINT
)
BEGIN
    IF p_Comida = 1 THEN
        SELECT idProducto, NombreProducto, Precio, Descripcion, Imagen
        FROM Productos
        WHERE Comida = 1;
    ELSEIF p_Comida = 0 THEN
        SELECT idProducto, NombreProducto, Precio, Descripcion, Imagen
        FROM Productos
        WHERE Comida = 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerMesasDisponibles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerMesasDisponibles`(
    IN fecha_especifica DATE,
    IN hora_especifica TIME,
    IN nPersonas INT
)
BEGIN
    SELECT m.NumMesa, m.Capacidad
    FROM Mesas m
    WHERE m.Disponible = 1
        AND m.Capacidad >= nPersonas
        AND m.NumMesa NOT IN (
            SELECT rm.NumMesa
            FROM ReservasMesas rm
            INNER JOIN Reservaciones r ON rm.idReserva = r.idReserva
            INNER JOIN Horarios h ON r.idHorario = h.idHorario
            WHERE h.Fecha = fecha_especifica AND h.Hora = hora_especifica
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarCliente`(
    IN p_Correo VARCHAR(100),
    IN p_Contrasenia VARCHAR(350),
    IN p_Imagen VARCHAR(100),
    IN p_idTipoUsuario INT,
    IN p_Estado VARCHAR(50),
    IN p_Municipio VARCHAR(100),
    IN p_Colonia VARCHAR(100),
    IN p_Calle VARCHAR(100),
    IN p_NumExterior VARCHAR(20),
    IN p_NumInterior VARCHAR(20),
    IN p_CodigoPostal VARCHAR(10),
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_TelefonoContacto VARCHAR(20),
    OUT p_idCliente INT
)
BEGIN
    DECLARE error_msg VARCHAR(255);
    DECLARE p_idDireccion INT;
    DECLARE p_idUsuario INT;
    DECLARE p_idCliente2 INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END;

    START TRANSACTION;

    
    CALL InsertarUsuario(p_Correo, p_Contrasenia, p_Imagen, p_idTipoUsuario, @p_idUsuario);
    SET p_idUsuario = @p_idUsuario;

    
    CALL RegistrarDireccion(p_Estado, p_Municipio, p_Colonia, p_Calle, p_NumExterior, p_NumInterior, p_CodigoPostal, @p_idDireccion);
    SET p_idDireccion = @p_idDireccion;

    
    CALL InsertarCliente(p_Nombre, p_ApellidoPaterno, p_ApellidoMaterno, p_TelefonoContacto, p_idDireccion, p_idUsuario, @p_idCliente2);
    SET p_idCliente = @p_idCliente2;

    COMMIT;

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarDireccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarDireccion`(
    IN p_Estado VARCHAR(50),
    IN p_Municipio VARCHAR(100),
    IN p_Colonia VARCHAR(100),
    IN p_Calle VARCHAR(100),
    IN p_NumExterior VARCHAR(20),
    IN p_NumInterior VARCHAR(20),
    IN p_CodigoPostal VARCHAR(10),
    OUT p_idDireccion INT
)
BEGIN
    DECLARE p_idEstado INT;
    DECLARE p_idMunicipio INT;
    DECLARE p_idColonia INT;
    DECLARE p_idDireccionB INT;
    
    
    
    
    
    
    
    
    
    
    
    
    CALL InsertarEstado(p_Estado, @p_idEstado);
    SET p_idEstado = @p_idEstado;
    
    
    CALL InsertarMunicipio(p_Municipio, p_idEstado, @p_idMunicipio);
    SET p_idMunicipio = @p_idMunicipio;
    
    
    CALL InsertarColonia(p_Colonia, p_idMunicipio, @p_idColonia);
    SET p_idColonia = @p_idColonia;
    
    
    CALL InsertarDireccion(p_idColonia, p_Calle, p_NumExterior, p_NumInterior, p_CodigoPostal, @p_idDireccionB);
    SET p_idDireccion = @p_idDireccionB;
        
    
    
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarIngrediente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarIngrediente`(
    IN p_NombreIngrediente VARCHAR(100),
    IN p_StockIngrediente INT,
    IN p_TipoUnidad VARCHAR(50),
    OUT p_idIngrediente INT
)
BEGIN
    DECLARE p_idUnidad INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la transacción.';
    END;

    DECLARE EXIT HANDLER FOR NOT FOUND
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El TipoUnidad no existe.';
    END;

    START TRANSACTION;

    
    CALL InsertarUnidad(p_TipoUnidad, p_idUnidad);

    
    CALL InsertarIngrediente(p_NombreIngrediente, p_StockIngrediente, p_idUnidad, p_idIngrediente);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarPagoTarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarPagoTarjeta`(
  IN idPedido INT,
  IN idMetodoPago INT,
  IN NumeroTarjeta VARCHAR(16),
  IN FechaVencimiento DATE,
  IN Titular VARCHAR(255),
  OUT NumTransaccion INT
)
BEGIN
  DECLARE montoTotal DECIMAL(10, 2);
  DECLARE idTarjeta INT;

  
  

  
  CALL CalcularMontoPedido(idPedido, montoTotal);

  
  CALL InsertarPago(montoTotal, idMetodoPago, idPedido, NumTransaccion);

  
  CALL InsertarTarjeta(NumeroTarjeta, FechaVencimiento, Titular, idTarjeta);

  
  CALL InsertarTarjetaPago(idTarjeta, NumTransaccion);

  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarPedidoEnLinea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarPedidoEnLinea`(
  IN p_idUsuario INT,
  IN p_FechaPedido DATE,
  IN p_HoraPedido TIME,
  IN p_idMetodoPago INT,
  IN p_NumeroTarjeta VARCHAR(16),
  IN p_FechaVencimiento DATE,
  IN p_Titular VARCHAR(100),
  OUT p_idPedido INT
)
BEGIN
  
  DECLARE v_idCarrito INT;
  DECLARE v_idCliente INT;
  DECLARE v_idEntrega INT;
  DECLARE v_numTransaccion INT;
  DECLARE error_msg TEXT;

  
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
  END;

  
  SELECT idCliente INTO v_idCliente FROM Clientes WHERE idUsuario = p_idUsuario LIMIT 1;

  SELECT idCarrito INTO v_idCarrito FROM Carritos WHERE idCliente = v_idCliente LIMIT 1;
  

  
  START TRANSACTION;

  
  CALL InsertarPedido(v_idCliente, p_FechaPedido, p_HoraPedido, p_idPedido);

  
  CALL InsertarPedidoEnLinea(p_idPedido, 0); 

  
  CALL InsertarEntrega(p_idPedido, 'En camino', v_idEntrega);

  
  CALL RegistrarProductosPedido(p_idPedido);

  
  CALL RegistrarPagoTarjeta(p_idPedido, p_idMetodoPago, p_NumeroTarjeta, p_FechaVencimiento, p_Titular, v_numTransaccion);

  
  CALL VaciarCarritoSinCommit(v_idCarrito);
  
  
  COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarPersonal`(
    IN p_nombre VARCHAR(100),
    IN p_apellidoPaterno VARCHAR(100),
    IN p_apellidoMaterno VARCHAR(100),
    IN p_salario DECIMAL(10, 2),
    IN p_correo VARCHAR(100),
    IN p_tipoUsuario VARCHAR(50),
    OUT p_idUsuario INT
)
BEGIN
    DECLARE v_idTipoUsuario INT;
    DECLARE v_idInsertado INT;

    
    SELECT idTipoUsuario INTO v_idTipoUsuario
    FROM TipoUsuario
    WHERE TipoUsuario = p_tipoUsuario;

    IF v_idTipoUsuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El TipoUsuario no existe.';
    ELSE
        
        START TRANSACTION;

        
        CALL InsertarUsuario(p_correo, '666', 'nombreImagen', v_idTipoUsuario, v_idInsertado);
        SET p_idUsuario = v_idInsertado;

        IF v_idInsertado IS NULL THEN
            
            ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error al insertar el usuario.';
        ELSE
            
            IF p_tipoUsuario = 'Mesero' THEN
                CALL InsertarMesero(p_nombre, p_apellidoPaterno, p_apellidoMaterno, p_salario, v_idInsertado, p_idUsuario);
            ELSEIF p_tipoUsuario = 'Repartidor' THEN
                CALL InsertarRepartidor(p_nombre, p_apellidoPaterno, p_apellidoMaterno, p_salario, NULL, v_idInsertado, p_idUsuario);
            ELSEIF p_tipoUsuario = 'Chef' THEN
                CALL InsertarChef(p_nombre, p_apellidoPaterno, p_apellidoMaterno, p_salario, NULL, v_idInsertado, p_idUsuario);
            END IF;

            IF p_idUsuario IS NULL THEN
                
                ROLLBACK;
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Error al insertar el personal.';
            ELSE
                
                COMMIT;
            END IF;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarProductoCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarProductoCarrito`(
    IN p_idUsuario INT,
    IN p_idProducto INT,
    IN p_Cantidad INT,
    IN p_Comentarios TEXT,
    OUT p_idDetalleCarrito INT
)
BEGIN
    DECLARE error_msg VARCHAR(255);
    DECLARE v_idCliente INT;
    DECLARE v_idCarrito INT;
    DECLARE v_idDetalleCarrito INT;
    DECLARE exit HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END;

    START TRANSACTION;
    
    
    SELECT idCliente INTO v_idCliente FROM Clientes WHERE idUsuario = p_idUsuario LIMIT 1;
    
    
    CALL InsertarCarrito(v_idCliente, v_idCarrito);
    
    
    CALL InsertarDetalleCarrito(v_idCarrito, p_idProducto, p_Cantidad, p_Comentarios, v_idDetalleCarrito);

    
    COMMIT;
    SET p_idDetalleCarrito = v_idDetalleCarrito;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarProductosPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarProductosPedido`(
  IN p_idPedido INT
)
BEGIN
  
  DECLARE v_idCliente INT;
  DECLARE v_idCarrito INT;
  DECLARE v_idProducto INT;
  DECLARE v_CantidadProducto INT;
  DECLARE v_Comentarios TEXT;
  DECLARE error_msg TEXT;

  
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
  END;

  
  SELECT idCliente INTO v_idCliente FROM Pedidos WHERE idPedido = p_idPedido;

  
  SELECT idCarrito INTO v_idCarrito FROM Carritos WHERE idCliente = v_idCliente;

  
  

  
  INSERT INTO ProductosPedidos (idPedido, idProducto, CantidadProducto, Comentarios)
  SELECT p_idPedido, dc.idProducto, dc.Cantidad, dc.Comentarios
  FROM DetallesCarritos dc
  WHERE dc.idCarrito = v_idCarrito
  AND NOT EXISTS (
    SELECT 1
    FROM ProductosPedidos pp
    WHERE pp.idPedido = p_idPedido
    AND pp.idProducto = dc.idProducto
  );

  
  IF ROW_COUNT() = 0 THEN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la transacción. No se pudo registrar los productos del pedido.';
  END IF;

  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarReservacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarReservacion`(
    IN p_idCliente INT,
    IN p_Fecha DATE,
    IN p_Hora TIME,
    IN p_CantidadPersonas INT,
    IN p_Comentarios TEXT,
    IN p_Confirmada BOOLEAN,
    OUT p_idReserva INT
)
BEGIN
    DECLARE p_idHorario INT;
    DECLARE error_msg VARCHAR(255);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION;
    
    
    CALL InsertarHorario(p_Fecha, p_Hora, @p_idHorario);
    SET p_idHorario = @p_idHorario;
    
    
    CALL InsertarReservacion(p_CantidadPersonas, p_Comentarios, p_idHorario, p_idCliente, p_Confirmada, @p_idReserva);
    SET p_idReserva = @p_idReserva;
    SELECT p_idReserva as p_idReserva;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VaciarCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VaciarCarrito`(IN p_idCarrito INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Ha ocurrido un problema durante la transacción.';
    END;

    START TRANSACTION;
    
    DELETE FROM DetallesCarritos WHERE idCarrito = p_idCarrito;
    
    COMMIT;
    
    SELECT 'El carrito ha sido vaciado exitosamente.';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VaciarCarritoSinCommit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VaciarCarritoSinCommit`(IN p_idCarrito INT)
BEGIN
    DECLARE v_Encontrado INT;

    
    SELECT COUNT(*) INTO v_Encontrado FROM Carritos WHERE idCarrito = p_idCarrito;
    
    IF v_Encontrado = 0 THEN
        
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo encontrar el carrito especificado.';
    ELSE
        
        DELETE FROM DetallesCarritos WHERE idCarrito = p_idCarrito;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-20 11:34:47
