-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 04/02/2025 às 15:19
-- Versão do servidor: 8.0.41
-- Versão do PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_empresa`
--
CREATE DATABASE IF NOT EXISTS `db_empresa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_empresa`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_CUSTOMERS`
--

CREATE TABLE `TB_CUSTOMERS` (
  `id` bigint UNSIGNED NOT NULL,
  `costumerName` varchar(255) DEFAULT NULL,
  `contactLastName` varchar(255) DEFAULT NULL,
  `contactFirstName` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `postalCode` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `salesRepEmployeeNumber` int DEFAULT NULL,
  `creditLimit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_EMPLOYEES`
--

CREATE TABLE `TB_EMPLOYEES` (
  `id` bigint UNSIGNED NOT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `officeID` int DEFAULT NULL,
  `reportsTo` int DEFAULT NULL,
  `jobTitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_OFFICES`
--

CREATE TABLE `TB_OFFICES` (
  `id` bigint UNSIGNED NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postalCode` varchar(20) DEFAULT NULL,
  `territory` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_ORDERS`
--

CREATE TABLE `TB_ORDERS` (
  `id` bigint UNSIGNED NOT NULL,
  `orderDate` date DEFAULT NULL,
  `requireDate` date DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `comments` text,
  `customerID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_ORDER_DETAILS`
--

CREATE TABLE `TB_ORDER_DETAILS` (
  `id` bigint UNSIGNED NOT NULL,
  `orderID` int DEFAULT NULL,
  `productID` int DEFAULT NULL,
  `quantityOrdered` int DEFAULT NULL,
  `priceEach` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PAYMENTS`
--

CREATE TABLE `TB_PAYMENTS` (
  `id` bigint UNSIGNED NOT NULL,
  `customerID` int DEFAULT NULL,
  `checkNumber` varchar(50) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUCTS`
--

CREATE TABLE `TB_PRODUCTS` (
  `id` bigint UNSIGNED NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productScale` varchar(50) DEFAULT NULL,
  `productVendor` varchar(255) DEFAULT NULL,
  `productDescription` text,
  `quantityInStock` int DEFAULT NULL,
  `buyPrice` decimal(10,2) DEFAULT NULL,
  `productLine` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUCT_LINES`
--

CREATE TABLE `TB_PRODUCT_LINES` (
  `id` bigint UNSIGNED NOT NULL,
  `textDescription` text,
  `htmlDescription` text,
  `image` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `TB_CUSTOMERS`
--
ALTER TABLE `TB_CUSTOMERS`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `TB_EMPLOYEES`
--
ALTER TABLE `TB_EMPLOYEES`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `TB_OFFICES`
--
ALTER TABLE `TB_OFFICES`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `TB_ORDERS`
--
ALTER TABLE `TB_ORDERS`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `TB_ORDER_DETAILS`
--
ALTER TABLE `TB_ORDER_DETAILS`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `TB_PAYMENTS`
--
ALTER TABLE `TB_PAYMENTS`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `TB_PRODUCTS`
--
ALTER TABLE `TB_PRODUCTS`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `TB_PRODUCT_LINES`
--
ALTER TABLE `TB_PRODUCT_LINES`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `TB_CUSTOMERS`
--
ALTER TABLE `TB_CUSTOMERS`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_EMPLOYEES`
--
ALTER TABLE `TB_EMPLOYEES`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_OFFICES`
--
ALTER TABLE `TB_OFFICES`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_ORDERS`
--
ALTER TABLE `TB_ORDERS`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_ORDER_DETAILS`
--
ALTER TABLE `TB_ORDER_DETAILS`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PAYMENTS`
--
ALTER TABLE `TB_PAYMENTS`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PRODUCTS`
--
ALTER TABLE `TB_PRODUCTS`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PRODUCT_LINES`
--
ALTER TABLE `TB_PRODUCT_LINES`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Banco de dados: `mydatabase`
--
CREATE DATABASE IF NOT EXISTS `mydatabase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `mydatabase`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
