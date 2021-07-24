/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.14-MariaDB : Database - galaxygo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `activities` */

DROP TABLE IF EXISTS `activities`;

CREATE TABLE `activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `activities` */

insert  into `activities`(`id`,`name`,`description`,`created_by`,`updated_by`,`status`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'Index','Index of module',1,1,1,NULL,'2020-01-24 18:52:00','2020-12-05 15:32:13'),
(2,'Create',NULL,1,1,1,NULL,'2020-01-24 18:52:10','2020-01-24 18:52:10'),
(3,'Edit',NULL,1,1,1,NULL,'2020-01-24 18:52:20','2020-03-02 21:23:32'),
(4,'Delete',NULL,1,1,1,NULL,'2020-01-24 18:52:30','2020-01-24 18:52:30'),
(5,'Change password',NULL,1,1,1,NULL,'2020-01-24 18:52:39','2020-01-24 18:52:39'),
(6,'Password reset',NULL,1,1,1,NULL,'2020-01-24 18:52:50','2020-01-24 18:52:50'),
(7,'Print',NULL,1,1,1,NULL,'2020-01-24 18:53:01','2020-01-24 18:53:01'),
(8,'Details',NULL,1,1,1,NULL,'2020-01-24 18:53:12','2020-01-24 18:53:12');

/*Table structure for table `brands` */

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `brands` */

insert  into `brands`(`id`,`name`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,'Samsungs',1,NULL,1,1,'2021-07-23 16:06:09','2021-07-23 16:22:48'),
(2,'Samsung',1,NULL,1,1,'2021-07-23 16:10:49','2021-07-23 16:11:23');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`parent_id`,`slug`,`created_by`,`updated_by`,`status`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'Category 1',NULL,'category-1-7170',1,1,1,NULL,'2021-07-23 13:08:37','2021-07-24 05:20:12'),
(2,'Category 2',1,'category-2-758',1,1,1,NULL,'2021-07-23 13:09:09','2021-07-24 05:20:20');

/*Table structure for table `contest_players` */

DROP TABLE IF EXISTS `contest_players`;

CREATE TABLE `contest_players` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contest_id` bigint(20) unsigned NOT NULL,
  `player_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` double(10,2) NOT NULL,
  `answer` int(11) NOT NULL DEFAULT 0 COMMENT '0=no answer,1=under,2=over',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `contest_players` */

insert  into `contest_players`(`id`,`contest_id`,`player_name`,`player_image`,`location`,`versus`,`score`,`answer`,`created_by`,`updated_by`,`status`,`deleted_at`,`created_at`,`updated_at`) values 
(1,1,'Lemon','upload/player-pic/ejmdfEiko4KeMC6AEjBq210724.jpg','Thakur','Versus',4555.00,0,1,1,1,NULL,'2021-07-24 07:46:04','2021-07-24 07:46:04'),
(2,1,'Lemo','upload/player-pic/gpGi4OlGID476pPyTnvI.jpg','city','332222',65555.00,0,1,1,1,NULL,'2021-07-24 07:47:15','2021-07-24 07:47:15'),
(3,2,'Thakur','upload/player-pic/n0EixSI4cLAz3vZ16er7210724.jpg','Sylhet','332222',5555.00,0,1,1,1,NULL,'2021-07-24 10:04:53','2021-07-24 10:04:53');

/*Table structure for table `contests` */

DROP TABLE IF EXISTS `contests`;

CREATE TABLE `contests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expaire_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_final_answer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = not submitted,1= submitted',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contests_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `contests` */

insert  into `contests`(`id`,`name`,`expaire_time`,`is_final_answer`,`created_by`,`updated_by`,`status`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'2021-07-01','2021-07-01 5:44 PM',0,1,1,1,NULL,'2021-07-24 07:46:04','2021-07-24 07:46:04'),
(2,'2021-07-30','2021-07-30 6:04 PM',0,1,1,1,NULL,'2021-07-24 10:04:53','2021-07-24 10:04:53');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(22,'2014_10_12_000000_create_users_table',1),
(23,'2014_10_12_100000_create_password_resets_table',1),
(24,'2019_08_19_000000_create_failed_jobs_table',1),
(25,'2020_01_17_040304_create_activities_table',1),
(26,'2020_01_17_040924_create_modules_table',1),
(27,'2020_01_17_041254_create_module_to_activities_table',1),
(28,'2020_01_17_041749_create_module_to_roles_table',1),
(29,'2020_01_17_041946_create_module_to_users_table',1),
(30,'2020_01_17_042141_create_roles_table',1),
(31,'2020_01_18_111739_add_created_by_to_roles',1),
(41,'2021_06_01_171209_create_site_settings_table',2),
(42,'2021_07_19_142035_create_contests_table',3),
(43,'2021_07_19_142601_create_contest_players_table',3);

/*Table structure for table `module_to_activities` */

DROP TABLE IF EXISTS `module_to_activities`;

CREATE TABLE `module_to_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `module_to_activities` */

insert  into `module_to_activities`(`id`,`module_id`,`activity_id`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(5,2,2,1,NULL,1,1,'2020-01-24 18:54:32','2020-01-24 18:54:32'),
(6,2,4,1,NULL,1,1,'2020-01-24 18:54:32','2020-01-24 18:54:32'),
(7,2,3,1,NULL,1,1,'2020-01-24 18:54:32','2020-01-24 18:54:32'),
(8,2,1,1,NULL,1,1,'2020-01-24 18:54:32','2020-01-24 18:54:32'),
(9,3,2,1,NULL,1,1,'2020-01-24 18:54:59','2020-01-24 18:54:59'),
(10,3,4,1,NULL,1,1,'2020-01-24 18:54:59','2020-01-24 18:54:59'),
(11,3,3,1,NULL,1,1,'2020-01-24 18:54:59','2020-01-24 18:54:59'),
(12,3,1,1,NULL,1,1,'2020-01-24 18:54:59','2020-01-24 18:54:59'),
(13,4,2,1,NULL,1,1,'2020-01-24 18:55:37','2020-01-24 18:55:37'),
(14,4,4,1,NULL,1,1,'2020-01-24 18:55:37','2020-01-24 18:55:37'),
(15,4,3,1,NULL,1,1,'2020-01-24 18:55:37','2020-01-24 18:55:37'),
(16,4,1,1,NULL,1,1,'2020-01-24 18:55:37','2020-01-24 18:55:37'),
(17,5,2,1,NULL,1,1,'2020-01-24 18:55:58','2020-01-24 18:55:58'),
(18,5,4,1,NULL,1,1,'2020-01-24 18:55:58','2020-01-24 18:55:58'),
(19,5,3,1,NULL,1,1,'2020-01-24 18:55:58','2020-01-24 18:55:58'),
(20,5,1,1,NULL,1,1,'2020-01-24 18:55:58','2020-01-24 18:55:58'),
(25,6,5,1,NULL,1,1,'2020-01-24 19:07:39','2020-01-24 19:07:39'),
(26,6,2,1,NULL,1,1,'2020-01-24 19:07:39','2020-01-24 19:07:39'),
(27,6,4,1,NULL,1,1,'2020-01-24 19:07:39','2020-01-24 19:07:39'),
(28,6,6,1,NULL,1,1,'2020-01-24 19:07:39','2020-01-24 19:07:39'),
(29,6,3,1,NULL,1,1,'2020-01-24 19:07:39','2020-01-24 19:07:39'),
(30,6,1,1,NULL,1,1,'2020-01-24 19:07:39','2020-01-24 19:07:39'),
(50,1,2,1,NULL,1,1,'2020-12-05 15:05:04','2020-12-05 15:05:04'),
(51,1,4,1,NULL,1,1,'2020-12-05 15:05:04','2020-12-05 15:05:04'),
(52,1,3,1,NULL,1,1,'2020-12-05 15:05:04','2020-12-05 15:05:04'),
(53,1,1,1,NULL,1,1,'2020-12-05 15:05:04','2020-12-05 15:05:04'),
(54,10,3,1,NULL,1,1,'2021-07-14 09:08:07','2021-07-14 09:08:07');

/*Table structure for table `module_to_roles` */

DROP TABLE IF EXISTS `module_to_roles`;

CREATE TABLE `module_to_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `module_to_roles` */

insert  into `module_to_roles`(`id`,`module_id`,`role_id`,`activity_id`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(264,1,2,1,1,NULL,NULL,NULL,NULL,NULL),
(265,1,2,2,1,NULL,NULL,NULL,NULL,NULL),
(266,1,2,3,1,NULL,NULL,NULL,NULL,NULL),
(267,1,2,4,1,NULL,NULL,NULL,NULL,NULL),
(268,2,2,1,1,NULL,NULL,NULL,NULL,NULL),
(269,2,2,2,1,NULL,NULL,NULL,NULL,NULL),
(270,2,2,3,1,NULL,NULL,NULL,NULL,NULL),
(271,2,2,4,1,NULL,NULL,NULL,NULL,NULL),
(272,3,2,1,1,NULL,NULL,NULL,NULL,NULL),
(273,3,2,2,1,NULL,NULL,NULL,NULL,NULL),
(274,3,2,3,1,NULL,NULL,NULL,NULL,NULL),
(275,3,2,4,1,NULL,NULL,NULL,NULL,NULL),
(276,4,2,1,1,NULL,NULL,NULL,NULL,NULL),
(277,4,2,2,1,NULL,NULL,NULL,NULL,NULL),
(278,4,2,3,1,NULL,NULL,NULL,NULL,NULL),
(279,4,2,4,1,NULL,NULL,NULL,NULL,NULL),
(280,5,2,1,1,NULL,NULL,NULL,NULL,NULL),
(281,5,2,2,1,NULL,NULL,NULL,NULL,NULL),
(282,5,2,3,1,NULL,NULL,NULL,NULL,NULL),
(283,5,2,4,1,NULL,NULL,NULL,NULL,NULL),
(284,6,2,1,1,NULL,NULL,NULL,NULL,NULL),
(285,6,2,2,1,NULL,NULL,NULL,NULL,NULL),
(286,6,2,3,1,NULL,NULL,NULL,NULL,NULL),
(287,6,2,4,1,NULL,NULL,NULL,NULL,NULL),
(288,1,1,1,1,NULL,NULL,NULL,NULL,NULL),
(289,1,1,2,1,NULL,NULL,NULL,NULL,NULL),
(290,1,1,3,1,NULL,NULL,NULL,NULL,NULL),
(291,1,1,4,1,NULL,NULL,NULL,NULL,NULL),
(292,2,1,1,1,NULL,NULL,NULL,NULL,NULL),
(293,2,1,2,1,NULL,NULL,NULL,NULL,NULL),
(294,2,1,3,1,NULL,NULL,NULL,NULL,NULL),
(295,2,1,4,1,NULL,NULL,NULL,NULL,NULL),
(296,3,1,1,1,NULL,NULL,NULL,NULL,NULL),
(297,3,1,2,1,NULL,NULL,NULL,NULL,NULL),
(298,3,1,3,1,NULL,NULL,NULL,NULL,NULL),
(299,3,1,4,1,NULL,NULL,NULL,NULL,NULL),
(300,4,1,1,1,NULL,NULL,NULL,NULL,NULL),
(301,4,1,2,1,NULL,NULL,NULL,NULL,NULL),
(302,4,1,3,1,NULL,NULL,NULL,NULL,NULL),
(303,4,1,4,1,NULL,NULL,NULL,NULL,NULL),
(304,5,1,1,1,NULL,NULL,NULL,NULL,NULL),
(305,5,1,2,1,NULL,NULL,NULL,NULL,NULL),
(306,5,1,3,1,NULL,NULL,NULL,NULL,NULL),
(307,5,1,4,1,NULL,NULL,NULL,NULL,NULL),
(308,6,1,1,1,NULL,NULL,NULL,NULL,NULL),
(309,6,1,2,1,NULL,NULL,NULL,NULL,NULL),
(310,6,1,3,1,NULL,NULL,NULL,NULL,NULL),
(311,6,1,4,1,NULL,NULL,NULL,NULL,NULL),
(312,6,1,5,1,NULL,NULL,NULL,NULL,NULL),
(313,6,1,6,1,NULL,NULL,NULL,NULL,NULL),
(314,10,1,3,1,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `module_to_users` */

DROP TABLE IF EXISTS `module_to_users`;

CREATE TABLE `module_to_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `module_to_users` */

insert  into `module_to_users`(`id`,`module_id`,`user_id`,`activity_id`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(130,1,2,1,1,NULL,NULL,NULL,NULL,NULL),
(132,1,2,2,1,NULL,NULL,NULL,NULL,NULL),
(134,1,2,3,1,NULL,NULL,NULL,NULL,NULL),
(136,1,2,4,1,NULL,NULL,NULL,NULL,NULL),
(138,2,2,1,1,NULL,NULL,NULL,NULL,NULL),
(140,2,2,2,1,NULL,NULL,NULL,NULL,NULL),
(142,2,2,3,1,NULL,NULL,NULL,NULL,NULL),
(144,2,2,4,1,NULL,NULL,NULL,NULL,NULL),
(146,3,2,1,1,NULL,NULL,NULL,NULL,NULL),
(148,3,2,2,1,NULL,NULL,NULL,NULL,NULL),
(150,3,2,3,1,NULL,NULL,NULL,NULL,NULL),
(152,3,2,4,1,NULL,NULL,NULL,NULL,NULL),
(154,4,2,1,1,NULL,NULL,NULL,NULL,NULL),
(156,4,2,2,1,NULL,NULL,NULL,NULL,NULL),
(158,4,2,3,1,NULL,NULL,NULL,NULL,NULL),
(160,4,2,4,1,NULL,NULL,NULL,NULL,NULL),
(162,5,2,1,1,NULL,NULL,NULL,NULL,NULL),
(164,5,2,2,1,NULL,NULL,NULL,NULL,NULL),
(166,5,2,3,1,NULL,NULL,NULL,NULL,NULL),
(168,5,2,4,1,NULL,NULL,NULL,NULL,NULL),
(170,6,2,1,1,NULL,NULL,NULL,NULL,NULL),
(172,6,2,2,1,NULL,NULL,NULL,NULL,NULL),
(174,6,2,3,1,NULL,NULL,NULL,NULL,NULL),
(176,6,2,4,1,NULL,NULL,NULL,NULL,NULL),
(178,7,2,1,1,NULL,NULL,NULL,NULL,NULL),
(180,7,2,2,1,NULL,NULL,NULL,NULL,NULL),
(182,7,2,3,1,NULL,NULL,NULL,NULL,NULL),
(184,7,2,4,1,NULL,NULL,NULL,NULL,NULL),
(345,1,5,1,1,NULL,NULL,NULL,NULL,NULL),
(346,1,5,2,1,NULL,NULL,NULL,NULL,NULL),
(347,1,5,3,1,NULL,NULL,NULL,NULL,NULL),
(348,1,5,4,1,NULL,NULL,NULL,NULL,NULL),
(349,2,5,1,1,NULL,NULL,NULL,NULL,NULL),
(350,2,5,2,1,NULL,NULL,NULL,NULL,NULL),
(351,2,5,3,1,NULL,NULL,NULL,NULL,NULL),
(352,2,5,4,1,NULL,NULL,NULL,NULL,NULL),
(353,3,5,1,1,NULL,NULL,NULL,NULL,NULL),
(354,3,5,2,1,NULL,NULL,NULL,NULL,NULL),
(355,3,5,3,1,NULL,NULL,NULL,NULL,NULL),
(356,3,5,4,1,NULL,NULL,NULL,NULL,NULL),
(357,4,5,1,1,NULL,NULL,NULL,NULL,NULL),
(358,4,5,2,1,NULL,NULL,NULL,NULL,NULL),
(359,4,5,3,1,NULL,NULL,NULL,NULL,NULL),
(360,4,5,4,1,NULL,NULL,NULL,NULL,NULL),
(361,5,5,1,1,NULL,NULL,NULL,NULL,NULL),
(362,5,5,2,1,NULL,NULL,NULL,NULL,NULL),
(363,5,5,3,1,NULL,NULL,NULL,NULL,NULL),
(364,5,5,4,1,NULL,NULL,NULL,NULL,NULL),
(365,6,5,1,1,NULL,NULL,NULL,NULL,NULL),
(366,6,5,2,1,NULL,NULL,NULL,NULL,NULL),
(367,6,5,3,1,NULL,NULL,NULL,NULL,NULL),
(368,6,5,4,1,NULL,NULL,NULL,NULL,NULL),
(435,1,1,1,1,NULL,NULL,NULL,NULL,NULL),
(436,1,1,2,1,NULL,NULL,NULL,NULL,NULL),
(437,1,1,3,1,NULL,NULL,NULL,NULL,NULL),
(438,1,1,4,1,NULL,NULL,NULL,NULL,NULL),
(439,2,1,1,1,NULL,NULL,NULL,NULL,NULL),
(440,2,1,2,1,NULL,NULL,NULL,NULL,NULL),
(441,2,1,3,1,NULL,NULL,NULL,NULL,NULL),
(442,2,1,4,1,NULL,NULL,NULL,NULL,NULL),
(443,3,1,1,1,NULL,NULL,NULL,NULL,NULL),
(444,3,1,2,1,NULL,NULL,NULL,NULL,NULL),
(445,3,1,3,1,NULL,NULL,NULL,NULL,NULL),
(446,3,1,4,1,NULL,NULL,NULL,NULL,NULL),
(447,4,1,1,1,NULL,NULL,NULL,NULL,NULL),
(448,4,1,2,1,NULL,NULL,NULL,NULL,NULL),
(449,4,1,3,1,NULL,NULL,NULL,NULL,NULL),
(450,4,1,4,1,NULL,NULL,NULL,NULL,NULL),
(451,5,1,1,1,NULL,NULL,NULL,NULL,NULL),
(452,5,1,2,1,NULL,NULL,NULL,NULL,NULL),
(453,5,1,3,1,NULL,NULL,NULL,NULL,NULL),
(454,5,1,4,1,NULL,NULL,NULL,NULL,NULL),
(455,6,1,1,1,NULL,NULL,NULL,NULL,NULL),
(456,6,1,2,1,NULL,NULL,NULL,NULL,NULL),
(457,6,1,3,1,NULL,NULL,NULL,NULL,NULL),
(458,6,1,4,1,NULL,NULL,NULL,NULL,NULL),
(459,6,1,5,1,NULL,NULL,NULL,NULL,NULL),
(460,6,1,6,1,NULL,NULL,NULL,NULL,NULL),
(461,10,1,3,1,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `modules` */

insert  into `modules`(`id`,`name`,`description`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,'Role Management',NULL,1,NULL,1,1,'2020-01-24 18:53:44','2020-12-05 15:05:04'),
(2,'Role Access Control',NULL,1,NULL,1,1,'2020-01-24 18:54:32','2020-01-24 18:54:32'),
(3,'User Access Control',NULL,1,NULL,1,1,'2020-01-24 18:54:59','2020-01-24 18:54:59'),
(4,'Module Management',NULL,1,NULL,1,1,'2020-01-24 18:55:37','2020-01-24 18:55:37'),
(5,'Activity Management',NULL,1,NULL,1,1,'2020-01-24 18:55:58','2020-01-24 18:55:58'),
(6,'Admin Panel User',NULL,1,NULL,1,1,'2020-01-24 18:58:53','2020-01-24 18:58:53'),
(10,'Site Setting',NULL,1,NULL,1,1,'2021-07-14 09:08:07','2021-07-14 09:08:07');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `avg_review` double(10,2) DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`slug`,`category_id`,`sub_category_id`,`brand_id`,`feature_image`,`galler_images`,`product_type`,`attached_file`,`price`,`discount_amount`,`quantity`,`model_number`,`product_description`,`return_policy`,`pro_meta`,`pro_mt_description`,`video_url`,`featureproduct`,`avg_review`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,'Products','products-5819',1,2,2,'public/upload/product-feature-image/D8N7ZpqrFrNgRJRl97sq.jpg','[\"60fbbbca04041w2p06Rilwdvmta26Hmmy.jpg\"]','Auction Product','public/upload/product-attached-file/yBbfubZtZ4nV37B57bVb.docx',190.555,5.555,NULL,'S-A7s','<p>Product description</p>','<p>Return policy</p>','ff, ttsss','dfdfsss','https://youtu.be/Yh_0cPX0Hso','no',0.00,1,NULL,1,1,'2021-07-23 22:54:23','2021-07-24 10:05:33');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`info`,`status`,`deleted_at`,`updated_by`,`created_at`,`updated_at`,`created_by`) values 
(1,'Super Admin',NULL,1,NULL,1,'2020-01-24 18:50:33','2020-12-05 13:05:06',1),
(2,'Admin',NULL,1,NULL,1,'2020-01-24 18:50:48','2020-01-24 18:50:48',NULL),
(3,'Customer',NULL,1,NULL,1,'2020-03-03 11:13:42','2020-03-03 11:13:42',1),
(4,'Test role',NULL,0,'2020-11-23 14:56:47',1,'2020-11-23 14:53:06','2020-11-23 14:56:47',1);

/*Table structure for table `site_settings` */

DROP TABLE IF EXISTS `site_settings`;

CREATE TABLE `site_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `site_settings` */

insert  into `site_settings`(`id`,`logo`,`icon`,`email`,`contact_no`,`site_title`,`meta_description`,`meta_keyword`,`copy_right`,`alert_quantity`,`display_unit`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,'upload/site-setting/qMPDTDFThCSaPSsGUf74.png','upload/site-setting/rJ4DcypuQQz0gSm74UXn.png','thakurlemon@gmail.com','01719287734','Contest','Web Embed','Inventory','Contest',15000,1,1,1,'2021-06-02 06:26:39','2021-07-24 10:01:37');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_contact_no_unique` (`contact_no`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`role_id`,`name`,`email`,`email_verified_at`,`contact_no`,`photo`,`password`,`lastLoginTime`,`status`,`deleted_at`,`remember_token`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,1,'admin','admin@email.com',NULL,'01682234164','upload/portfolio-pic/yrVXGUlsb6sRYH2FyM2H.jpg','$2y$10$m4ZSPJRaz3C7chseDTpqCub3ZeN4Pn4IRfXFiifnbYN21hkP.4hbm','2021-07-24 10:00:32',1,NULL,'EmZxyvR8f2cva9IaSwVNge5WxxIQvCnV4MTrH6I1MBwZPrFBfjQBCo1eqdiV',1,1,'2020-01-18 16:14:02','2021-07-24 10:00:32'),
(2,1,'Myles Key','jymyjopuny@mailinator.com',NULL,'123456','upload/portfolio-pic/9fvRrPSRAhy9LsS05Wh6.jpg','$2y$10$lJHuiDyxiw/yq/.bfz01BeygTc9Tl0mZbAM0JS7NADJlVjXmBSsDK',NULL,1,NULL,NULL,1,1,'2020-01-18 16:33:52','2021-07-24 10:02:25'),
(3,2,'Phelan Brown','fynojewu@mailinator.com',NULL,'1465','upload/portfolio-pic/Dt5hvKLSeHJPt37pyDgi.jpg','$2y$10$BvWoKwT6Toe1WgiVuxutxufuaqhUb1VXiZKaRYsSyK6TQz3NcFVge',NULL,1,NULL,NULL,1,1,'2020-01-18 16:37:14','2021-07-24 10:02:42'),
(4,2,'Charlotte Villarreal','cusesohyko@mailinator.com',NULL,'12456','upload/portfolio-pic/bwh7hQus2F4eQkJlMbOg.jpg','$2y$10$2aF8MBYraBpAzxw/ye2bXuKieJp6FoBuVQBHL6YHbSN1CIouTQf9C',NULL,1,NULL,NULL,1,1,'2020-01-18 16:48:36','2021-07-24 10:02:14'),
(5,2,'miraj','miraj@email.com',NULL,'1465456',NULL,'$2y$10$gpyKgl1cj4Yh6qAEN/Z5ZOZ9Lkp75B.DgwLev./4CIHdGLG71m7iG','2020-03-03 11:23:09',1,NULL,NULL,1,1,'2020-03-02 21:06:56','2020-03-03 11:23:09'),
(6,1,'Juliet Harrison','kazyx@mailinator.com',NULL,'123456874',NULL,'$2y$10$alGTDKUcytKoLnUFYyOWmer7EoXknY1911HsMCa496lq2LYV13JDK',NULL,1,NULL,NULL,1,1,'2020-11-23 13:53:19','2020-11-23 13:55:39'),
(7,1,'Tara Erickson','gobimohyja@mailinator.com',NULL,'U146545','public/upload/portfolio-pic/mVEBox9gvoYJrzQHueww.jpg','$2y$10$qgZrvHAaoziTx9EsRQKyN.RDRELo3StfBHsmTajQFOAyQ0/o/W1n2',NULL,1,NULL,NULL,1,1,'2020-11-23 13:56:49','2021-07-18 17:42:37'),
(8,1,'Holmes Spears','jukilo@mailinator.com',NULL,'123456845688',NULL,'$2y$10$zgvy63DyvNHGhyBZEXSBxuT/9McN08iDefme0G3BJongc0BcXM/vS',NULL,1,NULL,NULL,1,1,'2021-07-18 03:14:49','2021-07-18 03:14:49'),
(9,2,'Jeremy Steele','tisis@mailinator.com',NULL,'Vel eveniet',NULL,'$2y$10$tRWRy4.SgeLTyMyAYvWIduDRREcLuGS6DjIo/xMqjssX48ZucUNTm',NULL,1,NULL,NULL,1,1,'2021-07-18 03:17:27','2021-07-18 03:17:27'),
(10,2,'Catherine Palmer','bunafefo@mailinator.com',NULL,'Quo non',NULL,'$2y$10$0kox7J5iVhHErhPW6ZaMSumTwkad7v584oJnBh0CKgi3wsns/M6qK',NULL,1,NULL,NULL,1,1,'2021-07-18 03:17:43','2021-07-18 03:17:43'),
(11,3,'Hashim Velez','ligexusenu@mailinator.com',NULL,'Expedit','public/upload/portfolio-pic/qzd6rhhgB2jEnucwvnc7.jpg','$2y$10$gmCO4ZZw0B9AbvYmDgMWJOPlVMqv3l2TPhn41cuZ03dBJZ0j5llAm',NULL,1,NULL,NULL,1,1,'2021-07-18 14:58:57','2021-07-18 14:58:57');

/*Table structure for table `win_coins` */

DROP TABLE IF EXISTS `win_coins`;

CREATE TABLE `win_coins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `win` int(11) NOT NULL,
  `out_of` int(11) NOT NULL,
  `coin` int(11) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `win_coins` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
