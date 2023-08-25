-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 25 août 2023 à 10:23
-- Version du serveur : 8.0.34-0ubuntu0.22.04.1
-- Version de PHP : 8.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `camping`
--

-- --------------------------------------------------------

--
-- Structure de la table `accomodation`
--

CREATE TABLE `accomodation` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `available` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `accomodation`
--

INSERT INTO `accomodation` (`id`, `name`, `description`, `available`, `image`) VALUES
(1, 'Camping Car', 'Notre Camping propose des forfaits en emplacement camping-car et se fera un plaisir de vous accueillir chaleureusement toute l’année.', 1, 'camping-car-64e68d9d2a5b2.jpg'),
(2, 'Caravane', '49, c\'est le nombre d\'emplacement confort caravane que dispose le camping du mont-olympe', 1, 'camping-car-64e68d9d2a5b2.jpg'),
(7, 'Port', 'Super le port !', 1, 'port-5cfa61e94b0d2-64e68de47c634.jpg'),
(8, 'Prout', 'prouton', 1, '/tmp/phpqbXc2c'),
(9, 'Prout', 'prouton', 1, 'Capture-d-ecran-du-2023-08-23-16-51-20-64e68527b5ea7.png'),
(10, 'carimage', 'la photo du camping car', 0, 'camping-car-64e68d9d2a5b2.jpg'),
(11, 'portons', 'la photo du port', 0, 'port-5cfa61e94b0d2-64e68de47c634.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `accomodation_tag`
--

CREATE TABLE `accomodation_tag` (
  `accomodation_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `accomodation_tag`
--

INSERT INTO `accomodation_tag` (`accomodation_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(7, 1),
(7, 3),
(10, 3);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230719125624', '2023-07-19 12:57:11', 289),
('DoctrineMigrations\\Version20230803144050', '2023-08-03 14:41:00', 116),
('DoctrineMigrations\\Version20230804080931', '2023-08-04 08:09:36', 112),
('DoctrineMigrations\\Version20230804094056', '2023-08-04 09:41:05', 65),
('DoctrineMigrations\\Version20230804094545', '2023-08-04 09:46:01', 144),
('DoctrineMigrations\\Version20230811124006', '2023-08-11 12:40:13', 72),
('DoctrineMigrations\\Version20230817192936', '2023-08-17 19:29:43', 243),
('DoctrineMigrations\\Version20230817193313', '2023-08-17 19:34:11', 192),
('DoctrineMigrations\\Version20230817193525', '2023-08-17 19:35:43', 92),
('DoctrineMigrations\\Version20230817214329', '2023-08-17 21:43:34', 118),
('DoctrineMigrations\\Version20230818122940', '2023-08-18 12:29:54', 69),
('DoctrineMigrations\\Version20230820145024', '2023-08-20 14:50:31', 149),
('DoctrineMigrations\\Version20230820145515', '2023-08-20 14:55:23', 37),
('DoctrineMigrations\\Version20230820145807', '2023-08-20 14:58:12', 32),
('DoctrineMigrations\\Version20230823213540', '2023-08-23 21:35:46', 200),
('DoctrineMigrations\\Version20230823215027', '2023-08-23 21:50:33', 123),
('DoctrineMigrations\\Version20230823215413', '2023-08-23 21:54:17', 235),
('DoctrineMigrations\\Version20230823221057', '2023-08-23 22:11:01', 47);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `accomodation_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `id` int NOT NULL,
  `accomodation_id` int NOT NULL,
  `available` tinyint(1) NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`id`, `accomodation_id`, `available`, `number`) VALUES
(5, 2, 1, 21),
(6, 2, 1, 22),
(7, 2, 1, 23),
(8, 2, 0, 24),
(14, 1, 1, 50),
(15, 1, 1, 40),
(16, 1, 1, 20),
(17, 1, 1, 30),
(18, 1, 1, 5225),
(19, 7, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

CREATE TABLE `log` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `message` varchar(510) COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `context` longtext COLLATE utf8mb3_unicode_ci COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `log`
--

INSERT INTO `log` (`id`, `user_id`, `message`, `date`, `context`) VALUES
(10, 3, 'This is a log message !', '2023-08-04 11:46:18', 'a:2:{i:0;s:3:\"add\";i:1;s:6:\"season\";}'),
(11, 3, 'This is a log message !', '2023-08-04 11:46:21', 'a:2:{i:0;s:3:\"add\";i:1;s:6:\"season\";}'),
(12, 3, 'Un tarif emplacement a été ajouté pour Hébergement 2', '2023-08-04 11:58:37', 'a:2:{i:0;s:3:\"Add\";i:1;s:5:\"Price\";}'),
(13, 3, 'Un tarif emplacement a été supprimé pour Hébergement 1', '2023-08-04 12:01:15', 'a:2:{i:0;s:3:\"Add\";i:1;s:5:\"Price\";}'),
(14, 3, 'Un tarif emplacement a été ajouté pour Hébergement 1', '2023-08-04 12:08:42', 'a:2:{i:0;s:3:\"add\";i:1;s:5:\"price\";}'),
(15, 3, 'Un tarif emplacement a été modifié pour Hébergement 1', '2023-08-04 12:10:33', 'a:2:{i:0;s:6:\"update\";i:1;s:5:\"price\";}'),
(16, 3, 'Un tarif emplacement a été modifié pour Hébergement 1', '2023-08-04 12:11:25', 'a:2:{i:0;s:6:\"update\";i:1;s:5:\"price\";}'),
(17, 3, 'Un tarif emplacement a été supprimé pour Hébergement 1', '2023-08-04 12:11:54', 'a:2:{i:0;s:6:\"delete\";i:1;s:5:\"price\";}'),
(18, 3, 'Un tarif service a été ajouté pour Service 1', '2023-08-04 12:21:04', 'a:2:{i:0;s:3:\"add\";i:1;s:5:\"price\";}'),
(19, 3, 'Un tarif service a été supprimé pour Service 1', '2023-08-04 12:21:27', 'a:2:{i:0;s:6:\"delete\";i:1;s:5:\"price\";}'),
(20, 3, 'Un tarif service a été modifié pour Service 1', '2023-08-04 12:21:32', 'a:2:{i:0;s:6:\"update\";i:1;s:5:\"price\";}'),
(21, 3, 'Un tarif offre a été ajouté pour adult', '2023-08-04 12:22:43', 'a:2:{i:0;s:3:\"add\";i:1;s:5:\"price\";}'),
(22, 3, 'Un tarif offre a été supprimé pour adult', '2023-08-04 12:24:51', 'a:2:{i:0;s:6:\"delete\";i:1;s:5:\"price\";}'),
(23, 3, 'Un tarif offre a été modifié pour adult', '2023-08-04 12:24:56', 'a:2:{i:0;s:6:\"update\";i:1;s:5:\"price\";}'),
(24, 3, 'Un tarif offre a été ajouté pour coupons', '2023-08-04 12:29:04', 'a:2:{i:0;s:3:\"add\";i:1;s:5:\"price\";}'),
(25, 3, 'Un tarif offre a été supprimé pour coupons', '2023-08-04 12:29:28', 'a:2:{i:0;s:6:\"delete\";i:1;s:5:\"price\";}'),
(26, 3, 'Un tarif offre a été modifié pour coupons', '2023-08-04 12:29:38', 'a:2:{i:0;s:6:\"update\";i:1;s:5:\"price\";}'),
(27, 3, 'Une saison \'saisonne\' a été ajoutée', '2023-08-04 12:55:41', 'a:2:{i:0;s:3:\"add\";i:1;s:6:\"season\";}'),
(28, 3, 'Une saison \'saisonnier\' a été ajoutée', '2023-08-04 12:57:39', 'a:2:{i:0;s:3:\"add\";i:1;s:6:\"season\";}'),
(29, 3, 'La saison\'saisonnier\' a été renommée en Saisonne', '2023-08-04 12:58:52', 'a:2:{i:0;s:6:\"update\";i:1;s:6:\"season\";}'),
(30, 3, 'La saison \'Saisonne\' a été supprimée', '2023-08-04 13:01:18', 'a:2:{i:0;s:6:\"delete\";i:1;s:6:\"season\";}'),
(31, 3, 'La saison \'Test\' a été supprimée', '2023-08-04 13:01:44', 'a:2:{i:0;s:6:\"delete\";i:1;s:6:\"season\";}'),
(32, 3, 'Une période a été ajoutée pour la saison \'Saison une', '2023-08-04 13:07:08', 'a:2:{i:0;s:3:\"add\";i:1;s:6:\"season\";}'),
(33, 3, 'Une période a été ajoutée pour la saison \'Test', '2023-08-04 13:07:17', 'a:2:{i:0;s:3:\"add\";i:1;s:6:\"season\";}'),
(34, 3, 'Une période a été supprimée pour la saison \'Saison une', '2023-08-04 13:09:02', 'a:2:{i:0;s:6:\"delete\";i:1;s:6:\"season\";}'),
(35, 3, 'Une période a été modifiée pour la saison \'Saison une', '2023-08-04 13:09:22', 'a:2:{i:0;s:6:\"update\";i:1;s:6:\"season\";}'),
(36, 3, 'Une période a été supprimée pour la saison \'Test', '2023-08-04 14:32:15', 'a:2:{i:0;s:6:\"delete\";i:1;s:6:\"season\";}'),
(37, 3, 'Une période a été modifiée pour la saison \'Test', '2023-08-04 14:32:53', 'a:2:{i:0;s:6:\"update\";i:1;s:6:\"season\";}'),
(38, 3, 'Un service \'Chien\' a été ajouté', '2023-08-04 14:49:26', 'a:2:{i:0;s:3:\"add\";i:1;s:7:\"service\";}'),
(39, 3, 'Un service \'Chiot\' a été ajouté', '2023-08-04 14:49:32', 'a:2:{i:0;s:3:\"add\";i:1;s:7:\"service\";}'),
(40, 3, 'Le service \'Chiot\' a été renommé en Chat', '2023-08-04 14:53:34', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(41, 3, 'Le service \'Chat\' a été supprimé', '2023-08-04 14:57:31', 'a:2:{i:0;s:6:\"delete\";i:1;s:7:\"service\";}'),
(42, 3, 'Le service \'Chien\' a été supprimé', '2023-08-04 14:57:33', 'a:2:{i:0;s:6:\"delete\";i:1;s:7:\"service\";}'),
(43, 3, 'Le service \'Service 1\' a été renommé en \'Chien\'', '2023-08-04 15:00:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(44, 3, 'Une règle a été supprimée pour le service \'Service 2', '2023-08-04 15:05:22', 'a:2:{i:0;s:6:\"delete\";i:1;s:7:\"service\";}'),
(45, 2, 'Une règle de réservation checkOut a été ajoutée', '2023-08-04 15:24:21', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(46, 2, 'Une règle de réservation minStay a été ajoutée', '2023-08-04 15:24:39', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(47, 2, 'Une règle de réservation minStay a été supprimée', '2023-08-04 15:28:15', 'a:2:{i:0;s:6:\"delete\";i:1;s:11:\"reservation\";}'),
(48, 2, 'Une règle de réservation checkOut a été modifiée', '2023-08-04 15:28:21', 'a:2:{i:0;s:6:\"update\";i:1;s:11:\"reservation\";}'),
(49, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(50, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(51, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(52, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(53, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(54, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(55, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(56, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(57, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(58, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(59, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(60, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(61, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(62, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(63, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(64, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(65, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(66, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(67, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(68, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(69, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(70, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(71, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(72, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(73, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(74, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(75, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(76, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(77, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(78, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(79, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:04', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(80, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(81, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(82, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(83, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(84, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(85, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(86, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(87, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(88, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(89, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(90, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(91, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(92, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(93, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(94, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(95, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(96, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(97, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(98, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(99, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(100, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(101, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(102, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(103, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(104, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(105, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(106, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(107, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(108, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(109, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(110, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(111, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(112, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(113, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(114, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(115, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(116, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(117, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(118, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(119, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(120, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(121, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(122, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(123, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(124, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(125, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(126, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(127, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(128, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(129, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(130, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(131, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(132, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(133, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(134, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(135, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(136, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(137, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(138, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(139, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(140, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(141, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(142, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(143, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(144, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(145, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(146, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(147, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(148, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(149, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(150, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(151, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(152, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(153, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(154, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(155, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(156, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(157, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(158, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(159, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(160, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(161, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(162, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(163, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(164, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(165, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(166, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(167, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(168, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(169, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(170, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(171, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(172, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(173, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(174, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(175, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(176, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(177, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(178, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(179, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(180, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(181, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(182, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:05', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(183, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(184, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(185, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(186, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(187, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(188, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(189, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(190, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(191, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(192, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(193, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(194, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(195, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(196, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(197, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(198, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(199, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(200, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(201, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(202, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(203, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(204, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(205, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(206, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(207, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(208, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(209, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(210, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(211, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(212, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(213, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(214, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(215, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(216, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(217, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(218, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(219, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(220, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(221, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(222, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(223, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(224, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(225, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(226, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(227, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(228, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(229, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(230, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(231, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(232, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(233, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(234, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(235, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(236, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(237, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(238, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(239, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(240, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(241, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(242, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(243, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(244, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(245, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(246, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(247, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(248, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(249, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(250, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(251, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(252, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(253, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(254, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(255, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(256, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(257, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(258, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(259, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(260, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(261, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(262, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(263, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:06', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(264, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(265, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(266, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(267, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(268, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(269, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(270, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(271, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(272, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(273, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(274, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(275, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(276, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(277, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(278, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(279, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(280, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(281, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(282, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(283, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(284, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(285, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(286, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(287, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(288, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(289, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(290, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(291, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(292, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(293, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(294, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(295, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(296, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(297, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(298, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(299, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(300, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(301, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(302, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(303, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(304, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(305, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(306, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(307, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(308, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(309, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(310, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(311, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(312, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(313, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(314, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(315, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(316, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:07', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(317, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(318, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(319, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(320, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(321, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(322, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(323, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(324, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(325, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(326, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(327, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(328, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(329, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(330, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(331, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(332, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(333, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(334, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(335, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(336, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(337, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(338, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(339, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(340, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(341, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(342, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(343, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(344, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(345, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(346, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(347, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(348, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(349, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(350, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(351, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(352, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(353, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(354, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(355, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(356, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(357, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(358, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(359, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(360, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(361, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(362, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(363, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(364, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(365, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(366, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(367, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(368, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(369, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(370, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(371, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(372, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(373, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(374, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(375, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(376, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(377, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:08', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(378, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(379, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(380, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(381, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(382, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(383, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(384, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}');
INSERT INTO `log` (`id`, `user_id`, `message`, `date`, `context`) VALUES
(385, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(386, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(387, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(388, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(389, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(390, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(391, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(392, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(393, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(394, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(395, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(396, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(397, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(398, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(399, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(400, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(401, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(402, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(403, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(404, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(405, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(406, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(407, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(408, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(409, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(410, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(411, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(412, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(413, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(414, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(415, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(416, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(417, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(418, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(419, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(420, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(421, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(422, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(423, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(424, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(425, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(426, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(427, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(428, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(429, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(430, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(431, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(432, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(433, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(434, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(435, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:09', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(436, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(437, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(438, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(439, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(440, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(441, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(442, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(443, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(444, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(445, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(446, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(447, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(448, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(449, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(450, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(451, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(452, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(453, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(454, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(455, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(456, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(457, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(458, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(459, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(460, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(461, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(462, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(463, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(464, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(465, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(466, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(467, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(468, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(469, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(470, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(471, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(472, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(473, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(474, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(475, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(476, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(477, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(478, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(479, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(480, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(481, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(482, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(483, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(484, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(485, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(486, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(487, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(488, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(489, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(490, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(491, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(492, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(493, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(494, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(495, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(496, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(497, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:10', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(498, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(499, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(500, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(501, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(502, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(503, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(504, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(505, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(506, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(507, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(508, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(509, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(510, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(511, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(512, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(513, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(514, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(515, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(516, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(517, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(518, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(519, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(520, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(521, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(522, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(523, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(524, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(525, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(526, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(527, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(528, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(529, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(530, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(531, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(532, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(533, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(534, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(535, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(536, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(537, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(538, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(539, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(540, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(541, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(542, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(543, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(544, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(545, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(546, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(547, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(548, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(549, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(550, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(551, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(552, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(553, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(554, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(555, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(556, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:11', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(557, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(558, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(559, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(560, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(561, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(562, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(563, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(564, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(565, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(566, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(567, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(568, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(569, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(570, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(571, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(572, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(573, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(574, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(575, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(576, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(577, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(578, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(579, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(580, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(581, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(582, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(583, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(584, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(585, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(586, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(587, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(588, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(589, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(590, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(591, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(592, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(593, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(594, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(595, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(596, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(597, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(598, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(599, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(600, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(601, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(602, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(603, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(604, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(605, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(606, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(607, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(608, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(609, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(610, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(611, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(612, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:12', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(613, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(614, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(615, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(616, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(617, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(618, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(619, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(620, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(621, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(622, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(623, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(624, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(625, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(626, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(627, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(628, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(629, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(630, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(631, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(632, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(633, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(634, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(635, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(636, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(637, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(638, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(639, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(640, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(641, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(642, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(643, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(644, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(645, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(646, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(647, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(648, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(649, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(650, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(651, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(652, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(653, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(654, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(655, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(656, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(657, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(658, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(659, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(660, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(661, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(662, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:13', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(663, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(664, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(665, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(666, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(667, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(668, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(669, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(670, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(671, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(672, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(673, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(674, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(675, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(676, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(677, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(678, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(679, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(680, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(681, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(682, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(683, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(684, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(685, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(686, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(687, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(688, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(689, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(690, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(691, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(692, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(693, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(694, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(695, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(696, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(697, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(698, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(699, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(700, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(701, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(702, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(703, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(704, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(705, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:14', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(706, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(707, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(708, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(709, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(710, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(711, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(712, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(713, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(714, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(715, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(716, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(717, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(718, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(719, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(720, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(721, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(722, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(723, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(724, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(725, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(726, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(727, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(728, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(729, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(730, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(731, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(732, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(733, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(734, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(735, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(736, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(737, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(738, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(739, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(740, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(741, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(742, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(743, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(744, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(745, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(746, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(747, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(748, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(749, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(750, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:15', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(751, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(752, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(753, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(754, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(755, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(756, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}');
INSERT INTO `log` (`id`, `user_id`, `message`, `date`, `context`) VALUES
(757, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(758, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(759, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(760, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(761, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(762, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(763, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(764, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(765, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(766, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(767, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(768, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(769, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(770, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(771, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(772, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(773, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(774, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(775, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(776, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(777, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(778, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(779, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(780, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(781, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(782, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(783, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(784, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(785, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(786, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(787, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(788, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(789, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(790, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(791, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(792, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(793, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(794, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(795, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(796, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(797, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(798, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:16', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(799, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(800, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(801, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(802, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(803, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(804, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(805, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(806, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(807, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(808, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(809, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(810, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(811, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(812, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(813, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(814, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(815, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(816, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(817, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(818, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(819, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(820, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(821, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(822, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(823, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(824, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(825, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(826, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(827, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(828, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(829, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(830, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(831, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(832, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(833, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(834, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(835, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(836, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(837, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(838, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:17', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(839, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(840, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(841, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(842, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(843, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(844, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(845, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(846, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(847, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(848, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(849, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(850, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(851, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(852, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(853, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(854, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(855, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(856, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(857, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(858, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(859, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(860, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(861, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(862, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(863, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(864, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(865, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(866, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(867, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(868, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(869, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(870, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(871, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:18', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(872, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(873, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(874, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(875, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(876, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(877, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(878, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(879, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(880, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(881, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(882, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(883, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(884, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(885, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(886, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(887, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(888, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(889, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(890, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(891, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(892, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(893, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(894, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(895, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(896, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(897, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(898, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(899, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(900, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(901, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(902, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(903, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(904, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(905, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(906, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(907, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(908, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(909, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(910, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:19', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(911, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(912, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(913, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(914, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(915, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(916, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(917, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(918, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(919, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(920, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(921, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(922, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(923, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(924, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(925, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(926, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(927, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(928, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(929, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(930, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(931, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(932, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(933, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(934, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(935, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(936, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(937, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(938, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(939, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:20', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(940, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(941, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(942, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(943, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(944, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(945, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(946, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(947, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(948, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(949, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(950, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(951, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(952, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(953, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(954, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(955, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(956, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(957, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(958, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(959, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(960, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(961, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(962, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(963, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(964, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(965, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(966, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(967, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(968, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(969, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(970, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(971, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:21', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(972, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(973, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(974, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(975, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(976, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(977, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(978, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(979, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(980, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(981, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(982, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(983, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(984, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(985, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(986, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(987, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(988, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(989, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(990, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(991, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(992, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(993, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(994, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(995, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(996, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(997, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(998, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(999, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1000, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1001, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1002, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1003, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1004, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1005, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1006, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1007, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:22', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1008, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1009, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1010, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1011, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1012, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1013, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1014, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1015, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1016, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1017, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1018, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1019, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1020, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1021, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1022, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1023, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1024, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1025, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1026, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1027, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1028, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1029, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1030, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1031, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1032, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1033, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1034, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1035, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1036, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1037, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1038, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1039, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1040, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1041, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1042, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1043, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1044, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1045, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1046, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1047, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:23', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1048, 3, 'Le service \'Service 2\' a été renommé en \'Chat\'', '2023-08-11 11:31:24', 'a:2:{i:0;s:6:\"update\";i:1;s:7:\"service\";}'),
(1049, 3, 'Une réservation a été créée', '2023-08-11 15:08:47', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1050, 3, 'La réservation N°6 a été créée', '2023-08-11 15:09:36', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1051, 3, 'La réservation N°7 a été créée', '2023-08-11 15:09:49', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1052, 3, 'La réservation N°8 a été créée', '2023-08-11 15:11:41', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1053, 3, 'La réservation N°9 a été créée', '2023-08-11 15:11:42', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1054, 3, 'La réservation N°10 a été créée', '2023-08-11 15:11:43', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1055, 3, 'La réservation N°11 a été créée', '2023-08-11 15:11:43', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1056, 3, 'La réservation N°12 a été créée', '2023-08-11 15:11:44', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1057, 3, 'La réservation N°13 a été créée', '2023-08-11 15:11:44', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1058, 3, 'La réservation N°14 a été créée', '2023-08-11 15:11:44', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1059, 3, 'La réservation N°15 a été créée', '2023-08-11 15:11:44', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1060, 3, 'La réservation N°16 a été créée', '2023-08-11 15:11:44', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1061, 3, 'La réservation N°17 a été créée', '2023-08-11 15:11:44', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1062, 3, 'La réservation N°18 a été créée', '2023-08-11 15:11:44', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1063, 3, 'La réservation N°19 a été créée', '2023-08-11 15:11:44', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1064, 3, 'La réservation N°20 a été créée', '2023-08-11 15:13:03', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1065, 3, 'La réservation N°21 a été créée', '2023-08-11 15:13:05', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1066, 3, 'La réservation N°22 a été créée', '2023-08-11 15:13:05', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1067, 3, 'La réservation N°23 a été créée', '2023-08-11 15:13:05', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1068, 3, 'La réservation N°24 a été créée', '2023-08-11 15:13:05', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1069, 3, 'La réservation N°25 a été créée', '2023-08-11 15:13:05', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1070, 3, 'La réservation N°26 a été créée', '2023-08-11 15:13:06', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1071, 3, 'La réservation N°27 a été créée', '2023-08-11 15:13:06', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1072, 3, 'La réservation N°28 a été créée', '2023-08-11 15:13:06', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1073, 3, 'La réservation N°29 a été créée', '2023-08-11 15:48:31', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1074, 3, 'La réservation N°30 a été créée', '2023-08-11 15:48:32', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1075, 3, 'La réservation N°31 a été créée', '2023-08-11 15:48:37', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1076, 3, 'La réservation N°32 a été créée', '2023-08-11 15:48:37', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1077, 3, 'La réservation N°33 a été créée', '2023-08-11 15:48:38', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1078, 3, 'La réservation N°34 a été créée', '2023-08-11 15:49:21', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1079, 3, 'La réservation N°35 a été créée', '2023-08-11 15:49:36', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1080, 3, 'La réservation N°3 a été créée', '2023-08-17 23:04:16', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1081, 3, 'L\'accomadation Maison a été créée (N°4)', '2023-08-17 23:08:08', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1082, 3, 'L\'accomadation SAlsa a été créée (N°5)', '2023-08-17 23:19:04', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1083, 3, 'L\'accomadation SAlsa a été supprimée (N°)', '2023-08-17 23:19:07', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1084, 3, 'L\'accomadation sadazzda a été créée (N°6)', '2023-08-17 23:20:10', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1085, 3, 'L\'accomadation sadazzda a été supprimée (N°6)', '2023-08-17 23:20:12', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1086, 3, 'L\'accomadation Camping Cars a été modifiée (N°1)', '2023-08-17 23:25:39', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1087, 3, 'L\'accomadation Camping Car a été modifiée (N°1)', '2023-08-17 23:25:42', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1088, 3, 'L\'accomadation Caravane a été modifiée (N°2)', '2023-08-17 23:27:21', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1089, 3, 'L\'emplacement 3 a été supprimée (type Camping Car)', '2023-08-18 13:39:06', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1090, 3, 'L\'emplacement 2 a été supprimée (type Camping Car)', '2023-08-18 13:41:37', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1091, 3, 'L\'emplacement 1 a été supprimée (type Caravane)', '2023-08-18 14:13:04', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1092, 3, 'L\'emplacement 10 a été ajouté (typeCamping Car)', '2023-08-18 14:24:43', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1093, 3, 'L\'emplacement 10 a été ajouté (typeCamping Car)', '2023-08-18 14:24:48', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1094, 3, 'L\'emplacement 10 a été ajouté (typeCaravane)', '2023-08-18 14:24:52', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1095, 3, 'L\'emplacement 20 a été ajouté (typeCaravane)', '2023-08-18 14:25:22', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1096, 3, 'L\'emplacement 21 a été ajouté (typeCaravane)', '2023-08-18 14:25:27', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1097, 3, 'L\'emplacement 22 a été ajouté (typeCaravane)', '2023-08-18 14:25:30', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1098, 3, 'L\'emplacement 23 a été ajouté (typeCaravane)', '2023-08-18 14:25:32', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1099, 3, 'L\'emplacement 24 a été ajouté (typeCaravane)', '2023-08-18 14:26:01', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1100, 3, 'L\'emplacement 10 a été ajouté (typeCamping Car)', '2023-08-18 14:27:57', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1101, 3, 'L\'emplacement 11 a été ajouté (typeCamping Car)', '2023-08-18 14:28:02', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1102, 3, 'L\'emplacement 10 a été ajouté (typeCamping Car)', '2023-08-18 14:29:26', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1103, 3, 'L\'emplacement 10 a été supprimée (type Camping Car)', '2023-08-18 14:29:51', 'a:2:{i:0;s:6:\"delete\";i:1;s:8:\"location\";}'),
(1104, 3, 'L\'emplacement 40 a été ajouté (typeCamping Car)', '2023-08-18 14:35:02', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1105, 3, 'L\'emplacement 50 a été ajouté (typeCamping Car)', '2023-08-18 14:36:33', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1106, 3, 'L\'emplacement 42 de Camping Cara été modifiée en N°42 de Camping Car (ID 13', '2023-08-19 15:54:11', 'a:2:{i:0;s:6:\"update\";i:1;s:8:\"location\";}'),
(1107, 3, 'L\'emplacement 40 a été ajouté (typeCamping Car)', '2023-08-19 15:54:19', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1108, 3, 'L\'emplacement 42 a été supprimée (type Camping Car)', '2023-08-19 16:00:51', 'a:2:{i:0;s:6:\"delete\";i:1;s:8:\"location\";}'),
(1109, 3, 'L\'emplacement 18 de Caravanea été modifiée en N°18 de Caravane (ID 4', '2023-08-19 16:01:14', 'a:2:{i:0;s:6:\"update\";i:1;s:8:\"location\";}'),
(1110, 3, 'L\'emplacement 19 de Caravanea été modifiée en N°19 de Caravane (ID 4', '2023-08-19 16:01:23', 'a:2:{i:0;s:6:\"update\";i:1;s:8:\"location\";}'),
(1111, 3, 'L\'emplacement 19 de Camping Cara été modifiée en N°19 de Camping Car (ID 4', '2023-08-19 16:01:28', 'a:2:{i:0;s:6:\"update\";i:1;s:8:\"location\";}'),
(1112, 3, 'L\'emplacement 10 a été supprimée (type Camping Car)', '2023-08-19 16:04:11', 'a:2:{i:0;s:6:\"delete\";i:1;s:8:\"location\";}'),
(1113, 3, 'L\'emplacement 11 a été supprimée (type Camping Car)', '2023-08-19 16:04:27', 'a:2:{i:0;s:6:\"delete\";i:1;s:8:\"location\";}'),
(1114, 3, 'L\'emplacement 19 a été supprimée (type Camping Car)', '2023-08-19 16:04:34', 'a:2:{i:0;s:6:\"delete\";i:1;s:8:\"location\";}'),
(1115, 3, 'L\'emplacement 20 a été ajouté (typeCamping Car)', '2023-08-19 16:05:09', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1116, 3, 'L\'emplacement 30 a été ajouté (typeCamping Car)', '2023-08-19 16:05:13', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1117, 3, 'L\'emplacement 5225 a été ajouté (typeCamping Car)', '2023-08-19 16:05:46', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1118, 3, 'L\'emplacement 522 de Camping Cara été modifiée en N°522 de Camping Car (ID 18', '2023-08-19 16:05:52', 'a:2:{i:0;s:6:\"update\";i:1;s:8:\"location\";}'),
(1119, 3, 'L\'emplacement 5225 de Camping Cara été modifiée en N°5225 de Camping Car (ID 18', '2023-08-19 16:05:58', 'a:2:{i:0;s:6:\"update\";i:1;s:8:\"location\";}'),
(1120, 3, 'L\'accomadation Port a été créée (N°7)', '2023-08-22 12:49:25', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1121, 3, 'L\'accomadation Port a été modifiée (N°7)', '2023-08-22 12:49:34', 'a:2:{i:0;s:6:\"update\";i:1;s:12:\"accomodation\";}'),
(1122, 3, 'L\'emplacement 1 a été ajouté (type Port)', '2023-08-22 15:19:53', 'a:2:{i:0;s:3:\"add\";i:1;s:8:\"location\";}'),
(1123, 3, 'L\'accomadation Prout a été créée (N°8)', '2023-08-24 00:11:05', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1124, 3, 'L\'accomadation Prout a été créée (N°9)', '2023-08-24 00:16:07', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1125, 3, 'L\'accomadation carimage a été créée (N°10)', '2023-08-24 00:52:13', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1126, 3, 'L\'accomadation portons a été créée (N°11)', '2023-08-24 00:53:24', 'a:2:{i:0;s:3:\"add\";i:1;s:12:\"accomodation\";}'),
(1127, 3, 'Une règle de réservation minStay a été ajoutée', '2023-08-24 21:25:24', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1128, 3, 'Une règle de réservation minStay a été ajoutée', '2023-08-24 21:26:00', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1129, 3, 'Une règle de réservation minStay a été ajoutée', '2023-08-24 21:35:17', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1130, 3, 'Une règle de réservation minStay a été ajoutée', '2023-08-24 22:01:49', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1131, 3, 'Une règle de réservation minStay a été ajoutée', '2023-08-24 22:01:55', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}');
INSERT INTO `log` (`id`, `user_id`, `message`, `date`, `context`) VALUES
(1132, 3, 'Une règle de réservation minStay a été ajoutée', '2023-08-24 22:03:01', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1133, 3, 'Une règle de réservation minStay a été ajoutée', '2023-08-24 22:03:43', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1134, 3, 'Une règle de réservation minStay a été ajoutée', '2023-08-24 22:09:28', 'a:2:{i:0;s:3:\"add\";i:1;s:11:\"reservation\";}'),
(1135, 3, 'Une saison \'Super saison\' a été ajoutée', '2023-08-25 07:59:08', 'a:2:{i:0;s:3:\"add\";i:1;s:6:\"season\";}');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:30:\\\"reset_password/email.html.twig\\\";i:1;N;i:2;a:1:{s:10:\\\"resetToken\\\";O:58:\\\"SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\\":4:{s:65:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0token\\\";s:40:\\\"q96q4MC7YUpJf24ZWgFkaYiySEQbok0pn7tEZAIj\\\";s:69:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0expiresAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2023-08-04 09:51:53.807018\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:71:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0generatedAt\\\";i:1691139113;s:73:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0transInterval\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"mailer@camping.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:16:\\\"Camping Mail Bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"bellilanabil8@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:27:\\\"Your password reset request\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2023-08-04 08:51:53', '2023-08-04 08:51:53', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:30:\\\"reset_password/email.html.twig\\\";i:1;N;i:2;a:1:{s:10:\\\"resetToken\\\";O:58:\\\"SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\\":4:{s:65:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0token\\\";s:40:\\\"guCCJeu4vhLsaxQy3ORcDNit6RgNyxArSrXbYxlN\\\";s:69:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0expiresAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2023-08-04 09:59:10.379386\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:71:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0generatedAt\\\";i:1691139550;s:73:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0transInterval\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"mailer@camping.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:16:\\\"Camping Mail Bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"admin@admin.admin\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:27:\\\"Your password reset request\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2023-08-04 08:59:10', '2023-08-04 08:59:10', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `message` longtext COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `adults` int NOT NULL,
  `childs` int NOT NULL,
  `comment` varchar(510) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` decimal(4,2) NOT NULL,
  `paid` decimal(4,2) NOT NULL,
  `date` datetime NOT NULL,
  `location_id` int DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `start`, `end`, `adults`, `childs`, `comment`, `price`, `paid`, `date`, `location_id`, `phone`, `first_name`, `last_name`, `email`) VALUES
(1, '2023-08-10', '2023-08-20', 2, 1, NULL, '99.99', '0.00', '2023-08-11 12:51:43', 14, '', '', '', ''),
(2, '2023-08-20', '2023-08-26', 2, 1, NULL, '99.99', '0.00', '2023-08-11 12:51:44', 14, '', '', '', ''),
(3, '2023-08-11', '2023-08-20', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:01:07', 15, '', '', '', ''),
(4, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:02:00', 15, '', '', '', ''),
(5, '2023-08-11', '2023-08-25', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:08:47', 19, '', '', '', ''),
(6, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:09:36', NULL, '', '', '', ''),
(7, '2023-08-20', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:09:49', NULL, '', '', '', ''),
(8, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:41', NULL, '', '', '', ''),
(9, '2023-08-20', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:42', NULL, '', '', '', ''),
(10, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:43', NULL, '', '', '', ''),
(11, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:43', NULL, '', '', '', ''),
(12, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:44', NULL, '', '', '', ''),
(13, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:44', NULL, '', '', '', ''),
(14, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:44', NULL, '', '', '', ''),
(15, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:44', NULL, '', '', '', ''),
(16, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:44', NULL, '', '', '', ''),
(17, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:44', NULL, '', '', '', ''),
(18, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:44', NULL, '', '', '', ''),
(19, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:11:44', NULL, '', '', '', ''),
(20, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:13:03', NULL, '', '', '', ''),
(21, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:13:05', NULL, '', '', '', ''),
(22, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:13:05', NULL, '', '', '', ''),
(23, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:13:05', NULL, '', '', '', ''),
(24, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:13:05', NULL, '', '', '', ''),
(25, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:13:05', NULL, '', '', '', ''),
(26, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:13:06', NULL, '', '', '', ''),
(27, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:13:06', NULL, '', '', '', ''),
(28, '2023-08-11', '2023-08-11', 2, 1, NULL, '99.99', '0.00', '2023-08-11 13:13:06', NULL, '', '', '', ''),
(29, '2018-01-01', '2018-01-01', 10, 2, NULL, '10.00', '5.00', '2023-08-11 13:48:31', NULL, '', '', '', ''),
(30, '2018-01-01', '2018-01-01', 10, 2, NULL, '10.00', '5.00', '2023-08-11 13:48:32', NULL, '', '', '', ''),
(31, '2018-01-01', '2018-01-01', 10, 2, NULL, '10.00', '5.00', '2023-08-11 13:48:37', NULL, '', '', '', ''),
(32, '2018-01-01', '2018-01-01', 10, 2, NULL, '10.00', '5.00', '2023-08-11 13:48:37', NULL, '', '', '', ''),
(33, '2018-01-01', '2018-01-01', 10, 2, NULL, '10.00', '5.00', '2023-08-11 13:48:38', NULL, '', '', '', ''),
(34, '2018-01-01', '2018-01-01', 10, 2, NULL, '10.00', '5.00', '2023-08-11 13:49:21', NULL, '', '', '', ''),
(35, '2018-01-01', '2018-01-01', 5, 1, 'SAluut', '10.00', '10.00', '2023-08-11 13:49:36', NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE `tag` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, 'Ensoleillé'),
(2, 'Orageux'),
(3, 'Accès handicapé');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb3_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `phone`) VALUES
(1, 'test@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$aKx.2yILYSZQlhVKmzKIwejduvya1GKpzDpd4DgwX.bNRhsxksrxS', 'Nabil', 'Bellila', '0638058997'),
(2, 'test2@gmail.com', '[\"ROLE_SETTINGS\"]', '$2y$13$zvGNVLug8cKX5PntlwYpOeBzGinDzfSP3ZLF7YNhU0RWluCBFfBT.', 'nabil', 'bellila', '0638058997'),
(3, 'admin@admin.admin', '[\"ROLE_SUPER_ADMIN\"]', '$2y$13$63r6zmSus769pftwD28i4uZPB/IWxSnSUtWUKHXUddhpV6bOLvYwq', 'admin', 'admin', 'admin'),
(4, 'bellilanabil8@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$9n.s34OOu8SIFZN71SGluuF/YOZX903XCgcCAaQsbj6q1hlnPdIKe', 'Nabilon', 'Bellilon', '0123456789');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accomodation`
--
ALTER TABLE `accomodation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `accomodation_tag`
--
ALTER TABLE `accomodation_tag`
  ADD PRIMARY KEY (`accomodation_id`,`tag_id`),
  ADD KEY `IDX_9119702FFD70509C` (`accomodation_id`),
  ADD KEY `IDX_9119702FBAD26311` (`tag_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C53D045FFD70509C` (`accomodation_id`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5E9E89CB96901F54` (`number`),
  ADD KEY `IDX_5E9E89CBFD70509C` (`accomodation_id`);

--
-- Index pour la table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8F3F68C5A76ED395` (`user_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_42C8495564D218E` (`location_id`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accomodation`
--
ALTER TABLE `accomodation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `location`
--
ALTER TABLE `location`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `log`
--
ALTER TABLE `log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1136;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `accomodation_tag`
--
ALTER TABLE `accomodation_tag`
  ADD CONSTRAINT `FK_9119702FBAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9119702FFD70509C` FOREIGN KEY (`accomodation_id`) REFERENCES `accomodation` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045FFD70509C` FOREIGN KEY (`accomodation_id`) REFERENCES `accomodation` (`id`);

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `FK_5E9E89CBFD70509C` FOREIGN KEY (`accomodation_id`) REFERENCES `accomodation` (`id`);

--
-- Contraintes pour la table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `FK_8F3F68C5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C8495564D218E` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
