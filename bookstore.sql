# SQL Manager 2005 Lite for MySQL 3.7.0.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : bookstore


SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `bookstore`;

CREATE DATABASE `bookstore`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE `bookstore`;

#
# Structure for the `autores` table : 
#

DROP TABLE IF EXISTS `autores`;

CREATE TABLE `autores` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  `apellido` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `categorias` table : 
#

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL auto_increment,
  `descripcion` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `localidades` table : 
#

DROP TABLE IF EXISTS `localidades`;

CREATE TABLE `localidades` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  `codigo_postal` int(11) default NULL,
  `id_provincia` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `id_provincia` (`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `clientes` table : 
#

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL auto_increment,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `nombre` varchar(20) default NULL,
  `apellido` varchar(20) default NULL,
  `telefono` varchar(20) default NULL,
  `mail` varchar(20) default NULL,
  `rol` varchar(20) default NULL,
  `id_localidad` int(11) default NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `id_localidad` (`id_localidad`),
  CONSTRAINT `clientes_fk` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `editoriales` table : 
#

DROP TABLE IF EXISTS `editoriales`;

CREATE TABLE `editoriales` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `libros` table : 
#

DROP TABLE IF EXISTS `libros`;

CREATE TABLE `libros` (
  `id` int(11) NOT NULL auto_increment,
  `isbn` int(25) default NULL,
  `titulo` varchar(20) default NULL,
  `sipnosis` text,
  `numero_edicion` int(11) default NULL,
  `cantidad_paginas` int(11) default NULL,
  `precio` double(15,3) default NULL,
  `existencia` int(11) default NULL,
  `foto` varchar(255) default NULL,
  `id_editorial` int(11) default NULL,
  `id_categoria` int(11) default NULL,
  `id_autor` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `id_editorial` (`id_editorial`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `libros_fk` FOREIGN KEY (`id_editorial`) REFERENCES `editoriales` (`id`),
  CONSTRAINT `libros_fk1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  CONSTRAINT `libros_fk2` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `provincias` table : 
#

DROP TABLE IF EXISTS `provincias`;

CREATE TABLE `provincias` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `tipos_tarjetas` table : 
#

DROP TABLE IF EXISTS `tipos_tarjetas`;

CREATE TABLE `tipos_tarjetas` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  `id_provincia` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `tipos_tarjetas_fk` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `pedidos` table : 
#

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL auto_increment,
  `fecha_pedido` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `direccion` varchar(50) default NULL,
  `subtotal` double(15,3) default NULL,
  `numero_tarjeta` varchar(16) default NULL,
  `id_libro` int(11) default NULL,
  `id_cliente` int(11) default NULL,
  `id_localidad` int(11) default NULL,
  `id_tipo_tarjeta` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `id_tarjeta` (`numero_tarjeta`),
  KEY `id_libro` (`id_libro`),
  KEY `id_tipo_tarjeta` (`id_tipo_tarjeta`),
  KEY `id_localidad` (`id_localidad`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `pedidos_fk` FOREIGN KEY (`id_tipo_tarjeta`) REFERENCES `tipos_tarjetas` (`id`),
  CONSTRAINT `pedidos_fk1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`),
  CONSTRAINT `pedidos_fk2` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id`),
  CONSTRAINT `pedidos_fk3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `autores` table  (LIMIT 0,500)
#

INSERT INTO `autores` (`id`, `nombre`, `apellido`) VALUES 
  (1,'Pablo ','Coelho'),
  (2,'Cassandra','Claire'),
  (3,'Kate','Morton');

COMMIT;

#
# Data for the `categorias` table  (LIMIT 0,500)
#

INSERT INTO `categorias` (`id`, `descripcion`) VALUES 
  (1,'Terror'),
  (2,'Ciencia Ficci�n'),
  (3,'Policial'),
  (4,'Infantil'),
  (5,'Cocina');

COMMIT;

#
# Data for the `localidades` table  (LIMIT 0,500)
#

INSERT INTO `localidades` (`id`, `nombre`, `codigo_postal`, `id_provincia`) VALUES 
  (1,'Rosario',2000,1),
  (2,'Clarke',2218,0);

COMMIT;

#
# Data for the `clientes` table  (LIMIT 0,500)
#

INSERT INTO `clientes` (`id`, `usuario`, `clave`, `nombre`, `apellido`, `telefono`, `mail`, `rol`, `id_localidad`, `fecha_nacimiento`, `direccion`) VALUES 
  (2,'nlopez','1234','Natali','Natali','34144444','dsfsdfdsfs','user',1,'1993-11-01','sdsada'),
  (3,'mpintener','1234','Martina','Pintener','11111111','mpintener@gmail.com','user',2,'1993-10-19','Sarmiento 1621'),
  (4,'mcaste','1234','Mailen','Castellarin','3476597263','mai_clarke_20@hotmai','admin',1,'1993-07-20','sarmiento 223');

COMMIT;

#
# Data for the `editoriales` table  (LIMIT 0,500)
#

INSERT INTO `editoriales` (`id`, `nombre`) VALUES 
  (1,'Ediciones B'),
  (2,'Montana'),
  (3,'Suma de Letras');

COMMIT;

#
# Data for the `libros` table  (LIMIT 0,500)
#

INSERT INTO `libros` (`id`, `isbn`, `titulo`, `sipnosis`, `numero_edicion`, `cantidad_paginas`, `precio`, `existencia`, `foto`, `id_editorial`, `id_categoria`, `id_autor`) VALUES 
  (1,12133434,'Adulterio','Linda est� casada con un hombre rico, tienen dos hijos y la familia vive en una hermosa casa en Ginebra, Suiza. Trabaja en el peri�dico m�s importante del pa�s, es guapa, viste bien y tiene todo lo que se pueda desear. A ojos de todos, su vida es perfecta. Sin embargo, no es feliz; una gran insatisfacci�n la corroe y se siente culpable por no ser capaz de disfrutar de lo que tiene. Por eso no habla con nadie de lo que sucede. Ama a su marido pero la relaci�n con �l se ha vuelto rutinaria, ap�tica.\r\n\r\nUn d�a, el peri�dico la env�a a entrevistar a Jacob K�nig, un antiguo novio del instituto que ahora es un pol�tico de cierta relevancia. Este encuentro es suficiente para que ella se sienta capaz de hacer algo con lo que so�aba desde muchacha, y empieza a dar rienda suelta a sus fantas�as. Vuelve a sentir pasi�n por la vida. Ahora har� todo lo que sea para conquistar ese amor imposible y descender� hasta el fondo del pozo de las emociones humanas para, por fin, encontrar su redenci�n.',1000,5000,300,0,'http://www.librolibro.es/images/portadas/Adulterio-Paulo_Coelho-9788408131625.jpg',1,1,1),
  (2,222222,'El ultimo adi�s','Escritora de superventas Kate Morton sobresale una vez m�s con esta novela de misterio, con la Inglaterra de la d�cada de 1930 como sugerente tel�n de fondo. La trama es impecable y los personajes, modelados con habilidad y reunidos al final del libro como resultado de la investigaci�n de Sparrow, quedan tan sorprendidos como los lectores por el inesperado desenlace.',2,300,250,0,'http://3.bp.blogspot.com/-F3k3Zy9TEFg/VmBQ56USRPI/AAAAAAAAPVo/el-a2lql97g/s320/El%2B%25C3%25BAltimo%2Badi%25C3%25B3s.jpg',3,3,3),
  (3,333333333,'C�mo Hacer Helado','52 recetas para lograr sabores cl�sicos y contempor�neos',2,100,250,7,'http://dwumenp4rf1cd.cloudfront.net/wp-content/uploads/2015/04/howtomakeicecream_cover.jpg',3,5,3),
  (4,44444444,'Eating Well - Soups',NULL,1,95,175,0,'http://assets.eatingwell.com/sites/default/files/images/000-J16_EWSoups_COVER_final_noUPC.png',3,5,3),
  (5,555555555,'The Mayor''s Tongue ','.....',1,145,180,100,'http://www.creativindiecovers.com/wp-content/uploads/2012/02/beautiful-book-covers-36.png',3,1,1);

COMMIT;

#
# Data for the `provincias` table  (LIMIT 0,500)
#

INSERT INTO `provincias` (`id`, `nombre`) VALUES 
  (1,'Santa Fe'),
  (2,'Buenos Aires'),
  (3,'Tucuman'),
  (4,'Santiago del Estero'),
  (5,'Santa Cruz'),
  (6,'Tierra del Fuego'),
  (7,'Misiones'),
  (8,'Salta'),
  (9,'Jujuy'),
  (10,'Mendoza'),
  (11,'San Luis'),
  (12,'San Juan'),
  (13,'Chaco'),
  (14,'Corrientes'),
  (15,'Entre Rios'),
  (16,'La Pampa'),
  (17,'Rio Negro'),
  (18,'Neuquen'),
  (19,'Chubut');

COMMIT;

#
# Data for the `tipos_tarjetas` table  (LIMIT 0,500)
#

INSERT INTO `tipos_tarjetas` (`id`, `nombre`, `id_provincia`) VALUES 
  (1,'Naranja',NULL),
  (2,'Mastercard',NULL),
  (3,'Visa',NULL),
  (4,'American Express',NULL),
  (5,'Nativa',NULL);

COMMIT;

#
# Data for the `pedidos` table  (LIMIT 0,500)
#

INSERT INTO `pedidos` (`id`, `fecha_pedido`, `direccion`, `subtotal`, `numero_tarjeta`, `id_libro`, `id_cliente`, `id_localidad`, `id_tipo_tarjeta`) VALUES 
  (1,'2016-07-18 21:37:20','gorriti',250,'1234567',2,2,1,2),
  (2,'2016-07-18 21:45:50','hsagdhsa',250,'232',2,4,1,1),
  (3,'2016-07-18 21:49:59','sadas',250,'2121',2,4,1,2),
  (4,'2016-07-18 22:08:27','sds',250,'21321',2,4,1,2),
  (5,'2016-07-18 22:12:38','jjjjkl',250,'6787',2,4,1,1),
  (6,'2016-07-23 00:27:35','gorriti ',250,'1234567891234567',3,2,1,1),
  (7,'2016-07-23 00:27:36','gorriti ',180,'1234567891234567',5,2,1,1),
  (8,'2016-07-23 00:30:45','jnjknj',250,'11111111',3,2,1,1),
  (9,'2016-07-23 00:34:17','aaa',250,'1234567891234567',3,2,1,1),
  (10,'2016-08-06 16:15:24','dfdfd',180,'',5,4,1,1),
  (11,'2016-08-06 16:17:05','asds',180,'aaaaaaaaaaaaaaaa',5,4,1,1),
  (12,'2016-08-06 16:18:26','asfs',175,'1aaaaaaaaaaaaaaa',4,4,1,1),
  (13,'2016-08-06 16:21:13','adasd',175,'',4,4,1,2),
  (14,'2016-08-06 16:21:57','dads',175,'',4,4,1,2),
  (15,'2016-08-06 16:25:07','dadsa',250,'',3,4,1,1),
  (16,'2016-08-06 16:28:47','aads',250,'1111111111111111',3,4,1,1),
  (17,'2016-08-06 16:36:22','asdsd',250,'1234567891234567',3,4,1,1),
  (18,'2016-08-06 16:36:22','asdsd',250,'1234567891234567',3,4,1,1),
  (19,'2016-08-06 16:52:50','adas',250,'1234567891234567',3,4,1,1);

COMMIT;

