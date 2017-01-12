-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:8889
-- Généré le :  Jeu 12 Janvier 2017 à 09:28
-- Version du serveur :  5.5.42
-- Version de PHP :  7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `streaming_sf`
--

-- --------------------------------------------------------

--
-- Structure de la table `casting`
--

CREATE TABLE `casting` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `casting`
--

INSERT INTO `casting` (`id`, `nom`, `prenom`) VALUES
(1, 'Cage', 'Nicolas'),
(2, 'Thurman', 'Uma'),
(3, 'Kitano', 'Takeshi'),
(4, 'Coen', 'Joen'),
(5, 'Coen', 'Ethan'),
(6, 'Clooney', 'George'),
(7, 'Lucas', 'George'),
(8, 'Duvall', 'Robert'),
(9, 'Pleasance', 'Donald'),
(10, 'Kershner', 'Irvin'),
(11, 'Marquand', 'Richard'),
(12, 'Fisher', 'Carrie'),
(13, 'Ford', 'Harrison'),
(14, 'Portman', 'Nathalie'),
(15, 'Scott', 'Ridley');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anneeProd` int(11) DEFAULT NULL,
  `pays_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `film`
--

INSERT INTO `film` (`id`, `genre_id`, `titre`, `anneeProd`, `pays_id`) VALUES
(1, 3, 'THX 1138', 1971, 3),
(2, 3, 'Star Wars : Episode IV - Un nouvel espoir (La Guerre des étoiles)', 1977, 3),
(3, 3, 'Star Wars : Episode VI - Le Retour du Jedi', 1983, 3),
(4, 3, 'Star Wars : Episode V - L''Empire contre-attaque', 1980, 3),
(5, 3, 'Star Wars : Episode I - La Menace fantôme', 1999, 3),
(6, 3, 'Star Wars : Episode II - L''Attaque des clones', 2002, 3),
(7, 3, 'Star Wars : Episode III - La Revanche des Sith', 2005, 3),
(8, 3, 'Blade Runner', 1982, 3);

-- --------------------------------------------------------

--
-- Structure de la table `films_interpretes`
--

CREATE TABLE `films_interpretes` (
  `film_id` int(11) NOT NULL,
  `casting_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `films_interpretes`
--

INSERT INTO `films_interpretes` (`film_id`, `casting_id`) VALUES
(2, 12),
(2, 13),
(3, 12),
(3, 13),
(4, 12),
(4, 13),
(5, 14),
(6, 14),
(7, 14),
(8, 13);

-- --------------------------------------------------------

--
-- Structure de la table `films_realises`
--

CREATE TABLE `films_realises` (
  `film_id` int(11) NOT NULL,
  `casting_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `films_realises`
--

INSERT INTO `films_realises` (`film_id`, `casting_id`) VALUES
(1, 7),
(2, 7),
(3, 11),
(4, 10),
(5, 7),
(6, 7),
(7, 7),
(8, 15);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`id`, `nom`) VALUES
(1, 'Romance'),
(2, 'Thriller'),
(3, 'SF'),
(4, 'Horreur'),
(5, 'Policier'),
(6, 'Documentaire'),
(7, 'Comedie'),
(8, 'Musical');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`id`, `nom`) VALUES
(1, 'France'),
(2, 'UK'),
(3, 'USA'),
(4, 'Canada');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `casting`
--
ALTER TABLE `casting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8244BE224296D31F` (`genre_id`),
  ADD KEY `IDX_8244BE22A6E44244` (`pays_id`);

--
-- Index pour la table `films_interpretes`
--
ALTER TABLE `films_interpretes`
  ADD PRIMARY KEY (`film_id`,`casting_id`),
  ADD KEY `IDX_208BF36D567F5183` (`film_id`),
  ADD KEY `IDX_208BF36D9EB2648F` (`casting_id`);

--
-- Index pour la table `films_realises`
--
ALTER TABLE `films_realises`
  ADD PRIMARY KEY (`film_id`,`casting_id`),
  ADD KEY `IDX_43C1459C567F5183` (`film_id`),
  ADD KEY `IDX_43C1459C9EB2648F` (`casting_id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `casting`
--
ALTER TABLE `casting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `FK_8244BE224296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `FK_8244BE22A6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`);

--
-- Contraintes pour la table `films_interpretes`
--
ALTER TABLE `films_interpretes`
  ADD CONSTRAINT `FK_208BF36D567F5183` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_208BF36D9EB2648F` FOREIGN KEY (`casting_id`) REFERENCES `casting` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `films_realises`
--
ALTER TABLE `films_realises`
  ADD CONSTRAINT `FK_43C1459C567F5183` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_43C1459C9EB2648F` FOREIGN KEY (`casting_id`) REFERENCES `casting` (`id`) ON DELETE CASCADE;

