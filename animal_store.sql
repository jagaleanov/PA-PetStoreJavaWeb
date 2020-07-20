-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2019 a las 18:56:54
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `animal_store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(10) UNSIGNED NOT NULL,
  `orders_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orders_product_id` int(10) UNSIGNED NOT NULL,
  `orders_quantity` int(10) UNSIGNED NOT NULL,
  `orders_value` int(10) UNSIGNED NOT NULL,
  `orders_buyer` varchar(255) DEFAULT NULL,
  `orders_credit_card_number` varchar(255) DEFAULT NULL,
  `orders_credit_card_code` int(11) DEFAULT NULL,
  `orders_status` enum('Abierta','Pagada','Cancelada') NOT NULL DEFAULT 'Abierta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_timestamp`, `orders_product_id`, `orders_quantity`, `orders_value`, `orders_buyer`, `orders_credit_card_number`, `orders_credit_card_code`, `orders_status`) VALUES
(1, '2019-03-01 05:35:03', 1, 1, 100000, NULL, NULL, NULL, 'Cancelada'),
(2, '2019-03-01 06:21:07', 1, 1, 1000000, 'Jorge', '123456789012', 123, 'Pagada'),
(3, '2019-03-01 19:23:33', 2, 3, 2700000, NULL, NULL, NULL, 'Abierta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `products_id` int(10) UNSIGNED NOT NULL,
  `products_name` varchar(30) NOT NULL,
  `products_description` text NOT NULL,
  `products_short_description` varchar(255) NOT NULL,
  `products_stock` int(10) UNSIGNED NOT NULL,
  `products_sold` int(10) UNSIGNED NOT NULL,
  `products_price` bigint(20) UNSIGNED NOT NULL,
  `products_img` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`products_id`, `products_name`, `products_description`, `products_short_description`, `products_stock`, `products_sold`, `products_price`, `products_img`) VALUES
(1, 'Perra consentida', '<p>Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris.</p>\r\n<p>Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. </p>', 'Lorem ipsum dolor sit amet,consectetur adipisicing elit.', 5, 9, 1000000, 'perro'),
(2, 'Gato ninja', '<p>Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris.</p>\r\n<p>Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. </p>', 'Ised do eiusmod tempor incididunt ut labore etdolore magna aliqua. Ut enim ad minim veniam', 5, 0, 900000, 'gato'),
(3, 'Gaviota de rio', '<p>Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris.</p>\r\n<p>Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. </p>', 'Equis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 2, 2, 15000, 'gaviota'),
(4, 'Lagarto uribista', '<p>Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris.</p> <p>Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. </p>', 'Lorem ipsum dolor sit amet,consectetur adipisicing elit.', 5, 0, 200, 'lagarto'),
(5, 'Alpaca coqueta', '<p>Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris.</p> <p>Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. </p>', 'Equis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 5, 0, 500000, 'alpaca'),
(6, 'Vaca psicodélica', '<p>Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris.</p> <p>Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. </p>', 'Ised do eiusmod tempor incididunt ut labore etdolore magna aliqua. Ut enim ad minim veniam', 5, 0, 500000, 'vaca');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`),
  ADD KEY `orders_product_id` (`orders_product_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `products_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orders_product_id`) REFERENCES `products` (`products_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
