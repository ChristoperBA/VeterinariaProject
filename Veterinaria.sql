-- VETERINARIA SAN MARTÍN DE PORRAS es un sitio en línea que brinda información y servicios relacionados con el cuidado de 
-- los animales, ofrecemos información sobre los servicios, información de los veterinarios, los horarios de atención, los 
-- precios, productos en venta, reservar citas con los veterinarios en línea, y un espacio para que los usuarios puedan hacer 
-- preguntas y recibir respuestas de profesionales de la veterinaria.
-- Además, proporcionamos información útil sobre el cuidado de los animales, como consejos de salud y nutrición, 
-- información sobre enfermedades comunes en las mascotas, y recomendaciones para la prevención de enfermedades. 

-- Integrantes: Christopher Briceño Arias, Melissa Ramirez Gomez, Mariana Ruiz Cruz, Marianne Von Herold Hering

-- ==================================================================================================================
-- Creacion de la Base de Datos Tienda
CREATE DATABASE Tienda;
use Tienda;
-- ==================================================================================================================
-- Creacion de las tablas 
-- Tabla Paises
CREATE TABLE `paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- INSERT INTO `paises` VALUES (1,'Salvador'),(2,'Costa Rica'),(3,'Francia'),(4,'Argentina'),(5,'Chile');

-- Tabla personas
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


-- Tabla Veterinarios
CREATE TABLE `veterinarios` (
  `idVeterinario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(75) DEFAULT NULL,
  `idPuesto` int(11) NOT NULL,
  PRIMARY KEY (`idVeterinario`,`idPuesto`),
  KEY `fk_veterinario_puesto` (`idPuesto`),
  CONSTRAINT `fk_veterinario_puesto` FOREIGN KEY (`idPuesto`) REFERENCES `puestosVeterinaria` (`idPuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;
-- Tabla Puestos de Veterinaria
CREATE TABLE `puestosVeterinaria`(
`idPuesto` int(11) NOT NULL AUTO_INCREMENT,
`nombrePuesto` varchar(45) NOT NULL,
`salario`  	 DOUBLE(10,2) NOT NULL,
 PRIMARY KEY (`idPuesto`)
);

-- Tabla Productos
CREATE TABLE `productos`(
`idProducto` int(11) NOT NULL AUTO_INCREMENT,
`nombreProducto` varchar(45) NOT NULL,
`Descripcion` varchar(100) NOT NULL,
`precio` int(11) NOT NULL,
`idCategoria` int(11) NOT NULL,
 PRIMARY KEY (`idProducto`)
 );
-- Tabla Categoria de Producto
CREATE TABLE `categoriaProductos`(
`idCategoria` int(11) NOT NULL AUTO_INCREMENT,
`nombreCategoria` varchar(45) NOT NULL,
PRIMARY KEY (`idCategoria`)
);

-- Tabla de Usuarios
CREATE TABLE `Usuarios`(
`idUsuario` int(11) NOT NULL AUTO_INCREMENT,
`nombreUsuario` varchar(45) NOT NULL,
`apellido1Usuario` varchar(45) NOT NULL,
`apellido2Usuario` varchar(45) NOT NULL,
`telefonoUsuario` varchar(9) NOT NULL,
`emailUsuario` varchar(75) DEFAULT NULL,
PRIMARY KEY (`idUsuario`)
);
-- Tabla de Reseñás
CREATE TABLE `resenas`(
`idResena` INT(11) NOT NULL AUTO_INCREMENT,
`idUsuario` INT(11) NOT NULL,
`detalleResena` VARCHAR(80) NOT NULL,
 PRIMARY KEY (`idResena`,`idUsuario`),
 KEY `fk_resenas_usuario` (`idUsuario`),
 CONSTRAINT `fk_resenas_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION

);
-- Tabla Citas
CREATE TABLE `citas`(
`idCita` INT(11) NOT NULL AUTO_INCREMENT,
`fecha` DATE NOT NULL,
`cupoMax` INT(7) NOT NULL,
 PRIMARY KEY (`idCita`)
);
-- Tabla PromocionesProductos
CREATE TABLE `promocionesProductos`(
	`idPromocion` int(11) NOT NULL AUTO_INCREMENT,
	`cantidadDescuento` FLOAT(8,2) NOT NULL,
    `codigoDescuento` varchar(45) NOT NULL,
	`idProducto` int(11) NOT NULL,
    PRIMARY KEY (`idPromocion`),
	KEY `fk_promocion_productos` (`idProducto`),
	CONSTRAINT `fk_promocion_productos`  FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- =================================================================================================== 
-- Insert de personas
INSERT INTO `personas` VALUES (1,'Diana','Lima','Lima','7458-2356','diana@gmail.com',1);
INSERT INTO `personas` VALUES (2,'Carlos','Lue','Lima','6021-8514','dlue@gmail.com',3);
INSERT INTO `personas` VALUES (3,'Roxana','López','Lima','2451-7845','roxan@test.com',5);
-- Insert Puestos de Veterinaria
INSERT INTO `puestosVeterinaria` VALUES(1,'Cirujano',1500000.00);
INSERT INTO `puestosVeterinaria` VALUES(2,'Oncologo',710000.00);
INSERT INTO `puestosVeterinaria` VALUES(3,'Fisioterapia',320000.00);
INSERT INTO `puestosVeterinaria` VALUES(4,'Rehabilitacion',320000.00);
INSERT INTO `puestosVeterinaria` VALUES(5,'Imagenologia',630000.00);
INSERT INTO `puestosVeterinaria` VALUES(6,'Fauna Silvestre',520000.00);
INSERT INTO `puestosVeterinaria` VALUES(7,'Asistente ',300000.00);
INSERT INTO `puestosVeterinaria` VALUES(8,'Contador',500000.00);
INSERT INTO `puestosVeterinaria` VALUES(9,'Administrador',1000000.00);
INSERT INTO `puestosVeterinaria` VALUES(10,'CEO',4000000.00);
-- Insert Veterinarios
INSERT INTO `veterinarios` VALUES(1,'Carlos','Serpas','Duran','7889-7832','CSerpas@gmail.com',1);
INSERT INTO `veterinarios` VALUES(2,'Valeria','Munoz','Viquez','6239-7732','VMunoz@gmail.com',1);
INSERT INTO `veterinarios` VALUES(3,'David','Roman','Ramirez','7789-1032','DRoman@gmail.com',2);
INSERT INTO `veterinarios` VALUES(4,'Veronica','Sandoval','Vargas','6089-1130','VSandoval@gmail.com',4);
INSERT INTO `veterinarios` VALUES(5,'Rafael','Mora','Perez','7090-7543','RMora@gmail.com',6);
INSERT INTO `veterinarios` VALUES(6,'Julian','Guitierrez','Lobo','6591-1321','JGutierrez@gmail.com',3);
INSERT INTO `veterinarios` VALUES(7,'Omar','Chavez','Gomez','8889-7290','OChavez@gmail.com',10);

-- Insert Categoria de Productos
INSERT INTO `categoriaProductos` VALUES (1,'Perros');
INSERT INTO `categoriaProductos` VALUES (2,'Gatos');
INSERT INTO `categoriaProductos` VALUES (3,'Aves');
INSERT INTO `categoriaProductos` VALUES (4,'Hamster');

-- Insert Productos 
INSERT INTO `productos` VALUES(1,'Premios para perro','Tamano: Adultos',6000,1);
INSERT INTO `productos` VALUES(2,'Comida para gato','Marca: Gatito Feliz',5000,2);
INSERT INTO `productos` VALUES(3,'Comida Hamster','Marca: Bigotes',1000,4);
INSERT INTO `productos` VALUES(4,'Collar','Antipulgas',15000,1);
INSERT INTO `productos` VALUES(5,'Hierba para Gato',' Contenido: 500mg',60000,3);

-- Insert Usuarios 
INSERT INTO `Usuarios` VALUES(1,'Josabeth','Rojas','Munoz','7881-2136','JRojas@gmail.com');
INSERT INTO `Usuarios` VALUES(2,'Daniel','Barrantes','Caravaca','8988-4322','DBarrantes@gmail.com');
INSERT INTO `Usuarios` VALUES(3,'Maria','Sanchez','Fonseca','8989-2322','MSanchez@gmail.com');
INSERT INTO `Usuarios` VALUES(4,'Valeria','Garcia','Munoz','7881-2136','VMunoz@gmail.com');
INSERT INTO `Usuarios` VALUES(5,'Luis','Morales','Aguero','8211-1326','LMorales@gmail.com');
INSERT INTO `Usuarios` VALUES(6,'Jose','Alegria','Jobi','7532-4314','JAlegria@gmail.com');

-- Insert Resenas 
INSERT INTO `resenas` VALUES(1,1,'Muy buenos veterinarios, curaron la enfermedad de mi perro.');
INSERT INTO `resenas` VALUES(2,2,'Productos excelente calidad.');
INSERT INTO `resenas` VALUES(3,3,'Entrega muy rapida de productos');
INSERT INTO `resenas` VALUES(4,4,'Mi gato se recupero muy rapido, gracias');
INSERT INTO `resenas` VALUES(5,5,'5 estrellas, me encanto el servicio');
-- Insert citas 
INSERT INTO `citas` VALUES(1,"2022-01-10",8);
INSERT INTO `citas` VALUES(2,"2022-01-11",8);
INSERT INTO `citas` VALUES(3,"2022-01-12",8);
INSERT INTO `citas` VALUES(4,"2022-01-13",8);
INSERT INTO `citas` VALUES(5,"2022-01-14",8);

-- Insert Promociones de productos de Productos 
INSERT INTO`promocionesProductos`VALUES(1,0.50,'50OFF',1);
INSERT INTO`promocionesProductos`VALUES(2,0.50,'2X1',2);
INSERT INTO`promocionesProductos`VALUES(3,0.25,'75OFF',3);
INSERT INTO`promocionesProductos`VALUES(4,0.75,'25OFF',4);
-- ===================================================================================================
-- Vista de personas
 SELECT * FROM `personas`;
-- Vista puestos de Veterinaria
SELECT * FROM `puestosVeterinaria`;
-- Vista Informacion de  Veterinarios
SELECT * FROM `veterinarios`;
-- Vista de Categoria de los productos
SELECT * FROM `categoriaProductos`;
-- Vista de productos
SELECT * FROM `productos`;
-- Vista de Usuarios
SELECT * FROM `Usuarios`;
-- Vista de resenas
SELECT * FROM `resenas`;
-- Vista de citas 
SELECT * FROM `citas`;
 -- ===================================================================================================