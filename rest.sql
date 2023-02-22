-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 22 feb 2023 om 15:14
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

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
-- Tabelstructuur voor tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(8, 'Classics'),
(9, 'Specials'),
(10, 'Vegan'),
(11, 'Sides'),
(12, 'Drinks');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
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
('DoctrineMigrations\\Version20230219154033', '2023-02-19 15:40:43', 59),
('DoctrineMigrations\\Version20230222115806', '2023-02-22 12:58:14', 37),
('DoctrineMigrations\\Version20230222125132', '2023-02-22 13:51:39', 862),
('DoctrineMigrations\\Version20230222125640', '2023-02-22 13:56:48', 48),
('DoctrineMigrations\\Version20230222130319', '2023-02-22 14:03:25', 34),
('DoctrineMigrations\\Version20230222132228', '2023-02-22 14:22:36', 150),
('DoctrineMigrations\\Version20230222132727', '2023-02-22 14:27:34', 39);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `messages`
--

INSERT INTO `messages` (`id`, `first_name`, `last_name`, `email`, `msg`) VALUES
(12, 'fsaafsa', 'fsaf', 'fsafsa@gmail.com', 'fsafsa');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `street_number` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `creditcard` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `order`
--

INSERT INTO `order` (`id`, `street_number`, `product_id_id`, `amount`, `creditcard`, `size`, `city`, `zipcode`, `street`, `full_name`) VALUES
(1, 12, 3, 2, '21432643643', '28cm', 'sagfdsag', 'gdadsagf', 'gdsags', 'safsaf');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `cat_id_id` int(11) DEFAULT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `products`
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
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'j.l.kousemaker@gmail.com', '[]', '$2y$13$GlaoOldNFgtLhSpDzx3V4OhdBW0zrM/3DFKjECGAyg/uyX1YcOkW.'),
(2, 'Admin@gmail.com', '[1]', '$2y$13$Q5XI52zJcJ5aumPy4TMMzOs3rM4ecs/OXwDU4k6FDHJ.tSOa4rP4y'),
(3, 'j.l.kousemake@gmail.com', '[]', '$2y$13$5nX1VuO5RkPpTLHap3lCfuueWRc5KRyOtUEdpyK45iXuEU0kaRdei');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398DE18E50B` (`product_id_id`);

--
-- Indexen voor tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B3BA5A5AC33F2EBA` (`cat_id_id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398DE18E50B` FOREIGN KEY (`product_id_id`) REFERENCES `products` (`id`);

--
-- Beperkingen voor tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_B3BA5A5AC33F2EBA` FOREIGN KEY (`cat_id_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
