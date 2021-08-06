-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2021 at 03:36 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `m_galaxy`
--

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
(2, '2021-07-30', '2021-07-30 6:04 PM', 0, 1, 1, 1, NULL, '2021-07-24 04:04:53', '2021-07-24 04:04:53');

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

INSERT INTO `contest_players` (`id`, `contest_id`, `player_name`, `player_image`, `location`, `versus`, `score`, `answer`, `created_by`, `updated_by`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Lemon', 'upload/player-pic/ejmdfEiko4KeMC6AEjBq210724.jpg', 'Thakur', 'Versus', 4555.00, 0, 1, 1, 1, NULL, '2021-07-24 01:46:04', '2021-07-24 01:46:04'),
(2, 1, 'Lemo', 'upload/player-pic/gpGi4OlGID476pPyTnvI.jpg', 'city', '332222', 65555.00, 0, 1, 1, 1, NULL, '2021-07-24 01:47:15', '2021-07-24 01:47:15'),
(3, 2, 'Thakur', 'upload/player-pic/n0EixSI4cLAz3vZ16er7210724.jpg', 'Sylhet', '332222', 5555.00, 0, 1, 1, 1, NULL, '2021-07-24 04:04:53', '2021-07-24 04:04:53');

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
(45, '2021_07_23_160401_create_win_coins_table', 4),
(46, '2021_08_06_121217_add_for_social_login_column_in_users_table', 5);

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
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(8, 'Product 1', '45455ID', 2, NULL, 1, 'ytgvkWxqvOFVYLXEvHTX.png', '[\"610c5abb7e880product-details-large.png\"]', 'Auction Product', NULL, 50, NULL, NULL, NULL, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>', '<p>Return plicy</p>', 'Meta', 'Meta discritpion', 'https://www.youtube.com/watch?v=YHj7YGq19Fg', 'yes', 40, '2021-08-01', '09:30:00', '2021-08-10', '11:59:00', '2021-08-01 03:30:00', '2021-08-10 05:59:00', 0.00, 1, NULL, 1, 1, '2021-08-05 15:19:40', '2021-08-05 16:08:57'),
(9, 'product 2', 'product-2-5880', 2, NULL, 2, 'd38reOkhGAJasjHq7KpG.png', NULL, 'General Product', NULL, 70, NULL, NULL, 'eeee555ID', '<p>Product dEscritpion</p>', '<p>Return plicy</p>', NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, 1, 1, '2021-08-05 15:42:57', '2021-08-05 15:45:42'),
(10, 'Prouct 3', 'prouct-3-7928', 2, NULL, 2, 'tgW6WRxeKwyRvxhcQxD1.png', NULL, 'General Product', NULL, 100, NULL, NULL, 'E-g33333gtt', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>', NULL, NULL, NULL, 'https://youtu.be/Yh_0cPX0Hso', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, 1, 1, '2021-08-05 15:47:23', '2021-08-05 15:47:23');

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
(1, 8, 2, 1, 500, '2021-08-10', '11:59:00', 1, 1, '2021-08-05 16:27:04', '2021-08-05 16:27:04');

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

INSERT INTO `site_settings` (`id`, `logo`, `icon`, `email`, `contact_no`, `site_title`, `meta_description`, `meta_keyword`, `copy_right`, `alert_quantity`, `display_unit`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'upload/site-setting/qMPDTDFThCSaPSsGUf74.png', 'upload/site-setting/rJ4DcypuQQz0gSm74UXn.png', 'thakurlemon@gmail.com', '01719287734', 'Contest', 'Web Embed', 'Inventory', 'Contest', 15000, 1, 1, 1, '2021-06-02 00:26:39', '2021-07-24 04:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `contact_no`, `photo`, `password`, `lastLoginTime`, `provider`, `provider_id`, `status`, `deleted_at`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@email.com', NULL, '01682234164', 'upload/portfolio-pic/yrVXGUlsb6sRYH2FyM2H.jpg', '$2y$10$m4ZSPJRaz3C7chseDTpqCub3ZeN4Pn4IRfXFiifnbYN21hkP.4hbm', '2021-08-05 19:23:43', NULL, NULL, 1, NULL, 'JiORCv9pxTcXVRY7lDtKoialvyN4aVvxrTq9hBYCOijAgg1xSQMpPj4n0Em9', 1, 1, '2020-01-18 10:14:02', '2021-08-05 13:23:43'),
(13, 0, 'Md Miraj Khandaker', 'mirajkhandaker@yahoo.com', NULL, 'iVVV21080694', 'https://graph.facebook.com/v3.3/4602665283111962/picture?type=normal', NULL, NULL, 'facebook', '4602665283111962', 1, NULL, NULL, NULL, NULL, '2021-08-06 07:03:02', '2021-08-06 07:03:02');

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
-- Indexes for dumped tables
--

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
-- Indexes for table `contests`
--
ALTER TABLE `contests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contests_name_unique` (`name`);

--
-- Indexes for table `contest_players`
--
ALTER TABLE `contest_players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
-- AUTO_INCREMENT for table `contests`
--
ALTER TABLE `contests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contest_players`
--
ALTER TABLE `contest_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `win_coins`
--
ALTER TABLE `win_coins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
