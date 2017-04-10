-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2017 年 02 月 25 日 11:16
-- 伺服器版本: 5.5.52-MariaDB
-- PHP 版本： 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- 資料庫： `gettoeat`
--

-- --------------------------------------------------------

--
-- 資料表結構 `bill`
--

CREATE TABLE `bill` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `year` int(10) UNSIGNED NOT NULL,
  `month` tinyint(3) UNSIGNED NOT NULL,
  `date` tinyint(3) UNSIGNED NOT NULL,
  `day` tinyint(3) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `ordered_at` int(10) UNSIGNED NOT NULL,
  `paid_at` int(10) UNSIGNED NOT NULL,
  `custermers` tinyint(3) UNSIGNED NOT NULL,
  `table` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `bill`
--

INSERT INTO `bill` (`id`, `store_id`, `year`, `month`, `date`, `day`, `price`, `ordered_at`, `paid_at`, `custermers`, `table`) VALUES
(1, 1, 2017, 2, 2, 4, 600, 1486054013, 1486054069, 2, 'middle_1'),
(2, 1, 2017, 2, 2, 4, 350, 1486057364, 1486057386, 3, 'bar_1'),
(3, 1, 2017, 2, 19, 7, 250, 1487503672, 1487949954, 0, '吧2'),
(4, 1, 2017, 2, 24, 5, 280, 1487950019, 1487950676, 2, '吧1'),
(5, 1, 2017, 2, 24, 5, 100, 1487955193, 1487955208, 1, '吧2'),
(6, 1, 2017, 2, 22, 3, 200, 1487760418, 1488007054, 1, '方1'),
(7, 1, 2017, 2, 25, 6, 80, 1488007077, 1488007097, 1, '吧2'),
(10, 1, 2017, 2, 25, 6, 200, 1488010279, 1488010428, 1, '方3');

-- --------------------------------------------------------

--
-- 資料表結構 `bill_discount`
--

CREATE TABLE `bill_discount` (
  `id` int(10) UNSIGNED NOT NULL,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `value` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `bill_item`
--

CREATE TABLE `bill_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `amount` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `bill_item`
--

INSERT INTO `bill_item` (`id`, `bill_id`, `product_id`, `amount`) VALUES
(1, 1, 1, 3),
(2, 2, 5, 2),
(3, 2, 4, 1),
(4, 2, 1, 2),
(5, 3, 1, 2),
(6, 3, 5, 1),
(7, 4, 1, 2),
(8, 4, 5, 1),
(9, 4, 4, 1),
(10, 5, 5, 2),
(11, 6, 1, 2),
(12, 7, 5, 1),
(13, 7, 4, 1),
(17, 10, 1, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `category`
--

INSERT INTO `category` (`id`, `store_id`, `name`) VALUES
(1, 1, '酒'),
(2, 2, '果汁'),
(3, 2, '冰淇淋'),
(4, 1, '菜'),
(5, 1, '點心'),
(6, 3, '超好吃'),
(7, 3, '羅偉創意');

-- --------------------------------------------------------

--
-- 資料表結構 `event`
--

CREATE TABLE `event` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `start_at` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `end_at` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL,
  `off` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `product`
--

INSERT INTO `product` (`id`, `store_id`, `name`, `price`, `category_id`, `position`, `off`) VALUES
(1, 1, '小糊塗仙', 100, 1, 0, 0),
(2, 2, '芭樂汁', 70, 2, 0, 0),
(3, 2, '海膽冰淇淋', 100, 3, 0, 0),
(4, 1, '紅蘿葡', 30, 4, 2, 0),
(5, 1, '蕃茄', 50, 4, 1, 0),
(6, 1, '牛奶', 50, 4, 0, 1),
(7, 3, '超好吃自來水', 500, 6, 1, 0),
(8, 3, '超好吃wifi', 300, 6, 0, 0),
(9, 3, '大大大漢堡', 20, 7, 1, 0),
(10, 3, 'Macbook', 40000, 7, 2, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `account` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `store`
--

INSERT INTO `store` (`id`, `account`, `name`, `nickname`) VALUES
(1, 'temperbeer', '好啤氣', '好啤氣'),
(2, '3035', '参零参伍冰果室', '参零参伍'),
(3, 'demo', 'DEMO 商家', 'DEMO');

-- --------------------------------------------------------

--
-- 資料表結構 `tables_info`
--

CREATE TABLE `tables_info` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `version` tinyint(3) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `tables_info`
--

INSERT INTO `tables_info` (`id`, `store_id`, `version`, `data`) VALUES
(1, 1, 1, '{\"totalHeight\":460,\"totalWidth\":420,\"tables\":[{\"name\":\"吧2\",\"width\":80,\"height\":40,\"x\":\"20px\",\"y\":\"80px\",\"active\":true},{\"name\":\"吧6\",\"width\":80,\"height\":40,\"x\":\"20px\",\"y\":\"320px\",\"active\":true},{\"name\":\"吧5\",\"width\":80,\"height\":40,\"x\":\"20px\",\"y\":\"260px\",\"active\":true},{\"name\":\"吧4\",\"width\":80,\"height\":40,\"x\":\"20px\",\"y\":\"200px\",\"active\":true},{\"name\":\"吧3\",\"width\":80,\"height\":40,\"x\":\"20px\",\"y\":\"140px\",\"active\":true},{\"name\":\"吧1\",\"width\":80,\"height\":40,\"x\":\"20px\",\"y\":\"20px\",\"active\":true},{\"name\":\"方6\",\"width\":80,\"height\":40,\"x\":\"320px\",\"y\":\"320px\",\"active\":true},{\"name\":\"外1\",\"width\":80,\"height\":40,\"x\":\"120px\",\"y\":\"20px\",\"active\":true},{\"name\":\"外2\",\"width\":80,\"height\":40,\"x\":\"120px\",\"y\":\"80px\",\"active\":true},{\"name\":\"長1\",\"width\":80,\"height\":40,\"x\":\"120px\",\"y\":\"140px\",\"active\":true},{\"name\":\"高1\",\"width\":80,\"height\":40,\"x\":\"120px\",\"y\":\"200px\",\"active\":true},{\"name\":\"高2\",\"width\":80,\"height\":40,\"x\":\"120px\",\"y\":\"260px\",\"active\":true},{\"name\":\"高3\",\"width\":80,\"height\":40,\"x\":\"120px\",\"y\":\"320px\",\"active\":true},{\"name\":\"圓1\",\"width\":80,\"height\":40,\"x\":\"220px\",\"y\":\"20px\",\"active\":true},{\"name\":\"圓2\",\"width\":80,\"height\":40,\"x\":\"220px\",\"y\":\"80px\",\"active\":true},{\"name\":\"圓3\",\"width\":80,\"height\":40,\"x\":\"220px\",\"y\":\"140px\",\"active\":true},{\"name\":\"圓4\",\"width\":80,\"height\":40,\"x\":\"220px\",\"y\":\"200px\",\"active\":true},{\"name\":\"方2\",\"width\":80,\"height\":40,\"x\":\"320px\",\"y\":\"80px\",\"active\":true},{\"name\":\"方3\",\"width\":80,\"height\":40,\"x\":\"320px\",\"y\":\"140px\",\"active\":true},{\"name\":\"方4\",\"width\":80,\"height\":40,\"x\":\"320px\",\"y\":\"200px\",\"active\":true},{\"name\":\"方5\",\"width\":80,\"height\":40,\"x\":\"320px\",\"y\":\"260px\",\"active\":true},{\"name\":\"外帶4\",\"width\":80,\"height\":40,\"x\":\"320px\",\"y\":\"400px\",\"active\":true},{\"name\":\"外帶3\",\"width\":80,\"height\":40,\"x\":\"220px\",\"y\":\"400px\",\"active\":true},{\"name\":\"外帶2\",\"width\":80,\"height\":40,\"x\":\"120px\",\"y\":\"400px\",\"active\":true},{\"name\":\"外帶1\",\"width\":80,\"height\":40,\"x\":\"20px\",\"y\":\"400px\",\"active\":true},{\"name\":\"方1\",\"width\":80,\"height\":40,\"x\":\"320px\",\"y\":\"20px\",\"active\":true}]}'),
(2, 2, 1, '{\"totalHeight\":180,\"totalWidth\":300,\"tables\":[]}'),
(4, 3, 1, '');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `year` (`year`),
  ADD KEY `month` (`month`),
  ADD KEY `date` (`date`),
  ADD KEY `day` (`day`),
  ADD KEY `table` (`table`),
  ADD KEY `store_id` (`store_id`);

--
-- 資料表索引 `bill_discount`
--
ALTER TABLE `bill_discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `event_id` (`event_id`);

--
-- 資料表索引 `bill_item`
--
ALTER TABLE `bill_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_id` (`bill_id`,`product_id`);

--
-- 資料表索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- 資料表索引 `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`,`position`) USING BTREE,
  ADD KEY `store_id` (`store_id`);

--
-- 資料表索引 `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`),
  ADD KEY `name` (`name`);

--
-- 資料表索引 `tables_info`
--
ALTER TABLE `tables_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `store_version` (`store_id`,`version`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用資料表 AUTO_INCREMENT `bill_discount`
--
ALTER TABLE `bill_discount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `bill_item`
--
ALTER TABLE `bill_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- 使用資料表 AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用資料表 AUTO_INCREMENT `event`
--
ALTER TABLE `event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用資料表 AUTO_INCREMENT `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `tables_info`
--
ALTER TABLE `tables_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
