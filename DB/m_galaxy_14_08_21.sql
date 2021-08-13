-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2021 at 09:16 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `l_galaxy`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_text` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_banner` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `image`, `title`, `description`, `button_text`, `button_url`, `video_url`, `video_banner`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'upload/about-us/jyFGy989Kp0f9ZzmIbZP.png', 'About Galaxy Go', '<p>Lorem ipsum dolor sit amet consectetur adipiscing eli. Condimentum porttitor malesuada et commodo, nisi etiam quis. Risus com placerat hendrerit nulla ac. Eu mauris ornare justo turpis molest. Tellus mauris aliquam eu augue sit tortor potenti.</p>\r\n<p>Arcu auctor consectetur molestie euismod siti. Adipiscing in iegestas mauris amet. Ut fames pretium turpis posuere. Scelerisque arcu quis tortor sapien. Ac etiam felis erat fermentum, amet. Velit nec, ultrices ut suspendisse turpis placerat risus sem.</p>\r\n<p>Maecenas sit orci curabitur ac velit nulla lobortis egestas. Cnisipurus nisl tortor mi nullam.</p>', 'visit our store', 'http://localhost/l/galaxygo/public/shop', 'https://www.youtube.com/watch?v=vVXnYdHwDqM', 'upload/about-us/EKt0eYnq7N1J26JSPTGr.png', 1, 1, '2021-08-13 17:21:20', '2021-08-13 17:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Index', 'Index of module', 1, 1, 1, NULL, '2020-01-24 12:52:00', '2020-12-05 09:32:13'),
(2, 'Create', NULL, 1, 1, 1, NULL, '2020-01-24 12:52:10', '2020-01-24 12:52:10'),
(3, 'Edit', NULL, 1, 1, 1, NULL, '2020-01-24 12:52:20', '2020-03-02 15:23:32'),
(4, 'Delete', NULL, 1, 1, 1, NULL, '2020-01-24 12:52:30', '2020-01-24 12:52:30'),
(5, 'Change password', NULL, 1, 1, 1, NULL, '2020-01-24 12:52:39', '2020-01-24 12:52:39'),
(6, 'Password reset', NULL, 1, 1, 1, NULL, '2020-01-24 12:52:50', '2020-01-24 12:52:50'),
(7, 'Print', NULL, 1, 1, 1, NULL, '2020-01-24 12:53:01', '2020-01-24 12:53:01'),
(8, 'Details', NULL, 1, 1, 1, NULL, '2020-01-24 12:53:12', '2020-01-24 12:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `status`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Samsungs', 1, NULL, 1, 1, '2021-07-23 10:06:09', '2021-07-23 10:22:48'),
(2, 'Samsung', 1, NULL, 1, 1, '2021-07-23 10:10:49', '2021-07-23 10:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `created_by`, `updated_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Category 1', NULL, 'category-1-7170', 1, 1, 1, NULL, '2021-07-23 07:08:37', '2021-07-23 23:20:12'),
(2, 'Category 2', 1, 'category-2-758', 1, 1, 1, NULL, '2021-07-23 07:09:09', '2021-07-23 23:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `coin_histories`
--

CREATE TABLE `coin_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_type` tinyint(1) NOT NULL COMMENT '0 = earn, 1 = expense',
  `earn_expense_type` int(11) NOT NULL COMMENT '0 = register, 1 = share, 2 = contest, 3 = withdraw,4 = buy',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coin_histories`
--

INSERT INTO `coin_histories` (`id`, `user_id`, `amount`, `transaction_type`, `earn_expense_type`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 25, '100.00', 0, 0, 25, 25, NULL, '2021-08-11 16:33:38', '2021-08-11 16:33:38'),
(6, 24, '0.00', 0, 2, 24, 24, NULL, '2021-08-12 16:31:52', '2021-08-12 16:31:52'),
(7, 25, '1000.00', 0, 2, 25, 25, NULL, '2021-08-12 16:32:22', '2021-08-12 16:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `contests`
--

CREATE TABLE `contests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expaire_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_final_answer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = not submitted,1= submitted',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contests`
--

INSERT INTO `contests` (`id`, `name`, `expaire_time`, `is_final_answer`, `created_by`, `updated_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '2021-07-01', '2021-07-01 5:44 PM', 0, 1, 1, 1, NULL, '2021-07-24 01:46:04', '2021-07-24 01:46:04'),
(2, '2021-07-30', '2021-07-30 6:04 PM', 0, 1, 1, 1, NULL, '2021-07-24 04:04:53', '2021-07-24 04:04:53'),
(3, '2021-08-10', '2021-08-10 11:30 PM', 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-10 17:26:19'),
(5, '2021-08-11', '2021-08-11 10:50 PM', 0, 1, 1, 1, NULL, '2021-08-11 05:00:27', '2021-08-11 16:46:33'),
(6, '2021-08-12', '2021-08-12 07:32 PM', 1, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:37:50');

-- --------------------------------------------------------

--
-- Table structure for table `contest_participants`
--

CREATE TABLE `contest_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `participant_type` tinyint(1) NOT NULL COMMENT '0 = user, 1 = guest',
  `participant_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user or guest id',
  `contest_id` bigint(20) UNSIGNED NOT NULL,
  `correct_answer` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `earn` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `get_coin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = coin not get, 1 = coin get',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contest_participants`
--

INSERT INTO `contest_participants` (`id`, `participant_type`, `participant_id`, `contest_id`, `correct_answer`, `earn`, `get_coin`, `created_at`, `updated_at`) VALUES
(1, 0, 24, 3, 0, 0, 0, '2021-08-10 16:30:27', '2021-08-10 16:30:27'),
(2, 1, 8, 3, 0, 0, 0, '2021-08-10 17:17:54', '2021-08-10 17:17:54'),
(4, 1, 8, 5, 0, 0, 0, '2021-08-11 15:45:04', '2021-08-11 15:45:04'),
(5, 0, 24, 5, 0, 0, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(6, 0, 24, 6, 4, 0, 1, '2021-08-12 13:29:37', '2021-08-12 16:31:52'),
(7, 0, 25, 6, 8, 1000, 1, '2021-08-12 13:30:10', '2021-08-12 16:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `contest_players`
--

CREATE TABLE `contest_players` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contest_id` bigint(20) UNSIGNED NOT NULL,
  `player_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `played_on` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `versus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` double(10,2) NOT NULL,
  `answer` int(11) NOT NULL DEFAULT 0 COMMENT '0=no answer,1=under,2=over',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contest_players`
--

INSERT INTO `contest_players` (`id`, `contest_id`, `player_name`, `player_image`, `location`, `played_on`, `versus`, `score`, `answer`, `created_by`, `updated_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Lemon', 'upload/player-pic/ejmdfEiko4KeMC6AEjBq210724.jpg', 'Thakur', NULL, 'Versus', 4555.00, 0, 1, 1, 1, NULL, '2021-07-24 01:46:04', '2021-07-24 01:46:04'),
(2, 1, 'Lemo', 'upload/player-pic/gpGi4OlGID476pPyTnvI.jpg', 'city', NULL, '332222', 65555.00, 0, 1, 1, 1, NULL, '2021-07-24 01:47:15', '2021-07-24 01:47:15'),
(3, 2, 'Thakur', 'upload/player-pic/n0EixSI4cLAz3vZ16er7210724.jpg', 'Sylhet', NULL, '332222', 5555.00, 0, 1, 1, 1, NULL, '2021-07-24 04:04:53', '2021-07-24 04:04:53'),
(4, 3, 'Player 1', 'upload/player-pic/nbegMBsrqMwvUHKfEWtr210810.png', 'BAL - LF', NULL, 'bos', 5.00, 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-09 23:22:53'),
(5, 3, 'Player 2', 'upload/player-pic/MjICv51hH8Vfa67buKR4210810.png', 'BAL - LF', NULL, 'bos', 5.00, 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-09 23:22:53'),
(6, 3, 'player 3', 'upload/player-pic/3WYpsxeKk7CrsfB3lWQX210810.png', 'Bal-lf', NULL, 'bos', 6.00, 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-09 23:22:53'),
(7, 3, 'player 4', 'upload/player-pic/J0uelRQKlgxHMgKIFMfu210810.jpg', 'bal - lf', NULL, 'bos', 3.00, 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-09 23:22:53'),
(8, 3, 'player 5', 'upload/player-pic/YNgd1GpqieAKNpT8dLgc210810.png', 'bal-lf', NULL, 'bos', 8.00, 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-09 23:22:53'),
(9, 3, 'Player 6', 'upload/player-pic/7CPlJm58fTirOHm7jYro210810.png', 'BAL - LF', NULL, 'bos', 6.00, 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-09 23:22:53'),
(10, 3, 'player 7', 'upload/player-pic/OvyYgsb7BEPektEVOThC210810.png', 'BAL - LF', NULL, 'bos', 5.00, 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-09 23:22:53'),
(11, 3, 'player 8', 'upload/player-pic/VZB94d0hq7Aeu0g7COOV210810.png', 'bal -LF', NULL, 'bos', 5.00, 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-09 23:22:53'),
(12, 3, 'player 9', 'upload/player-pic/WnUbyNCGVLxWZrdWgXrl210810.png', 'bal - lf', NULL, 'bos', 4.00, 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-09 23:22:53'),
(13, 3, 'player 10', 'upload/player-pic/ZwUHwuXMpjHxW5MDmCzG210810.png', 'bal - lf', NULL, 'bos', 8.00, 0, 1, 1, 1, NULL, '2021-08-09 23:22:53', '2021-08-09 23:22:53'),
(18, 5, 'pl 1', 'upload/player-pic/T4nNF2Kd4IkOqgg76IMG210811.png', 'fd', '2021-08-18 10:59 am', 'df', 5.00, 0, 1, 1, 1, NULL, '2021-08-11 05:00:27', '2021-08-11 05:00:27'),
(19, 5, 'pl 2', 'upload/player-pic/Q4IKHnHtJyibKTvPpgMM.png', 'df', '2021-08-11 11:09 am', 'edd', 5.00, 0, 1, 1, 1, NULL, '2021-08-11 05:09:41', '2021-08-11 05:09:41'),
(20, 5, 'Hayfa Waters', 'upload/player-pic/4Oir2whHrEggyDQXqbNz.png', 'Rerum', '2021-08-11 11:11 am', 'Officiis', 9.00, 0, 1, 1, 1, NULL, '2021-08-11 05:12:44', '2021-08-11 05:12:44'),
(21, 5, 'Cleo Evans', 'upload/player-pic/uuqll7w7MY7nPFpDDUDn.png', 'Quisquam', '2021-08-04 11:12 am', 'Et et', 42.00, 0, 1, 1, 1, NULL, '2021-08-11 05:13:05', '2021-08-11 05:13:05'),
(22, 5, 'Cassady Cooley', 'upload/player-pic/FQ22fpN4Vla5OC64UypZ.png', 'Qui', '2021-08-26 11:13 am', 'Ducimus', 79.00, 0, 1, 1, 1, NULL, '2021-08-11 05:13:23', '2021-08-11 05:13:23'),
(23, 5, 'Skyler Gordon', 'upload/player-pic/0R1WmH7xWTNESyVKPo6l.png', 'In asper', '2021-02-03 11:13 am', 'Ex fugiat', 64.00, 0, 1, 1, 1, NULL, '2021-08-11 05:13:45', '2021-08-11 05:13:45'),
(24, 5, 'Lila Schmidt', 'upload/player-pic/b1VShxymKJllRGDhtkh3.png', 'Voluptas', '2021-08-18 11:13 am', 'Adipisci', 19.00, 0, 1, 1, 1, NULL, '2021-08-11 05:14:04', '2021-08-11 05:14:04'),
(25, 5, 'Brittany Haley', 'upload/player-pic/PGpDQcHWsLyLcTROpEs8.png', 'Do Nam', '2021-08-11 11:14 am', 'Aperiam', 91.00, 0, 1, 1, 1, NULL, '2021-08-11 05:14:26', '2021-08-11 05:14:26'),
(26, 5, 'Noble', 'upload/player-pic/Iwy8IhxH7Q684LWyfeAm.png', 'Adipisci', '2021-08-13 11:14 am', 'Elit quo', 82.00, 0, 1, 1, 1, NULL, '2021-08-11 05:14:42', '2021-08-11 05:14:42'),
(27, 5, 'Risa Vasquez', 'upload/player-pic/vOHNOobF7oPfE8T6hLcT.png', 'Dolor', '2021-08-04 11:14 am', 'Et la', 80.00, 0, 1, 1, 1, NULL, '2021-08-11 05:14:58', '2021-08-11 05:14:58'),
(28, 6, 'George York', 'upload/player-pic/R78m7wAME8DWF7Aqh6Ek210812.png', 'Incidunt in reprehe', '2021-08-11 07:26 pm', 'Totam quibusdam nobi', 67.00, 1, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:33:58'),
(29, 6, 'Fay Bradford', 'upload/player-pic/V4y4EDo5DLYHxlhwFTMP210812.png', 'Asperiores aute quae', '2021-08-11 07:26 pm', 'Qui cum esse sapien', 61.00, 1, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:33:58'),
(30, 6, 'Vanna Duncan', 'upload/player-pic/bcPzqUXScmXZubtwIcfp210812.png', 'Aliquip sequi repreh', '2021-08-11 07:26 pm', 'Expedita fuga Nemo', 9.00, 1, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:33:58'),
(31, 6, 'Jermaine Boyle', 'upload/player-pic/Yy3nnvGXnTwMB5U6M6So210812.png', 'Inventore similique', '2021-08-11 07:26 pm', 'Voluptatem Ipsam ex', 68.00, 2, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:33:58'),
(32, 6, 'Idola Miller', 'upload/player-pic/HocJWZrgYNeCnIpYZDGI210812.png', 'Dolore nostrum place', '2021-08-11 07:26 pm', 'Officia aut minima o', 65.00, 2, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:33:58'),
(33, 6, 'Nita Church', 'upload/player-pic/tIqqsDM8VH6z2lGyWarN210812.png', 'Qui ex accusamus rep', '2021-08-11 07:26 pm', 'Sit laboris assumend', 93.00, 2, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:33:58'),
(34, 6, 'Lance Pruitt', 'upload/player-pic/YOtvstTmU7KBHzeTTiN3210812.png', 'Pariatur Proident', '2021-08-11 07:26 pm', 'Ipsum laboriosam ex', 9.00, 1, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:33:58'),
(35, 6, 'Paula Gross', 'upload/player-pic/nrP0YfPdS184zPpiloAV210812.png', 'Ut ab voluptate esse', '2021-08-11 07:26 pm', 'Ipsa maiores quidem', 73.00, 1, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:33:58'),
(36, 6, 'Anastasia Horn', 'upload/player-pic/09PnBFm95h9hZq9rTFgY210812.png', 'Eos eum facere tempo', '2021-08-11 07:26 pm', 'Impedit velit repr', 85.00, 1, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:33:58'),
(37, 6, 'Ira Christian', 'upload/player-pic/lbLeZpNwK5EKqfvxziML210812.png', 'Quia distinctio Vel', '2021-08-11 07:26 pm', 'Nam nisi quasi lauda', 33.00, 2, 1, 1, 1, NULL, '2021-08-12 13:28:08', '2021-08-12 13:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guest_users`
--

CREATE TABLE `guest_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mac` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_coin` decimal(14,2) NOT NULL DEFAULT 0.00,
  `current_coin` decimal(14,2) NOT NULL DEFAULT 0.00,
  `withdraw` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guest_users`
--

INSERT INTO `guest_users` (`id`, `mac`, `total_coin`, `current_coin`, `withdraw`, `created_at`, `updated_at`) VALUES
(8, '00-FF-61-3E-12-B1', '0.00', '0.00', '0.00', '2021-08-10 17:17:54', '2021-08-10 17:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(22, '2014_10_12_000000_create_users_table', 1),
(23, '2014_10_12_100000_create_password_resets_table', 1),
(24, '2019_08_19_000000_create_failed_jobs_table', 1),
(25, '2020_01_17_040304_create_activities_table', 1),
(26, '2020_01_17_040924_create_modules_table', 1),
(27, '2020_01_17_041254_create_module_to_activities_table', 1),
(28, '2020_01_17_041749_create_module_to_roles_table', 1),
(29, '2020_01_17_041946_create_module_to_users_table', 1),
(30, '2020_01_17_042141_create_roles_table', 1),
(31, '2020_01_18_111739_add_created_by_to_roles', 1),
(41, '2021_06_01_171209_create_site_settings_table', 2),
(42, '2021_07_19_142035_create_contests_table', 3),
(43, '2021_07_19_142601_create_contest_players_table', 3),
(44, '2021_07_23_140119_add_column_is_final_answer_to_contests', 4),
(45, '2021_07_23_160401_create_win_coins_table', 5),
(50, '2021_08_06_121217_add_for_social_login_column_in_users_table', 6),
(51, '2021_08_08_153041_create_coin_histories_table', 6),
(52, '2021_08_10_201006_create_contest_participants_table', 6),
(53, '2021_08_10_201043_create_participant_answers_table', 6),
(55, '2021_08_10_225242_create_guest_users_table', 7),
(56, '2021_08_11_102645_add_column_played_on_in_contest_players', 8),
(57, '2021_08_11_214151_add_column_participant_type_in_participant_answers', 9),
(59, '2021_08_13_222223_create_about_us_table', 10),
(61, '2021_08_13_234507_create_other_pages_table', 11),
(63, '2021_08_14_002701_add_column_address_in_site_settings', 12);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `description`, `status`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Role Management', NULL, 1, NULL, 1, 1, '2020-01-24 12:53:44', '2020-12-05 09:05:04'),
(2, 'Role Access Control', NULL, 1, NULL, 1, 1, '2020-01-24 12:54:32', '2020-01-24 12:54:32'),
(3, 'User Access Control', NULL, 1, NULL, 1, 1, '2020-01-24 12:54:59', '2020-01-24 12:54:59'),
(4, 'Module Management', NULL, 1, NULL, 1, 1, '2020-01-24 12:55:37', '2020-01-24 12:55:37'),
(5, 'Activity Management', NULL, 1, NULL, 1, 1, '2020-01-24 12:55:58', '2020-01-24 12:55:58'),
(6, 'Admin Panel User', NULL, 1, NULL, 1, 1, '2020-01-24 12:58:53', '2020-01-24 12:58:53'),
(10, 'Site Setting', NULL, 1, NULL, 1, 1, '2021-07-14 03:08:07', '2021-07-14 03:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `module_to_activities`
--

CREATE TABLE `module_to_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_to_activities`
--

INSERT INTO `module_to_activities` (`id`, `module_id`, `activity_id`, `status`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(5, 2, 2, 1, NULL, 1, 1, '2020-01-24 12:54:32', '2020-01-24 12:54:32'),
(6, 2, 4, 1, NULL, 1, 1, '2020-01-24 12:54:32', '2020-01-24 12:54:32'),
(7, 2, 3, 1, NULL, 1, 1, '2020-01-24 12:54:32', '2020-01-24 12:54:32'),
(8, 2, 1, 1, NULL, 1, 1, '2020-01-24 12:54:32', '2020-01-24 12:54:32'),
(9, 3, 2, 1, NULL, 1, 1, '2020-01-24 12:54:59', '2020-01-24 12:54:59'),
(10, 3, 4, 1, NULL, 1, 1, '2020-01-24 12:54:59', '2020-01-24 12:54:59'),
(11, 3, 3, 1, NULL, 1, 1, '2020-01-24 12:54:59', '2020-01-24 12:54:59'),
(12, 3, 1, 1, NULL, 1, 1, '2020-01-24 12:54:59', '2020-01-24 12:54:59'),
(13, 4, 2, 1, NULL, 1, 1, '2020-01-24 12:55:37', '2020-01-24 12:55:37'),
(14, 4, 4, 1, NULL, 1, 1, '2020-01-24 12:55:37', '2020-01-24 12:55:37'),
(15, 4, 3, 1, NULL, 1, 1, '2020-01-24 12:55:37', '2020-01-24 12:55:37'),
(16, 4, 1, 1, NULL, 1, 1, '2020-01-24 12:55:37', '2020-01-24 12:55:37'),
(17, 5, 2, 1, NULL, 1, 1, '2020-01-24 12:55:58', '2020-01-24 12:55:58'),
(18, 5, 4, 1, NULL, 1, 1, '2020-01-24 12:55:58', '2020-01-24 12:55:58'),
(19, 5, 3, 1, NULL, 1, 1, '2020-01-24 12:55:58', '2020-01-24 12:55:58'),
(20, 5, 1, 1, NULL, 1, 1, '2020-01-24 12:55:58', '2020-01-24 12:55:58'),
(25, 6, 5, 1, NULL, 1, 1, '2020-01-24 13:07:39', '2020-01-24 13:07:39'),
(26, 6, 2, 1, NULL, 1, 1, '2020-01-24 13:07:39', '2020-01-24 13:07:39'),
(27, 6, 4, 1, NULL, 1, 1, '2020-01-24 13:07:39', '2020-01-24 13:07:39'),
(28, 6, 6, 1, NULL, 1, 1, '2020-01-24 13:07:39', '2020-01-24 13:07:39'),
(29, 6, 3, 1, NULL, 1, 1, '2020-01-24 13:07:39', '2020-01-24 13:07:39'),
(30, 6, 1, 1, NULL, 1, 1, '2020-01-24 13:07:39', '2020-01-24 13:07:39'),
(50, 1, 2, 1, NULL, 1, 1, '2020-12-05 09:05:04', '2020-12-05 09:05:04'),
(51, 1, 4, 1, NULL, 1, 1, '2020-12-05 09:05:04', '2020-12-05 09:05:04'),
(52, 1, 3, 1, NULL, 1, 1, '2020-12-05 09:05:04', '2020-12-05 09:05:04'),
(53, 1, 1, 1, NULL, 1, 1, '2020-12-05 09:05:04', '2020-12-05 09:05:04'),
(54, 10, 3, 1, NULL, 1, 1, '2021-07-14 03:08:07', '2021-07-14 03:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `module_to_roles`
--

CREATE TABLE `module_to_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_to_roles`
--

INSERT INTO `module_to_roles` (`id`, `module_id`, `role_id`, `activity_id`, `status`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(264, 1, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(265, 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(266, 1, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(267, 1, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(268, 2, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(269, 2, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(270, 2, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(271, 2, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(272, 3, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(273, 3, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(274, 3, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(275, 3, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(276, 4, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(277, 4, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(278, 4, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(279, 4, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(280, 5, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(281, 5, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(282, 5, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(283, 5, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(284, 6, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(285, 6, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(286, 6, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(287, 6, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(288, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(289, 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(290, 1, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(291, 1, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(292, 2, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(293, 2, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(294, 2, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(295, 2, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(296, 3, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(297, 3, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(298, 3, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(299, 3, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(300, 4, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(301, 4, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(302, 4, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(303, 4, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(304, 5, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(305, 5, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(306, 5, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(307, 5, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(308, 6, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(309, 6, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(310, 6, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(311, 6, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(312, 6, 1, 5, 1, NULL, NULL, NULL, NULL, NULL),
(313, 6, 1, 6, 1, NULL, NULL, NULL, NULL, NULL),
(314, 10, 1, 3, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module_to_users`
--

CREATE TABLE `module_to_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_to_users`
--

INSERT INTO `module_to_users` (`id`, `module_id`, `user_id`, `activity_id`, `status`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(130, 1, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(132, 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(134, 1, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(136, 1, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(138, 2, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(140, 2, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(142, 2, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(144, 2, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(146, 3, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(148, 3, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(150, 3, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(152, 3, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(154, 4, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(156, 4, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(158, 4, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(160, 4, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(162, 5, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(164, 5, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(166, 5, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(168, 5, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(170, 6, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(172, 6, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(174, 6, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(176, 6, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(178, 7, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(180, 7, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(182, 7, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(184, 7, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(345, 1, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(346, 1, 5, 2, 1, NULL, NULL, NULL, NULL, NULL),
(347, 1, 5, 3, 1, NULL, NULL, NULL, NULL, NULL),
(348, 1, 5, 4, 1, NULL, NULL, NULL, NULL, NULL),
(349, 2, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(350, 2, 5, 2, 1, NULL, NULL, NULL, NULL, NULL),
(351, 2, 5, 3, 1, NULL, NULL, NULL, NULL, NULL),
(352, 2, 5, 4, 1, NULL, NULL, NULL, NULL, NULL),
(353, 3, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(354, 3, 5, 2, 1, NULL, NULL, NULL, NULL, NULL),
(355, 3, 5, 3, 1, NULL, NULL, NULL, NULL, NULL),
(356, 3, 5, 4, 1, NULL, NULL, NULL, NULL, NULL),
(357, 4, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(358, 4, 5, 2, 1, NULL, NULL, NULL, NULL, NULL),
(359, 4, 5, 3, 1, NULL, NULL, NULL, NULL, NULL),
(360, 4, 5, 4, 1, NULL, NULL, NULL, NULL, NULL),
(361, 5, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(362, 5, 5, 2, 1, NULL, NULL, NULL, NULL, NULL),
(363, 5, 5, 3, 1, NULL, NULL, NULL, NULL, NULL),
(364, 5, 5, 4, 1, NULL, NULL, NULL, NULL, NULL),
(365, 6, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(366, 6, 5, 2, 1, NULL, NULL, NULL, NULL, NULL),
(367, 6, 5, 3, 1, NULL, NULL, NULL, NULL, NULL),
(368, 6, 5, 4, 1, NULL, NULL, NULL, NULL, NULL),
(435, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(436, 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(437, 1, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(438, 1, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(439, 2, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(440, 2, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(441, 2, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(442, 2, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(443, 3, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(444, 3, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(445, 3, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(446, 3, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(447, 4, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(448, 4, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(449, 4, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(450, 4, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(451, 5, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(452, 5, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(453, 5, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(454, 5, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(455, 6, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(456, 6, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(457, 6, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(458, 6, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(459, 6, 1, 5, 1, NULL, NULL, NULL, NULL, NULL),
(460, 6, 1, 6, 1, NULL, NULL, NULL, NULL, NULL),
(461, 10, 1, 3, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `subtotal` double NOT NULL,
  `discount` double DEFAULT NULL,
  `vat_tax` double NOT NULL,
  `delivery_charge` double NOT NULL,
  `total` double NOT NULL,
  `payment_type` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tran_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Fulfilment','Cancle') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending' COMMENT '1=pending,2=processing,3=complete,4=on holod,5=cancel',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `shipping_address_id`, `subtotal`, `discount`, `vat_tax`, `delivery_charge`, `total`, `payment_type`, `tran_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 14, 0, 70, 0, 14.7, 500, 84.7, 'PayPal', '00000001', 'Pending', 14, 14, '2021-08-08 10:11:30', '2021-08-08 10:11:30'),
(2, 14, 0, 100, 0, 21, 60, 181, 'Point', '00000002', 'Pending', 14, 14, '2021-08-08 10:52:37', '2021-08-08 10:52:37'),
(3, 14, 0, 70, 0, 14.7, 60, 144.7, 'Point', '00000003', 'Pending', 14, 14, '2021-08-08 10:53:44', '2021-08-08 10:53:44'),
(4, 15, 0, 170, 0, 35.7, 60, 265.7, 'Point', '00000004', 'Pending', 15, 15, '2021-08-08 11:56:25', '2021-08-08 11:56:25'),
(5, 16, 0, 70, 0, 14.7, 60, 144.7, 'Point', '00000005', 'Pending', 16, 16, '2021-08-08 12:01:20', '2021-08-08 12:01:20'),
(6, 17, 0, 70, 0, 14.7, 60, 144.7, 'Point', '00000006', 'Pending', 17, 17, '2021-08-08 12:02:16', '2021-08-08 12:02:16'),
(7, 17, 0, 70, 0, 14.7, 60, 144.7, 'Point', '00000007', 'Pending', 17, 17, '2021-08-08 12:02:59', '2021-08-08 12:02:59'),
(8, 24, 0, 300, 0, 63, 0, 363, 'PayPal', '00000008', 'Pending', 24, 24, '2021-08-08 12:53:01', '2021-08-08 12:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `vat_tax` double(8,2) DEFAULT NULL,
  `total_price` double(8,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1=pending,2=processing,3=complete,4=on holod,5=cancel',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `user_id`, `product_id`, `quantity`, `price`, `discount`, `vat_tax`, `total_price`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '1', 14, 9, 1, 70.00, 0.00, 14.70, 84.70, 1, 14, 14, '2021-08-08 10:11:30', '2021-08-08 10:11:30'),
(2, '2', 14, 10, 1, 100.00, 0.00, 21.00, 121.00, 1, 14, 14, '2021-08-08 10:52:37', '2021-08-08 10:52:37'),
(3, '3', 14, 9, 1, 70.00, 0.00, 14.70, 84.70, 1, 14, 14, '2021-08-08 10:53:44', '2021-08-08 10:53:44'),
(4, '4', 15, 10, 1, 100.00, 0.00, 21.00, 121.00, 1, 15, 15, '2021-08-08 11:56:25', '2021-08-08 11:56:25'),
(5, '4', 15, 9, 1, 70.00, 0.00, 14.70, 84.70, 1, 15, 15, '2021-08-08 11:56:25', '2021-08-08 11:56:25'),
(6, '5', 16, 9, 1, 70.00, 0.00, 14.70, 84.70, 1, 16, 16, '2021-08-08 12:01:20', '2021-08-08 12:01:20'),
(7, '6', 17, 9, 1, 70.00, 0.00, 14.70, 84.70, 1, 17, 17, '2021-08-08 12:02:16', '2021-08-08 12:02:16'),
(8, '7', 17, 9, 1, 70.00, 0.00, 14.70, 84.70, 1, 17, 17, '2021-08-08 12:02:59', '2021-08-08 12:02:59'),
(9, '8', 24, 10, 3, 100.00, 0.00, 21.00, 363.00, 1, 24, 24, '2021-08-08 12:53:01', '2021-08-08 12:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_shipping_addresses`
--

CREATE TABLE `order_shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shipping_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_adrress_line_1` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_adrress_line_2` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `shipping_post_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_shipping_addresses`
--

INSERT INTO `order_shipping_addresses` (`id`, `user_id`, `shipping_first_name`, `shipping_last_name`, `shipping_email`, `shipping_company_name`, `shipping_adrress_line_1`, `shipping_adrress_line_2`, `shipping_city`, `shipping_country`, `shipping_post_code`, `shipping_phone`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(13, 14, 'Size', 'Thakur', 'admin@email.comLem', 'ddddd', 'adddress 1', 'address2', 'sdfghjkl;ss', 18, '333', '01876543321', 1, 14, 14, '2021-08-08 06:04:08', '2021-08-08 06:04:08'),
(14, 14, 'Sizes', 'Thakur', 'admin@email.comLem', 'ddddd', 'adddress 1', 'address2', 'sdfghjkl;ss', 18, '333', '01876543321', 1, 14, 14, '2021-08-08 06:26:37', '2021-08-08 06:26:37'),
(15, 14, 'Size', 'Thakur', 'admin@email.comLem', 'ddddd', 'adddress 1', 'address2', 'sdfghjkl;ss', 18, '333', '01876543321', 1, 14, 14, '2021-08-08 06:34:21', '2021-08-08 06:34:21'),
(16, 15, 'Cora Lloyd', 'Bishop', 'nupilo@mailinator.com', 'Long Sims Trading', 'Irure reprehenderit', 'Reprehenderit et qu', 'Sit aut sunt rerum u', 4, 'Ut sint dolores sint', '+1 (402) 371-1809', 1, 15, 15, '2021-08-08 11:55:20', '2021-08-08 11:55:20'),
(17, 16, 'Justin Padilla', 'Ashley', 'myxexu@mailinator.com', 'Marks and Chan Co', 'Molestiae cupidatat', 'Saepe aliqua Cum vo', 'Ut aliqua Qui sit n', 1, 'Nisi a excepteur ea', '+1 (701) 644-5962', 1, 16, 16, '2021-08-08 12:01:17', '2021-08-08 12:01:17'),
(18, 17, 'Jennifer Greene', 'Vega', 'bubyvewit@mailinator.com', 'Wells Nunez LLC', 'Perferendis est vel', 'Fuga Elit non cons', 'Nostrud debitis temp', 3, 'Molestiae temporibus', '+1 (472) 429-9385', 1, 17, 17, '2021-08-08 12:02:11', '2021-08-08 12:02:11'),
(19, 24, 'user', 'Lara', 'user@email.com', 'Wong and Ferguson Inc', 'Irure reprehenderit', 'Reprehenderit et qu', 'Non earum nihil ea i', 3, '70312', '7034954485', 1, 24, 24, '2021-08-08 12:48:48', '2021-08-08 12:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `other_pages`
--

CREATE TABLE `other_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `privacy_policy` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms_condition` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rules` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `other_pages`
--

INSERT INTO `other_pages` (`id`, `privacy_policy`, `terms_condition`, `rules`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '<div class=\"main-description\">\r\n<p>A privacy policy, also called a \"privacy policy\" or a \"privacy policy\", is a document that states what personal data you are processing, for what purpose and how you protect it. The goal of the privacy policy is to inform users about how their data is processed. Hence, the policy should be accessible to your users and formulated in clear and simple language. Most countries have privacy laws that require website owners who process personal data to have \'set a proper privacy policy on their site, and failure to comply can result in hefty fines and even prosecutions.</p>\r\n<p class=\"sub-tile\">What are personal data?</p>\r\n<p>Personal data is information that can identify an individual, either directly or in combination with other data. Names, email addresses, locations, IP addresses, photos, and account information are all examples of directly identifying data. Information regarding an individual\'s health, income, religion or cultural profile is also personal data. Furthermore, and crucial in the present context, data on the actions of users\' digital lives are considered personal. Cookies are able to track and record the browsing activities of individual users, for example which articles scroll and which ones they choose to read. Not sure if your site complies with the laws on the processing of personal data? Check it out with Cookiebot - it\'s free !</p>\r\n</div>\r\n<div class=\"sub-description\">\r\n<h6>Do I need a privacy policy for my website?</h6>\r\n<p>Probably yes. If your site tracks personal data, you need a statement that informs users about it. Most websites track user data. Often even without the site owner\'s awareness, through cookies .If your site is hosted, does it use plug-ins, if it has social media buttons, or if you have implemented analytics tools etc. on your site, then it sets cookies on users\' browsers and tracks data deemed personal by the GDPR.</p>\r\n<p>With the entry into force of the GDPR and the directive on privacy and electronic communications (e-Privacy), a correct privacy policy is essential for EU sites and for sites that have users from the EU. Scan your site here if you are in doubt about the compliance of cookies and online tracking.</p>\r\n<p>The free verification scans five pages of your website and sends a full report of the cookies and online tracking on those pages, including information on where they come from, purpose and whether or not they are compliant. Sign up for Cookiebot , if you want a complete overview of all the pages on your website.</p>\r\n</div>\r\n<div class=\"sub-description\">\r\n<h6>Do I need a privacy policy for my website?</h6>\r\n<p>The privacy policy can be written as a standalone page on your website, and made accessible with a link to the header or footer, or on the information page. It can also be hosted by a privacy policy service with a link from your site. Basically it doesn\'t matter where you decide to allocate it, as long as your users have access to it. The privacy policy is a legal text. The phrasing depends on the jurisdictions you are subject to and how your site treats the data.</p>\r\n<p>Here it is enough to say that all websites are different. We always recommend using legal counsel to ensure that your privacy policy complies with all applicable laws.However, this might seem like a high cost if you are, for example, a hobby blogger or a small business. What you should never do is copy a privacy policy from some other website .</p>\r\n</div>', '<div class=\"main-description\">\r\n<p>A privacy policy, also called a \"privacy policy\" or a \"privacy policy\", is a document that states what personal data you are processing, for what purpose and how you protect it. The goal of the privacy policy is to inform users about how their data is processed. Hence, the policy should be accessible to your users and formulated in clear and simple language. Most countries have privacy laws that require website owners who process personal data to have \'set a proper privacy policy on their site, and failure to comply can result in hefty fines and even prosecutions.</p>\r\n<p class=\"sub-tile\">What are personal data?</p>\r\n<p>Personal data is information that can identify an individual, either directly or in combination with other data. Names, email addresses, locations, IP addresses, photos, and account information are all examples of directly identifying data. Information regarding an individual\'s health, income, religion or cultural profile is also personal data. Furthermore, and crucial in the present context, data on the actions of users\' digital lives are considered personal. Cookies are able to track and record the browsing activities of individual users, for example which articles scroll and which ones they choose to read. Not sure if your site complies with the laws on the processing of personal data? Check it out with Cookiebot - it\'s free !</p>\r\n</div>\r\n<div class=\"sub-description\">\r\n<h6>Do I need a privacy policy for my website?</h6>\r\n<p>Probably yes. If your site tracks personal data, you need a statement that informs users about it. Most websites track user data. Often even without the site owner\'s awareness, through cookies .If your site is hosted, does it use plug-ins, if it has social media buttons, or if you have implemented analytics tools etc. on your site, then it sets cookies on users\' browsers and tracks data deemed personal by the GDPR.</p>\r\n<p>With the entry into force of the GDPR and the directive on privacy and electronic communications (e-Privacy), a correct privacy policy is essential for EU sites and for sites that have users from the EU. Scan your site here if you are in doubt about the compliance of cookies and online tracking.</p>\r\n<p>The free verification scans five pages of your website and sends a full report of the cookies and online tracking on those pages, including information on where they come from, purpose and whether or not they are compliant. Sign up for Cookiebot , if you want a complete overview of all the pages on your website.</p>\r\n</div>\r\n<div class=\"sub-description\">\r\n<h6>Do I need a privacy policy for my website?</h6>\r\n<p>The privacy policy can be written as a standalone page on your website, and made accessible with a link to the header or footer, or on the information page. It can also be hosted by a privacy policy service with a link from your site. Basically it doesn\'t matter where you decide to allocate it, as long as your users have access to it. The privacy policy is a legal text. The phrasing depends on the jurisdictions you are subject to and how your site treats the data.</p>\r\n<p>Here it is enough to say that all websites are different. We always recommend using legal counsel to ensure that your privacy policy complies with all applicable laws.However, this might seem like a high cost if you are, for example, a hobby blogger or a small business. What you should never do is copy a privacy policy from some other website .</p>\r\n</div>', '<div class=\"main-description\">\r\n<p>A privacy policy, also called a \"privacy policy\" or a \"privacy policy\", is a document that states what personal data you are processing, for what purpose and how you protect it. The goal of the privacy policy is to inform users about how their data is processed. Hence, the policy should be accessible to your users and formulated in clear and simple language. Most countries have privacy laws that require website owners who process personal data to have \'set a proper privacy policy on their site, and failure to comply can result in hefty fines and even prosecutions.</p>\r\n<p class=\"sub-tile\">What are personal data?</p>\r\n<p>Personal data is information that can identify an individual, either directly or in combination with other data. Names, email addresses, locations, IP addresses, photos, and account information are all examples of directly identifying data. Information regarding an individual\'s health, income, religion or cultural profile is also personal data. Furthermore, and crucial in the present context, data on the actions of users\' digital lives are considered personal. Cookies are able to track and record the browsing activities of individual users, for example which articles scroll and which ones they choose to read. Not sure if your site complies with the laws on the processing of personal data? Check it out with Cookiebot - it\'s free !</p>\r\n</div>\r\n<div class=\"sub-description\">\r\n<h6>Do I need a privacy policy for my website?</h6>\r\n<p>Probably yes. If your site tracks personal data, you need a statement that informs users about it. Most websites track user data. Often even without the site owner\'s awareness, through cookies .If your site is hosted, does it use plug-ins, if it has social media buttons, or if you have implemented analytics tools etc. on your site, then it sets cookies on users\' browsers and tracks data deemed personal by the GDPR.</p>\r\n<p>With the entry into force of the GDPR and the directive on privacy and electronic communications (e-Privacy), a correct privacy policy is essential for EU sites and for sites that have users from the EU. Scan your site here if you are in doubt about the compliance of cookies and online tracking.</p>\r\n<p>The free verification scans five pages of your website and sends a full report of the cookies and online tracking on those pages, including information on where they come from, purpose and whether or not they are compliant. Sign up for Cookiebot , if you want a complete overview of all the pages on your website.</p>\r\n</div>\r\n<div class=\"sub-description\">\r\n<h6>Do I need a privacy policy for my website?</h6>\r\n<p>The privacy policy can be written as a standalone page on your website, and made accessible with a link to the header or footer, or on the information page. It can also be hosted by a privacy policy service with a link from your site. Basically it doesn\'t matter where you decide to allocate it, as long as your users have access to it. The privacy policy is a legal text. The phrasing depends on the jurisdictions you are subject to and how your site treats the data.</p>\r\n<p>Here it is enough to say that all websites are different. We always recommend using legal counsel to ensure that your privacy policy complies with all applicable laws.However, this might seem like a high cost if you are, for example, a hobby blogger or a small business. What you should never do is copy a privacy policy from some other website .</p>\r\n</div>', 1, 1, '2021-08-13 18:19:25', '2021-08-13 18:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `participant_answers`
--

CREATE TABLE `participant_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contest_participant_id` bigint(20) UNSIGNED NOT NULL,
  `contest_id` bigint(20) UNSIGNED NOT NULL,
  `contest_player_id` bigint(20) UNSIGNED NOT NULL,
  `participant_type` tinyint(1) NOT NULL COMMENT '0 = user, 1 = guest',
  `participant_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user or guest id',
  `participant_answer` tinyint(1) NOT NULL COMMENT '1 = under,2 = over',
  `is_correct` int(11) NOT NULL COMMENT '0 = not check , 1 = no, 2 =yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participant_answers`
--

INSERT INTO `participant_answers` (`id`, `contest_participant_id`, `contest_id`, `contest_player_id`, `participant_type`, `participant_id`, `participant_answer`, `is_correct`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 4, 0, 24, 2, 0, '2021-08-10 16:30:27', '2021-08-10 16:39:26'),
(2, 1, 3, 5, 0, 24, 1, 0, '2021-08-10 16:30:27', '2021-08-10 16:37:59'),
(3, 1, 3, 6, 0, 24, 2, 0, '2021-08-10 16:30:27', '2021-08-10 16:40:18'),
(4, 1, 3, 7, 0, 24, 1, 0, '2021-08-10 16:30:27', '2021-08-10 16:34:27'),
(5, 1, 3, 8, 0, 24, 2, 0, '2021-08-10 16:30:27', '2021-08-10 16:39:26'),
(6, 1, 3, 9, 0, 24, 2, 0, '2021-08-10 16:30:27', '2021-08-10 16:40:18'),
(7, 1, 3, 10, 0, 24, 2, 0, '2021-08-10 16:30:27', '2021-08-10 16:40:18'),
(8, 1, 3, 11, 0, 24, 2, 0, '2021-08-10 16:30:27', '2021-08-10 16:40:18'),
(9, 1, 3, 12, 0, 24, 1, 0, '2021-08-10 16:30:27', '2021-08-10 16:34:27'),
(10, 1, 3, 13, 0, 24, 2, 0, '2021-08-10 16:30:27', '2021-08-10 16:37:59'),
(11, 2, 3, 4, 0, 8, 2, 0, '2021-08-10 17:17:54', '2021-08-10 17:17:54'),
(12, 2, 3, 5, 0, 8, 1, 0, '2021-08-10 17:17:54', '2021-08-10 17:18:33'),
(13, 2, 3, 6, 0, 8, 1, 0, '2021-08-10 17:17:54', '2021-08-10 17:18:33'),
(14, 2, 3, 7, 0, 8, 2, 0, '2021-08-10 17:17:54', '2021-08-10 17:18:33'),
(15, 2, 3, 8, 0, 8, 1, 0, '2021-08-10 17:17:54', '2021-08-10 17:18:33'),
(16, 2, 3, 9, 0, 8, 2, 0, '2021-08-10 17:17:54', '2021-08-10 17:17:54'),
(17, 2, 3, 10, 0, 8, 1, 0, '2021-08-10 17:17:54', '2021-08-10 17:18:33'),
(18, 2, 3, 11, 0, 8, 1, 0, '2021-08-10 17:17:54', '2021-08-10 17:18:33'),
(19, 2, 3, 12, 0, 8, 2, 0, '2021-08-10 17:17:54', '2021-08-10 17:17:54'),
(20, 2, 3, 13, 0, 8, 1, 0, '2021-08-10 17:17:54', '2021-08-10 17:17:54'),
(31, 4, 5, 18, 1, 8, 1, 0, '2021-08-11 15:45:04', '2021-08-11 16:33:01'),
(32, 4, 5, 19, 1, 8, 1, 0, '2021-08-11 15:45:04', '2021-08-11 15:45:04'),
(33, 4, 5, 20, 1, 8, 1, 0, '2021-08-11 15:45:04', '2021-08-11 16:33:01'),
(34, 4, 5, 21, 1, 8, 1, 0, '2021-08-11 15:45:04', '2021-08-11 15:45:04'),
(35, 4, 5, 22, 1, 8, 1, 0, '2021-08-11 15:45:04', '2021-08-11 16:33:01'),
(36, 4, 5, 23, 1, 8, 2, 0, '2021-08-11 15:45:04', '2021-08-11 16:33:09'),
(37, 4, 5, 24, 1, 8, 1, 0, '2021-08-11 15:45:04', '2021-08-11 16:33:01'),
(38, 4, 5, 25, 1, 8, 1, 0, '2021-08-11 15:45:04', '2021-08-11 15:45:04'),
(39, 4, 5, 26, 1, 8, 1, 0, '2021-08-11 15:45:04', '2021-08-11 16:33:01'),
(40, 4, 5, 27, 1, 8, 1, 0, '2021-08-11 15:45:04', '2021-08-11 15:45:04'),
(41, 5, 5, 18, 0, 24, 1, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(42, 5, 5, 19, 0, 24, 2, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(43, 5, 5, 20, 0, 24, 1, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(44, 5, 5, 21, 0, 24, 2, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(45, 5, 5, 22, 0, 24, 1, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(46, 5, 5, 23, 0, 24, 2, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(47, 5, 5, 24, 0, 24, 1, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(48, 5, 5, 25, 0, 24, 2, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(49, 5, 5, 26, 0, 24, 1, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(50, 5, 5, 27, 0, 24, 2, 0, '2021-08-11 15:50:54', '2021-08-11 15:50:54'),
(51, 6, 6, 28, 0, 24, 2, 1, '2021-08-12 13:29:37', '2021-08-12 16:25:22'),
(52, 6, 6, 29, 0, 24, 2, 1, '2021-08-12 13:29:37', '2021-08-12 16:25:22'),
(53, 6, 6, 30, 0, 24, 2, 1, '2021-08-12 13:29:37', '2021-08-12 16:25:22'),
(54, 6, 6, 31, 0, 24, 2, 2, '2021-08-12 13:29:37', '2021-08-12 16:25:22'),
(55, 6, 6, 32, 0, 24, 2, 2, '2021-08-12 13:29:37', '2021-08-12 16:25:22'),
(56, 6, 6, 33, 0, 24, 2, 2, '2021-08-12 13:29:37', '2021-08-12 16:25:22'),
(57, 6, 6, 34, 0, 24, 2, 1, '2021-08-12 13:29:37', '2021-08-12 16:25:22'),
(58, 6, 6, 35, 0, 24, 2, 1, '2021-08-12 13:29:37', '2021-08-12 16:25:22'),
(59, 6, 6, 36, 0, 24, 2, 1, '2021-08-12 13:29:37', '2021-08-12 16:25:22'),
(60, 6, 6, 37, 0, 24, 2, 2, '2021-08-12 13:29:37', '2021-08-12 16:25:22'),
(61, 7, 6, 28, 0, 25, 1, 2, '2021-08-12 13:30:10', '2021-08-12 16:30:04'),
(62, 7, 6, 29, 0, 25, 1, 2, '2021-08-12 13:30:10', '2021-08-12 16:30:04'),
(63, 7, 6, 30, 0, 25, 1, 2, '2021-08-12 13:30:10', '2021-08-12 16:30:04'),
(64, 7, 6, 31, 0, 25, 2, 2, '2021-08-12 13:30:10', '2021-08-12 16:30:04'),
(65, 7, 6, 32, 0, 25, 2, 2, '2021-08-12 13:30:10', '2021-08-12 16:30:04'),
(66, 7, 6, 33, 0, 25, 1, 1, '2021-08-12 13:30:10', '2021-08-12 16:30:04'),
(67, 7, 6, 34, 0, 25, 1, 2, '2021-08-12 13:30:10', '2021-08-12 16:30:04'),
(68, 7, 6, 35, 0, 25, 1, 2, '2021-08-12 13:30:10', '2021-08-12 16:30:04'),
(69, 7, 6, 36, 0, 25, 2, 1, '2021-08-12 13:30:10', '2021-08-12 16:30:04'),
(70, 7, 6, 37, 0, 25, 2, 2, '2021-08-12 13:30:10', '2021-08-12 16:30:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('user2@email.com', '7fqfpaGO8RVZVuwJTNA3rgCTc9NHnYq7euOpYxzC9CP6brYEgPEotegoGcyTJckG', '2021-08-08 12:21:08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `feature_image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `galler_images` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(28) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attached_file` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `model_number` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_policy` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_meta` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_mt_description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featureproduct` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_bid_amount` double DEFAULT NULL,
  `auction_start_date` date DEFAULT NULL,
  `auction_start_time` time DEFAULT NULL,
  `auction_end_date` date DEFAULT NULL,
  `auction_end_time` time DEFAULT NULL,
  `auction_start_date_time` timestamp NULL DEFAULT NULL,
  `auction_end_date_time` timestamp NULL DEFAULT NULL,
  `avg_review` double(10,2) DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `sub_category_id`, `brand_id`, `feature_image`, `galler_images`, `product_type`, `attached_file`, `price`, `discount_amount`, `quantity`, `model_number`, `product_description`, `return_policy`, `pro_meta`, `pro_mt_description`, `video_url`, `featureproduct`, `starting_bid_amount`, `auction_start_date`, `auction_start_time`, `auction_end_date`, `auction_end_time`, `auction_start_date_time`, `auction_end_date_time`, `avg_review`, `status`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(8, 'Product 1', '45455ID', 2, NULL, 1, 'ytgvkWxqvOFVYLXEvHTX.png', '[\"610c5abb7e880product-details-large.png\"]', 'Auction Product', NULL, 50, 10, NULL, NULL, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>', '<p>Return plicy</p>', 'Meta', 'Meta discritpion', NULL, 'yes', 40, '2021-08-01', '09:30:00', '2021-08-10', '11:59:00', '2021-08-01 03:30:00', '2021-08-10 05:59:00', 0.00, 1, NULL, 1, 1, '2021-08-05 15:19:40', '2021-08-06 14:13:06'),
(9, 'product 2', 'product-2-5880', 2, NULL, 2, 'd38reOkhGAJasjHq7KpG.png', NULL, 'General Product', NULL, 70, NULL, NULL, 'eeee555ID', '<p>Product dEscritpion</p>', '<p>Return plicy</p>', NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, 1, 1, '2021-08-05 15:42:57', '2021-08-05 15:45:42'),
(10, 'Prouct 3', 'prouct-3-7928', 2, NULL, 2, 'tgW6WRxeKwyRvxhcQxD1.png', NULL, 'General Product', NULL, 100, NULL, NULL, 'E-g33333gtt', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>', NULL, NULL, NULL, 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, 1, 1, '2021-08-05 15:47:23', '2021-08-06 14:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_bids`
--

CREATE TABLE `product_bids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_wise_bid_id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '1 = Active, 0 = Inactive',
  `bid_amount` double DEFAULT NULL,
  `bid_end_date` date DEFAULT NULL,
  `bid_end_time` time DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_bids`
--

INSERT INTO `product_bids` (`id`, `product_id`, `product_wise_bid_id`, `user_id`, `bid_amount`, `bid_end_date`, `bid_end_time`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 8, 2, 12, 6007, '2021-08-10', '11:59:00', 1, 12, '2021-08-05 16:27:04', '2021-08-06 16:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_wise_bids`
--

CREATE TABLE `product_wise_bids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `starting_bid_amount` double NOT NULL,
  `auction_start_date` datetime NOT NULL,
  `auction_start_time` time NOT NULL,
  `auction_end_date` date NOT NULL,
  `auction_end_time` time NOT NULL,
  `auction_start_date_time` timestamp NULL DEFAULT NULL,
  `auction_end_date_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_wise_bids`
--

INSERT INTO `product_wise_bids` (`id`, `product_id`, `starting_bid_amount`, `auction_start_date`, `auction_start_time`, `auction_end_date`, `auction_end_time`, `auction_start_date_time`, `auction_end_date_time`) VALUES
(1, 8, 40, '2021-08-15 00:00:00', '09:30:00', '2021-08-17', '11:59:00', '2021-08-15 03:30:00', '2021-08-17 05:59:00'),
(2, 8, 40, '2021-08-01 00:00:00', '09:30:00', '2021-08-10', '11:59:00', '2021-08-01 03:30:00', '2021-08-10 05:59:00'),
(3, 8, 40, '2021-08-01 00:00:00', '09:30:00', '2021-08-05', '11:59:00', '2021-08-01 03:30:00', '2021-08-05 05:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `info`, `status`, `deleted_at`, `updated_by`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 'Super Admin', NULL, 1, NULL, 1, '2020-01-24 12:50:33', '2020-12-05 07:05:06', 1),
(2, 'Admin', NULL, 1, NULL, 1, '2020-01-24 12:50:48', '2020-01-24 12:50:48', NULL),
(3, 'Customer', NULL, 1, NULL, 1, '2020-03-03 05:13:42', '2020-03-03 05:13:42', 1),
(4, 'Test role', NULL, 0, '2020-11-23 08:56:47', 1, '2020-11-23 08:53:06', '2020-11-23 08:56:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_map` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(765) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(765) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copy_right` varchar(765) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_quantity` int(11) NOT NULL DEFAULT 5,
  `display_unit` int(11) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `logo`, `icon`, `email`, `contact_no`, `address`, `google_map`, `site_title`, `meta_description`, `meta_keyword`, `copy_right`, `alert_quantity`, `display_unit`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'upload/site-setting/XOx4YG1M6p4tN169Myo8.png', 'upload/site-setting/2kb2Z1FTACjKCyOhwVJm.png', 'galaxy.go@gmail.com', '01719287734', '1470 S Washington St, North Attleboro MA 2760, USA', '<iframe src=\"https://maps.google.com/maps?q=2880%20Broadway,%20New%20York&t=&z=13&ie=UTF8&iwloc=&output=embed\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\"></iframe>', 'GalaxyGo', 'GalaxyGo', 'GalaxyGo', 'GalaxyGo', 15000, 1, 1, 1, '2021-06-02 00:26:39', '2021-08-13 19:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `correlationid` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `build` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payerid` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currencycode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `invoice_no` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tran_date` datetime DEFAULT NULL,
  `payment_type` enum('paypal','point') COLLATE utf8mb4_unicode_ci DEFAULT 'paypal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `correlationid`, `build`, `email`, `payerid`, `firstname`, `lastname`, `currencycode`, `amount`, `invoice_no`, `tran_date`, `payment_type`, `created_at`, `updated_at`) VALUES
(1, 1, '400bf434c6131', '55890594', 'sb-phakv7066915@personal.example.com', 'BD6FQF6LTWVLA', 'John', 'Doe', 'USD', 70.00, '00000001', '2021-08-08 04:11:29', 'paypal', '2021-08-08 10:11:30', '2021-08-08 10:11:30'),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 160.00, '00000002', '2021-08-08 04:52:37', 'point', '2021-08-08 10:52:37', '2021-08-08 10:52:37'),
(3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 130.00, '00000003', '2021-08-08 04:53:44', 'point', '2021-08-08 10:53:44', '2021-08-08 10:53:44'),
(4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 230.00, '00000004', '2021-08-08 05:56:25', 'point', '2021-08-08 11:56:25', '2021-08-08 11:56:25'),
(5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 130.00, '00000005', '2021-08-08 06:01:20', 'point', '2021-08-08 12:01:20', '2021-08-08 12:01:20'),
(6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 130.00, '00000006', '2021-08-08 06:02:16', 'point', '2021-08-08 12:02:16', '2021-08-08 12:02:16'),
(7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 130.00, '00000007', '2021-08-08 06:02:59', 'point', '2021-08-08 12:02:59', '2021-08-08 12:02:59'),
(8, 8, 'a9d07abee55fa', '55890594', 'sb-phakv7066915@personal.example.com', 'BD6FQF6LTWVLA', 'John', 'Doe', 'USD', 300.00, '00000008', '2021-08-08 06:53:02', 'paypal', '2021-08-08 12:53:01', '2021-08-08 12:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `contact_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_coin` decimal(14,2) NOT NULL DEFAULT 0.00,
  `current_coin` decimal(14,2) NOT NULL DEFAULT 0.00,
  `withdraw` decimal(14,2) NOT NULL DEFAULT 0.00,
  `shipping_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_adrress_line_1` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_adrress_line_2` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `shipping_post_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `last_name`, `email`, `email_verified_at`, `contact_no`, `photo`, `password`, `lastLoginTime`, `provider`, `provider_id`, `total_coin`, `current_coin`, `withdraw`, `shipping_first_name`, `shipping_last_name`, `shipping_email`, `shipping_company_name`, `shipping_adrress_line_1`, `shipping_adrress_line_2`, `shipping_city`, `shipping_country`, `shipping_post_code`, `shipping_phone`, `status`, `deleted_at`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', NULL, 'admin@email.com', NULL, '01682234164', 'upload/portfolio-pic/yrVXGUlsb6sRYH2FyM2H.jpg', '$2y$10$m4ZSPJRaz3C7chseDTpqCub3ZeN4Pn4IRfXFiifnbYN21hkP.4hbm', '2021-08-13 22:21:36', NULL, NULL, '0.00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'ZyJgxhVME79oElyeomNgL2BxM0UkfV9Fkk7ImhEsG7R2X7JwYlxTOfJwiEhY', 1, 1, '2020-01-18 04:14:02', '2021-08-13 16:21:36'),
(23, 0, 'Md Miraj Khandaker', NULL, 'mirajkhandaker@yahoo.com', NULL, '2B9Z21080828', 'https://graph.facebook.com/v3.3/4602665283111962/picture?type=normal', NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2021-08-08 12:45:35', '2021-08-08 12:45:35'),
(24, 0, 'user', NULL, 'user@email.com', NULL, 'qMlP21080821', NULL, '$2y$10$WVZ.mSKKjKFnmOzxajBT8euAiBHCfd4ulE7P/U3kLQf3rH0Pb088S', '2021-08-13 22:18:41', NULL, NULL, '0.00', '0.00', '0.00', 'user', 'Lara', 'user@email.com', 'Wong and Ferguson Inc', 'Irure reprehenderit', 'Reprehenderit et qu', 'Non earum nihil ea i', 3, '70312', '7034954485', 1, NULL, NULL, NULL, 24, '2021-08-08 12:46:18', '2021-08-13 16:18:41'),
(25, 0, 'user2', NULL, 'user2@email.com', NULL, 'Vz3G21081174', NULL, '$2y$10$CDaqSsMl6O9pd8HKFsl9WupxQgSVVD1UV4iw60gRqMCCMAsHYsUDG', '2021-08-13 20:03:42', NULL, NULL, '1100.00', '1100.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 25, '2021-08-11 16:33:38', '2021-08-13 14:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `win_coins`
--

CREATE TABLE `win_coins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `win` int(11) NOT NULL,
  `out_of` int(11) NOT NULL,
  `coin` int(11) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `win_coins`
--

INSERT INTO `win_coins` (`id`, `win`, `out_of`, `coin`, `created_by`, `updated_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 9, 10, 10000, 1, 1, 1, NULL, '2021-08-09 22:42:43', '2021-08-09 22:42:43'),
(3, 8, 10, 1000, 1, 1, 1, NULL, '2021-08-09 22:43:13', '2021-08-09 22:43:13'),
(4, 7, 10, 500, 1, 1, 1, NULL, '2021-08-09 22:43:45', '2021-08-09 22:43:45'),
(5, 10, 10, 100000, 1, 1, 1, NULL, '2021-08-09 22:53:28', '2021-08-09 22:53:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coin_histories`
--
ALTER TABLE `coin_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contests`
--
ALTER TABLE `contests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contests_name_unique` (`name`);

--
-- Indexes for table `contest_participants`
--
ALTER TABLE `contest_participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contest_players`
--
ALTER TABLE `contest_players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_users`
--
ALTER TABLE `guest_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_to_activities`
--
ALTER TABLE `module_to_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_to_roles`
--
ALTER TABLE `module_to_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_to_users`
--
ALTER TABLE `module_to_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_shipping_addresses`
--
ALTER TABLE `order_shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_pages`
--
ALTER TABLE `other_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_answers`
--
ALTER TABLE `participant_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_bids`
--
ALTER TABLE `product_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_wise_bids`
--
ALTER TABLE `product_wise_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_contact_no_unique` (`contact_no`);

--
-- Indexes for table `win_coins`
--
ALTER TABLE `win_coins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coin_histories`
--
ALTER TABLE `coin_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contests`
--
ALTER TABLE `contests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contest_participants`
--
ALTER TABLE `contest_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contest_players`
--
ALTER TABLE `contest_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest_users`
--
ALTER TABLE `guest_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `module_to_activities`
--
ALTER TABLE `module_to_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `module_to_roles`
--
ALTER TABLE `module_to_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- AUTO_INCREMENT for table `module_to_users`
--
ALTER TABLE `module_to_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_shipping_addresses`
--
ALTER TABLE `order_shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `other_pages`
--
ALTER TABLE `other_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `participant_answers`
--
ALTER TABLE `participant_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_bids`
--
ALTER TABLE `product_bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_wise_bids`
--
ALTER TABLE `product_wise_bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `win_coins`
--
ALTER TABLE `win_coins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
