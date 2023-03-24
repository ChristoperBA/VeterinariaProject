CREATE DATABASE Tienda;
use Tienda;

CREATE TABLE `paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `paises` VALUES (1,'Salvador'),(2,'Costa Rica'),(3,'Francia'),(4,'Argentina'),(5,'Chile');

CREATE TABLE `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(75) DEFAULT NULL,
  `paises_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`paises_id`),
  KEY `fk_personas_paises_idx` (`paises_id`),
  CONSTRAINT `fk_personas_paises` FOREIGN KEY (`paises_id`) REFERENCES `paises` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;

INSERT INTO `personas` VALUES (1,'Diana','Lima','Lima','7458-2356','diana@gmail.com',1);
INSERT INTO `personas` VALUES (2,'Carlos','Lue','Lima','6021-8514','dlue@gmail.com',3);
INSERT INTO `personas` VALUES (3,'Roxana','López','Lima','2451-7845','roxan@test.com',5);