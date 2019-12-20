-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 14 2018 г., 02:42
-- Версия сервера: 10.1.36-MariaDB
-- Версия PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `commitete_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1540973743),
('moderator', '2', 1540973743);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1540973743, 1540973743),
('createPost', 2, 'Create a post', NULL, NULL, 1540973743, 1540973743),
('moderator', 1, NULL, NULL, NULL, 1540973743, 1540973743),
('updatePost', 2, 'Update post', NULL, NULL, 1540973743, 1540973743);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'moderator'),
('admin', 'updatePost'),
('moderator', 'createPost');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1540971313),
('m140506_102106_rbac_init', 1540971319),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1540971319);

-- --------------------------------------------------------

--
-- Структура таблицы `operators`
--

CREATE TABLE `operators` (
  `id` int(11) NOT NULL,
  `operator` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `operators`
--

INSERT INTO `operators` (`id`, `operator`) VALUES
(1, 'Оператор 1'),
(2, 'Оператор 2'),
(3, 'Оператор 3');

-- --------------------------------------------------------

--
-- Структура таблицы `reception`
--

CREATE TABLE `reception` (
  `id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `record` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `reception`
--

INSERT INTO `reception` (`id`, `time_id`, `date`, `status_id`, `operator_id`, `user_id`, `record`) VALUES
(1, 1, '2018-11-15', 1, 1, 0, NULL),
(2, 2, '2018-11-15', 2, 1, 3, 1542078438),
(3, 3, '2018-11-15', 1, 1, 0, NULL),
(4, 4, '2018-11-15', 1, 1, 0, NULL),
(5, 5, '2018-11-15', 2, 1, 1, 1542078154),
(6, 6, '2018-11-15', 1, 1, 0, NULL),
(7, 7, '2018-11-15', 1, 1, 0, NULL),
(8, 8, '2018-11-15', 1, 1, 0, NULL),
(9, 9, '2018-11-15', 2, 1, 2, 1542078415),
(10, 10, '2018-11-15', 1, 1, 0, NULL),
(11, 11, '2018-11-15', 1, 1, 0, NULL),
(12, 12, '2018-11-15', 1, 1, 0, NULL),
(13, 13, '2018-11-15', 1, 1, 0, NULL),
(14, 14, '2018-11-15', 1, 1, 0, NULL),
(15, 15, '2018-11-15', 1, 1, 0, NULL),
(16, 16, '2018-11-15', 1, 1, 0, NULL),
(17, 17, '2018-11-15', 1, 1, 0, NULL),
(18, 18, '2018-11-15', 1, 1, 0, NULL),
(19, 19, '2018-11-15', 1, 1, 0, NULL),
(20, 20, '2018-11-15', 1, 1, 0, NULL),
(21, 21, '2018-11-15', 1, 1, 0, NULL),
(22, 22, '2018-11-15', 1, 1, 0, NULL),
(23, 23, '2018-11-15', 1, 1, 0, NULL),
(24, 24, '2018-11-15', 1, 1, 0, NULL),
(25, 25, '2018-11-15', 1, 1, 0, NULL),
(26, 26, '2018-11-15', 1, 1, 0, NULL),
(27, 27, '2018-11-15', 1, 1, 0, NULL),
(28, 28, '2018-11-15', 1, 1, 0, NULL),
(29, 1, '2018-11-15', 1, 2, 0, NULL),
(30, 2, '2018-11-15', 1, 2, 0, NULL),
(31, 3, '2018-11-15', 1, 2, 0, NULL),
(32, 4, '2018-11-15', 1, 2, 0, NULL),
(33, 5, '2018-11-15', 1, 2, 0, NULL),
(34, 6, '2018-11-15', 1, 2, 0, NULL),
(35, 7, '2018-11-15', 1, 2, 0, NULL),
(36, 8, '2018-11-15', 1, 2, 0, NULL),
(37, 9, '2018-11-15', 1, 2, 0, NULL),
(38, 10, '2018-11-15', 1, 2, 0, NULL),
(39, 11, '2018-11-15', 1, 2, 0, NULL),
(40, 12, '2018-11-15', 1, 2, 0, NULL),
(41, 13, '2018-11-15', 1, 2, 0, NULL),
(42, 14, '2018-11-15', 1, 2, 0, NULL),
(43, 15, '2018-11-15', 1, 2, 0, NULL),
(44, 16, '2018-11-15', 1, 2, 0, NULL),
(45, 17, '2018-11-15', 1, 2, 0, NULL),
(46, 18, '2018-11-15', 1, 2, 0, NULL),
(47, 19, '2018-11-15', 1, 2, 0, NULL),
(48, 20, '2018-11-15', 1, 2, 0, NULL),
(49, 21, '2018-11-15', 1, 2, 0, NULL),
(50, 22, '2018-11-15', 1, 2, 0, NULL),
(51, 23, '2018-11-15', 1, 2, 0, NULL),
(52, 24, '2018-11-15', 1, 2, 0, NULL),
(53, 25, '2018-11-15', 1, 2, 0, NULL),
(54, 26, '2018-11-15', 1, 2, 0, NULL),
(55, 27, '2018-11-15', 1, 2, 0, NULL),
(56, 28, '2018-11-15', 1, 2, 0, NULL),
(57, 1, '2018-11-14', 2, 1, 6, 1542091884),
(58, 2, '2018-11-14', 2, 1, 7, 1542091982),
(59, 3, '2018-11-14', 2, 1, 4, 1542084884),
(60, 4, '2018-11-14', 1, 1, 0, NULL),
(61, 5, '2018-11-14', 2, 1, 6, 1542088456),
(62, 6, '2018-11-14', 2, 1, 5, 1542088429),
(63, 7, '2018-11-14', 1, 1, 0, NULL),
(64, 8, '2018-11-14', 1, 1, 0, NULL),
(65, 9, '2018-11-14', 1, 1, 0, NULL),
(66, 10, '2018-11-14', 1, 1, 0, NULL),
(67, 11, '2018-11-14', 1, 1, 0, NULL),
(68, 12, '2018-11-14', 1, 1, 0, NULL),
(69, 13, '2018-11-14', 1, 1, 0, NULL),
(70, 14, '2018-11-14', 1, 1, 0, NULL),
(71, 15, '2018-11-14', 1, 1, 0, NULL),
(72, 16, '2018-11-14', 1, 1, 0, NULL),
(73, 17, '2018-11-14', 1, 1, 0, NULL),
(74, 18, '2018-11-14', 1, 1, 0, NULL),
(75, 19, '2018-11-14', 1, 1, 0, NULL),
(76, 20, '2018-11-14', 1, 1, 0, NULL),
(77, 21, '2018-11-14', 1, 1, 0, NULL),
(78, 22, '2018-11-14', 1, 1, 0, NULL),
(79, 23, '2018-11-14', 1, 1, 0, NULL),
(80, 24, '2018-11-14', 1, 1, 0, NULL),
(81, 25, '2018-11-14', 1, 1, 0, NULL),
(82, 26, '2018-11-14', 1, 1, 0, NULL),
(83, 27, '2018-11-14', 1, 1, 0, NULL),
(84, 28, '2018-11-14', 1, 1, 0, NULL),
(85, 1, '2018-11-14', 1, 2, 0, NULL),
(86, 2, '2018-11-14', 1, 2, 0, NULL),
(87, 3, '2018-11-14', 1, 2, 0, NULL),
(88, 4, '2018-11-14', 1, 2, 0, NULL),
(89, 5, '2018-11-14', 1, 2, 0, NULL),
(90, 6, '2018-11-14', 1, 2, 0, NULL),
(91, 7, '2018-11-14', 1, 2, 0, NULL),
(92, 8, '2018-11-14', 1, 2, 0, NULL),
(93, 9, '2018-11-14', 1, 2, 0, NULL),
(94, 10, '2018-11-14', 1, 2, 0, NULL),
(95, 11, '2018-11-14', 1, 2, 0, NULL),
(96, 12, '2018-11-14', 1, 2, 0, NULL),
(97, 13, '2018-11-14', 1, 2, 0, NULL),
(98, 14, '2018-11-14', 1, 2, 0, NULL),
(99, 15, '2018-11-14', 1, 2, 0, NULL),
(100, 16, '2018-11-14', 1, 2, 0, NULL),
(101, 17, '2018-11-14', 1, 2, 0, NULL),
(102, 18, '2018-11-14', 1, 2, 0, NULL),
(103, 19, '2018-11-14', 1, 2, 0, NULL),
(104, 20, '2018-11-14', 1, 2, 0, NULL),
(105, 21, '2018-11-14', 1, 2, 0, NULL),
(106, 22, '2018-11-14', 1, 2, 0, NULL),
(107, 23, '2018-11-14', 1, 2, 0, NULL),
(108, 24, '2018-11-14', 1, 2, 0, NULL),
(109, 25, '2018-11-14', 1, 2, 0, NULL),
(110, 26, '2018-11-14', 1, 2, 0, NULL),
(111, 27, '2018-11-14', 1, 2, 0, NULL),
(112, 28, '2018-11-14', 1, 2, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'Время свободно'),
(2, 'Время занято');

-- --------------------------------------------------------

--
-- Структура таблицы `time`
--

CREATE TABLE `time` (
  `id` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `time`
--

INSERT INTO `time` (`id`, `time`) VALUES
(1, '09:00:00'),
(2, '09:15:00'),
(3, '09:30:00'),
(4, '09:45:00'),
(5, '10:00:00'),
(6, '10:15:00'),
(7, '10:30:00'),
(8, '10:45:00'),
(9, '11:00:00'),
(10, '11:15:00'),
(11, '11:30:00'),
(12, '11:45:00'),
(13, '13:00:00'),
(14, '13:15:00'),
(15, '13:30:00'),
(16, '13:45:00'),
(17, '14:00:00'),
(18, '14:15:00'),
(19, '14:30:00'),
(20, '14:45:00'),
(21, '15:00:00'),
(22, '15:15:00'),
(23, '15:30:00'),
(24, '15:45:00'),
(25, '16:00:00'),
(26, '16:15:00'),
(27, '16:30:00'),
(28, '16:45:00');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `phone`, `email`) VALUES
(1, 'Тест', 'Тест', 'Тест', '+7 (000) 000 00 00', ''),
(2, 'Пётр', 'Тест', 'sdfsdfsdf', '+7 (000) 000 00 00', 'mailto@mail.com'),
(3, 'esdsfdsf', 'sdfsfsdf', 'sdfsdfsdf', '+7 (324) 534 53 45', '87676@ya.ru'),
(4, 'Пётр', 'Петрович', 'Петров', '+7 (000) 000 00 00', 'mailto@mail.com'),
(5, 'esdsfdsf', 'sdfsfsdf', 'sdfsdfsdf', '+7 (842) 323 21 31', 'ShornikovAE@ulan-ude-eg.ru'),
(6, 'Тест', 'Тестович', 'Тестов', '+7 (097) 987 68 99', 'DoroganIA@ulan-ude-eg.ru'),
(7, 'Тест', 'Тест', 'Тест', '', 'chetca@yandex.ru');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reception`
--
ALTER TABLE `reception`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `operators`
--
ALTER TABLE `operators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `reception`
--
ALTER TABLE `reception`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `time`
--
ALTER TABLE `time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
