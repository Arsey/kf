-- phpMyAdmin SQL Dump
-- version 4.0.10.2
-- http://www.phpmyadmin.net
--
-- Хост: bambuky.mysql.ukraine.com.ua
-- Время создания: Окт 14 2014 г., 01:54
-- Версия сервера: 5.1.72-cll-lve
-- Версия PHP: 5.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `bambuky_kiwi`
--

-- --------------------------------------------------------

--
-- Структура таблицы `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `image_min` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `banner`
--

INSERT INTO `banner` (`id`, `title`, `image`, `active`, `sort`, `image_min`, `link`) VALUES
(1, 'Банер 1', '/uploads/banner/banner3.jpg', 1, 2, '/uploads/banner/banner3.jpg', '#'),
(2, 'Банер 3', '/uploads/banner/banner4.jpg', 1, 3, '/uploads/banner/banner4.jpg', 'Банер 3'),
(3, 'Баннер 3', '/uploads/banner/banner1.jpg', 1, 1, '/uploads/banner/banner1.jpg', '#'),
(4, 'Банер 4', '/uploads/banner/banner2.jpg', 1, 4, '/uploads/banner/banner2.jpg', '#');

-- --------------------------------------------------------

--
-- Структура таблицы `banner_section`
--

CREATE TABLE IF NOT EXISTS `banner_section` (
  `banner_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`banner_id`,`section_id`),
  KEY `IDX_792E532C684EC833` (`banner_id`),
  KEY `IDX_792E532CD823E37A` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `banner_section`
--

INSERT INTO `banner_section` (`banner_id`, `section_id`) VALUES
(1, 1),
(1, 6),
(2, 1),
(2, 6),
(3, 1),
(3, 6),
(4, 1),
(4, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `banner_translations`
--

CREATE TABLE IF NOT EXISTS `banner_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  KEY `IDX_F8B8D8B232D562B` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `banner_translations`
--

INSERT INTO `banner_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Банер 1', 'ru', 'title'),
(2, 1, '/uploads/banner/banner3.jpg', 'ru', 'image'),
(3, 2, 'Банер 2', 'ru', 'title'),
(4, 2, '/uploads/banner/banner4.jpg', 'ru', 'image'),
(5, 3, 'Баннер 3', 'ru', 'title'),
(6, 3, '/uploads/banner/banner1.jpg', 'ru', 'image'),
(7, 3, '/uploads/banner/banner1.jpg', 'ru', 'image_min'),
(8, 1, '/uploads/banner/banner3.jpg', 'ru', 'image_min'),
(9, 1, '#', 'ru', 'link'),
(10, 2, '/uploads/banner/banner4.jpg', 'ru', 'image_min'),
(11, 2, '#', 'ru', 'link'),
(12, 4, 'Банер 4', 'ru', 'title'),
(13, 4, '/uploads/banner/banner2.jpg', 'ru', 'image'),
(14, 4, '/uploads/banner/banner2.jpg', 'ru', 'image_min');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(1, 'Категорія 1', 'Категорія 1'),
(2, 'Категорія 2', 'Категорія 2'),
(3, 'Категроія 3', 'Категроія 3');

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'Львів'),
(2, 'Київ'),
(3, 'Харків');

-- --------------------------------------------------------

--
-- Структура таблицы `city_translations`
--

CREATE TABLE IF NOT EXISTS `city_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  KEY `IDX_562B7308232D562B` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `city_translations`
--

INSERT INTO `city_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Львов', 'ru', 'name'),
(2, 2, 'Киев', 'ru', 'name'),
(3, 3, 'Харьков', 'ru', 'name');

-- --------------------------------------------------------

--
-- Структура таблицы `club`
--

CREATE TABLE IF NOT EXISTS `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `content_code` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_18DC974C8BAC62AF` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `club`
--

INSERT INTO `club` (`id`, `city_id`, `name`, `phone`, `active`, `sort`, `content`, `content_code`) VALUES
(2, 1, 'C. Бандери 18', '+380 32 261 35 73', 1, 0, '<div class="row "><div class="columns large-6 medium-6 small-6"><p>asdfsadf</p></div><div class="columns large-6 medium-6 small-6"><p>asdf</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>asdfasdf</p></div></div>', '[{"collapsed":false,"columns":[{"content":"<p>asdfsadf</p>","large":"6","medium":"6","small":"6"},{"content":"<p>asdf</p>","large":"6","medium":"6","small":"6"}]},{"collapsed":false,"columns":[{"content":"<p>asdfasdf</p>","large":"12","medium":"12","small":"12"}]}]'),
(3, 1, 'Масарика 2', '+380 32  240 74 77', 1, 0, NULL, NULL),
(4, 1, 'Наукова 43б', '+380 32 240 97 65', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `club_translations`
--

CREATE TABLE IF NOT EXISTS `club_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  KEY `IDX_BC037277232D562B` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `club_translations`
--

INSERT INTO `club_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 2, 'C. Бандеры 18', 'ru', 'name'),
(2, 3, 'Масарика 2', 'ru', 'name'),
(3, 4, 'Научная 43б', 'ru', 'name'),
(4, 2, '[{"collapsed":false,"columns":[{"content":"<p>asdfasdf</p>","large":"6","medium":"6","small":"6"},{"content":"<p>asdf</p>","large":"6","medium":"6","small":"6"}]},{"collapsed":false,"columns":[{"content":"<p>asdfsd</p>","large":"12","medium":"12","small":', 'ru', 'content_code'),
(5, 2, '<div class="row "><div class="columns large-6 medium-6 small-6"><p>asdfasdf</p></div><div class="columns large-6 medium-6 small-6"><p>asdf</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>asdfsd</p></div></div>', 'ru', 'content');

-- --------------------------------------------------------

--
-- Структура таблицы `command`
--

CREATE TABLE IF NOT EXISTS `command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `content_code` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `command`
--

INSERT INTO `command` (`id`, `name`, `type`, `image`, `active`, `content`, `content_code`) VALUES
(1, 'Катерина Цьовх', 1, '/uploads\\12_1.jpg', 1, '<div class="row "><div class="columns large-6 medium-6 small-6"><p>asdfadsf</p></div><div class="columns large-6 medium-6 small-6"><p>asdfasdf</p></div></div>', '[{"collapsed":false,"columns":[{"content":"<p>asdfadsf</p>","large":"6","medium":"6","small":"6"},{"content":"<p>asdfasdf</p>","large":"6","medium":"6","small":"6"}]}]'),
(7, 'Надія Куспись', 1, '/uploads\\25_1.jpg', 1, '<p>Досвідчений інструктор, для якого фітнес - це стиль життя</p>', NULL),
(8, 'Анна Журбенко', 3, '/uploads\\13_1.jpg', 1, '<p>Леді Елегантність та Стиль - цю номінацію Анюта беззаперечно завоювала б на будь-якому конкурсі краси. Різні за характером та цікаві за хореографією танцювальні композиції, яких ви легко навчитесь на її тренуваннях, допоможуть стати королевою данс-полу, а при бажанні - підкорити серце будь-якого мужчини!</p>', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `command_translations`
--

CREATE TABLE IF NOT EXISTS `command_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  KEY `IDX_ECDD6611232D562B` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `command_translations`
--

INSERT INTO `command_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Катерина Цьовх', 'ru', 'name'),
(2, 1, '<div class="row "><div class="columns large-6 medium-6 small-6"><p>asdfasdf</p></div><div class="columns large-6 medium-6 small-6"><p>asdfasdf</p></div></div>', 'ru', 'content'),
(8, 7, 'Надія Куспись', 'ru', 'name'),
(9, 7, '<p>Досвідчений інструктор, для якого фітнес - це стиль життя!</p>', 'ru', 'content'),
(10, 8, 'Анна Журбенко', 'ru', 'name'),
(11, 8, '<p>Леді Елегантність та Стиль - цю номінацію Анюта беззаперечно завоювала б на будь-якому конкурсі краси. Різні за характером та цікаві за хореографією танцювальні композиції, яких ви легко навчитесь на її тренуваннях, допоможуть стати королевою данс-полу, а при бажанні - підкорити серце будь-якого мужчини!</p>', 'ru', 'content'),
(12, 1, '[{"collapsed":false,"columns":[{"content":"<p>asdfasdf</p>","large":"6","medium":"6","small":"6"},{"content":"<p>asdfasdf</p>","large":"6","medium":"6","small":"6"}]}]', 'ru', 'content_code');

-- --------------------------------------------------------

--
-- Структура таблицы `comparingcharacteristics`
--

CREATE TABLE IF NOT EXISTS `comparingcharacteristics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ext_translations`
--

CREATE TABLE IF NOT EXISTS `ext_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_class`,`field`,`foreign_key`),
  KEY `translations_lookup_idx` (`locale`,`object_class`,`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `fos_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `fos_user_group`
--

INSERT INTO `fos_user_group` (`id`, `name`, `roles`) VALUES
(1, 'Менеджер', 'a:3:{i:0;s:10:"ROLE_ADMIN";i:1;s:9:"ROLE_USER";i:2;s:16:"ROLE_SUPER_ADMIN";}'),
(2, 'Адміністратор', 'a:2:{i:0;s:10:"ROLE_ADMIN";i:1;s:9:"ROLE_USER";}'),
(3, 'Користувач', 'a:0:{}');

-- --------------------------------------------------------

--
-- Структура таблицы `fos_user_user`
--

CREATE TABLE IF NOT EXISTS `fos_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `fos_user_user`
--

INSERT INTO `fos_user_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`) VALUES
(1, 'admin', 'admin', 'admin@example.com', 'admin@example.com', 1, 'lr4aqouoitcw8c4kosk8ggo8s8s804k', 'P+gCC9r1oYVF0/k/y0/gpnV2PedB8/dhgUsGLu1ZGqb2siYvClDhpbRonyud8k8g9Lhvk4mcdq3Yk53UV4GtRw==', '2014-10-14 01:15:53', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '2014-04-25 10:59:52', '2014-10-14 01:15:53', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `fos_user_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_B3C77447A76ED395` (`user_id`),
  KEY `IDX_B3C77447FE54D947` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `groupcommand`
--

CREATE TABLE IF NOT EXISTS `groupcommand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`, `logo`) VALUES
(1, 'Tenax', '/uploads\\manufacturer\\tenax.jpg'),
(2, 'Pilkington', '/uploads\\manufacturer\\Pilkington.gif'),
(3, 'Guardien', '/uploads\\manufacturer\\Guardian.gif');

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturer_translations`
--

CREATE TABLE IF NOT EXISTS `manufacturer_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  KEY `IDX_77BCE4B7232D562B` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `manufacturer_translations`
--

INSERT INTO `manufacturer_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Англійська', 'en', 'description'),
(2, 1, 'Російська', 'ru', 'description');

-- --------------------------------------------------------

--
-- Структура таблицы `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `show_in_menu` tinyint(1) DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8_unicode_ci,
  `meta_description` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `show_menu` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_code` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_140AB620727ACA70` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `page`
--

INSERT INTO `page` (`id`, `parent_id`, `show_in_menu`, `slug`, `created`, `title`, `url`, `meta_keywords`, `meta_description`, `content`, `show_menu`, `active`, `position`, `icon`, `icon_color`, `content_code`) VALUES
(9, NULL, NULL, 'relax', '2014-05-26 11:34:50', 'Релакс зона', NULL, 'Релакс зона', 'Релакс зона', '<p><strong>BAMBUK&nbsp;</strong>- команда, яка покликана любити те, що вона робить та робити те, що любить - якісно і з душею. Душу вкладає у власний дизайн і прагне повноцінно жити ним. Бо ті, хто є командою "Bambuk", хотіли бути тими, ким вони є і прагнути до того, що їх чекає в майбутньому...</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ПОКЛИКАННЯ</strong>&nbsp;- змінювати світ навколо нас створюючи нове, краще, гарніше і цікавіше. Робити це так, щоб ми самі бачили, як створений дизайн живе навколо нас і людей, для яких ми це робили.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>СПЕЦІАЛІЗАЦІЯ</strong>&nbsp;- річ відносна, тому команда, як мінімум, здатна зробити усе, що представлено у&nbsp;<a href="http://bambus.com.ua/ua/portfolio.html">портфоліо</a>, і кожного разу набагато краще! А все нове - лише надихає до нових вершин.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ПІДХІД</strong>&nbsp;- ще та штука... Навіть якщо спробувати його стандартизувати, він все одно індивідуальний. Бо по обидві сторони працюють не стільки Компанії, скільки Люди, такі ж, як ми з Вами - індивідуальні.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ДОСВІД</strong>&nbsp;- все ж, продовжує приходити... І, можливо, Ви скажете, що не зовсім гарно братись за щось нове, не маючи у тому досвіду, але саме покликання дизайн-студії &laquo;творити нове&raquo; змушує думати не стільки про красу процесу, скільки про досконалість результату.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ЦІНИ</strong>&nbsp;- потрібно обговорювати. Формуються від об&rsquo;єму роботи, який визначається часом затраченим професійним дизайнером на виконання поставленого завдання.</p>', 1, 1, 3, '/uploads\\menu\\relax.svg', '/uploads\\menu\\menu-hover.png', NULL),
(10, NULL, NULL, 'personal training', '2014-05-26 11:36:34', 'Персональні занняття', NULL, 'Персональні занняття', 'Персональні занняття', '<div class="row "><div class="columns large-2 medium-2 small-2"><p>hgdfgsdfgsdfg</p></div><div class="columns large-2 medium-2 small-2"><p>dfgsdfg</p></div><div class="columns large-2 medium-2 small-2"><p>dsfgsdfg</p></div><div class="columns large-2 medium-2 small-2"><p>sdfsdfsd</p></div><div class="columns large-2 medium-2 small-2"><p>asdfasdf</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>sdfgsdfgsdf sfsdf sdf</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>sdfgsdfgsd sgfsdf sa</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>gdsfgsdfgf fsad asd</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>gsdfgsdfgsdfg ddfsafsd</p></div></div>', 1, 1, 1, '/uploads\\menu\\personal-training.svg', '/uploads\\menu\\menu-hover.png', '[{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>hgdfgsdfgsdfg</p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p>dfgsdfg</p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p>dsfgsdfg</p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p>sdfsdfsd</p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p>asdfasdf</p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"}]},{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>sdfgsdfgsdf sfsdf sdf</p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p><br></p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p><br></p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p><br></p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p><br></p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"}]},{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>sdfgsdfgsd sgfsdf sa</p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p><br></p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p>lkhn;m;l</p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"1"},{"content":"<p>pk[pk[''</p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p><br></p>","large":"2","medium":"2","small":"2","hideSmall":"0","hideMedium":"0","hideLarge":"0"}]},{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>gdsfgsdfgf fsad asd</p>","large":"12","medium":"12","small":"12","hideSmall":"0","hideMedium":"0","hideLarge":"0"}]},{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>gsdfgsdfgsdfg ddfsafsd</p>","large":"12","medium":"12","small":"12","hideSmall":"0","hideMedium":"0","hideLarge":"0"}]}]'),
(12, NULL, NULL, 'group', '2014-05-26 11:51:47', 'Групові заняття', NULL, 'Групові заняття', 'Групові заняття', '<p>Інформація</p>', 1, 1, 2, '/uploads\\menu\\group.svg', '/uploads\\menu\\menu-hover.png', NULL),
(13, NULL, NULL, 'faty_gone', '2014-09-20 22:12:07', 'Програма схуднення', NULL, 'Програма схуднення', 'Програма схуднення', NULL, 1, 1, 4, '/uploads\\menu\\fatyGone.svg', '/uploads\\menu\\menu-hover.png', NULL),
(14, 10, NULL, 'personal_tren_mind_body', '2014-09-20 22:13:31', 'Mind & Body', NULL, 'Mind & Body', 'Mind & Body', '<div class="row "><div class="columns large-6 medium-6 small-6"><p>івафівф</p></div><div class="columns large-6 medium-6 small-6"><p>фіва</p></div></div><div class="row "><div class="columns large-6 medium-6 small-6"><p>фівафівафіва</p></div><div class="columns large-6 medium-6 small-6"><p>фіва</p></div></div>', 1, 1, 3, NULL, NULL, '[{"collapsed":false,"columns":[{"content":"<p>івафівф</p>","large":"6","medium":"6","small":"6"},{"content":"<p>фіва</p>","large":"6","medium":"6","small":"6"}]},{"collapsed":false,"columns":[{"content":"<p>фівафівафіва</p>","large":"6","medium":"6","small":"6"},{"content":"<p>фіва</p>","large":"6","medium":"6","small":"6"}]}]'),
(15, 12, NULL, 'Group_Mind_Body', '2014-09-20 22:14:08', 'Mind & Body', NULL, 'Mind & Body', 'Mind & Body', NULL, 1, 1, 1, NULL, NULL, NULL),
(16, 10, NULL, 'dance_program', '2014-09-20 22:15:40', 'Танцювальні програми', NULL, 'Танцювальні програми', 'Танцювальні програми', NULL, 1, 1, 2, NULL, NULL, NULL),
(17, 14, NULL, 'Prenatal_for_123', '2014-09-20 22:17:22', 'Prenatal (для вагітних)', NULL, 'Prenatal (для вагітних)', 'Prenatal (для вагітних)', '<div class="row "><div class="columns large-1 medium-1 small-1"><p>asdfcasdfadsf</p></div><div class="columns large-1 medium-1 small-1"><p>asdfasdf</p></div><div class="columns large-1 medium-1 small-1"><p>adsfasdf</p></div><div class="columns large-1 medium-1 small-1"><p>sdfgsdfg</p></div><div class="columns large-1 medium-1 small-1"><p>sdg</p></div><div class="columns large-1 medium-1 small-1"><p>sdfgsdf</p></div><div class="columns large-1 medium-1 small-1"><p>sdfgsdfg</p></div><div class="columns large-1 medium-1 small-1"><p>asdfasdfadsfsdf</p></div><div class="columns large-1 medium-1 small-1"><p><br></p></div><div class="columns large-1 medium-1 small-1"><p><br></p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>sdfgsdfgsdfgsdfasdfsadfsadf<img alt="" style="width: 550px; height: 413px;" data-cke-saved-src="http://kivi.bambus.com.ua/uploads/2.jpg" src="http://kivi.bambus.com.ua/uploads/2.jpg">​</p></div></div>', 1, 1, 5, NULL, NULL, '[{"collapsed":false,"columns":[{"content":"<p>asdfcasdfadsf</p>","large":"1","medium":"1","small":"1"},{"content":"<p>asdfasdf</p>","large":"1","medium":"1","small":"1"},{"content":"<p>adsfasdf</p>","large":"1","medium":"1","small":"1"},{"content":"<p>sdfgsdfg</p>","large":"1","medium":"1","small":"1"},{"content":"<p>sdg</p>","large":"1","medium":"1","small":"1"},{"content":"<p>sdfgsdf</p>","large":"1","medium":"1","small":"1"},{"content":"<p>sdfgsdfg</p>","large":"1","medium":"1","small":"1"},{"content":"<p>asdfasdfadsfsdf</p>","large":"1","medium":"1","small":"1"},{"content":"<p><br></p>","large":"1","medium":"1","small":"1"},{"content":"<p><br></p>","large":"1","medium":"1","small":"1"}]},{"collapsed":false,"columns":[{"content":"<p>sdfgsdfgsdfgsdfasdfsadfsadf<img alt=\\"\\" style=\\"width: 550px; height: 413px;\\" data-cke-saved-src=\\"http://kivi.bambus.com.ua/uploads/2.jpg\\" src=\\"http://kivi.bambus.com.ua/uploads/2.jpg\\">​</p>","large":"12","medium":"12","small":"12"}]}]'),
(18, 14, NULL, 'kivi_mather', '2014-09-20 22:21:03', 'Ківі-мама (мама+малюк)', NULL, 'Ківі-мама (мама+малюк)', 'Ківі-мама (мама+малюк)', '<div class="row "><div class="columns large-4 medium-4 small-4"><p>фіваіфв</p></div><div class="columns large-4 medium-4 small-4"><p>фіва</p></div><div class="columns large-4 medium-4 small-4"><p>фівафіва</p></div></div>', 1, 1, 4, NULL, NULL, '[{"collapsed":false,"columns":[{"content":"<p>фіваіфв</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фіва</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фівафіва</p>","large":"4","medium":"4","small":"4"}]}]'),
(19, 15, NULL, 'pilatex_relax', '2014-09-20 22:22:32', 'Пілатес-релакс', NULL, 'Пілатес-релакс', 'Пілатес-релакс', '<div class="row "><div class="columns large-6 medium-6 small-6"><p>іфваіфва</p></div><div class="columns large-6 medium-6 small-6"><p>фівафіва</p></div></div>', 1, 1, 3, NULL, NULL, '[{"collapsed":false,"columns":[{"content":"<p>іфваіфва</p>","large":"6","medium":"6","small":"6"},{"content":"<p>фівафіва</p>","large":"6","medium":"6","small":"6"}]}]'),
(20, 14, NULL, 'Stretch+ABS', '2014-09-20 22:24:34', 'Stretch+ABS', NULL, 'Stretch+ABS', 'Stretch+ABS', '<div class="row "><div class="columns large-6 medium-6 small-6"><p><strong>іфвафі </strong>авлопвл<br><img alt="" data-cke-saved-src="http://kivi.bambus.com.ua/uploads/images.jpg" src="http://kivi.bambus.com.ua/uploads/images.jpg" style="height:175px; width:288px">​</p></div><div class="columns large-6 medium-6 small-6"><ul><li><h1 style="text-align: right;">фіва орва</h1></li></ul></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>фіваіфва</p><p><iframe width="640" height="360" src="//www.youtube.com/embed/SBqsXeaPCZU" frameborder="0" allowfullscreen="">​</iframe></p></div></div>', 1, 1, 5, NULL, NULL, '[{"collapsed":false,"columns":[{"content":"<p><strong>іфвафі </strong>авлопвл<br><img alt=\\"\\" data-cke-saved-src=\\"http://kivi.bambus.com.ua/uploads/images.jpg\\" src=\\"http://kivi.bambus.com.ua/uploads/images.jpg\\" style=\\"height:175px; width:288px\\">​</p>","large":"6","medium":"6","small":"6"},{"content":"<ul><li><h1 style=\\"text-align: right;\\">фіва орва</h1></li></ul>","large":"6","medium":"6","small":"6"}]},{"collapsed":false,"columns":[{"content":"<p>фіваіфва</p><p><iframe width=\\"640\\" height=\\"360\\" src=\\"//www.youtube.com/embed/SBqsXeaPCZU\\" frameborder=\\"0\\" allowfullscreen=\\"\\">​</iframe></p>","large":"12","medium":"12","small":"12"}]}]'),
(21, 14, NULL, 'hata-yogo', '2014-09-20 22:42:49', 'Хатха Йога', NULL, 'Хатха Йога', 'Хатха Йога', '<div class="row "><div class="columns large-4 medium-4 small-4"><p>фівафіва</p></div><div class="columns large-4 medium-4 small-4"><p>фівафіва</p></div><div class="columns large-4 medium-4 small-4"><p>фіваіфва</p></div></div>', 1, 1, 4, NULL, NULL, '[{"collapsed":false,"columns":[{"content":"<p>фівафіва</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фівафіва</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фіваіфва</p>","large":"4","medium":"4","small":"4"}]}]'),
(22, 15, NULL, 'hata-yogo12', '2014-09-20 22:43:29', 'Хатха Йога', NULL, 'Хатха Йога', 'Хатха Йога', '<div class="row "><div class="columns large-4 medium-4 small-4"><p>фівафівафів фів афів</p></div><div class="columns large-4 medium-4 small-4"><p>фіва</p></div><div class="columns large-4 medium-4 small-4"><p>фіва</p></div></div><div class="row "><div class="columns large-4 medium-4 small-4"><p>фівафіва</p></div><div class="columns large-4 medium-4 small-4"><p>фіваіва</p></div><div class="columns large-4 medium-4 small-4"><p>фівафіва</p></div></div>', 1, 1, 3, NULL, NULL, '[{"collapsed":false,"columns":[{"content":"<p>фівафівафів фів афів</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фіва</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фіва</p>","large":"4","medium":"4","small":"4"}]},{"collapsed":false,"columns":[{"content":"<p>фівафіва</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фіваіва</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фівафіва</p>","large":"4","medium":"4","small":"4"}]}]'),
(23, 16, NULL, 'pilatex_relax12', '2014-09-20 22:49:04', 'Пілатес-релакс', NULL, 'Пілатес-релакс', 'Пілатес-релакс', '<div class="row  " ><div class="columns large-4 medium-4 small-4"><p>фвіайфіва7777</p></div><div class="columns large-4 medium-4 small-4"><p>фіва</p></div><div class="columns large-4 medium-4 small-4"><p>фіваfgfgf212121212</p></div></div><div class="row  " ><div class="columns large-12 medium-12 small-12"><p><img alt="" data-cke-saved-src="http://kivi.bambus.com.ua/uploads/2.jpg" src="http://kivi.bambus.com.ua/uploads/2.jpg" style="height:413px; width:550px">​</p></div></div>', 1, 1, 2, NULL, NULL, '[{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>фвіайфіва7777</p>","large":"4","medium":"4","small":"4","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p>фіва</p>","large":"4","medium":"4","small":"4","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p>фіваfgfgf212121212</p>","large":"4","medium":"4","small":"4","hideSmall":"0","hideMedium":"0","hideLarge":"0"}]},{"collapsed":false,"class":"","style":"","columns":[{"content":"<p><img alt=\\"\\" data-cke-saved-src=\\"http://kivi.bambus.com.ua/uploads/2.jpg\\" src=\\"http://kivi.bambus.com.ua/uploads/2.jpg\\" style=\\"height:413px; width:550px\\">​</p>","large":"12","medium":"12","small":"12","hideSmall":"0","hideMedium":"0","hideLarge":"0"}]}]');

-- --------------------------------------------------------

--
-- Структура таблицы `page_translations`
--

CREATE TABLE IF NOT EXISTS `page_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  KEY `IDX_78AB76C9232D562B` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=83 ;

--
-- Дамп данных таблицы `page_translations`
--

INSERT INTO `page_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(5, 9, 'About Company', 'en', 'title'),
(7, 9, 'About Company', 'en', 'meta_keywords'),
(8, 9, 'About Company', 'en', 'meta_description'),
(10, 9, 'Релакс зона', 'ru', 'title'),
(12, 9, 'Релакс зона', 'ru', 'meta_keywords'),
(13, 9, 'Релакс зона', 'ru', 'meta_description'),
(15, 10, 'Склопакети', 'en', 'title'),
(17, 10, 'Склопакети', 'en', 'meta_keywords'),
(18, 10, 'Склопакети', 'en', 'meta_description'),
(20, 10, 'Персональные занятия', 'ru', 'title'),
(22, 10, 'Персональные занятия', 'ru', 'meta_keywords'),
(23, 10, 'Персональные занятия', 'ru', 'meta_description'),
(25, 12, 'Інформація', 'en', 'title'),
(26, 12, 'Інформація', 'en', 'meta_keywords'),
(27, 12, 'Інформація', 'en', 'meta_description'),
(29, 12, 'Групповые занятия', 'ru', 'title'),
(30, 12, 'Групповые занятия', 'ru', 'meta_keywords'),
(31, 12, 'Групповые занятия', 'ru', 'meta_description'),
(33, 10, '[{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>Персональные занятия</p>","large":"6","medium":"6","small":"6"},{"content":"<p>Персональные занятия</p>","large":"6","medium":"6","small":"6"}]}]', 'ru', 'content'),
(34, 13, 'Программа похудения', 'ru', 'title'),
(35, 13, 'Программа похудения', 'ru', 'meta_keywords'),
(36, 13, 'Программа похудения', 'ru', 'meta_description'),
(37, 14, 'Mind & Body', 'ru', 'title'),
(38, 14, 'Mind & Body', 'ru', 'meta_keywords'),
(39, 14, 'Mind & Body', 'ru', 'meta_description'),
(40, 15, 'Mind & Body', 'ru', 'title'),
(41, 15, 'Mind & Body', 'ru', 'meta_keywords'),
(42, 15, 'Mind & Body', 'ru', 'meta_description'),
(43, 16, 'Танцевальные программы', 'ru', 'title'),
(44, 16, 'Танцевальные программы', 'ru', 'meta_keywords'),
(45, 16, 'Танцевальные программы', 'ru', 'meta_description'),
(46, 17, 'Prenatal (для вагітних)', 'ru', 'title'),
(47, 17, 'Prenatal (для вагітних)', 'ru', 'meta_keywords'),
(48, 17, 'Prenatal (для вагітних)', 'ru', 'meta_description'),
(49, 17, '<div class="row "><div class="columns large-6 medium-6 small-6"><p>sdasdfasdf</p></div><div class="columns large-6 medium-6 small-6"><p>sadfasd</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>asdfasfsadf</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>hjplj;l</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>olk</p></div></div>', 'ru', 'content'),
(50, 18, 'Ківі-мама (мама+малюк)', 'ru', 'title'),
(51, 18, 'Ківі-мама (мама+малюк)', 'ru', 'meta_keywords'),
(52, 18, 'Ківі-мама (мама+малюк)', 'ru', 'meta_description'),
(53, 18, '<div class="row "><div class="columns large-6 medium-6 small-6"><p>віфафі</p></div><div class="columns large-6 medium-6 small-6"><p>фіва</p></div></div><div class="row "><div class="columns large-6 medium-6 small-6"><p>фівафіва</p></div><div class="columns large-6 medium-6 small-6"><p>фіва</p></div></div>', 'ru', 'content'),
(54, 19, 'Пілатес-релакс', 'ru', 'title'),
(55, 19, 'Пілатес-релакс', 'ru', 'meta_keywords'),
(56, 19, 'Пілатес-релакс', 'ru', 'meta_description'),
(57, 19, '<div class="row "><div class="columns large-6 medium-6 small-6"><p>фіваві</p></div><div class="columns large-6 medium-6 small-6"><p>фівафіва</p></div></div>', 'ru', 'content'),
(58, 20, 'Stretch+ABS', 'ru', 'title'),
(59, 20, 'Stretch+ABS', 'ru', 'meta_keywords'),
(60, 20, 'Stretch+ABS', 'ru', 'meta_description'),
(61, 20, '<div class="row "><div class="columns large-3 medium-3 small-3"><p>іфавіва</p></div><div class="columns large-3 medium-3 small-3"><p>фіва</p></div><div class="columns large-3 medium-3 small-3"><p>фіва</p></div><div class="columns large-3 medium-3 small-3"><p>фівафіва</p></div></div>', 'ru', 'content'),
(62, 21, 'Хатха Йога', 'ru', 'title'),
(63, 21, 'Хатха Йога', 'ru', 'meta_keywords'),
(64, 21, 'Хатха Йога', 'ru', 'meta_description'),
(65, 21, '<div class="row "><div class="columns large-4 medium-4 small-4"><p>фівафві</p></div><div class="columns large-4 medium-4 small-4"><p>фіва</p></div><div class="columns large-4 medium-4 small-4"><p>фівафіва</p></div></div>', 'ru', 'content'),
(66, 22, 'Хатха Йога', 'ru', 'title'),
(67, 22, 'Хатха Йога', 'ru', 'meta_keywords'),
(68, 22, 'Хатха Йога', 'ru', 'meta_description'),
(69, 22, '<div class="row "><div class="columns large-4 medium-4 small-4"><p>фіваф</p></div><div class="columns large-4 medium-4 small-4"><p>фіва</p></div><div class="columns large-4 medium-4 small-4"><p>фіва</p></div></div>', 'ru', 'content'),
(70, 23, 'Пілатес-релакс', 'ru', 'title'),
(71, 23, 'Пілатес-релакс', 'ru', 'meta_keywords'),
(72, 23, 'Пілатес-релакс', 'ru', 'meta_description'),
(73, 23, '<div class="row "><div class="columns large-6 medium-6 small-6"><p>фіваіва</p></div><div class="columns large-6 medium-6 small-6"><p>фіва</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>фіва</p></div></div>', 'ru', 'content'),
(74, 17, '[{"collapsed":false,"columns":[{"content":"<p>sdasdfasdf</p>","large":"6","medium":"6","small":"6"},{"content":"<p>sadfasd</p>","large":"6","medium":"6","small":"6"}]},{"collapsed":false,"columns":[{"content":"<p>asdfasfsadf</p>","large":"12","medium":"12","small":"12"}]},{"collapsed":false,"columns":[{"content":"<p>hjplj;l</p>","large":"12","medium":"12","small":"12"}]},{"collapsed":false,"columns":[{"content":"<p>olk</p>","large":"12","medium":"12","small":"12"}]}]', 'ru', 'content_code'),
(75, 14, '[{"collapsed":false,"columns":[{"content":"<p>фіва</p>","large":"6","medium":"6","small":"6"},{"content":"<p>фіва</p>","large":"6","medium":"6","small":"6"}]},{"collapsed":false,"columns":[{"content":"<p>фіва</p>","large":"12","medium":"12","small":"12"}]}]', 'ru', 'content_code'),
(76, 14, '<div class="row "><div class="columns large-6 medium-6 small-6"><p>фіва</p></div><div class="columns large-6 medium-6 small-6"><p>фіва</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>фіва</p></div></div>', 'ru', 'content'),
(77, 20, '[{"collapsed":false,"columns":[{"content":"<p>іфавіва</p>","large":"3","medium":"3","small":"3"},{"content":"<p>фіва</p>","large":"3","medium":"3","small":"3"},{"content":"<p>фіва</p>","large":"3","medium":"3","small":"3"},{"content":"<p>фівафіва</p>","large":"3","medium":"3","small":"3"}]}]', 'ru', 'content_code'),
(78, 18, '[{"collapsed":false,"columns":[{"content":"<p>віфафі</p>","large":"6","medium":"6","small":"6"},{"content":"<p>фіва</p>","large":"6","medium":"6","small":"6"}]},{"collapsed":false,"columns":[{"content":"<p>фівафіва</p>","large":"6","medium":"6","small":"6"},{"content":"<p>фіва</p>","large":"6","medium":"6","small":"6"}]}]', 'ru', 'content_code'),
(79, 21, '[{"collapsed":false,"columns":[{"content":"<p>фівафві</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фіва</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фівафіва</p>","large":"4","medium":"4","small":"4"}]}]', 'ru', 'content_code'),
(80, 22, '[{"collapsed":false,"columns":[{"content":"<p>фіваф</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фіва</p>","large":"4","medium":"4","small":"4"},{"content":"<p>фіва</p>","large":"4","medium":"4","small":"4"}]}]', 'ru', 'content_code'),
(81, 19, '[{"collapsed":false,"columns":[{"content":"<p>фіваві</p>","large":"6","medium":"6","small":"6"},{"content":"<p>фівафіва</p>","large":"6","medium":"6","small":"6"}]}]', 'ru', 'content_code'),
(82, 23, '[{"collapsed":false,"columns":[{"content":"<p>фіваіва</p>","large":"6","medium":"6","small":"6"},{"content":"<p>фіва</p>","large":"6","medium":"6","small":"6"}]},{"collapsed":false,"columns":[{"content":"<p>фіва</p>","large":"12","medium":"12","small":"12"}]}]', 'ru', 'content_code');

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `content_code` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `title`, `sort`, `description`, `image`, `content`, `active`, `type`, `slug`, `content_code`, `created`) VALUES
(1, 'Новина 1', 3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '/uploads/news/blog2.jpg', '<p>Новина 1</p>', 1, 2, 'news1', NULL, '2014-10-14 00:00:00'),
(2, 'Новина 2', 4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', '/uploads/news/blog1.jpg', '<p>Новина 2</p>', 1, 2, 'news2', NULL, '2014-10-14 00:00:00'),
(3, 'Новина 3', 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', '/uploads\\gallery\\hz2oubyf_2.JPG', '<div class="row "><div class="columns large-6 medium-6 small-6"><p>dsafasdf</p></div><div class="columns large-6 medium-6 small-6"><p>asdfasdf</p></div></div>', 1, 1, 'news3', '[{"collapsed":false,"columns":[{"content":"<p>dsafasdf</p>","large":"6","medium":"6","small":"6"},{"content":"<p>asdfasdf</p>","large":"6","medium":"6","small":"6"}]}]', '2014-10-07 00:00:00'),
(4, 'Новина4', 5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', '/uploads/DSC_1455.JPG', NULL, 1, 1, 'news4', NULL, '2014-10-13 00:00:00'),
(5, 'Піврічні абонементи! Акція діє до 30 серпня!', 1, 'Існує багато варіацій уривків з Lorem Ipsum, але більшість з них зазнала певних змін на кшталт жартівливих вставок або змішування слів, які навіть не виглядають правдоподібно. Якщо ви збираєтесь використовувати Lorem Ipsum.', '/uploads/news/blog1.jpg', '<div class="row  " ><div class="columns large-6 medium-6 small-6"><p><span style="background-color:rgb(255, 255, 255); color:rgb(102, 102, 102)">Існує багато варіацій уривків з Lorem Ipsum, але більшість з них зазнала певних змін на кшталт жартівливих вставок або змішування слів, які навіть не виглядають правдоподібно. Якщо ви збираєтесь використовувати Lorem Ipsum.</span><br></p></div><div class="columns large-6 medium-6 small-6"><p><span style="background-color:rgb(255, 255, 255); color:rgb(102, 102, 102)">Існує багато варіацій уривків з Lorem Ipsum, але більшість з них зазнала певних змін на кшталт жартівливих вставок або змішування слів, які навіть не виглядають правдоподібно. Якщо ви збираєтесь використовувати Lorem Ipsum.</span><br></p></div></div><div class="row  " ><div class="columns large-12 medium-12 small-12"><p><span style="background-color:rgb(255, 255, 255); color:rgb(102, 102, 102)">Існує багато варіацій уривків з Lorem Ipsum, але більшість з них зазнала певних змін на кшталт жартівливих вставок або змішування слів, які навіть не виглядають правдоподібно. Якщо ви збираєтесь використовувати Lorem Ipsum.</span><br></p></div></div>', 1, 1, 'news2', '[{"collapsed":false,"class":"","style":"","columns":[{"content":"<p><span style=\\"background-color:rgb(255, 255, 255); color:rgb(102, 102, 102)\\">Існує багато варіацій уривків з Lorem Ipsum, але більшість з них зазнала певних змін на кшталт жартівливих вставок або змішування слів, які навіть не виглядають правдоподібно. Якщо ви збираєтесь використовувати Lorem Ipsum.</span><br></p>","large":"6","medium":"6","small":"6","hideSmall":"0","hideMedium":"0","hideLarge":"0"},{"content":"<p><span style=\\"background-color:rgb(255, 255, 255); color:rgb(102, 102, 102)\\">Існує багато варіацій уривків з Lorem Ipsum, але більшість з них зазнала певних змін на кшталт жартівливих вставок або змішування слів, які навіть не виглядають правдоподібно. Якщо ви збираєтесь використовувати Lorem Ipsum.</span><br></p>","large":"6","medium":"6","small":"6","hideSmall":"0","hideMedium":"0","hideLarge":"0"}]},{"collapsed":false,"class":"","style":"","columns":[{"content":"<p><span style=\\"background-color:rgb(255, 255, 255); color:rgb(102, 102, 102)\\">Існує багато варіацій уривків з Lorem Ipsum, але більшість з них зазнала певних змін на кшталт жартівливих вставок або змішування слів, які навіть не виглядають правдоподібно. Якщо ви збираєтесь використовувати Lorem Ipsum.</span><br></p>","large":"12","medium":"12","small":"12","hideSmall":"0","hideMedium":"0","hideLarge":"0"}]}]', '2014-10-14 01:50:31');

-- --------------------------------------------------------

--
-- Структура таблицы `post_club`
--

CREATE TABLE IF NOT EXISTS `post_club` (
  `post_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`club_id`),
  KEY `IDX_71BB5F794B89032C` (`post_id`),
  KEY `IDX_71BB5F7961190A32` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `post_club`
--

INSERT INTO `post_club` (`post_id`, `club_id`) VALUES
(1, 3),
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 4),
(5, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `post_translations`
--

CREATE TABLE IF NOT EXISTS `post_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  KEY `IDX_6D8AA754232D562B` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=57 ;

--
-- Дамп данных таблицы `post_translations`
--

INSERT INTO `post_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(15, 1, 'News 1', 'en', 'title'),
(16, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'en', 'description'),
(17, 1, '<p>News 1</p>', 'en', 'content'),
(18, 1, 'Новина 1', 'uk', 'title'),
(19, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'uk', 'description'),
(20, 1, '<p>Новина 1</p>', 'uk', 'content'),
(21, 1, 'Новость 1', 'ru', 'title'),
(22, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'ru', 'description'),
(23, 1, '<p>Новость 1</p>', 'ru', 'content'),
(36, 2, 'News 2', 'en', 'title'),
(37, 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', 'en', 'description'),
(38, 2, '<p>News 2</p>', 'en', 'content'),
(39, 2, 'Новость 2', 'ru', 'title'),
(40, 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', 'ru', 'description'),
(41, 2, '<p>Новость 2</p>', 'ru', 'content'),
(42, 3, 'News 3', 'en', 'title'),
(43, 3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', 'en', 'description'),
(44, 3, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.</p>', 'en', 'content'),
(45, 3, 'Новость 3', 'ru', 'title'),
(46, 3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', 'ru', 'description'),
(47, 3, '<div class="row "><div class="columns large-12 medium-12 small-12"><p>asdfasdfsdf</p></div></div>', 'ru', 'content'),
(48, 4, 'Новина4', 'en', 'title'),
(49, 4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', 'en', 'description'),
(50, 4, 'Новина4', 'ru', 'title'),
(51, 4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', 'ru', 'description'),
(52, 3, '[{"collapsed":false,"columns":[{"content":"<p>asdfasdfsdf</p>","large":"12","medium":"12","small":"12"}]}]', 'ru', 'content_code'),
(53, 5, 'Піврічні абонементи! Акція діє до 30 серпня!', 'ru', 'title'),
(54, 5, 'Існує багато варіацій уривків з Lorem Ipsum, але більшість з них зазнала певних змін на кшталт жартівливих вставок або змішування слів, які навіть не виглядають правдоподібно. Якщо ви збираєтесь використовувати Lorem Ipsum.', 'ru', 'description'),
(55, 5, '[{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>Існує багато варіацій уривків з Lorem Ipsum, але більшість з них зазнала певних змін на кшталт жартівливих вставок або змішування слів, які навіть не виглядають правдоподібно. Якщо ви збираєтесь використовувати Lorem Ipsum.<br></p>","large":"12","medium":"12","small":"12","hideSmall":"0","hideMedium":"0","hideLarge":"0"}]}]', 'ru', 'content_code'),
(56, 5, '<div class="row  " ><div class="columns large-12 medium-12 small-12"><p>Існує багато варіацій уривків з Lorem Ipsum, але більшість з них зазнала певних змін на кшталт жартівливих вставок або змішування слів, які навіть не виглядають правдоподібно. Якщо ви збираєтесь використовувати Lorem Ipsum.<br></p></div></div>', 'ru', 'content');

-- --------------------------------------------------------

--
-- Структура таблицы `program`
--

CREATE TABLE IF NOT EXISTS `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `sort` int(11) NOT NULL,
  `content_code` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `program`
--

INSERT INTO `program` (`id`, `name`, `description`, `image`, `active`, `content`, `sort`, `content_code`) VALUES
(1, 'Пілатес', 'Пілатес', '/uploads\\DSC_1455.JPG', 1, '<div class="row "><div class="columns large-4 medium-4 small-4"><p>asdfasdf</p></div><div class="columns large-4 medium-4 small-4"><p>asdfasdf</p></div><div class="columns large-4 medium-4 small-4"><p>asdf</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>asdf</p></div></div>', 1, '[{"collapsed":false,"columns":[{"content":"<p>asdfasdf</p>","large":"4","medium":"4","small":"4"},{"content":"<p>asdfasdf</p>","large":"4","medium":"4","small":"4"},{"content":"<p>asdf</p>","large":"4","medium":"4","small":"4"}]},{"collapsed":false,"columns":[{"content":"<p>asdf</p>","large":"12","medium":"12","small":"12"}]}]'),
(2, 'Стриппластика', 'Стриппластика', '/uploads\\DSC_4434.JPG', 1, '<p>Стриппластика</p>', 4, NULL),
(3, 'Strech + ABC', 'Strech + ABC', '/uploads\\x_10fb3106.jpg', 1, '<p>Strech + ABC</p>', 3, NULL),
(4, 'Zumba', 'Zumba', '/uploads\\images.jpg', 1, '<p>Zumba</p>', 5, NULL),
(5, 'Jumping', 'Jumping', '/uploads\\kiwifitness-lvov3.jpg', 1, '<p>Jumping</p>', 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `program_translations`
--

CREATE TABLE IF NOT EXISTS `program_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  KEY `IDX_851229A0232D562B` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `program_translations`
--

INSERT INTO `program_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Пілатес', 'ru', 'name'),
(2, 1, '<div class="row "><div class="columns large-12 medium-12 small-12"><p>sdfsadfasdf</p></div></div><div class="row "><div class="columns large-12 medium-12 small-12"><p>asdfasdf</p></div></div><div class="row "><div class="columns large-12 medium-12 small-1', 'ru', 'content'),
(3, 1, 'Пілатес', 'ru', 'description'),
(4, 2, 'Стриппластика', 'ru', 'name'),
(5, 2, 'Стриппластика', 'ru', 'description'),
(6, 2, '<p>Стриппластика</p>', 'ru', 'content'),
(7, 3, 'Strech + ABC', 'ru', 'name'),
(8, 3, 'Strech + ABC', 'ru', 'description'),
(9, 3, '<p>Strech + ABC</p>', 'ru', 'content'),
(10, 4, 'Zumba', 'ru', 'name'),
(11, 4, 'Zumba', 'ru', 'description'),
(12, 4, '<p>Zumba</p>', 'ru', 'content'),
(13, 5, 'Jumping', 'ru', 'name'),
(14, 5, 'Jumping', 'ru', 'description'),
(15, 5, '<p>Jumping</p>', 'ru', 'content'),
(16, 1, '[{"collapsed":false,"columns":[{"content":"<p>sdfsadfasdf</p>","large":"12","medium":"12","small":"12"}]},{"collapsed":false,"columns":[{"content":"<p>asdfasdf</p>","large":"12","medium":"12","small":"12"}]},{"collapsed":false,"columns":[{"content":"<p>as', 'ru', 'content_code');

-- --------------------------------------------------------

--
-- Структура таблицы `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) DEFAULT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8F56515861190A32` (`club_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `salle`
--

INSERT INTO `salle` (`id`, `club_id`, `name`, `active`, `sort`) VALUES
(1, 2, 'Зал 1', NULL, 1),
(2, 2, 'Зал 2', NULL, 3),
(3, 2, 'Зал 3', NULL, 2),
(4, 3, '1 Зал', NULL, 1),
(5, 3, '2 Зал', NULL, 2),
(6, 3, '3 Зал', NULL, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `salle_translations`
--

CREATE TABLE IF NOT EXISTS `salle_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  KEY `IDX_B2F8B78A232D562B` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `salle_translations`
--

INSERT INTO `salle_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Зал 1', 'ru', 'name'),
(2, 2, 'Зал 1', 'ru', 'name'),
(3, 3, 'Зал 3', 'ru', 'name'),
(4, 4, '1 Зал', 'ru', 'name'),
(5, 5, '2 Зал', 'ru', 'name'),
(6, 6, '3 Зал', 'ru', 'name');

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salle_id` int(11) DEFAULT NULL,
  `monday_id` int(11) DEFAULT NULL,
  `tuesday_id` int(11) DEFAULT NULL,
  `wednesday_id` int(11) DEFAULT NULL,
  `thursday_id` int(11) DEFAULT NULL,
  `friday_id` int(11) DEFAULT NULL,
  `saturday_id` int(11) DEFAULT NULL,
  `sunday_id` int(11) DEFAULT NULL,
  `hour` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A34E73ADDC304035` (`salle_id`),
  KEY `IDX_A34E73AD21671777` (`monday_id`),
  KEY `IDX_A34E73AD5B974FE2` (`tuesday_id`),
  KEY `IDX_A34E73ADBBA2EEBE` (`wednesday_id`),
  KEY `IDX_A34E73ADD68DEE5D` (`thursday_id`),
  KEY `IDX_A34E73AD812B93DE` (`friday_id`),
  KEY `IDX_A34E73ADB86AC6FA` (`saturday_id`),
  KEY `IDX_A34E73ADA81EA377` (`sunday_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=112 ;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`id`, `salle_id`, `monday_id`, `tuesday_id`, `wednesday_id`, `thursday_id`, `friday_id`, `saturday_id`, `sunday_id`, `hour`) VALUES
(67, 1, 3, 5, 2, 3, 3, 3, NULL, '08-00'),
(68, 1, 2, 3, 4, 2, 3, 3, 3, '10-00'),
(69, 1, 2, 5, 2, 3, 2, 3, 2, '12-00'),
(70, 1, 5, 3, 5, 2, 5, 3, 2, '14-00'),
(71, 1, 2, 3, 3, 2, 3, 3, 3, '18-00'),
(72, 1, 4, 3, 4, 4, 3, 2, 2, '20-00'),
(93, 2, 5, 3, 3, NULL, 3, NULL, NULL, '08-00'),
(94, 2, NULL, 5, NULL, 2, NULL, 3, NULL, '10-00'),
(95, 2, 2, 2, 4, 4, 3, 4, 3, '12-00'),
(96, 2, 2, 5, 2, 3, 2, 3, 4, '14-00'),
(97, 2, 4, 3, 3, 2, 5, 3, 2, '16-00'),
(98, 2, 4, 3, 3, 2, 3, 3, 3, '18-00'),
(99, 2, 4, 3, 4, 4, 3, 2, 2, '20-00'),
(106, 3, NULL, 2, NULL, 3, NULL, 3, NULL, '08-00'),
(107, 3, 4, 3, 4, 4, 3, 4, 3, '09-30'),
(108, 3, 4, 2, 3, 3, 2, 3, 4, '12-00'),
(109, 3, 3, 3, 3, 4, 5, 3, 2, '14-00'),
(110, 3, 3, 3, 3, 2, 3, 3, 3, '18-00'),
(111, 3, 3, 3, 4, 4, 3, 2, 2, '20-00');

-- --------------------------------------------------------

--
-- Структура таблицы `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `section`
--

INSERT INTO `section` (`id`, `name`) VALUES
(1, 'Головна'),
(2, 'Клуби'),
(3, 'Магазин'),
(4, 'Ківі ТВ'),
(5, 'Статичні сторінки'),
(6, 'Новини');

-- --------------------------------------------------------

--
-- Структура таблицы `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `image_min` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `slider`
--

INSERT INTO `slider` (`id`, `title`, `description`, `image`, `active`, `sort`, `image_min`) VALUES
(1, 'Slider 1', '<div class="orbit-caption">\r\n<div class="row">\r\n<div class="columns large-12">\r\n<h6><span class="white-salad-txt">НОВЕ ТІЛО<br /> ЗА 8 ТИЖНІВ!</span><br /> Початок 1 серпня!</h6>\r\n<div class="big-txt">\r\n<p>Бажаєте схуднути та виглядати неперевершено вже цього літа? Саме для Вас Ківі Фітнес впроваджує унікальну програму &laquo;Нове тіло за 8 тижнів!&raquo;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', '/uploads\\slider\\home-slider-s1.jpg', 1, 2, '/uploads\\slider\\home-slider-s1.jpg'),
(2, 'Slider 2', '<div class="orbit-caption">\r\n<div class="row">\r\n<div class="columns large-12">\r\n<h6><span class="green-salad-txt">НОВЕ ТІЛО<br /> ЗА 8 ТИЖНІВ!</span><br /> Початок 1 серпня!</h6>\r\n<div class="big-txt">\r\n<p>Бажаєте схуднути та виглядати неперевершено вже цього літа? Саме для Вас Ківі Фітнес впроваджує унікальну програму &laquo;Нове тіло за 8 тижнів!&raquo;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', '/uploads\\slider\\home-slider-s2.jpg', 1, 3, '/uploads\\slider\\home-slider-s2.jpg'),
(3, 'Slider 3', '<div class="orbit-caption">\r\n<div class="row">\r\n<div class="columns large-12">\r\n<h6><span class="green-salad-txt">НОВЕ ТІЛО<br /> ЗА 8 ТИЖНІВ!</span><br /> Початок 1 серпня!</h6>\r\n<div class="big-txt">\r\n<p>Бажаєте схуднути та виглядати неперевершено вже цього літа? Саме для Вас Ківі Фітнес впроваджує унікальну програму &laquo;Нове тіло за 8 тижнів!</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', '/uploads\\slider\\home-slider-s2.jpg', 1, 1, '/uploads\\slider\\home-slider-s2.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `slider_translations`
--

CREATE TABLE IF NOT EXISTS `slider_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  KEY `IDX_ECA13F55232D562B` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `slider_translations`
--

INSERT INTO `slider_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Slider 1', 'ru', 'title'),
(2, 1, '<div class="orbit-caption">\r\n<div class="row">\r\n<div class="columns large-12">\r\n<h6><span class="green-salad-txt">НОВЕ ТІЛО<br /> ЗА 8 ТИЖНІВ!</span><br /> Початок 1 серпня!</h6>\r\n<div class="big-txt">\r\n<p>&nbsp;</p>\r\n</div>\r\n', 'ru', 'description'),
(3, 2, 'Slider 2', 'ru', 'title'),
(4, 2, '<div class="orbit-caption">\r\n<div class="row">\r\n<div class="columns large-12">\r\n<h6><span class="green-salad-txt">НОВЕ ТІЛО<br /> ЗА 8 ТИЖНІВ!</span><br /> Початок 1 серпня!</h6>\r\n</div>\r\n</div>\r\n</div>', 'ru', 'description'),
(5, 3, 'Slider 3', 'ru', 'title'),
(6, 3, '<div class="orbit-caption">\r\n<div class="row">\r\n<div class="columns large-12">\r\n<h6><span class="green-salad-txt">НОВЕ ТІЛО<br /> ЗА 8 ТИЖНІВ!</span><br /> Початок 1 серпня!</h6>\r\n<div class="big-txt">\r\n<p>Бажаєте сх<', 'ru', 'description');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `banner_section`
--
ALTER TABLE `banner_section`
  ADD CONSTRAINT `FK_792E532C684EC833` FOREIGN KEY (`banner_id`) REFERENCES `banner` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_792E532CD823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `banner_translations`
--
ALTER TABLE `banner_translations`
  ADD CONSTRAINT `FK_F8B8D8B232D562B` FOREIGN KEY (`object_id`) REFERENCES `banner` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `city_translations`
--
ALTER TABLE `city_translations`
  ADD CONSTRAINT `FK_562B7308232D562B` FOREIGN KEY (`object_id`) REFERENCES `city` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `FK_18DC974C8BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Ограничения внешнего ключа таблицы `club_translations`
--
ALTER TABLE `club_translations`
  ADD CONSTRAINT `FK_BC037277232D562B` FOREIGN KEY (`object_id`) REFERENCES `club` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `command_translations`
--
ALTER TABLE `command_translations`
  ADD CONSTRAINT `FK_ECDD6611232D562B` FOREIGN KEY (`object_id`) REFERENCES `command` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `FK_B438191E727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `page` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `FK_78AB76C9232D562B` FOREIGN KEY (`object_id`) REFERENCES `page` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `program_translations`
--
ALTER TABLE `program_translations`
  ADD CONSTRAINT `FK_851229A0232D562B` FOREIGN KEY (`object_id`) REFERENCES `program` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `FK_8F56515861190A32` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`);

--
-- Ограничения внешнего ключа таблицы `salle_translations`
--
ALTER TABLE `salle_translations`
  ADD CONSTRAINT `FK_B2F8B78A232D562B` FOREIGN KEY (`object_id`) REFERENCES `salle` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `FK_A34E73AD21671777` FOREIGN KEY (`monday_id`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `FK_A34E73AD5B974FE2` FOREIGN KEY (`tuesday_id`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `FK_A34E73AD812B93DE` FOREIGN KEY (`friday_id`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `FK_A34E73ADA81EA377` FOREIGN KEY (`sunday_id`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `FK_A34E73ADB86AC6FA` FOREIGN KEY (`saturday_id`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `FK_A34E73ADBBA2EEBE` FOREIGN KEY (`wednesday_id`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `FK_A34E73ADD68DEE5D` FOREIGN KEY (`thursday_id`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `FK_A34E73ADDC304035` FOREIGN KEY (`salle_id`) REFERENCES `salle` (`id`);

--
-- Ограничения внешнего ключа таблицы `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD CONSTRAINT `FK_ECA13F55232D562B` FOREIGN KEY (`object_id`) REFERENCES `slider` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
