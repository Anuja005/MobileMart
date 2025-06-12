-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for futmalls1
CREATE DATABASE IF NOT EXISTS `futmalls1` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `futmalls1`;

-- Dumping structure for table futmalls1.address
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `line1` text NOT NULL,
  `line2` text NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_user1_idx` (`user_id`),
  KEY `fk_table1_city1_idx` (`city_id`),
  CONSTRAINT `fk_table1_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_table1_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.address: ~0 rows (approximately)
INSERT INTO `address` (`id`, `first_name`, `last_name`, `line1`, `line2`, `postal_code`, `mobile`, `user_id`, `city_id`) VALUES
	(1, 'Anuja', 'Rashmika', 'Wadagama', 'Srawasthipura', '50042', '0773480439', 1, 1);

-- Dumping structure for table futmalls1.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_user1_idx` (`user_id`),
  KEY `fk_cart_product1_idx` (`product_id`),
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.cart: ~0 rows (approximately)

-- Dumping structure for table futmalls1.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.category: ~2 rows (approximately)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Apple'),
	(2, 'Sony');

-- Dumping structure for table futmalls1.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.city: ~2 rows (approximately)
INSERT INTO `city` (`id`, `name`) VALUES
	(1, 'Anuradhapura'),
	(2, 'Colombo');

-- Dumping structure for table futmalls1.color
CREATE TABLE IF NOT EXISTS `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.color: ~2 rows (approximately)
INSERT INTO `color` (`id`, `name`) VALUES
	(1, 'Red'),
	(2, 'White'),
	(3, 'Black');

-- Dumping structure for table futmalls1.model
CREATE TABLE IF NOT EXISTS `model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_model_category_idx` (`category_id`),
  CONSTRAINT `fk_model_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.model: ~4 rows (approximately)
INSERT INTO `model` (`id`, `name`, `category_id`) VALUES
	(1, 'iPhone 11', 1),
	(2, 'iPhone X', 1),
	(3, 'Xperia 6', 2),
	(4, 'Xperia 7', 2),
	(5, 'iPhone 7', 1);

-- Dumping structure for table futmalls1.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_user1_idx` (`user_id`),
  KEY `fk_orders_address1_idx` (`address_id`),
  CONSTRAINT `fk_orders_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_orders_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.orders: ~5 rows (approximately)
INSERT INTO `orders` (`id`, `date_time`, `user_id`, `address_id`) VALUES
	(4, '2024-09-18 01:14:30', 1, 1),
	(5, '2024-09-18 01:25:43', 1, 1),
	(6, '2024-09-18 01:27:21', 1, 1),
	(7, '2024-09-18 01:47:02', 1, 1),
	(8, '2024-09-18 01:56:29', 1, 1),
	(9, '2024-09-18 09:50:28', 1, 1);

-- Dumping structure for table futmalls1.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `qty` varchar(45) NOT NULL,
  `order_status_id` int NOT NULL,
  `orders_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_product1_idx` (`product_id`),
  KEY `fk_order_item_order_status1_idx` (`order_status_id`),
  KEY `fk_order_item_orders1_idx` (`orders_id`),
  CONSTRAINT `fk_order_item_order_status1` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `fk_order_item_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_item_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.order_item: ~7 rows (approximately)
INSERT INTO `order_item` (`id`, `product_id`, `qty`, `order_status_id`, `orders_id`) VALUES
	(1, 2, '1', 1, 4),
	(2, 1, '1', 1, 4),
	(3, 2, '1', 1, 5),
	(4, 1, '1', 1, 6),
	(5, 2, '1', 1, 7),
	(6, 1, '1', 1, 8),
	(7, 2, '1', 1, 8),
	(8, 5, '1', 1, 9);

-- Dumping structure for table futmalls1.order_status
CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.order_status: ~2 rows (approximately)
INSERT INTO `order_status` (`id`, `name`) VALUES
	(1, 'Pending'),
	(2, 'Complete');

-- Dumping structure for table futmalls1.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `model_id` int NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `qty` int NOT NULL,
  `storage_id` int NOT NULL,
  `color_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `condition_id` int NOT NULL,
  `product_status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_model1_idx` (`model_id`),
  KEY `fk_product_storage1_idx` (`storage_id`),
  KEY `fk_product_color1_idx` (`color_id`),
  KEY `fk_product_user1_idx` (`user_id`),
  KEY `fk_product_condition1_idx` (`condition_id`),
  KEY `fk_product_product_status1_idx` (`product_status_id`),
  CONSTRAINT `fk_product_color1` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  CONSTRAINT `fk_product_condition1` FOREIGN KEY (`condition_id`) REFERENCES `product_condition` (`id`),
  CONSTRAINT `fk_product_model1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  CONSTRAINT `fk_product_product_status1` FOREIGN KEY (`product_status_id`) REFERENCES `product_status` (`id`),
  CONSTRAINT `fk_product_storage1` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `fk_product_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.product: ~6 rows (approximately)
INSERT INTO `product` (`id`, `model_id`, `title`, `description`, `price`, `qty`, `storage_id`, `color_id`, `user_id`, `date_time`, `condition_id`, `product_status_id`) VALUES
	(1, 1, 'Apple iPhone 11 ', 'Global', 15000, 7, 1, 3, 1, '2024-09-18 00:59:48', 1, 1),
	(2, 1, 'Apple iPhone 11', 'Global', 100, 6, 2, 2, 1, '2024-09-18 01:00:38', 1, 1),
	(3, 4, 'Sony Xperia 7 ', 'Global', 300, 10, 2, 3, 1, '2024-09-18 02:06:21', 2, 1),
	(4, 5, 'iPhone 7', 'Global', 300, 13, 2, 1, 1, '2024-09-18 02:30:18', 2, 1),
	(5, 2, 'iPhone X', 'iPhone X', 500, 13, 2, 2, 1, '2024-09-18 02:31:21', 1, 1),
	(6, 2, 'Apple iPhone X White', 'iPhone Global', 5000, 15, 2, 2, 2, '2024-09-18 09:49:31', 1, 1),
	(7, 2, 'Apple iPhone X', 'iPhone ', 3000, 13, 2, 2, 1, '2024-09-18 09:57:51', 2, 1);

-- Dumping structure for table futmalls1.product_condition
CREATE TABLE IF NOT EXISTS `product_condition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.product_condition: ~2 rows (approximately)
INSERT INTO `product_condition` (`id`, `name`) VALUES
	(1, 'New'),
	(2, 'Used');

-- Dumping structure for table futmalls1.product_status
CREATE TABLE IF NOT EXISTS `product_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.product_status: ~2 rows (approximately)
INSERT INTO `product_status` (`id`, `name`) VALUES
	(1, 'Active'),
	(2, 'Deactive');

-- Dumping structure for table futmalls1.storage
CREATE TABLE IF NOT EXISTS `storage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.storage: ~2 rows (approximately)
INSERT INTO `storage` (`id`, `value`) VALUES
	(1, '128'),
	(2, '256');

-- Dumping structure for table futmalls1.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `verification` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table futmalls1.user: ~2 rows (approximately)
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `verification`) VALUES
	(1, 'Anuja', 'Rashmika', 'ajrash70@gmail.com', 'Cyrax@123', 'Verified'),
	(2, 'Anuja', 'RAsh', 'anuja.helasoft@gmail.com', 'Cyrax@123', 'Verified');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
