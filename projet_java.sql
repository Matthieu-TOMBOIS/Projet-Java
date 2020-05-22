-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  ven. 22 mai 2020 à 09:08
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `ID_ENSEIGNANT` int(20) NOT NULL,
  `#ID_UTILISATEUR` int(20) NOT NULL,
  `#ID_COURS` int(20) NOT NULL,
  PRIMARY KEY (`ID_ENSEIGNANT`,`#ID_UTILISATEUR`,`#ID_COURS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `#ID_UTILISATEUR` int(20) NOT NULL AUTO_INCREMENT,
  `NUMERO` text NOT NULL,
  `#ID_GROUPE` int(20) NOT NULL,
  PRIMARY KEY (`#ID_UTILISATEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `ID_GROUPE` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` int(11) NOT NULL,
  `#ID_PROMO` int(11) NOT NULL,
  PRIMARY KEY (`ID_GROUPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `ID_PROMO` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  PRIMARY KEY (`ID_PROMO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `ID_SALLE` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  `CAPACITE` text NOT NULL,
  `#ID_SITE` int(20) NOT NULL,
  PRIMARY KEY (`ID_SALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `#ID_COURS` int(20) NOT NULL,
  `#ID_TYPE` int(20) NOT NULL,
  PRIMARY KEY (`ID_SEANCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `seance_enseignant`
--

DROP TABLE IF EXISTS `seance_enseignant`;
CREATE TABLE IF NOT EXISTS `seance_enseignant` (
  `#ID_SEANCE` int(20) NOT NULL,
  `#ID_ENSEIGNANT` int(20) NOT NULL,
  PRIMARY KEY (`#ID_SEANCE`,`#ID_ENSEIGNANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `seance_groupes`
--

DROP TABLE IF EXISTS `seance_groupes`;
CREATE TABLE IF NOT EXISTS `seance_groupes` (
  `#ID_SEANCE` int(20) NOT NULL,
  `#ID_GROUPE` int(20) NOT NULL,
  PRIMARY KEY (`#ID_SEANCE`,`#ID_GROUPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `seance_salles`
--

DROP TABLE IF EXISTS `seance_salles`;
CREATE TABLE IF NOT EXISTS `seance_salles` (
  `#ID_SEANCE` int(20) NOT NULL,
  `#ID_SALLE` int(20) NOT NULL,
  PRIMARY KEY (`#ID_SEANCE`,`#ID_SALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `ID_SITE` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  PRIMARY KEY (`ID_SITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_cours`
--

DROP TABLE IF EXISTS `type_cours`;
CREATE TABLE IF NOT EXISTS `type_cours` (
  `ID_TYPECRS` int(20) NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  PRIMARY KEY (`ID_TYPECRS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_UTILISATEUR`, `EMAIL`, `PASSWORD`, `NOM`, `PRENOM`, `DROIT`) VALUES
(1, 'saycocie.wichawee@gmail.com', 'lolo', 'SAYCOCIE', 'WICHAWEE', '1');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
