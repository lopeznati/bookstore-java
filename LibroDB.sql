# SQL Manager 2005 Lite for MySQL 3.7.0.1
# ---------------------------------------
# Host     : localhost
# Port     : 3307
# Database : LibroDB


SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `LibroDB`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

#
# Structure for the `libros` table : 
#

CREATE TABLE `libros` (
  `id` int(11) NOT NULL auto_increment,
  `isbn` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `libros` table  (LIMIT 0,500)
#

INSERT INTO `libros` (`id`, `isbn`) VALUES 
  (1,11111),
  (2,12345);

COMMIT;

