-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2023 at 08:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(8, 'Classics'),
(9, 'Specials'),
(10, 'Vegan'),
(11, 'Sides'),
(12, 'Drinks');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230213144041', '2023-02-13 14:40:55', 112),
('DoctrineMigrations\\Version20230215135538', '2023-02-15 14:55:52', 218),
('DoctrineMigrations\\Version20230215135758', '2023-02-15 14:58:07', 63),
('DoctrineMigrations\\Version20230216233214', '2023-02-16 23:32:30', 249),
('DoctrineMigrations\\Version20230217002659', '2023-02-17 00:30:19', 52),
('DoctrineMigrations\\Version20230217005632', '2023-02-17 00:56:42', 54),
('DoctrineMigrations\\Version20230217011846', '2023-02-17 01:18:57', 61),
('DoctrineMigrations\\Version20230217035359', '2023-02-17 04:54:10', 177),
('DoctrineMigrations\\Version20230219154033', '2023-02-19 15:40:43', 59);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `cat_id_id` int(11) DEFAULT NULL,
  `name` varchar(25) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `cat_id_id`, `name`, `image`, `price`, `description`) VALUES
(3, 8, 'Pepperoni', 'img/pepperoni.png', 8, 'Very delicious pizza with cheese, crunchy pepperoni and seasoning.'),
(4, 8, 'Margarita', 'img/margarita.png', 6, 'Very delicious cheese pizza in the traditional Italian way.'),
(5, 8, 'Funghi', 'img/funghi.png', 8, 'Very delicious pizza with cheese and perfectly baked mushrooms.'),
(6, 9, 'BBQ', 'img/bbq.png', 12, 'Very delicious pizza with lots of meat and bbq sauce.'),
(7, 9, 'Meatlovers', 'img/meatlovers.png', 14, 'Very delicious pizza with lots of variety in meat and stringy cheese.'),
(8, 10, 'Veggie', 'img/veggie.png', 6, 'Very delicious pizza with vegetarian cheese and vegetables.'),
(9, 11, 'Mini calzone', 'img/minicalzone.jpg', 3, 'Small calzone filled with delicious ingredients.'),
(10, 12, 'Coca Cola', 'img/cola.png', 2, 'The perfect drink for with your American Pizza.'),
(11, 12, 'Fanta', 'img/fanta.png', 2, 'The perfect drink for with your American Pizza.'),
(12, 11, 'Full calzone', 'img/calzone.jpg', 7, 'Full calzone filled with delicious ingredients.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'j.l.kousemaker@gmail.com', '[]', '$2y$13$GlaoOldNFgtLhSpDzx3V4OhdBW0zrM/3DFKjECGAyg/uyX1YcOkW.'),
(2, 'Admin@gmail.com', '[1]', '$2y$13$Q5XI52zJcJ5aumPy4TMMzOs3rM4ecs/OXwDU4k6FDHJ.tSOa4rP4y'),
(3, 'j.l.kousemake@gmail.com', '[]', '$2y$13$5nX1VuO5RkPpTLHap3lCfuueWRc5KRyOtUEdpyK45iXuEU0kaRdei');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B3BA5A5AC33F2EBA` (`cat_id_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_B3BA5A5AC33F2EBA` FOREIGN KEY (`cat_id_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
