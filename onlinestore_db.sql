-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2018 at 08:18 AM
-- Server version: 5.7.21
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `online_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `name`) VALUES
(1, 'JNE'),
(2, 'TIKI'),
(3, 'POS');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) UNSIGNED NOT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT '0',
  `discount_type` enum('nominal','percentage') DEFAULT NULL,
  `discount_value` float UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `sku`, `name`, `price`, `discount_type`, `discount_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MBA-001', 'Macbook Air 11 inch', 11000000, NULL, NULL, '2018-03-27 04:14:59', '2018-03-27 04:14:59', NULL),
(2, 'MBA-002', 'Macbook AIr 13 inch', 13000000, 'nominal', 200000, '2018-03-27 04:15:37', '2018-03-27 04:15:37', NULL),
(3, 'MBP-001', 'Macbook Pro 13 inch 2015 256GB', 14000000, NULL, NULL, '2018-03-27 04:16:20', '2018-03-27 05:10:07', NULL),
(4, 'IPHX-001', 'iPhone X 256GB', 21000000, NULL, NULL, '2018-03-27 04:17:01', '2018-03-27 04:17:01', NULL),
(5, 'AROG-001', 'Asus ROG Stryx', 14500000, NULL, NULL, '2018-03-27 04:17:49', '2018-03-27 04:17:54', NULL),
(6, 'IMAC-001', 'iMac 5K 27 inch 1TB Fusion Drive', 27000000, NULL, NULL, '2018-03-27 04:19:24', '2018-03-27 05:12:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `location_cities`
--

CREATE TABLE `location_cities` (
  `id` int(11) UNSIGNED NOT NULL,
  `province_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `location_cities`
--

INSERT INTO `location_cities` (`id`, `province_id`, `name`) VALUES
(1, 1, 'Kota Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `location_countries`
--

CREATE TABLE `location_countries` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `location_countries`
--

INSERT INTO `location_countries` (`id`, `name`) VALUES
(1, 'Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `location_districts`
--

CREATE TABLE `location_districts` (
  `id` int(11) UNSIGNED NOT NULL,
  `city_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `location_districts`
--

INSERT INTO `location_districts` (`id`, `city_id`, `name`) VALUES
(1, 1, 'Dago');

-- --------------------------------------------------------

--
-- Table structure for table `location_provinces`
--

CREATE TABLE `location_provinces` (
  `id` int(11) UNSIGNED NOT NULL,
  `country_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `location_provinces`
--

INSERT INTO `location_provinces` (`id`, `country_id`, `name`) VALUES
(1, 1, 'Jawa Barat');

-- --------------------------------------------------------

--
-- Table structure for table `location_villages`
--

CREATE TABLE `location_villages` (
  `id` int(11) UNSIGNED NOT NULL,
  `district_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `location_villages`
--

INSERT INTO `location_villages` (`id`, `district_id`, `name`) VALUES
(1, 1, 'Coblong');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `item` json DEFAULT NULL,
  `shipping_address` json DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `payments` json DEFAULT NULL,
  `total` decimal(11,0) UNSIGNED DEFAULT NULL,
  `status` enum('unpaid','paid','canceled') DEFAULT NULL,
  `courier_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `item`, `shipping_address`, `notes`, `payments`, `total`, `status`, `courier_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '{\"qty\": 1, \"sku\": \"MBA-001\", \"name\": \"Macbook Air 11 inch\", \"price\": 11000000}', '{}', NULL, '{}', '11000000', 'paid', 1, '2018-02-11 04:22:57', '2018-03-27 05:18:44', NULL),
(2, 2, '{\"qty\": 1, \"sku\": \"MBA-001\", \"name\": \"Macbook Air 11 inch\", \"price\": 11000000}', '{}', NULL, '{}', '11000000', 'unpaid', 2, '2018-02-12 04:49:09', '2018-03-27 05:18:35', NULL),
(3, 1, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"23000000\"}', '{}', NULL, '{}', '27000000', 'unpaid', 3, '2018-03-11 05:03:04', '2018-03-27 05:18:54', NULL),
(5, 3, '{\"qty\": 1, \"sku\": \"AROG-001\", \"name\": \"Asus ROG Stryx\", \"price\": \"14500000\"}', '{}', NULL, '{}', '14500000', 'unpaid', 1, '2018-01-09 05:03:04', '2018-03-27 05:17:22', NULL),
(6, 1, '{\"qty\": 1, \"sku\": \"AROG-001\", \"name\": \"Asus ROG Stryx\", \"price\": \"14500000\"}', '{}', NULL, '{}', '14500000', 'unpaid', 3, '2018-01-23 05:03:04', '2018-03-27 05:19:01', NULL),
(7, 3, '{\"qty\": 1, \"sku\": \"IPHX-001\", \"name\": \"iPhone X 256GB\", \"price\": \"21000000\"}', '{}', NULL, '{}', '21000000', 'unpaid', 1, '2018-02-13 05:03:04', '2018-03-27 05:15:36', NULL),
(8, 1, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"23000000\"}', '{}', NULL, '{}', '27000000', 'unpaid', 1, '2018-03-12 05:03:04', '2018-03-27 05:16:07', NULL),
(9, 4, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"27000000\"}', '{}', NULL, '{}', '27000000', 'unpaid', 1, '2018-03-26 05:03:04', '2018-03-27 05:16:35', NULL),
(10, 1, '{\"qty\": 1, \"sku\": \"IPHX-001\", \"name\": \"iPhone X 256GB\", \"price\": \"21000000\"}', '{}', NULL, '{}', '21000000', 'paid', 1, '2018-02-20 05:03:04', '2018-03-27 05:15:40', NULL),
(11, 2, '{\"qty\": 1, \"sku\": \"AROG-001\", \"name\": \"Asus ROG Stryx\", \"price\": \"14500000\"}', '{}', NULL, '{}', '14500000', 'paid', 2, '2018-03-27 05:03:04', '2018-03-27 05:19:00', NULL),
(12, 2, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"27000000\"}', '{}', NULL, '{}', '27000000', 'unpaid', 1, '2018-03-27 05:03:04', '2018-03-27 05:13:47', NULL),
(13, 5, '{\"qty\": 1, \"sku\": \"MBP-001\", \"name\": \"Macbook Pro 13 inch 2015 256GB\", \"price\": \"14000000\"}', '{}', NULL, '{}', '14000000', 'unpaid', 2, '2018-03-20 05:03:04', '2018-03-27 05:18:55', NULL),
(14, 7, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"27000000\"}', '{}', NULL, '{}', '27000000', 'paid', 2, '2018-03-24 05:03:04', '2018-03-27 05:18:57', NULL),
(15, 3, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"27000000\"}', '{}', NULL, '{}', '27000000', 'unpaid', 1, '2018-03-22 05:03:04', '2018-03-27 05:17:42', NULL),
(16, 1, '{\"qty\": 1, \"sku\": \"MBP-001\", \"name\": \"Macbook Pro 13 inch 2015 256GB\", \"price\": \"14000000\"}', '{}', NULL, '{}', '14000000', 'unpaid', 3, '2018-03-21 05:03:04', '2018-03-27 05:18:56', NULL),
(17, 1, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"27000000\"}', '{}', NULL, '{}', '27000000', 'unpaid', 1, '2018-03-20 05:03:04', '2018-03-27 05:17:45', NULL),
(18, 2, '{\"qty\": 1, \"sku\": \"MBP-001\", \"name\": \"Macbook Pro 13 inch 2015 256GB\", \"price\": \"14000000\"}', '{}', NULL, '{}', '14000000', 'unpaid', 1, '2018-03-24 05:03:04', '2018-03-27 05:16:29', NULL),
(19, 1, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"27000000\"}', '{}', NULL, '{}', '27000000', 'canceled', 1, '2018-01-03 05:03:04', '2018-03-27 05:16:50', NULL),
(20, 3, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"23000000\"}', '{}', NULL, '{}', '27000000', 'unpaid', 1, '2018-03-14 05:03:04', '2018-03-27 05:16:10', NULL),
(21, 1, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"27000000\"}', '{}', NULL, '{}', '27000000', 'unpaid', 2, '2018-01-04 05:03:04', '2018-03-27 05:19:01', NULL),
(22, 4, '{\"qty\": 1, \"sku\": \"MBP-001\", \"name\": \"Macbook Pro 13 inch 2015 256GB\", \"price\": \"14000000\"}', '{}', NULL, '{}', '14000000', 'canceled', 1, '2018-03-25 05:03:04', '2018-03-27 05:16:33', NULL),
(23, 1, '{\"qty\": 1, \"sku\": \"IPHX-001\", \"name\": \"iPhone X 256GB\", \"price\": \"21000000\"}', '{}', NULL, '{}', '21000000', 'unpaid', 2, '2018-02-24 05:03:04', '2018-03-27 05:18:49', NULL),
(24, 3, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"23000000\"}', '{}', NULL, '{}', '27000000', 'canceled', 2, '2018-03-15 05:03:04', '2018-03-27 05:19:04', NULL),
(25, 6, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"27000000\"}', '{}', NULL, '{}', '27000000', 'unpaid', 1, '2018-03-19 05:03:04', '2018-03-27 05:17:48', NULL),
(26, 4, '{\"qty\": 1, \"sku\": \"AROG-001\", \"name\": \"Asus ROG Stryx\", \"price\": \"14500000\"}', '{}', NULL, '{}', '14500000', 'unpaid', 1, '2018-03-27 05:03:04', '2018-03-27 05:14:07', NULL),
(27, 1, '{\"qty\": 1, \"sku\": \"IPHX-001\", \"name\": \"iPhone X 256GB\", \"price\": \"21000000\"}', '{}', NULL, '{}', '21000000', 'unpaid', 1, '2018-03-01 05:03:04', '2018-03-27 05:15:54', NULL),
(28, 5, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"23000000\"}', '{}', NULL, '{}', '27000000', 'unpaid', 1, '2018-03-19 05:03:04', '2018-03-27 05:16:19', NULL),
(29, 1, '{\"qty\": 1, \"sku\": \"IMAC-001\", \"name\": \"iMac 5K 27 inch\", \"price\": \"27000000\"}', '{}', NULL, '{}', '27000000', 'paid', 1, '2018-01-31 05:03:04', '2018-03-27 05:17:15', NULL),
(30, 1, '{\"qty\": 1, \"sku\": \"IPHX-001\", \"name\": \"iPhone X 256GB\", \"price\": \"21000000\"}', '{}', NULL, '{}', '21000000', 'unpaid', 3, '2018-03-04 05:03:04', '2018-03-27 05:18:50', NULL),
(31, 7, '{\"qty\": 1, \"sku\": \"IPHX-001\", \"name\": \"iPhone X 256GB\", \"price\": \"21000000\"}', '{}', NULL, '{}', '21000000', 'paid', 1, '2018-03-09 05:03:04', '2018-03-27 05:16:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_trackings`
--

CREATE TABLE `order_trackings` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` tinytext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `order_trackings`
--

INSERT INTO `order_trackings` (`id`, `order_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sedang diproses', NULL, '2018-03-27 04:36:31', '2018-03-27 04:36:31'),
(2, 1, 'Sudah dikirim', NULL, '2018-03-28 05:16:35', '2018-03-27 04:36:51');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `village_id` int(11) UNSIGNED NOT NULL,
  `district_id` int(11) UNSIGNED NOT NULL,
  `city_id` int(11) UNSIGNED NOT NULL,
  `province_id` int(11) UNSIGNED NOT NULL,
  `country_id` int(11) UNSIGNED NOT NULL,
  `zip` mediumint(5) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `user_id`, `label`, `phone`, `address`, `village_id`, `district_id`, `city_id`, `province_id`, `country_id`, `zip`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'Rumahku', '01930928', 'Kumis Kucing 32', 1, 1, 1, 1, 1, 75324, '2018-03-27 04:26:13', '2018-03-27 04:37:55', NULL),
(2, 1, 'Rumah di Bandung', '086757648', 'Jalan Kenangan 29', 1, 1, 1, 1, 1, 32782, '2018-03-27 04:39:24', '2018-03-27 04:39:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` char(60) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `name`, `password`, `phone`, `last_login`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'mul14', 'mul14@example.com', 'Mulia Nasution', '$2y$10$ZN59at3SM1nPW8hcvn3LFuTYWhMxkNTwiro3k3JyKUPlU6vlTRrcO', '0274738222', '2018-03-27 04:22:31', '2018-03-27 04:19:59', '2018-03-27 05:20:14', NULL),
(2, 'geese', 'geese@example.com', 'Geese Howard', '$2y$10$ZN59at3SM1nPW8hcvn3LFuTYWhMxkNTwiro3k3JyKUPlU6vlTRrcO', '08123422324', '2018-03-27 04:22:31', '2018-03-27 04:20:18', '2018-03-27 05:20:26', NULL),
(4, 'terry', 'terry@bogard.net', 'Terry Bogard', '$2y$10$ZN59at3SM1nPW8hcvn3LFuTYWhMxkNTwiro3k3JyKUPlU6vlTRrcO', '07272422431', '2018-03-27 04:22:31', '2018-03-27 04:21:31', '2018-03-27 05:20:31', NULL),
(5, 'andy', 'andy@bogard.net', 'Andy Bogard', '$2y$10$ZN59at3SM1nPW8hcvn3LFuTYWhMxkNTwiro3k3JyKUPlU6vlTRrcO', '07612637271', '2018-03-27 04:22:31', '2018-03-27 04:21:31', '2018-03-27 05:20:35', NULL),
(6, 'goku', 'goku@dbs.org', 'Son Goku', '$2y$10$ZN59at3SM1nPW8hcvn3LFuTYWhMxkNTwiro3k3JyKUPlU6vlTRrcO', '01273727843', '2018-03-27 04:22:31', '2018-03-27 04:22:13', '2018-03-27 05:20:38', NULL),
(7, 'kurono', 'kurono@gantz.com', 'Kei Kurono', '$2y$10$ZN59at3SM1nPW8hcvn3LFuTYWhMxkNTwiro3k3JyKUPlU6vlTRrcO', '05523773732', '2018-03-27 04:22:31', '2018-03-27 04:22:31', '2018-03-27 05:20:42', NULL),
(8, 'gintama', 'gintama@example.com', 'Gintama', '$2y$10$ZN59at3SM1nPW8hcvn3LFuTYWhMxkNTwiro3k3JyKUPlU6vlTRrcO', '08123872282', NULL, '2018-03-27 06:20:59', '2018-03-27 06:21:06', NULL),
(9, 'kurama', 'kurama@jinchuuriki.org', 'Kurama Jinchuuriki', '$2y$10$ZN59at3SM1nPW8hcvn3LFuTYWhMxkNTwiro3k3JyKUPlU6vlTRrcO', '02737673733', NULL, '2018-03-27 06:20:59', '2018-03-27 06:22:31', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_cities`
--
ALTER TABLE `location_cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_id` (`province_id`);

--
-- Indexes for table `location_countries`
--
ALTER TABLE `location_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_districts`
--
ALTER TABLE `location_districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `location_provinces`
--
ALTER TABLE `location_provinces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `location_villages`
--
ALTER TABLE `location_villages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_id` (`district_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courier_id` (`courier_id`);

--
-- Indexes for table `order_trackings`
--
ALTER TABLE `order_trackings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location_cities`
--
ALTER TABLE `location_cities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `location_countries`
--
ALTER TABLE `location_countries`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `location_districts`
--
ALTER TABLE `location_districts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `location_provinces`
--
ALTER TABLE `location_provinces`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `location_villages`
--
ALTER TABLE `location_villages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `order_trackings`
--
ALTER TABLE `order_trackings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `location_cities`
--
ALTER TABLE `location_cities`
  ADD CONSTRAINT `location_cities_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `location_provinces` (`id`);

--
-- Constraints for table `location_districts`
--
ALTER TABLE `location_districts`
  ADD CONSTRAINT `location_districts_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `location_cities` (`id`);

--
-- Constraints for table `location_provinces`
--
ALTER TABLE `location_provinces`
  ADD CONSTRAINT `location_provinces_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `location_countries` (`id`);

--
-- Constraints for table `location_villages`
--
ALTER TABLE `location_villages`
  ADD CONSTRAINT `location_villages_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `location_districts` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`);
COMMIT;