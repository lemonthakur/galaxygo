-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2021 at 01:39 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galaxy`
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
  `user_type` int(11) DEFAULT NULL COMMENT '0 = user, 1 = guest',
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

INSERT INTO `coin_histories` (`id`, `user_id`, `user_type`, `amount`, `transaction_type`, `earn_expense_type`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0.00', 0, 2, 1, 1, NULL, '2021-09-08 11:10:54', '2021-09-08 11:10:54'),
(2, 1, 1, '10000.00', 0, 2, 1, 1, NULL, '2021-09-08 11:17:05', '2021-09-08 11:17:05');

-- --------------------------------------------------------

--
-- Table structure for table `contests`
--

CREATE TABLE `contests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_start` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_end` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `contests` (`id`, `name`, `time_start`, `time_end`, `is_final_answer`, `created_by`, `updated_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '2021-08-14', NULL, '2021-08-14 08:44 PM', 0, 1, 1, 1, NULL, '2021-07-24 01:46:04', '2021-08-15 12:49:42'),
(2, '2021-07-30', NULL, '2021-07-30 6:04 PM', 0, 1, 1, 1, NULL, '2021-07-24 04:04:53', '2021-08-15 12:49:54'),
(3, '2021-08-15', NULL, '2021-08-15 04:34 PM', 0, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:17'),
(4, '2021-08-18', '2021-08-18 01:53 PM', '2021-08-18 07:33 PM', 1, 1, 1, 1, NULL, '2021-08-18 14:56:16', '2021-09-08 02:59:49'),
(8, '2020-09-20', '2020-09-20 02:37 PM', '2020-09-20 04:37 PM', 0, 1, 1, 1, NULL, '2021-09-08 01:37:52', '2021-09-08 01:37:52'),
(9, '2021-09-08', '2021-09-08 04:05 PM', '2021-09-08 05:16 PM', 1, 1, 1, 1, NULL, '2021-09-08 01:40:59', '2021-09-08 11:15:54');

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
(2, 1, 1, 9, 10, 10000, 1, '2021-09-08 11:15:22', '2021-09-08 11:17:05');

-- --------------------------------------------------------

--
-- Table structure for table `contest_players`
--

CREATE TABLE `contest_players` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contest_id` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `player_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `played_on` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `versus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` double(10,2) NOT NULL,
  `answer` int(11) NOT NULL DEFAULT 0 COMMENT '0=no answer,1=under,2=over',
  `final_score` float(10,2) DEFAULT NULL,
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

INSERT INTO `contest_players` (`id`, `contest_id`, `player_id`, `player_name`, `player_image`, `location`, `played_on`, `versus`, `score`, `answer`, `final_score`, `created_by`, `updated_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'Lemon', 'upload/player-pic/ejmdfEiko4KeMC6AEjBq210724.jpg', 'Thakur', NULL, 'Versus', 4555.00, 1, NULL, 1, 1, 1, NULL, '2021-07-24 01:46:04', '2021-08-15 12:49:42'),
(2, 1, 0, 'Lemo', 'upload/player-pic/gpGi4OlGID476pPyTnvI.jpg', 'city', NULL, '332222', 65555.00, 1, NULL, 1, 1, 1, NULL, '2021-07-24 01:47:15', '2021-08-15 12:49:42'),
(3, 2, 0, 'Thakur', 'upload/player-pic/n0EixSI4cLAz3vZ16er7210724.jpg', 'Sylhet', NULL, '332222', 5555.00, 1, NULL, 1, 1, 1, NULL, '2021-07-24 04:04:53', '2021-08-15 12:49:54'),
(4, 3, 0, 'Tate Ward', 'upload/player-pic/4TfZ9qG0CWuDrRtCVgfP210815.jpg', 'Accusamus odio sint', NULL, 'Enim dignissimos ut', 97.00, 2, NULL, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:17'),
(5, 3, 0, 'Maxine Holmes', 'upload/player-pic/OVGqPbOFZaqjJMiAL8HA210815.jpg', 'Et sint dolore non', NULL, 'Consequatur ipsum', 15.00, 2, NULL, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:17'),
(6, 3, 0, 'Hector Melton', 'upload/player-pic/8T50lhCHOtc5VZCepiAm210815.jpg', 'Architecto iste ut r', NULL, 'Numquam et fugiat r', 2.00, 2, NULL, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:17'),
(7, 3, 0, 'Aiko Newton', 'upload/player-pic/DDUXINRqICtVxfdMmXtO210815.jpg', 'Nesciunt aut corrup', NULL, 'Nulla quia voluptas', 95.00, 2, NULL, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:17'),
(8, 3, 0, 'Kalia Burnett', 'upload/player-pic/cRlwPRffPzTYAmHdjiki210815.jpg', 'Pariatur In vero er', NULL, 'Proident fuga Ipsa', 64.00, 2, NULL, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:17'),
(9, 3, 0, 'Audra Hobbs', 'upload/player-pic/nitCOg9rBDGCH3TUOSZs210815.jpg', 'Aliqua Consequuntur', NULL, 'Magnam reiciendis vo', 70.00, 2, NULL, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:17'),
(10, 3, 0, 'Angela Beasley', 'upload/player-pic/Bsv5wenwBkDDi3CyNJTx210815.jpg', 'Dolores cumque ipsa', NULL, 'Hic eum est aut neq', 61.00, 2, NULL, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:17'),
(11, 3, 0, 'Ivana Freeman', 'upload/player-pic/DNWArylYVRZYs6WBfuhJ210815.jpg', 'Eveniet eius volupt', NULL, 'Vel aut aliquid mini', 33.00, 2, NULL, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:17'),
(12, 3, 0, 'Carl Roy', 'upload/player-pic/rexmwMiG2PGS9wRm9PAU210815.jpg', 'Quia ex proident co', NULL, 'Dolores consequuntur', 94.00, 2, NULL, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:17'),
(13, 3, 0, 'Hilel Maxwell', 'upload/player-pic/NDViXSHg3QdgVulxokTo210815.jpg', 'Molestiae qui distin', NULL, 'Eum cupidatat saepe', 4.00, 1, NULL, 1, 1, 1, NULL, '2021-08-15 10:09:07', '2021-08-15 10:43:18'),
(14, 4, 0, 'Sigourney Carey', 'upload/player-pic/eDhIvYLF3PTZxnQHtngR210818.jpg', 'Ipsum sed alias sed', NULL, 'Quo ea minima eligen', 18.00, 2, NULL, 1, 1, 1, '2021-09-08 02:35:48', '2021-08-18 14:56:16', '2021-09-08 02:35:48'),
(15, 4, 0, 'Ciaran Hatfield', 'upload/player-pic/orybEWczy1IlRkFu0vul210818.png', 'Est molestiae vel en', NULL, 'Id in quo eum molest', 35.00, 1, NULL, 1, 1, 1, '2021-09-08 02:35:52', '2021-08-18 14:56:16', '2021-09-08 02:35:52'),
(16, 4, 0, 'Wynne Lindsay', 'upload/player-pic/hjVkPohe4XjSUDbWXH3y210818.jpg', 'Assumenda beatae lab', NULL, 'Rem consectetur ani', 40.00, 2, NULL, 1, 1, 1, '2021-09-08 02:35:55', '2021-08-18 14:56:16', '2021-09-08 02:35:55'),
(17, 4, 0, 'Anthony Gould', 'upload/player-pic/sQU3mC654DN93xYWAwpX210818.jpg', 'Temporibus quis enim', NULL, 'Neque culpa deserun', 55.00, 1, NULL, 1, 1, 1, '2021-09-08 02:35:59', '2021-08-18 14:56:16', '2021-09-08 02:35:59'),
(18, 4, 0, 'Eve Schneider', 'upload/player-pic/oTn6eFGVcdh6K2p5MthE.png', 'Officiis beatae qui', NULL, 'Aut sed do pariatur', 67.00, 2, NULL, 1, 1, 1, '2021-09-08 02:36:04', '2021-08-18 15:22:22', '2021-09-08 02:36:04'),
(19, 4, 0, 'Natalie Nielsen', 'upload/player-pic/Ix8vx9KyqIdDERasHA7N.png', 'Perferendis non dolo', NULL, 'Dolor ut reprehender', 63.00, 1, NULL, 1, 1, 1, '2021-09-08 02:36:08', '2021-08-18 15:22:37', '2021-09-08 02:36:08'),
(20, 4, 0, 'Marsden Randall', 'upload/player-pic/NJhtxDVIjYteGNmjkWJJ.png', 'Quam velit id assum', NULL, 'Molestias iure excep', 47.00, 2, NULL, 1, 1, 1, '2021-09-08 02:36:13', '2021-08-18 15:22:48', '2021-09-08 02:36:13'),
(21, 4, 0, 'Maite Love', 'upload/player-pic/I5Hx5SQYmspsER6ZP4TM.png', 'Ut sit molestiae sol', NULL, 'Assumenda dolor cons', 99.00, 1, NULL, 1, 1, 1, '2021-09-08 02:36:18', '2021-08-18 15:23:10', '2021-09-08 02:36:18'),
(22, 4, 0, 'Lacota Cain', 'upload/player-pic/ffeTmRINl8LZoxcHaWkx.png', 'Reprehenderit aliqu', NULL, 'Accusamus necessitat', 84.00, 2, NULL, 1, 1, 1, '2021-09-08 02:36:22', '2021-08-18 15:23:24', '2021-09-08 02:36:22'),
(23, 4, 0, 'Kadeem Sparks', 'upload/player-pic/xjGDaXTcvocPVnyUG4SZ.png', 'Non enim atque simil', NULL, 'Harum possimus ut n', 34.00, 1, NULL, 1, 1, 1, '2021-09-08 02:35:44', '2021-08-18 15:23:34', '2021-09-08 02:35:44'),
(33, 8, 20, 'Aaron Rodgers', 'http://localhost/ml/galaxygo/public/upload/player/210908/f8wkbOj2uR.png', NULL, '2021-09-08 12:54 pm', 'accusantium', 220.00, 0, NULL, 1, 1, 1, NULL, '2021-09-08 01:37:52', '2021-09-08 01:37:52'),
(34, 8, 16, 'Dak Prescott', 'http://localhost/ml/galaxygo/public/upload/player/210908/6SLXDvA1Ut.png', NULL, '2021-09-08 01:00 pm', 'Fuga Nam VS Quis beata', 20.00, 0, NULL, 1, 1, 1, NULL, '2021-09-08 01:37:52', '2021-09-08 01:37:52'),
(35, 8, 21, 'Jalen Hurts', 'http://localhost/ml/galaxygo/public/upload/player/210908/f5DelxvSwl.png', NULL, '2021-09-08 01:05 pm', 'Aperiam VS esciunt al', 85.00, 0, NULL, 1, 1, 1, NULL, '2021-09-08 01:37:52', '2021-09-08 01:37:52'),
(36, 9, 20, 'Aaron Rodgers', 'http://localhost/ml/galaxygo/public/upload/player/210908/f8wkbOj2uR.png', NULL, '2021-09-08 01:39 pm', 'accusantium VS  pr', 40.00, 2, 45.00, 1, 1, 1, NULL, '2021-09-08 01:40:59', '2021-09-08 10:55:32'),
(37, 9, 13, 'Josh Allen', 'http://localhost/ml/galaxygo/public/upload/player/210908/osGE42LJU0.png', NULL, '2021-09-08 01:39 pm', 'Fuga Nam VS quis beata', 89.00, 1, 60.00, 1, 1, 1, NULL, '2021-09-08 01:40:59', '2021-09-08 10:55:32'),
(38, 4, 17, 'Russell Wilson', 'http://localhost/ml/galaxygo/public/upload/player/210908/GKuz4NTqWE.png', NULL, '2021-09-08 02:35 pm', 'In in accusantium pr', 25.00, 2, 30.00, 1, 1, 1, NULL, '2021-09-08 02:35:37', '2021-09-08 02:59:49'),
(39, 4, 12, 'Patrick Mahomes', 'http://localhost/ml/galaxygo/public/upload/player/210908/sOICyZKY65.png', NULL, '2021-09-08 02:36 pm', 'Fuga Nam quis beata', 85.00, 1, 80.00, 1, 1, 1, NULL, '2021-09-08 02:37:02', '2021-09-08 02:59:49'),
(40, 4, 13, 'Josh Allen', 'http://localhost/ml/galaxygo/public/upload/player/210908/osGE42LJU0.png', NULL, '2021-09-08 02:37 pm', 'Corporis laboriosam', 99.00, 2, 110.00, 1, 1, 1, NULL, '2021-09-08 02:37:15', '2021-09-08 02:59:49'),
(41, 4, 16, 'Dak Prescott', 'http://localhost/ml/galaxygo/public/upload/player/210908/6SLXDvA1Ut.png', NULL, '2021-09-08 02:37 pm', 'Consectetur id natus', 89.00, 1, 85.00, 1, 1, 1, NULL, '2021-09-08 02:37:28', '2021-09-08 02:59:49'),
(42, 4, 14, 'Lamar Jackson', 'http://localhost/ml/galaxygo/public/upload/player/210908/6yXWQxyDA4.png', NULL, '2021-09-08 02:37 pm', 'Consectetur id natus', 999.00, 2, 1000.00, 1, 1, 1, NULL, '2021-09-08 02:37:52', '2021-09-08 02:59:49'),
(43, 9, 12, 'Patrick Mahomes', 'http://localhost/ml/galaxygo/public/upload/player/210908/sOICyZKY65.png', NULL, '2021-09-08 04:09 pm', 'Fuga Nam quis beata', 85.00, 2, 90.00, 1, 1, 1, NULL, '2021-09-08 10:37:59', '2021-09-08 10:55:32'),
(44, 9, 17, 'Russell Wilson', 'http://localhost/ml/galaxygo/public/upload/player/210908/GKuz4NTqWE.png', NULL, '2021-09-08 04:38 pm', 'Corporis laboriosam', 65.00, 1, 60.00, 1, 1, 1, NULL, '2021-09-08 10:38:17', '2021-09-08 10:55:32'),
(45, 9, 15, 'Kyler Murray', 'http://localhost/ml/galaxygo/public/upload/player/210908/jMT4xdiF7s.png', NULL, '2021-09-08 04:38 pm', 'Aperiam nesciunt al', 52.00, 2, 60.00, 1, 1, 1, NULL, '2021-09-08 10:38:47', '2021-09-08 10:55:32'),
(46, 9, 18, 'Tom Brady', 'http://localhost/ml/galaxygo/public/upload/player/210908/IqxapoCp15.png', NULL, '2021-09-08 04:38 pm', 'Consectetur id natus', 98.00, 1, 80.00, 1, 1, 1, NULL, '2021-09-08 10:39:04', '2021-09-08 10:55:32'),
(47, 9, 14, 'Lamar Jackson', 'http://localhost/ml/galaxygo/public/upload/player/210908/6yXWQxyDA4.png', NULL, '2021-09-09 04:39 pm', 'Exercitationem solut', 95.00, 2, 100.00, 1, 1, 1, NULL, '2021-09-08 10:39:18', '2021-09-08 10:55:32'),
(48, 9, 19, 'Justin Herbert', 'http://localhost/ml/galaxygo/public/upload/player/210908/Lb2HBVPtZ4.png', NULL, '2021-09-08 04:39 pm', 'Exercitationem solut', 96.00, 1, 90.00, 1, 1, 1, NULL, '2021-09-08 10:39:50', '2021-09-08 10:55:32'),
(49, 9, 20, 'Aaron Rodgers', 'http://localhost/ml/galaxygo/public/upload/player/210908/f8wkbOj2uR.png', NULL, '2021-09-08 04:39 pm', 'In in accusantium pr', 96.00, 2, 99.00, 1, 1, 1, NULL, '2021-09-08 10:40:03', '2021-09-08 10:55:32'),
(50, 9, 18, 'Tom Brady', 'http://localhost/ml/galaxygo/public/upload/player/210908/IqxapoCp15.png', NULL, '2021-09-08 04:40 pm', 'Fuga Nam quis beata', 50.00, 1, 40.00, 1, 1, 1, NULL, '2021-09-08 10:40:27', '2021-09-08 10:55:32');

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
-- Table structure for table `facebook_shares`
--

CREATE TABLE `facebook_shares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` tinyint(2) DEFAULT 0 COMMENT '0 = user, 1 = guest',
  `share_date` date DEFAULT NULL,
  `share_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facebook_shares`
--

INSERT INTO `facebook_shares` (`id`, `user_id`, `user_type`, `share_date`, `share_time`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '2021-08-14', '22:35:29', '2021-08-14 16:35:29', '2021-08-14 16:35:29');

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
-- Table structure for table `footer_circle_images`
--

CREATE TABLE `footer_circle_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_serial` int(11) DEFAULT NULL,
  `image_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_circle_images`
--

INSERT INTO `footer_circle_images` (`id`, `title`, `link`, `order_serial`, `image_name`, `status`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Tesr services', 'link nay', 1, 'upload/footer-circle-image/L58vkJjEl3mF5iCOB7ap.jpg', 1, NULL, 1, 1, '2021-08-13 14:06:33', '2021-08-13 14:06:33');

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
(1, 'D0-37-45-D8-1B-20', '10000.00', '10000.00', '0.00', '2021-09-08 03:41:38', '2021-09-08 11:17:05');

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
(46, '2021_08_06_121217_add_for_social_login_column_in_users_table', 6),
(47, '2021_08_08_153041_create_coin_histories_table', 7),
(48, '2021_08_10_201006_create_contest_participants_table', 8),
(49, '2021_08_10_201043_create_participant_answers_table', 9),
(50, '2021_08_10_225242_create_guest_users_table', 10),
(51, '2021_08_11_102645_add_column_played_on_in_contest_players', 11),
(52, '2021_08_11_214151_add_column_participant_type_in_participant_answers', 11),
(53, '2021_08_13_222223_create_about_us_table', 12),
(54, '2021_08_13_234507_create_other_pages_table', 13),
(55, '2021_08_14_002701_add_column_address_in_site_settings', 14),
(56, '2021_08_14_172522_add_column_cover_photo_and_paypal_email_in_users', 15),
(57, '2021_08_14_211010_create_withdraw_requests_table', 16),
(58, '2021_09_06_205830_create_players_table', 16);

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
  `total_quantity` int(11) DEFAULT NULL,
  `subtotal` double NOT NULL,
  `discount` double DEFAULT NULL,
  `vat_tax` double NOT NULL,
  `delivery_charge` double NOT NULL,
  `total` double NOT NULL,
  `payment_type` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tran_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` enum('general','auction') COLLATE utf8mb4_unicode_ci DEFAULT 'general',
  `status` enum('Pending','Fulfilment','Cancle') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending' COMMENT '1=pending,2=processing,3=complete,4=on holod,5=cancel',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `shipping_address_id`, `total_quantity`, `subtotal`, `discount`, `vat_tax`, `delivery_charge`, `total`, `payment_type`, `tran_id`, `order_type`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 14, 18, NULL, 70, 0, 14.7, 500, 84.7, 'PayPal', '00000001', 'general', 'Fulfilment', 14, 14, '2021-08-08 10:11:30', '2021-08-08 10:11:30'),
(2, 14, 18, NULL, 100, 0, 21, 60, 181, 'Point', '00000002', 'general', 'Cancle', 14, 14, '2021-08-08 10:52:37', '2021-08-08 10:52:37'),
(3, 14, 18, NULL, 70, 0, 14.7, 60, 144.7, 'Point', '00000003', 'general', 'Pending', 14, 14, '2021-08-08 10:53:44', '2021-08-08 10:53:44'),
(4, 17, 18, NULL, 70, 0, 14.7, 60, 144.7, 'Point', '00000004', 'general', 'Pending', 17, 17, '2021-08-08 12:42:49', '2021-08-08 12:42:49'),
(5, 17, 18, NULL, 70, 0, 14.7, 60, 144.7, 'Point', '00000005', 'general', 'Pending', 17, 17, '2021-08-08 12:43:30', '2021-08-08 12:43:30'),
(6, 19, 18, NULL, 170, 0, 35.7, 0, 205.7, 'PayPal', '00000006', 'general', 'Pending', 19, 19, '2021-08-10 05:50:13', '2021-08-10 05:50:13'),
(7, 19, 18, NULL, 100, 0, 21, 0, 121, 'PayPal', '00000007', 'general', 'Pending', 19, 19, '2021-08-10 06:05:10', '2021-08-10 06:05:10'),
(8, 19, 18, NULL, 900, 0, 0, 10, 910, 'PayPal', '00000007', 'auction', 'Pending', 19, 19, '2021-08-10 06:05:47', '2021-08-10 06:05:47'),
(9, 19, 18, NULL, 900, 0, 0, 10, 910, 'PayPal', '00000009', 'auction', 'Pending', 19, 19, '2021-08-10 06:38:24', '2021-08-10 06:38:24'),
(10, 19, 18, NULL, 900, 0, 0, 10, 910, 'PayPal', '00000010', 'auction', 'Pending', 19, 19, '2021-08-10 07:12:34', '2021-08-10 07:12:34'),
(11, 19, 18, NULL, 40, 0, 8.4, 0, 48.4, 'PayPal', '00000010', 'general', 'Pending', 19, 19, '2021-08-10 07:14:13', '2021-08-10 07:14:13'),
(12, 19, 18, NULL, 900, 0, 0, 60, 960, 'Point', '00000012', 'auction', 'Pending', 19, 19, '2021-08-10 07:31:11', '2021-08-10 07:31:11'),
(13, 17, 18, NULL, 900, 0, 0, 20, 920, 'Point', '00000013', 'auction', 'Pending', 17, 17, '2021-08-10 10:05:44', '2021-08-13 00:05:53'),
(14, 17, 18, NULL, 900, 0, 0, 20, 920, 'PayPal', '00000014', 'auction', 'Fulfilment', 17, 17, '2021-08-10 10:08:23', '2021-08-16 16:11:18'),
(15, 19, 18, NULL, 170, 0, 35.7, 10, 215.7, 'PayPal', '00000014', 'general', 'Pending', 19, 19, '2021-08-10 10:09:47', '2021-08-10 10:09:47'),
(16, 19, 18, NULL, 70, 0, 14.7, 10, 94.7, 'Point', '00000016', 'general', 'Pending', 19, 19, '2021-08-10 10:10:16', '2021-08-10 10:10:16'),
(17, 19, 18, NULL, 390, 0, 81.9, 70, 541.9, 'Point', '00000017', 'general', 'Pending', 19, 19, '2021-08-10 10:20:33', '2021-08-10 10:20:33'),
(18, 19, 18, NULL, 3680, 0, 772.8, 40, 4492.8, 'Point', '00000018', 'general', 'Cancle', 19, 19, '2021-08-11 09:41:05', '2021-08-11 09:41:05'),
(19, 19, 18, NULL, 3100, 0, 0, 0, 3100, 'PayPal', '00000019', 'general', 'Fulfilment', 19, 19, '2021-08-11 09:49:59', '2021-08-11 09:49:59'),
(20, 0, 18, NULL, 0, NULL, 0, 0, 0, '', NULL, 'general', 'Cancle', 0, 0, NULL, NULL),
(21, 19, 18, 1, 100, 0, 0, 0, 100, 'PayPal', '00000020', 'general', 'Pending', 19, 19, '2021-08-12 14:54:16', '2021-08-12 14:54:16'),
(22, 19, 18, 1, 40, 0, 0, 20, 60, 'Point', '00000022', 'general', 'Pending', 19, 19, '2021-08-12 14:55:36', '2021-08-13 00:06:11'),
(23, 19, 18, 1, 70, 0, 0, 10, 80, 'Point', '00000023', 'general', 'Fulfilment', 19, 19, '2021-08-12 15:05:10', '2021-08-13 00:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_wise_bid_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `delivery_charge` double DEFAULT NULL,
  `vat_tax` double(8,2) DEFAULT NULL,
  `total_price` double(8,2) NOT NULL,
  `status` enum('Pending','Fulfilment','Cancle') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending' COMMENT '1=pending,2=processing,3=complete,4=on holod,5=cancel',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `user_id`, `product_id`, `product_wise_bid_id`, `quantity`, `price`, `discount`, `delivery_charge`, `vat_tax`, `total_price`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '1', 14, 9, NULL, 1, 70.00, 0.00, NULL, 14.70, 84.70, 'Pending', 14, 14, '2021-08-08 10:11:30', '2021-08-08 10:11:30'),
(2, '2', 14, 10, NULL, 1, 100.00, 0.00, NULL, 21.00, 121.00, 'Pending', 14, 14, '2021-08-08 10:52:37', '2021-08-08 10:52:37'),
(3, '3', 14, 9, NULL, 1, 70.00, 0.00, NULL, 14.70, 84.70, 'Pending', 14, 14, '2021-08-08 10:53:44', '2021-08-08 10:53:44'),
(4, '4', 17, 9, NULL, 1, 70.00, 0.00, NULL, 14.70, 84.70, 'Pending', 17, 17, '2021-08-08 12:42:49', '2021-08-08 12:42:49'),
(5, '5', 17, 9, NULL, 1, 70.00, 0.00, NULL, 14.70, 84.70, 'Pending', 17, 17, '2021-08-08 12:43:30', '2021-08-08 12:43:30'),
(6, '6', 19, 9, NULL, 1, 70.00, 0.00, NULL, 14.70, 84.70, 'Pending', 19, 19, '2021-08-10 05:50:13', '2021-08-10 05:50:13'),
(7, '6', 19, 10, NULL, 1, 100.00, 0.00, NULL, 21.00, 121.00, 'Pending', 19, 19, '2021-08-10 05:50:13', '2021-08-10 05:50:13'),
(8, '7', 19, 10, NULL, 1, 100.00, 0.00, NULL, 21.00, 121.00, 'Pending', 19, 19, '2021-08-10 06:05:10', '2021-08-10 06:05:10'),
(9, '8', 19, 8, NULL, 1, 900.00, 0.00, NULL, 0.00, 900.00, 'Pending', 19, 19, '2021-08-10 06:05:47', '2021-08-10 06:05:47'),
(10, '9', 19, 8, 2, 1, 900.00, 0.00, NULL, 0.00, 900.00, 'Pending', 19, 19, '2021-08-10 06:38:24', '2021-08-10 06:38:24'),
(11, '10', 19, 8, 2, 1, 900.00, 0.00, NULL, 0.00, 900.00, 'Pending', 19, 19, '2021-08-10 07:12:34', '2021-08-10 07:12:34'),
(12, '11', 19, 8, NULL, 1, 40.00, 0.00, NULL, 8.40, 48.40, 'Pending', 19, 19, '2021-08-10 07:14:13', '2021-08-10 07:14:13'),
(13, '12', 19, 8, 2, 1, 900.00, 0.00, NULL, 0.00, 900.00, 'Pending', 19, 19, '2021-08-10 07:31:11', '2021-08-10 07:31:11'),
(14, '13', 17, 8, 2, 1, 900.00, 0.00, 20, 0.00, 920.00, 'Pending', 17, 17, '2021-08-10 10:05:44', '2021-08-13 00:05:54'),
(15, '14', 17, 8, 2, 1, 900.00, 0.00, 20, 0.00, 920.00, 'Fulfilment', 17, 17, '2021-08-10 10:08:23', '2021-08-16 16:11:18'),
(16, '15', 19, 10, NULL, 1, 100.00, 0.00, 0, 21.00, 121.00, 'Pending', 19, 19, '2021-08-10 10:09:47', '2021-08-10 10:09:47'),
(17, '15', 19, 9, NULL, 1, 70.00, 0.00, 10, 14.70, 94.70, 'Pending', 19, 19, '2021-08-10 10:09:47', '2021-08-10 10:09:47'),
(18, '16', 19, 9, NULL, 1, 70.00, 0.00, 10, 14.70, 94.70, 'Pending', 19, 19, '2021-08-10 10:10:16', '2021-08-10 10:10:16'),
(19, '17', 19, 9, NULL, 5, 70.00, 0.00, 50, 14.70, 473.50, 'Pending', 19, 19, '2021-08-10 10:20:33', '2021-08-10 10:20:33'),
(20, '17', 19, 8, NULL, 1, 40.00, 0.00, 20, 8.40, 68.40, 'Pending', 19, 19, '2021-08-10 10:20:34', '2021-08-10 10:20:34'),
(21, '18', 19, 8, NULL, 2, 40.00, 0.00, 40, 8.40, 136.80, 'Pending', 19, 19, '2021-08-11 09:41:05', '2021-08-11 09:41:05'),
(22, '18', 19, 10, NULL, 36, 100.00, 0.00, 0, 21.00, 4356.00, 'Pending', 19, 19, '2021-08-11 09:41:05', '2021-08-11 09:41:05'),
(23, '19', 19, 10, NULL, 31, 100.00, 0.00, 0, 0.00, 3100.00, 'Pending', 19, 19, '2021-08-11 09:49:59', '2021-08-11 09:49:59'),
(24, '21', 19, 10, NULL, 1, 100.00, 0.00, 0, 0.00, 100.00, 'Pending', 19, 19, '2021-08-12 14:54:16', '2021-08-12 14:54:16'),
(25, '22', 19, 8, NULL, 1, 40.00, 0.00, 20, 0.00, 60.00, 'Pending', 19, 19, '2021-08-12 14:55:36', '2021-08-13 00:06:13'),
(26, '23', 19, 9, NULL, 1, 70.00, 0.00, 10, 0.00, 80.00, 'Fulfilment', 19, 19, '2021-08-12 15:05:11', '2021-08-13 00:07:39');

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
(16, 15, 'Lemon', 'Thakur', 'lemontest@gmail.com', 'Company name', 'Address 1', 'Address 2', 'Dhaka', 1, '4444', '01876354334', 1, 15, 15, '2021-08-08 12:40:28', '2021-08-08 12:40:28'),
(17, 17, 'Heemel', 'Thakur', 'heemle@gmail.com', 'company', 'Address 1', NULL, 'Kabul', 18, '5555', '01876543324', 1, 17, 17, '2021-08-08 12:42:11', '2021-08-08 12:42:11'),
(18, 17, 'Heemel', 'Thakur', 'heemle@gmail.com', 'company', 'Address 1', NULL, 'Kabul', 18, '5555666', '01876543324', 1, 17, 17, '2021-08-08 12:42:33', '2021-08-08 12:42:33'),
(19, 17, 'Heemels', 'Thakur', 'heemle@gmail.com', 'company', 'Address 1', NULL, 'Kabul', 18, '5555666', '01876543324', 1, 17, 17, '2021-08-08 12:46:09', '2021-08-08 12:46:09'),
(20, 19, 'Thakur', 'Lemon', 'thakurlemon@gmail.com', 'Company', 'Address', NULL, 'Dhaka', 18, '56444', '01876543333', 1, 19, 19, '2021-08-08 12:47:52', '2021-08-08 12:47:52');

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
(1, 1, 9, 36, 1, 1, 2, 2, '2021-09-08 10:10:04', '2021-09-08 11:10:54'),
(2, 1, 9, 37, 1, 1, 1, 2, '2021-09-08 10:10:04', '2021-09-08 11:10:54'),
(3, 1, 9, 43, 1, 1, 2, 2, '2021-09-08 10:40:50', '2021-09-08 11:10:54'),
(4, 1, 9, 44, 1, 1, 1, 2, '2021-09-08 10:40:50', '2021-09-08 11:10:54'),
(5, 1, 9, 45, 1, 1, 2, 2, '2021-09-08 10:40:50', '2021-09-08 11:10:54'),
(6, 1, 9, 46, 1, 1, 1, 2, '2021-09-08 10:40:50', '2021-09-08 11:10:54'),
(7, 1, 9, 47, 1, 1, 2, 2, '2021-09-08 10:40:50', '2021-09-08 11:10:54'),
(8, 1, 9, 48, 1, 1, 1, 2, '2021-09-08 10:40:50', '2021-09-08 11:10:54'),
(9, 1, 9, 49, 1, 1, 2, 2, '2021-09-08 10:40:50', '2021-09-08 11:10:54'),
(10, 1, 9, 50, 1, 1, 1, 2, '2021-09-08 10:40:50', '2021-09-08 11:10:54'),
(11, 2, 9, 36, 1, 1, 2, 0, '2021-09-08 11:15:22', '2021-09-08 11:15:22'),
(12, 2, 9, 37, 1, 1, 1, 0, '2021-09-08 11:15:22', '2021-09-08 11:15:22'),
(13, 2, 9, 43, 1, 1, 2, 0, '2021-09-08 11:15:22', '2021-09-08 11:15:22'),
(14, 2, 9, 44, 1, 1, 1, 0, '2021-09-08 11:15:22', '2021-09-08 11:15:22'),
(15, 2, 9, 45, 1, 1, 2, 0, '2021-09-08 11:15:22', '2021-09-08 11:15:22'),
(16, 2, 9, 46, 1, 1, 1, 0, '2021-09-08 11:15:22', '2021-09-08 11:15:22'),
(17, 2, 9, 47, 1, 1, 2, 0, '2021-09-08 11:15:22', '2021-09-08 11:15:22'),
(18, 2, 9, 48, 1, 1, 1, 0, '2021-09-08 11:15:22', '2021-09-08 11:15:22'),
(19, 2, 9, 49, 1, 1, 2, 0, '2021-09-08 11:15:22', '2021-09-08 11:15:22'),
(20, 2, 9, 50, 1, 1, 1, 0, '2021-09-08 11:15:22', '2021-09-08 11:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(12, 'Patrick Mahomes', 'upload/player/210908/sOICyZKY65.png', NULL, '2021-09-08 00:11:05', '2021-09-08 00:30:47'),
(13, 'Josh Allen', 'upload/player/210908/osGE42LJU0.png', NULL, '2021-09-08 00:11:37', '2021-09-08 00:33:21'),
(14, 'Lamar Jackson', 'upload/player/210908/6yXWQxyDA4.png', NULL, '2021-09-08 00:12:19', '2021-09-08 00:31:11'),
(15, 'Kyler Murray', 'upload/player/210908/jMT4xdiF7s.png', NULL, '2021-09-08 00:13:00', '2021-09-08 00:32:49'),
(16, 'Dak Prescott', 'upload/player/210908/6SLXDvA1Ut.png', NULL, '2021-09-08 00:14:36', '2021-09-08 00:14:36'),
(17, 'Russell Wilson', 'upload/player/210908/GKuz4NTqWE.png', NULL, '2021-09-08 00:15:27', '2021-09-08 00:15:27'),
(18, 'Tom Brady', 'upload/player/210908/IqxapoCp15.png', NULL, '2021-09-08 00:15:59', '2021-09-08 00:15:59'),
(19, 'Justin Herbert', 'upload/player/210908/Lb2HBVPtZ4.png', NULL, '2021-09-08 00:16:33', '2021-09-08 00:16:33'),
(20, 'Aaron Rodgers', 'upload/player/210908/f8wkbOj2uR.png', NULL, '2021-09-08 00:16:58', '2021-09-08 00:16:58'),
(21, 'Jalen Hurts', 'upload/player/210908/f5DelxvSwl.png', NULL, '2021-09-08 00:17:28', '2021-09-08 00:17:28');

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
  `remaining_qty` int(11) DEFAULT NULL,
  `deliver_charge` double DEFAULT NULL,
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

INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `sub_category_id`, `brand_id`, `feature_image`, `galler_images`, `product_type`, `attached_file`, `price`, `discount_amount`, `quantity`, `remaining_qty`, `deliver_charge`, `model_number`, `product_description`, `return_policy`, `pro_meta`, `pro_mt_description`, `video_url`, `featureproduct`, `starting_bid_amount`, `auction_start_date`, `auction_start_time`, `auction_end_date`, `auction_end_time`, `auction_start_date_time`, `auction_end_date_time`, `avg_review`, `status`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(8, 'Product 1', '45455ID', 2, NULL, 1, 'ytgvkWxqvOFVYLXEvHTX.png', '[\"610c5abb7e880product-details-large.png\"]', 'Auction Product', NULL, 50, 10, NULL, -1, 20, NULL, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>', '<p>Return plicy</p>', 'Meta', 'Meta discritpion', NULL, 'yes', 40, '2021-08-05', '09:30:00', '2021-08-15', '11:59:00', '2021-08-05 03:30:00', '2021-08-15 05:59:00', 0.00, 0, NULL, 1, 1, '2021-08-05 15:19:40', '2021-08-16 16:11:18'),
(9, 'product 2', 'product-2-5880', 2, NULL, 2, 'd38reOkhGAJasjHq7KpG.png', NULL, 'General Product', NULL, 70, NULL, 100, 68, 10, 'eeee555ID', '<p>Product dEscritpion</p>', '<p>Return plicy</p>', NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, 1, 1, '2021-08-05 15:42:57', '2021-08-13 00:07:40'),
(10, 'Prouct 3', 'prouct-3-7928', 2, NULL, 2, 'tgW6WRxeKwyRvxhcQxD1.png', NULL, 'Auction Product', NULL, 100, NULL, NULL, 100, 0, 'E-g33333gtt', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>', NULL, NULL, NULL, NULL, 'yes', 20, '2021-08-05', '20:21:00', '2021-08-09', '20:21:00', '2021-08-05 14:21:00', '2021-08-09 14:21:00', 0.00, 1, NULL, 1, 1, '2021-08-05 15:47:23', '2021-08-10 11:10:50');

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
(1, 8, 2, 19, 700, '2021-08-15', '11:59:00', 17, 17, '2021-08-10 11:25:28', '2021-08-10 11:28:03'),
(2, 8, 2, 19, 800, '2021-08-15', '11:59:00', 19, 19, '2021-08-10 11:27:48', '2021-08-10 11:27:57');

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
  `auction_end_date_time` timestamp NULL DEFAULT NULL,
  `height_bider_id` int(11) DEFAULT NULL,
  `height_bid_amount` double DEFAULT NULL,
  `allow_to_user` enum('yes','no') DEFAULT 'yes',
  `ordered` enum('yes','no') DEFAULT 'no',
  `provied_to_user` enum('yes','no') DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_wise_bids`
--

INSERT INTO `product_wise_bids` (`id`, `product_id`, `starting_bid_amount`, `auction_start_date`, `auction_start_time`, `auction_end_date`, `auction_end_time`, `auction_start_date_time`, `auction_end_date_time`, `height_bider_id`, `height_bid_amount`, `allow_to_user`, `ordered`, `provied_to_user`) VALUES
(1, 10, 20, '2021-08-05 00:00:00', '20:21:00', '2021-08-09', '20:21:00', '2021-08-05 14:21:00', '2021-08-09 14:21:00', NULL, NULL, 'yes', 'no', 'no'),
(2, 8, 40, '2021-08-05 00:00:00', '09:30:00', '2021-08-15', '11:59:00', '2021-08-05 03:30:00', '2021-08-15 05:59:00', 19, 800, 'yes', 'no', 'yes');

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
  `chat_widget` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(765) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(765) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copy_right` varchar(765) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_quantity` int(11) NOT NULL DEFAULT 5,
  `display_unit` int(11) DEFAULT NULL,
  `facebook_share_link` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `logo`, `icon`, `email`, `contact_no`, `address`, `google_map`, `chat_widget`, `site_title`, `meta_description`, `meta_keyword`, `copy_right`, `alert_quantity`, `display_unit`, `facebook_share_link`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'upload/site-setting/qMPDTDFThCSaPSsGUf74.png', 'upload/site-setting/rJ4DcypuQQz0gSm74UXn.png', 'thakurlemon@gmail.com', '01719287734', '', '', '<!--Start of Tawk.to Script--> <script type=\"text/javascript\"> var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date(); (function(){ var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0]; s1.async=true; s1.src=\'https://embed.tawk.to/61191a38649e0a0a5cd13a18/1fd50ss1d\'; s1.charset=\'UTF-8\'; s1.setAttribute(\'crossorigin\',\'*\'); s0.parentNode.insertBefore(s1,s0); })(); </script> <!--End of Tawk.to Script-->', 'Contest', 'Web Embed', 'Inventory', 'Contest', 15000, 1, 'https://galaxygo.duckbd.com/admin-login', 1, 1, '2021-06-02 00:26:39', '2021-08-15 14:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_black` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_color` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_label` varchar(58) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_serial` int(11) DEFAULT NULL,
  `slider_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title_black`, `title_color`, `description`, `button_label`, `link`, `order_serial`, `slider_name`, `status`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 'Fashionss', 'Men shoes', 'Filler text is text that shares some characteristics of a real written text, \r\nbut is random or otherwise', 'Buy now', 'facebook.com', 1, 'upload/slider-image/E5a1Z8LUXl5mSK7Q1hxl.png', 1, '2021-08-13 12:56:02', 1, 1, '2021-08-13 12:44:15', '2021-08-13 12:56:02'),
(4, 'Fashion', 'Men shoes', 'Filler text is text that shares some characteristics of a real written text, \r\nbut is random or otherwise', 'Buy now', 'https://www.w3schools.com/php/func_string_nl2br.asp', 1, 'upload/slider-image/iLf5CDcjG0FpEbgETv6J.png', 1, NULL, 1, 1, '2021-08-13 12:56:37', '2021-08-13 12:59:48');

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
(4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 130.00, '00000004', '2021-08-08 06:42:49', 'point', '2021-08-08 12:42:49', '2021-08-08 12:42:49'),
(5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 130.00, '00000005', '2021-08-08 06:43:30', 'point', '2021-08-08 12:43:30', '2021-08-08 12:43:30'),
(6, 6, 'd2ba13b451b45', '55890594', 'sb-jgyeu2645768@personal.example.com', '5B659UKFB2MAN', 'John', 'Doe', 'USD', 190.00, '00000006', '2021-08-10 11:50:13', 'paypal', '2021-08-10 05:50:13', '2021-08-10 05:50:13'),
(7, 7, '1f575a5ad72a0', '55890594', 'sb-jgyeu2645768@personal.example.com', '5B659UKFB2MAN', 'John', 'Doe', 'USD', 110.00, '00000007', '2021-08-10 12:05:10', 'paypal', '2021-08-10 06:05:10', '2021-08-10 06:05:10'),
(8, 8, 'a66a538f5e92e', '55890594', 'sb-phakv7066915@personal.example.com', 'BD6FQF6LTWVLA', 'John', 'Doe', 'USD', 910.00, '00000007', '2021-08-10 12:05:48', 'paypal', '2021-08-10 06:05:47', '2021-08-10 06:05:47'),
(9, 9, 'a407a357ecee9', '55890594', 'sb-phakv7066915@personal.example.com', 'BD6FQF6LTWVLA', 'John', 'Doe', 'USD', 910.00, '00000009', '2021-08-10 12:38:24', 'paypal', '2021-08-10 06:38:24', '2021-08-10 06:38:24'),
(10, 10, '1a11332306a25', '55890594', 'sb-phakv7066915@personal.example.com', 'BD6FQF6LTWVLA', 'John', 'Doe', 'USD', 910.00, '00000010', '2021-08-10 01:12:34', 'paypal', '2021-08-10 07:12:34', '2021-08-10 07:12:34'),
(11, 11, '614cfd478b6d4', '55890594', 'sb-jgyeu2645768@personal.example.com', '5B659UKFB2MAN', 'John', 'Doe', 'USD', 50.00, '00000010', '2021-08-10 01:14:13', 'paypal', '2021-08-10 07:14:13', '2021-08-10 07:14:13'),
(12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 960.00, '00000012', '2021-08-10 01:31:11', 'point', '2021-08-10 07:31:11', '2021-08-10 07:31:11'),
(13, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 920.00, '00000013', '2021-08-10 04:05:44', 'point', '2021-08-10 10:05:44', '2021-08-10 10:05:44'),
(14, 14, 'dc5eea16901c1', '55890594', 'sb-jgyeu2645768@personal.example.com', '5B659UKFB2MAN', 'John', 'Doe', 'USD', 920.00, '00000014', '2021-08-10 04:08:23', 'paypal', '2021-08-10 10:08:23', '2021-08-10 10:08:23'),
(15, 15, 'af4f3e2022df8', '55890594', 'sb-phakv7066915@personal.example.com', 'BD6FQF6LTWVLA', 'John', 'Doe', 'USD', 180.00, '00000014', '2021-08-10 04:09:48', 'paypal', '2021-08-10 10:09:47', '2021-08-10 10:09:47'),
(16, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, '00000016', '2021-08-10 04:10:16', 'point', '2021-08-10 10:10:16', '2021-08-10 10:10:16'),
(17, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 460.00, '00000017', '2021-08-10 04:20:34', 'point', '2021-08-10 10:20:34', '2021-08-10 10:20:34'),
(18, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3720.00, '00000018', '2021-08-11 03:41:06', 'point', '2021-08-11 09:41:06', '2021-08-11 09:41:06'),
(19, 19, 'cb3a33b118edf', '55890594', 'sb-phakv7066915@personal.example.com', 'BD6FQF6LTWVLA', 'John', 'Doe', 'USD', 3100.00, '00000019', '2021-08-11 03:49:59', 'paypal', '2021-08-11 09:49:59', '2021-08-11 09:49:59'),
(20, 21, 'e1813138f18ef', '55890594', 'sb-phakv7066915@personal.example.com', 'BD6FQF6LTWVLA', 'John', 'Doe', 'USD', 100.00, '00000020', '2021-08-12 08:54:16', 'paypal', '2021-08-12 14:54:16', '2021-08-12 14:54:16'),
(21, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, '00000022', '2021-08-12 08:55:36', 'point', '2021-08-12 14:55:36', '2021-08-12 14:55:36'),
(22, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, '00000023', '2021-08-12 09:05:11', 'point', '2021-08-12 15:05:11', '2021-08-12 15:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `contact_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_coin` decimal(14,2) NOT NULL DEFAULT 0.00,
  `current_coin` decimal(14,2) NOT NULL DEFAULT 0.00,
  `withdraw` decimal(14,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
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

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `paypal_email`, `last_name`, `email_verified_at`, `contact_no`, `photo`, `cover_photo`, `password`, `lastLoginTime`, `provider`, `provider_id`, `total_coin`, `current_coin`, `withdraw`, `status`, `shipping_first_name`, `shipping_last_name`, `shipping_email`, `shipping_company_name`, `shipping_adrress_line_1`, `shipping_adrress_line_2`, `shipping_city`, `shipping_country`, `shipping_post_code`, `shipping_phone`, `deleted_at`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@email.com', NULL, NULL, NULL, '01682234164', 'upload/portfolio-pic/yrVXGUlsb6sRYH2FyM2H.jpg', NULL, '$2y$10$m4ZSPJRaz3C7chseDTpqCub3ZeN4Pn4IRfXFiifnbYN21hkP.4hbm', '2021-09-08 05:57:32', NULL, NULL, '0.00', '0.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'caK5IUKeX8hNoNtdMI8RvxknqrffkOeULoMUnhpCyQgukbblhpHfjO8lOzFv', 1, 1, '2020-01-18 04:14:02', '2021-09-07 23:57:32'),
(13, 0, 'Md Miraj Khandaker', 'mirajkhandaker@yahoo.com', NULL, NULL, NULL, 'iVVV21080694', 'https://graph.facebook.com/v3.3/4602665283111962/picture?type=normal', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-06 01:03:02', '2021-08-06 01:03:02'),
(14, 0, 'Size', 'admin@email.comLem', NULL, 'Thakur', NULL, '01876543321', NULL, NULL, '$2y$10$eD/xApwzXROi.kfYW9x81.Cu00JCHx8/Yngy3OyE641i0F0bpAzqe', '2021-08-08 12:34:01', NULL, NULL, '0.00', '0.00', '0.00', 1, 'Size', 'Thakur', 'admin@email.comLem', 'ddddd', 'adddress 1', 'address2', 'sdfghjkl;ss', 18, '333', '01876543321', NULL, NULL, NULL, 14, '2021-08-08 06:04:08', '2021-08-08 06:34:21'),
(15, 0, 'Lemon', 'lemontest@gmail.com', NULL, 'Thakur', NULL, '01876354334', NULL, NULL, '$2y$10$bG4MhPzDp17MNi6J6jlhFe8DHuOozy6717ddypRrJjrFTEMd46c36', NULL, NULL, NULL, '0.00', '0.00', '0.00', 1, 'Lemon', 'Thakur', 'lemontest@gmail.com', 'Company name', 'Address 1', 'Address 2', 'Dhaka', 1, '4444', '01876354334', NULL, NULL, NULL, NULL, '2021-08-08 12:40:28', '2021-08-08 12:40:28'),
(17, 0, 'Heemel', 'heemle@gmail.com', NULL, 'Thakur', NULL, '01876543324', NULL, NULL, '$2y$10$uK1Zk25jFC0ERJzIpXVG8O58l/gvUaxNMa0oXIADcQD6mNy/Xv1Em', '2021-08-14 11:00:41', NULL, NULL, '0.00', '0.00', '0.00', 1, 'Heemels', 'Thakur', 'heemle@gmail.com', 'company', 'Address 1', NULL, 'Kabul', 18, '5555666', '01876543324', NULL, NULL, NULL, 17, '2021-08-08 12:42:11', '2021-08-14 05:00:41'),
(19, 0, 'Thakur', 'thakurlemon@gmail.com', NULL, 'Lemon', NULL, '01876543333', NULL, NULL, '$2y$10$NR/sgPsb2gWgM9k5ly4gwOHU1b6UkM/gCDgo52vg/khVQjpCdKin.', '2021-08-14 11:09:00', NULL, NULL, '0.00', '0.00', '0.00', 1, 'Thakur', 'Lemon', 'thakurlemon@gmail.com', 'Company', 'Address', NULL, 'Dhaka', 18, '56444', '01876543333', NULL, NULL, 18, 18, '2021-08-08 12:47:52', '2021-08-14 05:09:00'),
(20, 0, 'user', 'user@email.com', NULL, NULL, NULL, 'hSUi21081551', 'upload/profile-pic/Qp7G5zIBdJflnEQvcSud.png', 'upload/cover_photo/AirKLWQZrczXfIf5ahUw.jpg', '$2y$10$Tt0R9KkRyvCINBotBSsoW.YczPS8K.0Ddr9GEk0jye0nOIIfA2ukC', '2021-09-08 17:27:29', NULL, NULL, '0.00', '0.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, '2021-08-15 10:29:44', '2021-09-08 11:29:47'),
(27, 0, 'Reuben Jennings', 'gufo@mailinator.com', NULL, NULL, NULL, '78ks21081547', NULL, NULL, '$2y$10$2zjrUwg/KE4hXjGK94DOqOIDj0R/msPtwdiNUPM0oRnhzpVvAI1FO', NULL, NULL, NULL, '0.00', '0.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 27, '2021-08-15 12:26:49', '2021-08-15 12:26:49'),
(28, 0, 'Hadley May', 'fodyzup@mailinator.com', NULL, NULL, NULL, 'ucX821081551', NULL, NULL, '$2y$10$ZWzRrvMJtzWAmR2ltFdSzuCdBW6QKdGBT0z5UvqqB2OW60H3N3mli', NULL, NULL, NULL, '0.00', '0.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-15 12:27:38', '2021-08-15 12:27:38'),
(29, 0, 'user3', 'user3@email.com', NULL, NULL, NULL, 'dUZ021081638', NULL, NULL, '$2y$10$venzZCfGmM9gsWt4GnpKdOsoZy8jcmaahWlK3ITrvyfVLmDIkq9Su', '2021-08-16 00:12:47', NULL, NULL, '0.00', '0.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-15 18:12:15', '2021-08-15 18:12:47'),
(30, 2, 'admin2', 'admin2@email.com', NULL, NULL, NULL, '7034954485', 'upload/portfolio-pic/OxrA57QHZQPCuUZwCOzb.png', NULL, '$2y$10$H5pgea2PIPNydfEoRdWW5urFXsocmcnZEOyrEYvU4altbF9Bu1S.O', NULL, NULL, NULL, '0.00', '0.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2021-08-18 13:53:50', '2021-08-18 13:53:50');

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
(1, 10, 10, 10000, 1, 1, 1, NULL, '2021-09-08 11:12:11', '2021-09-08 11:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `paypal_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `coin_amount` decimal(14,2) NOT NULL,
  `before_withdraw` decimal(14,2) NOT NULL,
  `after_withdraw` decimal(14,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = confirm, 2 = cancel',
  `coin_history_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `facebook_shares`
--
ALTER TABLE `facebook_shares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_circle_images`
--
ALTER TABLE `footer_circle_images`
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
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
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
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contests`
--
ALTER TABLE `contests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contest_participants`
--
ALTER TABLE `contest_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contest_players`
--
ALTER TABLE `contest_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `facebook_shares`
--
ALTER TABLE `facebook_shares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footer_circle_images`
--
ALTER TABLE `footer_circle_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guest_users`
--
ALTER TABLE `guest_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order_shipping_addresses`
--
ALTER TABLE `order_shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `other_pages`
--
ALTER TABLE `other_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participant_answers`
--
ALTER TABLE `participant_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_bids`
--
ALTER TABLE `product_bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `win_coins`
--
ALTER TABLE `win_coins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
