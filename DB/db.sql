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
/*Table structure for table `about_us` */

DROP TABLE IF EXISTS `about_us`;

CREATE TABLE `about_us` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_text` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_banner` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `about_us` */

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

/*Table structure for table `coin_histories` */

DROP TABLE IF EXISTS `coin_histories`;

CREATE TABLE `coin_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `user_type` int(11) DEFAULT NULL COMMENT '0 = user, 1 = guest',
  `amount` decimal(10,2) NOT NULL,
  `transaction_type` tinyint(1) NOT NULL COMMENT '0 = earn, 1 = expense',
  `earn_expense_type` int(11) NOT NULL COMMENT '0 = register, 1 = share, 2 = contest, 3 = withdraw,4 = buy',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `coin_histories` */

/*Table structure for table `contest_participants` */

DROP TABLE IF EXISTS `contest_participants`;

CREATE TABLE `contest_participants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `participant_type` tinyint(1) NOT NULL COMMENT '0 = user, 1 = guest',
  `participant_id` bigint(20) unsigned NOT NULL COMMENT 'user or guest id',
  `contest_id` bigint(20) unsigned NOT NULL,
  `correct_answer` bigint(20) unsigned NOT NULL DEFAULT 0,
  `earn` bigint(20) unsigned NOT NULL DEFAULT 0,
  `get_coin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = coin not get, 1 = coin get',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `contest_participants` */

/*Table structure for table `contest_players` */

DROP TABLE IF EXISTS `contest_players`;

CREATE TABLE `contest_players` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contest_id` bigint(20) unsigned NOT NULL,
  `player_id` int(11) NOT NULL,
  `player_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `played_on` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `versus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` double(10,2) NOT NULL,
  `answer` int(11) NOT NULL DEFAULT 0 COMMENT '0=no answer,1=under,2=over',
  `final_score` float(10,2) DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `contest_players` */

/*Table structure for table `contests` */

DROP TABLE IF EXISTS `contests`;

CREATE TABLE `contests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_start` datetime DEFAULT NULL,
  `time_end` datetime NOT NULL,
  `is_final_answer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = not submitted,1= submitted',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contests_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `contests` */

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

/*Data for the table `countries` */

insert  into `countries`(`id`,`iso`,`name`,`nicename`,`iso3`,`numcode`,`phonecode`) values 
(1,'AF','AFGHANISTAN','Afghanistan','AFG',4,93),
(2,'AL','ALBANIA','Albania','ALB',8,355),
(3,'DZ','ALGERIA','Algeria','DZA',12,213),
(4,'AS','AMERICAN SAMOA','American Samoa','ASM',16,1684),
(5,'AD','ANDORRA','Andorra','AND',20,376),
(6,'AO','ANGOLA','Angola','AGO',24,244),
(7,'AI','ANGUILLA','Anguilla','AIA',660,1264),
(8,'AQ','ANTARCTICA','Antarctica',NULL,NULL,0),
(9,'AG','ANTIGUA AND BARBUDA','Antigua and Barbuda','ATG',28,1268),
(10,'AR','ARGENTINA','Argentina','ARG',32,54),
(11,'AM','ARMENIA','Armenia','ARM',51,374),
(12,'AW','ARUBA','Aruba','ABW',533,297),
(13,'AU','AUSTRALIA','Australia','AUS',36,61),
(14,'AT','AUSTRIA','Austria','AUT',40,43),
(15,'AZ','AZERBAIJAN','Azerbaijan','AZE',31,994),
(16,'BS','BAHAMAS','Bahamas','BHS',44,1242),
(17,'BH','BAHRAIN','Bahrain','BHR',48,973),
(18,'BD','BANGLADESH','Bangladesh','BGD',50,880),
(19,'BB','BARBADOS','Barbados','BRB',52,1246),
(20,'BY','BELARUS','Belarus','BLR',112,375),
(21,'BE','BELGIUM','Belgium','BEL',56,32),
(22,'BZ','BELIZE','Belize','BLZ',84,501),
(23,'BJ','BENIN','Benin','BEN',204,229),
(24,'BM','BERMUDA','Bermuda','BMU',60,1441),
(25,'BT','BHUTAN','Bhutan','BTN',64,975),
(26,'BO','BOLIVIA','Bolivia','BOL',68,591),
(27,'BA','BOSNIA AND HERZEGOVINA','Bosnia and Herzegovina','BIH',70,387),
(28,'BW','BOTSWANA','Botswana','BWA',72,267),
(29,'BV','BOUVET ISLAND','Bouvet Island',NULL,NULL,0),
(30,'BR','BRAZIL','Brazil','BRA',76,55),
(31,'IO','BRITISH INDIAN OCEAN TERRITORY','British Indian Ocean Territory',NULL,NULL,246),
(32,'BN','BRUNEI DARUSSALAM','Brunei Darussalam','BRN',96,673),
(33,'BG','BULGARIA','Bulgaria','BGR',100,359),
(34,'BF','BURKINA FASO','Burkina Faso','BFA',854,226),
(35,'BI','BURUNDI','Burundi','BDI',108,257),
(36,'KH','CAMBODIA','Cambodia','KHM',116,855),
(37,'CM','CAMEROON','Cameroon','CMR',120,237),
(38,'CA','CANADA','Canada','CAN',124,1),
(39,'CV','CAPE VERDE','Cape Verde','CPV',132,238),
(40,'KY','CAYMAN ISLANDS','Cayman Islands','CYM',136,1345),
(41,'CF','CENTRAL AFRICAN REPUBLIC','Central African Republic','CAF',140,236),
(42,'TD','CHAD','Chad','TCD',148,235),
(43,'CL','CHILE','Chile','CHL',152,56),
(44,'CN','CHINA','China','CHN',156,86),
(45,'CX','CHRISTMAS ISLAND','Christmas Island',NULL,NULL,61),
(46,'CC','COCOS (KEELING) ISLANDS','Cocos (Keeling) Islands',NULL,NULL,672),
(47,'CO','COLOMBIA','Colombia','COL',170,57),
(48,'KM','COMOROS','Comoros','COM',174,269),
(49,'CG','CONGO','Congo','COG',178,242),
(50,'CD','CONGO, THE DEMOCRATIC REPUBLIC OF THE','Congo, the Democratic Republic of the','COD',180,242),
(51,'CK','COOK ISLANDS','Cook Islands','COK',184,682),
(52,'CR','COSTA RICA','Costa Rica','CRI',188,506),
(53,'CI','COTE D\'IVOIRE','Cote D\'Ivoire','CIV',384,225),
(54,'HR','CROATIA','Croatia','HRV',191,385),
(55,'CU','CUBA','Cuba','CUB',192,53),
(56,'CY','CYPRUS','Cyprus','CYP',196,357),
(57,'CZ','CZECH REPUBLIC','Czech Republic','CZE',203,420),
(58,'DK','DENMARK','Denmark','DNK',208,45),
(59,'DJ','DJIBOUTI','Djibouti','DJI',262,253),
(60,'DM','DOMINICA','Dominica','DMA',212,1767),
(61,'DO','DOMINICAN REPUBLIC','Dominican Republic','DOM',214,1809),
(62,'EC','ECUADOR','Ecuador','ECU',218,593),
(63,'EG','EGYPT','Egypt','EGY',818,20),
(64,'SV','EL SALVADOR','El Salvador','SLV',222,503),
(65,'GQ','EQUATORIAL GUINEA','Equatorial Guinea','GNQ',226,240),
(66,'ER','ERITREA','Eritrea','ERI',232,291),
(67,'EE','ESTONIA','Estonia','EST',233,372),
(68,'ET','ETHIOPIA','Ethiopia','ETH',231,251),
(69,'FK','FALKLAND ISLANDS (MALVINAS)','Falkland Islands (Malvinas)','FLK',238,500),
(70,'FO','FAROE ISLANDS','Faroe Islands','FRO',234,298),
(71,'FJ','FIJI','Fiji','FJI',242,679),
(72,'FI','FINLAND','Finland','FIN',246,358),
(73,'FR','FRANCE','France','FRA',250,33),
(74,'GF','FRENCH GUIANA','French Guiana','GUF',254,594),
(75,'PF','FRENCH POLYNESIA','French Polynesia','PYF',258,689),
(76,'TF','FRENCH SOUTHERN TERRITORIES','French Southern Territories',NULL,NULL,0),
(77,'GA','GABON','Gabon','GAB',266,241),
(78,'GM','GAMBIA','Gambia','GMB',270,220),
(79,'GE','GEORGIA','Georgia','GEO',268,995),
(80,'DE','GERMANY','Germany','DEU',276,49),
(81,'GH','GHANA','Ghana','GHA',288,233),
(82,'GI','GIBRALTAR','Gibraltar','GIB',292,350),
(83,'GR','GREECE','Greece','GRC',300,30),
(84,'GL','GREENLAND','Greenland','GRL',304,299),
(85,'GD','GRENADA','Grenada','GRD',308,1473),
(86,'GP','GUADELOUPE','Guadeloupe','GLP',312,590),
(87,'GU','GUAM','Guam','GUM',316,1671),
(88,'GT','GUATEMALA','Guatemala','GTM',320,502),
(89,'GN','GUINEA','Guinea','GIN',324,224),
(90,'GW','GUINEA-BISSAU','Guinea-Bissau','GNB',624,245),
(91,'GY','GUYANA','Guyana','GUY',328,592),
(92,'HT','HAITI','Haiti','HTI',332,509),
(93,'HM','HEARD ISLAND AND MCDONALD ISLANDS','Heard Island and Mcdonald Islands',NULL,NULL,0),
(94,'VA','HOLY SEE (VATICAN CITY STATE)','Holy See (Vatican City State)','VAT',336,39),
(95,'HN','HONDURAS','Honduras','HND',340,504),
(96,'HK','HONG KONG','Hong Kong','HKG',344,852),
(97,'HU','HUNGARY','Hungary','HUN',348,36),
(98,'IS','ICELAND','Iceland','ISL',352,354),
(99,'IN','INDIA','India','IND',356,91),
(100,'ID','INDONESIA','Indonesia','IDN',360,62),
(101,'IR','IRAN, ISLAMIC REPUBLIC OF','Iran, Islamic Republic of','IRN',364,98),
(102,'IQ','IRAQ','Iraq','IRQ',368,964),
(103,'IE','IRELAND','Ireland','IRL',372,353),
(104,'IL','ISRAEL','Israel','ISR',376,972),
(105,'IT','ITALY','Italy','ITA',380,39),
(106,'JM','JAMAICA','Jamaica','JAM',388,1876),
(107,'JP','JAPAN','Japan','JPN',392,81),
(108,'JO','JORDAN','Jordan','JOR',400,962),
(109,'KZ','KAZAKHSTAN','Kazakhstan','KAZ',398,7),
(110,'KE','KENYA','Kenya','KEN',404,254),
(111,'KI','KIRIBATI','Kiribati','KIR',296,686),
(112,'KP','KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','Korea, Democratic People\'s Republic of','PRK',408,850),
(113,'KR','KOREA, REPUBLIC OF','Korea, Republic of','KOR',410,82),
(114,'KW','KUWAIT','Kuwait','KWT',414,965),
(115,'KG','KYRGYZSTAN','Kyrgyzstan','KGZ',417,996),
(116,'LA','LAO PEOPLE\'S DEMOCRATIC REPUBLIC','Lao People\'s Democratic Republic','LAO',418,856),
(117,'LV','LATVIA','Latvia','LVA',428,371),
(118,'LB','LEBANON','Lebanon','LBN',422,961),
(119,'LS','LESOTHO','Lesotho','LSO',426,266),
(120,'LR','LIBERIA','Liberia','LBR',430,231),
(121,'LY','LIBYAN ARAB JAMAHIRIYA','Libyan Arab Jamahiriya','LBY',434,218),
(122,'LI','LIECHTENSTEIN','Liechtenstein','LIE',438,423),
(123,'LT','LITHUANIA','Lithuania','LTU',440,370),
(124,'LU','LUXEMBOURG','Luxembourg','LUX',442,352),
(125,'MO','MACAO','Macao','MAC',446,853),
(126,'MK','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','Macedonia, the Former Yugoslav Republic of','MKD',807,389),
(127,'MG','MADAGASCAR','Madagascar','MDG',450,261),
(128,'MW','MALAWI','Malawi','MWI',454,265),
(129,'MY','MALAYSIA','Malaysia','MYS',458,60),
(130,'MV','MALDIVES','Maldives','MDV',462,960),
(131,'ML','MALI','Mali','MLI',466,223),
(132,'MT','MALTA','Malta','MLT',470,356),
(133,'MH','MARSHALL ISLANDS','Marshall Islands','MHL',584,692),
(134,'MQ','MARTINIQUE','Martinique','MTQ',474,596),
(135,'MR','MAURITANIA','Mauritania','MRT',478,222),
(136,'MU','MAURITIUS','Mauritius','MUS',480,230),
(137,'YT','MAYOTTE','Mayotte',NULL,NULL,269),
(138,'MX','MEXICO','Mexico','MEX',484,52),
(139,'FM','MICRONESIA, FEDERATED STATES OF','Micronesia, Federated States of','FSM',583,691),
(140,'MD','MOLDOVA, REPUBLIC OF','Moldova, Republic of','MDA',498,373),
(141,'MC','MONACO','Monaco','MCO',492,377),
(142,'MN','MONGOLIA','Mongolia','MNG',496,976),
(143,'MS','MONTSERRAT','Montserrat','MSR',500,1664),
(144,'MA','MOROCCO','Morocco','MAR',504,212),
(145,'MZ','MOZAMBIQUE','Mozambique','MOZ',508,258),
(146,'MM','MYANMAR','Myanmar','MMR',104,95),
(147,'NA','NAMIBIA','Namibia','NAM',516,264),
(148,'NR','NAURU','Nauru','NRU',520,674),
(149,'NP','NEPAL','Nepal','NPL',524,977),
(150,'NL','NETHERLANDS','Netherlands','NLD',528,31),
(151,'AN','NETHERLANDS ANTILLES','Netherlands Antilles','ANT',530,599),
(152,'NC','NEW CALEDONIA','New Caledonia','NCL',540,687),
(153,'NZ','NEW ZEALAND','New Zealand','NZL',554,64),
(154,'NI','NICARAGUA','Nicaragua','NIC',558,505),
(155,'NE','NIGER','Niger','NER',562,227),
(156,'NG','NIGERIA','Nigeria','NGA',566,234),
(157,'NU','NIUE','Niue','NIU',570,683),
(158,'NF','NORFOLK ISLAND','Norfolk Island','NFK',574,672),
(159,'MP','NORTHERN MARIANA ISLANDS','Northern Mariana Islands','MNP',580,1670),
(160,'NO','NORWAY','Norway','NOR',578,47),
(161,'OM','OMAN','Oman','OMN',512,968),
(162,'PK','PAKISTAN','Pakistan','PAK',586,92),
(163,'PW','PALAU','Palau','PLW',585,680),
(164,'PS','PALESTINIAN TERRITORY, OCCUPIED','Palestinian Territory, Occupied',NULL,NULL,970),
(165,'PA','PANAMA','Panama','PAN',591,507),
(166,'PG','PAPUA NEW GUINEA','Papua New Guinea','PNG',598,675),
(167,'PY','PARAGUAY','Paraguay','PRY',600,595),
(168,'PE','PERU','Peru','PER',604,51),
(169,'PH','PHILIPPINES','Philippines','PHL',608,63),
(170,'PN','PITCAIRN','Pitcairn','PCN',612,0),
(171,'PL','POLAND','Poland','POL',616,48),
(172,'PT','PORTUGAL','Portugal','PRT',620,351),
(173,'PR','PUERTO RICO','Puerto Rico','PRI',630,1787),
(174,'QA','QATAR','Qatar','QAT',634,974),
(175,'RE','REUNION','Reunion','REU',638,262),
(176,'RO','ROMANIA','Romania','ROM',642,40),
(177,'RU','RUSSIAN FEDERATION','Russian Federation','RUS',643,70),
(178,'RW','RWANDA','Rwanda','RWA',646,250),
(179,'SH','SAINT HELENA','Saint Helena','SHN',654,290),
(180,'KN','SAINT KITTS AND NEVIS','Saint Kitts and Nevis','KNA',659,1869),
(181,'LC','SAINT LUCIA','Saint Lucia','LCA',662,1758),
(182,'PM','SAINT PIERRE AND MIQUELON','Saint Pierre and Miquelon','SPM',666,508),
(183,'VC','SAINT VINCENT AND THE GRENADINES','Saint Vincent and the Grenadines','VCT',670,1784),
(184,'WS','SAMOA','Samoa','WSM',882,684),
(185,'SM','SAN MARINO','San Marino','SMR',674,378),
(186,'ST','SAO TOME AND PRINCIPE','Sao Tome and Principe','STP',678,239),
(187,'SA','SAUDI ARABIA','Saudi Arabia','SAU',682,966),
(188,'SN','SENEGAL','Senegal','SEN',686,221),
(189,'CS','SERBIA AND MONTENEGRO','Serbia and Montenegro',NULL,NULL,381),
(190,'SC','SEYCHELLES','Seychelles','SYC',690,248),
(191,'SL','SIERRA LEONE','Sierra Leone','SLE',694,232),
(192,'SG','SINGAPORE','Singapore','SGP',702,65),
(193,'SK','SLOVAKIA','Slovakia','SVK',703,421),
(194,'SI','SLOVENIA','Slovenia','SVN',705,386),
(195,'SB','SOLOMON ISLANDS','Solomon Islands','SLB',90,677),
(196,'SO','SOMALIA','Somalia','SOM',706,252),
(197,'ZA','SOUTH AFRICA','South Africa','ZAF',710,27),
(198,'GS','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS','South Georgia and the South Sandwich Islands',NULL,NULL,0),
(199,'ES','SPAIN','Spain','ESP',724,34),
(200,'LK','SRI LANKA','Sri Lanka','LKA',144,94),
(201,'SD','SUDAN','Sudan','SDN',736,249),
(202,'SR','SURINAME','Suriname','SUR',740,597),
(203,'SJ','SVALBARD AND JAN MAYEN','Svalbard and Jan Mayen','SJM',744,47),
(204,'SZ','SWAZILAND','Swaziland','SWZ',748,268),
(205,'SE','SWEDEN','Sweden','SWE',752,46),
(206,'CH','SWITZERLAND','Switzerland','CHE',756,41),
(207,'SY','SYRIAN ARAB REPUBLIC','Syrian Arab Republic','SYR',760,963),
(208,'TW','TAIWAN, PROVINCE OF CHINA','Taiwan, Province of China','TWN',158,886),
(209,'TJ','TAJIKISTAN','Tajikistan','TJK',762,992),
(210,'TZ','TANZANIA, UNITED REPUBLIC OF','Tanzania, United Republic of','TZA',834,255),
(211,'TH','THAILAND','Thailand','THA',764,66),
(212,'TL','TIMOR-LESTE','Timor-Leste',NULL,NULL,670),
(213,'TG','TOGO','Togo','TGO',768,228),
(214,'TK','TOKELAU','Tokelau','TKL',772,690),
(215,'TO','TONGA','Tonga','TON',776,676),
(216,'TT','TRINIDAD AND TOBAGO','Trinidad and Tobago','TTO',780,1868),
(217,'TN','TUNISIA','Tunisia','TUN',788,216),
(218,'TR','TURKEY','Turkey','TUR',792,90),
(219,'TM','TURKMENISTAN','Turkmenistan','TKM',795,7370),
(220,'TC','TURKS AND CAICOS ISLANDS','Turks and Caicos Islands','TCA',796,1649),
(221,'TV','TUVALU','Tuvalu','TUV',798,688),
(222,'UG','UGANDA','Uganda','UGA',800,256),
(223,'UA','UKRAINE','Ukraine','UKR',804,380),
(224,'AE','UNITED ARAB EMIRATES','United Arab Emirates','ARE',784,971),
(225,'GB','UNITED KINGDOM','United Kingdom','GBR',826,44),
(226,'US','UNITED STATES','United States','USA',840,1),
(227,'UM','UNITED STATES MINOR OUTLYING ISLANDS','United States Minor Outlying Islands',NULL,NULL,1),
(228,'UY','URUGUAY','Uruguay','URY',858,598),
(229,'UZ','UZBEKISTAN','Uzbekistan','UZB',860,998),
(230,'VU','VANUATU','Vanuatu','VUT',548,678),
(231,'VE','VENEZUELA','Venezuela','VEN',862,58),
(232,'VN','VIET NAM','Viet Nam','VNM',704,84),
(233,'VG','VIRGIN ISLANDS, BRITISH','Virgin Islands, British','VGB',92,1284),
(234,'VI','VIRGIN ISLANDS, U.S.','Virgin Islands, U.s.','VIR',850,1340),
(235,'WF','WALLIS AND FUTUNA','Wallis and Futuna','WLF',876,681),
(236,'EH','WESTERN SAHARA','Western Sahara','ESH',732,212),
(237,'YE','YEMEN','Yemen','YEM',887,967),
(238,'ZM','ZAMBIA','Zambia','ZMB',894,260),
(239,'ZW','ZIMBABWE','Zimbabwe','ZWE',716,263);

/*Table structure for table `facebook_shares` */

DROP TABLE IF EXISTS `facebook_shares`;

CREATE TABLE `facebook_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_type` tinyint(2) DEFAULT 0 COMMENT '0 = user, 1 = guest',
  `share_date` date DEFAULT NULL,
  `share_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `facebook_shares` */

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

/*Table structure for table `footer_circle_images` */

DROP TABLE IF EXISTS `footer_circle_images`;

CREATE TABLE `footer_circle_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_serial` int(11) DEFAULT NULL,
  `image_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `footer_circle_images` */

insert  into `footer_circle_images`(`id`,`title`,`link`,`order_serial`,`image_name`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,'Tesr services','link nay',1,'upload/footer-circle-image/L58vkJjEl3mF5iCOB7ap.jpg',1,NULL,1,1,'2021-08-13 20:06:33','2021-08-13 20:06:33');

/*Table structure for table `guest_users` */

DROP TABLE IF EXISTS `guest_users`;

CREATE TABLE `guest_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mac` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_coin` decimal(14,2) NOT NULL DEFAULT 0.00,
  `current_coin` decimal(14,2) NOT NULL DEFAULT 0.00,
  `withdraw` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `guest_users` */

insert  into `guest_users`(`id`,`mac`,`total_coin`,`current_coin`,`withdraw`,`created_at`,`updated_at`) values 
(1,'3C-A0-67-E3-44-6E',0.00,0.00,0.00,'2021-09-19 11:20:26','2021-09-19 11:20:26');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(43,'2021_07_19_142601_create_contest_players_table',3),
(44,'2021_07_23_140119_add_column_is_final_answer_to_contests',4),
(45,'2021_07_23_160401_create_win_coins_table',5),
(46,'2021_08_06_121217_add_for_social_login_column_in_users_table',6),
(47,'2021_08_08_153041_create_coin_histories_table',7),
(48,'2021_08_10_201006_create_contest_participants_table',8),
(49,'2021_08_10_201043_create_participant_answers_table',9),
(50,'2021_08_10_225242_create_guest_users_table',10),
(51,'2021_08_11_102645_add_column_played_on_in_contest_players',11),
(52,'2021_08_11_214151_add_column_participant_type_in_participant_answers',11),
(53,'2021_08_13_222223_create_about_us_table',12),
(54,'2021_08_13_234507_create_other_pages_table',13),
(55,'2021_08_14_002701_add_column_address_in_site_settings',14),
(56,'2021_08_14_172522_add_column_cover_photo_and_paypal_email_in_users',15),
(57,'2021_08_14_211010_create_withdraw_requests_table',16),
(58,'2021_09_06_205830_create_players_table',16);

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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(54,10,3,1,NULL,1,1,'2021-07-14 09:08:07','2021-07-14 09:08:07'),
(59,11,2,1,NULL,1,1,'2021-09-19 12:51:41','2021-09-19 12:51:41'),
(60,11,4,1,NULL,1,1,'2021-09-19 12:51:41','2021-09-19 12:51:41'),
(61,11,3,1,NULL,1,1,'2021-09-19 12:51:41','2021-09-19 12:51:41'),
(62,11,1,1,NULL,1,1,'2021-09-19 12:51:41','2021-09-19 12:51:41'),
(63,12,2,1,NULL,1,1,'2021-09-19 12:51:59','2021-09-19 12:51:59'),
(64,12,4,1,NULL,1,1,'2021-09-19 12:51:59','2021-09-19 12:51:59'),
(65,12,3,1,NULL,1,1,'2021-09-19 12:51:59','2021-09-19 12:51:59'),
(66,12,1,1,NULL,1,1,'2021-09-19 12:51:59','2021-09-19 12:51:59'),
(67,13,2,1,NULL,1,1,'2021-09-19 12:56:31','2021-09-19 12:56:31'),
(68,13,4,1,NULL,1,1,'2021-09-19 12:56:31','2021-09-19 12:56:31'),
(69,13,3,1,NULL,1,1,'2021-09-19 12:56:31','2021-09-19 12:56:31'),
(70,13,1,1,NULL,1,1,'2021-09-19 12:56:31','2021-09-19 12:56:31'),
(71,14,2,1,NULL,1,1,'2021-09-19 13:01:56','2021-09-19 13:01:56'),
(72,14,4,1,NULL,1,1,'2021-09-19 13:01:56','2021-09-19 13:01:56'),
(73,14,3,1,NULL,1,1,'2021-09-19 13:01:56','2021-09-19 13:01:56'),
(74,14,1,1,NULL,1,1,'2021-09-19 13:01:56','2021-09-19 13:01:56'),
(75,15,2,1,NULL,1,1,'2021-09-19 13:05:48','2021-09-19 13:05:48'),
(76,15,4,1,NULL,1,1,'2021-09-19 13:05:48','2021-09-19 13:05:48'),
(77,15,3,1,NULL,1,1,'2021-09-19 13:05:48','2021-09-19 13:05:48'),
(78,15,1,1,NULL,1,1,'2021-09-19 13:05:48','2021-09-19 13:05:48'),
(79,16,2,1,NULL,1,1,'2021-09-19 13:07:51','2021-09-19 13:07:51'),
(80,16,4,1,NULL,1,1,'2021-09-19 13:07:51','2021-09-19 13:07:51'),
(81,16,8,1,NULL,1,1,'2021-09-19 13:07:51','2021-09-19 13:07:51'),
(82,16,3,1,NULL,1,1,'2021-09-19 13:07:51','2021-09-19 13:07:51'),
(83,16,1,1,NULL,1,1,'2021-09-19 13:07:51','2021-09-19 13:07:51'),
(84,17,2,1,NULL,1,1,'2021-09-19 13:11:04','2021-09-19 13:11:04'),
(85,17,4,1,NULL,1,1,'2021-09-19 13:11:04','2021-09-19 13:11:04'),
(86,17,8,1,NULL,1,1,'2021-09-19 13:11:04','2021-09-19 13:11:04'),
(87,17,3,1,NULL,1,1,'2021-09-19 13:11:04','2021-09-19 13:11:04'),
(88,17,1,1,NULL,1,1,'2021-09-19 13:11:04','2021-09-19 13:11:04'),
(89,18,8,1,NULL,1,1,'2021-09-19 13:16:21','2021-09-19 13:16:21'),
(90,18,1,1,NULL,1,1,'2021-09-19 13:16:21','2021-09-19 13:16:21'),
(91,19,8,1,NULL,1,1,'2021-09-19 13:17:49','2021-09-19 13:17:49'),
(92,19,1,1,NULL,1,1,'2021-09-19 13:17:49','2021-09-19 13:17:49'),
(93,20,3,1,NULL,1,1,'2021-09-19 13:20:43','2021-09-19 13:20:43'),
(94,20,1,1,NULL,1,1,'2021-09-19 13:20:43','2021-09-19 13:20:43'),
(95,21,1,1,NULL,1,1,'2021-09-19 13:25:20','2021-09-19 13:25:20'),
(96,22,3,1,NULL,1,1,'2021-09-19 13:26:51','2021-09-19 13:26:51'),
(97,23,2,1,NULL,1,1,'2021-09-19 13:28:33','2021-09-19 13:28:33'),
(98,23,4,1,NULL,1,1,'2021-09-19 13:28:33','2021-09-19 13:28:33'),
(99,23,3,1,NULL,1,1,'2021-09-19 13:28:33','2021-09-19 13:28:33'),
(100,23,1,1,NULL,1,1,'2021-09-19 13:28:33','2021-09-19 13:28:33'),
(101,24,2,1,NULL,1,1,'2021-09-19 13:30:02','2021-09-19 13:30:02'),
(102,24,4,1,NULL,1,1,'2021-09-19 13:30:02','2021-09-19 13:30:02'),
(103,24,3,1,NULL,1,1,'2021-09-19 13:30:02','2021-09-19 13:30:02'),
(104,24,1,1,NULL,1,1,'2021-09-19 13:30:02','2021-09-19 13:30:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=769 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `module_to_roles` */

insert  into `module_to_roles`(`id`,`module_id`,`role_id`,`activity_id`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(631,1,2,1,1,NULL,NULL,NULL,NULL,NULL),
(632,1,2,2,1,NULL,NULL,NULL,NULL,NULL),
(633,1,2,3,1,NULL,NULL,NULL,NULL,NULL),
(634,1,2,4,1,NULL,NULL,NULL,NULL,NULL),
(635,2,2,1,1,NULL,NULL,NULL,NULL,NULL),
(636,2,2,2,1,NULL,NULL,NULL,NULL,NULL),
(637,2,2,3,1,NULL,NULL,NULL,NULL,NULL),
(638,2,2,4,1,NULL,NULL,NULL,NULL,NULL),
(639,3,2,1,1,NULL,NULL,NULL,NULL,NULL),
(640,3,2,2,1,NULL,NULL,NULL,NULL,NULL),
(641,3,2,3,1,NULL,NULL,NULL,NULL,NULL),
(642,3,2,4,1,NULL,NULL,NULL,NULL,NULL),
(643,6,2,1,1,NULL,NULL,NULL,NULL,NULL),
(644,6,2,2,1,NULL,NULL,NULL,NULL,NULL),
(645,6,2,3,1,NULL,NULL,NULL,NULL,NULL),
(646,6,2,4,1,NULL,NULL,NULL,NULL,NULL),
(647,6,2,5,1,NULL,NULL,NULL,NULL,NULL),
(648,6,2,6,1,NULL,NULL,NULL,NULL,NULL),
(649,10,2,3,1,NULL,NULL,NULL,NULL,NULL),
(650,11,2,1,1,NULL,NULL,NULL,NULL,NULL),
(651,11,2,2,1,NULL,NULL,NULL,NULL,NULL),
(652,11,2,3,1,NULL,NULL,NULL,NULL,NULL),
(653,11,2,4,1,NULL,NULL,NULL,NULL,NULL),
(654,12,2,1,1,NULL,NULL,NULL,NULL,NULL),
(655,12,2,2,1,NULL,NULL,NULL,NULL,NULL),
(656,12,2,3,1,NULL,NULL,NULL,NULL,NULL),
(657,12,2,4,1,NULL,NULL,NULL,NULL,NULL),
(658,13,2,1,1,NULL,NULL,NULL,NULL,NULL),
(659,13,2,2,1,NULL,NULL,NULL,NULL,NULL),
(660,13,2,3,1,NULL,NULL,NULL,NULL,NULL),
(661,13,2,4,1,NULL,NULL,NULL,NULL,NULL),
(662,14,2,1,1,NULL,NULL,NULL,NULL,NULL),
(663,14,2,2,1,NULL,NULL,NULL,NULL,NULL),
(664,14,2,3,1,NULL,NULL,NULL,NULL,NULL),
(665,14,2,4,1,NULL,NULL,NULL,NULL,NULL),
(666,15,2,1,1,NULL,NULL,NULL,NULL,NULL),
(667,15,2,2,1,NULL,NULL,NULL,NULL,NULL),
(668,15,2,3,1,NULL,NULL,NULL,NULL,NULL),
(669,15,2,4,1,NULL,NULL,NULL,NULL,NULL),
(670,16,2,1,1,NULL,NULL,NULL,NULL,NULL),
(671,16,2,2,1,NULL,NULL,NULL,NULL,NULL),
(672,16,2,3,1,NULL,NULL,NULL,NULL,NULL),
(673,16,2,4,1,NULL,NULL,NULL,NULL,NULL),
(674,16,2,8,1,NULL,NULL,NULL,NULL,NULL),
(675,17,2,1,1,NULL,NULL,NULL,NULL,NULL),
(676,17,2,2,1,NULL,NULL,NULL,NULL,NULL),
(677,17,2,3,1,NULL,NULL,NULL,NULL,NULL),
(678,17,2,4,1,NULL,NULL,NULL,NULL,NULL),
(679,17,2,8,1,NULL,NULL,NULL,NULL,NULL),
(680,18,2,1,1,NULL,NULL,NULL,NULL,NULL),
(681,18,2,8,1,NULL,NULL,NULL,NULL,NULL),
(682,19,2,1,1,NULL,NULL,NULL,NULL,NULL),
(683,19,2,8,1,NULL,NULL,NULL,NULL,NULL),
(684,20,2,1,1,NULL,NULL,NULL,NULL,NULL),
(685,20,2,3,1,NULL,NULL,NULL,NULL,NULL),
(686,21,2,1,1,NULL,NULL,NULL,NULL,NULL),
(687,22,2,3,1,NULL,NULL,NULL,NULL,NULL),
(688,23,2,1,1,NULL,NULL,NULL,NULL,NULL),
(689,23,2,2,1,NULL,NULL,NULL,NULL,NULL),
(690,23,2,3,1,NULL,NULL,NULL,NULL,NULL),
(691,23,2,4,1,NULL,NULL,NULL,NULL,NULL),
(692,24,2,1,1,NULL,NULL,NULL,NULL,NULL),
(693,24,2,2,1,NULL,NULL,NULL,NULL,NULL),
(694,24,2,3,1,NULL,NULL,NULL,NULL,NULL),
(695,24,2,4,1,NULL,NULL,NULL,NULL,NULL),
(696,1,1,1,1,NULL,NULL,NULL,NULL,NULL),
(697,1,1,2,1,NULL,NULL,NULL,NULL,NULL),
(698,1,1,3,1,NULL,NULL,NULL,NULL,NULL),
(699,1,1,4,1,NULL,NULL,NULL,NULL,NULL),
(700,2,1,1,1,NULL,NULL,NULL,NULL,NULL),
(701,2,1,2,1,NULL,NULL,NULL,NULL,NULL),
(702,2,1,3,1,NULL,NULL,NULL,NULL,NULL),
(703,2,1,4,1,NULL,NULL,NULL,NULL,NULL),
(704,3,1,1,1,NULL,NULL,NULL,NULL,NULL),
(705,3,1,2,1,NULL,NULL,NULL,NULL,NULL),
(706,3,1,3,1,NULL,NULL,NULL,NULL,NULL),
(707,3,1,4,1,NULL,NULL,NULL,NULL,NULL),
(708,4,1,1,1,NULL,NULL,NULL,NULL,NULL),
(709,4,1,2,1,NULL,NULL,NULL,NULL,NULL),
(710,4,1,3,1,NULL,NULL,NULL,NULL,NULL),
(711,4,1,4,1,NULL,NULL,NULL,NULL,NULL),
(712,5,1,1,1,NULL,NULL,NULL,NULL,NULL),
(713,5,1,2,1,NULL,NULL,NULL,NULL,NULL),
(714,5,1,3,1,NULL,NULL,NULL,NULL,NULL),
(715,5,1,4,1,NULL,NULL,NULL,NULL,NULL),
(716,6,1,1,1,NULL,NULL,NULL,NULL,NULL),
(717,6,1,2,1,NULL,NULL,NULL,NULL,NULL),
(718,6,1,3,1,NULL,NULL,NULL,NULL,NULL),
(719,6,1,4,1,NULL,NULL,NULL,NULL,NULL),
(720,6,1,5,1,NULL,NULL,NULL,NULL,NULL),
(721,6,1,6,1,NULL,NULL,NULL,NULL,NULL),
(722,10,1,3,1,NULL,NULL,NULL,NULL,NULL),
(723,11,1,1,1,NULL,NULL,NULL,NULL,NULL),
(724,11,1,2,1,NULL,NULL,NULL,NULL,NULL),
(725,11,1,3,1,NULL,NULL,NULL,NULL,NULL),
(726,11,1,4,1,NULL,NULL,NULL,NULL,NULL),
(727,12,1,1,1,NULL,NULL,NULL,NULL,NULL),
(728,12,1,2,1,NULL,NULL,NULL,NULL,NULL),
(729,12,1,3,1,NULL,NULL,NULL,NULL,NULL),
(730,12,1,4,1,NULL,NULL,NULL,NULL,NULL),
(731,13,1,1,1,NULL,NULL,NULL,NULL,NULL),
(732,13,1,2,1,NULL,NULL,NULL,NULL,NULL),
(733,13,1,3,1,NULL,NULL,NULL,NULL,NULL),
(734,13,1,4,1,NULL,NULL,NULL,NULL,NULL),
(735,14,1,1,1,NULL,NULL,NULL,NULL,NULL),
(736,14,1,2,1,NULL,NULL,NULL,NULL,NULL),
(737,14,1,3,1,NULL,NULL,NULL,NULL,NULL),
(738,14,1,4,1,NULL,NULL,NULL,NULL,NULL),
(739,15,1,1,1,NULL,NULL,NULL,NULL,NULL),
(740,15,1,2,1,NULL,NULL,NULL,NULL,NULL),
(741,15,1,3,1,NULL,NULL,NULL,NULL,NULL),
(742,15,1,4,1,NULL,NULL,NULL,NULL,NULL),
(743,16,1,1,1,NULL,NULL,NULL,NULL,NULL),
(744,16,1,2,1,NULL,NULL,NULL,NULL,NULL),
(745,16,1,3,1,NULL,NULL,NULL,NULL,NULL),
(746,16,1,4,1,NULL,NULL,NULL,NULL,NULL),
(747,16,1,8,1,NULL,NULL,NULL,NULL,NULL),
(748,17,1,1,1,NULL,NULL,NULL,NULL,NULL),
(749,17,1,2,1,NULL,NULL,NULL,NULL,NULL),
(750,17,1,3,1,NULL,NULL,NULL,NULL,NULL),
(751,17,1,4,1,NULL,NULL,NULL,NULL,NULL),
(752,17,1,8,1,NULL,NULL,NULL,NULL,NULL),
(753,18,1,1,1,NULL,NULL,NULL,NULL,NULL),
(754,18,1,8,1,NULL,NULL,NULL,NULL,NULL),
(755,19,1,1,1,NULL,NULL,NULL,NULL,NULL),
(756,19,1,8,1,NULL,NULL,NULL,NULL,NULL),
(757,20,1,1,1,NULL,NULL,NULL,NULL,NULL),
(758,20,1,3,1,NULL,NULL,NULL,NULL,NULL),
(759,21,1,1,1,NULL,NULL,NULL,NULL,NULL),
(760,22,1,3,1,NULL,NULL,NULL,NULL,NULL),
(761,23,1,1,1,NULL,NULL,NULL,NULL,NULL),
(762,23,1,2,1,NULL,NULL,NULL,NULL,NULL),
(763,23,1,3,1,NULL,NULL,NULL,NULL,NULL),
(764,23,1,4,1,NULL,NULL,NULL,NULL,NULL),
(765,24,1,1,1,NULL,NULL,NULL,NULL,NULL),
(766,24,1,2,1,NULL,NULL,NULL,NULL,NULL),
(767,24,1,3,1,NULL,NULL,NULL,NULL,NULL),
(768,24,1,4,1,NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=916 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(778,1,30,1,1,NULL,NULL,NULL,NULL,NULL),
(779,1,30,2,1,NULL,NULL,NULL,NULL,NULL),
(780,1,30,3,1,NULL,NULL,NULL,NULL,NULL),
(781,1,30,4,1,NULL,NULL,NULL,NULL,NULL),
(782,2,30,1,1,NULL,NULL,NULL,NULL,NULL),
(783,2,30,2,1,NULL,NULL,NULL,NULL,NULL),
(784,2,30,3,1,NULL,NULL,NULL,NULL,NULL),
(785,2,30,4,1,NULL,NULL,NULL,NULL,NULL),
(786,3,30,1,1,NULL,NULL,NULL,NULL,NULL),
(787,3,30,2,1,NULL,NULL,NULL,NULL,NULL),
(788,3,30,3,1,NULL,NULL,NULL,NULL,NULL),
(789,3,30,4,1,NULL,NULL,NULL,NULL,NULL),
(790,6,30,1,1,NULL,NULL,NULL,NULL,NULL),
(791,6,30,2,1,NULL,NULL,NULL,NULL,NULL),
(792,6,30,3,1,NULL,NULL,NULL,NULL,NULL),
(793,6,30,4,1,NULL,NULL,NULL,NULL,NULL),
(794,6,30,5,1,NULL,NULL,NULL,NULL,NULL),
(795,6,30,6,1,NULL,NULL,NULL,NULL,NULL),
(796,10,30,3,1,NULL,NULL,NULL,NULL,NULL),
(797,11,30,1,1,NULL,NULL,NULL,NULL,NULL),
(798,11,30,2,1,NULL,NULL,NULL,NULL,NULL),
(799,11,30,3,1,NULL,NULL,NULL,NULL,NULL),
(800,11,30,4,1,NULL,NULL,NULL,NULL,NULL),
(801,12,30,1,1,NULL,NULL,NULL,NULL,NULL),
(802,12,30,2,1,NULL,NULL,NULL,NULL,NULL),
(803,12,30,3,1,NULL,NULL,NULL,NULL,NULL),
(804,12,30,4,1,NULL,NULL,NULL,NULL,NULL),
(805,13,30,1,1,NULL,NULL,NULL,NULL,NULL),
(806,13,30,2,1,NULL,NULL,NULL,NULL,NULL),
(807,13,30,3,1,NULL,NULL,NULL,NULL,NULL),
(808,13,30,4,1,NULL,NULL,NULL,NULL,NULL),
(809,14,30,1,1,NULL,NULL,NULL,NULL,NULL),
(810,14,30,2,1,NULL,NULL,NULL,NULL,NULL),
(811,14,30,3,1,NULL,NULL,NULL,NULL,NULL),
(812,14,30,4,1,NULL,NULL,NULL,NULL,NULL),
(813,15,30,1,1,NULL,NULL,NULL,NULL,NULL),
(814,15,30,2,1,NULL,NULL,NULL,NULL,NULL),
(815,15,30,3,1,NULL,NULL,NULL,NULL,NULL),
(816,15,30,4,1,NULL,NULL,NULL,NULL,NULL),
(817,16,30,1,1,NULL,NULL,NULL,NULL,NULL),
(818,16,30,2,1,NULL,NULL,NULL,NULL,NULL),
(819,16,30,3,1,NULL,NULL,NULL,NULL,NULL),
(820,16,30,4,1,NULL,NULL,NULL,NULL,NULL),
(821,16,30,8,1,NULL,NULL,NULL,NULL,NULL),
(822,17,30,1,1,NULL,NULL,NULL,NULL,NULL),
(823,17,30,2,1,NULL,NULL,NULL,NULL,NULL),
(824,17,30,3,1,NULL,NULL,NULL,NULL,NULL),
(825,17,30,4,1,NULL,NULL,NULL,NULL,NULL),
(826,17,30,8,1,NULL,NULL,NULL,NULL,NULL),
(827,18,30,1,1,NULL,NULL,NULL,NULL,NULL),
(828,18,30,8,1,NULL,NULL,NULL,NULL,NULL),
(829,19,30,1,1,NULL,NULL,NULL,NULL,NULL),
(830,19,30,8,1,NULL,NULL,NULL,NULL,NULL),
(831,20,30,1,1,NULL,NULL,NULL,NULL,NULL),
(832,20,30,3,1,NULL,NULL,NULL,NULL,NULL),
(833,21,30,1,1,NULL,NULL,NULL,NULL,NULL),
(834,22,30,3,1,NULL,NULL,NULL,NULL,NULL),
(835,23,30,1,1,NULL,NULL,NULL,NULL,NULL),
(836,23,30,2,1,NULL,NULL,NULL,NULL,NULL),
(837,23,30,3,1,NULL,NULL,NULL,NULL,NULL),
(838,23,30,4,1,NULL,NULL,NULL,NULL,NULL),
(839,24,30,1,1,NULL,NULL,NULL,NULL,NULL),
(840,24,30,2,1,NULL,NULL,NULL,NULL,NULL),
(841,24,30,3,1,NULL,NULL,NULL,NULL,NULL),
(842,24,30,4,1,NULL,NULL,NULL,NULL,NULL),
(843,1,1,1,1,NULL,NULL,NULL,NULL,NULL),
(844,1,1,2,1,NULL,NULL,NULL,NULL,NULL),
(845,1,1,3,1,NULL,NULL,NULL,NULL,NULL),
(846,1,1,4,1,NULL,NULL,NULL,NULL,NULL),
(847,2,1,1,1,NULL,NULL,NULL,NULL,NULL),
(848,2,1,2,1,NULL,NULL,NULL,NULL,NULL),
(849,2,1,3,1,NULL,NULL,NULL,NULL,NULL),
(850,2,1,4,1,NULL,NULL,NULL,NULL,NULL),
(851,3,1,1,1,NULL,NULL,NULL,NULL,NULL),
(852,3,1,2,1,NULL,NULL,NULL,NULL,NULL),
(853,3,1,3,1,NULL,NULL,NULL,NULL,NULL),
(854,3,1,4,1,NULL,NULL,NULL,NULL,NULL),
(855,4,1,1,1,NULL,NULL,NULL,NULL,NULL),
(856,4,1,2,1,NULL,NULL,NULL,NULL,NULL),
(857,4,1,3,1,NULL,NULL,NULL,NULL,NULL),
(858,4,1,4,1,NULL,NULL,NULL,NULL,NULL),
(859,5,1,1,1,NULL,NULL,NULL,NULL,NULL),
(860,5,1,2,1,NULL,NULL,NULL,NULL,NULL),
(861,5,1,3,1,NULL,NULL,NULL,NULL,NULL),
(862,5,1,4,1,NULL,NULL,NULL,NULL,NULL),
(863,6,1,1,1,NULL,NULL,NULL,NULL,NULL),
(864,6,1,2,1,NULL,NULL,NULL,NULL,NULL),
(865,6,1,3,1,NULL,NULL,NULL,NULL,NULL),
(866,6,1,4,1,NULL,NULL,NULL,NULL,NULL),
(867,6,1,5,1,NULL,NULL,NULL,NULL,NULL),
(868,6,1,6,1,NULL,NULL,NULL,NULL,NULL),
(869,10,1,3,1,NULL,NULL,NULL,NULL,NULL),
(870,11,1,1,1,NULL,NULL,NULL,NULL,NULL),
(871,11,1,2,1,NULL,NULL,NULL,NULL,NULL),
(872,11,1,3,1,NULL,NULL,NULL,NULL,NULL),
(873,11,1,4,1,NULL,NULL,NULL,NULL,NULL),
(874,12,1,1,1,NULL,NULL,NULL,NULL,NULL),
(875,12,1,2,1,NULL,NULL,NULL,NULL,NULL),
(876,12,1,3,1,NULL,NULL,NULL,NULL,NULL),
(877,12,1,4,1,NULL,NULL,NULL,NULL,NULL),
(878,13,1,1,1,NULL,NULL,NULL,NULL,NULL),
(879,13,1,2,1,NULL,NULL,NULL,NULL,NULL),
(880,13,1,3,1,NULL,NULL,NULL,NULL,NULL),
(881,13,1,4,1,NULL,NULL,NULL,NULL,NULL),
(882,14,1,1,1,NULL,NULL,NULL,NULL,NULL),
(883,14,1,2,1,NULL,NULL,NULL,NULL,NULL),
(884,14,1,3,1,NULL,NULL,NULL,NULL,NULL),
(885,14,1,4,1,NULL,NULL,NULL,NULL,NULL),
(886,15,1,1,1,NULL,NULL,NULL,NULL,NULL),
(887,15,1,2,1,NULL,NULL,NULL,NULL,NULL),
(888,15,1,3,1,NULL,NULL,NULL,NULL,NULL),
(889,15,1,4,1,NULL,NULL,NULL,NULL,NULL),
(890,16,1,1,1,NULL,NULL,NULL,NULL,NULL),
(891,16,1,2,1,NULL,NULL,NULL,NULL,NULL),
(892,16,1,3,1,NULL,NULL,NULL,NULL,NULL),
(893,16,1,4,1,NULL,NULL,NULL,NULL,NULL),
(894,16,1,8,1,NULL,NULL,NULL,NULL,NULL),
(895,17,1,1,1,NULL,NULL,NULL,NULL,NULL),
(896,17,1,2,1,NULL,NULL,NULL,NULL,NULL),
(897,17,1,3,1,NULL,NULL,NULL,NULL,NULL),
(898,17,1,4,1,NULL,NULL,NULL,NULL,NULL),
(899,17,1,8,1,NULL,NULL,NULL,NULL,NULL),
(900,18,1,1,1,NULL,NULL,NULL,NULL,NULL),
(901,18,1,8,1,NULL,NULL,NULL,NULL,NULL),
(902,19,1,1,1,NULL,NULL,NULL,NULL,NULL),
(903,19,1,8,1,NULL,NULL,NULL,NULL,NULL),
(904,20,1,1,1,NULL,NULL,NULL,NULL,NULL),
(905,20,1,3,1,NULL,NULL,NULL,NULL,NULL),
(906,21,1,1,1,NULL,NULL,NULL,NULL,NULL),
(907,22,1,3,1,NULL,NULL,NULL,NULL,NULL),
(908,23,1,1,1,NULL,NULL,NULL,NULL,NULL),
(909,23,1,2,1,NULL,NULL,NULL,NULL,NULL),
(910,23,1,3,1,NULL,NULL,NULL,NULL,NULL),
(911,23,1,4,1,NULL,NULL,NULL,NULL,NULL),
(912,24,1,1,1,NULL,NULL,NULL,NULL,NULL),
(913,24,1,2,1,NULL,NULL,NULL,NULL,NULL),
(914,24,1,3,1,NULL,NULL,NULL,NULL,NULL),
(915,24,1,4,1,NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `modules` */

insert  into `modules`(`id`,`name`,`description`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,'Role Management',NULL,1,NULL,1,1,'2020-01-24 18:53:44','2020-12-05 15:05:04'),
(2,'Role Access Control',NULL,1,NULL,1,1,'2020-01-24 18:54:32','2020-01-24 18:54:32'),
(3,'User Access Control',NULL,1,NULL,1,1,'2020-01-24 18:54:59','2020-01-24 18:54:59'),
(4,'Module Management',NULL,1,NULL,1,1,'2020-01-24 18:55:37','2020-01-24 18:55:37'),
(5,'Activity Management',NULL,1,NULL,1,1,'2020-01-24 18:55:58','2020-01-24 18:55:58'),
(6,'Admin Panel User',NULL,1,NULL,1,1,'2020-01-24 18:58:53','2020-01-24 18:58:53'),
(10,'Site Setting',NULL,1,NULL,1,1,'2021-07-14 09:08:07','2021-07-14 09:08:07'),
(11,'Player',NULL,1,NULL,1,1,'2021-09-19 12:47:03','2021-09-19 12:51:41'),
(12,'Contest',NULL,1,NULL,1,1,'2021-09-19 12:51:59','2021-09-19 12:51:59'),
(13,'Win Coin',NULL,1,NULL,1,1,'2021-09-19 12:56:31','2021-09-19 12:56:31'),
(14,'Category',NULL,1,NULL,1,1,'2021-09-19 13:01:56','2021-09-19 13:01:56'),
(15,'Brand',NULL,1,NULL,1,1,'2021-09-19 13:05:48','2021-09-19 13:05:48'),
(16,'Product',NULL,1,NULL,1,1,'2021-09-19 13:07:51','2021-09-19 13:07:51'),
(17,'Auction Product',NULL,1,NULL,1,1,'2021-09-19 13:11:04','2021-09-19 13:11:04'),
(18,'Order',NULL,1,NULL,1,1,'2021-09-19 13:16:21','2021-09-19 13:16:21'),
(19,'Auction Order',NULL,1,NULL,1,1,'2021-09-19 13:17:49','2021-09-19 13:17:49'),
(20,'Withdraw',NULL,1,NULL,1,1,'2021-09-19 13:20:43','2021-09-19 13:20:43'),
(21,'Report',NULL,1,NULL,1,1,'2021-09-19 13:25:20','2021-09-19 13:25:20'),
(22,'Pages',NULL,1,NULL,1,1,'2021-09-19 13:26:51','2021-09-19 13:26:51'),
(23,'slider',NULL,1,NULL,1,1,'2021-09-19 13:28:33','2021-09-19 13:28:33'),
(24,'Footer Circle Image',NULL,1,NULL,1,1,'2021-09-19 13:30:02','2021-09-19 13:30:02');

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `order_details` */

/*Table structure for table `order_shipping_addresses` */

DROP TABLE IF EXISTS `order_shipping_addresses`;

CREATE TABLE `order_shipping_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `order_shipping_addresses` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `orders` */

/*Table structure for table `other_pages` */

DROP TABLE IF EXISTS `other_pages`;

CREATE TABLE `other_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `privacy_policy` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms_condition` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rules` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `other_pages` */

/*Table structure for table `participant_answers` */

DROP TABLE IF EXISTS `participant_answers`;

CREATE TABLE `participant_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contest_participant_id` bigint(20) unsigned NOT NULL,
  `contest_id` bigint(20) unsigned NOT NULL,
  `contest_player_id` bigint(20) unsigned NOT NULL,
  `participant_type` tinyint(1) NOT NULL COMMENT '0 = user, 1 = guest',
  `participant_id` bigint(20) unsigned NOT NULL COMMENT 'user or guest id',
  `participant_answer` tinyint(1) NOT NULL COMMENT '1 = under,2 = over',
  `is_correct` int(11) NOT NULL COMMENT '0 = not check , 1 = no, 2 =yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `participant_answers` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `players` */

DROP TABLE IF EXISTS `players`;

CREATE TABLE `players` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `players` */

/*Table structure for table `product_bids` */

DROP TABLE IF EXISTS `product_bids`;

CREATE TABLE `product_bids` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_wise_bid_id` bigint(20) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '1 = Active, 0 = Inactive',
  `bid_amount` double DEFAULT NULL,
  `bid_end_date` date DEFAULT NULL,
  `bid_end_time` time DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_bids` */

/*Table structure for table `product_wise_bids` */

DROP TABLE IF EXISTS `product_wise_bids`;

CREATE TABLE `product_wise_bids` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
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
  `provied_to_user` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_wise_bids` */

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
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`slug`,`category_id`,`sub_category_id`,`brand_id`,`feature_image`,`galler_images`,`product_type`,`attached_file`,`price`,`discount_amount`,`quantity`,`remaining_qty`,`deliver_charge`,`model_number`,`product_description`,`return_policy`,`pro_meta`,`pro_mt_description`,`video_url`,`featureproduct`,`starting_bid_amount`,`auction_start_date`,`auction_start_time`,`auction_end_date`,`auction_end_time`,`auction_start_date_time`,`auction_end_date_time`,`avg_review`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(8,'Product 1','45455ID',2,NULL,1,'ytgvkWxqvOFVYLXEvHTX.png','[\"610c5abb7e880product-details-large.png\"]','General Product',NULL,50,10,NULL,-1,20,NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>','<p>Return plicy</p>','Meta','Meta discritpion',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL,1,1,'2021-08-05 21:19:40','2021-09-19 11:14:00'),
(9,'product 2','product-2-5880',2,NULL,2,'d38reOkhGAJasjHq7KpG.png',NULL,'General Product',NULL,70,NULL,100,68,10,'eeee555ID','<p>Product dEscritpion</p>','<p>Return plicy</p>',NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,1,NULL,1,1,'2021-08-05 21:42:57','2021-08-13 06:07:40'),
(10,'Prouct 3','prouct-3-7928',2,NULL,2,'tgW6WRxeKwyRvxhcQxD1.png',NULL,'General Product',NULL,100,NULL,NULL,100,0,'E-g33333gtt','<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>',NULL,NULL,NULL,NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,1,NULL,1,1,'2021-08-05 21:47:23','2021-09-19 11:14:31');

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
(3,'Customer',NULL,1,'2021-09-19 12:29:13',1,'2020-03-03 11:13:42','2021-09-19 12:29:13',1),
(4,'Test role',NULL,0,'2020-11-23 14:56:47',1,'2020-11-23 14:53:06','2020-11-23 14:56:47',1);

/*Table structure for table `site_settings` */

DROP TABLE IF EXISTS `site_settings`;

CREATE TABLE `site_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `site_settings` */

insert  into `site_settings`(`id`,`logo`,`icon`,`email`,`contact_no`,`address`,`google_map`,`chat_widget`,`site_title`,`meta_description`,`meta_keyword`,`copy_right`,`alert_quantity`,`display_unit`,`facebook_share_link`,`start_contest_title`,`start_contest_text`,`index_title`,`notice`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,'upload/site-setting/BVJuu5TjKieshRQffgtu.png','upload/site-setting/2MYiazBzV4LaLM4dRp3N.png','byxakyny@mailinator.net','7034954485','752 East Oak Street',NULL,'<!--Start of Tawk.to Script--> <script type=\"text/javascript\"> var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date(); (function(){ var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0]; s1.async=true; s1.src=\'https://embed.tawk.to/61191a38649e0a0a5cd13a18/1fd50ss1d\'; s1.charset=\'UTF-8\'; s1.setAttribute(\'crossorigin\',\'*\'); s0.parentNode.insertBefore(s1,s0); })(); </script> <!--End of Tawk.to Script-->','GalaxyGo','GalaxyGo','GalaxyGo','GalaxyGo',15000,1,'https://galaxygo.duckbd.com/admin-login','How To Play','You Can Win 100000 Coins Daily. Start Now!!','I Am Guest','Notice goes here. Notice goes here. Notice goes here. Notice. Notice goes here. Notice goes here. Notice goes here. Notice.Notice goes here. Notice goes here. Notice goes here. Notice.Notice goes here. Notice goes here. Notice goes here. Notice.',1,1,'2021-06-02 06:26:39','2021-09-16 11:04:22');

/*Table structure for table `sliders` */

DROP TABLE IF EXISTS `sliders`;

CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title_black` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_color` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_label` varchar(58) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_serial` int(11) DEFAULT NULL,
  `slider_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sliders` */

insert  into `sliders`(`id`,`title_black`,`title_color`,`description`,`button_label`,`link`,`order_serial`,`slider_name`,`status`,`deleted_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(3,'Fashionss','Men shoes','Filler text is text that shares some characteristics of a real written text, \r\nbut is random or otherwise','Buy now','facebook.com',1,'upload/slider-image/E5a1Z8LUXl5mSK7Q1hxl.png',1,'2021-08-13 18:56:02',1,1,'2021-08-13 18:44:15','2021-08-13 18:56:02'),
(4,'Fashion','Men shoes','Filler text is text that shares some characteristics of a real written text, \r\nbut is random or otherwise','Buy now','https://www.w3schools.com/php/func_string_nl2br.asp',1,'upload/slider-image/iLf5CDcjG0FpEbgETv6J.png',1,NULL,1,1,'2021-08-13 18:56:37','2021-08-13 18:59:48');

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transactions` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_contact_no_unique` (`contact_no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`role_id`,`name`,`email`,`paypal_email`,`last_name`,`email_verified_at`,`contact_no`,`photo`,`cover_photo`,`password`,`lastLoginTime`,`provider`,`provider_id`,`total_coin`,`current_coin`,`withdraw`,`status`,`shipping_first_name`,`shipping_last_name`,`shipping_email`,`shipping_company_name`,`shipping_adrress_line_1`,`shipping_adrress_line_2`,`shipping_city`,`shipping_country`,`shipping_post_code`,`shipping_phone`,`deleted_at`,`remember_token`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,1,'admin','admin@email.com',NULL,NULL,NULL,'01682234164','upload/portfolio-pic/yrVXGUlsb6sRYH2FyM2H.jpg',NULL,'$2y$10$m4ZSPJRaz3C7chseDTpqCub3ZeN4Pn4IRfXFiifnbYN21hkP.4hbm','2021-09-19 08:20:38',NULL,NULL,0.00,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sLtM9th4HmScLEkCE4MnTG1h9se6VzxfTY9Oq6Y2T8AaqYi0EZ7TRWoYF5Ap',1,1,'2020-01-18 10:14:02','2021-09-19 08:20:38'),
(30,2,'admin2','admin2@email.com',NULL,NULL,NULL,'7034954485','upload/portfolio-pic/OxrA57QHZQPCuUZwCOzb.png',NULL,'$2y$10$H5pgea2PIPNydfEoRdWW5urFXsocmcnZEOyrEYvU4altbF9Bu1S.O','2021-09-19 13:55:24',NULL,NULL,0.00,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2021-08-18 19:53:50','2021-09-19 13:55:24');

/*Table structure for table `win_coins` */

DROP TABLE IF EXISTS `win_coins`;

CREATE TABLE `win_coins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `win` int(11) NOT NULL,
  `out_of` int(11) NOT NULL,
  `coin` int(11) NOT NULL,
  `coin_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `win_coins` */

/*Table structure for table `withdraw_requests` */

DROP TABLE IF EXISTS `withdraw_requests`;

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `paypal_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `coin_amount` decimal(14,2) NOT NULL,
  `before_withdraw` decimal(14,2) NOT NULL,
  `after_withdraw` decimal(14,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = confirm, 2 = cancel',
  `coin_history_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `withdraw_requests` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
