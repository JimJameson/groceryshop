-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 11 2020 г., 10:50
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `groceryshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `parent_id`, `title`, `description`, `keywords`) VALUES
(1, 0, 'Branded Foods', 'Branded Foods description', 'Branded Foods keywords'),
(2, 0, 'Households', 'Households description', 'Households keywords'),
(3, 0, 'Veggies & Fruits', 'Veggies & Fruits description', 'Veggies & Fruits keywords'),
(4, 3, 'Vegetables', 'Vegetables description', 'Vegetables keywords'),
(5, 3, 'Fruits', 'Fruits description', 'Fruits keywords'),
(6, 0, 'Kitchen', NULL, NULL),
(7, 0, 'Short Codes', NULL, NULL),
(8, 0, 'Beverages', NULL, NULL),
(9, 8, 'Soft Drinks', NULL, NULL),
(10, 8, 'Juices', NULL, NULL),
(11, 0, 'Pet Food', NULL, NULL),
(12, 0, 'Frozen Foods', NULL, NULL),
(13, 12, 'Frozen Snacks', NULL, NULL),
(14, 12, 'Frozen Nonveg', NULL, NULL),
(15, 0, 'Bread & Bakery', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `qty` tinyint(3) UNSIGNED NOT NULL,
  `total` decimal(6,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `qty`, `total`, `status`, `name`, `email`, `phone`, `address`, `note`) VALUES
(1, '2020-05-07 16:06:36', '2020-05-07 16:06:36', 6, '22.00', 1, 'Дмитрий', 'deejames@mail.ru', '+123456', 'п. Чистенькое', '123'),
(5, '2020-05-07 16:13:52', '2020-05-11 10:20:18', 4, '16.00', 1, 'Петя', 'aa@mail.com', '214', 'fwfsdfsd', 'Примечание клиента\r\nПримечание менеджера'),
(6, '2020-05-07 17:13:15', '2020-05-07 17:13:15', 3, '11.00', 0, 'Дмитрий', 'deejames@mail.ru', '+123456', 'п. Чистенькое', '123'),
(7, '2020-05-07 19:26:58', '2020-05-07 19:26:58', 6, '22.00', 0, 'Дмитрий', 'deejames@mail.ru', '+123456', 'п. Чистенькое', '123'),
(8, '2020-05-07 19:30:39', '2020-05-07 19:30:39', 6, '22.00', 0, 'Дмитрий', 'deejames@mail.ru', '+123456', 'п. Чистенькое', '123'),
(9, '2020-05-07 19:41:37', '2020-05-07 19:41:37', 4, '18.00', 0, 'Петя', 'deejames@mail.ru', '+123456', 'п. Чистенькое', '332'),
(10, '2020-05-07 19:44:21', '2020-05-07 19:44:21', 1, '4.00', 0, 'Дмитрий', 'deejames@mail.ru', '+123456', 'п. Чистенькое', 'ewe');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT 0.00,
  `qty` tinyint(4) NOT NULL,
  `total` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `title`, `price`, `qty`, `total`) VALUES
(1, 1, 1, 'knorr instant soup (100 gm)', '3.00', 4, '12.00'),
(2, 1, 2, 'chings noodles (75 gm)', '5.00', 2, '10.00'),
(3, 5, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(4, 5, 4, 'premium bake rusk (300 gm)', '5.00', 2, '10.00'),
(5, 5, 3, 'lahsun sev (150 gm)', '3.00', 1, '3.00'),
(6, 6, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(7, 6, 3, 'lahsun sev (150 gm)', '3.00', 1, '3.00'),
(8, 6, 4, 'premium bake rusk (300 gm)', '5.00', 1, '5.00'),
(9, 7, 2, 'chings noodles (75 gm)', '5.00', 2, '10.00'),
(10, 7, 1, 'knorr instant soup (100 gm)', '3.00', 4, '12.00'),
(11, 8, 2, 'chings noodles (75 gm)', '5.00', 2, '10.00'),
(12, 8, 1, 'knorr instant soup (100 gm)', '3.00', 4, '12.00'),
(13, 9, 3, 'lahsun sev (150 gm)', '3.00', 1, '3.00'),
(14, 9, 2, 'chings noodles (75 gm)', '5.00', 3, '15.00'),
(15, 10, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT 0.00,
  `old_price` decimal(6,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'no-image.png',
  `is_offer` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `content`, `price`, `old_price`, `description`, `keywords`, `img`, `is_offer`) VALUES
(1, 1, 'knorr instant soup (100 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '76.png', 1),
(2, 1, 'chings noodles (75 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '5.00', '8.00', NULL, NULL, '6.png', 0),
(3, 1, 'lahsun sev (150 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '5.00', NULL, NULL, '7.png', 0),
(4, 1, 'premium bake rusk (300 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '5.00', '7.00', NULL, NULL, '8.png', 0),
(5, 1, 'fresh spinach (palak)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2.00', '3.00', NULL, NULL, '9.png', 1),
(6, 5, 'fresh mango dasheri (1 kg)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '5.00', '8.00', NULL, NULL, '10.png', 1),
(7, 5, 'fresh apple red (1 kg)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '6.00', '8.00', NULL, NULL, '11.png', 1),
(8, 4, 'fresh broccoli (500 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '4.00', '6.00', NULL, NULL, '12.png', 0),
(9, 10, 'mixed fruit juice (1 ltr)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '13.png', 1),
(10, 10, 'prune juice - sunsweet (1 ltr)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '4.00', '0.00', NULL, NULL, '14.png', 1),
(11, 9, 'coco cola zero can (330 ml)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '15.png', 0),
(12, 9, 'sprite bottle (2 ltr)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '16.png', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`) VALUES
(1, 'admin', '$2y$13$N5uuPXF0S263qsxWUM4VGe6QSJQ6GUgTwr7/LVt5ki5tLm10zBfve', 'X_y4dwEv8RF2LPLkh-pr8-EnNFGEE2Px');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
