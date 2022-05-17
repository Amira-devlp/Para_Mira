-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 17 mai 2022 à 21:32
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shop_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `details`, `price`, `image`) VALUES
(24, 'SVR CICAVIT+ CREME SOLAIRE SPF50+ , 40 ml', 'Visage', 'CICAVIT+ CrÃ¨me SPF50+ est un soin apaisant intense qui accÃ©lÃ¨re la rÃ©paration cutanÃ©e X7 et cible tous les types de rayons pour limiter les risques de marques rouges et brunes.', 43, 'Avene 1.PNG'),
(25, ' MURIAC SÃ©rum intensif anti-taches, 30ml MURIAC SÃ©rum intensif anti-taches, 30ml', 'Visage', 'Le sÃ©rum Intensif anti-taches Muriac Lightact agit sur les troubles de la pigmentation et les taches brunes.', 65, 'visage 2.PNG'),
(26, 'NUBIANCE LAIT CORPS HYDRATANT CORRECTEUR D&#39;HYPERPIGMENTATION, 500ML', 'Corps', 'Hydrate et nourrit les peaux sÃ¨ches Ã  trÃ¨s sÃ¨ches tout en leur apportant un confort immÃ©diat.', 157, 'corps 1.PNG'),
(27, 'BIO ORIENT Huile de moutarde 10ML (Ø²ÙŠØª Ø§Ù„Ø®Ø±Ø¯Ù„)', 'Corps', 'Anti-inflammatoire:l&#39;huile de moutarde permet de soulager les torticolis et autres inflammations.\r\n Elle permet de dÃ©contracter les muscles des sportifs\r\n Aide Ã  la croissance des cheveux tout en stimulant le cuir chevelu et limite l&#39;apparition des pellicules', 3, 'corps 2.PNG'),
(28, 'DERMEDIC CAPILARTE SERUM ANTI CHUTE ET REPOUSSE 150 ML', 'Cheveux', 'Le sÃ©rum Dermedic Capilarte stimulant et renouvelant la pousse des cheveux est destinÃ© au traitement de la chute prÃ©maturÃ©e des cheveux de diverses Ã©tiologies, notamment hormonales et gÃ©nÃ©tiques, chez la femme comme chez l&#39;homme.', 41, 'chev 1.PNG'),
(29, 'KLORANE Shampooing Traitant Fortifiant Ã  la Quinine et aux Vitamines B - 200 ml', 'Cheveux', 'Introduit dans une base lavante trÃ¨s douce, l&#39;association de quinquina et de vitamine B, fait du Shampooing traitant fortifiant une vÃ©ritable source d&#39;Ã©nergie qui redonne force et tonicitÃ© aux cheveux fatiguÃ©s.\r\n\r\nContenance: 200ml', 21, 'chev 2.PNG'),
(30, 'Gifrer Liniment olÃ©o-calcaire, 250 ml', 'Bebe', 'Soin pour le change.', 27, 'b 1.PNG'),
(31, 'BABY PUR TASSE AVEC PAILLE 6M+', 'Bebe', 'BÃ©bÃ© apprÃ©ciera son jus comme un petit prince dans ce Gobelet Next avec paille et anse !\r\n\r\nIdÃ©al pour faciliter le passage au verre !', 11, 'b2.PNG'),
(32, 'DERMEDIC Hydrain 3 Creme Yeux, 15 g DERMEDIC Hydrain 3 Creme Yeux, 15ml', 'Visage', 'Le soin contour des yeux Dermedic Hydrain3 Hialuro agit sur la peau autour des yeux en la nourrissant et lâ€™hydratant.', 15, 'visage 4.PNG'),
(33, 'BIODERMA SÃ©bium H2O, 100ml', 'Visage', 'La solution micellaire de rÃ©fÃ©rence qui nettoie et purifie au quotidien les peaux mixtes ou grasses.', 32, 'visage 5.PNG'),
(34, 'URIAGE DÃ©maquillant Yeux Waterproof, 100ml', 'Visage', 'DÃ©maquillant pour les yeux sensibles et les lÃ¨vres, qui imine le maquillage, apaise la peau et ne la laisse pas grasse.', 27, 'visage 6.PNG'),
(35, 'EUCERIN HYALURON FILLER VOLUME LIFT SOIN CONTOUR DES YEUX SPF15 15 ML', 'Visage', 'Eucerin Hyaluron-Filler + Volume-Lift Soin Contour des Yeux SPF15 15 ml est un soin conÃ§u pour cibler les rides des pattes d&#39;oie qui se forment au coin des yeux.', 71, 'visage 7.PNG'),
(36, 'Filorga TIME FILLER MASK', 'Visage', 'Filorga TIME-FILLER MASK 1 Masque de 23 g est un masque noir qui offre la puissance d&#39;un sÃ©rum concentrÃ© dans un masque effet seconde peau, pour une peau lissÃ©e et plus jeune en 15 minutes', 27, 'visage 8.PNG'),
(37, 'SVR Cicavit+ SOS Grattage Spray Apaisant 40ml', 'Visage', 'Dites adieu aux dÃ©mangeaisons grÃ¢ce au 1er* spray apaisant Ã  lâ€™efficacitÃ© stop grattage immÃ©diate.', 33, 'visage 9.PNG'),
(38, 'CASTERA BRUME THERMALE 300 ML', 'Visage', ' La brume thermale CastÃ©ra aide Ã  prÃ©server la santÃ© de votre peau.', 27, 'visage 10.PNG'),
(39, 'Veet Hair Removal Cream Silk and Fresh for Sensitive Skin, 100g', 'Corps', 'Veet hair removal cream for sensitive skin\r\n\r\n   Enriched with aloe vera and vitamin E\r\n\r\n   Leaves skin touchably soft and luxuriously smooth\r\n\r\n   Works on very short hair - legs, arms, underarms and bikini line\r\n\r\n   Simply smooth on and rinse off for silky skin in just 5 minutes', 14, 'corps 3.PNG'),
(40, 'AKILEINE CICALEINE BAUME PIEDS ET TALONS FISSURES ET CREVASSES 50ML', 'Corps', 'Le Baume CicaleÃ¯neÂ® protÃ¨ge les zones crevassÃ©es et fissurÃ©es des pieds et des mains.', 21, 'corps 4.PNG'),
(41, 'PURESSENTIEL ARTICULATIONS BAUME CALMANT AUX 14 HUILES ESSENTIELLES 30ML', 'Corps', 'Puressentiel Articulations Baume Calmant aux 14 Huiles Essentielles aide Ã  soulager rapidement les douleurs articulaires, dÃ©tendre et apaiser les contractures musculaires.', 47, 'corps 5.PNG'),
(42, 'CETAPHIL PRO ECZEMA NETTOYANT BODY 295 ML', 'Corps', 'Cetaphil Pro Eczema le Nettoyant Hydratant pour le corps est formulÃ© pour les peaux atopiques', 58, 'corps 6.PNG'),
(43, 'BRAUN EPILATEUR SILK EPIL 7 SES7/885 BS', 'Corps', 'Epilateur Silk-Ã©pil 7 Wet & Dry - Jambes, aisselles, maillot\r\n\r\n-Fonctions: Epilation/ Rasage/ Exfoliation/ Soin visage - 40 pincettes\r\n\r\n- SilkEpil 7\r\n\r\n- sans fil (50 mn) - 100 % Etanche\r\n\r\n- 7 accessoires fournis\r\n\r\n- Couleur: Blanc & Silver', 678, 'corps 7.PNG'),
(44, 'SESDERMA VITISES GEL, 100ml', 'Corps', 'Il contient des agents antioxydants et des immunomodulateurs encapsulÃ©s dans des nanosomes qui rÃ©gulent et accÃ©lÃ¨rent la pigmentation cutanÃ©e.', 117, 'corps 8.PNG'),
(45, 'ALMAFLORE Huile de massage veinotonique, 100ML', 'Corps', 'Cette huile de massage est utilisÃ© dans le cas de : \r\n\r\ndilatation anormale des vaisseaux sanguins avec une couleur bleutÃ©e des veines.\r\njambes lourdes avec des douleurs et des problÃ¨mes inflammatoires. Il convient Ã©galement dans le cas de gonflement des jambes : Å“dÃ¨me variqueux \r\nStagnation sanguine au niveau des veines des membres infÃ©rieurs ', 31, 'corps 9.PNG'),
(46, 'BYPHASSE LAIT ECLAIRCISSANT EXTRAIT DE BLE 500ML', 'Corps', 'Ã‰claircit, illumine et unifie le teint.\r\nIntensitÃ© de la couleur des taches diminuÃ©e.\r\nPropriÃ©tÃ©s Ã©claircissantes.\r\nHydratation longue durÃ©e.', 26, 'corps 10.PNG'),
(47, 'BIO12 NATURAL HAIR SHAMPOOING REPARATEUR MULTIACTIF 250 ML', 'Cheveux', 'Bio12 Natural Hair shampooing rÃ©parateur multiactif.', 39, 'chev 3.PNG'),
(48, 'BRASIL CACAU EXTREME REPAIR COCOA DOSE, 10X15ML', 'Cheveux', 'Brasil Cacau Extreme Repair Cocoa Dose nourrit et rÃ©pare les cheveux extrÃªmement abÃ®mÃ©s.', 91, 'chev 4.PNG'),
(49, 'K-REINE PROTÃ‰INE KÃ‰RATINE SÃ‰RUM - 200 ML', 'Cheveux', 'SÃ©rum Prolongateur De lissage.', 32, 'chev 5.PNG'),
(50, 'ITEM K.O LENTES BAUME DEMELANT DECOLLEUR 100ML', 'Cheveux', 'K.O. Lentes est un baume qui dÃ©colle les lentes mortes des cheveux et repousse les poux afin d&#39;Ã©viter une nouvelle infestation.\r\n\r\nS&#39;utilise en complÃ©ment des traitements anti-poux classiques. Disponible en tube de 100ml + 1 peigne fin.', 29, 'chev 6.PNG'),
(51, 'ANIVAGENE SERUM NUTRITIVE 125ML', 'Cheveux', 'SÃ©rum nourrissant pour protÃ©ger les cheveux abÃ®mÃ©s avec de l&#39;huile d&#39;Abyssinie, de l&#39;huile d&#39;amande, de l&#39;huile d&#39;argan, du filtre UV.', 31, 'chev 7.PNG'),
(52, 'SO&#39;BIO SHAMPOOING CHEVEUX BRILLANTS ARGAN 200ML', 'Cheveux', 'Pour des CHEVEUX BRILLANTS, ce shampooing Ã  l&#39;huile d&#39;Argan & Acide olÃ©Ã¯que va nourrir les cheveux normaux Ã  secs, mÃªme les plus ternes. Ils retrouvent leur Ã©lasticitÃ© pour un effet soie et encore plus de lumiÃ¨re.', 36, 'chev 8.PNG'),
(53, 'VICHY LE PACK DUO DERCOS DENSI-SOLUTIONS', 'Cheveux', 'VICHY LE PACK DUO DERCOS DENSI-SOLUTIONS CONTIENT :\r\n\r\n- VICHY DERCOS DENSI-SOLUTIONS CONCENTRE CREATEUR DE MASSE CAPILLAIRE 100ML\r\n\r\n- VICHY DERCOS DENSI-SOLUTIONS SHAMPOING EPAISSEUR 250 ML: Ã€ - 30%\r\n\r\n- TROUSSE A MAQUILLAGE PHARMASHOP : OFFERTE', 129, 'chev 9.PNG'),
(54, 'PHYTO PHYTOKERATINE EXTREME SHAMPOING, 200ml', 'Cheveux', 'Un shampoing sensoriel qui nettoie avec la plus grande douceur.\r\nApporte rÃ©paration et nutrition profonde pour une matiÃ¨re souple, soyeuse et une brillance ultime.\r\n\r\nContenance: 200ml', 59, 'chev 10.PNG'),
(55, 'CHICCO Lot 2 TÃ©tines Silicone 4m+', 'Bebe', 'EquipÃ©e d&#39;une valve anti-colique qui rÃ©gule le flux d&#39;air dans le biberon et Ã©vite ainsi les risques de colique, de rÃ©gurgitation et de hoquet. Ces tÃ©tines sont conÃ§ues pour suivre lâ€™anatomie de la bouche du bÃ©bÃ© durant ses premiers mois.', 16, 'b3.PNG'),
(56, 'CHICCO Set inox, 18m+, vert', 'Bebe', 'ConÃ§us pour les enfants qui savent manger seuls. Faciles Ã  utiliser grÃ¢ce au manche ergonomique et Ã  la forme spÃ©cifique de la base. A partir de 18 mois environ. 0% BPA.', 14, 'b4.PNG'),
(57, 'TOMMEE TIPPEE MADE FOR ME COUSSINETS D&#39;ALLAITEMENT *40', 'Bebe', 'Discrets et adaptÃ©s Ã  vos besoins, les coussinets absorbants jetables au quotidien Made for Me sont conÃ§us pour offrir un maximum de confort et aucune fuite.\r\n\r\nBoite de 40 ; 20 paires\r\n\r\nTaille : MEDIUM', 32, 'b5.PNG'),
(58, 'BEURER Tire-lait Ã©lectrique BY 40', 'Bebe', 'Simulation du processus naturel de tÃ©tÃ©e\r\n\r\nFonction mÃ©moire pour un mode individuel optimal', 281, 'b6.PNG'),
(59, 'BEURER StÃ©rilisateur Ã  la vapeur d&#39;eau BY 76', 'Bebe', 'Affichage LED : lecture optimale du temps de stÃ©rilisation restant\r\nPour une stÃ©rilisation complÃ¨te de 6 biberons : compter 3 heures\r\nSimple dÃ©sinfection : 6 flacons et accessoires en 7 minutes seulement !\r\nSignal optique et sonore annonÃ§ant la fin de la stÃ©rilisation\r\nGarantie : 3 an', 229, 'b7.PNG'),
(60, 'BABY BIO COFFRET TAPIS SAC', 'Bebe', 'BABY BIO COFFRET TAPIS SAC, contient:\r\n\r\nBABY BIO CREME DE CHANGE 50 ML\r\n\r\nBABY BIO CREME CROUTE DE LAIT 50 ML\r\n\r\nBABY BIO CREME NOURRISSANTE VISAGE ET CORPS 50ML\r\n\r\nBABY BIO LINIMENT OLEO-CALCAIRE 300 ML\r\n\r\nBABY BIO GEL LAVANT CHEVEUX ET CORPS 2 EN 1 , 200 ML\r\n\r\n+ UNE TROUSSE GRATUITE', 91, 'b8.PNG'),
(61, 'KLORANE BÃ©bÃ© Lingettes Epaisses Nettoyantes, 70 lingettes', 'Bebe', 'Les lingettes Klorane nettoient parfaitement et dÃ©licatement les fesses de bÃ©bÃ©. \r\n\r\nSans phenoxyethanol, sans methylisothiazolinone et sans parabens.', 28, 'b9.PNG'),
(62, 'Lilas Couche BB 3-5 Kg Confort max actif pharmacie , 32 piÃ¨ces', 'Bebe', 'Les couches lilas confort max actif pharmacie disposent des attaches extensibles qui sâ€™adaptent facilement au mouvement de votre bÃ©bÃ©. La couche lilas confort max actif pharmacie est la mieux ajustÃ© Ã  la taille, aux cuisses et aux fesses de votre bÃ©bÃ©. Elle lui procure ainsi une libertÃ© de mouvement optimale.', 20, 'b10.PNG');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user',
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `image`) VALUES
(32, 'amira', 'amirajallouz0@gmail.com', '202cb962ac59075b964b07152d234b70', 'user', 'FB_IMG_1605692960885.jpg'),
(33, 'amira', 'amoulabenkahla@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'admin', 'IMG_20200309_221025_944.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
