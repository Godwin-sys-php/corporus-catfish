-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 19, 2024 at 02:56 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `corporus_gl`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nameOfUser` varchar(500) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `phoneNumber` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `birthday` varchar(500) DEFAULT NULL,
  `debt` float NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `nameOfUser`, `name`, `phoneNumber`, `email`, `birthday`, `debt`, `timestamp`) VALUES
(1, NULL, 'Table 1', NULL, NULL, NULL, 0, 1724077559),
(2, NULL, 'Table 2', NULL, NULL, NULL, 0, 1724077563),
(3, NULL, 'Table 3', NULL, NULL, NULL, 0, 1724077566),
(4, NULL, 'Table 4', NULL, NULL, NULL, 0, 1724077575),
(5, NULL, 'Table 5', NULL, NULL, NULL, 0, 1724077584),
(6, NULL, 'Terrasse 1', NULL, NULL, NULL, 0, 1724077631),
(7, NULL, 'Terrasse 2', NULL, NULL, NULL, 0, 1724077634),
(8, NULL, 'Terrasse 3', NULL, NULL, NULL, 0, 1724077638),
(9, NULL, 'Terrasse 4', NULL, NULL, NULL, 0, 1724077645),
(10, NULL, 'Terrasse 5', NULL, NULL, NULL, 0, 1724077649),
(11, NULL, 'Terrasse 6', NULL, NULL, NULL, 0, 1724077654);

-- --------------------------------------------------------

--
-- Table structure for table `debts`
--

CREATE TABLE `debts` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `sessionId` int(11) DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  `userName` varchar(400) NOT NULL,
  `clientName` varchar(400) NOT NULL,
  `accountName` varchar(400) DEFAULT NULL,
  `enter` float NOT NULL,
  `outlet` float NOT NULL,
  `note` varchar(400) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dTransactions`
--

CREATE TABLE `dTransactions` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `categoryName` varchar(500) NOT NULL,
  `productName` varchar(500) NOT NULL,
  `userName` varchar(500) NOT NULL,
  `enter` float DEFAULT NULL,
  `outlet` float DEFAULT NULL,
  `after` float NOT NULL,
  `description` varchar(1500) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `linkedProduct`
--

CREATE TABLE `linkedProduct` (
  `id` int(11) NOT NULL,
  `productLinkId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mAccount`
--

CREATE TABLE `mAccount` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mCategory`
--

CREATE TABLE `mCategory` (
  `id` int(11) NOT NULL,
  `pCategoryId` int(11) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `type` varchar(500) NOT NULL,
  `defaultForBuy` tinyint(1) NOT NULL DEFAULT '0',
  `defaultForSell` tinyint(1) NOT NULL DEFAULT '0',
  `isSystem` tinyint(1) NOT NULL DEFAULT '0',
  `cannotDelete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mCategory`
--

INSERT INTO `mCategory` (`id`, `pCategoryId`, `name`, `type`, `defaultForBuy`, `defaultForSell`, `isSystem`, `cannotDelete`) VALUES
(1, NULL, 'Vente', 'enter', 0, 1, 0, 1),
(2, NULL, 'Achat Produit', 'outlet', 1, 0, 0, 1),
(3, NULL, 'Paiement Dette', 'enter', 0, 0, 0, 1),
(4, 1, 'Achat Boissons', 'outlet', 0, 0, 0, 0),
(5, 2, 'Achat Spiritueux', 'outlet', 0, 0, 0, 0),
(6, 3, 'Achat Plats', 'outlet', 0, 0, 0, 0),
(7, 4, 'Achat Cigarettes', 'outlet', 0, 0, 0, 0),
(8, NULL, 'Changement CE', 'enter', 0, 0, 0, 0),
(9, 1, 'Achat Boissons', 'outlet', 0, 0, 0, 0),
(10, 2, 'Achat Bière', 'outlet', 0, 0, 0, 0),
(11, 3, 'Achat Liqueurs', 'outlet', 0, 0, 0, 0),
(12, 4, 'Achat Tapas', 'outlet', 0, 0, 0, 0),
(13, 5, 'Achat Plâts', 'outlet', 0, 0, 0, 0),
(14, 6, 'Achat Légumes', 'outlet', 0, 0, 0, 0),
(15, 7, 'Achat Accompagnements', 'outlet', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mTransactions`
--

CREATE TABLE `mTransactions` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `transactionId` int(11) DEFAULT NULL,
  `accountId` int(11) NOT NULL,
  `categoryName` varchar(500) NOT NULL,
  `userName` varchar(500) NOT NULL,
  `accountName` varchar(200) NOT NULL,
  `enter` float DEFAULT NULL,
  `outlet` float DEFAULT NULL,
  `after` float DEFAULT NULL,
  `description` varchar(1500) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `unit` varchar(500) NOT NULL,
  `isSellable` tinyint(1) NOT NULL,
  `isVersatile` tinyint(1) NOT NULL,
  `price` float DEFAULT NULL,
  `buyPrice` float DEFAULT NULL,
  `inStock` float DEFAULT NULL,
  `depotStock` float NOT NULL DEFAULT '0',
  `hasLink` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `categoryId`, `categoryName`, `name`, `unit`, `isSellable`, `isVersatile`, `price`, `buyPrice`, `inStock`, `depotStock`, `hasLink`, `timestamp`) VALUES
(1, 1, 'Boissons', 'Coca-Cola', 'Bouteilles', 1, 0, 5000, 0, 50, 0, 0, 1724068598),
(2, 1, 'Boissons', 'Fanta', 'Bouteille', 1, 0, 5000, 0, 49, 0, 0, 1724068614),
(3, 1, 'Boissons', 'Vitalo', 'Bouteille', 1, 0, 5000, 0, 49, 0, 0, 1724068726),
(4, 1, 'Boissons', 'Sprite', 'Bouteille', 1, 0, 5000, 0, 49, 0, 0, 1724068741),
(5, 1, 'Boissons', 'Energy Malte', 'Bouteille', 1, 0, 5000, 0, 50, 0, 0, 1724068755),
(6, 1, 'Boissons', 'Tonic', 'Bouteille', 1, 0, 5000, 0, 50, 0, 0, 1724068775),
(7, 1, 'Boissons', 'Eau', 'Bouteille', 1, 0, 5000, 0, 50, 0, 0, 1724068794),
(8, 1, 'Boissons', 'Eau Gazeuse', 'Bouteille', 1, 0, 5000, 0, 50, 0, 0, 1724068810),
(9, 2, 'Bières', 'Beaufort', 'Bouteille', 1, 0, 7000, 0, 50, 0, 0, 1724068947),
(10, 2, 'Bières', 'Castel', 'Bouteille', 1, 0, 7000, 0, 50, 0, 0, 1724068961),
(11, 2, 'Bières', 'Tembo', 'Bouteille', 1, 0, 8000, 0, 50, 0, 0, 1724068991),
(13, 2, 'Bières', 'Heineken', 'Bouteille', 1, 0, 5000, 0, 50, 0, 0, 1724069065),
(14, 2, 'Bières', 'Nkoyi', 'Bouteille', 1, 0, 8000, 0, 50, 0, 0, 1724069094),
(15, 2, 'Bières', 'Primus', 'Bouteille', 1, 0, 7000, 0, 50, 0, 0, 1724069226),
(16, 2, 'Bières', 'Nkoyi Black', 'Bouteille', 1, 0, 7000, 0, 50, 0, 0, 1724069245),
(17, 2, 'Bières', 'Savana', 'Bouteille', 1, 0, 8000, 0, 50, 0, 0, 1724069293),
(18, 2, 'Bières', 'Bavaria', 'Bouteille', 1, 0, 7000, 0, 50, 0, 0, 1724069312),
(19, 2, 'Bières', 'Heineken Importé', 'Bouteille', 1, 0, 14000, 0, 50, 0, 0, 1724069324),
(20, 2, 'Bières', 'Leffe', 'Bouteille', 1, 0, 14000, 0, 50, 0, 0, 1724069334),
(21, 2, 'Bières', 'Red Bull', 'Bouteille', 1, 0, 8000, 0, 50, 0, 0, 1724069354),
(23, 3, 'Liqueurs', 'Double black', 'Bouteille', 1, 0, 228000, 0, 50, 0, 0, 1724068144),
(24, 3, 'Liqueurs', 'Hennessy', 'Bouteille', 1, 0, 185250, 0, 50, 0, 0, 1724068144),
(25, 3, 'Liqueurs', 'Chivas', 'Bouteille', 1, 0, 171000, 0, 50, 0, 0, 1724068144),
(26, 3, 'Liqueurs', 'Black label', 'Bouteille', 1, 0, 142500, 0, 50, 0, 0, 1724068144),
(27, 3, 'Liqueurs', 'Jack Daniel', 'Bouteille', 1, 0, 156750, 0, 50, 0, 0, 1724068144),
(28, 3, 'Liqueurs', 'Red label', 'Bouteille', 1, 0, 99750, 0, 50, 0, 0, 1724068144),
(29, 3, 'Liqueurs', 'Baileys', 'Bouteille', 1, 0, 99750, 0, 50, 0, 0, 1724068144),
(30, 3, 'Liqueurs', 'Jameson', 'Bouteille', 1, 0, 114000, 0, 50, 0, 0, 1724068144),
(31, 3, 'Liqueurs', 'Grants', 'Bouteille', 1, 0, 71250, 0, 50, 0, 0, 1724068144),
(32, 3, 'Liqueurs', 'Ballentines', 'Bouteille', 1, 0, 71250, 0, 50, 0, 0, 1724068144),
(33, 3, 'Liqueurs', 'Baron d\'arignac', 'Bouteille', 1, 0, 85500, 0, 50, 0, 0, 1724068144),
(34, 3, 'Liqueurs', 'Baron ice', 'Bouteille', 1, 0, 85500, 0, 50, 0, 0, 1724068144),
(35, 3, 'Liqueurs', 'Castel ice rosé', 'Bouteille', 1, 0, 99750, 0, 50, 0, 0, 1724068144),
(36, 3, 'Liqueurs', 'Castel ice', 'Bouteille', 1, 0, 99750, 0, 50, 0, 0, 1724068144),
(37, 3, 'Liqueurs', 'Mateus', 'Bouteille', 1, 0, 71250, 0, 50, 0, 0, 1724068144),
(38, 3, 'Liqueurs', 'Martini', 'Bouteille', 1, 0, 99750, 0, 50, 0, 0, 1724068144),
(39, 3, 'Liqueurs', 'Porto Cruz', 'Bouteille', 1, 0, 99750, 0, 50, 0, 0, 1724068144),
(40, 4, 'Tapas', 'Ailles des Poulets', 'Portion', 1, 0, 20000, 0, 50, 0, 0, 1724068144),
(41, 4, 'Tapas', 'Cotis', 'Portion', 1, 0, 20000, 0, 50, 0, 0, 1724068144),
(42, 4, 'Tapas', 'Boulettes de Viandes', 'Portion', 1, 0, 20000, 0, 50, 0, 0, 1724068144),
(43, 4, 'Tapas', 'Brochette bœuf', '1pc', 1, 0, 4000, 0, 50, 0, 0, 1724068144),
(44, 4, 'Tapas', 'Saucissé de Goma', 'Portion', 1, 0, 25000, 0, 50, 0, 0, 1724068144),
(45, 4, 'Tapas', 'Samoussa', 'Portion', 1, 0, 20000, 0, 50, 0, 0, 1724068144),
(46, 5, 'Plâts', 'Poulet Sauté', 'Portion', 1, 0, 30000, 0, 50, 0, 0, 1724068144),
(47, 5, 'Plâts', 'Poulet Braisé', 'Portion', 1, 0, 30000, 0, 50, 0, 0, 1724068144),
(48, 5, 'Plâts', 'Poulet Mayo', 'Portion', 1, 0, 30000, 0, 50, 0, 0, 1724068144),
(49, 5, 'Plâts', 'Ngulu Sauté', 'Portion', 1, 0, 35000, 0, 50, 0, 0, 1724068144),
(50, 5, 'Plâts', 'Ngulu Braisé', 'Portion', 1, 0, 35000, 0, 50, 0, 0, 1724068144),
(51, 5, 'Plâts', 'N\'taba', '1kg', 1, 0, 70000, 0, 50, 0, 0, 1724068144),
(52, 6, 'Légumes', 'Pondu', 'Portion', 1, 0, 6000, 0, 50, 0, 0, 1724068144),
(53, 6, 'Légumes', 'Légume Vert', 'Portion', 1, 0, 6000, 0, 50, 0, 0, 1724068144),
(54, 6, 'Légumes', 'Haricot', 'Portion', 1, 0, 6000, 0, 50, 0, 0, 1724068144),
(55, 6, 'Légumes', 'Épinard', 'Portion', 1, 0, 6000, 0, 50, 0, 0, 1724068144),
(56, 6, 'Légumes', 'Mfumbwa', 'Portion', 1, 0, 6000, 0, 50, 0, 0, 1724068144),
(57, 7, 'Accompagnements', 'Frites', 'Portion', 1, 0, 5000, 0, 50, 0, 0, 1724068144),
(58, 7, 'Accompagnements', 'Bananes Plantain', 'Portion', 1, 0, 5000, 0, 50, 0, 0, 1724068144),
(59, 7, 'Accompagnements', 'Chikwange', 'Portion', 1, 0, 2000, 0, 50, 0, 0, 1724068144),
(60, 7, 'Accompagnements', 'Pomme Sauté', 'Portion', 1, 0, 10000, 0, 50, 0, 0, 1724068144);

-- --------------------------------------------------------

--
-- Table structure for table `productsCategory`
--

CREATE TABLE `productsCategory` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productsCategory`
--

INSERT INTO `productsCategory` (`id`, `name`, `timestamp`) VALUES
(1, 'Boissons', 1724068569),
(2, 'Bières', 1724068901),
(3, 'Liqueurs', 1724069738),
(4, 'Tapas', 1724076373),
(5, 'Plâts', 1724076521),
(6, 'Légumes', 1724076732),
(7, 'Accompagnements', 1724076869);

-- --------------------------------------------------------

--
-- Table structure for table `ptCategory`
--

CREATE TABLE `ptCategory` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `type` varchar(500) NOT NULL,
  `defaultForSell` tinyint(1) NOT NULL DEFAULT '0',
  `defaultForBuy` tinyint(1) NOT NULL DEFAULT '0',
  `isSystem` tinyint(1) NOT NULL DEFAULT '0',
  `cannotDelete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ptCategory`
--

INSERT INTO `ptCategory` (`id`, `name`, `type`, `defaultForSell`, `defaultForBuy`, `isSystem`, `cannotDelete`) VALUES
(1, 'Vente', 'outlet', 1, 0, 0, 1),
(2, 'Entrées GastroSys', 'enter', 0, 0, 1, 1),
(3, 'Sorties GastroSys', 'outlet', 0, 0, 1, 1),
(4, 'Approvisionnement', 'enter', 0, 0, 0, 1),
(5, 'Transfert Stock', 'outlet', 0, 0, 0, 1),
(6, 'Réception Stock', 'enter', 0, 0, 0, 1),
(7, 'Equilibrage Stock (Entrée)', 'enter', 0, 0, 0, 1),
(8, 'Equilibrage Stock (Sortie)', 'outlet', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessionItems`
--

CREATE TABLE `sessionItems` (
  `id` int(11) NOT NULL,
  `sessionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `userName` varchar(500) NOT NULL,
  `productName` varchar(500) NOT NULL,
  `price` float NOT NULL,
  `quantity` float NOT NULL,
  `taken` float NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accountId` int(11) DEFAULT NULL,
  `clientName` varchar(500) NOT NULL,
  `userName` varchar(500) NOT NULL,
  `accountName` varchar(500) DEFAULT NULL,
  `serverName` varchar(500) NOT NULL,
  `total` float NOT NULL,
  `reduction` float NOT NULL,
  `isDone` tinyint(1) NOT NULL DEFAULT '0',
  `isPaid` tinyint(1) NOT NULL DEFAULT '0',
  `isDebt` tinyint(1) NOT NULL DEFAULT '0',
  `invoice` varchar(500) DEFAULT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `sessionId` int(11) DEFAULT NULL,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `categoryName` varchar(500) NOT NULL,
  `productName` varchar(500) NOT NULL,
  `userName` varchar(500) NOT NULL,
  `enter` float DEFAULT NULL,
  `outlet` float DEFAULT NULL,
  `after` float NOT NULL,
  `description` varchar(1500) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `username` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `type` varchar(500) NOT NULL,
  `timestamp` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`, `timestamp`) VALUES
(1, 'Godwin Burume', 'godwin', '$2a$10$SA3K8Qb73MFQrg8EMG.6nObxowIq4ba.6Fa21ACWBaXat/LEpflhG', 'admin', '1724068144'),
(2, 'Thérèsianne', 'thérèsianne', '$2b$10$srBL4d1xQJdbVUl3bBY4TOmEXQLpDK/G6UqqHAJfS1CcIU5rYAFQ6', 'serveur', '1724077955'),
(3, 'Vanessa', 'vanessa', '$2b$10$QzUI9abDRIsFtawGSyaT2eeihP1K7eQbq7SXpfVlvZ/eXd5eqgLca', 'serveur', '1724077978'),
(4, 'Esther', 'esther', '$2b$10$7SalL7vzcVM93GgyY2M8t.kaFEMjyKQ9NkuMAWdIYeKXrxwYaoiV6', 'serveur', '1724077988'),
(5, 'Caisse', 'caisse', '$2b$10$hT2leVKBh9qpVWvF0ubUmuLkTPq6S9H0.4Tqat455WmWudQS4aZZG', 'serveur', '1724078182');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `sessionId` int(11) DEFAULT NULL,
  `serverName` varchar(150) NOT NULL,
  `clientName` varchar(400) DEFAULT NULL,
  `voucherUrl` varchar(200) NOT NULL,
  `printed` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `debts`
--
ALTER TABLE `debts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dTransactions`
--
ALTER TABLE `dTransactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `linkedProduct`
--
ALTER TABLE `linkedProduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mAccount`
--
ALTER TABLE `mAccount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mCategory`
--
ALTER TABLE `mCategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mTransactions`
--
ALTER TABLE `mTransactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productsCategory`
--
ALTER TABLE `productsCategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ptCategory`
--
ALTER TABLE `ptCategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessionItems`
--
ALTER TABLE `sessionItems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `debts`
--
ALTER TABLE `debts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dTransactions`
--
ALTER TABLE `dTransactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `linkedProduct`
--
ALTER TABLE `linkedProduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mAccount`
--
ALTER TABLE `mAccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mCategory`
--
ALTER TABLE `mCategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mTransactions`
--
ALTER TABLE `mTransactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `productsCategory`
--
ALTER TABLE `productsCategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ptCategory`
--
ALTER TABLE `ptCategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sessionItems`
--
ALTER TABLE `sessionItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
