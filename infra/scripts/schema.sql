CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `description` text,
  `imageUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
