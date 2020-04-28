-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2020 at 12:03 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `street` varchar(30) NOT NULL,
  `zip` varchar(15) NOT NULL,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `coordx` varchar(255) NOT NULL,
  `coordy` varchar(255) NOT NULL,
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `street`, `zip`, `city`, `country`, `coordx`, `coordy`, `fk_user_id`) VALUES
(1, 'Blue Str. 123', '1110', 'Vienna', 'Austria', '48.208176', '16.373819', 1),
(2, 'Red Str. 94', '75000', 'Paris', 'France', '48.856613', '2.352222', 2),
(3, 'Water Str. 123', '104 13', 'Athens', 'Greece', '37.983810', '23.727539', 3);

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `answers_id` int(11) NOT NULL,
  `answer_msg` varchar(250) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `card_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `cart_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `discount_code`
--

CREATE TABLE `discount_code` (
  `discount_id` int(11) NOT NULL,
  `codemsg` varchar(10) NOT NULL,
  `discountname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `order_qty` int(11) NOT NULL,
  `order_price` int(11) NOT NULL,
  `orderedpdt_name` varchar(255) NOT NULL,
  `fk_discount_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `category` enum('electronics','household','clothes','food','medicine','pets_kids') NOT NULL,
  `product_price` float NOT NULL,
  `description` varchar(200) NOT NULL,
  `product_img` varchar(255) NOT NULL,
  `available_amount` int(11) NOT NULL,
  `sales_discount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `category`, `product_price`, `description`, `product_img`, `available_amount`, `sales_discount`) VALUES
(1, 'MacBook Pro', 'electronics', 2500, '8‐Core Intel Core i9 Processors, 9th Generation.\r\nBrilliant Retina display with True Tone technology.\r\nTouch Bar and Touch ID.\r\nAMD Radeon Pro 5500M with 4GB GDDR6 Graphics Memory.\r\nUltra-fast SSD.', 'https://images-na.ssl-images-amazon.com/images/I/81dz-zS5xNL._AC_SL1500_.jpg', 15, 0),
(2, 'Braun Satin Hairdryer', 'electronics', 35, 'Revolutionary IONTEC technology releases millins of active IONS to boost shine, combat frizz, smooth hair.\r\nSwitch on the Satin Protect feature, designed for 100% protection from overheating.', 'https://images-na.ssl-images-amazon.com/images/I/61NFY2TpJzL._AC_SL1500_.jpg', 20, 0),
(3, 'Samsung Galaxy M30s', 'electronics', 270, 'Operating system: Android 9.0 (Pie) with One UI.\r\nOptical sensor resolution: 13 MP, F1.9 con AF, Flash LED.\r\nMemory capacity: 32 GB, expandable with 512 GB MicroSD.', 'https://images-na.ssl-images-amazon.com/images/I/612deTUC7xL._AC_SL1500_.jpg', 10, 0),
(4, 'Sony WH-1000XM3 Headphones', 'electronics', 250, 'Extra Bass for, powerful sound.\r\nDigital Noicecancelling on a buttonclick.\r\nUp to 30 hours battery life.', 'https://images-na.ssl-images-amazon.com/images/I/61ObHjcfkfL._AC_SL1500_.jpg', 20, 0),
(5, 'Muffin Tray', 'household', 10, 'Perforated Baking Tray Specially Curved for Three Ultra Crispy Baguettes\r\nWith high-quality, non-stick coating.\r\nSize 38.5 x 28 cm.', 'https://images-na.ssl-images-amazon.com/images/I/81Vy-eUVGbL._AC_SL1500_.jpg', 25, 0),
(6, 'Cups Set of 4', 'household', 15, 'Handcraft: smooth black border without burrs or splinters. Glossy enamel coating gives the cup rust resistance. Comfortable to use with firm grip\r\nBorderless design for easy drinking.', 'https://images-na.ssl-images-amazon.com/images/I/615a22-z3xL._AC_SL1000_.jpg', 20, 0),
(7, 'AEG Mixer', 'household', 35, 'Powerful chop the compact mini mixer 0.4 PS motor easily up all creamy smoothies and delicious shakes. Cap on the mixer bottle screws – and the favourite drink is the Genussvolle daily companion.', 'https://www.amazon.de/-/en/dp/B079PX5VV9?ref_=s9_apbd_otopr_hd_bw_bDIP5&pf_rd_r=N5WA1K5CMSN5A9EW08X6&pf_rd_p=b34c962b-ef79-504e-8ca8-d497a88d7458&pf_rd_s=merchandised-search-10&pf_rd_t=BROWSE&pf_rd_i=3169011', 10, 0),
(8, 'Bath Towel Set', 'household', 25, 'Do not use bleach, fabric softener or iron, as this may affect quality; always wash the towels separately to avoid lint.\r\nThe set contains six identical cotton pool, fitness and bath towels.', 'https://images-na.ssl-images-amazon.com/images/I/A1teV2ikevL._AC_SL1500_.jpg', 30, 0),
(9, 'Kids Shorts', 'clothes', 10, 'Highly functional material wicks the perspiration away from your skin, keeping you dry and comfortable, even during training.\r\nThermally printed PUMA Cat logo on the left leg.\r\n100% polyester.', 'https://images-na.ssl-images-amazon.com/images/I/71OOvlmdGeL._AC_SL1500_.jpg', 20, 0),
(10, 'Jacket', 'clothes', 70, 'Outer material: high-quality 100% cotton. Lining: warm, soft fleece lining (100% polyester).\r\nMedium length trench coat jacket with removable zip hood to turn it into a stand-up jacket.', 'https://images-na.ssl-images-amazon.com/images/I/6144CO%2BZAdL._AC_SL1288_.jpg', 15, 0),
(11, 'Women\'s Socks Pack of 6', 'clothes', 10, 'Breathable and antibacterial\r\nHigh-quality cotton is highly breathable. \r\nSilver ions, which have a strong bacteriostasis, are added to our socks to protect the health of your feet and prevent odours.', 'https://images-na.ssl-images-amazon.com/images/I/71gKtKyeASL._AC_SL1200_.jpg', 15, 0),
(12, 'Pasta Spirali', 'food', 0.8, 'Original Italian Pasta', 'https://images-na.ssl-images-amazon.com/images/I/81wqDnITw8L._SL1500_.jpg', 25, 0),
(13, 'Premium Basmati Rice', 'food', 2.5, 'First Class Basmati Rice from India, grown in the feet of the Himalaya.', 'https://images-na.ssl-images-amazon.com/images/I/81fdybdTcOL._SL1500_.jpg', 20, 0),
(14, 'Chili-Bean Sauce', 'food', 3.6, 'High quality Chili-Bean Sauce.\r\nBright red chili paste and spicy.', 'https://images-na.ssl-images-amazon.com/images/I/81s1Ty2U96L._SL1500_.jpg', 25, 0),
(15, 'Neutrogena Hand Cream', 'medicine', 10, 'Instantly smooth hands after applying.\r\nProvides intense moisture and protects against the drying out.', 'https://images-na.ssl-images-amazon.com/images/I/71sWNQgECHL._AC_SL1500_.jpg', 15, 0),
(16, 'Colgate Toothpaste,Double Pack', 'medicine', 10, 'Tooth protection\r\nProtects against plaque\r\nGum protection\r\nEffectively protects against pain\r\nAgainst tartar and protects the enamel', 'https://images-na.ssl-images-amazon.com/images/I/81uaN2tmXTL._AC_SL1500_.jpg', 15, 0),
(17, 'Green Tea Body Cream', 'medicine', 20, 'Extreme hydration cream for the whole body.', 'https://images-na.ssl-images-amazon.com/images/I/51QUwiePL9L._SL1000_.jpg', 15, 0),
(18, 'Uttora Outdoor Researcher Set', 'pets_kids', 25.5, '22 piece exploration kit for: Halloween, holiday, summer or all year over.\r\nIncludes high-quality working binoculars; bug collector; butterfly net; whistle; tweezers & more.', 'https://images-na.ssl-images-amazon.com/images/I/71V5Dn-R20L._AC_SL1200_.jpg', 15, 0),
(19, 'Galaxy Slime 3pcs', 'pets_kids', 10, 'No Borax: Made of natural resin which is harmless and environmentally friendly.\r\nGalaxy Fluffy Slime: simulated starry sky color.', 'https://images-na.ssl-images-amazon.com/images/I/71MCZaZ1NBL._AC_SL1200_.jpg', 20, 0),
(20, 'Cat Toy Ball', 'pets_kids', 13.5, 'Auto rolling & LED chaser- Just press the button.\r\nOur cat toy ball automatically moves at random and lights up red to attract your kitten\'s attention.\r\nIt can also automatically change direction.', 'https://images-na.ssl-images-amazon.com/images/I/71tpTmR9xLL._AC_SL1500_.jpg', 25, 0),
(21, 'Dog Toy Ball', 'pets_kids', 5.5, 'Made from natural rubber with hand strap, floats in water.', 'https://images-na.ssl-images-amazon.com/images/I/61UzZyvpr4L._AC_SL1500_.jpg', 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `p_relation`
--

CREATE TABLE `p_relation` (
  `p_relation_id` int(11) NOT NULL,
  `fk_review_id` int(11) NOT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qa_relation`
--

CREATE TABLE `qa_relation` (
  `qa_relation` int(11) NOT NULL,
  `fk_question_id` int(11) NOT NULL,
  `fk_answer_id` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `question_msg` varchar(250) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `role` enum('user','admin','superAdmin') NOT NULL DEFAULT 'user',
  `active` enum('yes','no','banned') NOT NULL DEFAULT 'no',
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `phone_number` int(10) NOT NULL,
  `token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `role`, `active`, `email`, `password`, `first_name`, `last_name`, `user_img`, `phone_number`, `token`) VALUES
(1, 'superAdmin', 'yes', 'super@email.com', '123456', 'Super', 'Admin', NULL, 1234567890, ''),
(2, 'admin', 'yes', 'admin@email.com', '123456', 'Admin', 'Admin', NULL, 1234567890, ''),
(3, 'user', 'yes', 'user@email.com', '123456', 'User', 'User', NULL, 1234567890, '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`fk_user_id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answers_id`),
  ADD KEY `user_id` (`fk_user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `product_id` (`fk_product_id`),
  ADD KEY `user_id` (`fk_user_id`);

--
-- Indexes for table `discount_code`
--
ALTER TABLE `discount_code`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`fk_product_id`),
  ADD KEY `discount_id` (`fk_discount_id`),
  ADD KEY `user_id` (`fk_user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `p_relation`
--
ALTER TABLE `p_relation`
  ADD PRIMARY KEY (`p_relation_id`),
  ADD KEY `review_id` (`fk_review_id`),
  ADD KEY `product_id` (`fk_product_id`);

--
-- Indexes for table `qa_relation`
--
ALTER TABLE `qa_relation`
  ADD PRIMARY KEY (`qa_relation`),
  ADD KEY `qa_relation_ibfk_1` (`fk_question_id`),
  ADD KEY `answer_id` (`fk_answer_id`),
  ADD KEY `product_id` (`fk_product_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `user_id` (`fk_user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviews_id`),
  ADD KEY `product_id` (`fk_product_id`),
  ADD KEY `user_id` (`fk_user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`fk_user_id`),
  ADD KEY `product_id` (`fk_product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `answers_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_code`
--
ALTER TABLE `discount_code`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `p_relation`
--
ALTER TABLE `p_relation`
  MODIFY `p_relation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_relation`
--
ALTER TABLE `qa_relation`
  MODIFY `qa_relation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviews_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`fk_discount_id`) REFERENCES `discount_code` (`discount_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `p_relation`
--
ALTER TABLE `p_relation`
  ADD CONSTRAINT `p_relation_ibfk_1` FOREIGN KEY (`fk_review_id`) REFERENCES `reviews` (`reviews_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `p_relation_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL;

--
-- Constraints for table `qa_relation`
--
ALTER TABLE `qa_relation`
  ADD CONSTRAINT `qa_relation_ibfk_1` FOREIGN KEY (`fk_question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qa_relation_ibfk_2` FOREIGN KEY (`fk_answer_id`) REFERENCES `answers` (`answers_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_relation_ibfk_3` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
