-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  Dim 07 juin 2020 à 14:17
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet_java`
--

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `ID_COURS` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  PRIMARY KEY (`ID_COURS`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`ID_COURS`, `NOM`) VALUES
(1, 'STATISTIQUES'),
(2, 'STATISTIQUES'),
(3, 'POO JAVA'),
(4, 'POO JAVA'),
(5, 'THERMODYNAMIQUE'),
(6, 'THERMODYNAMIQUE');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `ID_UTILISATEUR` int(20) NOT NULL,
  `ID_COURS` int(20) NOT NULL,
  PRIMARY KEY (`ID_UTILISATEUR`,`ID_COURS`),
  KEY `enseignant_ibfk_2` (`ID_COURS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`ID_UTILISATEUR`, `ID_COURS`) VALUES
(5, 1),
(5, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `ID_UTILISATEUR` int(20) NOT NULL AUTO_INCREMENT,
  `NUMERO` text NOT NULL,
  `ID_GROUPE` int(20) NOT NULL,
  PRIMARY KEY (`ID_UTILISATEUR`),
  KEY `etudiant_ibfk_2` (`ID_GROUPE`)
) ENGINE=InnoDB AUTO_INCREMENT=1111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`ID_UTILISATEUR`, `NUMERO`, `ID_GROUPE`) VALUES
(6, '1000', 1),
(7, '1001', 1),
(8, '1002', 2),
(9, '1003', 2),
(10, '1004', 3),
(11, '1005', 3),
(12, '1006', 4),
(13, '1007', 4),
(14, '1008', 5),
(15, '1009', 5),
(16, '1011', 6),
(17, '1012', 6);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `ID_GROUPE` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ID_PROMO` int(11) NOT NULL,
  PRIMARY KEY (`ID_GROUPE`),
  KEY `groupe_ibfk_1` (`ID_PROMO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`ID_GROUPE`, `NOM`, `ID_PROMO`) VALUES
(1, 'TD09', 1),
(2, 'TD10', 1),
(3, 'TD01', 2),
(4, 'TD02', 2),
(5, 'TD03', 3),
(6, 'TD04', 3);

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `ID_PROMO` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID_PROMO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`ID_PROMO`, `NOM`) VALUES
(1, 'PROMO 2022'),
(2, 'PROMO 2023'),
(3, 'PROMO 2024');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `ID_SALLE` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  `CAPACITE` text NOT NULL,
  `ID_SITE` int(20) NOT NULL,
  PRIMARY KEY (`ID_SALLE`),
  KEY `salle_ibfk_1` (`ID_SITE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`ID_SALLE`, `NOM`, `CAPACITE`, `ID_SITE`) VALUES
(1, 'P101', '100', 1),
(2, 'P102', '100', 1),
(3, 'P201', '50', 2),
(4, 'P202', '50', 2),
(5, 'P301', '25', 3),
(6, 'P302', '25', 3),
(7, 'P401', '20', 4),
(8, 'P402', '20', 4),
(9, 'P501', '100', 5),
(10, 'P502', '100', 5);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `ID_SEANCE` int(20) NOT NULL AUTO_INCREMENT,
  `SEMAINE` text NOT NULL,
  `DATE` date NOT NULL,
  `HEURE_DEBUT` time NOT NULL,
  `HEURE_FIN` time NOT NULL,
  `ETAT` text NOT NULL,
  `ID_COURS` int(20) NOT NULL,
  `ID_TYPECRS` int(20) NOT NULL,
  PRIMARY KEY (`ID_SEANCE`),
  KEY `seance_ibfk_1` (`ID_COURS`),
  KEY `seance_ibfk_2` (`ID_TYPECRS`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`ID_SEANCE`, `SEMAINE`, `DATE`, `HEURE_DEBUT`, `HEURE_FIN`, `ETAT`, `ID_COURS`, `ID_TYPECRS`) VALUES
(1, '23', '2020-06-08', '10:15:00', '11:45:00', '2', 1, 3),
(2, '23', '2020-06-08', '13:15:00', '14:45:00', '2', 3, 4),
(3, '23', '2020-06-09', '10:15:00', '11:45:00', '2', 4, 4),
(4, '23', '2020-06-09', '12:00:00', '13:45:00', '2', 2, 3),
(5, '23', '2020-06-10', '13:15:00', '14:45:00', '1', 5, 3),
(6, '23', '2020-06-10', '15:00:00', '16:30:00', '3', 6, 3);

-- --------------------------------------------------------

--
-- Structure de la table `seance_enseignant`
--

DROP TABLE IF EXISTS `seance_enseignant`;
CREATE TABLE IF NOT EXISTS `seance_enseignant` (
  `ID_SEANCE` int(20) NOT NULL,
  `ID_ENSEIGNANT` int(20) NOT NULL,
  PRIMARY KEY (`ID_SEANCE`,`ID_ENSEIGNANT`),
  KEY `seance_enseignant_ibfk_1` (`ID_ENSEIGNANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `seance_enseignant`
--

INSERT INTO `seance_enseignant` (`ID_SEANCE`, `ID_ENSEIGNANT`) VALUES
(2, 3),
(3, 3),
(5, 4),
(6, 4),
(1, 5),
(4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `seance_groupes`
--

DROP TABLE IF EXISTS `seance_groupes`;
CREATE TABLE IF NOT EXISTS `seance_groupes` (
  `ID_SEANCE` int(20) NOT NULL,
  `ID_GROUPE` int(20) NOT NULL,
  PRIMARY KEY (`ID_SEANCE`,`ID_GROUPE`),
  KEY `seance_groupes_ibfk_1` (`ID_GROUPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `seance_groupes`
--

INSERT INTO `seance_groupes` (`ID_SEANCE`, `ID_GROUPE`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `seance_salles`
--

DROP TABLE IF EXISTS `seance_salles`;
CREATE TABLE IF NOT EXISTS `seance_salles` (
  `ID_SEANCE` int(20) NOT NULL,
  `ID_SALLE` int(20) NOT NULL,
  PRIMARY KEY (`ID_SEANCE`,`ID_SALLE`),
  KEY `seance_salles_ibfk_1` (`ID_SALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `seance_salles`
--

INSERT INTO `seance_salles` (`ID_SEANCE`, `ID_SALLE`) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 7),
(5, 9),
(6, 10);

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `ID_SITE` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  PRIMARY KEY (`ID_SITE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`ID_SITE`, `NOM`) VALUES
(1, 'E1'),
(2, 'E2'),
(3, 'E3'),
(4, 'E4'),
(5, 'E5');

-- --------------------------------------------------------

--
-- Structure de la table `type_cours`
--

DROP TABLE IF EXISTS `type_cours`;
CREATE TABLE IF NOT EXISTS `type_cours` (
  `ID_TYPECRS` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  PRIMARY KEY (`ID_TYPECRS`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `type_cours`
--

INSERT INTO `type_cours` (`ID_TYPECRS`, `NOM`) VALUES
(1, 'CM'),
(2, 'CI'),
(3, 'TD'),
(4, 'TP'),
(5, 'PROJET'),
(6, 'SOUTIEN'),
(7, 'INFORMATIONS');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID_UTILISATEUR` int(20) NOT NULL AUTO_INCREMENT,
  `EMAIL` text NOT NULL,
  `PASSWORD` text NOT NULL,
  `NOM` text NOT NULL,
  `PRENOM` text NOT NULL,
  `DROIT` text NOT NULL,
  PRIMARY KEY (`ID_UTILISATEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=1111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_UTILISATEUR`, `EMAIL`, `PASSWORD`, `NOM`, `PRENOM`, `DROIT`) VALUES
(1, 'admin@gmail.com', 'admin', 'ADMIN', 'X', '1'),
(2, 'pedagogique@gmail.com', 'pedagogique', 'SEGADO', 'JEAN-PIERRE', '2'),
(3, 'enseignant1@gmail.com', 'enseignant1', 'GUAN', 'HENRI', '3'),
(4, 'enseignant2@gmail.com', 'enseignant2', 'RICHAUD', 'REMI', '3'),
(5, 'enseignant3@gmail.com', 'enseignant3', 'CHAARI', 'ANIS', '3'),
(6, 'etudiant1@gmail.com', 'etudiant1', 'SAYCOCIE', 'WICHAWEE', '4'),
(7, 'etudiant2@gmail.com', 'etudiant2', 'DAMIER', 'ROMANCE', '4'),
(8, 'etudiant3@gmail.com', 'etudiant3', 'TOMBOIS', 'MATTHIEU', '4'),
(9, 'etudiant4@gmail.com', 'etudiant4', 'BEGEY', 'NOEMIE', '4'),
(10, 'etudiant5@gmail.com', 'etudiant5', 'DURAND', 'JEAN', '4'),
(11, 'etudiant6@gmail.com', 'etudiant6', 'RICHARD', 'PIERRE', '4'),
(12, 'etudiant7@gmail.com', 'etudiant7', 'ALCAIDE', 'LAURA', '4'),
(13, 'etudiant8@gmail.com', 'etudiant8', 'ROYGENS', 'KILLIAN', '4'),
(14, 'etudiant9@gmail.com', 'etudiant9', 'LOUVAT', 'MARIE', '4'),
(15, 'etudiant10@gmail.com', 'etudiant10', 'GROUSSIN', 'ARTHUR', '4'),
(16, 'etudiant11@gmail.com', 'etudiant11', 'DENIS', 'ALICE', '4'),
(17, 'etudiant12@gmail.com', 'etudiant12', 'LEFEBVRE', 'FAUSTINE', '4');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `enseignant_ibfk_1` FOREIGN KEY (`ID_UTILISATEUR`) REFERENCES `utilisateur` (`ID_UTILISATEUR`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enseignant_ibfk_2` FOREIGN KEY (`ID_COURS`) REFERENCES `cours` (`ID_COURS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`ID_UTILISATEUR`) REFERENCES `utilisateur` (`ID_UTILISATEUR`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `etudiant_ibfk_2` FOREIGN KEY (`ID_GROUPE`) REFERENCES `groupe` (`ID_GROUPE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `groupe_ibfk_1` FOREIGN KEY (`ID_PROMO`) REFERENCES `promotion` (`ID_PROMO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`ID_SITE`) REFERENCES `site` (`ID_SITE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`ID_COURS`) REFERENCES `cours` (`ID_COURS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seance_ibfk_2` FOREIGN KEY (`ID_TYPECRS`) REFERENCES `type_cours` (`ID_TYPECRS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `seance_enseignant`
--
ALTER TABLE `seance_enseignant`
  ADD CONSTRAINT `seance_enseignant_ibfk_1` FOREIGN KEY (`ID_ENSEIGNANT`) REFERENCES `enseignant` (`ID_UTILISATEUR`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seance_enseignant_ibfk_2` FOREIGN KEY (`ID_SEANCE`) REFERENCES `seance` (`ID_SEANCE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `seance_groupes`
--
ALTER TABLE `seance_groupes`
  ADD CONSTRAINT `seance_groupes_ibfk_1` FOREIGN KEY (`ID_GROUPE`) REFERENCES `groupe` (`ID_GROUPE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seance_groupes_ibfk_2` FOREIGN KEY (`ID_SEANCE`) REFERENCES `seance` (`ID_SEANCE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `seance_salles`
--
ALTER TABLE `seance_salles`
  ADD CONSTRAINT `seance_salles_ibfk_1` FOREIGN KEY (`ID_SALLE`) REFERENCES `salle` (`ID_SALLE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seance_salles_ibfk_2` FOREIGN KEY (`ID_SEANCE`) REFERENCES `seance` (`ID_SEANCE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
