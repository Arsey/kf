-- phpMyAdmin SQL Dump
-- version 4.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 12, 2014 at 06:16 PM
-- Server version: 5.5.38
-- PHP Version: 5.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kiwifitness`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(1, 'Категорія 1', 'Категорія 1'),
(2, 'Категорія 2', 'Категорія 2'),
(3, 'Категроія 3', 'Категроія 3');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'Львів'),
(2, 'Київ'),
(3, 'Харків');

-- --------------------------------------------------------

--
-- Table structure for table `city_translations`
--

CREATE TABLE IF NOT EXISTS `city_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `city_translations`
--

INSERT INTO `city_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Львов', 'ru', 'name'),
(2, 2, 'Киев', 'ru', 'name'),
(3, 3, 'Харьков', 'ru', 'name');

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE IF NOT EXISTS `club` (
`id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`id`, `city_id`, `name`, `phone`, `active`, `sort`, `content`) VALUES
(2, 1, 'C. Бандери 18', '+380 32 261 35 73', 1, 0, NULL),
(3, 1, 'Масарика 2', '+380 32  240 74 77', 1, 0, NULL),
(4, 1, 'Наукова 43б', '+380 32 240 97 65', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `club_translations`
--

CREATE TABLE IF NOT EXISTS `club_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `club_translations`
--

INSERT INTO `club_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 2, 'C. Бандеры 18', 'ru', 'name'),
(2, 3, 'Масарика 2', 'ru', 'name'),
(3, 4, 'Научная 43б', 'ru', 'name');

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE IF NOT EXISTS `command` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `command`
--

INSERT INTO `command` (`id`, `name`, `type`, `image`, `active`, `content`) VALUES
(1, 'Катерина Цьовх', 1, '/uploads\\12_1.jpg', 1, '<p>Інструктор групових програм та персональний тренер</p>'),
(7, 'Надія Куспись', 1, '/uploads\\25_1.jpg', 1, '<p>Досвідчений інструктор, для якого фітнес - це стиль життя</p>'),
(8, 'Анна Журбенко', 3, '/uploads\\13_1.jpg', 1, '<p>Леді Елегантність та Стиль - цю номінацію Анюта беззаперечно завоювала б на будь-якому конкурсі краси. Різні за характером та цікаві за хореографією танцювальні композиції, яких ви легко навчитесь на її тренуваннях, допоможуть стати королевою данс-полу, а при бажанні - підкорити серце будь-якого мужчини!</p>');

-- --------------------------------------------------------

--
-- Table structure for table `command_translations`
--

CREATE TABLE IF NOT EXISTS `command_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `command_translations`
--

INSERT INTO `command_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Катерина Цьовх', 'ru', 'name'),
(2, 1, '<p>Інструктор групових програм та персональний тренер</p>', 'ru', 'content'),
(8, 7, 'Надія Куспись', 'ru', 'name'),
(9, 7, '<p>Досвідчений інструктор, для якого фітнес - це стиль життя!</p>', 'ru', 'content'),
(10, 8, 'Анна Журбенко', 'ru', 'name'),
(11, 8, '<p>Леді Елегантність та Стиль - цю номінацію Анюта беззаперечно завоювала б на будь-якому конкурсі краси. Різні за характером та цікаві за хореографією танцювальні композиції, яких ви легко навчитесь на її тренуваннях, допоможуть стати королевою данс-полу, а при бажанні - підкорити серце будь-якого мужчини!</p>', 'ru', 'content');

-- --------------------------------------------------------

--
-- Table structure for table `comparingcharacteristics`
--

CREATE TABLE IF NOT EXISTS `comparingcharacteristics` (
`id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ext_translations`
--

CREATE TABLE IF NOT EXISTS `ext_translations` (
`id` int(11) NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fos_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_group` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `fos_user_group`
--

INSERT INTO `fos_user_group` (`id`, `name`, `roles`) VALUES
(1, 'Менеджер', 'a:3:{i:0;s:10:"ROLE_ADMIN";i:1;s:9:"ROLE_USER";i:2;s:16:"ROLE_SUPER_ADMIN";}'),
(2, 'Адміністратор', 'a:2:{i:0;s:10:"ROLE_ADMIN";i:1;s:9:"ROLE_USER";}'),
(3, 'Користувач', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `fos_user_user`
--

CREATE TABLE IF NOT EXISTS `fos_user_user` (
`id` int(11) NOT NULL,
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
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fos_user_user`
--

INSERT INTO `fos_user_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`) VALUES
(1, 'admin', 'admin', 'admin@example.com', 'admin@example.com', 1, 'lr4aqouoitcw8c4kosk8ggo8s8s804k', 'P+gCC9r1oYVF0/k/y0/gpnV2PedB8/dhgUsGLu1ZGqb2siYvClDhpbRonyud8k8g9Lhvk4mcdq3Yk53UV4GtRw==', '2014-09-12 10:20:07', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '2014-04-25 10:59:52', '2014-09-12 10:20:07', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fos_user_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
`id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `name`, `city`, `active`, `sort`, `description`, `year`) VALUES
(1, 'ТЦ «Варшавський»', 'Луцьк', 1, 2, 'ФАСАД', '2004'),
(2, 'Lorem ipsum dolor sit amet, consectetur.', 'Україна, м. Рівне', 1, 1, 'Planidel Green Float Emalia Ral 6016  - SunGuan High performance Neutral 60/40', '2012');

-- --------------------------------------------------------

--
-- Table structure for table `galleryphoto`
--

CREATE TABLE IF NOT EXISTS `galleryphoto` (
`id` int(11) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `galleryphoto`
--

INSERT INTO `galleryphoto` (`id`, `gallery_id`, `image`, `sort`) VALUES
(32, 2, 'hz2osi00_1.jpg', 1),
(34, 2, 'hz2osudz_0_80866_8a73a549_orig.jpg', 2),
(35, 2, 'hz2osue0_89965082.jpg', 3),
(36, 2, 'hz2osue1_1289417452_parus-2.jpg', 4),
(37, 1, 'hz2oubyf_2.JPG', 1),
(38, 1, 'hz2oubyg_4.jpg', 2),
(39, 1, 'hz2oubyh_dubai111.jpg', 3),
(40, 1, 'hz2oubyi_rotatingtowerdubaiuae2.jpg', 4),
(42, 2, 'hz5liw2z_download_(1).jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `gallery_translations`
--

CREATE TABLE IF NOT EXISTS `gallery_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `gallery_translations`
--

INSERT INTO `gallery_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Луцьк', 'en', 'city'),
(2, 1, 'ТЦ «Варшавський»', 'en', 'name'),
(3, 1, 'Луцьк', 'ru', 'city'),
(4, 1, 'ТЦ «Варшавський»', 'ru', 'name'),
(5, 2, 'Україна, м. Рівне', 'en', 'city'),
(6, 2, 'Lorem ipsum dolor sit amet, consectetur.', 'en', 'name'),
(7, 2, 'Україна, м. Рівне', 'ru', 'city'),
(8, 2, 'Lorem ipsum dolor sit amet, consectetur.', 'ru', 'name'),
(9, 2, 'test', 'en', 'description'),
(10, 2, 'тест', 'ru', 'description');

-- --------------------------------------------------------

--
-- Table structure for table `groupcommand`
--

CREATE TABLE IF NOT EXISTS `groupcommand` (
`id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`, `logo`) VALUES
(1, 'Tenax', '/uploads\\manufacturer\\tenax.jpg'),
(2, 'Pilkington', '/uploads\\manufacturer\\Pilkington.gif'),
(3, 'Guardien', '/uploads\\manufacturer\\Guardian.gif');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_translations`
--

CREATE TABLE IF NOT EXISTS `manufacturer_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `manufacturer_translations`
--

INSERT INTO `manufacturer_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Англійська', 'en', 'description'),
(2, 1, 'Російська', 'ru', 'description');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
`id` int(11) NOT NULL,
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
  `position` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `parent_id`, `show_in_menu`, `slug`, `created`, `title`, `url`, `meta_keywords`, `meta_description`, `content`, `show_menu`, `active`, `position`) VALUES
(9, NULL, NULL, 'about_us', '2014-05-26 11:34:50', 'Про компанію', NULL, 'Про компанію', 'Про компанію', '<p><strong>BAMBUK&nbsp;</strong>- команда, яка покликана любити те, що вона робить та робити те, що любить - якісно і з душею. Душу вкладає у власний дизайн і прагне повноцінно жити ним. Бо ті, хто є командою "Bambuk", хотіли бути тими, ким вони є і прагнути до того, що їх чекає в майбутньому...</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ПОКЛИКАННЯ</strong>&nbsp;- змінювати світ навколо нас створюючи нове, краще, гарніше і цікавіше. Робити це так, щоб ми самі бачили, як створений дизайн живе навколо нас і людей, для яких ми це робили.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>СПЕЦІАЛІЗАЦІЯ</strong>&nbsp;- річ відносна, тому команда, як мінімум, здатна зробити усе, що представлено у&nbsp;<a href="http://bambus.com.ua/ua/portfolio.html">портфоліо</a>, і кожного разу набагато краще! А все нове - лише надихає до нових вершин.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ПІДХІД</strong>&nbsp;- ще та штука... Навіть якщо спробувати його стандартизувати, він все одно індивідуальний. Бо по обидві сторони працюють не стільки Компанії, скільки Люди, такі ж, як ми з Вами - індивідуальні.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ДОСВІД</strong>&nbsp;- все ж, продовжує приходити... І, можливо, Ви скажете, що не зовсім гарно братись за щось нове, не маючи у тому досвіду, але саме покликання дизайн-студії &laquo;творити нове&raquo; змушує думати не стільки про красу процесу, скільки про досконалість результату.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ЦІНИ</strong>&nbsp;- потрібно обговорювати. Формуються від об&rsquo;єму роботи, який визначається часом затраченим професійним дизайнером на виконання поставленого завдання.</p>', 1, 1, 3),
(10, NULL, NULL, 'glass', '2014-05-26 11:36:34', 'Склопакети', NULL, 'Склопакети', 'Склопакети', '[{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>afafafafafgsdfgsdfg</p>","large":"4","medium":"4","small":"4"},{"content":"<p>afafsdfgsdf<img alt=\\"\\" data-cke-saved-src=\\"http://kiwifitness_dev/uploads/12_1.jpg\\" src=\\"http://kiwifitness_dev/uploads/12_1.jpg\\" style=\\"height:400px; width:265px\\">​</p>","large":"4","medium":"4","small":"4"},{"content":"<p>asdfasdfasdf</p>","large":"4","medium":"4","small":"4"}]},{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>afafgsdfgsdfasdfasdf</p>","large":"4","medium":"4","small":"4"},{"content":"<p>afafgsdfgsdfgasdfasdf</p>","large":"4","medium":"4","small":"4"},{"content":"<p>asdfasdfasdf</p>","large":"4","medium":"4","small":"4"}]},{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>afxfzvxcvzxcvgsdfgsdf</p>","large":"4","medium":"4","small":"4"},{"content":"<p>sfdgsdf</p>","large":"4","medium":"4","small":"4"},{"content":"<p>asdfasdf</p>","large":"4","medium":"4","small":"4"}]},{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>zxcvzxcvzxcv</p>","large":"2","medium":"2","small":"2"},{"content":"<p>sdfgsdfg</p>","large":"2","medium":"2","small":"2"},{"content":"<p>sdfgsdfg</p>","large":"2","medium":"2","small":"2"},{"content":"<p>sdfgsdfg</p>","large":"2","medium":"2","small":"2"},{"content":"<p>asdfasdf</p>","large":"2","medium":"2","small":"2"}]},{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>Роман</p>","large":"12","medium":"12","small":"12"}]}]', 1, 1, 1),
(12, NULL, NULL, 'info', '2014-05-26 11:51:47', 'Інформація', NULL, 'Інформація', 'Інформація', '<p>Інформація</p>', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE IF NOT EXISTS `page_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Dumping data for table `page_translations`
--

INSERT INTO `page_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(5, 9, 'About Company', 'en', 'title'),
(7, 9, 'About Company', 'en', 'meta_keywords'),
(8, 9, 'About Company', 'en', 'meta_description'),
(10, 9, 'О компании', 'ru', 'title'),
(12, 9, 'О компании', 'ru', 'meta_keywords'),
(13, 9, 'О компании', 'ru', 'meta_description'),
(15, 10, 'Склопакети', 'en', 'title'),
(17, 10, 'Склопакети', 'en', 'meta_keywords'),
(18, 10, 'Склопакети', 'en', 'meta_description'),
(20, 10, 'Склопакети', 'ru', 'title'),
(22, 10, 'Склопакети', 'ru', 'meta_keywords'),
(23, 10, 'Склопакети', 'ru', 'meta_description'),
(25, 12, 'Інформація', 'en', 'title'),
(26, 12, 'Інформація', 'en', 'meta_keywords'),
(27, 12, 'Інформація', 'en', 'meta_description'),
(29, 12, 'Інформація', 'ru', 'title'),
(30, 12, 'Інформація', 'ru', 'meta_keywords'),
(31, 12, 'Інформація', 'ru', 'meta_description'),
(33, 10, '[{"collapsed":false,"class":"","style":"","columns":[{"content":"<p>sdfgsfgsfg</p>","large":"6","medium":"6","small":"6"},{"content":"<p>sdfgsdfgsdfg</p>","large":"6","medium":"6","small":"6"}]}]', 'ru', 'content');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
`id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `sort`, `description`, `image`, `content`, `active`, `type`, `slug`) VALUES
(1, 'Новина 1', 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '/uploads\\download.jpg', '<p>Новина 1</p>', 1, 2, 'news1'),
(2, 'Новина 2', 3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', '/uploads\\download (1).jpg', '<p>Новина 2</p>', 1, 2, 'news2'),
(3, 'Новина 3', 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', '/uploads\\gallery\\hz2oubyf_2.JPG', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.</p>', 1, 1, 'news3'),
(4, 'Новина4', 4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', '/uploads\\gallery\\hz2osudz_0_80866_8a73a549_orig.jpg', NULL, 1, 1, 'news4');

-- --------------------------------------------------------

--
-- Table structure for table `post_club`
--

CREATE TABLE IF NOT EXISTS `post_club` (
  `post_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_club`
--

INSERT INTO `post_club` (`post_id`, `club_id`) VALUES
(3, 2),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE IF NOT EXISTS `post_tags` (
  `post_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tags_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `post_translations`
--

CREATE TABLE IF NOT EXISTS `post_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

--
-- Dumping data for table `post_translations`
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
(47, 3, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.</p>', 'ru', 'content'),
(48, 4, 'Новина4', 'en', 'title'),
(49, 4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', 'en', 'description'),
(50, 4, 'Новина4', 'ru', 'title'),
(51, 4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis earum sed odio adipisci quaerat ad, quos eveniet, laborum necessitatibus aspernatur molestiae modi nulla beatae expedita harum ex perspiciatis soluta hic.', 'ru', 'description');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `sort` int(11) NOT NULL,
  `manufacturer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `active`, `content`, `sort`, `manufacturer_id`) VALUES
(2, 'Продукт 2', 'Продукт 2', 1, '<p>Продукт 2</p>', 2, 2),
(5, 'Продукт 1', 'Продукт 1', 1, '<p>Продукт 1</p>', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productphoto`
--

CREATE TABLE IF NOT EXISTS `productphoto` (
`id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=150 ;

--
-- Dumping data for table `productphoto`
--

INSERT INTO `productphoto` (`id`, `product_id`, `type`, `image`, `sort`, `title`) VALUES
(138, 5, 1, 'hz5kyf4n_s-line.png', 1, NULL),
(148, 5, 1, 'hz5lz0e6_dubai111.jpg', 2, NULL),
(149, 5, 1, 'hz5lz0e7_rotatingtowerdubaiuae2.jpg', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productphoto_translations`
--

CREATE TABLE IF NOT EXISTS `productphoto_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `productphoto_translations`
--

INSERT INTO `productphoto_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(5, NULL, 'asd', 'en', 'title'),
(6, NULL, 'asdas', 'ru', 'title');

-- --------------------------------------------------------

--
-- Table structure for table `product_manufacturer`
--

CREATE TABLE IF NOT EXISTS `product_manufacturer` (
  `product_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE IF NOT EXISTS `product_tags` (
  `product_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`product_id`, `tags_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(5, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE IF NOT EXISTS `product_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, NULL, 'Продукт 1', 'en', 'description'),
(2, NULL, '<p>Продукт 1</p>', 'en', 'content'),
(3, NULL, 'Продукт 1', 'ru', 'description'),
(4, NULL, '<p>Продукт 1</p>', 'ru', 'content'),
(5, NULL, 'Продукт 2', 'en', 'description'),
(6, NULL, '<p>Продукт 2</p>', 'en', 'content'),
(7, NULL, 'Продукт 2', 'ru', 'description'),
(8, NULL, '<p>Продукт 2</p>', 'ru', 'content'),
(9, NULL, 'Продукт3', 'en', 'description'),
(10, NULL, '<p>Продукт3</p>', 'en', 'content'),
(11, NULL, 'Продукт3', 'ru', 'description'),
(12, NULL, '<p>Продукт3</p>', 'ru', 'content'),
(13, NULL, 'Продукт 4', 'en', 'description'),
(14, NULL, '<p>Продукт 4</p>', 'en', 'content'),
(15, NULL, 'Продукт 4', 'ru', 'description'),
(16, NULL, '<p>Продукт 4</p>', 'ru', 'content'),
(21, 5, 'Продукт 1', 'en', 'description'),
(22, 5, '<p>Продукт 1</p>', 'en', 'content'),
(23, 5, 'Продукт 1', 'ru', 'description'),
(24, 5, '<p>Продукт 1</p>', 'ru', 'content');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE IF NOT EXISTS `program` (
`id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`id`, `name`, `description`, `image`, `active`, `content`, `sort`) VALUES
(1, 'Пілатес', 'Пілатес', '/uploads\\DSC_1455.JPG', 1, '<p>Пілатес</p>', 1),
(2, 'Стриппластика', 'Стриппластика', '/uploads\\DSC_4434.JPG', 1, '<p>Стриппластика</p>', 4),
(3, 'Strech + ABC', 'Strech + ABC', '/uploads\\x_10fb3106.jpg', 1, '<p>Strech + ABC</p>', 3),
(4, 'Zumba', 'Zumba', '/uploads\\images.jpg', 1, '<p>Zumba</p>', 5),
(5, 'Jumping', 'Jumping', '/uploads\\kiwifitness-lvov3.jpg', 1, '<p>Jumping</p>', 2);

-- --------------------------------------------------------

--
-- Table structure for table `program_translations`
--

CREATE TABLE IF NOT EXISTS `program_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `program_translations`
--

INSERT INTO `program_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Пілатес', 'ru', 'name'),
(2, 1, '<p>Пілатес</p>', 'ru', 'content'),
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
(15, 5, '<p>Jumping</p>', 'ru', 'content');

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
`id` int(11) NOT NULL,
  `club_id` int(11) DEFAULT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `salle`
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
-- Table structure for table `salle_translations`
--

CREATE TABLE IF NOT EXISTS `salle_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `salle_translations`
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
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
`id` int(11) NOT NULL,
  `salle_id` int(11) DEFAULT NULL,
  `monday_id` int(11) DEFAULT NULL,
  `tuesday_id` int(11) DEFAULT NULL,
  `wednesday_id` int(11) DEFAULT NULL,
  `thursday_id` int(11) DEFAULT NULL,
  `friday_id` int(11) DEFAULT NULL,
  `saturday_id` int(11) DEFAULT NULL,
  `sunday_id` int(11) DEFAULT NULL,
  `hour` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=33 ;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `salle_id`, `monday_id`, `tuesday_id`, `wednesday_id`, `thursday_id`, `friday_id`, `saturday_id`, `sunday_id`, `hour`) VALUES
(14, 3, 3, 2, NULL, NULL, NULL, NULL, NULL, '123'),
(15, 3, 3, NULL, 3, 3, NULL, 3, 2, '23'),
(16, 3, 4, NULL, NULL, 2, 3, NULL, 4, '10'),
(17, 3, 2, 3, 3, 4, 4, 4, 2, '23'),
(18, 3, 3, 2, NULL, NULL, 3, NULL, 2, '9:00'),
(30, 2, NULL, NULL, NULL, 5, NULL, NULL, NULL, 'asd'),
(31, 2, NULL, NULL, 5, NULL, NULL, NULL, NULL, 'sad'),
(32, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'sda');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'Захист від холоду'),
(2, 'Захист від сонця'),
(3, 'Безпечне скло'),
(4, 'Захист від шуму');

-- --------------------------------------------------------

--
-- Table structure for table `tags_translations`
--

CREATE TABLE IF NOT EXISTS `tags_translations` (
`id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tags_translations`
--

INSERT INTO `tags_translations` (`id`, `object_id`, `content`, `locale`, `field`) VALUES
(1, 1, 'Zahust vid cholod', 'en', 'name'),
(2, 1, 'Захист від холоду', 'ru', 'name'),
(3, 2, 'Захист від сонця', 'en', 'name'),
(4, 2, 'Захист від сонця', 'ru', 'name'),
(5, 3, 'Безпечне скло', 'en', 'name'),
(6, 3, 'Безпечне скло', 'ru', 'name'),
(7, 4, 'Захист від шуму', 'en', 'name'),
(8, 4, 'Захист від шуму', 'ru', 'name');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_translations`
--
ALTER TABLE `city_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_562B7308232D562B` (`object_id`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_18DC974C8BAC62AF` (`city_id`);

--
-- Indexes for table `club_translations`
--
ALTER TABLE `club_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_BC037277232D562B` (`object_id`);

--
-- Indexes for table `command`
--
ALTER TABLE `command`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `command_translations`
--
ALTER TABLE `command_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_ECDD6611232D562B` (`object_id`);

--
-- Indexes for table `comparingcharacteristics`
--
ALTER TABLE `comparingcharacteristics`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ext_translations`
--
ALTER TABLE `ext_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_class`,`field`,`foreign_key`), ADD KEY `translations_lookup_idx` (`locale`,`object_class`,`foreign_key`);

--
-- Indexes for table `fos_user_group`
--
ALTER TABLE `fos_user_group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`);

--
-- Indexes for table `fos_user_user`
--
ALTER TABLE `fos_user_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`), ADD UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`);

--
-- Indexes for table `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
 ADD PRIMARY KEY (`user_id`,`group_id`), ADD KEY `IDX_B3C77447A76ED395` (`user_id`), ADD KEY `IDX_B3C77447FE54D947` (`group_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleryphoto`
--
ALTER TABLE `galleryphoto`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_37D28734E7AF8F` (`gallery_id`);

--
-- Indexes for table `gallery_translations`
--
ALTER TABLE `gallery_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_5A57D067232D562B` (`object_id`);

--
-- Indexes for table `groupcommand`
--
ALTER TABLE `groupcommand`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturer_translations`
--
ALTER TABLE `manufacturer_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_77BCE4B7232D562B` (`object_id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_140AB620727ACA70` (`parent_id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_78AB76C9232D562B` (`object_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_club`
--
ALTER TABLE `post_club`
 ADD PRIMARY KEY (`post_id`,`club_id`), ADD KEY `IDX_71BB5F794B89032C` (`post_id`), ADD KEY `IDX_71BB5F7961190A32` (`club_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
 ADD PRIMARY KEY (`post_id`,`tags_id`), ADD KEY `IDX_A6E9F32D4B89032C` (`post_id`), ADD KEY `IDX_A6E9F32D8D7B4FB4` (`tags_id`);

--
-- Indexes for table `post_translations`
--
ALTER TABLE `post_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_6D8AA754232D562B` (`object_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_1CF73D31A23B42D` (`manufacturer_id`);

--
-- Indexes for table `productphoto`
--
ALTER TABLE `productphoto`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_1D8A225E4584665A` (`product_id`);

--
-- Indexes for table `productphoto_translations`
--
ALTER TABLE `productphoto_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_31FC5727232D562B` (`object_id`);

--
-- Indexes for table `product_manufacturer`
--
ALTER TABLE `product_manufacturer`
 ADD PRIMARY KEY (`product_id`,`manufacturer_id`), ADD KEY `IDX_B0AEC4B74584665A` (`product_id`), ADD KEY `IDX_B0AEC4B7A23B42D` (`manufacturer_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
 ADD PRIMARY KEY (`product_id`,`tags_id`), ADD KEY `IDX_E254B6874584665A` (`product_id`), ADD KEY `IDX_E254B6878D7B4FB4` (`tags_id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_4B13F8EC232D562B` (`object_id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_translations`
--
ALTER TABLE `program_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_851229A0232D562B` (`object_id`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_8F56515861190A32` (`club_id`);

--
-- Indexes for table `salle_translations`
--
ALTER TABLE `salle_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_B2F8B78A232D562B` (`object_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_A34E73ADDC304035` (`salle_id`), ADD KEY `IDX_A34E73AD21671777` (`monday_id`), ADD KEY `IDX_A34E73AD5B974FE2` (`tuesday_id`), ADD KEY `IDX_A34E73ADBBA2EEBE` (`wednesday_id`), ADD KEY `IDX_A34E73ADD68DEE5D` (`thursday_id`), ADD KEY `IDX_A34E73AD812B93DE` (`friday_id`), ADD KEY `IDX_A34E73ADB86AC6FA` (`saturday_id`), ADD KEY `IDX_A34E73ADA81EA377` (`sunday_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags_translations`
--
ALTER TABLE `tags_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_id`,`field`), ADD KEY `IDX_95D326DC232D562B` (`object_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `city_translations`
--
ALTER TABLE `city_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `club_translations`
--
ALTER TABLE `club_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `command`
--
ALTER TABLE `command`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `command_translations`
--
ALTER TABLE `command_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `comparingcharacteristics`
--
ALTER TABLE `comparingcharacteristics`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ext_translations`
--
ALTER TABLE `ext_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fos_user_group`
--
ALTER TABLE `fos_user_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fos_user_user`
--
ALTER TABLE `fos_user_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `galleryphoto`
--
ALTER TABLE `galleryphoto`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `gallery_translations`
--
ALTER TABLE `gallery_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `groupcommand`
--
ALTER TABLE `groupcommand`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `manufacturer_translations`
--
ALTER TABLE `manufacturer_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `post_translations`
--
ALTER TABLE `post_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `productphoto`
--
ALTER TABLE `productphoto`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=150;
--
-- AUTO_INCREMENT for table `productphoto_translations`
--
ALTER TABLE `productphoto_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `program_translations`
--
ALTER TABLE `program_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `salle_translations`
--
ALTER TABLE `salle_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tags_translations`
--
ALTER TABLE `tags_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `city_translations`
--
ALTER TABLE `city_translations`
ADD CONSTRAINT `FK_562B7308232D562B` FOREIGN KEY (`object_id`) REFERENCES `city` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `club`
--
ALTER TABLE `club`
ADD CONSTRAINT `FK_18DC974C8BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `club_translations`
--
ALTER TABLE `club_translations`
ADD CONSTRAINT `FK_BC037277232D562B` FOREIGN KEY (`object_id`) REFERENCES `club` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `command_translations`
--
ALTER TABLE `command_translations`
ADD CONSTRAINT `FK_ECDD6611232D562B` FOREIGN KEY (`object_id`) REFERENCES `command` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `galleryphoto`
--
ALTER TABLE `galleryphoto`
ADD CONSTRAINT `FK_37D28734E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`);

--
-- Constraints for table `gallery_translations`
--
ALTER TABLE `gallery_translations`
ADD CONSTRAINT `FK_5A57D067232D562B` FOREIGN KEY (`object_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page`
--
ALTER TABLE `page`
ADD CONSTRAINT `FK_B438191E727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `page` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
ADD CONSTRAINT `FK_78AB76C9232D562B` FOREIGN KEY (`object_id`) REFERENCES `page` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_club`
--
ALTER TABLE `post_club`
ADD CONSTRAINT `FK_71BB5F794B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `FK_71BB5F7961190A32` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tags`
--
ALTER TABLE `post_tags`
ADD CONSTRAINT `FK_A6E9F32D4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `FK_A6E9F32D8D7B4FB4` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_translations`
--
ALTER TABLE `post_translations`
ADD CONSTRAINT `FK_6D8AA754232D562B` FOREIGN KEY (`object_id`) REFERENCES `post` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
ADD CONSTRAINT `FK_1CF73D31A23B42D` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`);

--
-- Constraints for table `productphoto`
--
ALTER TABLE `productphoto`
ADD CONSTRAINT `FK_1D8A225E4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `productphoto_translations`
--
ALTER TABLE `productphoto_translations`
ADD CONSTRAINT `FK_31FC5727232D562B` FOREIGN KEY (`object_id`) REFERENCES `productphoto` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
ADD CONSTRAINT `FK_E254B6874584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `FK_E254B6878D7B4FB4` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_translations`
--
ALTER TABLE `product_translations`
ADD CONSTRAINT `FK_4B13F8EC232D562B` FOREIGN KEY (`object_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `program_translations`
--
ALTER TABLE `program_translations`
ADD CONSTRAINT `FK_851229A0232D562B` FOREIGN KEY (`object_id`) REFERENCES `program` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salle`
--
ALTER TABLE `salle`
ADD CONSTRAINT `FK_8F56515861190A32` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`);

--
-- Constraints for table `salle_translations`
--
ALTER TABLE `salle_translations`
ADD CONSTRAINT `FK_B2F8B78A232D562B` FOREIGN KEY (`object_id`) REFERENCES `salle` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedule`
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
-- Constraints for table `tags_translations`
--
ALTER TABLE `tags_translations`
ADD CONSTRAINT `FK_95D326DC232D562B` FOREIGN KEY (`object_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
