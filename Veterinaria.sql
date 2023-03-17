-- Creacion y Uso de la base de datos
CREATE DATABASE veterinaria;
use veterinaria;
-- ===================================================================================
-- Creacion de la tabla equipos
CREATE TABLE `equipos`( 
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`equipo` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`id`))
	ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
    
    -- Creacion de la tabla clientes 
    CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(30) NOT NULL,
  `nombre_propietario` varchar(45) NOT NULL,
  `nombre_mascota` varchar(45) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(75) DEFAULT NULL,
  `equipos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`equipos_id`),
  KEY `fk_clientes_equipos_idx` (`equipos_id`),
  CONSTRAINT `fk_clientes_equipos` FOREIGN KEY (`equipos_id`) REFERENCES `equipos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;
-- =================================================================================== -- ===================================================================================
-- Inserciones de la data para las tablas
-- Equipos
INSERT INTO `equipos` VALUES (1,'Consulta General');
INSERT INTO `equipos` VALUES (2,'Ultrasonidos');
INSERT INTO `equipos` VALUES (3,'Inyectables');
INSERT INTO `equipos` VALUES (4,'Cirujia');
INSERT INTO `equipos` VALUES (5,'Internados');
INSERT INTO `equipos` VALUES (6,'Emergencias');
-- Clientes
INSERT INTO `clientes` VALUES (1,'2023-09-09','Diana Peña','Zoe','7458-2356','diana@gmail.com',1);
INSERT INTO `clientes` VALUES (2,'2023-03-14','Cristian Zambada','Beli','8825-2356','crisz@gmail.com',1);
-- ===================================================================================
-- Vista de las tablas
select * from `equipos`;
select * from `clientes`;