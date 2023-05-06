-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 20 avr. 2023 à 10:15
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `afpazon`
--
CREATE DATABASE IF NOT EXISTS `afpazon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `afpazon`;

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipCode` int(5) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_address_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `address`, `zipCode`, `city`, `id_user`, `id_address_type`) VALUES
(1, '028 Debra Point', 64520, 'Zhoukou', 11, 2),
(2, '94749 Sherman Avenue', 54123, 'Uničov', 15, 2),
(3, '12777 North Point', 5381, 'Concepción', 15, 1),
(4, '41500 Banding Road', 77290, 'Steinkjer', 11, 1),
(5, '2 Hauk Street', 61205, 'Penhascoso', 21, 1),
(6, '183 Gerald Plaza', 31050, 'Diamante', 13, 1),
(7, '1 Summer Ridge Center', 45200, 'Tungdor', 17, 1),
(8, '372 Mifflin Court', 84210, 'San Isidro', 9, 2),
(9, '50 Washington Alley', 45200, 'Saurimo', 14, 2),
(10, '4 Warrior Plaza', 32187, 'Giebultów', 21, 2),
(11, '9644 Killdeer Point', 54100, 'Stockholm', 16, 1),
(12, '667 Hermina Trail', 20140, 'Tororo', 18, 2),
(13, '8 Sycamore Circle', 73939, 'Lučina', 9, 2),
(14, '930 Swallow Plaza', 43384, 'Jaworze', 16, 2),
(15, '7 Meadow Ridge Place', 74500, 'Sidi Smaïl', 10, 2),
(16, '7243 Cambridge Court', 45000, 'Victoriaville', 1, 2),
(17, '4 Kinsman Drive', 56301, 'Strážná', 5, 2),
(18, '53 Pleasure Pass', 78500, 'Tallinn', 4, 1),
(19, '83095 Swallow Point', 11440, 'Ja Ela', 12, 2),
(20, '61716 Columbus Avenue', 60230, 'Stepojevac', 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `address_ledger`
--

DROP TABLE IF EXISTS `address_ledger`;
CREATE TABLE `address_ledger` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipCode` int(5) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `address_ledger`
--

INSERT INTO `address_ledger` (`id`, `address`, `zipCode`, `city`) VALUES
(1, '913 Elka Way', 22304, 'Lannion'),
(2, '1 Delladonna Lane', 76069, 'Le Havre'),
(3, '28502 Service Place', 93321, 'Aubervilliers'),
(4, '99 Bluestem Plaza', 41919, 'Blois'),
(5, '21 Bonner Trail', 15104, 'Saint-Flour'),
(6, '977 Bultman Plaza', 84404, 'Apt'),
(7, '7 Lerdahl Place', 45969, 'Orléans'),
(8, '2475 Kim Hill', 42045, 'Saint-Étienne'),
(9, '109 High Crossing Junction', 13155, 'Tarascon'),
(10, '78 Riverside Place', 47555, 'Boé'),
(11, '11 Summer Ridge Lane', 91194, 'Gif-sur-Yvette'),
(12, '8 Grim Street', 94174, 'Le Perreux-sur-Marne'),
(13, '6286 Butterfield Court', 78181, 'Saint-Quentin-en-Yvelines'),
(14, '55220 Jenifer Court', 83087, 'Toulon'),
(15, '91 Mosinee Hill', 37942, 'Tours'),
(16, '2906 Everett Crossing', 41976, 'Blois'),
(17, '6058 Annamark Trail', 91304, 'Massy'),
(18, '37 Mallard Pass', 20311, 'Ajaccio'),
(19, '3 Barby Drive', 60022, 'Beauvais'),
(20, '9 Village Green Drive', 84147, 'Montfavet'),
(21, '2306 Redwing Street', 14097, 'Caen'),
(22, '7343 Helena Lane', 94865, 'Bonneuil-sur-Marne'),
(23, '0238 Superior Parkway', 59734, 'Saint-Amand-les-Eaux'),
(24, '563 Duke Place', 77554, 'Moissy-Cramayel'),
(25, '84647 Algoma Crossing', 75522, 'Paris 11'),
(26, '7308 Pine View Plaza', 76069, 'Le Havre'),
(27, '2 Fieldstone Road', 80004, 'Amiens'),
(28, '3 Autumn Leaf Junction', 69239, 'Lyon'),
(29, '77886 Lakeland Center', 7304, 'Tournon-sur-Rhône'),
(30, '4 Basil Alley', 13807, 'Istres'),
(31, '954 Larry Avenue', 75669, 'Paris 14'),
(32, '95821 Hoepker Point', 76404, 'Fécamp'),
(33, '63 Clove Avenue', 92762, 'Antony'),
(34, '458 Dunning Terrace', 92980, 'Paris La Défense'),
(35, '1 Marcy Pass', 87030, 'Limoges'),
(36, '035 Comanche Place', 84092, 'Avignon'),
(37, '0 American Plaza', 20195, 'Ajaccio'),
(38, '952 Sage Hill', 31029, 'Toulouse'),
(39, '64 Becker Parkway', 14030, 'Caen'),
(40, '73 Continental Alley', 93604, 'Aulnay-sous-Bois');

-- --------------------------------------------------------

--
-- Structure de la table `address_type`
--

DROP TABLE IF EXISTS `address_type`;
CREATE TABLE `address_type` (
  `id` int(11) NOT NULL,
  `type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `address_type`
--

INSERT INTO `address_type` (`id`, `type`) VALUES
(1, 'facturation'),
(2, 'livraison');

-- --------------------------------------------------------

--
-- Structure de la table `alert`
--

DROP TABLE IF EXISTS `alert`;
CREATE TABLE `alert` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `backInStock` tinyint(1) DEFAULT 0,
  `priceDrop` tinyint(1) DEFAULT 0,
  `id_product` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `alert`
--

INSERT INTO `alert` (`id`, `email`, `backInStock`, `priceDrop`, `id_product`) VALUES
(1, 'gswiffen0@icio.us', 0, 1, 5),
(2, 'bsharrock1@jiathis.com', 0, 1, 9),
(3, 'ashelmardine2@epa.gov', 1, 0, 8),
(4, 'crambadt3@princeton.edu', 1, 0, 18),
(5, 'mabbison4@europa.eu', 0, 1, 3),
(6, 'ltoomer5@ucla.edu', 1, 0, 3),
(7, 'twolfarth6@ocn.ne.jp', 1, 0, 11),
(8, 'ccisco7@freewebs.com', 0, 1, 4),
(9, 'scrookshanks8@ucla.edu', 0, 1, 13),
(10, 'lcorish9@chronoengine.com', 1, 0, 3),
(11, 'cpaoluccia@fema.gov', 1, 0, 10),
(12, 'gmateub@guardian.co.uk', 1, 0, 13),
(13, 'lobrollachainc@furl.net', 1, 0, 12),
(14, 'cghilardinid@comcast.net', 1, 0, 13),
(15, 'lschofielde@yellowpages.com', 1, 0, 7),
(16, 'domulderrigf@fotki.com', 0, 1, 14),
(17, 'bcroning@github.com', 1, 0, 1),
(18, 'mkerseyh@behance.net', 0, 1, 13),
(19, 'fselwayi@discuz.net', 0, 1, 11),
(20, 'cahrendj@fotki.com', 1, 0, 9),
(21, 'tlettucek@com.com', 1, 0, 17),
(22, 'ddoughtonl@mozilla.com', 0, 1, 8),
(23, 'ajavesm@cam.ac.uk', 1, 0, 12),
(24, 'cscarrattn@pbs.org', 0, 1, 18),
(25, 'cinchleyo@angelfire.com', 0, 1, 9),
(26, 'dkeasyp@wufoo.com', 1, 0, 1),
(27, 'pgregolq@goo.gl', 0, 1, 15),
(28, 'flaurencer@blogger.com', 1, 0, 2),
(29, 'gcraythornes@xing.com', 0, 1, 8),
(30, 'vrecordt@sfgate.com', 1, 0, 7);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `category`, `isActive`) VALUES
(1, 'Livre', 1),
(2, 'Musique', 1),
(3, 'Jeux Vidéo', 1),
(4, 'High-tech', 1),
(5, 'Electroménager', 1);

-- --------------------------------------------------------

--
-- Structure de la table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `category_product`
--

INSERT INTO `category_product` (`id`, `id_product`, `id_category`) VALUES
(1, 21, 3),
(2, 22, 2),
(3, 14, 5),
(4, 28, 3),
(5, 29, 4),
(6, 19, 1),
(7, 22, 4),
(8, 15, 2),
(9, 26, 3),
(10, 25, 3),
(11, 30, 5),
(12, 18, 4),
(13, 22, 5),
(14, 12, 4),
(15, 13, 3),
(16, 8, 2),
(17, 21, 4),
(18, 18, 2),
(19, 26, 1),
(20, 4, 5),
(21, 10, 5),
(22, 23, 1),
(23, 26, 4),
(24, 29, 5),
(25, 19, 2),
(26, 30, 2),
(27, 11, 4),
(28, 23, 4),
(29, 8, 4),
(30, 16, 3),
(31, 14, 1),
(32, 5, 5),
(33, 21, 5),
(34, 25, 1),
(35, 24, 4),
(36, 18, 3),
(37, 18, 5),
(38, 26, 5),
(39, 4, 4),
(40, 26, 2);

-- --------------------------------------------------------

--
-- Structure de la table `complement`
--

DROP TABLE IF EXISTS `complement`;
CREATE TABLE `complement` (
  `id` int(11) NOT NULL,
  `id_product_a` int(11) DEFAULT NULL,
  `id_product_b` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `complement`
--

INSERT INTO `complement` (`id`, `id_product_a`, `id_product_b`) VALUES
(1, 12, 24),
(2, 24, 12),
(3, 12, 25),
(4, 25, 12),
(5, 13, 26),
(6, 26, 13),
(7, 8, 9),
(8, 9, 8),
(9, 1, 30),
(10, 30, 1);

-- --------------------------------------------------------

--
-- Structure de la table `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `voucher` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `discount`
--

INSERT INTO `discount` (`id`, `startDate`, `endDate`, `percent`, `voucher`) VALUES
(1, '2022-01-12', '2022-02-02', 0.8, 'Doubtfull22'),
(2, '2022-04-25', '2022-05-12', 0.9, 'jeSuisReduc10'),
(3, '2022-06-12', '2022-07-20', 0.8, 'olé2022'),
(4, '2022-02-11', '2022-03-11', 0.8, 'fun22'),
(5, '2023-04-10', '2023-04-25', 0.8, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `picPath` varchar(255) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `picPath`, `id_product`) VALUES
(1, 'product_6_pic_2.jpg', 6),
(2, 'product_30_pic_2.jpg', 30),
(3, 'product_15_pic_2.jpg', 15),
(4, 'product_16_pic_2.jpg', 16),
(5, 'product_16_pic_3.jpg', 16),
(6, 'product_15_pic_3.jpg', 15),
(7, 'product_27_pic_2.jpg', 27),
(8, 'product_20_pic_2.jpg', 20),
(9, 'product_13_pic_2.jpg', 13),
(10, 'product_6_pic_2.jpg', 6),
(11, 'product_4_pic_2.jpg', 4),
(12, 'product_8_pic_2.jpg', 8),
(13, 'product_29_pic_2.jpg', 29),
(14, 'product_12_pic_2.jpg', 12),
(15, 'product_10_pic_2.jpg', 10),
(16, 'product_29_pic_3.jpg', 29),
(17, 'product_8_pic_3.jpg', 8),
(18, 'product_10_pic_3.jpg', 10),
(19, 'product_5_pic_2.jpg', 5),
(20, 'product_24_pic_2.jpg', 24),
(21, 'product_24_pic_3.jpg', 24),
(22, 'product_4_pic_3.jpg', 4),
(23, 'product_21_pic_2.jpg', 21),
(24, 'product_24_pic_4.jpg', 24),
(25, 'product_8_pic_4.jpg', 8),
(26, 'product_2_pic_2.jpeg', 2),
(27, 'product_30_pic_3.jpg', 30),
(28, 'product_18_pic_2.jpg', 18),
(29, 'product_24_pic_5.jpg', 24),
(30, 'product_28_pic_2.jpg', 28);

-- --------------------------------------------------------

--
-- Structure de la table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
CREATE TABLE `order_list` (
  `id` int(11) NOT NULL,
  `dateOrder` date DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `paymentToken` varchar(255) DEFAULT NULL,
  `trackingNumber` varchar(255) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_address_delivery` int(11) DEFAULT NULL,
  `id_address_billing` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `order_list`
--

INSERT INTO `order_list` (`id`, `dateOrder`, `totalPrice`, `paymentToken`, `trackingNumber`, `id_user`, `id_address_delivery`, `id_address_billing`, `id_status`) VALUES
(1, '0000-00-00', 14, '3557901867976722', '5610432730626823', 5, 1, 2, 4),
(2, '0000-00-00', 118, '4844318201321807', '3532330109449589', 17, 3, 4, 4),
(3, '0000-00-00', 120, '3543994218346239', '5266586991243110', 10, 5, 6, 4),
(4, '0000-00-00', 176, '3547091665388867', '3540743303623447', 5, 7, 8, 4),
(5, '0000-00-00', 215, '3574259868175763', '4041375988223086', 10, 9, 10, 4),
(6, '0000-00-00', 139, '3553931211364493', '3567268103144871', 16, 11, 12, 4),
(7, '0000-00-00', 62, '3588281697971802', '67711815561881491', 15, 13, 14, 4),
(8, '0000-00-00', 139, '6376058914343950', '6386376168180706', 16, 15, 16, 4),
(9, '0000-00-00', 139, '372301281014136', '4917074435705578', 5, 17, 18, 4),
(10, '0000-00-00', 245, '30426252802203', '3535128704487385', 15, 19, 20, 4),
(11, '0000-00-00', 297, '5100147996476161', '5602232318051372', 2, 21, 22, 4),
(12, '0000-00-00', 121, '3569551211288864', '5204353413548880', 15, 23, 24, 4),
(13, '0000-00-00', 15, '3542994142979130', '4844720473755465', 11, 25, 26, 4),
(14, '0000-00-00', 232, '3583796958723704', '201817262159381', 5, 27, 28, 4),
(15, '0000-00-00', 126, '3569171493774471', '3583191360226423', 9, 29, 30, 4),
(16, '0000-00-00', 151, '3536707568936733', '4026427586540095', 4, 31, 32, 4),
(17, '0000-00-00', 253, '0604136715241982', '3571495295398809', 13, 33, 34, 4),
(18, '0000-00-00', 80, '3568691851086847', '56022314571163543', 9, 35, 36, 4),
(19, '0000-00-00', 274, '201878262465434', '5020408360967681', 18, 37, 38, 4),
(20, '0000-00-00', 285, '3544675101350235', '3551108966809996', 13, 39, 40, 4);

--
-- Déclencheurs `order_list`
--
DROP TRIGGER IF EXISTS `delete_order_product`;
DELIMITER $$
CREATE TRIGGER `delete_order_product` AFTER DELETE ON `order_list` FOR EACH ROW BEGIN
  DELETE FROM order_product WHERE order_product.id_order is null;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `order_product`
--

INSERT INTO `order_product` (`id`, `price`, `quantity`, `id_product`, `id_order`) VALUES
(1, 15, 2, 18, 13),
(2, 46, 1, 11, 13),
(3, 14, 2, 11, 15),
(4, 42, 1, 6, 3),
(5, 43, 1, 22, 3),
(6, 45, 2, 12, 12),
(7, 24, 2, 7, 19),
(8, 14, 2, 9, 15),
(9, 38, 2, 19, 11),
(10, 26, 2, 4, 3),
(11, 20, 1, 11, 1),
(12, 48, 2, 5, 9),
(13, 20, 2, 22, 20),
(14, 29, 1, 16, 15),
(15, 15, 2, 28, 7),
(16, 15, 2, 28, 2),
(17, 42, 2, 5, 5),
(18, 49, 1, 25, 14),
(19, 35, 2, 1, 3),
(20, 25, 1, 4, 9),
(21, 11, 2, 26, 6),
(22, 26, 1, 4, 2),
(23, 26, 2, 26, 5),
(24, 29, 1, 28, 13),
(25, 42, 2, 30, 6),
(26, 13, 2, 9, 5),
(27, 19, 2, 6, 15),
(28, 13, 1, 20, 9),
(29, 29, 2, 26, 15),
(30, 21, 1, 19, 11);

--
-- Déclencheurs `order_product`
--
DROP TRIGGER IF EXISTS `stockManager`;
DELIMITER $$
CREATE TRIGGER `stockManager` AFTER INSERT ON `order_product` FOR EACH ROW BEGIN
DECLARE sum int;
DECLARE qty1 int;
DECLARE qty2 int;
SELECT quantity FROM order_product WHERE id=new.id into qty1;
SELECT quantity FROM stock WHERE id_product = new.id_product into qty2;
SET sum = qty2 - qty1;
UPDATE stock SET quantity = sum WHERE stock.id_product = new.id_product;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `stockReturn`;
DELIMITER $$
CREATE TRIGGER `stockReturn` BEFORE DELETE ON `order_product` FOR EACH ROW BEGIN
DECLARE sum int;
DECLARE qty1 int;
DECLARE qty2 int;
SELECT quantity FROM order_product WHERE id=old.id into qty1;
SELECT quantity FROM stock WHERE id_product = old.id_product into qty2;
SET sum = qty1 + qty2;
UPDATE stock SET quantity = sum WHERE stock.id_product = old.id_product;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` float DEFAULT NULL,
  `mainPicPath` varchar(255) DEFAULT NULL,
  `videoPath` varchar(255) DEFAULT NULL,
  `inCarousel` tinyint(1) DEFAULT NULL,
  `size` varchar(30) DEFAULT NULL,
  `reference` varchar(30) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `warranty` int(2) DEFAULT NULL,
  `sponsoring` int(11) DEFAULT 1,
  `isActive` tinyint(1) DEFAULT 1,
  `id_vat` int(11) DEFAULT NULL,
  `id_review` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `mainPicPath`, `videoPath`, `inCarousel`, `size`, `reference`, `color`, `weight`, `warranty`, `sponsoring`, `isActive`, `id_vat`, `id_review`) VALUES
(1, 'Rosemary - Fresh', 'lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel', 94.99, 'product_1_mainPic.png', NULL, 0, 'XL', '52-772-4603', 'Green', 9.8, 2, 1, 1, 1, NULL),
(2, 'Steampan - Lid For Half Size', 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus', 72.99, 'product_2_mainPic.jpeg', NULL, 0, NULL, '95-893-1993', 'Goldenrod', 8.8, 2, 1, 1, 2, NULL),
(3, 'Bread - Roll, Soft White Round', 'odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla', 33.99, 'product_3_mainPic.jpg', NULL, 0, 'XL', '80-728-8112', 'Indigo', 6.2, 1, 1, 1, 1, 13),
(4, 'Philips Shaver Series 7000 (Modèle S7783/78)', 'convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo', 62.99, 'product_4_mainPic.jpg', 'product_4_video.mp4', 0, NULL, 'S7783/78', 'Mauv', 4.7, 0, 1, 1, 1, 5),
(5, 'CHiQ Lave-linge CFL80-14586IM3X', 'sapien arcu sed augue aliquam erat volutpat in congue etiam', 51.99, 'product_5_mainPic.jpg', 'product_5_video.mp4', 0, 'XL', 'CFL80-14586IM3X', 'Pink', 0.8, 1, 1, 1, 4, NULL),
(6, 'Squid - Breaded', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna', 136.99, 'product_6_mainPic.png', NULL, 0, NULL, '36-547-3765', 'Purple', 9.8, 2, 1, 1, 4, 11),
(7, 'Lemon Tarts', 'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus', 80.99, 'product_7_mainPic.jpg', NULL, 0, NULL, '78-305-5167', 'Orange', 3.4, 1, 1, 1, 4, 11),
(8, 'Random Access Memories 10th Anniversary Edition (Vinyl)', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis', 122.99, 'product_8_mainPic.jpg', NULL, 0, 'M', '52-166-9955', 'Khaki', 6.8, 2, 1, 1, 4, NULL),
(9, 'Icecream - Dstk Strw Chseck', 'suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum', 38.99, 'product_9_mainPic.png', NULL, 0, NULL, '51-329-0523', 'Red', 6.6, 0, 1, 1, 4, 19),
(10, 'CHIQ, réfrigérateur bas givre, 117 litres', 'nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo', 143.99, 'product_10_mainPic.jpg', 'product_10_video.mp4', 0, NULL, 'CBM117L42', 'Puce', 7.4, 1, 1, 1, 1, NULL),
(11, 'Bundle DJI Mini 3 Fly More', 'sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula', 6.99, 'product_11_mainPic.jpg', 'product_11_video.mp4', 0, 'M', '63-464-0059', 'Violet', 1, 1, 1, 1, 2, NULL),
(12, 'DJI Osmo Pocket 2', 'potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis', 121.99, 'product_12_mainPic.jpg', 'product_12_video.mp4', 0, NULL, '74-073-9906', 'Mauv', 4.6, 3, 1, 1, 4, NULL),
(13, 'Hogwarts Legacy (Edition Deluxe)', 'ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam', 60.99, 'product_13_mainPic.jpg', 'product_13_video.mp4', 0, NULL, '09-489-8277', 'Puce', 4.2, 3, 1, 1, 1, NULL),
(14, 'Philips L\'Or Barista Sublime LM9012/60', 'arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor eu pede', 138.99, 'product_14_mainPic.jpg', 'product_14_video.mp4', 0, NULL, 'LM9012/60', 'Mauv', 1.2, 2, 1, 1, 2, 20),
(15, 'Face (Undefinable Face) Édition Limitée', 'nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque', 19.99, 'product_15_mainPic.jpg', NULL, 0, NULL, '76-535-0900', 'Puce', 4.4, 3, 1, 1, 1, NULL),
(16, 'Assassin\'s Creed Valhalla - Édition Limitée', 'cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue', 9.99, 'product_16_mainPic.jpg', 'product_16_video.mp4', 0, NULL, '12-846-5806', 'Violet', 3.9, 2, 1, 1, 3, NULL),
(17, 'Lentils - Red, Dry', 'rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus', 67.99, 'product_17_mainPic.png', NULL, 0, NULL, '45-515-2568', 'Turquoise', 0, 3, 1, 1, 2, NULL),
(18, 'Apple MacBook Air 2022 (M2 Pro)', 'aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede', 9.99, 'product_18_mainPic.jpg', 'product_18_video.mp4', 0, 'M', '16-421-1107', 'Mauv', 2.4, 2, 1, 1, 3, NULL),
(19, 'Avant Blake et Mortimer - Tome 1 - Le Rayon U', 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', 48.99, 'product_19_mainPic.jpg', NULL, 0, NULL, '71-103-4461', 'Aquamarine', 2.9, 2, 1, 1, 4, NULL),
(20, 'Green Tea Refresher', 'lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere', 62.99, 'product_20_mainPic.jpg', NULL, 0, 'S', '03-010-8557', 'Crimson', 1.8, 0, 1, 1, 1, 2),
(21, 'Mario Kart 8 Deluxe', 'semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices', 85.99, 'product_21_mainPic.jpg', 'product_21_video.mp4', 0, NULL, '66-050-1905', 'Teal', 1.9, 2, 1, 1, 3, 9),
(22, 'Memento Mori Édition Deluxe', 'semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non', 63.99, 'product_22_mainPic.jpg', NULL, 0, NULL, '53-812-0730', 'Teal', 0.4, 3, 1, 1, 2, 7),
(23, 'Je m\'appelais Franck', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget', 39.99, 'product_23_mainPic.jpg', NULL, 0, NULL, '06-386-2205', 'Purple', 9.7, 1, 1, 1, 3, NULL),
(24, 'Apple iPhone 14 Pro', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus', 63.99, 'product_24_mainPic.jpg', 'product_24_video.mp4', 0, 'XS', '37-075-1192', 'Khaki', 9, 0, 1, 1, 1, 4),
(25, 'Fire Emblem: Engage', 'elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas', 50.99, 'product_25_mainPic.jpg', 'product_25_video.mp4', 0, 'L', '27-503-8140', 'Maroon', 3.1, 0, 1, 1, 3, NULL),
(26, 'Ratchet & Clank: Rift Apart', 'pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam', 91.99, 'product_26_mainPic.jpg', 'product_26_video.mp4', 0, NULL, '23-965-2365', 'Aquamarine', 6.4, 3, 1, 1, 3, 3),
(27, 'Longos - Lasagna Veg', 'arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus', 36.99, 'product_27_mainPic.png', NULL, 0, '2XL', '83-992-2978', 'Puce', 8.3, 2, 1, 1, 4, 1),
(28, 'Star Wars Jedi: Survivor', 'vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien', 105.99, 'product_28_mainPic.jpg', 'product_28_video.mp4', 0, NULL, '97-601-9578', 'Yellow', 4.8, 3, 1, 1, 2, NULL),
(29, 'Téléviseur Philips 43 Pouces 43PUS8107', 'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere', 87.99, 'product_29_mainPic.jpg', 'product_29_video.mp4', 0, '3XL', '43PUS8107', 'Crimson', 6.2, 1, 1, 1, 3, 19),
(30, 'Grille-pain Philips HD2581/90', 'amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in', 90.99, 'product_30_mainPic.jpg', 'product_30_video.mp4', 0, NULL, 'HD2581/90', 'Green', 5.7, 0, 1, 1, 1, 6);

-- --------------------------------------------------------

--
-- Structure de la table `product_discount`
--

DROP TABLE IF EXISTS `product_discount`;
CREATE TABLE `product_discount` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_discount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_discount`
--

INSERT INTO `product_discount` (`id`, `id_product`, `id_discount`) VALUES
(1, 2, 2),
(2, 12, 2),
(3, 23, 1),
(4, 7, 3),
(5, 4, 2),
(6, 5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `stars` int(1) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `review`
--

INSERT INTO `review` (`id`, `content`, `stars`, `id_product`, `id_user`) VALUES
(1, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 2, 27, 10),
(2, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 4, 20, 7),
(3, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 3, 26, 14),
(4, 'Morbi ut odio.', 3, 24, 12),
(5, 'Fusce consequat.', 1, 4, 1),
(6, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae , Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 2, 30, 8),
(7, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae , Duis faucibus accumsan odio.', 1, 22, 7),
(8, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 1, 30, 1),
(9, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 3, 21, 9),
(10, 'Morbi ut odio.', 5, 30, 1),
(11, 'Nullam varius.', 1, 6, 6),
(12, 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 5, 24, 4),
(13, 'Sed sagittis.', 4, 3, 1),
(14, 'Morbi porttitor lorem id ligula.', 1, 26, 12),
(15, 'Quisque ut erat.', 3, 6, 13),
(16, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 3, 27, 5),
(17, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 4, 22, 9),
(18, 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', 5, 29, 9),
(19, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae , Duis faucibus accumsan odio. Curabitur convallis.', 3, 9, 16),
(20, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 3, 14, 18);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Client'),
(183, 'Admin'),
(729, 'Vendeur');

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'Commande validée'),
(2, 'En préparation'),
(3, 'En cours de livraison'),
(4, 'Commande livrée');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `quantity`, `id_product`) VALUES
(1, 346, 18),
(2, 370, 29),
(3, 213, 10),
(4, 112, 25),
(5, 348, 28),
(6, 360, 14),
(7, 177, 24),
(8, 76, 27),
(9, 77, 11),
(10, 234, 17),
(11, 283, 8),
(12, 281, 6),
(13, 310, 23),
(14, 165, 9),
(15, 346, 30),
(16, 98, 16),
(17, 286, 22),
(18, 279, 5),
(19, 147, 21),
(20, 72, 26),
(21, 362, 7),
(22, 120, 1),
(23, 188, 4),
(24, 163, 12),
(25, 345, 2),
(26, 305, 20),
(27, 254, 3),
(28, 313, 13),
(29, 336, 15),
(30, 156, 19);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `registrationDate` date DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1,
  `id_role` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `lastName`, `firstName`, `email`, `password`, `gender`, `phone`, `registrationDate`, `isActive`, `id_role`) VALUES
(1, 'Wayon', 'Anatol', 'awayon0@deliciousdays.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0917848282', '2022-07-28', 1, 1),
(2, 'Foxwell', 'Jesse', 'jfoxwell1@rakuten.co.jp', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0207367433', '2022-06-27', 1, 1),
(3, 'Lunck', 'Joannes', 'jlunck2@telegraph.co.uk', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0995520217', '2023-03-15', 1, 1),
(4, 'Blow', 'Charmine', 'cblow3@youtube.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0142308695', '2022-04-09', 1, 1),
(5, 'Cockell', 'Melantha', 'mcockell4@about.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0268099382', '2022-09-25', 1, 1),
(6, 'Geffcock', 'Tybie', 'tgeffcock5@diigo.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0944446893', '2022-09-03', 1, 1),
(7, 'Mellor', 'Royall', 'rmellor6@weibo.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0376167727', '2023-01-11', 1, 1),
(8, 'alffy', 'Babita', 'bpalffy7@mashable.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0269671050', '2022-09-27', 1, 1),
(9, 'Daber', 'Glyn', 'gdaber8@mozilla.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0298592896', '2022-04-19', 1, 1),
(10, 'Erskine', 'Cristobal', 'cerskine9@intel.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0921068139', '2022-08-06', 1, 1),
(11, 'Ryce', 'Gale', 'grycea@forbes.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0249273666', '2023-02-17', 1, 1),
(12, 'Penhaleurack', 'Georgiana', 'gpenhaleurackb@microsoft.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0601745513', '2022-10-12', 0, 1),
(13, 'Shedden', 'Cesaro', 'csheddenc@miitbeian.gov.cn', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0673669765', '2022-05-07', 1, 1),
(14, 'Flemming', 'Boycey', 'bflemmingd@dot.gov', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0156893119', '2023-03-20', 0, 1),
(15, 'Postlewhite', 'Tammy', 'tpostlewhitee@wordpress.org', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0555659671', '2022-05-27', 1, 1),
(16, 'Clewer', 'Brion', 'bclewerf@phoca.cz', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '7985378277', '2023-01-19', 0, 1),
(17, 'Slidders', 'Dael', 'dsliddersg@shutterfly.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0452518614', '2022-11-07', 1, 1),
(18, 'Rosel', 'Blinny', 'broselh@ucoz.ru', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '6404075325', '2022-08-30', 1, 1),
(19, 'O\'Day', 'Mace', 'modayi@huffingtonpost.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0238709373', '2022-05-06', 0, 1),
(20, 'Perchard', 'Netti', 'nperchardj@geocities.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0748474157', '2022-11-09', 1, 1),
(21, 'Test (C)', 'Compte Test (C)', 'cli@test.fr', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0123456789', '2023-04-04', 1, 1),
(22, 'Test (V)', 'Compte Test (V)', 'ven@test.fr', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0123456789', '2023-04-04', 1, 729),
(23, 'Test (A)', 'Compte Test (A)', 'adm@test.fr', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0123456789', '2023-04-04', 1, 183);

-- --------------------------------------------------------

--
-- Structure de la table `vat`
--

DROP TABLE IF EXISTS `vat`;
CREATE TABLE `vat` (
  `id` int(11) NOT NULL,
  `value` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vat`
--

INSERT INTO `vat` (`id`, `value`) VALUES
(1, 0.021),
(2, 0.055),
(3, 0.1),
(4, 0.2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_address_id_user` (`id_user`),
  ADD KEY `FK_address_id_address_type` (`id_address_type`);

--
-- Index pour la table `address_ledger`
--
ALTER TABLE `address_ledger`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `address_type`
--
ALTER TABLE `address_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_alert_id_product` (`id_product`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_category_product_id_product` (`id_product`),
  ADD KEY `FK_category_product_id_category` (`id_category`);

--
-- Index pour la table `complement`
--
ALTER TABLE `complement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_complement_id_product_a` (`id_product_a`),
  ADD KEY `FK_complement_id_product_b` (`id_product_b`);

--
-- Index pour la table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_image_id_product` (`id_product`);

--
-- Index pour la table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_order_list_id_user` (`id_user`),
  ADD KEY `FK_order_list_id_address_delivery` (`id_address_delivery`),
  ADD KEY `FK_order_list_id_address_billing` (`id_address_billing`),
  ADD KEY `FK_order_list_id_status` (`id_status`);

--
-- Index pour la table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_order_product_id_product` (`id_product`),
  ADD KEY `FK_order_product_id_order` (`id_order`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_product_id_vat` (`id_vat`),
  ADD KEY `FK_product_id_review` (`id_review`);

--
-- Index pour la table `product_discount`
--
ALTER TABLE `product_discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_product_discount_id_product` (`id_product`),
  ADD KEY `FK_product_discount_id_discount` (`id_discount`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_review_id_product` (`id_product`),
  ADD KEY `FK_review_id_user` (`id_user`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_stock_id_product` (`id_product`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FK_user_id_role` (`id_role`);

--
-- Index pour la table `vat`
--
ALTER TABLE `vat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `address_ledger`
--
ALTER TABLE `address_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `address_type`
--
ALTER TABLE `address_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `alert`
--
ALTER TABLE `alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `complement`
--
ALTER TABLE `complement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `product_discount`
--
ALTER TABLE `product_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=730;

--
-- AUTO_INCREMENT pour la table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `vat`
--
ALTER TABLE `vat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_address_id_address_type` FOREIGN KEY (`id_address_type`) REFERENCES `address_type` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_address_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `alert`
--
ALTER TABLE `alert`
  ADD CONSTRAINT `FK_alert_id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `FK_category_product_id_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_category_product_id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `complement`
--
ALTER TABLE `complement`
  ADD CONSTRAINT `FK_complement_id_product_a` FOREIGN KEY (`id_product_a`) REFERENCES `product` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_complement_id_product_b` FOREIGN KEY (`id_product_b`) REFERENCES `product` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_image_id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `FK_order_list_id_address_billing` FOREIGN KEY (`id_address_billing`) REFERENCES `address_ledger` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_order_list_id_address_delivery` FOREIGN KEY (`id_address_delivery`) REFERENCES `address_ledger` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_order_list_id_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_order_list_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `FK_order_product_id_order` FOREIGN KEY (`id_order`) REFERENCES `order_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_order_product_id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_id_review` FOREIGN KEY (`id_review`) REFERENCES `review` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_product_id_vat` FOREIGN KEY (`id_vat`) REFERENCES `vat` (`id`);

--
-- Contraintes pour la table `product_discount`
--
ALTER TABLE `product_discount`
  ADD CONSTRAINT `FK_product_discount_id_discount` FOREIGN KEY (`id_discount`) REFERENCES `discount` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_product_discount_id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_review_id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_review_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `FK_stock_id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_id_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
