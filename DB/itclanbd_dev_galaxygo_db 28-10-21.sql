-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 28, 2021 at 05:23 PM
-- Server version: 10.6.4-MariaDB-1:10.6.4+maria~focal
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itclanbd_dev_galaxygo_db`
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
(1, 'upload/about-us/NGifR5Xcm9ActNCyzFnw.png', 'About Us', '<p>Galaxy Introduction</p>\r\n<p>You never have to make any deposit, this website is always free to enter contest&nbsp;</p>\r\n<p>You can share on Facebook, you will get a bonus instantly. Share once a day, get bonus each day.</p>\r\n<p>How to play?<br />Guess OVER or UNDER for each player. The more you correct answer you guess, the more you will win.</p>\r\n<p>Can I withdraw my winning?<br />Of course, you can withdraw your winning.</p>\r\n<p>When are Winnings Transferred?<br />Games that have live scoring at Yahoo Fantasy Sports. The winnings are transferred by the end of the day. In case there are any revisions or corrections, the winnings are transferred by the next morning.</p>\r\n<p>Where can I double-check if I have won?<br />You can double-check on Yahoo Fantasy Sports.</p>\r\n<p>What is the closing time of Entry Submission?<br />Entry submissions will be closed when the time set expires.<br />If player or points is posted by a machine error, Galaxy has the right to cancel.</p>\r\n<p>How does Galaxy make money?<br />We sell products on our shopping cart to make money.</p>', 'Visit Our Store', 'https://galaxygo.net/shop', 'https://www.youtube.com/watch?v=dXNr7cRKetQ', 'upload/about-us/Q310ApsZPVjHwNESJc8i.png', 1, 1, '2021-09-21 20:58:02', '2021-10-06 21:37:33');

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
(1, 'Index', 'Index of module', 1, 1, 1, NULL, '2020-01-24 18:52:00', '2020-12-05 15:32:13'),
(2, 'Create', NULL, 1, 1, 1, NULL, '2020-01-24 18:52:10', '2020-01-24 18:52:10'),
(3, 'Edit', NULL, 1, 1, 1, NULL, '2020-01-24 18:52:20', '2020-03-02 21:23:32'),
(4, 'Delete', NULL, 1, 1, 1, NULL, '2020-01-24 18:52:30', '2020-01-24 18:52:30'),
(5, 'Change password', NULL, 1, 1, 1, NULL, '2020-01-24 18:52:39', '2020-01-24 18:52:39'),
(6, 'Password reset', NULL, 1, 1, 1, NULL, '2020-01-24 18:52:50', '2020-01-24 18:52:50'),
(7, 'Print', NULL, 1, 1, 1, NULL, '2020-01-24 18:53:01', '2020-01-24 18:53:01'),
(8, 'Details', NULL, 1, 1, 1, NULL, '2020-01-24 18:53:12', '2020-01-24 18:53:12');

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
(1, 'Samsungs', 1, NULL, 1, 1, '2021-07-23 16:06:09', '2021-07-23 16:22:48'),
(2, 'Samsung', 1, NULL, 1, 1, '2021-07-23 16:10:49', '2021-07-23 16:11:23');

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
(1, 'Category 1', NULL, 'category-1-7170', 1, 1, 1, NULL, '2021-07-23 13:08:37', '2021-07-24 05:20:12'),
(2, 'Category 2', 1, 'category-2-758', 1, 1, 1, NULL, '2021-07-23 13:09:09', '2021-07-24 05:20:20');

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
(1, 31, 0, '5.00', 0, 0, 31, 31, NULL, '2021-09-19 21:28:20', '2021-09-19 21:28:20'),
(2, 32, 0, '5.00', 0, 0, 32, 32, NULL, '2021-09-19 22:14:06', '2021-09-19 22:14:06'),
(3, 2, 1, '5.00', 0, 5, NULL, NULL, NULL, '2021-09-19 22:51:28', '2021-09-19 22:51:28'),
(4, 31, NULL, '5.00', 0, 5, 31, 31, NULL, '2021-09-19 22:56:34', '2021-09-19 22:56:34'),
(5, 2, 1, '5.00', 0, 5, NULL, NULL, NULL, '2021-09-20 02:46:15', '2021-09-20 02:46:15'),
(6, 32, NULL, '5.00', 0, 5, 32, 32, NULL, '2021-09-20 08:05:43', '2021-09-20 08:05:43'),
(7, 32, 0, '0.00', 0, 2, 32, 32, NULL, '2021-09-21 10:19:40', '2021-09-21 10:19:40'),
(8, 5, 1, '500.00', 0, 2, NULL, NULL, NULL, '2021-09-21 19:57:56', '2021-09-21 19:57:56'),
(9, 18, 1, '5.00', 0, 5, NULL, NULL, NULL, '2021-09-21 23:10:37', '2021-09-21 23:10:37'),
(10, 14, 1, '5.00', 0, 5, NULL, NULL, NULL, '2021-09-21 23:11:36', '2021-09-21 23:11:36'),
(11, 32, NULL, '5.00', 0, 5, 32, 32, NULL, '2021-09-22 09:49:07', '2021-09-22 09:49:07'),
(12, 32, 0, '50.00', 0, 2, 32, 32, NULL, '2021-09-22 19:58:19', '2021-09-22 19:58:19'),
(13, 5, 1, '50.00', 0, 2, NULL, NULL, NULL, '2021-09-23 15:59:04', '2021-09-23 15:59:04'),
(14, 32, 0, '0.00', 0, 2, 32, 32, NULL, '2021-09-23 16:29:19', '2021-09-23 16:29:19'),
(15, 32, 0, '50.00', 0, 2, 32, 32, NULL, '2021-09-24 19:13:22', '2021-09-24 19:13:22'),
(16, 5, 1, '500.00', 0, 2, NULL, NULL, NULL, '2021-09-25 18:18:18', '2021-09-25 18:18:18'),
(17, 32, 0, '5000.00', 0, 2, 32, 32, NULL, '2021-09-25 18:40:13', '2021-09-25 18:40:13'),
(18, 3, 1, '0.00', 0, 2, NULL, NULL, NULL, '2021-09-25 18:54:16', '2021-09-25 18:54:16'),
(19, 5, 1, '5000.00', 0, 2, NULL, NULL, NULL, '2021-09-26 17:10:44', '2021-09-26 17:10:44'),
(20, 5, 1, '5000.00', 0, 2, NULL, NULL, NULL, '2021-09-26 17:11:11', '2021-09-26 17:11:11'),
(21, 32, 0, '5000.00', 0, 2, 32, 32, NULL, '2021-09-26 20:58:24', '2021-09-26 20:58:24'),
(22, 3, 1, '0.00', 0, 2, NULL, NULL, NULL, '2021-09-26 23:29:43', '2021-09-26 23:29:43'),
(23, 32, 0, '0.00', 0, 2, 32, 32, NULL, '2021-09-28 13:19:27', '2021-09-28 13:19:27'),
(24, 5, 1, '500.00', 0, 2, NULL, NULL, NULL, '2021-09-29 11:23:16', '2021-09-29 11:23:16'),
(25, 20, 1, '0.00', 0, 2, NULL, NULL, NULL, '2021-09-29 21:45:06', '2021-09-29 21:45:06'),
(26, 32, 0, '5000.00', 0, 2, 32, 32, NULL, '2021-09-29 23:06:42', '2021-09-29 23:06:42'),
(27, 32, 0, '500.00', 0, 2, 32, 32, NULL, '2021-09-29 23:09:19', '2021-09-29 23:09:19'),
(28, 32, 0, '0.00', 0, 2, 32, 32, NULL, '2021-10-01 16:38:36', '2021-10-01 16:38:36'),
(29, 32, 0, '0.00', 0, 2, 32, 32, NULL, '2021-10-01 16:38:59', '2021-10-01 16:38:59'),
(30, 32, 0, '0.00', 0, 2, 32, 32, NULL, '2021-10-01 16:39:25', '2021-10-01 16:39:25'),
(31, 3, 1, '0.00', 0, 2, NULL, NULL, NULL, '2021-10-02 07:42:31', '2021-10-02 07:42:31'),
(32, 32, 0, '0.00', 0, 2, 32, 32, NULL, '2021-10-02 21:43:22', '2021-10-02 21:43:22'),
(33, 3, 1, '0.00', 0, 2, NULL, NULL, NULL, '2021-10-03 10:16:35', '2021-10-03 10:16:35'),
(34, 5, 1, '10.00', 0, 2, NULL, NULL, NULL, '2021-10-04 21:15:38', '2021-10-04 21:15:38'),
(35, 32, 0, '10.00', 0, 2, 32, 32, NULL, '2021-10-06 11:59:58', '2021-10-06 11:59:58'),
(36, 33, 0, '5.00', 0, 0, 33, 33, NULL, '2021-10-13 11:05:11', '2021-10-13 11:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `contests`
--

CREATE TABLE `contests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_start` datetime DEFAULT NULL,
  `time_end` datetime NOT NULL,
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
(2, '2021-09-20', '2021-09-19 22:21:00', '2021-09-20 19:30:00', 1, 1, 1, 1, NULL, '2021-09-19 22:27:41', '2021-09-21 10:16:29'),
(3, '2021-09-21', '2021-09-20 20:43:00', '2021-09-21 20:43:00', 1, 1, 1, 1, NULL, '2021-09-20 20:48:43', '2021-09-22 19:57:38'),
(4, '2021-09-22', '2021-09-21 19:40:00', '2021-09-22 19:40:00', 1, 1, 1, 1, NULL, '2021-09-21 19:42:13', '2021-09-23 16:30:49'),
(5, '2021-09-23', '2021-09-22 19:25:00', '2021-09-23 17:25:00', 1, 1, 1, 1, NULL, '2021-09-22 19:27:14', '2021-09-24 19:12:10'),
(6, '2021-09-24', '2021-09-23 16:06:00', '2021-09-24 18:06:00', 1, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(7, '2021-09-25', '2021-09-24 18:58:00', '2021-09-25 16:58:00', 1, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(8, '2021-09-26', '2021-09-25 16:12:00', '2021-09-26 17:30:00', 1, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(9, '2021-09-27', '2021-09-26 16:58:00', '2021-09-27 17:58:00', 1, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:17'),
(10, '2021-09-28', '2021-09-27 18:05:00', '2021-09-28 19:05:00', 1, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(11, '2021-09-29', '2021-09-28 13:01:00', '2021-09-29 18:01:00', 1, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(12, '2021-09-30', '2021-09-29 13:25:00', '2021-09-30 17:25:00', 1, 1, 1, 1, NULL, '2021-09-29 13:34:09', '2021-10-01 16:36:37'),
(13, '2021-10-01', '2021-09-30 22:13:00', '2021-10-01 17:13:00', 1, 1, 1, 1, NULL, '2021-09-30 22:18:29', '2021-10-02 21:51:27'),
(14, '2021-10-02', '2021-10-01 22:04:00', '2021-10-02 18:04:00', 1, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(15, '2021-10-03', '2021-10-02 20:45:00', '2021-10-03 17:45:00', 1, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(16, '2021-10-04', '2021-10-03 17:31:00', '2021-10-04 17:31:00', 0, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:39:03'),
(17, '2021-10-05', '2021-10-04 21:05:00', '2021-10-05 18:05:00', 0, 1, 1, 1, NULL, '2021-10-04 21:06:04', '2021-10-04 21:06:04'),
(18, '2021-10-06', '2021-10-05 21:36:00', '2021-10-06 17:36:00', 0, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(19, '2021-10-07', '2021-10-06 17:12:00', '2021-10-07 17:25:00', 0, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-05 22:21:00'),
(20, '2021-10-10', '2021-10-07 16:15:00', '2021-10-10 11:15:00', 0, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11');

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
(2, 0, 32, 2, 0, 0, 1, '2021-09-19 23:30:06', '2021-09-21 10:19:40'),
(3, 0, 31, 2, 0, 0, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(4, 1, 5, 2, 9, 500, 1, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(5, 0, 32, 3, 8, 50, 1, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(6, 1, 5, 3, 8, 50, 1, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(7, 0, 32, 4, 9, 500, 1, '2021-09-21 21:19:40', '2021-09-29 23:09:19'),
(8, 1, 9, 4, 0, 0, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(9, 0, 32, 5, 8, 50, 1, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(10, 1, 5, 5, 9, 500, 1, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(11, 0, 32, 6, 10, 5000, 1, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(12, 1, 3, 6, 5, 0, 1, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(13, 1, 5, 6, 10, 5000, 1, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(14, 0, 32, 7, 10, 5000, 1, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(15, 1, 3, 7, 5, 0, 1, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(16, 1, 5, 7, 10, 5000, 1, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(17, 0, 32, 8, 10, 5000, 1, '2021-09-25 18:40:36', '2021-09-29 23:06:42'),
(18, 1, 3, 8, 0, 0, 0, '2021-09-25 18:55:15', '2021-09-25 18:55:15'),
(19, 1, 20, 8, 5, 0, 1, '2021-09-26 04:34:24', '2021-09-29 21:45:06'),
(20, 1, 5, 8, 9, 500, 1, '2021-09-26 08:17:01', '2021-09-29 11:23:16'),
(21, 1, 5, 9, 0, 0, 0, '2021-09-26 20:55:22', '2021-09-26 20:55:22'),
(22, 0, 32, 9, 3, 0, 1, '2021-09-26 20:58:06', '2021-10-01 16:39:25'),
(23, 1, 3, 9, 6, 0, 1, '2021-09-26 23:29:02', '2021-10-02 07:42:31'),
(24, 1, 20, 10, 0, 0, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(25, 0, 32, 10, 2, 0, 1, '2021-09-28 13:14:16', '2021-10-01 16:38:59'),
(26, 0, 32, 11, 3, 0, 1, '2021-09-29 11:25:12', '2021-10-01 16:38:36'),
(27, 1, 5, 11, 0, 0, 0, '2021-09-29 13:23:37', '2021-09-29 13:23:37'),
(28, 1, 20, 12, 0, 0, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(29, 1, 199, 12, 0, 0, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(30, 0, 32, 13, 4, 0, 1, '2021-10-01 16:32:51', '2021-10-02 21:43:22'),
(31, 1, 3, 14, 6, 0, 1, '2021-10-02 07:41:58', '2021-10-03 10:16:35'),
(32, 0, 32, 15, 7, 10, 1, '2021-10-02 21:02:34', '2021-10-06 11:59:58'),
(33, 1, 5, 15, 7, 10, 1, '2021-10-03 09:12:03', '2021-10-04 21:15:38'),
(34, 1, 3, 15, 0, 0, 0, '2021-10-03 10:17:14', '2021-10-03 10:17:14'),
(35, 0, 32, 16, 0, 0, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(36, 0, 32, 18, 0, 0, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(37, 0, 32, 19, 0, 0, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(38, 0, 32, 20, 0, 0, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07');

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
(12, 2, 10, 'Bradley Zimmer', 'https://galaxygo.net/upload/player/210920/AThhckrDTk.png', NULL, '2021-09-20 09:38 am', 'cin vs pit', 6.10, 2, 6.30, 1, 1, 1, NULL, '2021-09-20 09:40:17', '2021-09-21 10:16:29'),
(13, 2, 4, 'Bryan Reynolds', 'https://galaxygo.net/upload/player/210920/fMWUwNrZqL.png', NULL, '2021-09-20 09:40 am', 'cin vs pit', 6.50, 2, 7.20, 1, 1, 1, NULL, '2021-09-20 09:41:17', '2021-09-21 10:16:29'),
(14, 2, 7, 'Franmil Reyes', 'https://galaxygo.net/upload/player/210920/1ZDEh4QNvC.png', NULL, '2021-09-20 09:41 am', 'cin vs pit', 6.30, 2, 7.00, 1, 1, 1, NULL, '2021-09-20 09:41:55', '2021-09-21 10:16:29'),
(15, 2, 13, 'Jared Goff', 'https://galaxygo.net/upload/player/210920/ruiCl3ZvJ0.png', NULL, '2021-09-20 09:41 am', 'gb vs det', 22.00, 2, 25.00, 1, 1, 1, NULL, '2021-09-20 09:42:50', '2021-09-21 10:16:29'),
(16, 2, 12, 'Aaron Rodgers', 'https://galaxygo.net/upload/player/210920/injSk226vj.png', NULL, '2021-09-20 09:42 am', 'gb vs det', 25.00, 2, 26.00, 1, 1, 1, NULL, '2021-09-20 09:43:18', '2021-09-21 10:16:29'),
(17, 2, 3, 'Jonathan India', 'https://galaxygo.net/upload/player/210920/GNeYo9ciWP.png', NULL, '2021-09-20 09:43 am', 'cin vs pit', 6.30, 2, 65.00, 1, 1, 1, NULL, '2021-09-20 09:44:36', '2021-09-21 10:16:29'),
(18, 2, 5, 'Jose Ramirez', 'https://galaxygo.net/upload/player/210920/G1J4haUQAA.png', NULL, '2021-09-20 09:44 am', 'cin vs pit', 5.50, 2, 5.60, 1, 1, 1, NULL, '2021-09-20 09:45:45', '2021-09-21 10:16:29'),
(19, 2, 9, 'Myles Straw', 'https://galaxygo.net/upload/player/210920/JZYBSJ5yKH.png', NULL, '2021-09-20 09:45 am', 'cin vs pit', 5.50, 2, 5.80, 1, 1, 1, NULL, '2021-09-20 09:46:18', '2021-09-21 10:16:29'),
(20, 2, 8, 'Salvador Perez', 'https://galaxygo.net/upload/player/210920/5AAlpmEdgu.png', NULL, '2021-09-20 09:46 am', 'KC vs Cle', 6.50, 2, 7.00, 1, 1, 1, NULL, '2021-09-20 09:47:36', '2021-09-21 10:16:29'),
(21, 2, 6, 'Whit Merrifield', 'https://galaxygo.net/upload/player/210920/ykFWYhpDbz.png', NULL, '2021-09-20 09:47 am', 'KC vs Cle', 6.30, 1, 6.00, 1, 1, 1, NULL, '2021-09-20 09:48:13', '2021-09-21 10:16:29'),
(22, 3, 14, 'Robbie Grossman', 'https://galaxygo.net/upload/player/210920/xWP8PwVSrW.png', NULL, '2021-09-21 08:29 pm', 'det vs cws', 7.50, 2, 8.00, 1, 1, 1, NULL, '2021-09-20 20:48:43', '2021-09-22 19:57:38'),
(23, 3, 10, 'Bradley Zimmer', 'https://galaxygo.net/upload/player/210920/AThhckrDTk.png', NULL, '2021-09-21 08:29 pm', 'cin vs pit', 6.50, 2, 7.00, 1, 1, 1, NULL, '2021-09-20 20:48:43', '2021-09-22 19:57:38'),
(24, 3, 5, 'Jose Ramirez', 'https://galaxygo.net/upload/player/210920/G1J4haUQAA.png', NULL, '2021-09-21 08:29 pm', 'cin vs pit', 6.50, 2, 7.00, 1, 1, 1, NULL, '2021-09-20 20:48:43', '2021-09-22 19:57:38'),
(25, 3, 4, 'Bryan Reynolds', 'https://galaxygo.net/upload/player/210920/fMWUwNrZqL.png', NULL, '2021-09-21 08:29 pm', 'cin vs pit', 6.50, 2, 7.00, 1, 1, 1, NULL, '2021-09-20 20:48:43', '2021-09-22 19:57:38'),
(26, 3, 3, 'Jonathan India', 'https://galaxygo.net/upload/player/210920/GNeYo9ciWP.png', NULL, '2021-09-21 08:43 pm', 'cin vs pit', 6.50, 2, 7.00, 1, 1, 1, NULL, '2021-09-20 20:48:43', '2021-09-22 19:57:38'),
(27, 3, 7, 'Franmil Reyes', 'https://galaxygo.net/upload/player/210920/1ZDEh4QNvC.png', NULL, '2021-09-21 08:43 pm', 'cin vs pit', 6.50, 2, 7.00, 1, 1, 1, NULL, '2021-09-20 20:48:43', '2021-09-22 19:57:38'),
(28, 3, 17, 'Lewis Brinson', 'https://galaxygo.net/upload/player/210920/j8KLnLNq9Z.png', NULL, '2021-09-21 08:43 pm', 'none', 7.50, 2, 8.00, 1, 1, 1, NULL, '2021-09-20 20:48:43', '2021-09-22 19:57:38'),
(29, 3, 15, 'Luis Robert', 'https://galaxygo.net/upload/player/210920/v7qFPQrThm.png', NULL, '2021-09-21 08:43 pm', 'cws vs det', 7.10, 2, 8.00, 1, 1, 1, NULL, '2021-09-20 20:48:43', '2021-09-22 19:57:38'),
(31, 3, 8, 'Salvador Perez', 'https://galaxygo.net/upload/player/210920/5AAlpmEdgu.png', NULL, '2021-09-21 08:43 pm', 'kc vs cle', 6.50, 1, 6.00, 1, 1, 1, NULL, '2021-09-20 20:48:43', '2021-09-22 19:57:38'),
(33, 3, 16, 'Jonathan Schoop', 'https://galaxygo.net/upload/player/210920/qxn9tPP4M0.png', NULL, '2021-09-21 08:52 pm', 'none', 6.50, 1, 6.00, 1, 1, 1, NULL, '2021-09-20 20:53:52', '2021-09-22 19:57:38'),
(34, 4, 18, 'Joey Votto', 'https://galaxygo.net/upload/player/210921/gR7ZIdFczF.png', NULL, '2021-09-22 07:36 pm', 'cin vs pit', 6.50, 1, 6.10, 1, 1, 1, NULL, '2021-09-21 19:42:13', '2021-09-23 16:30:49'),
(35, 4, 19, 'Nick Castellanos', 'https://galaxygo.net/upload/player/210921/SAHLQWGD1F.png', NULL, '2021-09-22 07:40 pm', 'cin vs pit', 7.00, 2, 65.00, 1, 1, 1, NULL, '2021-09-21 19:42:13', '2021-09-23 16:30:49'),
(36, 4, 4, 'Bryan Reynolds', 'https://galaxygo.net/upload/player/210920/fMWUwNrZqL.png', NULL, '2021-09-22 07:42 pm', 'pit vs cin6', 6.50, 1, 6.00, 1, 1, 1, NULL, '2021-09-21 19:43:35', '2021-09-23 16:30:49'),
(37, 4, 3, 'Jonathan India', 'https://galaxygo.net/upload/player/210920/GNeYo9ciWP.png', NULL, '2021-09-22 07:43 pm', 'cin vs pit', 6.50, 1, 5.50, 1, 1, 1, NULL, '2021-09-21 19:44:13', '2021-09-23 16:30:49'),
(38, 4, 20, 'Ke\'Bryan Hayes', 'https://galaxygo.net/upload/player/210921/qlBBbA7X6f.png', NULL, '2021-09-22 07:46 pm', 'cin vs pit', 6.50, 1, 5.70, 1, 1, 1, NULL, '2021-09-21 19:46:34', '2021-09-23 16:30:49'),
(39, 4, 21, 'Yoshitomo Tsutsugo', 'https://galaxygo.net/upload/player/210921/01vQLwVqP8.png', NULL, '2021-09-22 07:47 pm', 'cin vs pit', 5.50, 1, 4.20, 1, 1, 1, NULL, '2021-09-21 19:48:55', '2021-09-23 16:30:49'),
(40, 4, 22, 'Colin Moran', 'https://galaxygo.net/upload/player/210921/FUGXeq5Ou2.png', NULL, '2021-09-22 07:50 pm', 'cin vs pit', 6.10, 1, 4.50, 1, 1, 1, NULL, '2021-09-21 19:51:01', '2021-09-23 16:30:49'),
(41, 4, 15, 'Luis Robert', 'https://galaxygo.net/upload/player/210920/v7qFPQrThm.png', NULL, '2021-09-22 07:52 pm', 'chw vs det', 6.10, 1, 5.80, 1, 1, 1, NULL, '2021-09-21 19:53:22', '2021-09-23 16:30:49'),
(42, 4, 14, 'Robbie Grossman', 'https://galaxygo.net/upload/player/210920/xWP8PwVSrW.png', NULL, '2021-09-22 07:53 pm', 'chw vs det', 6.10, 1, 4.70, 1, 1, 1, NULL, '2021-09-21 19:54:26', '2021-09-23 16:30:49'),
(43, 4, 6, 'Whit Merrifield', 'https://galaxygo.net/upload/player/210920/ykFWYhpDbz.png', NULL, '2021-09-22 07:54 pm', 'KC vs Cle', 7.50, 1, 6.90, 1, 1, 1, NULL, '2021-09-21 19:56:40', '2021-09-23 16:30:49'),
(44, 5, 23, 'Sam Darnold', 'https://galaxygo.net/upload/player/210922/d2UQpfGUwm.png', NULL, '2021-09-23 07:25 pm', 'car vs hou', 18.80, 2, 19.00, 1, 1, 1, NULL, '2021-09-22 19:27:14', '2021-09-24 19:12:10'),
(45, 5, 24, 'Davis Mills', 'https://galaxygo.net/upload/player/210922/Ev6iyVEIC6.png', NULL, '2021-09-23 07:29 pm', 'car vs hou', 13.50, 2, 15.00, 1, 1, 1, NULL, '2021-09-22 19:30:34', '2021-09-24 19:12:10'),
(46, 5, 25, 'Christian McCaffrey', 'https://galaxygo.net/upload/player/210922/or8zrrhxh3.png', NULL, '2021-09-23 07:32 pm', 'car vs hou', 24.20, 1, 14.00, 1, 1, 1, NULL, '2021-09-22 19:33:21', '2021-09-24 19:12:10'),
(47, 5, 26, 'Brandin Cooks', 'https://galaxygo.net/upload/player/210922/Yt8HxFUWvc.png', NULL, '2021-09-23 07:34 pm', 'car vs hou', 15.10, 2, 17.00, 1, 1, 1, NULL, '2021-09-22 19:35:21', '2021-09-24 19:12:10'),
(48, 5, 27, 'D.J. Moore', 'https://galaxygo.net/upload/player/210922/fr70a5rWHG.png', NULL, '2021-09-23 07:36 pm', 'car vs hou', 15.50, 2, 18.00, 1, 1, 1, NULL, '2021-09-22 19:37:28', '2021-09-24 19:12:10'),
(49, 5, 28, 'Mark Ingram II', 'https://galaxygo.net/upload/player/210922/KBeWEHkjmo.png', NULL, '2021-09-23 07:39 pm', 'car vs hou', 7.90, 2, 8.00, 1, 1, 1, NULL, '2021-09-22 19:39:47', '2021-09-24 19:12:10'),
(50, 5, 29, 'Robby Anderson', 'https://galaxygo.net/upload/player/210922/pfgAFI8VNR.png', NULL, '2021-09-23 07:43 pm', 'car vs hou', 11.50, 2, 22.00, 1, 1, 1, NULL, '2021-09-22 19:44:05', '2021-09-24 19:12:10'),
(51, 5, 30, 'Chris Conley', 'https://galaxygo.net/upload/player/210922/gz3KtPpsIE.png', NULL, '2021-09-23 07:47 pm', 'car vs hou', 5.50, 2, 12.00, 1, 1, 1, NULL, '2021-09-22 19:48:44', '2021-09-24 19:12:10'),
(52, 5, 31, 'Terrace Marshall', 'https://galaxygo.net/upload/player/210922/xzbib4AD9e.png', NULL, '2021-09-23 07:50 pm', 'car vs hou', 9.10, 2, 22.00, 1, 1, 1, NULL, '2021-09-22 19:51:05', '2021-09-24 19:12:10'),
(53, 5, 32, 'David Johnson', 'https://galaxygo.net/upload/player/210922/SI86vMD6SL.png', NULL, '2021-09-23 07:52 pm', 'car vs hou', 5.50, 2, 8.00, 1, 1, 1, NULL, '2021-09-22 19:53:19', '2021-09-24 19:12:10'),
(54, 6, 4, 'Bryan Reynolds', 'https://galaxygo.net/upload/player/210920/fMWUwNrZqL.png', NULL, '2021-09-24 04:06 pm', 'pit vs phi', 6.50, 2, 7.00, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(55, 6, 22, 'Colin Moran', 'https://galaxygo.net/upload/player/210921/FUGXeq5Ou2.png', NULL, '2021-09-24 04:06 pm', 'pit vs phi', 5.50, 2, 7.00, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(56, 6, 18, 'Joey Votto', 'https://galaxygo.net/upload/player/210921/gR7ZIdFczF.png', NULL, '2021-09-24 04:06 pm', 'cin vs was', 6.50, 2, 7.00, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(57, 6, 3, 'Jonathan India', 'https://galaxygo.net/upload/player/210920/GNeYo9ciWP.png', NULL, '2021-09-24 04:06 pm', 'cin vs was', 6.10, 2, 7.00, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(58, 6, 8, 'Salvador Perez', 'https://galaxygo.net/upload/player/210920/5AAlpmEdgu.png', NULL, '2021-09-24 04:06 pm', 'kc vs det', 5.70, 2, 7.00, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(59, 6, 19, 'Nick Castellanos', 'https://galaxygo.net/upload/player/210921/SAHLQWGD1F.png', NULL, '2021-09-24 04:06 pm', 'cin vs was', 5.90, 2, 7.00, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(60, 6, 6, 'Whit Merrifield', 'https://galaxygo.net/upload/player/210920/ykFWYhpDbz.png', NULL, '2021-09-24 04:06 pm', 'kc vs det', 6.10, 2, 7.00, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(61, 6, 14, 'Robbie Grossman', 'https://galaxygo.net/upload/player/210920/xWP8PwVSrW.png', NULL, '2021-09-24 04:06 pm', 'kc vs det', 7.50, 2, 8.00, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(62, 6, 9, 'Myles Straw', 'https://galaxygo.net/upload/player/210920/JZYBSJ5yKH.png', NULL, '2021-09-24 04:06 pm', 'cle vs cws', 6.50, 2, 7.00, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(63, 6, 15, 'Luis Robert', 'https://galaxygo.net/upload/player/210920/v7qFPQrThm.png', NULL, '2021-09-24 04:06 pm', 'cle vs cws', 6.10, 2, 7.00, 1, 1, 1, NULL, '2021-09-23 16:25:10', '2021-09-25 18:39:28'),
(73, 7, 38, 'Spencer Sanders', 'https://galaxygo.net/upload/player/210924/2i8dEPeyMi.png', NULL, '2021-09-25 06:58 pm', 'oks vs kst', 18.50, 2, 21.00, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(74, 7, 39, 'TreVeyon Henderson', 'https://galaxygo.net/upload/player/210924/Zr4g8gqge3.png', NULL, '2021-09-25 06:58 pm', 'osu vs akr', 19.00, 2, 21.00, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(75, 7, 40, 'Will Levis', 'https://galaxygo.net/upload/player/210924/sy8wZk3guO.png', NULL, '2021-09-25 06:58 pm', 'ken vs sc', 21.00, 2, 21.00, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(76, 7, 35, 'Spencer Rattler', 'https://galaxygo.net/upload/player/210924/hOhA1L72s3.png', NULL, '2021-09-25 06:58 pm', 'okl vs wvu', 27.00, 2, 31.00, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(77, 7, 33, 'Chris Olave', 'https://galaxygo.net/upload/player/210924/GnAwXk0msM.png', NULL, '2021-09-25 06:58 pm', 'osu vs akr', 22.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(78, 7, 34, 'Garrett Wilson', 'https://galaxygo.net/upload/player/210924/B51xnPCadt.png', NULL, '2021-09-25 06:58 pm', 'osu vs akr', 22.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(79, 7, 36, 'Bryce Young', 'https://galaxygo.net/upload/player/210924/rQauadXod4.png', NULL, '2021-09-25 06:58 pm', 'kst vs oks', 27.00, 2, 32.00, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(80, 7, 41, 'Deuce Vaughn', 'https://galaxygo.net/upload/player/210924/1xZk2qSgMU.png', NULL, '2021-09-25 06:58 pm', 'kst vs oks', 21.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(81, 7, 43, 'Will Howard', 'https://galaxygo.net/upload/player/210924/WlN6fKpGJH.png', NULL, '2021-09-25 06:58 pm', 'kst vs oks', 14.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(82, 7, 37, 'Emory Jones', 'https://galaxygo.net/upload/player/210924/s8o6Z65DMf.png', NULL, '2021-09-25 06:58 pm', 'fla vs ten', 22.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-24 19:04:59', '2021-09-26 17:09:32'),
(83, 8, 65, 'AARON RODGERS', 'https://galaxygo.net/upload/player/210925/nkA4n1eafe.png', NULL, '2021-09-26 04:12 pm', 'gb vs sf', 21.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(84, 8, 45, 'Jimmy Garoppolo', 'https://galaxygo.net/upload/player/210924/TMaBnYOrHz.png', NULL, '2021-09-26 04:12 pm', 'sf vs gb', 18.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(85, 8, 46, 'Aaron Jones', 'https://galaxygo.net/upload/player/210924/7iWiZ0eSJM.png', NULL, '2021-09-26 04:12 pm', 'gb vs sf', 16.50, 2, 22.00, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(86, 8, 47, 'Deebo Samuel', 'https://galaxygo.net/upload/player/210924/rflcipCm5Y.png', NULL, '2021-09-26 04:12 pm', 'sf vs gb', 18.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(87, 8, 48, 'Davante Adams', 'https://galaxygo.net/upload/player/210924/OEem9Elhje.png', NULL, '2021-09-26 04:12 pm', 'gb vs sf', 22.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(88, 8, 49, 'George Kittle', 'https://galaxygo.net/upload/player/210924/vtdrnsGXNI.png', NULL, '2021-09-26 04:12 pm', 'sf vs gb', 16.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(89, 8, 50, 'Robert Tonyan', 'https://galaxygo.net/upload/player/210924/NPHeftj5vY.png', NULL, '2021-09-26 04:12 pm', 'gb vs sf', 8.50, 2, 22.00, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(90, 8, 51, 'Elijah Mitchell', 'https://galaxygo.net/upload/player/210924/GfeZOJDwZ3.jpg', NULL, '2021-09-26 04:12 pm', 'sf vs gb', 12.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(91, 8, 52, 'Marquez Valdes-Scantling', 'https://galaxygo.net/upload/player/210924/e9S5ZPfyuu.png', NULL, '2021-09-26 04:12 pm', 'gb vs sf', 10.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(92, 8, 53, 'Brandon Aiyuk', 'https://galaxygo.net/upload/player/210924/XHEq3g0dzP.png', NULL, '2021-09-26 04:12 pm', 'sf vs gb', 8.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-25 16:23:36', '2021-09-28 13:20:59'),
(93, 9, 54, 'Jalen Hurts', 'https://galaxygo.net/upload/player/210924/5rkaDV9J55.png', NULL, '2021-09-27 04:58 pm', 'phi vs dal', 23.00, 1, 22.00, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:17'),
(94, 9, 55, 'Dak Prescott', 'https://galaxygo.net/upload/player/210924/bFb87PeHHL.png', NULL, '2021-09-27 04:58 pm', 'dal vs phi', 23.00, 2, 24.00, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:17'),
(95, 9, 56, 'Miles Sanders', 'https://galaxygo.net/upload/player/210924/wGvev3pjxI.png', NULL, '2021-09-27 04:58 pm', 'phi vs dal', 14.00, 2, 22.00, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:17'),
(96, 9, 57, 'Amari Cooper', 'https://galaxygo.net/upload/player/210924/xPD94Vk9wz.png', NULL, '2021-09-27 04:58 pm', 'dal vs phi', 18.00, 1, 11.00, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:17'),
(97, 9, 58, 'DeVonta Smith', 'https://galaxygo.net/upload/player/210924/SeSu1e3XLW.png', NULL, '2021-09-27 04:58 pm', 'phi vs dal', 13.00, 1, 11.00, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:17'),
(98, 9, 59, 'CeeDee Lamb', 'https://galaxygo.net/upload/player/210924/DkgNgq7ZLT.png', NULL, '2021-09-27 04:58 am', 'dal vs phi', 18.00, 1, 11.00, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:17'),
(99, 9, 60, 'Jalen Reagor', 'https://galaxygo.net/upload/player/210924/7nMdMscZDz.png', NULL, '2021-09-27 04:58 am', 'phi vs dal', 10.00, 2, 11.00, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:17'),
(100, 9, 61, 'Ezekiel Elliott', 'https://galaxygo.net/upload/player/210924/rdBas8EMDY.png', NULL, '2021-09-27 04:58 am', 'dal vs phi', 13.00, 1, 11.00, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:17'),
(101, 9, 62, 'Dallas Goedert', 'https://galaxygo.net/upload/player/210924/LDqODha8Lk.png', NULL, '2021-09-27 04:58 am', 'phi vs dal', 8.00, 1, 6.00, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:17'),
(102, 9, 44, 'Tony Pollard', 'https://galaxygo.net/upload/player/210924/lqc8Q0eD6b.png', NULL, '2021-09-27 04:58 am', 'dal vs phi', 10.00, 1, 6.00, 1, 1, 1, NULL, '2021-09-26 17:08:06', '2021-10-01 16:34:18'),
(103, 10, 66, 'Pete Alonso', 'https://galaxygo.net/upload/player/210927/QgHvBeHHSU.png', NULL, '2021-09-28 06:05 pm', 'nym vs mia', 6.00, 1, 3.00, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(104, 10, 67, 'Jazz Chisholm', 'https://galaxygo.net/upload/player/210927/MiDvzqBUQT.png', NULL, '2021-09-28 06:05 pm', 'mia vs nym', 5.00, 1, 3.00, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(105, 10, 68, 'Francisco Lindor', 'https://galaxygo.net/upload/player/210927/2nLsR60zpK.png', NULL, '2021-09-28 06:05 pm', 'nym vs mia', 6.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(106, 10, 69, 'Bryan De La Cruz', 'https://galaxygo.net/upload/player/210927/6WI1xidB9V.png', NULL, '2021-09-28 06:05 pm', 'mia vs nym', 5.00, 2, 5.00, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(107, 10, 70, 'Brandon Nimmo', 'https://galaxygo.net/upload/player/210927/AU9dksSUMM.png', NULL, '2021-09-28 06:05 pm', 'nym vs mia', 5.00, 1, 4.00, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(108, 10, 71, 'Lewis Brinson MIA', 'https://galaxygo.net/upload/player/210927/Vtm0qsRVGu.png', NULL, '2021-09-28 06:05 pm', 'mia vs nym', 4.00, 1, 3.00, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(109, 10, 72, 'Frank Schwindel', 'https://galaxygo.net/upload/player/210927/fxaIBzOstw.png', NULL, '2021-09-28 06:05 pm', 'chc vs pit', 7.00, 2, 8.00, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(110, 10, 4, 'Bryan Reynolds', 'https://galaxygo.net/upload/player/210920/fMWUwNrZqL.png', NULL, '2021-09-28 06:05 pm', 'pit vs chc', 7.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(111, 10, 74, 'Ian Happ', 'https://galaxygo.net/upload/player/210927/502jdfsGvz.png', NULL, '2021-09-28 06:05 pm', 'chc vs pit', 7.00, 1, 6.00, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(112, 10, 76, 'Yoshitomo Tsutsugo PIT', 'https://galaxygo.net/upload/player/210927/FH9iq5qgLw.png', NULL, '2021-09-28 06:05 pm', 'pit vs chc', 6.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-27 18:16:27', '2021-10-01 16:35:15'),
(113, 11, 8, 'Salvador Perez KC', 'https://galaxygo.net/upload/player/210920/5AAlpmEdgu.png', NULL, '2021-09-28 01:01 pm', 'KC vs Cle', 6.00, 1, 4.00, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(114, 11, 10, 'Bradley Zimmer CLE', 'https://galaxygo.net/upload/player/210920/AThhckrDTk.png', NULL, '2021-09-28 01:01 pm', 'cle vs kc', 7.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(115, 11, 7, 'Franmil Reyes CLE', 'https://galaxygo.net/upload/player/210920/1ZDEh4QNvC.png', NULL, '2021-09-29 01:01 pm', 'cle vs kc', 6.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(116, 11, 6, 'Whit Merrifield KC', 'https://galaxygo.net/upload/player/210920/ykFWYhpDbz.png', NULL, '2021-09-29 01:01 pm', 'KC vs Cle', 6.00, 1, 4.00, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(117, 11, 5, 'Jose Ramirez CLE', 'https://galaxygo.net/upload/player/210920/G1J4haUQAA.png', NULL, '2021-09-29 01:01 pm', 'cle vs kc', 5.50, 2, 6.00, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(118, 11, 15, 'Luis Robert CWS', 'https://galaxygo.net/upload/player/210920/v7qFPQrThm.png', NULL, '2021-09-29 01:01 pm', 'cws vs cin', 6.00, 2, 6.00, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(119, 11, 3, 'Jonathan India CIN', 'https://galaxygo.net/upload/player/210920/GNeYo9ciWP.png', NULL, '2021-09-29 01:01 pm', 'cin vs cws', 6.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(120, 11, 7, 'Franmil Reyes CLE', 'https://galaxygo.net/upload/player/210920/1ZDEh4QNvC.png', NULL, '2021-09-29 01:01 pm', 'cle vs kc', 5.50, 1, 5.00, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(121, 11, 9, 'Myles Straw CLE', 'https://galaxygo.net/upload/player/210920/JZYBSJ5yKH.png', NULL, '2021-09-29 01:01 pm', 'cle vs kc', 6.50, 1, 6.00, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(122, 11, 19, 'Nick Castellanos CIN', 'https://galaxygo.net/upload/player/210921/SAHLQWGD1F.png', NULL, '2021-09-29 01:01 pm', 'cin vs cws', 6.00, 2, 7.00, 1, 1, 1, NULL, '2021-09-28 13:10:55', '2021-10-01 16:35:53'),
(123, 12, 72, 'Frank Schwindel CHC', 'https://galaxygo.net/upload/player/210927/fxaIBzOstw.png', NULL, '2021-09-30 01:25 pm', 'chc vs pit', 8.00, 1, 6.00, 1, 1, 1, NULL, '2021-09-29 13:34:09', '2021-10-01 16:36:37'),
(124, 12, 4, 'Bryan Reynolds PIT', 'https://galaxygo.net/upload/player/210920/fMWUwNrZqL.png', NULL, '2021-09-30 01:34 pm', 'pit vs chc', 6.00, 2, 6.00, 1, 1, 1, NULL, '2021-09-29 13:35:12', '2021-10-01 16:36:37'),
(125, 12, 22, 'Colin Moran PIT', 'https://galaxygo.net/upload/player/210921/FUGXeq5Ou2.png', NULL, '2021-09-30 01:35 pm', 'pit vs chc', 6.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-29 13:36:12', '2021-10-01 16:36:37'),
(126, 12, 74, 'Ian Happ CHC', 'https://galaxygo.net/upload/player/210927/502jdfsGvz.png', NULL, '2021-09-30 01:36 pm', 'chc vs 7', 7.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-29 13:36:41', '2021-10-01 16:36:37'),
(127, 12, 64, 'Aaron Judge NYY', 'https://galaxygo.net/upload/player/210925/xMHrs38j0z.png', NULL, '2021-09-30 01:36 pm', 'nyy vs tor', 7.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-29 13:38:07', '2021-10-01 16:36:37'),
(128, 12, 68, 'Francisco Lindor NYM', 'https://galaxygo.net/upload/player/210927/2nLsR60zpK.png', NULL, '2021-09-30 01:38 pm', 'nym vs mia', 7.00, 1, 6.00, 1, 1, 1, NULL, '2021-09-29 13:38:41', '2021-10-01 16:36:37'),
(129, 12, 78, 'Shohei Ohtani LAA', 'https://galaxygo.net/upload/player/210929/iLCDaprBkA.png', NULL, '2021-09-30 01:48 pm', 'laa vs tex', 7.00, 2, 7.00, 1, 1, 1, NULL, '2021-09-29 13:49:14', '2021-10-01 16:36:37'),
(130, 12, 80, 'Vladimir Guerrero TOR', 'https://galaxygo.net/upload/player/210929/wdQ95ZNBRA.png', NULL, '2021-09-30 01:49 pm', 'tor vs nyy', 6.00, 2, 7.00, 1, 1, 1, NULL, '2021-09-29 13:50:07', '2021-10-01 16:36:37'),
(131, 12, 79, 'Giancarlo Stanton NYY', 'https://galaxygo.net/upload/player/210929/jTDtIWy01t.png', NULL, '2021-09-30 01:50 pm', 'nyy vs tor', 6.00, 2, 7.00, 1, 1, 1, NULL, '2021-09-29 13:50:38', '2021-10-01 16:36:37'),
(132, 12, 77, 'Anthony Rizzo', 'https://galaxygo.net/upload/player/210929/bzDpaOdaJP.png', NULL, '2021-09-30 01:50 pm', 'nyy vs tor', 6.00, 2, 6.00, 1, 1, 1, NULL, '2021-09-29 13:51:15', '2021-10-01 16:36:37'),
(133, 13, 64, 'Aaron Judge NYY', 'https://galaxygo.net/upload/player/210925/xMHrs38j0z.png', NULL, '2021-10-01 10:13 pm', 'nyy vs tor', 8.00, 2, 11.00, 1, 1, 1, NULL, '2021-09-30 22:18:29', '2021-10-02 21:46:59'),
(134, 13, 80, 'Vladimir Guerrero TOR', 'https://galaxygo.net/upload/player/210929/wdQ95ZNBRA.png', NULL, '2021-10-01 10:13 pm', 'tor vs nyy', 9.00, 2, 11.00, 1, 1, 1, NULL, '2021-09-30 22:18:29', '2021-10-02 21:45:34'),
(135, 13, 79, 'Giancarlo Stanton NYY', 'https://galaxygo.net/upload/player/210929/jTDtIWy01t.png', NULL, '2021-10-01 10:13 pm', 'nyy vs tor', 7.00, 2, 11.00, 1, 1, 1, NULL, '2021-09-30 22:18:29', '2021-10-02 21:46:59'),
(136, 13, 69, 'Bryan De La Cruz MIA', 'https://galaxygo.net/upload/player/210927/6WI1xidB9V.png', NULL, '2021-10-01 10:13 pm', 'mia vs phi', 5.50, 2, 11.00, 1, 1, 1, NULL, '2021-09-30 22:18:29', '2021-10-02 21:46:59'),
(137, 13, 71, 'Lewis Brinson MIA', 'https://galaxygo.net/upload/player/210927/Vtm0qsRVGu.png', NULL, '2021-10-01 10:13 pm', 'mia vs phi', 5.00, 2, 11.00, 1, 1, 1, NULL, '2021-09-30 22:18:29', '2021-10-02 21:46:59'),
(138, 13, 5, 'Jose Ramirez CLE', 'https://galaxygo.net/upload/player/210920/G1J4haUQAA.png', NULL, '2021-10-01 10:23 pm', 'cle vs tex', 9.00, 2, 11.00, 1, 1, 1, NULL, '2021-09-30 22:27:15', '2021-10-02 21:45:34'),
(139, 13, 67, 'Jazz Chisholm MIA', 'https://galaxygo.net/upload/player/210927/MiDvzqBUQT.png', NULL, '2021-10-01 10:27 pm', 'mia vs phi', 5.00, 2, 11.00, 1, 1, 1, NULL, '2021-09-30 22:27:53', '2021-10-02 21:46:59'),
(140, 13, 68, 'Francisco Lindor NYM', 'https://galaxygo.net/upload/player/210927/2nLsR60zpK.png', NULL, '2021-10-01 10:27 pm', 'nym vs atl', 7.00, 2, 11.00, 1, 1, 1, NULL, '2021-09-30 22:28:39', '2021-10-02 21:51:27'),
(141, 13, 66, 'Pete Alonso NYM', 'https://galaxygo.net/upload/player/210927/QgHvBeHHSU.png', NULL, '2021-10-01 10:28 pm', 'nym vs atl', 6.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-30 22:29:15', '2021-10-02 21:41:45'),
(142, 13, 70, 'Brandon Nimmo NYM', 'https://galaxygo.net/upload/player/210927/AU9dksSUMM.png', NULL, '2021-10-01 10:29 pm', 'nym vs atl', 6.00, 1, 5.00, 1, 1, 1, NULL, '2021-09-30 22:29:56', '2021-10-02 21:41:45'),
(143, 14, 81, 'Josh Rojas ARI', 'https://galaxygo.net/upload/player/211001/j1mnTOslZh.png', NULL, '2021-10-02 10:04 pm', 'col vs ari', 7.00, 2, 9.00, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(144, 14, 82, 'Raimel Tapia COL', 'https://galaxygo.net/upload/player/211001/o9DkfiCEo1.png', NULL, '2021-10-02 10:04 pm', 'col vs ari', 7.00, 2, 9.00, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(145, 14, 83, 'David Peralta ARI', 'https://galaxygo.net/upload/player/211001/IldQ2ESwVq.png', NULL, '2021-10-02 10:04 pm', 'ari vs col', 7.50, 2, 9.00, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(146, 14, 84, 'C.J. Cron COL', 'https://galaxygo.net/upload/player/211001/blA3KkdOzV.png', NULL, '2021-10-02 10:04 pm', 'col vs ari', 6.50, 2, 9.00, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(147, 14, 85, 'Kole Calhoun ARI', 'https://galaxygo.net/upload/player/211001/PN3BbDQYmq.png', NULL, '2021-10-02 10:04 pm', 'ari vs col', 7.00, 2, 9.00, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(148, 14, 90, 'Charlie Blackmon COL', 'https://galaxygo.net/upload/player/211001/woQrkPnyuq.png', NULL, '2021-10-02 10:04 pm', 'col vs ari', 6.50, 2, 9.00, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(149, 14, 89, 'Ketel Marte ARI', 'https://galaxygo.net/upload/player/211001/1POECK44It.png', NULL, '2021-10-02 10:04 pm', 'ari vs col', 7.00, 2, 9.00, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(150, 14, 88, 'Trevor Story COL', 'https://galaxygo.net/upload/player/211001/S41U0MUUwZ.png', NULL, '2021-10-02 10:04 pm', 'col vs ari', 7.00, 1, 5.00, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(151, 14, 86, 'Dylan Carlson STL', 'https://galaxygo.net/upload/player/211001/ayL14wCtgv.png', NULL, '2021-10-02 10:04 pm', 'stl vs chc', 7.00, 1, 5.00, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(152, 14, 87, 'Tyler O\'Neill STL', 'https://galaxygo.net/upload/player/211001/UpYYGnYqBT.png', NULL, '2021-10-02 10:04 pm', 'stl vs chc', 7.00, 1, 5.00, 1, 1, 1, NULL, '2021-10-01 22:11:47', '2021-10-02 21:59:12'),
(153, 15, 92, 'Tom Brady', 'https://galaxygo.net/upload/player/211002/5ZDXzTCEyF.png', NULL, '2021-10-03 08:45 pm', 'tb vs ne', 23.00, 1, 22.00, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(154, 15, 93, 'Mac Jones', 'https://galaxygo.net/upload/player/211002/WZJJeMXetR.png', NULL, '2021-10-03 08:45 pm', 'tb vs ne', 17.00, 2, 22.00, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(155, 15, 94, 'Chris Godwin', 'https://galaxygo.net/upload/player/211002/RO477Iw3dP.png', NULL, '2021-10-03 08:45 pm', 'tb vs ne', 17.00, 2, 22.00, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(156, 15, 95, 'Jakobi Meyers', 'https://galaxygo.net/upload/player/211002/ZCbtBoV3Zg.png', NULL, '2021-10-03 08:45 pm', 'tb vs ne', 14.00, 2, 22.00, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(157, 15, 91, 'Mike Evans', 'https://galaxygo.net/upload/player/211002/y0ckqCfJT4.png', NULL, '2021-10-03 08:45 pm', 'tb vs ne', 14.00, 1, 11.00, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(158, 15, 97, 'Nelson Agholor', 'https://galaxygo.net/upload/player/211002/tmoYHt967O.png', NULL, '2021-10-03 08:45 pm', 'ne vs tb', 10.00, 2, 11.00, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(159, 15, 98, 'Kendrick Bourne', 'https://galaxygo.net/upload/player/211002/kJbiWzInEI.png', NULL, '2021-10-03 08:45 pm', 'ne vs tb', 9.00, 2, 11.00, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(160, 15, 99, 'Leonard Fournette', 'https://galaxygo.net/upload/player/211002/Yx6v7Oy9A5.png', NULL, '2021-10-03 08:45 pm', 'tb vs ne', 11.00, 2, 11.00, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(161, 15, 100, 'Damien Harris', 'https://galaxygo.net/upload/player/211002/xe6N5gQt1E.png', NULL, '2021-10-03 08:45 pm', 'tb vs ne', 9.00, 2, 11.00, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(162, 15, 96, 'Derek Carr', 'upload/player/211002/u54AphrqAA.png', NULL, '2021-10-04 08:45 pm', 'lv vs lac', 21.00, 1, 11.00, 1, 1, 1, NULL, '2021-10-02 20:56:39', '2021-10-04 21:14:27'),
(163, 16, 96, 'Derek Carr', 'https://galaxygo.net/upload/player/211002/u54AphrqAA.png', NULL, '2021-10-04 05:17 pm', 'lv vs lac', 21.00, 0, NULL, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:39:03'),
(164, 16, 101, 'Justin Herbert', 'upload/player/211002/4bt5ttDiOc.png', NULL, '2021-10-04 05:31 pm', 'lac vs lv', 23.00, 0, NULL, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:40:19'),
(165, 16, 102, 'Darren Waller', 'https://galaxygo.net/upload/player/211002/o7RC7JjZat.png', NULL, '2021-10-04 05:31 pm', 'lv vs lac', 17.00, 0, NULL, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:39:03'),
(166, 16, 103, 'Keenan Allen', 'https://galaxygo.net/upload/player/211002/8NQC9dtHKo.png', NULL, '2021-10-04 05:31 pm', 'lac vs lv', 18.00, 0, NULL, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:39:03'),
(167, 16, 104, 'Kenyan Drake', 'https://galaxygo.net/upload/player/211002/zWpTZbULUp.png', NULL, '2021-10-04 05:31 pm', 'lv vs lac', 10.00, 0, NULL, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:39:03'),
(168, 16, 105, 'Austin Ekeler', 'https://galaxygo.net/upload/player/211002/m451CvLrR0.png', NULL, '2021-10-04 05:31 pm', 'lac vs lv', 18.00, 0, NULL, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:39:03'),
(169, 16, 106, 'Hunter Renfrow', 'https://galaxygo.net/upload/player/211002/b3hvH43pON.png', NULL, '2021-10-04 05:31 pm', 'lv vs lac', 11.00, 0, NULL, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:39:03'),
(170, 16, 107, 'Mike Williams', 'https://galaxygo.net/upload/player/211002/d7dip6017L.png', NULL, '2021-10-04 05:31 pm', 'lac vs lv', 17.00, 0, NULL, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:39:03'),
(171, 16, 108, 'Henry Ruggs', 'https://galaxygo.net/upload/player/211002/yvDkBbyhk2.png', NULL, '2021-10-04 05:31 pm', 'lv vs lac', 10.00, 0, NULL, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:39:03'),
(172, 16, 109, 'Jared Cook', 'https://galaxygo.net/upload/player/211002/G44IwmqpIl.png', NULL, '2021-10-04 05:31 pm', 'lac vs lv', 8.50, 0, NULL, 1, 1, 1, NULL, '2021-10-02 21:39:03', '2021-10-02 21:39:03'),
(173, 17, 64, 'Aaron Judge NYY', 'https://galaxygo.net/upload/player/210925/xMHrs38j0z.png', NULL, '2021-10-05 05:57 pm', 'nyy vs bos', 7.00, 0, NULL, 1, 1, 1, NULL, '2021-10-04 21:06:04', '2021-10-04 21:06:04'),
(174, 17, 115, 'Rafael Devers BOS', 'https://galaxygo.net/upload/player/211004/eTGhk4OcRn.png', NULL, '2021-10-05 05:57 pm', 'bos vs nyy', 7.00, 0, NULL, 1, 1, 1, NULL, '2021-10-04 21:06:04', '2021-10-04 21:06:04'),
(175, 17, 79, 'Giancarlo Stanton NYY', 'https://galaxygo.net/upload/player/210929/jTDtIWy01t.png', NULL, '2021-10-05 06:06 pm', 'nyy vs bos', 7.00, 0, NULL, 1, 1, 1, NULL, '2021-10-04 21:07:07', '2021-10-04 21:07:07'),
(176, 17, 116, 'Xander Bogaerts', 'https://galaxygo.net/upload/player/211004/6APMOnW7yy.png', NULL, '2021-10-05 09:07 pm', 'bos vs nyy', 6.00, 0, NULL, 1, 1, 1, NULL, '2021-10-04 21:07:58', '2021-10-04 21:07:58'),
(177, 17, 77, 'Anthony Rizzo NYY', 'https://galaxygo.net/upload/player/210929/bzDpaOdaJP.png', NULL, '2021-10-05 06:07 pm', 'nyy vs bos', 6.00, 0, NULL, 1, 1, 1, NULL, '2021-10-04 21:08:45', '2021-10-04 21:08:45'),
(178, 17, 117, 'J.D. Martinez BOS', 'https://galaxygo.net/upload/player/211004/y6xnldtxde.png', NULL, '2021-10-05 09:08 pm', 'bos vs nyy', 6.00, 0, NULL, 1, 1, 1, NULL, '2021-10-04 21:09:21', '2021-10-04 21:09:21'),
(179, 17, 118, 'Joey Gallo NYY', 'https://galaxygo.net/upload/player/211004/EdBPLUuHMV.png', NULL, '2021-10-05 09:09 pm', 'nyy vs bos', 6.00, 0, NULL, 1, 1, 1, NULL, '2021-10-04 21:09:58', '2021-10-04 21:09:58'),
(180, 17, 112, 'Corey Seager LAD', 'https://galaxygo.net/upload/player/211004/wFgHDYig8H.png', NULL, '2021-10-05 09:09 pm', 'lad vs stl', 7.00, 0, NULL, 1, 1, 1, NULL, '2021-10-04 21:11:54', '2021-10-04 21:11:54'),
(181, 17, 111, 'Max Muncy LAD', 'https://galaxygo.net/upload/player/211004/pkxn5RtZsu.png', NULL, '2021-10-05 09:11 pm', 'lad vs stl', 7.00, 0, NULL, 1, 1, 1, NULL, '2021-10-04 21:12:22', '2021-10-04 21:12:22'),
(182, 17, 110, 'Justin Turner LAD', 'https://galaxygo.net/upload/player/211004/TnvGOtb2gv.png', NULL, '2021-10-05 09:12 pm', 'lad vs stl', 7.00, 0, NULL, 1, 1, 1, NULL, '2021-10-04 21:12:47', '2021-10-04 21:12:47'),
(183, 18, 114, 'Paul Goldschmidt STL', 'https://galaxygo.net/upload/player/211004/vqFfQo0gd8.png', NULL, '2021-10-06 09:36 pm', 'stl vs lad', 6.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(184, 18, 113, 'Mookie Betts LAD', 'https://galaxygo.net/upload/player/211004/U0ypDvWiyX.png', NULL, '2021-10-06 09:36 pm', 'lad vs stl', 7.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(185, 18, 112, 'Corey Seager LAD', 'https://galaxygo.net/upload/player/211004/wFgHDYig8H.png', NULL, '2021-10-06 09:36 pm', 'lad vs stl', 7.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(186, 18, 121, 'Trea Turner LAD', 'https://galaxygo.net/upload/player/211005/Bg9YTATQLf.png', NULL, '2021-10-06 09:36 pm', 'lad vs stl', 8.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(187, 18, 120, 'Nolan Arenado STL', 'https://galaxygo.net/upload/player/211005/RwrPau4e6p.png', NULL, '2021-10-06 09:36 pm', 'stl vs lad', 5.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(188, 18, 86, 'Dylan Carlson STL', 'https://galaxygo.net/upload/player/211001/ayL14wCtgv.png', NULL, '2021-10-06 09:36 pm', 'stl vs lad', 5.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(189, 18, 119, 'Tommy Edman STL', 'https://galaxygo.net/upload/player/211005/XiZ2LREACc.png', NULL, '2021-10-06 09:36 pm', 'stl vs lad', 5.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(190, 18, 110, 'Justin Turner LAD', 'https://galaxygo.net/upload/player/211004/TnvGOtb2gv.png', NULL, '2021-10-06 09:36 pm', 'lad vs stl', 6.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(191, 18, 87, 'Tyler O\'Neill STL', 'https://galaxygo.net/upload/player/211001/UpYYGnYqBT.png', NULL, '2021-10-06 09:36 pm', 'stl vs lad', 6.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(192, 18, 111, 'Max Muncy LAD', 'https://galaxygo.net/upload/player/211004/pkxn5RtZsu.png', NULL, '2021-10-06 09:36 pm', 'lad vs stl', 6.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 21:41:10', '2021-10-05 21:41:10'),
(193, 19, 141, 'Matthew Stafford', 'https://galaxygo.net/upload/player/211005/IOYH5U2pzM.png', NULL, '2021-10-07 10:12 pm', 'lar vs sea', 23.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-06 21:20:30'),
(194, 19, 125, 'DK Metcalf', 'https://galaxygo.net/upload/player/211005/hA55w6KE7h.png', NULL, '2021-10-07 10:12 pm', 'sea vs lar', 22.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-05 22:21:00'),
(195, 19, 140, 'Russell Wilson', 'https://galaxygo.net/upload/player/211005/GWridhhefv.png', NULL, '2021-10-07 10:12 pm', 'sea vs lar', 23.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-06 21:20:58'),
(196, 19, 124, 'Cooper Kupp', 'https://galaxygo.net/upload/player/211005/5Qs87D8Xij.png', NULL, '2021-10-07 10:12 pm', 'lar vs sea', 22.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-05 22:21:00'),
(197, 19, 137, 'Robert Woods', 'https://galaxygo.net/upload/player/211005/P6TiWK6I0g.png', NULL, '2021-10-07 10:12 pm', 'lar vs sea', 15.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-06 21:21:58'),
(198, 19, 127, 'Tyler Lockett', 'https://galaxygo.net/upload/player/211005/ILhY2ZTpVR.png', NULL, '2021-10-07 10:12 pm', 'sea vs lar', 16.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-05 22:21:00'),
(199, 19, 128, 'Darrell Henderson', 'https://galaxygo.net/upload/player/211005/phEyWPQKhG.png', NULL, '2021-10-07 10:12 pm', 'lar vs sea', 15.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-05 22:21:00'),
(200, 19, 129, 'Chris Carson', 'https://galaxygo.net/upload/player/211005/q6ZqknoEyq.png', NULL, '2021-10-07 10:12 pm', 'sea vs lar', 13.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-05 22:21:00'),
(201, 19, 130, 'Tyler Higbee', 'https://galaxygo.net/upload/player/211005/zoOiSZQoXZ.png', NULL, '2021-10-07 10:12 pm', 'lar vs sea', 11.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-06 21:23:01'),
(202, 19, 131, 'Gerald Everett', 'https://galaxygo.net/upload/player/211005/ZW01DZ8uDQ.png', NULL, '2021-10-07 10:12 pm', 'sea vs lar', 8.00, 0, NULL, 1, 1, 1, NULL, '2021-10-05 22:21:00', '2021-10-05 22:21:00'),
(203, 20, 65, 'Aaron Rodgers', 'https://galaxygo.net/upload/player/210925/nkA4n1eafe.png', NULL, '2021-10-10 04:15 pm', 'gb vs cin', 23.00, 0, NULL, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11'),
(204, 20, 46, 'Aaron Jones', 'https://galaxygo.net/upload/player/210924/7iWiZ0eSJM.png', NULL, '2021-10-10 04:15 pm', 'gb vs cin', 16.00, 0, NULL, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11'),
(205, 20, 50, 'Robert Tonyan', 'https://galaxygo.net/upload/player/210924/NPHeftj5vY.png', NULL, '2021-10-10 04:15 pm', 'gb vs cin', 9.00, 0, NULL, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11'),
(206, 20, 92, 'Tom Brady', 'https://galaxygo.net/upload/player/211002/5ZDXzTCEyF.png', NULL, '2021-10-10 04:15 pm', 'tb vs mia', 22.00, 0, NULL, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11'),
(207, 20, 91, 'Mike Evans', 'https://galaxygo.net/upload/player/211002/y0ckqCfJT4.png', NULL, '2021-10-10 04:15 pm', 'tb vs mia', 15.00, 0, NULL, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11'),
(208, 20, 99, 'Leonard Fournette', 'https://galaxygo.net/upload/player/211002/Yx6v7Oy9A5.png', NULL, '2021-10-10 04:15 pm', 'tb vs mia', 13.00, 0, NULL, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11'),
(209, 20, 93, 'Mac Jones', 'https://galaxygo.net/upload/player/211002/WZJJeMXetR.png', NULL, '2021-10-10 04:15 pm', 'ne vs hou', 17.00, 0, NULL, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11'),
(210, 20, 103, 'Keenan Allen', 'https://galaxygo.net/upload/player/211002/8NQC9dtHKo.png', NULL, '2021-10-10 04:15 pm', 'lac vs cle', 18.00, 0, NULL, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11'),
(211, 20, 105, 'Austin Ekeler', 'https://galaxygo.net/upload/player/211002/m451CvLrR0.png', NULL, '2021-10-10 04:15 pm', 'lac vs cle', 18.00, 0, NULL, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11'),
(212, 20, 55, 'Dak Prescott', 'https://galaxygo.net/upload/player/210924/bFb87PeHHL.png', NULL, '2021-10-10 04:15 pm', 'dal vs nyg', 22.00, 0, NULL, 1, 1, 1, NULL, '2021-10-07 16:40:11', '2021-10-07 16:40:11');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `facebook_shares`
--

INSERT INTO `facebook_shares` (`id`, `user_id`, `user_type`, `share_date`, `share_time`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2021-09-19', '22:51:28', '2021-09-19 22:51:28', '2021-09-19 22:51:28'),
(2, 31, 0, '2021-09-19', '22:56:34', '2021-09-19 22:56:34', '2021-09-19 22:56:34'),
(3, 2, 1, '2021-09-20', '02:46:15', '2021-09-20 02:46:15', '2021-09-20 02:46:15'),
(4, 32, 0, '2021-09-20', '08:05:43', '2021-09-20 08:05:43', '2021-09-20 08:05:43'),
(5, 18, 1, '2021-09-21', '23:10:37', '2021-09-21 23:10:37', '2021-09-21 23:10:37'),
(6, 14, 1, '2021-09-21', '23:11:36', '2021-09-21 23:11:36', '2021-09-21 23:11:36'),
(7, 32, 0, '2021-09-22', '09:49:07', '2021-09-22 09:49:07', '2021-09-22 09:49:07');

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
(1, 'Tesr services', 'link nay', 1, 'upload/footer-circle-image/L58vkJjEl3mF5iCOB7ap.jpg', 1, '2021-09-20 09:30:05', 1, 1, '2021-08-13 20:06:33', '2021-09-20 09:30:05'),
(2, 'Galaxy coin', 'https://bscscan.com/token/0x0af3eb759f7a88a9429e501e06989a95d1ed8652', 2, 'upload/footer-circle-image/JXJuK3t8eKrMWCbDqxTy.jpg', 1, NULL, 1, 1, '2021-09-20 09:29:57', '2021-09-20 09:37:36'),
(3, 'Draftlords', 'https://www.Draftlords.com', 1, 'upload/footer-circle-image/Fiyz2F5B45OnJQFadmy5.jpg', 1, NULL, 1, 1, '2021-09-20 09:30:57', '2021-09-20 09:30:57');

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
(1, '3C-A0-67-E3-44-6E', '0.00', '0.00', '0.00', '2021-09-19 11:20:26', '2021-09-19 11:20:26'),
(2, '0', '10.00', '10.00', '0.00', '2021-09-19 21:23:49', '2021-09-20 02:46:15'),
(3, 'c6l342cKJ210920', '0.00', '0.00', '0.00', '2021-09-20 11:26:28', '2021-10-03 10:16:35'),
(4, 'gkS864KDn210920', '0.00', '0.00', '0.00', '2021-09-20 11:29:27', '2021-09-20 11:29:27'),
(5, 'PZA2510Ki210920', '11560.00', '11560.00', '0.00', '2021-09-20 11:55:10', '2021-10-04 21:15:38'),
(6, 'Aee984Eg2210920', '0.00', '0.00', '0.00', '2021-09-20 12:48:21', '2021-09-20 12:48:21'),
(7, '6ZF2358Lz210920', '0.00', '0.00', '0.00', '2021-09-20 14:54:19', '2021-09-20 14:54:19'),
(8, 'hFn102cAO210920', '0.00', '0.00', '0.00', '2021-09-20 21:41:43', '2021-09-20 21:41:43'),
(9, 'zaO737qVz210921', '0.00', '0.00', '0.00', '2021-09-21 01:34:22', '2021-09-21 01:34:22'),
(10, 'Lcj37Djd210921', '0.00', '0.00', '0.00', '2021-09-21 08:21:22', '2021-09-21 08:21:22'),
(11, 'AKh757LEH210921', '0.00', '0.00', '0.00', '2021-09-21 19:33:19', '2021-09-21 19:33:19'),
(12, 'sBQ290ZoH210921', '0.00', '0.00', '0.00', '2021-09-21 20:43:14', '2021-09-21 20:43:14'),
(13, 'ESH62QXI210921', '0.00', '0.00', '0.00', '2021-09-21 22:42:07', '2021-09-21 22:42:07'),
(14, '8Ri427yYU210921', '5.00', '5.00', '0.00', '2021-09-21 22:42:49', '2021-09-21 23:11:36'),
(15, 'Fa45476CG210921', '0.00', '0.00', '0.00', '2021-09-21 22:44:51', '2021-09-21 22:44:51'),
(16, 'avq345SJR210921', '0.00', '0.00', '0.00', '2021-09-21 23:08:18', '2021-09-21 23:08:18'),
(17, 'f1Q16053v210921', '0.00', '0.00', '0.00', '2021-09-21 23:10:14', '2021-09-21 23:10:14'),
(18, 'ZQM433rfL210921', '5.00', '5.00', '0.00', '2021-09-21 23:10:37', '2021-09-21 23:10:37'),
(19, '1mi909svM210921', '0.00', '0.00', '0.00', '2021-09-21 23:12:23', '2021-09-21 23:12:23'),
(20, '4jL610Tzu210921', '0.00', '0.00', '0.00', '2021-09-21 23:17:28', '2021-09-29 21:45:06'),
(21, 'm5t879Fhu210922', '0.00', '0.00', '0.00', '2021-09-22 05:22:20', '2021-09-22 05:22:20'),
(22, 'THM181uZ5210922', '0.00', '0.00', '0.00', '2021-09-22 05:25:06', '2021-09-22 05:25:06'),
(23, 'EP6989z0w210922', '0.00', '0.00', '0.00', '2021-09-22 06:52:52', '2021-09-22 06:52:52'),
(24, '9Di0TWF210922', '0.00', '0.00', '0.00', '2021-09-22 08:40:08', '2021-09-22 08:40:08'),
(25, 'Fqh116w5M210922', '0.00', '0.00', '0.00', '2021-09-22 12:59:22', '2021-09-22 12:59:22'),
(26, 'uoi208GWy210922', '0.00', '0.00', '0.00', '2021-09-22 17:50:30', '2021-09-22 17:50:30'),
(27, 'aWE21Tya210922', '0.00', '0.00', '0.00', '2021-09-22 17:50:36', '2021-09-22 17:50:36'),
(28, 'D7a536zir210922', '0.00', '0.00', '0.00', '2021-09-22 23:31:17', '2021-09-22 23:31:17'),
(29, 'MhT371HHZ210922', '0.00', '0.00', '0.00', '2021-09-22 23:50:46', '2021-09-22 23:50:46'),
(30, 'bjL944sOD210922', '0.00', '0.00', '0.00', '2021-09-22 23:50:51', '2021-09-22 23:50:51'),
(31, 'aeq87XTM210923', '0.00', '0.00', '0.00', '2021-09-23 09:51:46', '2021-09-23 09:51:46'),
(32, 'DqJ592i43210923', '0.00', '0.00', '0.00', '2021-09-23 17:29:00', '2021-09-23 17:29:00'),
(33, 'Zya5544U6210923', '0.00', '0.00', '0.00', '2021-09-23 23:42:36', '2021-09-23 23:42:36'),
(34, 'dmb3437yz210924', '0.00', '0.00', '0.00', '2021-09-24 02:41:50', '2021-09-24 02:41:50'),
(35, 'vcM661MOA210924', '0.00', '0.00', '0.00', '2021-09-24 19:13:13', '2021-09-24 19:13:13'),
(36, 'M5W971BvU210924', '0.00', '0.00', '0.00', '2021-09-24 21:18:35', '2021-09-24 21:18:35'),
(37, '06E113hyS210924', '0.00', '0.00', '0.00', '2021-09-24 21:31:50', '2021-09-24 21:31:50'),
(38, '1Bx413EnV210925', '0.00', '0.00', '0.00', '2021-09-25 16:14:09', '2021-09-25 16:14:09'),
(39, '236876nvu210925', '0.00', '0.00', '0.00', '2021-09-25 18:25:49', '2021-09-25 18:25:49'),
(40, 'WNL414hkp210926', '0.00', '0.00', '0.00', '2021-09-26 04:21:53', '2021-09-26 04:21:53'),
(41, 'chD193x4f210926', '0.00', '0.00', '0.00', '2021-09-26 14:42:45', '2021-09-26 14:42:45'),
(42, 'Hmp622cVD210926', '0.00', '0.00', '0.00', '2021-09-26 18:39:49', '2021-09-26 18:39:49'),
(43, 'WD5105bkm210926', '0.00', '0.00', '0.00', '2021-09-26 18:48:42', '2021-09-26 18:48:42'),
(44, 'qUj780aB2210926', '0.00', '0.00', '0.00', '2021-09-26 19:00:22', '2021-09-26 19:00:22'),
(45, 'Qa880gP3210926', '0.00', '0.00', '0.00', '2021-09-26 19:10:56', '2021-09-26 19:10:56'),
(46, '2Zg606l1G210926', '0.00', '0.00', '0.00', '2021-09-26 19:21:58', '2021-09-26 19:21:58'),
(47, '7kT75gKL210926', '0.00', '0.00', '0.00', '2021-09-26 19:33:51', '2021-09-26 19:33:51'),
(48, 'wfN9991ez210926', '0.00', '0.00', '0.00', '2021-09-26 19:42:57', '2021-09-26 19:42:57'),
(49, 'd41470se4210926', '0.00', '0.00', '0.00', '2021-09-26 19:51:10', '2021-09-26 19:51:10'),
(50, '83g8857VN210926', '0.00', '0.00', '0.00', '2021-09-26 20:02:35', '2021-09-26 20:02:35'),
(51, 'ULD282j2a210926', '0.00', '0.00', '0.00', '2021-09-26 20:20:13', '2021-09-26 20:20:13'),
(52, '5TJ627uk5210926', '0.00', '0.00', '0.00', '2021-09-26 20:32:41', '2021-09-26 20:32:41'),
(53, 'jSc606sGl210926', '0.00', '0.00', '0.00', '2021-09-26 20:46:00', '2021-09-26 20:46:00'),
(54, '8uZ197aJn210926', '0.00', '0.00', '0.00', '2021-09-26 21:01:25', '2021-09-26 21:01:25'),
(55, 'KDe887T1d210926', '0.00', '0.00', '0.00', '2021-09-26 21:14:24', '2021-09-26 21:14:24'),
(56, 'HAj406AGL210926', '0.00', '0.00', '0.00', '2021-09-26 21:24:19', '2021-09-26 21:24:19'),
(57, '8Kw492aul210926', '0.00', '0.00', '0.00', '2021-09-26 21:33:46', '2021-09-26 21:33:46'),
(58, 'Y15238qIz210926', '0.00', '0.00', '0.00', '2021-09-26 21:40:54', '2021-09-26 21:40:54'),
(59, '4Ei516sb9210926', '0.00', '0.00', '0.00', '2021-09-26 21:48:08', '2021-09-26 21:48:08'),
(60, 'HYZ60MNd210926', '0.00', '0.00', '0.00', '2021-09-26 21:59:35', '2021-09-26 21:59:35'),
(61, 'm8z156foP210926', '0.00', '0.00', '0.00', '2021-09-26 22:11:51', '2021-09-26 22:11:51'),
(62, '2gM255PCy210926', '0.00', '0.00', '0.00', '2021-09-26 22:22:58', '2021-09-26 22:22:58'),
(63, 'Np8495vyL210926', '0.00', '0.00', '0.00', '2021-09-26 22:32:07', '2021-09-26 22:32:07'),
(64, 'IR249FZj210926', '0.00', '0.00', '0.00', '2021-09-26 22:32:20', '2021-09-26 22:32:20'),
(65, 'VlR86jKt210926', '0.00', '0.00', '0.00', '2021-09-26 22:41:29', '2021-09-26 22:41:29'),
(66, 'oJX117K11210926', '0.00', '0.00', '0.00', '2021-09-26 22:52:01', '2021-09-26 22:52:01'),
(67, 'yEl942UT5210926', '0.00', '0.00', '0.00', '2021-09-26 23:02:18', '2021-09-26 23:02:18'),
(68, 'Ck0727dYb210926', '0.00', '0.00', '0.00', '2021-09-26 23:13:01', '2021-09-26 23:13:01'),
(69, 'ywp525Alw210926', '0.00', '0.00', '0.00', '2021-09-26 23:24:27', '2021-09-26 23:24:27'),
(70, 'RN7424XiT210926', '0.00', '0.00', '0.00', '2021-09-26 23:37:19', '2021-09-26 23:37:19'),
(71, 'HAn510yS4210926', '0.00', '0.00', '0.00', '2021-09-26 23:46:22', '2021-09-26 23:46:22'),
(72, 'm5f542eye210926', '0.00', '0.00', '0.00', '2021-09-26 23:55:02', '2021-09-26 23:55:02'),
(73, 'yq34034in210927', '0.00', '0.00', '0.00', '2021-09-27 00:03:57', '2021-09-27 00:03:57'),
(74, 'ykw593W51210927', '0.00', '0.00', '0.00', '2021-09-27 00:14:04', '2021-09-27 00:14:04'),
(75, 'qwA417Rh5210927', '0.00', '0.00', '0.00', '2021-09-27 00:23:56', '2021-09-27 00:23:56'),
(76, 'mxO179x16210927', '0.00', '0.00', '0.00', '2021-09-27 00:33:24', '2021-09-27 00:33:24'),
(77, 'js5343ITH210927', '0.00', '0.00', '0.00', '2021-09-27 00:42:11', '2021-09-27 00:42:11'),
(78, '1SC801b83210927', '0.00', '0.00', '0.00', '2021-09-27 00:51:04', '2021-09-27 00:51:04'),
(79, 'cL3206GU0210927', '0.00', '0.00', '0.00', '2021-09-27 01:00:19', '2021-09-27 01:00:19'),
(80, 'Knv633WkZ210927', '0.00', '0.00', '0.00', '2021-09-27 01:09:09', '2021-09-27 01:09:09'),
(81, '8Ku4992e210927', '0.00', '0.00', '0.00', '2021-09-27 01:18:50', '2021-09-27 01:18:50'),
(82, 'Y0p445gEc210927', '0.00', '0.00', '0.00', '2021-09-27 01:28:26', '2021-09-27 01:28:26'),
(83, 'm8g482FCA210927', '0.00', '0.00', '0.00', '2021-09-27 01:38:21', '2021-09-27 01:38:21'),
(84, 'Kca409pVm210927', '0.00', '0.00', '0.00', '2021-09-27 01:47:16', '2021-09-27 01:47:16'),
(85, 'Isq355Uqv210927', '0.00', '0.00', '0.00', '2021-09-27 01:57:15', '2021-09-27 01:57:15'),
(86, '9or60pg0210927', '0.00', '0.00', '0.00', '2021-09-27 02:04:54', '2021-09-27 02:04:54'),
(87, 'dR3703rNe210927', '0.00', '0.00', '0.00', '2021-09-27 02:14:00', '2021-09-27 02:14:00'),
(88, 'piq988BPq210927', '0.00', '0.00', '0.00', '2021-09-27 02:24:14', '2021-09-27 02:24:14'),
(89, 'knE1179wB210927', '0.00', '0.00', '0.00', '2021-09-27 02:34:36', '2021-09-27 02:34:36'),
(90, 'OqH657SiK210927', '0.00', '0.00', '0.00', '2021-09-27 02:44:13', '2021-09-27 02:44:13'),
(91, 'k4b309g1H210927', '0.00', '0.00', '0.00', '2021-09-27 02:52:56', '2021-09-27 02:52:56'),
(92, 'oBR433BzC210927', '0.00', '0.00', '0.00', '2021-09-27 03:02:03', '2021-09-27 03:02:03'),
(93, 'a27464DJL210927', '0.00', '0.00', '0.00', '2021-09-27 03:11:29', '2021-09-27 03:11:29'),
(94, 'BS6977ot1210927', '0.00', '0.00', '0.00', '2021-09-27 03:30:35', '2021-09-27 03:30:35'),
(95, 'WBq854nv5210927', '0.00', '0.00', '0.00', '2021-09-27 03:32:22', '2021-09-27 03:32:22'),
(96, '2iF591zie210927', '0.00', '0.00', '0.00', '2021-09-27 03:40:02', '2021-09-27 03:40:02'),
(97, 'aMX842yKA210927', '0.00', '0.00', '0.00', '2021-09-27 03:48:46', '2021-09-27 03:48:46'),
(98, 'FUp430sVx210927', '0.00', '0.00', '0.00', '2021-09-27 03:58:15', '2021-09-27 03:58:15'),
(99, 'rLV494kwM210927', '0.00', '0.00', '0.00', '2021-09-27 04:05:09', '2021-09-27 04:05:09'),
(100, '7wj859PPc210927', '0.00', '0.00', '0.00', '2021-09-27 04:11:31', '2021-09-27 04:11:31'),
(101, '8Lq508OsK210927', '0.00', '0.00', '0.00', '2021-09-27 04:17:57', '2021-09-27 04:17:57'),
(102, '2wd108j0d210927', '0.00', '0.00', '0.00', '2021-09-27 04:29:14', '2021-09-27 04:29:14'),
(103, '1mj430Pel210927', '0.00', '0.00', '0.00', '2021-09-27 04:40:19', '2021-09-27 04:40:19'),
(104, 'Npd151QIa210927', '0.00', '0.00', '0.00', '2021-09-27 04:49:50', '2021-09-27 04:49:50'),
(105, 'RVx727w8t210927', '0.00', '0.00', '0.00', '2021-09-27 04:58:13', '2021-09-27 04:58:13'),
(106, 'eyx439VuN210927', '0.00', '0.00', '0.00', '2021-09-27 05:08:10', '2021-09-27 05:08:10'),
(107, '9T5449lt210927', '0.00', '0.00', '0.00', '2021-09-27 05:18:02', '2021-09-27 05:18:02'),
(108, 'LvH904hxU210927', '0.00', '0.00', '0.00', '2021-09-27 05:28:52', '2021-09-27 05:28:52'),
(109, 'J0O358sqd210927', '0.00', '0.00', '0.00', '2021-09-27 05:40:05', '2021-09-27 05:40:05'),
(110, 'fCy250FUs210927', '0.00', '0.00', '0.00', '2021-09-27 05:42:20', '2021-09-27 05:42:20'),
(111, 'Euc7432e5210927', '0.00', '0.00', '0.00', '2021-09-27 05:49:12', '2021-09-27 05:49:12'),
(112, '7L4757BAY210927', '0.00', '0.00', '0.00', '2021-09-27 05:57:33', '2021-09-27 05:57:33'),
(113, 'KT5654u1A210927', '0.00', '0.00', '0.00', '2021-09-27 06:08:54', '2021-09-27 06:08:54'),
(114, 'IeX532C2K210927', '0.00', '0.00', '0.00', '2021-09-27 06:22:56', '2021-09-27 06:22:56'),
(115, '2kT426uLJ210927', '0.00', '0.00', '0.00', '2021-09-27 06:36:39', '2021-09-27 06:36:39'),
(116, '0xT138WOc210927', '0.00', '0.00', '0.00', '2021-09-27 06:50:47', '2021-09-27 06:50:47'),
(117, 'Zi8769io210927', '0.00', '0.00', '0.00', '2021-09-27 07:08:52', '2021-09-27 07:08:52'),
(118, 'BKg43R6d210927', '0.00', '0.00', '0.00', '2021-09-27 07:28:44', '2021-09-27 07:28:44'),
(119, 'R3w168drK210927', '0.00', '0.00', '0.00', '2021-09-27 07:42:38', '2021-09-27 07:42:38'),
(120, 'YUA5558L7210927', '0.00', '0.00', '0.00', '2021-09-27 07:56:52', '2021-09-27 07:56:52'),
(121, 'qyq331MGK210927', '0.00', '0.00', '0.00', '2021-09-27 08:11:40', '2021-09-27 08:11:40'),
(122, 'fLK381joS210927', '0.00', '0.00', '0.00', '2021-09-27 08:23:56', '2021-09-27 08:23:56'),
(123, '1s6933Sz7210927', '0.00', '0.00', '0.00', '2021-09-27 08:35:38', '2021-09-27 08:35:38'),
(124, 'r4k907LEM210927', '0.00', '0.00', '0.00', '2021-09-27 08:47:54', '2021-09-27 08:47:54'),
(125, 'srP74889r210927', '0.00', '0.00', '0.00', '2021-09-27 09:00:35', '2021-09-27 09:00:35'),
(126, 'vGt437eYT210927', '0.00', '0.00', '0.00', '2021-09-27 09:12:58', '2021-09-27 09:12:58'),
(127, 'Iee975VHy210927', '0.00', '0.00', '0.00', '2021-09-27 09:25:59', '2021-09-27 09:25:59'),
(128, '0Fy407kSs210927', '0.00', '0.00', '0.00', '2021-09-27 09:38:59', '2021-09-27 09:38:59'),
(129, 'sFK497X9a210927', '0.00', '0.00', '0.00', '2021-09-27 09:52:55', '2021-09-27 09:52:55'),
(130, 'zxh436HRG210927', '0.00', '0.00', '0.00', '2021-09-27 10:06:41', '2021-09-27 10:06:41'),
(131, 'ifW5901sD210927', '0.00', '0.00', '0.00', '2021-09-27 10:19:56', '2021-09-27 10:19:56'),
(132, 'Bya720ov9210927', '0.00', '0.00', '0.00', '2021-09-27 10:32:31', '2021-09-27 10:32:31'),
(133, 'jNw211KYe210927', '0.00', '0.00', '0.00', '2021-09-27 10:45:58', '2021-09-27 10:45:58'),
(134, '2p15859QD210927', '0.00', '0.00', '0.00', '2021-09-27 10:59:08', '2021-09-27 10:59:08'),
(135, '3Mh2318bo210927', '0.00', '0.00', '0.00', '2021-09-27 11:14:54', '2021-09-27 11:14:54'),
(136, '2RI689R8m210927', '0.00', '0.00', '0.00', '2021-09-27 11:20:01', '2021-09-27 11:20:01'),
(137, 'VFF463jnN210927', '0.00', '0.00', '0.00', '2021-09-27 11:51:15', '2021-09-27 11:51:15'),
(138, 'Aa7479e0J210927', '0.00', '0.00', '0.00', '2021-09-27 12:05:29', '2021-09-27 12:05:29'),
(139, 'LGk999Adc210927', '0.00', '0.00', '0.00', '2021-09-27 12:19:17', '2021-09-27 12:19:17'),
(140, 'kLF100aim210927', '0.00', '0.00', '0.00', '2021-09-27 12:32:53', '2021-09-27 12:32:53'),
(141, 'iWz42513C210927', '0.00', '0.00', '0.00', '2021-09-27 12:44:24', '2021-09-27 12:44:24'),
(142, 'yGT8271us210927', '0.00', '0.00', '0.00', '2021-09-27 12:54:17', '2021-09-27 12:54:17'),
(143, 'egj973HMq210927', '0.00', '0.00', '0.00', '2021-09-27 13:03:47', '2021-09-27 13:03:47'),
(144, 'Plo132rwz210927', '0.00', '0.00', '0.00', '2021-09-27 13:15:48', '2021-09-27 13:15:48'),
(145, 'Zq7548Vlj210927', '0.00', '0.00', '0.00', '2021-09-27 13:28:59', '2021-09-27 13:28:59'),
(146, 'VUT118zb4210927', '0.00', '0.00', '0.00', '2021-09-27 13:42:27', '2021-09-27 13:42:27'),
(147, '0IE677BMc210927', '0.00', '0.00', '0.00', '2021-09-27 13:55:25', '2021-09-27 13:55:25'),
(148, 'tQ2694olv210927', '0.00', '0.00', '0.00', '2021-09-27 14:08:13', '2021-09-27 14:08:13'),
(149, 'zw44091nn210927', '0.00', '0.00', '0.00', '2021-09-27 14:21:44', '2021-09-27 14:21:44'),
(150, '2UY2423EZ210927', '0.00', '0.00', '0.00', '2021-09-27 14:34:36', '2021-09-27 14:34:36'),
(151, 'j1f675i30210927', '0.00', '0.00', '0.00', '2021-09-27 14:48:15', '2021-09-27 14:48:15'),
(152, 'qhE253Nur210927', '0.00', '0.00', '0.00', '2021-09-27 15:01:33', '2021-09-27 15:01:33'),
(153, 'oz0671hCI210927', '0.00', '0.00', '0.00', '2021-09-27 15:26:31', '2021-09-27 15:26:31'),
(154, '8OG123dTM210927', '0.00', '0.00', '0.00', '2021-09-27 15:37:47', '2021-09-27 15:37:47'),
(155, 'ZRG290AVj210927', '0.00', '0.00', '0.00', '2021-09-27 15:49:59', '2021-09-27 15:49:59'),
(156, 'Tgg578X18210927', '0.00', '0.00', '0.00', '2021-09-27 16:02:16', '2021-09-27 16:02:16'),
(157, '2zQ510wUR210927', '0.00', '0.00', '0.00', '2021-09-27 16:15:06', '2021-09-27 16:15:06'),
(158, 'cer960BZj210927', '0.00', '0.00', '0.00', '2021-09-27 16:27:21', '2021-09-27 16:27:21'),
(159, 'M67961tx8210927', '0.00', '0.00', '0.00', '2021-09-27 16:42:27', '2021-09-27 16:42:27'),
(160, 'BII187TVr210927', '0.00', '0.00', '0.00', '2021-09-27 17:01:12', '2021-09-27 17:01:12'),
(161, '2xi6665HC210927', '0.00', '0.00', '0.00', '2021-09-27 17:13:46', '2021-09-27 17:13:46'),
(162, 'Fgt737saO210927', '0.00', '0.00', '0.00', '2021-09-27 17:27:17', '2021-09-27 17:27:17'),
(163, 'anG421aW6210927', '0.00', '0.00', '0.00', '2021-09-27 17:40:15', '2021-09-27 17:40:15'),
(164, 'am6202UBi210927', '0.00', '0.00', '0.00', '2021-09-27 17:51:26', '2021-09-27 17:51:26'),
(165, 'iss617CqE210927', '0.00', '0.00', '0.00', '2021-09-27 18:03:29', '2021-09-27 18:03:29'),
(166, 'kRK7295fK210927', '0.00', '0.00', '0.00', '2021-09-27 18:19:57', '2021-09-27 18:19:57'),
(167, 'rQZ270BcE210927', '0.00', '0.00', '0.00', '2021-09-27 18:31:50', '2021-09-27 18:31:50'),
(168, 'PiL628ISq210927', '0.00', '0.00', '0.00', '2021-09-27 18:43:41', '2021-09-27 18:43:41'),
(169, '4s8507g2f210927', '0.00', '0.00', '0.00', '2021-09-27 18:55:24', '2021-09-27 18:55:24'),
(170, '8ww643gxq210927', '0.00', '0.00', '0.00', '2021-09-27 19:07:14', '2021-09-27 19:07:14'),
(171, 'mfk279W7K210927', '0.00', '0.00', '0.00', '2021-09-27 19:18:50', '2021-09-27 19:18:50'),
(172, 'O5p312gNu210927', '0.00', '0.00', '0.00', '2021-09-27 19:31:27', '2021-09-27 19:31:27'),
(173, 'Jpx868Q13210927', '0.00', '0.00', '0.00', '2021-09-27 19:44:51', '2021-09-27 19:44:51'),
(174, 'ZjZ375fZu210927', '0.00', '0.00', '0.00', '2021-09-27 19:47:05', '2021-09-27 19:47:05'),
(175, 'q1q991PP6210927', '0.00', '0.00', '0.00', '2021-09-27 20:06:00', '2021-09-27 20:06:00'),
(176, 'GqE231T2a210927', '0.00', '0.00', '0.00', '2021-09-27 20:23:31', '2021-09-27 20:23:31'),
(177, 'eyf737DFb210927', '0.00', '0.00', '0.00', '2021-09-27 20:37:02', '2021-09-27 20:37:02'),
(178, 'jpr400BRG210927', '0.00', '0.00', '0.00', '2021-09-27 20:46:44', '2021-09-27 20:46:44'),
(179, 'nwK256jxy210927', '0.00', '0.00', '0.00', '2021-09-27 20:59:11', '2021-09-27 20:59:11'),
(180, '9nO789is210927', '0.00', '0.00', '0.00', '2021-09-27 21:08:01', '2021-09-27 21:08:01'),
(181, '5et891Eqn210927', '0.00', '0.00', '0.00', '2021-09-27 21:21:04', '2021-09-27 21:21:04'),
(182, 'uoa3260ne210927', '0.00', '0.00', '0.00', '2021-09-27 21:29:46', '2021-09-27 21:29:46'),
(183, 'amD583YGg210927', '0.00', '0.00', '0.00', '2021-09-27 21:38:28', '2021-09-27 21:38:28'),
(184, 'VPH619wzN210927', '0.00', '0.00', '0.00', '2021-09-27 21:47:17', '2021-09-27 21:47:17'),
(185, 'wAq737YyX210927', '0.00', '0.00', '0.00', '2021-09-27 21:55:52', '2021-09-27 21:55:52'),
(186, 'mBG808FFU210927', '0.00', '0.00', '0.00', '2021-09-27 22:05:05', '2021-09-27 22:05:05'),
(187, 'XPr383FMs210927', '0.00', '0.00', '0.00', '2021-09-27 22:12:54', '2021-09-27 22:12:54'),
(188, 'O71179G3x210927', '0.00', '0.00', '0.00', '2021-09-27 22:21:13', '2021-09-27 22:21:13'),
(189, 'Zj04843op210927', '0.00', '0.00', '0.00', '2021-09-27 22:29:26', '2021-09-27 22:29:26'),
(190, '8Kz4525L5210927', '0.00', '0.00', '0.00', '2021-09-27 22:54:10', '2021-09-27 22:54:10'),
(191, 'a4B864jkC210928', '0.00', '0.00', '0.00', '2021-09-28 00:47:18', '2021-09-28 00:47:18'),
(192, 'K5P265XXi210928', '0.00', '0.00', '0.00', '2021-09-28 06:23:33', '2021-09-28 06:23:33'),
(193, 'TGX810UCN210928', '0.00', '0.00', '0.00', '2021-09-28 07:58:46', '2021-09-28 07:58:46'),
(194, 'A1Z173Yyt210928', '0.00', '0.00', '0.00', '2021-09-28 11:53:02', '2021-09-28 11:53:02'),
(195, '34Y755Ke8210924', '0.00', '0.00', '0.00', '2021-09-28 12:18:53', '2021-09-28 12:18:53'),
(196, 'Z1a523ywF210928', '0.00', '0.00', '0.00', '2021-09-28 12:41:47', '2021-09-28 12:41:47'),
(197, 'pbT6502Ct210929', '0.00', '0.00', '0.00', '2021-09-29 09:32:46', '2021-09-29 09:32:46'),
(198, 'pVZ796SvD210930', '0.00', '0.00', '0.00', '2021-09-30 06:11:23', '2021-09-30 06:11:23'),
(199, 'l4f42cQ4210930', '0.00', '0.00', '0.00', '2021-09-30 11:33:17', '2021-09-30 11:33:17'),
(200, 'Ob9644u6K210930', '0.00', '0.00', '0.00', '2021-09-30 12:05:10', '2021-09-30 12:05:10'),
(201, 'XRf30kZV210930', '0.00', '0.00', '0.00', '2021-09-30 12:42:42', '2021-09-30 12:42:42'),
(202, 'ZrG471eMZ210930', '0.00', '0.00', '0.00', '2021-09-30 14:52:49', '2021-09-30 14:52:49'),
(203, 'Kev4818db210930', '0.00', '0.00', '0.00', '2021-09-30 15:27:40', '2021-09-30 15:27:40'),
(204, 'Ihu2Ybk210930', '0.00', '0.00', '0.00', '2021-09-30 22:43:14', '2021-09-30 22:43:14'),
(205, '8gd393mjm210930', '0.00', '0.00', '0.00', '2021-09-30 22:44:22', '2021-09-30 22:44:22'),
(206, 'mvP6376Xe211001', '0.00', '0.00', '0.00', '2021-10-01 14:40:47', '2021-10-01 14:40:47'),
(207, 'dJz527ekA211001', '0.00', '0.00', '0.00', '2021-10-01 14:41:34', '2021-10-01 14:41:34'),
(208, '1tA461rjT211002', '0.00', '0.00', '0.00', '2021-10-02 08:41:35', '2021-10-02 08:41:35'),
(209, 'Ivj90zfk211002', '0.00', '0.00', '0.00', '2021-10-02 17:57:31', '2021-10-02 17:57:31'),
(210, 'DXb777Tj8211003', '0.00', '0.00', '0.00', '2021-10-03 05:18:32', '2021-10-03 05:18:32'),
(211, 'YIb4013ey211003', '0.00', '0.00', '0.00', '2021-10-03 10:22:20', '2021-10-03 10:22:20'),
(212, 'Jiw948HsE211004', '0.00', '0.00', '0.00', '2021-10-04 07:14:32', '2021-10-04 07:14:32'),
(213, 'r7X34BHX211004', '0.00', '0.00', '0.00', '2021-10-04 14:36:20', '2021-10-04 14:36:20'),
(214, 'aIC855gOH211004', '0.00', '0.00', '0.00', '2021-10-04 15:41:16', '2021-10-04 15:41:16'),
(215, 'sQq980h13211004', '0.00', '0.00', '0.00', '2021-10-04 15:57:22', '2021-10-04 15:57:22'),
(216, 'Cic638a3J211004', '0.00', '0.00', '0.00', '2021-10-04 15:57:25', '2021-10-04 15:57:25'),
(217, 'WkA435syy211004', '0.00', '0.00', '0.00', '2021-10-04 23:33:00', '2021-10-04 23:33:00'),
(218, 'sI55180G8211004', '0.00', '0.00', '0.00', '2021-10-04 23:45:50', '2021-10-04 23:45:50'),
(219, 'glR620vkw211005', '0.00', '0.00', '0.00', '2021-10-05 02:18:40', '2021-10-05 02:18:40'),
(220, 'sEW4980bx211005', '0.00', '0.00', '0.00', '2021-10-05 10:53:51', '2021-10-05 10:53:51'),
(221, 'vOz135K8c211005', '0.00', '0.00', '0.00', '2021-10-05 11:06:12', '2021-10-05 11:06:12'),
(222, 'UaM18866j211006', '0.00', '0.00', '0.00', '2021-10-06 13:42:16', '2021-10-06 13:42:16'),
(223, 'TlL551c44211006', '0.00', '0.00', '0.00', '2021-10-06 22:12:59', '2021-10-06 22:12:59'),
(224, 'F2i263Q4x211007', '0.00', '0.00', '0.00', '2021-10-07 03:06:18', '2021-10-07 03:06:18'),
(225, 'GpU926Lah211007', '0.00', '0.00', '0.00', '2021-10-07 08:05:30', '2021-10-07 08:05:30'),
(226, 'Xwu614YkM211007', '0.00', '0.00', '0.00', '2021-10-07 17:44:34', '2021-10-07 17:44:34'),
(227, 'REW379K7u211008', '0.00', '0.00', '0.00', '2021-10-08 16:06:10', '2021-10-08 16:06:10'),
(228, 'xNU1112CJ211008', '0.00', '0.00', '0.00', '2021-10-08 21:35:12', '2021-10-08 21:35:12'),
(229, '4vC932Zh211008', '0.00', '0.00', '0.00', '2021-10-08 23:05:16', '2021-10-08 23:05:16'),
(230, '6ns670ALe211008', '0.00', '0.00', '0.00', '2021-10-08 23:15:00', '2021-10-08 23:15:00'),
(231, 'gIl774QO0211008', '0.00', '0.00', '0.00', '2021-10-08 23:15:11', '2021-10-08 23:15:11'),
(232, 'Gqs207N6q211009', '0.00', '0.00', '0.00', '2021-10-09 00:14:29', '2021-10-09 00:14:29'),
(233, 'm6j6102vZ211009', '0.00', '0.00', '0.00', '2021-10-09 10:36:51', '2021-10-09 10:36:51'),
(234, 'Ide274F9z211009', '0.00', '0.00', '0.00', '2021-10-09 21:57:31', '2021-10-09 21:57:31'),
(235, 'bJJ830gp4211010', '0.00', '0.00', '0.00', '2021-10-10 02:48:52', '2021-10-10 02:48:52'),
(236, 'yD0384oQp211010', '0.00', '0.00', '0.00', '2021-10-10 02:57:53', '2021-10-10 02:57:53'),
(237, 'n6e87qO8211010', '0.00', '0.00', '0.00', '2021-10-10 16:59:24', '2021-10-10 16:59:24'),
(238, '6mE624dzS211011', '0.00', '0.00', '0.00', '2021-10-11 02:20:28', '2021-10-11 02:20:28'),
(239, '7lJ805sbv211011', '0.00', '0.00', '0.00', '2021-10-11 15:51:35', '2021-10-11 15:51:35'),
(240, 'pd0793LNq211011', '0.00', '0.00', '0.00', '2021-10-11 17:25:41', '2021-10-11 17:25:41'),
(241, '1Eh535rC7211012', '0.00', '0.00', '0.00', '2021-10-12 12:20:33', '2021-10-12 12:20:33'),
(242, '5Gr117bLK211012', '0.00', '0.00', '0.00', '2021-10-12 15:15:22', '2021-10-12 15:15:22'),
(243, 'kvD9361uA211012', '0.00', '0.00', '0.00', '2021-10-12 17:58:16', '2021-10-12 17:58:16'),
(244, '7he5898ot211012', '0.00', '0.00', '0.00', '2021-10-12 21:28:55', '2021-10-12 21:28:55'),
(245, '3rA3295Qp211013', '0.00', '0.00', '0.00', '2021-10-13 10:43:05', '2021-10-13 10:43:05'),
(246, 'fop281cZh211013', '0.00', '0.00', '0.00', '2021-10-13 11:03:44', '2021-10-13 11:03:44'),
(247, '0zW659DSN211013', '0.00', '0.00', '0.00', '2021-10-13 14:35:51', '2021-10-13 14:35:51'),
(248, 'RSj809JWS211013', '0.00', '0.00', '0.00', '2021-10-13 15:35:38', '2021-10-13 15:35:38'),
(249, 'n1X729IUv211013', '0.00', '0.00', '0.00', '2021-10-13 15:35:46', '2021-10-13 15:35:46'),
(250, 'eyy430x7z211013', '0.00', '0.00', '0.00', '2021-10-13 20:02:30', '2021-10-13 20:02:30'),
(251, 'q01432laK211013', '0.00', '0.00', '0.00', '2021-10-13 20:08:14', '2021-10-13 20:08:14'),
(252, '60V47754V211014', '0.00', '0.00', '0.00', '2021-10-14 03:43:10', '2021-10-14 03:43:10'),
(253, '2Ay387QYy211014', '0.00', '0.00', '0.00', '2021-10-14 07:36:57', '2021-10-14 07:36:57'),
(254, '24d970PqQ211014', '0.00', '0.00', '0.00', '2021-10-14 07:51:40', '2021-10-14 07:51:40'),
(255, 'qJP927Sqg211014', '0.00', '0.00', '0.00', '2021-10-14 08:41:44', '2021-10-14 08:41:44'),
(256, 'E8C873nav211014', '0.00', '0.00', '0.00', '2021-10-14 08:41:45', '2021-10-14 08:41:45'),
(257, 'D6o367Q5e211014', '0.00', '0.00', '0.00', '2021-10-14 19:03:51', '2021-10-14 19:03:51'),
(258, 'qPr8773Q7211014', '0.00', '0.00', '0.00', '2021-10-14 22:20:36', '2021-10-14 22:20:36'),
(259, 'flz39e3l211014', '0.00', '0.00', '0.00', '2021-10-14 22:26:01', '2021-10-14 22:26:01'),
(260, 'CJV270V7J211015', '0.00', '0.00', '0.00', '2021-10-15 08:29:23', '2021-10-15 08:29:23'),
(261, 'I0C299jAu211015', '0.00', '0.00', '0.00', '2021-10-15 09:31:48', '2021-10-15 09:31:48'),
(262, 'jE387LSX211015', '0.00', '0.00', '0.00', '2021-10-15 15:41:45', '2021-10-15 15:41:45'),
(263, 'LeH137GHu211015', '0.00', '0.00', '0.00', '2021-10-15 16:02:23', '2021-10-15 16:02:23'),
(264, 'VNV382Xbh211015', '0.00', '0.00', '0.00', '2021-10-15 23:02:57', '2021-10-15 23:02:57'),
(265, 'hvt986Ce6211016', '0.00', '0.00', '0.00', '2021-10-16 02:57:16', '2021-10-16 02:57:16'),
(266, 'PrO2092xW211016', '0.00', '0.00', '0.00', '2021-10-16 18:16:39', '2021-10-16 18:16:39'),
(267, '3Pd636UZW211016', '0.00', '0.00', '0.00', '2021-10-16 18:32:55', '2021-10-16 18:32:55'),
(268, 'rRU354UAu211016', '0.00', '0.00', '0.00', '2021-10-16 19:31:07', '2021-10-16 19:31:07'),
(269, 'uY3290ZV4211017', '0.00', '0.00', '0.00', '2021-10-17 02:54:12', '2021-10-17 02:54:12'),
(270, 'AZw503gXw211017', '0.00', '0.00', '0.00', '2021-10-17 08:02:14', '2021-10-17 08:02:14'),
(271, 'WBX710VKe211017', '0.00', '0.00', '0.00', '2021-10-17 22:23:30', '2021-10-17 22:23:30'),
(272, 'nnY764OfF211017', '0.00', '0.00', '0.00', '2021-10-17 22:33:49', '2021-10-17 22:33:49'),
(273, 'Vbk1386JO211017', '0.00', '0.00', '0.00', '2021-10-17 22:38:24', '2021-10-17 22:38:24'),
(274, 'YJc37100f211018', '0.00', '0.00', '0.00', '2021-10-18 04:41:07', '2021-10-18 04:41:07'),
(275, '0yf509CZX211018', '0.00', '0.00', '0.00', '2021-10-18 05:57:41', '2021-10-18 05:57:41'),
(276, 'iZX297DzQ211018', '0.00', '0.00', '0.00', '2021-10-18 06:15:57', '2021-10-18 06:15:57'),
(277, 'WID571DaK211018', '0.00', '0.00', '0.00', '2021-10-18 07:14:43', '2021-10-18 07:14:43'),
(278, 'U5z76AtQ211018', '0.00', '0.00', '0.00', '2021-10-18 09:49:52', '2021-10-18 09:49:52'),
(279, 'POf160jGr211018', '0.00', '0.00', '0.00', '2021-10-18 15:10:33', '2021-10-18 15:10:33'),
(280, '1sS971SEb211018', '0.00', '0.00', '0.00', '2021-10-18 18:46:22', '2021-10-18 18:46:22'),
(281, 'nCN8775Ok211018', '0.00', '0.00', '0.00', '2021-10-18 21:02:21', '2021-10-18 21:02:21'),
(282, 'N5C448EqF211018', '0.00', '0.00', '0.00', '2021-10-18 21:52:40', '2021-10-18 21:52:40'),
(283, '3wh208g5n211019', '0.00', '0.00', '0.00', '2021-10-19 02:52:55', '2021-10-19 02:52:55'),
(284, 'mRr469nI9211019', '0.00', '0.00', '0.00', '2021-10-19 18:32:25', '2021-10-19 18:32:25'),
(285, '0Vm7880wO211019', '0.00', '0.00', '0.00', '2021-10-19 18:42:32', '2021-10-19 18:42:32'),
(286, 'CEo106szt211020', '0.00', '0.00', '0.00', '2021-10-20 00:51:43', '2021-10-20 00:51:43'),
(287, 'FQY1124Ff211020', '0.00', '0.00', '0.00', '2021-10-20 03:36:11', '2021-10-20 03:36:11'),
(288, 'VjG9925bm211020', '0.00', '0.00', '0.00', '2021-10-20 10:34:23', '2021-10-20 10:34:23'),
(289, 'ooy792bZf211020', '0.00', '0.00', '0.00', '2021-10-20 15:09:25', '2021-10-20 15:09:25'),
(290, '9it138ajY211021', '0.00', '0.00', '0.00', '2021-10-21 03:42:16', '2021-10-21 03:42:16'),
(291, '5Am757HDL211021', '0.00', '0.00', '0.00', '2021-10-21 13:53:17', '2021-10-21 13:53:17'),
(292, '0Xx630E4s211021', '0.00', '0.00', '0.00', '2021-10-21 15:11:01', '2021-10-21 15:11:01'),
(293, 'Gyo103XkO211021', '0.00', '0.00', '0.00', '2021-10-21 18:31:38', '2021-10-21 18:31:38'),
(294, 'shS910BCS211021', '0.00', '0.00', '0.00', '2021-10-21 19:21:00', '2021-10-21 19:21:00'),
(295, 'r3124h3v211021', '0.00', '0.00', '0.00', '2021-10-21 19:38:52', '2021-10-21 19:38:52'),
(296, 'wnz607Ndd211022', '0.00', '0.00', '0.00', '2021-10-22 11:52:07', '2021-10-22 11:52:07'),
(297, 'GWu344Tdz211022', '0.00', '0.00', '0.00', '2021-10-22 12:50:12', '2021-10-22 12:50:12'),
(298, 'kFj445rXj211022', '0.00', '0.00', '0.00', '2021-10-22 16:40:15', '2021-10-22 16:40:15'),
(299, 'Hgd706BCJ211023', '0.00', '0.00', '0.00', '2021-10-23 08:55:54', '2021-10-23 08:55:54'),
(300, '9It239X29211023', '0.00', '0.00', '0.00', '2021-10-23 10:06:47', '2021-10-23 10:06:47'),
(301, 'FaP514mH4211023', '0.00', '0.00', '0.00', '2021-10-23 10:06:56', '2021-10-23 10:06:56'),
(302, 'qpf744WcH211023', '0.00', '0.00', '0.00', '2021-10-23 15:41:08', '2021-10-23 15:41:08'),
(303, 'Lz0931Idr211023', '0.00', '0.00', '0.00', '2021-10-23 21:51:51', '2021-10-23 21:51:51'),
(304, 'OFp6993NW211023', '0.00', '0.00', '0.00', '2021-10-23 22:21:08', '2021-10-23 22:21:08'),
(305, 'zAn905qbK211024', '0.00', '0.00', '0.00', '2021-10-24 01:58:29', '2021-10-24 01:58:29'),
(306, 'pbp946KRy211024', '0.00', '0.00', '0.00', '2021-10-24 04:15:22', '2021-10-24 04:15:22'),
(307, 'CZU824pHt211024', '0.00', '0.00', '0.00', '2021-10-24 05:53:29', '2021-10-24 05:53:29'),
(308, '8SX312ln8211025', '0.00', '0.00', '0.00', '2021-10-25 05:08:21', '2021-10-25 05:08:21'),
(309, 'f3e776tJW211025', '0.00', '0.00', '0.00', '2021-10-25 09:37:06', '2021-10-25 09:37:06'),
(310, 'pij282Fs7211025', '0.00', '0.00', '0.00', '2021-10-25 09:47:49', '2021-10-25 09:47:49'),
(311, 'QTU499F36211025', '0.00', '0.00', '0.00', '2021-10-25 09:51:08', '2021-10-25 09:51:08'),
(312, '4dM7511eA211025', '0.00', '0.00', '0.00', '2021-10-25 11:30:55', '2021-10-25 11:30:55'),
(313, 'KxU710GG2211026', '0.00', '0.00', '0.00', '2021-10-26 11:56:27', '2021-10-26 11:56:27'),
(314, '8jz922SVs211026', '0.00', '0.00', '0.00', '2021-10-26 13:35:56', '2021-10-26 13:35:56'),
(315, 'cpP474wlh211026', '0.00', '0.00', '0.00', '2021-10-26 14:52:36', '2021-10-26 14:52:36'),
(316, 'Fc9187fiW211026', '0.00', '0.00', '0.00', '2021-10-26 15:31:21', '2021-10-26 15:31:21'),
(317, 'ycW172GP7211026', '0.00', '0.00', '0.00', '2021-10-26 22:40:34', '2021-10-26 22:40:34'),
(318, 'fv6105bzU211027', '0.00', '0.00', '0.00', '2021-10-27 06:47:02', '2021-10-27 06:47:02'),
(319, 'XhY155dHu211027', '0.00', '0.00', '0.00', '2021-10-27 10:22:26', '2021-10-27 10:22:26'),
(320, 'EZz150wTh211027', '0.00', '0.00', '0.00', '2021-10-27 13:15:47', '2021-10-27 13:15:47'),
(321, 'ZEe978i6L211027', '0.00', '0.00', '0.00', '2021-10-27 13:55:43', '2021-10-27 13:55:43');

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
(1, 'Role Management', NULL, 1, NULL, 1, 1, '2020-01-24 18:53:44', '2020-12-05 15:05:04'),
(2, 'Role Access Control', NULL, 1, NULL, 1, 1, '2020-01-24 18:54:32', '2020-01-24 18:54:32'),
(3, 'User Access Control', NULL, 1, NULL, 1, 1, '2020-01-24 18:54:59', '2020-01-24 18:54:59'),
(4, 'Module Management', NULL, 1, NULL, 1, 1, '2020-01-24 18:55:37', '2020-01-24 18:55:37'),
(5, 'Activity Management', NULL, 1, NULL, 1, 1, '2020-01-24 18:55:58', '2020-01-24 18:55:58'),
(6, 'User', NULL, 1, NULL, 1, 1, '2020-01-24 18:58:53', '2021-09-28 22:28:47'),
(10, 'Site Setting', NULL, 1, NULL, 1, 1, '2021-07-14 09:08:07', '2021-07-14 09:08:07'),
(11, 'Player', NULL, 1, NULL, 1, 1, '2021-09-19 12:47:03', '2021-09-19 12:51:41'),
(12, 'Contest', NULL, 1, NULL, 1, 1, '2021-09-19 12:51:59', '2021-09-19 12:51:59'),
(13, 'Win Coin', NULL, 1, NULL, 1, 1, '2021-09-19 12:56:31', '2021-09-19 12:56:31'),
(14, 'Category', NULL, 1, NULL, 1, 1, '2021-09-19 13:01:56', '2021-09-19 13:01:56'),
(15, 'Brand', NULL, 1, NULL, 1, 1, '2021-09-19 13:05:48', '2021-09-19 13:05:48'),
(16, 'Product', NULL, 1, NULL, 1, 1, '2021-09-19 13:07:51', '2021-09-19 13:07:51'),
(17, 'Auction Product', NULL, 1, NULL, 1, 1, '2021-09-19 13:11:04', '2021-09-19 13:11:04'),
(18, 'Order', NULL, 1, NULL, 1, 1, '2021-09-19 13:16:21', '2021-09-19 13:16:21'),
(19, 'Auction Order', NULL, 1, NULL, 1, 1, '2021-09-19 13:17:49', '2021-09-19 13:17:49'),
(20, 'Withdraw', NULL, 1, NULL, 1, 1, '2021-09-19 13:20:43', '2021-09-19 13:20:43'),
(21, 'Report', NULL, 1, NULL, 1, 1, '2021-09-19 13:25:20', '2021-09-19 13:25:20'),
(22, 'Pages', NULL, 1, NULL, 1, 1, '2021-09-19 13:26:51', '2021-09-19 13:26:51'),
(23, 'slider', NULL, 1, NULL, 1, 1, '2021-09-19 13:28:33', '2021-09-19 13:28:33'),
(24, 'Footer Circle Image', NULL, 1, NULL, 1, 1, '2021-09-19 13:30:02', '2021-09-19 13:30:02');

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
(5, 2, 2, 1, NULL, 1, 1, '2020-01-24 18:54:32', '2020-01-24 18:54:32'),
(6, 2, 4, 1, NULL, 1, 1, '2020-01-24 18:54:32', '2020-01-24 18:54:32'),
(7, 2, 3, 1, NULL, 1, 1, '2020-01-24 18:54:32', '2020-01-24 18:54:32'),
(8, 2, 1, 1, NULL, 1, 1, '2020-01-24 18:54:32', '2020-01-24 18:54:32'),
(9, 3, 2, 1, NULL, 1, 1, '2020-01-24 18:54:59', '2020-01-24 18:54:59'),
(10, 3, 4, 1, NULL, 1, 1, '2020-01-24 18:54:59', '2020-01-24 18:54:59'),
(11, 3, 3, 1, NULL, 1, 1, '2020-01-24 18:54:59', '2020-01-24 18:54:59'),
(12, 3, 1, 1, NULL, 1, 1, '2020-01-24 18:54:59', '2020-01-24 18:54:59'),
(13, 4, 2, 1, NULL, 1, 1, '2020-01-24 18:55:37', '2020-01-24 18:55:37'),
(14, 4, 4, 1, NULL, 1, 1, '2020-01-24 18:55:37', '2020-01-24 18:55:37'),
(15, 4, 3, 1, NULL, 1, 1, '2020-01-24 18:55:37', '2020-01-24 18:55:37'),
(16, 4, 1, 1, NULL, 1, 1, '2020-01-24 18:55:37', '2020-01-24 18:55:37'),
(17, 5, 2, 1, NULL, 1, 1, '2020-01-24 18:55:58', '2020-01-24 18:55:58'),
(18, 5, 4, 1, NULL, 1, 1, '2020-01-24 18:55:58', '2020-01-24 18:55:58'),
(19, 5, 3, 1, NULL, 1, 1, '2020-01-24 18:55:58', '2020-01-24 18:55:58'),
(20, 5, 1, 1, NULL, 1, 1, '2020-01-24 18:55:58', '2020-01-24 18:55:58'),
(50, 1, 2, 1, NULL, 1, 1, '2020-12-05 15:05:04', '2020-12-05 15:05:04'),
(51, 1, 4, 1, NULL, 1, 1, '2020-12-05 15:05:04', '2020-12-05 15:05:04'),
(52, 1, 3, 1, NULL, 1, 1, '2020-12-05 15:05:04', '2020-12-05 15:05:04'),
(53, 1, 1, 1, NULL, 1, 1, '2020-12-05 15:05:04', '2020-12-05 15:05:04'),
(54, 10, 3, 1, NULL, 1, 1, '2021-07-14 09:08:07', '2021-07-14 09:08:07'),
(59, 11, 2, 1, NULL, 1, 1, '2021-09-19 12:51:41', '2021-09-19 12:51:41'),
(60, 11, 4, 1, NULL, 1, 1, '2021-09-19 12:51:41', '2021-09-19 12:51:41'),
(61, 11, 3, 1, NULL, 1, 1, '2021-09-19 12:51:41', '2021-09-19 12:51:41'),
(62, 11, 1, 1, NULL, 1, 1, '2021-09-19 12:51:41', '2021-09-19 12:51:41'),
(63, 12, 2, 1, NULL, 1, 1, '2021-09-19 12:51:59', '2021-09-19 12:51:59'),
(64, 12, 4, 1, NULL, 1, 1, '2021-09-19 12:51:59', '2021-09-19 12:51:59'),
(65, 12, 3, 1, NULL, 1, 1, '2021-09-19 12:51:59', '2021-09-19 12:51:59'),
(66, 12, 1, 1, NULL, 1, 1, '2021-09-19 12:51:59', '2021-09-19 12:51:59'),
(67, 13, 2, 1, NULL, 1, 1, '2021-09-19 12:56:31', '2021-09-19 12:56:31'),
(68, 13, 4, 1, NULL, 1, 1, '2021-09-19 12:56:31', '2021-09-19 12:56:31'),
(69, 13, 3, 1, NULL, 1, 1, '2021-09-19 12:56:31', '2021-09-19 12:56:31'),
(70, 13, 1, 1, NULL, 1, 1, '2021-09-19 12:56:31', '2021-09-19 12:56:31'),
(71, 14, 2, 1, NULL, 1, 1, '2021-09-19 13:01:56', '2021-09-19 13:01:56'),
(72, 14, 4, 1, NULL, 1, 1, '2021-09-19 13:01:56', '2021-09-19 13:01:56'),
(73, 14, 3, 1, NULL, 1, 1, '2021-09-19 13:01:56', '2021-09-19 13:01:56'),
(74, 14, 1, 1, NULL, 1, 1, '2021-09-19 13:01:56', '2021-09-19 13:01:56'),
(75, 15, 2, 1, NULL, 1, 1, '2021-09-19 13:05:48', '2021-09-19 13:05:48'),
(76, 15, 4, 1, NULL, 1, 1, '2021-09-19 13:05:48', '2021-09-19 13:05:48'),
(77, 15, 3, 1, NULL, 1, 1, '2021-09-19 13:05:48', '2021-09-19 13:05:48'),
(78, 15, 1, 1, NULL, 1, 1, '2021-09-19 13:05:48', '2021-09-19 13:05:48'),
(79, 16, 2, 1, NULL, 1, 1, '2021-09-19 13:07:51', '2021-09-19 13:07:51'),
(80, 16, 4, 1, NULL, 1, 1, '2021-09-19 13:07:51', '2021-09-19 13:07:51'),
(81, 16, 8, 1, NULL, 1, 1, '2021-09-19 13:07:51', '2021-09-19 13:07:51'),
(82, 16, 3, 1, NULL, 1, 1, '2021-09-19 13:07:51', '2021-09-19 13:07:51'),
(83, 16, 1, 1, NULL, 1, 1, '2021-09-19 13:07:51', '2021-09-19 13:07:51'),
(84, 17, 2, 1, NULL, 1, 1, '2021-09-19 13:11:04', '2021-09-19 13:11:04'),
(85, 17, 4, 1, NULL, 1, 1, '2021-09-19 13:11:04', '2021-09-19 13:11:04'),
(86, 17, 8, 1, NULL, 1, 1, '2021-09-19 13:11:04', '2021-09-19 13:11:04'),
(87, 17, 3, 1, NULL, 1, 1, '2021-09-19 13:11:04', '2021-09-19 13:11:04'),
(88, 17, 1, 1, NULL, 1, 1, '2021-09-19 13:11:04', '2021-09-19 13:11:04'),
(89, 18, 8, 1, NULL, 1, 1, '2021-09-19 13:16:21', '2021-09-19 13:16:21'),
(90, 18, 1, 1, NULL, 1, 1, '2021-09-19 13:16:21', '2021-09-19 13:16:21'),
(91, 19, 8, 1, NULL, 1, 1, '2021-09-19 13:17:49', '2021-09-19 13:17:49'),
(92, 19, 1, 1, NULL, 1, 1, '2021-09-19 13:17:49', '2021-09-19 13:17:49'),
(93, 20, 3, 1, NULL, 1, 1, '2021-09-19 13:20:43', '2021-09-19 13:20:43'),
(94, 20, 1, 1, NULL, 1, 1, '2021-09-19 13:20:43', '2021-09-19 13:20:43'),
(95, 21, 1, 1, NULL, 1, 1, '2021-09-19 13:25:20', '2021-09-19 13:25:20'),
(96, 22, 3, 1, NULL, 1, 1, '2021-09-19 13:26:51', '2021-09-19 13:26:51'),
(97, 23, 2, 1, NULL, 1, 1, '2021-09-19 13:28:33', '2021-09-19 13:28:33'),
(98, 23, 4, 1, NULL, 1, 1, '2021-09-19 13:28:33', '2021-09-19 13:28:33'),
(99, 23, 3, 1, NULL, 1, 1, '2021-09-19 13:28:33', '2021-09-19 13:28:33'),
(100, 23, 1, 1, NULL, 1, 1, '2021-09-19 13:28:33', '2021-09-19 13:28:33'),
(101, 24, 2, 1, NULL, 1, 1, '2021-09-19 13:30:02', '2021-09-19 13:30:02'),
(102, 24, 4, 1, NULL, 1, 1, '2021-09-19 13:30:02', '2021-09-19 13:30:02'),
(103, 24, 3, 1, NULL, 1, 1, '2021-09-19 13:30:02', '2021-09-19 13:30:02'),
(104, 24, 1, 1, NULL, 1, 1, '2021-09-19 13:30:02', '2021-09-19 13:30:02'),
(105, 6, 5, 1, NULL, 1, 1, '2021-09-28 22:28:47', '2021-09-28 22:28:47'),
(106, 6, 2, 1, NULL, 1, 1, '2021-09-28 22:28:47', '2021-09-28 22:28:47'),
(107, 6, 4, 1, NULL, 1, 1, '2021-09-28 22:28:47', '2021-09-28 22:28:47'),
(108, 6, 3, 1, NULL, 1, 1, '2021-09-28 22:28:47', '2021-09-28 22:28:47'),
(109, 6, 1, 1, NULL, 1, 1, '2021-09-28 22:28:47', '2021-09-28 22:28:47'),
(110, 6, 6, 1, NULL, 1, 1, '2021-09-28 22:28:47', '2021-09-28 22:28:47');

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
(631, 1, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(632, 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(633, 1, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(634, 1, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(635, 2, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(636, 2, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(637, 2, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(638, 2, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(639, 3, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(640, 3, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(641, 3, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(642, 3, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(643, 6, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(644, 6, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(645, 6, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(646, 6, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(647, 6, 2, 5, 1, NULL, NULL, NULL, NULL, NULL),
(648, 6, 2, 6, 1, NULL, NULL, NULL, NULL, NULL),
(649, 10, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(650, 11, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(651, 11, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(652, 11, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(653, 11, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(654, 12, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(655, 12, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(656, 12, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(657, 12, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(658, 13, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(659, 13, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(660, 13, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(661, 13, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(662, 14, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(663, 14, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(664, 14, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(665, 14, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(666, 15, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(667, 15, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(668, 15, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(669, 15, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(670, 16, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(671, 16, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(672, 16, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(673, 16, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(674, 16, 2, 8, 1, NULL, NULL, NULL, NULL, NULL),
(675, 17, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(676, 17, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(677, 17, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(678, 17, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(679, 17, 2, 8, 1, NULL, NULL, NULL, NULL, NULL),
(680, 18, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(681, 18, 2, 8, 1, NULL, NULL, NULL, NULL, NULL),
(682, 19, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(683, 19, 2, 8, 1, NULL, NULL, NULL, NULL, NULL),
(684, 20, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(685, 20, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(686, 21, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(687, 22, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(688, 23, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(689, 23, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(690, 23, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(691, 23, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(692, 24, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(693, 24, 2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(694, 24, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
(695, 24, 2, 4, 1, NULL, NULL, NULL, NULL, NULL),
(696, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(697, 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(698, 1, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(699, 1, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(700, 2, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(701, 2, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(702, 2, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(703, 2, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(704, 3, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(705, 3, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(706, 3, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(707, 3, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(708, 4, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(709, 4, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(710, 4, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(711, 4, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(712, 5, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(713, 5, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(714, 5, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(715, 5, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(716, 6, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(717, 6, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(718, 6, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(719, 6, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(720, 6, 1, 5, 1, NULL, NULL, NULL, NULL, NULL),
(721, 6, 1, 6, 1, NULL, NULL, NULL, NULL, NULL),
(722, 10, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(723, 11, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(724, 11, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(725, 11, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(726, 11, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(727, 12, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(728, 12, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(729, 12, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(730, 12, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(731, 13, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(732, 13, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(733, 13, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(734, 13, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(735, 14, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(736, 14, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(737, 14, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(738, 14, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(739, 15, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(740, 15, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(741, 15, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(742, 15, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(743, 16, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(744, 16, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(745, 16, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(746, 16, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(747, 16, 1, 8, 1, NULL, NULL, NULL, NULL, NULL),
(748, 17, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(749, 17, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(750, 17, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(751, 17, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(752, 17, 1, 8, 1, NULL, NULL, NULL, NULL, NULL),
(753, 18, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(754, 18, 1, 8, 1, NULL, NULL, NULL, NULL, NULL),
(755, 19, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(756, 19, 1, 8, 1, NULL, NULL, NULL, NULL, NULL),
(757, 20, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(758, 20, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(759, 21, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(760, 22, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(761, 23, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(762, 23, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(763, 23, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(764, 23, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(765, 24, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(766, 24, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(767, 24, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(768, 24, 1, 4, 1, NULL, NULL, NULL, NULL, NULL);

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
(778, 1, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(779, 1, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(780, 1, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(781, 1, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(782, 2, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(783, 2, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(784, 2, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(785, 2, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(786, 3, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(787, 3, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(788, 3, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(789, 3, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(790, 6, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(791, 6, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(792, 6, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(793, 6, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(794, 6, 30, 5, 1, NULL, NULL, NULL, NULL, NULL),
(795, 6, 30, 6, 1, NULL, NULL, NULL, NULL, NULL),
(796, 10, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(797, 11, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(798, 11, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(799, 11, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(800, 11, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(801, 12, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(802, 12, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(803, 12, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(804, 12, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(805, 13, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(806, 13, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(807, 13, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(808, 13, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(809, 14, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(810, 14, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(811, 14, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(812, 14, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(813, 15, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(814, 15, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(815, 15, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(816, 15, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(817, 16, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(818, 16, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(819, 16, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(820, 16, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(821, 16, 30, 8, 1, NULL, NULL, NULL, NULL, NULL),
(822, 17, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(823, 17, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(824, 17, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(825, 17, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(826, 17, 30, 8, 1, NULL, NULL, NULL, NULL, NULL),
(827, 18, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(828, 18, 30, 8, 1, NULL, NULL, NULL, NULL, NULL),
(829, 19, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(830, 19, 30, 8, 1, NULL, NULL, NULL, NULL, NULL),
(831, 20, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(832, 20, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(833, 21, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(834, 22, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(835, 23, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(836, 23, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(837, 23, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(838, 23, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(839, 24, 30, 1, 1, NULL, NULL, NULL, NULL, NULL),
(840, 24, 30, 2, 1, NULL, NULL, NULL, NULL, NULL),
(841, 24, 30, 3, 1, NULL, NULL, NULL, NULL, NULL),
(842, 24, 30, 4, 1, NULL, NULL, NULL, NULL, NULL),
(843, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(844, 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(845, 1, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(846, 1, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(847, 2, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(848, 2, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(849, 2, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(850, 2, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(851, 3, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(852, 3, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(853, 3, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(854, 3, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(855, 4, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(856, 4, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(857, 4, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(858, 4, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(859, 5, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(860, 5, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(861, 5, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(862, 5, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(863, 6, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(864, 6, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(865, 6, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(866, 6, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(867, 6, 1, 5, 1, NULL, NULL, NULL, NULL, NULL),
(868, 6, 1, 6, 1, NULL, NULL, NULL, NULL, NULL),
(869, 10, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(870, 11, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(871, 11, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(872, 11, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(873, 11, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(874, 12, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(875, 12, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(876, 12, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(877, 12, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(878, 13, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(879, 13, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(880, 13, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(881, 13, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(882, 14, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(883, 14, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(884, 14, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(885, 14, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(886, 15, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(887, 15, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(888, 15, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(889, 15, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(890, 16, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(891, 16, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(892, 16, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(893, 16, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(894, 16, 1, 8, 1, NULL, NULL, NULL, NULL, NULL),
(895, 17, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(896, 17, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(897, 17, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(898, 17, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(899, 17, 1, 8, 1, NULL, NULL, NULL, NULL, NULL),
(900, 18, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(901, 18, 1, 8, 1, NULL, NULL, NULL, NULL, NULL),
(902, 19, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(903, 19, 1, 8, 1, NULL, NULL, NULL, NULL, NULL),
(904, 20, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(905, 20, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(906, 21, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(907, 22, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(908, 23, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(909, 23, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(910, 23, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(911, 23, 1, 4, 1, NULL, NULL, NULL, NULL, NULL),
(912, 24, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(913, 24, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(914, 24, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(915, 24, 1, 4, 1, NULL, NULL, NULL, NULL, NULL);

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
(1, 1, 1, 1, 1, 2, 2, 0, '2021-09-19 22:28:34', '2021-09-19 22:28:34'),
(2, 2, 2, 2, 0, 32, 2, 0, '2021-09-19 23:30:06', '2021-09-19 23:30:06'),
(3, 2, 2, 3, 0, 32, 2, 0, '2021-09-19 23:30:06', '2021-09-19 23:30:06'),
(4, 2, 2, 4, 0, 32, 2, 0, '2021-09-19 23:30:06', '2021-09-19 23:30:06'),
(5, 2, 2, 5, 0, 32, 2, 0, '2021-09-19 23:30:06', '2021-09-19 23:30:06'),
(6, 2, 2, 6, 0, 32, 2, 0, '2021-09-19 23:30:06', '2021-09-19 23:30:06'),
(7, 2, 2, 7, 0, 32, 2, 0, '2021-09-19 23:30:06', '2021-09-19 23:30:06'),
(8, 2, 2, 8, 0, 32, 2, 0, '2021-09-19 23:30:06', '2021-09-19 23:30:06'),
(9, 2, 2, 9, 0, 32, 2, 0, '2021-09-19 23:30:06', '2021-09-19 23:30:06'),
(10, 2, 2, 10, 0, 32, 2, 0, '2021-09-19 23:30:06', '2021-09-19 23:30:06'),
(11, 2, 2, 11, 0, 32, 2, 0, '2021-09-19 23:30:06', '2021-09-19 23:30:06'),
(12, 3, 2, 2, 0, 31, 2, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(13, 3, 2, 3, 0, 31, 2, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(14, 3, 2, 4, 0, 31, 2, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(15, 3, 2, 5, 0, 31, 2, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(16, 3, 2, 6, 0, 31, 2, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(17, 3, 2, 7, 0, 31, 2, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(18, 3, 2, 8, 0, 31, 2, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(19, 3, 2, 9, 0, 31, 2, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(20, 3, 2, 10, 0, 31, 2, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(21, 3, 2, 11, 0, 31, 2, 0, '2021-09-20 00:38:09', '2021-09-20 00:38:09'),
(22, 4, 2, 12, 1, 5, 2, 2, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(23, 4, 2, 13, 1, 5, 2, 2, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(24, 4, 2, 14, 1, 5, 2, 2, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(25, 4, 2, 15, 1, 5, 2, 2, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(26, 4, 2, 16, 1, 5, 2, 2, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(27, 4, 2, 17, 1, 5, 2, 2, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(28, 4, 2, 18, 1, 5, 2, 2, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(29, 4, 2, 19, 1, 5, 2, 2, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(30, 4, 2, 20, 1, 5, 1, 1, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(31, 4, 2, 21, 1, 5, 1, 2, '2021-09-20 19:09:09', '2021-09-21 19:57:56'),
(32, 5, 3, 22, 0, 32, 2, 2, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(33, 5, 3, 23, 0, 32, 2, 2, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(34, 5, 3, 24, 0, 32, 2, 2, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(35, 5, 3, 25, 0, 32, 2, 2, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(36, 5, 3, 26, 0, 32, 2, 2, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(37, 5, 3, 27, 0, 32, 2, 2, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(38, 5, 3, 28, 0, 32, 2, 2, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(39, 5, 3, 29, 0, 32, 2, 2, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(40, 5, 3, 31, 0, 32, 2, 1, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(41, 5, 3, 33, 0, 32, 2, 1, '2021-09-20 20:54:42', '2021-09-22 19:58:19'),
(42, 6, 3, 22, 1, 5, 2, 2, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(43, 6, 3, 23, 1, 5, 2, 2, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(44, 6, 3, 24, 1, 5, 2, 2, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(45, 6, 3, 25, 1, 5, 2, 2, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(46, 6, 3, 26, 1, 5, 2, 2, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(47, 6, 3, 27, 1, 5, 2, 2, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(48, 6, 3, 28, 1, 5, 2, 2, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(49, 6, 3, 29, 1, 5, 2, 2, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(50, 6, 3, 31, 1, 5, 2, 1, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(51, 6, 3, 33, 1, 5, 2, 1, '2021-09-21 10:18:02', '2021-09-23 15:59:04'),
(52, 7, 4, 34, 0, 32, 1, 2, '2021-09-21 21:19:40', '2021-09-28 13:13:22'),
(53, 7, 4, 35, 0, 32, 1, 1, '2021-09-21 21:19:40', '2021-09-23 16:29:19'),
(54, 7, 4, 36, 0, 32, 1, 2, '2021-09-21 21:19:40', '2021-09-28 13:13:22'),
(55, 7, 4, 37, 0, 32, 1, 2, '2021-09-21 21:19:40', '2021-09-28 13:13:22'),
(56, 7, 4, 38, 0, 32, 1, 2, '2021-09-21 21:19:40', '2021-09-28 13:13:22'),
(57, 7, 4, 39, 0, 32, 1, 2, '2021-09-21 21:19:40', '2021-09-28 13:13:22'),
(58, 7, 4, 40, 0, 32, 1, 2, '2021-09-21 21:19:40', '2021-09-28 13:13:22'),
(59, 7, 4, 41, 0, 32, 1, 2, '2021-09-21 21:19:40', '2021-09-28 13:13:22'),
(60, 7, 4, 42, 0, 32, 1, 2, '2021-09-21 21:19:40', '2021-09-28 13:13:22'),
(61, 7, 4, 43, 0, 32, 1, 2, '2021-09-21 21:19:40', '2021-09-28 13:13:22'),
(62, 8, 4, 34, 1, 9, 2, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(63, 8, 4, 35, 1, 9, 1, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(64, 8, 4, 36, 1, 9, 2, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(65, 8, 4, 37, 1, 9, 1, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(66, 8, 4, 38, 1, 9, 2, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(67, 8, 4, 39, 1, 9, 1, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(68, 8, 4, 40, 1, 9, 2, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(69, 8, 4, 41, 1, 9, 1, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(70, 8, 4, 42, 1, 9, 2, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(71, 8, 4, 43, 1, 9, 1, 0, '2021-09-21 21:37:01', '2021-09-21 21:37:01'),
(72, 9, 5, 44, 0, 32, 2, 2, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(73, 9, 5, 45, 0, 32, 2, 2, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(74, 9, 5, 46, 0, 32, 2, 1, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(75, 9, 5, 47, 0, 32, 2, 2, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(76, 9, 5, 48, 0, 32, 2, 2, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(77, 9, 5, 49, 0, 32, 2, 2, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(78, 9, 5, 50, 0, 32, 2, 2, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(79, 9, 5, 51, 0, 32, 2, 2, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(80, 9, 5, 52, 0, 32, 2, 2, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(81, 9, 5, 53, 0, 32, 1, 1, '2021-09-22 19:55:42', '2021-09-24 19:13:22'),
(82, 10, 5, 44, 1, 5, 2, 2, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(83, 10, 5, 45, 1, 5, 2, 2, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(84, 10, 5, 46, 1, 5, 2, 1, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(85, 10, 5, 47, 1, 5, 2, 2, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(86, 10, 5, 48, 1, 5, 2, 2, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(87, 10, 5, 49, 1, 5, 2, 2, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(88, 10, 5, 50, 1, 5, 2, 2, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(89, 10, 5, 51, 1, 5, 2, 2, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(90, 10, 5, 52, 1, 5, 2, 2, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(91, 10, 5, 53, 1, 5, 2, 2, '2021-09-23 16:00:15', '2021-09-25 18:18:18'),
(92, 11, 6, 54, 0, 32, 2, 2, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(93, 11, 6, 55, 0, 32, 2, 2, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(94, 11, 6, 56, 0, 32, 2, 2, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(95, 11, 6, 57, 0, 32, 2, 2, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(96, 11, 6, 58, 0, 32, 2, 2, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(97, 11, 6, 59, 0, 32, 2, 2, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(98, 11, 6, 60, 0, 32, 2, 2, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(99, 11, 6, 61, 0, 32, 2, 2, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(100, 11, 6, 62, 0, 32, 2, 2, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(101, 11, 6, 63, 0, 32, 2, 2, '2021-09-23 18:50:11', '2021-09-25 18:40:13'),
(102, 12, 6, 54, 1, 3, 2, 2, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(103, 12, 6, 55, 1, 3, 1, 1, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(104, 12, 6, 56, 1, 3, 2, 2, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(105, 12, 6, 57, 1, 3, 1, 1, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(106, 12, 6, 58, 1, 3, 2, 2, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(107, 12, 6, 59, 1, 3, 1, 1, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(108, 12, 6, 60, 1, 3, 2, 2, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(109, 12, 6, 61, 1, 3, 1, 1, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(110, 12, 6, 62, 1, 3, 2, 2, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(111, 12, 6, 63, 1, 3, 1, 1, '2021-09-24 03:26:43', '2021-09-25 18:54:16'),
(112, 13, 6, 54, 1, 5, 2, 2, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(113, 13, 6, 55, 1, 5, 2, 2, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(114, 13, 6, 56, 1, 5, 2, 2, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(115, 13, 6, 57, 1, 5, 2, 2, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(116, 13, 6, 58, 1, 5, 2, 2, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(117, 13, 6, 59, 1, 5, 2, 2, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(118, 13, 6, 60, 1, 5, 2, 2, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(119, 13, 6, 61, 1, 5, 2, 2, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(120, 13, 6, 62, 1, 5, 2, 2, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(121, 13, 6, 63, 1, 5, 2, 2, '2021-09-24 09:25:23', '2021-09-26 17:11:11'),
(122, 14, 7, 73, 0, 32, 2, 2, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(123, 14, 7, 74, 0, 32, 2, 2, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(124, 14, 7, 75, 0, 32, 2, 2, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(125, 14, 7, 76, 0, 32, 2, 2, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(126, 14, 7, 77, 0, 32, 2, 2, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(127, 14, 7, 78, 0, 32, 2, 2, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(128, 14, 7, 79, 0, 32, 2, 2, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(129, 14, 7, 80, 0, 32, 2, 2, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(130, 14, 7, 81, 0, 32, 2, 2, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(131, 14, 7, 82, 0, 32, 2, 2, '2021-09-24 19:08:50', '2021-09-26 20:58:24'),
(132, 15, 7, 73, 1, 3, 2, 2, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(133, 15, 7, 74, 1, 3, 1, 1, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(134, 15, 7, 75, 1, 3, 2, 2, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(135, 15, 7, 76, 1, 3, 1, 1, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(136, 15, 7, 77, 1, 3, 2, 2, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(137, 15, 7, 78, 1, 3, 1, 1, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(138, 15, 7, 79, 1, 3, 2, 2, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(139, 15, 7, 80, 1, 3, 1, 1, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(140, 15, 7, 81, 1, 3, 2, 2, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(141, 15, 7, 82, 1, 3, 1, 1, '2021-09-25 06:39:44', '2021-09-26 23:29:43'),
(142, 16, 7, 73, 1, 5, 2, 2, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(143, 16, 7, 74, 1, 5, 2, 2, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(144, 16, 7, 75, 1, 5, 2, 2, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(145, 16, 7, 76, 1, 5, 2, 2, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(146, 16, 7, 77, 1, 5, 2, 2, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(147, 16, 7, 78, 1, 5, 2, 2, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(148, 16, 7, 79, 1, 5, 2, 2, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(149, 16, 7, 80, 1, 5, 2, 2, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(150, 16, 7, 81, 1, 5, 2, 2, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(151, 16, 7, 82, 1, 5, 2, 2, '2021-09-25 10:10:05', '2021-09-26 17:10:44'),
(152, 17, 8, 83, 0, 32, 2, 2, '2021-09-25 18:40:36', '2021-09-28 13:21:49'),
(153, 17, 8, 84, 0, 32, 2, 2, '2021-09-25 18:40:36', '2021-09-28 13:21:49'),
(154, 17, 8, 85, 0, 32, 2, 2, '2021-09-25 18:40:36', '2021-09-28 13:21:49'),
(155, 17, 8, 86, 0, 32, 2, 2, '2021-09-25 18:40:36', '2021-09-28 13:21:49'),
(156, 17, 8, 87, 0, 32, 2, 2, '2021-09-25 18:40:36', '2021-09-28 13:21:49'),
(157, 17, 8, 88, 0, 32, 2, 2, '2021-09-25 18:40:36', '2021-09-28 13:21:49'),
(158, 17, 8, 89, 0, 32, 2, 2, '2021-09-25 18:40:36', '2021-09-28 13:21:49'),
(159, 17, 8, 90, 0, 32, 2, 2, '2021-09-25 18:40:36', '2021-09-28 13:21:49'),
(160, 17, 8, 91, 0, 32, 2, 2, '2021-09-25 18:40:36', '2021-09-28 13:21:49'),
(161, 17, 8, 92, 0, 32, 2, 2, '2021-09-25 18:40:36', '2021-09-28 13:21:49'),
(162, 18, 8, 83, 1, 3, 2, 2, '2021-09-25 18:55:15', '2021-10-02 07:41:40'),
(163, 18, 8, 84, 1, 3, 1, 1, '2021-09-25 18:55:15', '2021-10-02 07:41:40'),
(164, 18, 8, 85, 1, 3, 2, 2, '2021-09-25 18:55:15', '2021-10-02 07:41:40'),
(165, 18, 8, 86, 1, 3, 1, 1, '2021-09-25 18:55:15', '2021-10-02 07:41:40'),
(166, 18, 8, 87, 1, 3, 2, 2, '2021-09-25 18:55:15', '2021-10-02 07:41:40'),
(167, 18, 8, 88, 1, 3, 1, 1, '2021-09-25 18:55:15', '2021-10-02 07:41:40'),
(168, 18, 8, 89, 1, 3, 2, 2, '2021-09-25 18:55:15', '2021-10-02 07:41:40'),
(169, 18, 8, 90, 1, 3, 1, 1, '2021-09-25 18:55:15', '2021-10-02 07:41:40'),
(170, 18, 8, 91, 1, 3, 2, 2, '2021-09-25 18:55:15', '2021-10-02 07:41:40'),
(171, 18, 8, 92, 1, 3, 1, 1, '2021-09-25 18:55:15', '2021-10-02 07:41:40'),
(172, 19, 8, 83, 1, 20, 2, 2, '2021-09-26 04:34:24', '2021-09-29 21:44:26'),
(173, 19, 8, 84, 1, 20, 1, 1, '2021-09-26 04:34:24', '2021-09-29 21:44:26'),
(174, 19, 8, 85, 1, 20, 2, 2, '2021-09-26 04:34:24', '2021-09-29 21:44:26'),
(175, 19, 8, 86, 1, 20, 1, 1, '2021-09-26 04:34:24', '2021-09-29 21:44:26'),
(176, 19, 8, 87, 1, 20, 2, 2, '2021-09-26 04:34:24', '2021-09-29 21:44:26'),
(177, 19, 8, 88, 1, 20, 1, 1, '2021-09-26 04:34:24', '2021-09-29 21:44:26'),
(178, 19, 8, 89, 1, 20, 2, 2, '2021-09-26 04:34:24', '2021-09-29 21:44:26'),
(179, 19, 8, 90, 1, 20, 1, 1, '2021-09-26 04:34:24', '2021-09-29 21:44:26'),
(180, 19, 8, 91, 1, 20, 2, 2, '2021-09-26 04:34:24', '2021-09-29 21:44:26'),
(181, 19, 8, 92, 1, 20, 1, 1, '2021-09-26 04:34:24', '2021-09-29 21:44:26'),
(182, 20, 8, 83, 1, 5, 1, 1, '2021-09-26 08:17:01', '2021-09-29 11:21:01'),
(183, 20, 8, 84, 1, 5, 2, 2, '2021-09-26 08:17:01', '2021-09-29 11:21:01'),
(184, 20, 8, 85, 1, 5, 2, 2, '2021-09-26 08:17:01', '2021-09-29 11:21:01'),
(185, 20, 8, 86, 1, 5, 2, 2, '2021-09-26 08:17:01', '2021-09-29 11:21:01'),
(186, 20, 8, 87, 1, 5, 2, 2, '2021-09-26 08:17:01', '2021-09-29 11:21:01'),
(187, 20, 8, 88, 1, 5, 2, 2, '2021-09-26 08:17:01', '2021-09-29 11:21:01'),
(188, 20, 8, 89, 1, 5, 2, 2, '2021-09-26 08:17:01', '2021-09-29 11:21:01'),
(189, 20, 8, 90, 1, 5, 2, 2, '2021-09-26 08:17:01', '2021-09-29 11:21:01'),
(190, 20, 8, 91, 1, 5, 2, 2, '2021-09-26 08:17:01', '2021-09-29 11:21:01'),
(191, 20, 8, 92, 1, 5, 2, 2, '2021-09-26 08:17:01', '2021-09-29 11:21:01'),
(192, 21, 9, 93, 1, 5, 2, 1, '2021-09-26 20:55:22', '2021-10-02 08:54:32'),
(193, 21, 9, 94, 1, 5, 2, 2, '2021-09-26 20:55:22', '2021-10-02 08:54:32'),
(194, 21, 9, 95, 1, 5, 2, 2, '2021-09-26 20:55:22', '2021-10-02 08:54:32'),
(195, 21, 9, 96, 1, 5, 2, 1, '2021-09-26 20:55:22', '2021-10-02 08:54:32'),
(196, 21, 9, 97, 1, 5, 2, 1, '2021-09-26 20:55:22', '2021-10-02 08:54:32'),
(197, 21, 9, 98, 1, 5, 2, 1, '2021-09-26 20:55:22', '2021-10-02 08:54:32'),
(198, 21, 9, 99, 1, 5, 2, 2, '2021-09-26 20:55:22', '2021-10-02 08:54:32'),
(199, 21, 9, 100, 1, 5, 2, 1, '2021-09-26 20:55:22', '2021-10-02 08:54:32'),
(200, 21, 9, 101, 1, 5, 2, 1, '2021-09-26 20:55:22', '2021-10-02 08:54:32'),
(201, 21, 9, 102, 1, 5, 2, 1, '2021-09-26 20:55:22', '2021-10-02 08:54:32'),
(202, 22, 9, 93, 0, 32, 2, 1, '2021-09-26 20:58:06', '2021-09-29 22:55:28'),
(203, 22, 9, 94, 0, 32, 2, 2, '2021-09-26 20:58:06', '2021-10-01 16:37:34'),
(204, 22, 9, 95, 0, 32, 2, 2, '2021-09-26 20:58:06', '2021-10-01 16:37:34'),
(205, 22, 9, 96, 0, 32, 2, 1, '2021-09-26 20:58:06', '2021-09-29 22:55:28'),
(206, 22, 9, 97, 0, 32, 2, 1, '2021-09-26 20:58:06', '2021-09-29 22:55:28'),
(207, 22, 9, 98, 0, 32, 2, 1, '2021-09-26 20:58:06', '2021-09-29 22:55:28'),
(208, 22, 9, 99, 0, 32, 2, 2, '2021-09-26 20:58:06', '2021-10-01 16:37:34'),
(209, 22, 9, 100, 0, 32, 2, 1, '2021-09-26 20:58:06', '2021-09-29 22:55:28'),
(210, 22, 9, 101, 0, 32, 2, 1, '2021-09-26 20:58:06', '2021-09-29 22:55:28'),
(211, 22, 9, 102, 0, 32, 2, 1, '2021-09-26 20:58:06', '2021-09-29 22:55:28'),
(212, 23, 9, 93, 1, 3, 2, 1, '2021-09-26 23:29:02', '2021-10-02 07:41:40'),
(213, 23, 9, 94, 1, 3, 1, 1, '2021-09-26 23:29:02', '2021-10-02 07:41:40'),
(214, 23, 9, 95, 1, 3, 2, 2, '2021-09-26 23:29:02', '2021-10-02 07:41:40'),
(215, 23, 9, 96, 1, 3, 1, 2, '2021-09-26 23:29:02', '2021-10-02 07:41:40'),
(216, 23, 9, 97, 1, 3, 2, 1, '2021-09-26 23:29:02', '2021-10-02 07:41:40'),
(217, 23, 9, 98, 1, 3, 1, 2, '2021-09-26 23:29:02', '2021-10-02 07:41:40'),
(218, 23, 9, 99, 1, 3, 2, 2, '2021-09-26 23:29:02', '2021-10-02 07:41:40'),
(219, 23, 9, 100, 1, 3, 1, 2, '2021-09-26 23:29:02', '2021-10-02 07:41:40'),
(220, 23, 9, 101, 1, 3, 2, 1, '2021-09-26 23:29:02', '2021-10-02 07:41:40'),
(221, 23, 9, 102, 1, 3, 1, 2, '2021-09-26 23:29:02', '2021-10-02 07:41:40'),
(222, 24, 10, 103, 1, 20, 2, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(223, 24, 10, 104, 1, 20, 1, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(224, 24, 10, 105, 1, 20, 2, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(225, 24, 10, 106, 1, 20, 1, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(226, 24, 10, 107, 1, 20, 2, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(227, 24, 10, 108, 1, 20, 1, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(228, 24, 10, 109, 1, 20, 2, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(229, 24, 10, 110, 1, 20, 1, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(230, 24, 10, 111, 1, 20, 2, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(231, 24, 10, 112, 1, 20, 1, 0, '2021-09-28 01:18:18', '2021-09-28 01:18:18'),
(232, 25, 10, 103, 0, 32, 2, 1, '2021-09-28 13:14:16', '2021-10-01 16:37:34'),
(233, 25, 10, 104, 0, 32, 2, 1, '2021-09-28 13:14:16', '2021-10-01 16:37:34'),
(234, 25, 10, 105, 0, 32, 2, 1, '2021-09-28 13:14:16', '2021-10-01 16:37:34'),
(235, 25, 10, 106, 0, 32, 2, 2, '2021-09-28 13:14:16', '2021-10-01 16:37:34'),
(236, 25, 10, 107, 0, 32, 2, 1, '2021-09-28 13:14:16', '2021-10-01 16:37:34'),
(237, 25, 10, 108, 0, 32, 2, 1, '2021-09-28 13:14:16', '2021-10-01 16:37:34'),
(238, 25, 10, 109, 0, 32, 2, 2, '2021-09-28 13:14:16', '2021-10-01 16:37:34'),
(239, 25, 10, 110, 0, 32, 2, 1, '2021-09-28 13:14:16', '2021-10-01 16:37:34'),
(240, 25, 10, 111, 0, 32, 2, 1, '2021-09-28 13:14:16', '2021-10-01 16:37:34'),
(241, 25, 10, 112, 0, 32, 2, 1, '2021-09-28 13:14:16', '2021-10-01 16:37:34'),
(242, 26, 11, 113, 0, 32, 2, 1, '2021-09-29 11:25:12', '2021-10-01 16:37:34'),
(243, 26, 11, 114, 0, 32, 2, 1, '2021-09-29 11:25:12', '2021-10-01 16:37:34'),
(244, 26, 11, 115, 0, 32, 2, 1, '2021-09-29 11:25:12', '2021-10-01 16:37:34'),
(245, 26, 11, 116, 0, 32, 2, 1, '2021-09-29 11:25:12', '2021-10-01 16:37:34'),
(246, 26, 11, 117, 0, 32, 2, 2, '2021-09-29 11:25:12', '2021-10-01 16:37:34'),
(247, 26, 11, 118, 0, 32, 2, 2, '2021-09-29 11:25:12', '2021-10-01 16:37:34'),
(248, 26, 11, 119, 0, 32, 2, 1, '2021-09-29 11:25:12', '2021-10-01 16:37:34'),
(249, 26, 11, 120, 0, 32, 2, 1, '2021-09-29 11:25:12', '2021-10-01 16:37:34'),
(250, 26, 11, 121, 0, 32, 2, 1, '2021-09-29 11:25:12', '2021-10-01 16:37:34'),
(251, 26, 11, 122, 0, 32, 2, 2, '2021-09-29 11:25:12', '2021-10-01 16:37:34'),
(252, 27, 11, 113, 1, 5, 2, 1, '2021-09-29 13:23:37', '2021-10-02 08:54:32'),
(253, 27, 11, 114, 1, 5, 2, 1, '2021-09-29 13:23:37', '2021-10-02 08:54:32'),
(254, 27, 11, 115, 1, 5, 2, 1, '2021-09-29 13:23:37', '2021-10-02 08:54:32'),
(255, 27, 11, 116, 1, 5, 2, 1, '2021-09-29 13:23:37', '2021-10-02 08:54:32'),
(256, 27, 11, 117, 1, 5, 2, 2, '2021-09-29 13:23:37', '2021-10-02 08:54:32'),
(257, 27, 11, 118, 1, 5, 2, 2, '2021-09-29 13:23:37', '2021-10-02 08:54:32'),
(258, 27, 11, 119, 1, 5, 2, 1, '2021-09-29 13:23:37', '2021-10-02 08:54:32'),
(259, 27, 11, 120, 1, 5, 2, 1, '2021-09-29 13:23:37', '2021-10-02 08:54:32'),
(260, 27, 11, 121, 1, 5, 2, 1, '2021-09-29 13:23:37', '2021-10-02 08:54:32'),
(261, 27, 11, 122, 1, 5, 2, 2, '2021-09-29 13:23:37', '2021-10-02 08:54:32'),
(262, 28, 12, 123, 1, 20, 2, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(263, 28, 12, 124, 1, 20, 1, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(264, 28, 12, 125, 1, 20, 2, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(265, 28, 12, 126, 1, 20, 1, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(266, 28, 12, 127, 1, 20, 2, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(267, 28, 12, 128, 1, 20, 1, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(268, 28, 12, 129, 1, 20, 2, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(269, 28, 12, 130, 1, 20, 1, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(270, 28, 12, 131, 1, 20, 2, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(271, 28, 12, 132, 1, 20, 1, 0, '2021-09-29 21:44:40', '2021-09-29 21:44:40'),
(272, 29, 12, 123, 1, 199, 2, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(273, 29, 12, 124, 1, 199, 2, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(274, 29, 12, 125, 1, 199, 2, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(275, 29, 12, 126, 1, 199, 2, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(276, 29, 12, 127, 1, 199, 1, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(277, 29, 12, 128, 1, 199, 1, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(278, 29, 12, 129, 1, 199, 2, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(279, 29, 12, 130, 1, 199, 2, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(280, 29, 12, 131, 1, 199, 2, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(281, 29, 12, 132, 1, 199, 1, 0, '2021-09-30 11:36:47', '2021-09-30 11:36:47'),
(282, 30, 13, 133, 0, 32, 2, 2, '2021-10-01 16:32:51', '2021-10-02 21:46:01'),
(283, 30, 13, 134, 0, 32, 2, 2, '2021-10-01 16:32:51', '2021-10-02 21:46:01'),
(284, 30, 13, 135, 0, 32, 2, 2, '2021-10-01 16:32:51', '2021-10-02 21:42:57'),
(285, 30, 13, 136, 0, 32, 2, 2, '2021-10-01 16:32:51', '2021-10-02 21:42:57'),
(286, 30, 13, 137, 0, 32, 2, 2, '2021-10-01 16:32:51', '2021-10-02 21:42:57'),
(287, 30, 13, 138, 0, 32, 2, 2, '2021-10-01 16:32:51', '2021-10-02 21:46:01'),
(288, 30, 13, 139, 0, 32, 2, 2, '2021-10-01 16:32:51', '2021-10-02 21:42:57'),
(289, 30, 13, 140, 0, 32, 2, 2, '2021-10-01 16:32:51', '2021-10-02 21:51:43'),
(290, 30, 13, 141, 0, 32, 2, 1, '2021-10-01 16:32:51', '2021-10-02 21:42:57'),
(291, 30, 13, 142, 0, 32, 2, 1, '2021-10-01 16:32:51', '2021-10-02 21:42:57'),
(292, 31, 14, 143, 1, 3, 2, 2, '2021-10-02 07:41:58', '2021-10-03 09:42:04'),
(293, 31, 14, 144, 1, 3, 1, 1, '2021-10-02 07:41:58', '2021-10-03 09:42:04'),
(294, 31, 14, 145, 1, 3, 2, 2, '2021-10-02 07:41:58', '2021-10-03 09:42:04'),
(295, 31, 14, 146, 1, 3, 1, 1, '2021-10-02 07:41:58', '2021-10-03 09:42:04'),
(296, 31, 14, 147, 1, 3, 2, 2, '2021-10-02 07:41:58', '2021-10-03 09:42:04'),
(297, 31, 14, 148, 1, 3, 1, 1, '2021-10-02 07:41:58', '2021-10-03 09:42:04'),
(298, 31, 14, 149, 1, 3, 2, 2, '2021-10-02 07:41:58', '2021-10-03 09:42:04'),
(299, 31, 14, 150, 1, 3, 1, 2, '2021-10-02 07:41:58', '2021-10-03 09:42:04'),
(300, 31, 14, 151, 1, 3, 2, 1, '2021-10-02 07:41:58', '2021-10-03 09:42:04'),
(301, 31, 14, 152, 1, 3, 1, 2, '2021-10-02 07:41:58', '2021-10-03 09:42:04'),
(302, 32, 15, 153, 0, 32, 2, 1, '2021-10-02 21:02:34', '2021-10-06 11:58:43'),
(303, 32, 15, 154, 0, 32, 2, 2, '2021-10-02 21:02:34', '2021-10-06 11:58:43'),
(304, 32, 15, 155, 0, 32, 2, 2, '2021-10-02 21:02:34', '2021-10-06 11:58:43'),
(305, 32, 15, 156, 0, 32, 2, 2, '2021-10-02 21:02:34', '2021-10-06 11:58:43'),
(306, 32, 15, 157, 0, 32, 2, 1, '2021-10-02 21:02:34', '2021-10-06 11:58:43'),
(307, 32, 15, 158, 0, 32, 2, 2, '2021-10-02 21:02:34', '2021-10-06 11:58:43'),
(308, 32, 15, 159, 0, 32, 2, 2, '2021-10-02 21:02:34', '2021-10-06 11:58:43'),
(309, 32, 15, 160, 0, 32, 2, 2, '2021-10-02 21:02:34', '2021-10-06 11:58:43'),
(310, 32, 15, 161, 0, 32, 2, 2, '2021-10-02 21:02:34', '2021-10-06 11:58:43'),
(311, 32, 15, 162, 0, 32, 2, 1, '2021-10-02 21:02:34', '2021-10-06 11:58:43'),
(312, 33, 15, 153, 1, 5, 2, 1, '2021-10-03 09:12:03', '2021-10-04 21:14:53'),
(313, 33, 15, 154, 1, 5, 2, 2, '2021-10-03 09:12:03', '2021-10-04 21:14:53'),
(314, 33, 15, 155, 1, 5, 2, 2, '2021-10-03 09:12:03', '2021-10-04 21:14:53'),
(315, 33, 15, 156, 1, 5, 2, 2, '2021-10-03 09:12:03', '2021-10-04 21:14:53'),
(316, 33, 15, 157, 1, 5, 2, 1, '2021-10-03 09:12:03', '2021-10-04 21:14:53'),
(317, 33, 15, 158, 1, 5, 2, 2, '2021-10-03 09:12:03', '2021-10-04 21:14:53'),
(318, 33, 15, 159, 1, 5, 2, 2, '2021-10-03 09:12:03', '2021-10-04 21:14:53'),
(319, 33, 15, 160, 1, 5, 2, 2, '2021-10-03 09:12:03', '2021-10-04 21:14:53'),
(320, 33, 15, 161, 1, 5, 2, 2, '2021-10-03 09:12:03', '2021-10-04 21:14:53'),
(321, 33, 15, 162, 1, 5, 2, 1, '2021-10-03 09:12:03', '2021-10-04 21:14:53'),
(322, 34, 15, 153, 1, 3, 2, 1, '2021-10-03 10:17:14', '2021-10-07 07:01:45'),
(323, 34, 15, 154, 1, 3, 2, 2, '2021-10-03 10:17:14', '2021-10-07 07:01:45'),
(324, 34, 15, 155, 1, 3, 2, 2, '2021-10-03 10:17:14', '2021-10-07 07:01:45'),
(325, 34, 15, 156, 1, 3, 2, 2, '2021-10-03 10:17:14', '2021-10-07 07:01:45'),
(326, 34, 15, 157, 1, 3, 2, 1, '2021-10-03 10:17:14', '2021-10-07 07:01:45'),
(327, 34, 15, 158, 1, 3, 2, 2, '2021-10-03 10:17:14', '2021-10-07 07:01:45'),
(328, 34, 15, 159, 1, 3, 2, 2, '2021-10-03 10:17:14', '2021-10-07 07:01:45'),
(329, 34, 15, 160, 1, 3, 2, 2, '2021-10-03 10:17:14', '2021-10-07 07:01:45'),
(330, 34, 15, 161, 1, 3, 2, 2, '2021-10-03 10:17:14', '2021-10-07 07:01:45'),
(331, 34, 15, 162, 1, 3, 2, 1, '2021-10-03 10:17:14', '2021-10-07 07:01:45'),
(332, 35, 16, 163, 0, 32, 2, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(333, 35, 16, 164, 0, 32, 2, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(334, 35, 16, 165, 0, 32, 2, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(335, 35, 16, 166, 0, 32, 2, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(336, 35, 16, 167, 0, 32, 2, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(337, 35, 16, 168, 0, 32, 2, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(338, 35, 16, 169, 0, 32, 2, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(339, 35, 16, 170, 0, 32, 2, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(340, 35, 16, 171, 0, 32, 2, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(341, 35, 16, 172, 0, 32, 2, 0, '2021-10-04 10:43:41', '2021-10-04 10:43:41'),
(342, 36, 18, 183, 0, 32, 2, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(343, 36, 18, 184, 0, 32, 2, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(344, 36, 18, 185, 0, 32, 2, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(345, 36, 18, 186, 0, 32, 2, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(346, 36, 18, 187, 0, 32, 2, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(347, 36, 18, 188, 0, 32, 2, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(348, 36, 18, 189, 0, 32, 2, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(349, 36, 18, 190, 0, 32, 2, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(350, 36, 18, 191, 0, 32, 2, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(351, 36, 18, 192, 0, 32, 2, 0, '2021-10-06 11:59:06', '2021-10-06 11:59:06'),
(352, 37, 19, 193, 0, 32, 2, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(353, 37, 19, 194, 0, 32, 2, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(354, 37, 19, 195, 0, 32, 2, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(355, 37, 19, 196, 0, 32, 2, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(356, 37, 19, 197, 0, 32, 2, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(357, 37, 19, 198, 0, 32, 2, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(358, 37, 19, 199, 0, 32, 2, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(359, 37, 19, 200, 0, 32, 2, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(360, 37, 19, 201, 0, 32, 2, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(361, 37, 19, 202, 0, 32, 2, 0, '2021-10-06 23:01:54', '2021-10-06 23:01:54'),
(362, 38, 20, 203, 0, 32, 2, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07'),
(363, 38, 20, 204, 0, 32, 2, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07'),
(364, 38, 20, 205, 0, 32, 2, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07'),
(365, 38, 20, 206, 0, 32, 2, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07'),
(366, 38, 20, 207, 0, 32, 2, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07'),
(367, 38, 20, 208, 0, 32, 2, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07'),
(368, 38, 20, 209, 0, 32, 2, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07'),
(369, 38, 20, 210, 0, 32, 2, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07'),
(370, 38, 20, 211, 0, 32, 2, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07'),
(371, 38, 20, 212, 0, 32, 2, 0, '2021-10-07 20:14:07', '2021-10-07 20:14:07');

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
('hainguyen9091@yahoo.com', 'vIXByDvFUkmI7hrjQfn4VoiKtsO3ZbKYfR08LzNToPwPVSGtVTxGQngKSW9hF4PK', '2021-09-20 08:09:43');

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
(3, 'Jonathan India CIN', 'upload/player/210920/GNeYo9ciWP.png', NULL, '2021-09-20 08:42:34', '2021-09-28 12:36:21'),
(4, 'Bryan Reynolds PIT', 'upload/player/210920/fMWUwNrZqL.png', NULL, '2021-09-20 08:44:23', '2021-09-28 12:25:06'),
(5, 'Jose Ramirez CLE', 'upload/player/210920/G1J4haUQAA.png', NULL, '2021-09-20 08:46:23', '2021-09-28 12:42:43'),
(6, 'Whit Merrifield KC', 'upload/player/210920/ykFWYhpDbz.png', NULL, '2021-09-20 08:48:12', '2021-09-28 12:51:36'),
(7, 'Franmil Reyes CLE', 'upload/player/210920/1ZDEh4QNvC.png', NULL, '2021-09-20 08:49:36', '2021-09-28 12:32:01'),
(8, 'Salvador Perez KC', 'upload/player/210920/5AAlpmEdgu.png', NULL, '2021-09-20 08:51:15', '2021-09-28 12:50:46'),
(9, 'Myles Straw CLE', 'upload/player/210920/JZYBSJ5yKH.png', NULL, '2021-09-20 08:52:29', '2021-09-28 12:47:17'),
(10, 'Bradley Zimmer CLE', 'upload/player/210920/AThhckrDTk.png', NULL, '2021-09-20 08:54:00', '2021-09-28 12:22:21'),
(13, 'Jared Goff', 'upload/player/210920/ruiCl3ZvJ0.png', NULL, '2021-09-20 09:00:39', '2021-09-20 09:00:39'),
(14, 'Robbie Grossman DET', 'upload/player/210920/xWP8PwVSrW.png', NULL, '2021-09-20 20:23:03', '2021-09-28 12:49:40'),
(15, 'Luis Robert CWS', 'upload/player/210920/v7qFPQrThm.png', NULL, '2021-09-20 20:36:56', '2021-09-28 12:46:01'),
(16, 'Jonathan Schoop DET', 'upload/player/210920/qxn9tPP4M0.png', NULL, '2021-09-20 20:38:55', '2021-09-28 12:39:03'),
(18, 'Joey Votto CIN', 'upload/player/210921/gR7ZIdFczF.png', NULL, '2021-09-21 19:36:17', '2021-09-28 12:35:24'),
(19, 'Nick Castellanos CIN', 'upload/player/210921/SAHLQWGD1F.png', NULL, '2021-09-21 19:39:54', '2021-09-28 12:48:04'),
(22, 'Colin Moran PIT', 'upload/player/210921/FUGXeq5Ou2.png', NULL, '2021-09-21 19:50:21', '2021-09-28 12:26:47'),
(23, 'Sam Darnold', 'upload/player/210922/d2UQpfGUwm.png', NULL, '2021-09-22 19:25:02', '2021-09-22 19:25:02'),
(24, 'Davis Mills', 'upload/player/210922/Ev6iyVEIC6.png', NULL, '2021-09-22 19:29:28', '2021-09-22 19:29:28'),
(25, 'Christian McCaffrey', 'upload/player/210922/or8zrrhxh3.png', NULL, '2021-09-22 19:32:22', '2021-09-22 19:32:22'),
(26, 'Brandin Cooks', 'upload/player/210922/Yt8HxFUWvc.png', NULL, '2021-09-22 19:34:34', '2021-09-22 19:34:34'),
(27, 'D.J. Moore', 'upload/player/210922/fr70a5rWHG.png', NULL, '2021-09-22 19:36:36', '2021-09-22 19:36:36'),
(28, 'Mark Ingram II', 'upload/player/210922/KBeWEHkjmo.png', NULL, '2021-09-22 19:38:58', '2021-09-22 19:38:58'),
(29, 'Robby Anderson', 'upload/player/210922/pfgAFI8VNR.png', NULL, '2021-09-22 19:43:16', '2021-09-22 19:43:16'),
(30, 'Chris Conley', 'upload/player/210922/gz3KtPpsIE.png', NULL, '2021-09-22 19:47:34', '2021-09-22 19:47:34'),
(31, 'Terrace Marshall', 'upload/player/210922/xzbib4AD9e.png', NULL, '2021-09-22 19:50:16', '2021-09-22 19:50:16'),
(32, 'David Johnson', 'upload/player/210922/SI86vMD6SL.png', NULL, '2021-09-22 19:52:35', '2021-09-22 19:52:35'),
(33, 'Chris Olave', 'upload/player/210924/GnAwXk0msM.png', NULL, '2021-09-24 18:20:25', '2021-09-24 18:20:25'),
(34, 'Garrett Wilson', 'upload/player/210924/B51xnPCadt.png', NULL, '2021-09-24 18:22:23', '2021-09-24 18:22:23'),
(35, 'Spencer Rattler', 'upload/player/210924/hOhA1L72s3.png', NULL, '2021-09-24 18:23:14', '2021-09-24 18:23:14'),
(36, 'Bryce Young', 'upload/player/210924/rQauadXod4.png', NULL, '2021-09-24 18:24:03', '2021-09-24 18:24:03'),
(37, 'Emory Jones', 'upload/player/210924/s8o6Z65DMf.png', NULL, '2021-09-24 18:25:16', '2021-09-24 18:25:16'),
(38, 'Spencer Sanders', 'upload/player/210924/2i8dEPeyMi.png', NULL, '2021-09-24 18:26:49', '2021-09-24 18:26:49'),
(39, 'TreVeyon Henderson', 'upload/player/210924/Zr4g8gqge3.png', NULL, '2021-09-24 18:27:50', '2021-09-24 18:27:50'),
(40, 'Will Levis', 'upload/player/210924/sy8wZk3guO.png', NULL, '2021-09-24 18:29:14', '2021-09-24 18:29:14'),
(41, 'Deuce Vaughn', 'upload/player/210924/1xZk2qSgMU.png', NULL, '2021-09-24 18:36:31', '2021-09-24 18:36:31'),
(43, 'Will Howard', 'upload/player/210924/WlN6fKpGJH.png', NULL, '2021-09-24 18:57:59', '2021-09-24 18:57:59'),
(44, 'Tony Pollard', 'upload/player/210924/lqc8Q0eD6b.png', NULL, '2021-09-24 21:14:17', '2021-09-24 21:14:17'),
(45, 'Jimmy Garoppolo', 'upload/player/210924/TMaBnYOrHz.png', NULL, '2021-09-24 21:15:21', '2021-09-24 21:15:21'),
(46, 'Aaron Jones', 'upload/player/210924/7iWiZ0eSJM.png', NULL, '2021-09-24 21:16:01', '2021-09-24 21:16:01'),
(47, 'Deebo Samuel', 'upload/player/210924/rflcipCm5Y.png', NULL, '2021-09-24 21:37:51', '2021-09-24 21:37:51'),
(48, 'Davante Adams', 'upload/player/210924/OEem9Elhje.png', NULL, '2021-09-24 21:39:23', '2021-09-24 21:39:23'),
(49, 'George Kittle', 'upload/player/210924/vtdrnsGXNI.png', NULL, '2021-09-24 21:39:56', '2021-09-24 21:39:56'),
(50, 'Robert Tonyan', 'upload/player/210924/NPHeftj5vY.png', NULL, '2021-09-24 21:40:34', '2021-09-24 21:40:34'),
(51, 'Elijah Mitchell', 'upload/player/210924/GfeZOJDwZ3.jpg', NULL, '2021-09-24 21:41:34', '2021-09-24 21:41:34'),
(52, 'Marquez Valdes-Scantling', 'upload/player/210924/e9S5ZPfyuu.png', NULL, '2021-09-24 21:42:32', '2021-09-24 21:42:32'),
(53, 'Brandon Aiyuk', 'upload/player/210924/XHEq3g0dzP.png', NULL, '2021-09-24 21:43:15', '2021-09-24 21:43:15'),
(54, 'Jalen Hurts', 'upload/player/210924/5rkaDV9J55.png', NULL, '2021-09-24 21:44:28', '2021-09-24 21:44:28'),
(55, 'Dak Prescott', 'upload/player/210924/bFb87PeHHL.png', NULL, '2021-09-24 21:45:02', '2021-09-24 21:45:02'),
(56, 'Miles Sanders', 'upload/player/210924/wGvev3pjxI.png', NULL, '2021-09-24 21:45:36', '2021-09-24 21:45:36'),
(57, 'Amari Cooper', 'upload/player/210924/xPD94Vk9wz.png', NULL, '2021-09-24 21:46:14', '2021-09-24 21:46:14'),
(58, 'DeVonta Smith', 'upload/player/210924/SeSu1e3XLW.png', NULL, '2021-09-24 21:47:15', '2021-09-24 21:47:15'),
(59, 'CeeDee Lamb', 'upload/player/210924/DkgNgq7ZLT.png', NULL, '2021-09-24 21:48:25', '2021-09-24 21:48:25'),
(60, 'Jalen Reagor', 'upload/player/210924/7nMdMscZDz.png', NULL, '2021-09-24 21:50:31', '2021-09-24 21:50:31'),
(61, 'Ezekiel Elliott', 'upload/player/210924/rdBas8EMDY.png', NULL, '2021-09-24 21:51:07', '2021-09-24 21:51:07'),
(62, 'Dallas Goedert', 'upload/player/210924/LDqODha8Lk.png', NULL, '2021-09-24 21:51:51', '2021-09-24 21:51:51'),
(64, 'Aaron Judge NYY', 'upload/player/210925/xMHrs38j0z.png', NULL, '2021-09-25 18:55:53', '2021-09-28 12:21:17'),
(65, 'Aaron Rodgers', 'upload/player/210925/nkA4n1eafe.png', NULL, '2021-09-25 18:57:46', '2021-09-26 08:55:33'),
(66, 'Pete Alonso NYM', 'upload/player/210927/QgHvBeHHSU.png', NULL, '2021-09-27 17:56:10', '2021-09-28 12:48:55'),
(67, 'Jazz Chisholm MIA', 'upload/player/210927/MiDvzqBUQT.png', NULL, '2021-09-27 17:57:15', '2021-09-28 12:34:21'),
(68, 'Francisco Lindor NYM', 'upload/player/210927/2nLsR60zpK.png', NULL, '2021-09-27 17:58:12', '2021-09-28 12:28:52'),
(69, 'Bryan De La Cruz MIA', 'upload/player/210927/6WI1xidB9V.png', NULL, '2021-09-27 17:59:08', '2021-09-28 12:24:14'),
(70, 'Brandon Nimmo NYM', 'upload/player/210927/AU9dksSUMM.png', NULL, '2021-09-27 18:00:23', '2021-09-28 12:23:20'),
(71, 'Lewis Brinson MIA', 'upload/player/210927/Vtm0qsRVGu.png', NULL, '2021-09-27 18:01:10', '2021-09-28 12:44:57'),
(72, 'Frank Schwindel CHC', 'upload/player/210927/fxaIBzOstw.png', NULL, '2021-09-27 18:02:10', '2021-09-28 12:30:44'),
(74, 'Ian Happ CHC', 'upload/player/210927/502jdfsGvz.png', NULL, '2021-09-27 18:03:29', '2021-09-28 12:33:12'),
(75, 'Ke\'Bryan Hayes PIT', 'upload/player/210927/fo5dkCY3RD.png', NULL, '2021-09-27 18:04:29', '2021-09-28 12:43:30'),
(76, 'Yoshitomo Tsutsugo PIT', 'upload/player/210927/FH9iq5qgLw.png', NULL, '2021-09-27 18:05:44', '2021-09-28 12:52:50'),
(77, 'Anthony Rizzo NYY', 'upload/player/210929/bzDpaOdaJP.png', NULL, '2021-09-29 13:43:08', '2021-10-01 16:30:10'),
(78, 'Shohei Ohtani LAA', 'upload/player/210929/iLCDaprBkA.png', NULL, '2021-09-29 13:46:17', '2021-09-29 13:46:17'),
(79, 'Giancarlo Stanton NYY', 'upload/player/210929/jTDtIWy01t.png', NULL, '2021-09-29 13:47:30', '2021-09-29 13:47:30'),
(80, 'Vladimir Guerrero TOR', 'upload/player/210929/wdQ95ZNBRA.png', NULL, '2021-09-29 13:48:15', '2021-09-29 13:48:15'),
(81, 'Josh Rojas ARI', 'upload/player/211001/j1mnTOslZh.png', NULL, '2021-10-01 21:50:15', '2021-10-01 21:50:15'),
(82, 'Raimel Tapia COL', 'upload/player/211001/o9DkfiCEo1.png', NULL, '2021-10-01 21:51:45', '2021-10-01 21:51:45'),
(83, 'David Peralta ARI', 'upload/player/211001/IldQ2ESwVq.png', NULL, '2021-10-01 21:52:35', '2021-10-01 21:52:35'),
(84, 'C.J. Cron COL', 'upload/player/211001/blA3KkdOzV.png', NULL, '2021-10-01 21:54:00', '2021-10-01 21:54:00'),
(85, 'Kole Calhoun ARI', 'upload/player/211001/PN3BbDQYmq.png', NULL, '2021-10-01 21:55:01', '2021-10-01 21:55:01'),
(86, 'Dylan Carlson STL', 'upload/player/211001/ayL14wCtgv.png', NULL, '2021-10-01 21:57:42', '2021-10-01 21:57:42'),
(87, 'Tyler O\'Neill STL', 'upload/player/211001/UpYYGnYqBT.png', NULL, '2021-10-01 21:58:46', '2021-10-01 21:58:46'),
(88, 'Trevor Story COL', 'upload/player/211001/S41U0MUUwZ.png', NULL, '2021-10-01 22:00:11', '2021-10-01 22:00:11'),
(89, 'Ketel Marte ARI', 'upload/player/211001/1POECK44It.png', NULL, '2021-10-01 22:03:14', '2021-10-01 22:03:14'),
(90, 'Charlie Blackmon COL', 'upload/player/211001/woQrkPnyuq.png', NULL, '2021-10-01 22:03:58', '2021-10-01 22:03:58'),
(91, 'Mike Evans', 'upload/player/211002/y0ckqCfJT4.png', NULL, '2021-10-02 20:36:04', '2021-10-02 20:36:04'),
(92, 'Tom Brady', 'upload/player/211002/5ZDXzTCEyF.png', NULL, '2021-10-02 20:37:03', '2021-10-02 20:37:03'),
(93, 'Mac Jones', 'upload/player/211002/WZJJeMXetR.png', NULL, '2021-10-02 20:38:04', '2021-10-02 20:38:04'),
(94, 'Chris Godwin', 'upload/player/211002/RO477Iw3dP.png', NULL, '2021-10-02 20:38:44', '2021-10-02 20:38:44'),
(95, 'Jakobi Meyers', 'upload/player/211002/ZCbtBoV3Zg.png', NULL, '2021-10-02 20:39:21', '2021-10-02 20:39:21'),
(96, 'Derek Carr', 'upload/player/211002/u54AphrqAA.png', NULL, '2021-10-02 20:42:50', '2021-10-02 20:42:50'),
(97, 'Nelson Agholor', 'upload/player/211002/tmoYHt967O.png', NULL, '2021-10-02 20:43:34', '2021-10-02 20:43:34'),
(98, 'Kendrick Bourne', 'upload/player/211002/kJbiWzInEI.png', NULL, '2021-10-02 20:44:07', '2021-10-02 20:44:07'),
(99, 'Leonard Fournette', 'upload/player/211002/Yx6v7Oy9A5.png', NULL, '2021-10-02 20:44:38', '2021-10-02 20:44:38'),
(100, 'Damien Harris', 'upload/player/211002/xe6N5gQt1E.png', NULL, '2021-10-02 20:45:11', '2021-10-02 20:45:11'),
(101, 'Justin Herbert', 'upload/player/211002/4bt5ttDiOc.png', NULL, '2021-10-02 21:26:52', '2021-10-02 21:26:52'),
(102, 'Darren Waller', 'upload/player/211002/o7RC7JjZat.png', NULL, '2021-10-02 21:27:33', '2021-10-02 21:27:33'),
(103, 'Keenan Allen', 'upload/player/211002/8NQC9dtHKo.png', NULL, '2021-10-02 21:28:06', '2021-10-02 21:28:06'),
(104, 'Kenyan Drake', 'upload/player/211002/zWpTZbULUp.png', NULL, '2021-10-02 21:28:41', '2021-10-02 21:28:41'),
(105, 'Austin Ekeler', 'upload/player/211002/m451CvLrR0.png', NULL, '2021-10-02 21:29:25', '2021-10-02 21:29:25'),
(106, 'Hunter Renfrow', 'upload/player/211002/b3hvH43pON.png', NULL, '2021-10-02 21:30:06', '2021-10-02 21:30:06'),
(107, 'Mike Williams', 'upload/player/211002/d7dip6017L.png', NULL, '2021-10-02 21:30:46', '2021-10-02 21:30:46'),
(108, 'Henry Ruggs', 'upload/player/211002/yvDkBbyhk2.png', NULL, '2021-10-02 21:31:16', '2021-10-02 21:31:16'),
(109, 'Jared Cook', 'upload/player/211002/G44IwmqpIl.png', NULL, '2021-10-02 21:31:49', '2021-10-02 21:31:49'),
(110, 'Justin Turner LAD', 'upload/player/211004/TnvGOtb2gv.png', NULL, '2021-10-04 20:47:50', '2021-10-04 20:47:50'),
(111, 'Max Muncy LAD', 'upload/player/211004/pkxn5RtZsu.png', NULL, '2021-10-04 20:48:54', '2021-10-04 20:48:54'),
(112, 'Corey Seager LAD', 'upload/player/211004/wFgHDYig8H.png', NULL, '2021-10-04 20:49:45', '2021-10-04 20:49:45'),
(113, 'Mookie Betts LAD', 'upload/player/211004/U0ypDvWiyX.png', NULL, '2021-10-04 20:50:46', '2021-10-04 20:50:46'),
(114, 'Paul Goldschmidt STL', 'upload/player/211004/vqFfQo0gd8.png', NULL, '2021-10-04 20:52:42', '2021-10-04 20:52:42'),
(115, 'Rafael Devers BOS', 'upload/player/211004/eTGhk4OcRn.png', NULL, '2021-10-04 20:54:10', '2021-10-04 20:54:10'),
(116, 'Xander Bogaerts', 'upload/player/211004/6APMOnW7yy.png', NULL, '2021-10-04 20:54:59', '2021-10-04 20:54:59'),
(117, 'J.D. Martinez BOS', 'upload/player/211004/y6xnldtxde.png', NULL, '2021-10-04 20:55:45', '2021-10-04 20:55:45'),
(118, 'Joey Gallo NYY', 'upload/player/211004/EdBPLUuHMV.png', NULL, '2021-10-04 20:56:35', '2021-10-04 20:56:35'),
(119, 'Tommy Edman STL', 'upload/player/211005/XiZ2LREACc.png', NULL, '2021-10-05 21:34:23', '2021-10-05 21:34:23'),
(120, 'Nolan Arenado STL', 'upload/player/211005/RwrPau4e6p.png', NULL, '2021-10-05 21:35:11', '2021-10-05 21:35:11'),
(121, 'Trea Turner LAD', 'upload/player/211005/Bg9YTATQLf.png', NULL, '2021-10-05 21:36:09', '2021-10-05 21:36:09'),
(124, 'Cooper Kupp', 'upload/player/211005/5Qs87D8Xij.png', NULL, '2021-10-05 21:56:10', '2021-10-05 21:56:10'),
(125, 'DK Metcalf', 'upload/player/211005/hA55w6KE7h.png', NULL, '2021-10-05 21:56:43', '2021-10-05 21:56:43'),
(127, 'Tyler Lockett', 'upload/player/211005/ILhY2ZTpVR.png', NULL, '2021-10-05 21:58:04', '2021-10-05 21:58:04'),
(128, 'Darrell Henderson', 'upload/player/211005/phEyWPQKhG.png', NULL, '2021-10-05 21:59:23', '2021-10-05 21:59:23'),
(129, 'Chris Carson', 'upload/player/211005/q6ZqknoEyq.png', NULL, '2021-10-05 21:59:57', '2021-10-05 21:59:57'),
(130, 'Tyler Higbee', 'upload/player/211005/zoOiSZQoXZ.png', NULL, '2021-10-05 22:00:34', '2021-10-05 22:00:34'),
(131, 'Gerald Everett', 'upload/player/211005/ZW01DZ8uDQ.png', NULL, '2021-10-05 22:01:15', '2021-10-05 22:01:15'),
(134, 'Chris Carson', 'upload/player/211005/HcyHBsqf8m.png', NULL, '2021-10-05 22:08:09', '2021-10-05 22:08:09'),
(135, 'Darrell Henderson', 'upload/player/211005/nWqH3tlMZy.png', NULL, '2021-10-05 22:08:41', '2021-10-05 22:08:41'),
(137, 'Robert Woods', 'upload/player/211005/P6TiWK6I0g.png', NULL, '2021-10-05 22:10:05', '2021-10-05 22:10:05'),
(140, 'Russell Wilson', 'upload/player/211005/GWridhhefv.png', NULL, '2021-10-05 22:11:56', '2021-10-05 22:11:56'),
(141, 'Matthew Stafford', 'upload/player/211005/IOYH5U2pzM.png', NULL, '2021-10-05 22:12:33', '2021-10-05 22:12:33');

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
(8, 'Product 1', '45455ID', 2, NULL, 1, 'ytgvkWxqvOFVYLXEvHTX.png', '[\"610c5abb7e880product-details-large.png\"]', 'General Product', NULL, 399, 10, NULL, 12, 20, NULL, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>', '<p>Return plicy</p>', 'Meta', 'Meta discritpion', NULL, 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, 1, 1, '2021-08-05 21:19:40', '2021-09-21 10:24:53'),
(9, 'product 2', 'product-2-5880', 2, NULL, 2, 'd38reOkhGAJasjHq7KpG.png', NULL, 'General Product', NULL, 395, NULL, 100, 68, 10, 'eeee555ID', '<p>Product dEscritpion</p>', '<p>Return plicy</p>', NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, 1, 1, '2021-08-05 21:42:57', '2021-09-21 10:23:36'),
(10, 'watch', 'watch-6889', 2, NULL, 2, 'tgW6WRxeKwyRvxhcQxD1.png', NULL, 'General Product', NULL, 395, NULL, NULL, 100, 0, 'E-g33333gtt', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>', NULL, NULL, NULL, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, 1, 1, '2021-08-05 21:47:23', '2021-09-21 10:28:25');

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
(1, 'Super Admin', NULL, 1, NULL, 1, '2020-01-24 18:50:33', '2020-12-05 13:05:06', 1),
(2, 'Admin', NULL, 1, NULL, 1, '2020-01-24 18:50:48', '2020-01-24 18:50:48', NULL),
(3, 'Customer', NULL, 1, '2021-09-19 12:29:13', 1, '2020-03-03 11:13:42', '2021-09-19 12:29:13', 1),
(4, 'Test role', NULL, 0, '2020-11-23 14:56:47', 1, '2020-11-23 14:53:06', '2020-11-23 14:56:47', 1);

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
  `google_map` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_widget` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(765) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(765) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copy_right` varchar(765) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_quantity` int(11) NOT NULL DEFAULT 5,
  `display_unit` int(11) DEFAULT NULL,
  `facebook_share_link` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_contest_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_contest_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `index_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `logo`, `icon`, `email`, `contact_no`, `address`, `google_map`, `chat_widget`, `site_title`, `meta_description`, `meta_keyword`, `copy_right`, `alert_quantity`, `display_unit`, `facebook_share_link`, `start_contest_title`, `start_contest_text`, `index_title`, `notice`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'upload/site-setting/BVJuu5TjKieshRQffgtu.png', 'upload/site-setting/2MYiazBzV4LaLM4dRp3N.png', 'byxakyny@mailinator.net', '.', '.', NULL, '<!--Start of Tawk.to Script--> <script type=\"text/javascript\"> var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date(); (function(){ var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0]; s1.async=true; s1.src=\'https://embed.tawk.to/61191a38649e0a0a5cd13a18/1fd50ss1d\'; s1.charset=\'UTF-8\'; s1.setAttribute(\'crossorigin\',\'*\'); s0.parentNode.insertBefore(s1,s0); })(); </script> <!--End of Tawk.to Script-->', 'GalaxyGo', 'GalaxyGo', 'GalaxyGo', 'GalaxyGo', 15000, 1, 'https://galaxygo.net', 'How To Play', 'Free chance to win 5000  DOGECOIN  Daily.  Choose over/Under for each player. the more answer you guess correct, the more you will win', 'no deposit needed  -  Play to earn', 'Earn up to 5000   Dogecoin  daily,  Share Facebook to  Get instant Dogecoin.  no deposit needed', 1, 1, '2021-06-02 06:26:39', '2021-10-22 22:36:25');

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
(3, 'Fashionss', 'Men shoes', 'Filler text is text that shares some characteristics of a real written text, \r\nbut is random or otherwise', 'Buy now', 'facebook.com', 1, 'upload/slider-image/E5a1Z8LUXl5mSK7Q1hxl.png', 1, '2021-08-13 18:56:02', 1, 1, '2021-08-13 18:44:15', '2021-08-13 18:56:02'),
(4, 'Fashion', 'Men shoes', 'Filler text is text that shares some characteristics of a real written text, \r\nbut is random or otherwise', 'Buy now', 'https://www.w3schools.com/php/func_string_nl2br.asp', 1, 'upload/slider-image/iLf5CDcjG0FpEbgETv6J.png', 1, NULL, 1, 1, '2021-08-13 18:56:37', '2021-08-13 18:59:48');

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
(1, 1, 'admin', 'admin@email.com', NULL, NULL, NULL, '01682234164', 'upload/portfolio-pic/yrVXGUlsb6sRYH2FyM2H.jpg', NULL, '$2y$10$m4ZSPJRaz3C7chseDTpqCub3ZeN4Pn4IRfXFiifnbYN21hkP.4hbm', '2021-10-27 00:50:31', NULL, NULL, '0.00', '0.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sz9mZkZby5YaNLps0FtbnQC3qU7rU8tSye9qEDA15ntXOAAeZs195tXDmQ0G', 1, 1, '2020-01-18 10:14:02', '2021-10-27 00:50:31'),
(30, 2, 'admin2', 'admin2@email.com', NULL, NULL, NULL, '7034954485', 'upload/portfolio-pic/OxrA57QHZQPCuUZwCOzb.png', NULL, '$2y$10$H5pgea2PIPNydfEoRdWW5urFXsocmcnZEOyrEYvU4altbF9Bu1S.O', '2021-09-19 13:55:24', NULL, NULL, '0.00', '0.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2021-08-18 19:53:50', '2021-09-19 13:55:24'),
(31, 0, 'oli', 'oli@itclanbd.com', NULL, NULL, NULL, '6w1821091921', NULL, NULL, '$2y$10$tUJIEAqwMq.Ha55VWozxrOgJ/Fvq50/AZ77Wy3XZf9V2qThtF/8Q2', '2021-09-22 23:21:25', NULL, NULL, '10.00', '10.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, '2021-09-19 21:28:20', '2021-09-22 23:21:25'),
(32, 0, 'hai9091', 'hainguyen9091@yahoo.com', NULL, NULL, NULL, 'X0wv21091985', 'upload/profile-pic/EO92w1Boy0rvlafr1L7R.jpeg', 'upload/cover_photo/9cCo2caF33eGY3IIgMo7.png', '$2y$10$QKYAljpp5Io63QIWc4ISTOTqZQeVBZEOy1DcG68NAVYU58BZY02jq', '2021-10-25 10:03:45', NULL, NULL, '15625.00', '15625.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, '2021-09-19 22:14:06', '2021-10-25 10:03:45'),
(33, 0, 'mamata017', 'nmamata017@gmail.com', NULL, NULL, NULL, 'Y35721101364', NULL, NULL, '$2y$10$m3V8RN8AGn4PtVqHWafn4.O5xYRTzuly6V7wReEHr5G5qKBhCL.TG', NULL, NULL, NULL, '5.00', '5.00', '0.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-13 11:05:11', '2021-10-13 11:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `win_coins`
--

CREATE TABLE `win_coins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `win` int(11) NOT NULL,
  `out_of` int(11) NOT NULL,
  `coin` int(11) NOT NULL,
  `coin_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `win_coins` (`id`, `win`, `out_of`, `coin`, `coin_name`, `created_by`, `updated_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 10, 10, 5000, 'Dogecoin', 1, 1, 1, NULL, '2021-09-30 22:31:20', '2021-09-30 22:31:20'),
(6, 9, 10, 500, 'Dogecoin', 1, 1, 1, NULL, '2021-09-30 22:31:44', '2021-09-30 22:31:44'),
(7, 8, 10, 50, 'Dogecoin', 1, 1, 1, NULL, '2021-09-30 22:32:29', '2021-09-30 22:32:29'),
(8, 7, 10, 10, 'Dogecoin', 1, 1, 1, NULL, '2021-09-30 22:33:01', '2021-09-30 22:33:01');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `contests`
--
ALTER TABLE `contests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contest_participants`
--
ALTER TABLE `contest_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `contest_players`
--
ALTER TABLE `contest_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `facebook_shares`
--
ALTER TABLE `facebook_shares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footer_circle_images`
--
ALTER TABLE `footer_circle_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guest_users`
--
ALTER TABLE `guest_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `module_to_activities`
--
ALTER TABLE `module_to_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `module_to_roles`
--
ALTER TABLE `module_to_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=769;

--
-- AUTO_INCREMENT for table `module_to_users`
--
ALTER TABLE `module_to_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=916;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_shipping_addresses`
--
ALTER TABLE `order_shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_pages`
--
ALTER TABLE `other_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participant_answers`
--
ALTER TABLE `participant_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_bids`
--
ALTER TABLE `product_bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_wise_bids`
--
ALTER TABLE `product_wise_bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `win_coins`
--
ALTER TABLE `win_coins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
