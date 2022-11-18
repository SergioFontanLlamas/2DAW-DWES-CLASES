-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.31 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para 2daw
CREATE DATABASE IF NOT EXISTS `2daw` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `2daw`;

-- Volcando estructura para tabla 2daw.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla 2daw.categorias: ~2 rows (aproximadamente)
DELETE FROM `categorias`;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id`, `nombre`) VALUES
	(1, 'Frutas'),
	(2, 'Verduras');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla 2daw.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pedidos_users` (`usuario_id`),
  CONSTRAINT `FK_pedidos_users` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla 2daw.pedidos: ~6 rows (aproximadamente)
DELETE FROM `pedidos`;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` (`id`, `usuario_id`, `fecha`) VALUES
	(1, 2, '2022-11-17'),
	(2, 2, '2022-11-17'),
	(3, 2, '2022-11-17'),
	(4, 2, '2022-11-17'),
	(5, 2, '2022-11-17'),
	(6, 2, '2022-11-17');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

-- Volcando estructura para tabla 2daw.pedidos_has_productos
CREATE TABLE IF NOT EXISTS `pedidos_has_productos` (
  `pedido_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  KEY `FK__pedidos` (`pedido_id`),
  KEY `FK__productos` (`producto_id`),
  CONSTRAINT `FK__pedidos` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `FK__productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla 2daw.pedidos_has_productos: ~0 rows (aproximadamente)
DELETE FROM `pedidos_has_productos`;
/*!40000 ALTER TABLE `pedidos_has_productos` DISABLE KEYS */;
INSERT INTO `pedidos_has_productos` (`pedido_id`, `producto_id`, `unidades`, `precio`) VALUES
	(1, 1, 1, 2),
	(1, 2, 5, 4);
/*!40000 ALTER TABLE `pedidos_has_productos` ENABLE KEYS */;

-- Volcando estructura para tabla 2daw.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `precio` double NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_productos_categorias` (`categoria_id`),
  CONSTRAINT `FK_productos_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla 2daw.productos: ~2 rows (aproximadamente)
DELETE FROM `productos`;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `categoria_id`) VALUES
	(1, 'Manzana', 'Manzana roja de Andalucía', 2.09, 50, NULL, 2),
	(2, 'Patata', 'Patata de Castilla', 1.5, 143, NULL, 2),
	(3, 'Naranjas', 'Naranjas de Murcia', 1.6, 30, NULL, 1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla 2daw.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT '''cliente''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla 2daw.rol: ~3 rows (aproximadamente)
DELETE FROM `rol`;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id`, `nombre`) VALUES
	(1, 'Administrador'),
	(2, 'Cliente');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla 2daw.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla 2daw.users: ~4 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `nombre`, `apellidos`, `email`, `password`) VALUES
	(1, 'Sergio', 'Fontan', 'sfontan@profesores.imf.com', '$2y$10$9.3238CkHdpHXVmZ6hoTSuIGJMR5LHhZBrzZcFA9s37RFO5S.bC5K'),
	(2, 'Carlos', 'Rufiangel', 'crufiangel@profesores.imf.com', '$2y$10$9.3238CkHdpHXVmZ6hoTSuIGJMR5LHhZBrzZcFA9s37RFO5S.bC5K'),
	(3, 'Erica', 'Peñil', 'epenil@imf.com', '$2y$10$ZSIpDMc2Nf3XbA6UJ/EThOWbQC9QF6jFJ4HgKdYqyhqJy9GqzS5Qa'),
	(4, 'Antonio', 'Carmona', 'acarmona@profesores.imf.com', '$2y$10$9.3238CkHdpHXVmZ6hoTSuIGJMR5LHhZBrzZcFA9s37RFO5S.bC5K');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla 2daw.users_has_rol
CREATE TABLE IF NOT EXISTS `users_has_rol` (
  `user_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL DEFAULT '2',
  KEY `FK_users_has_rol_rol` (`rol_id`),
  KEY `FK_users_has_rol_users` (`user_id`) USING BTREE,
  CONSTRAINT `FK_users_has_rol_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `FK_users_has_rol_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla 2daw.users_has_rol: ~4 rows (aproximadamente)
DELETE FROM `users_has_rol`;
/*!40000 ALTER TABLE `users_has_rol` DISABLE KEYS */;
INSERT INTO `users_has_rol` (`user_id`, `rol_id`) VALUES
	(1, 1),
	(2, 2),
	(3, 1),
	(4, 2);
/*!40000 ALTER TABLE `users_has_rol` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
