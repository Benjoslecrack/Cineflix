-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 12 avr. 2023 à 10:50
-- Version du serveur : 10.6.12-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `puse8143_cineflix`
--

-- --------------------------------------------------------

--
-- Structure de la table `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `actors`
--

INSERT INTO `actors` (`id`, `name`) VALUES
(101, 'Bernhard Kunze'),
(102, 'Roberto Schiller'),
(103, 'Jody Lowe'),
(104, 'Rodrick Rice'),
(105, 'Peggie Schaefer'),
(106, 'Idell Stracke'),
(107, 'Mable Kihn'),
(108, 'Clay Murazik'),
(109, 'Sigrid Bartell'),
(110, 'Marlin Jones'),
(111, 'Forrest Morissette'),
(112, 'Nyasia Skiles'),
(113, 'Felton Botsford'),
(114, 'Marie Dooley'),
(115, 'Sarai Wisozk'),
(116, 'Clarabelle Denesik'),
(117, 'Louisa Fahey'),
(118, 'Osvaldo Labadie'),
(119, 'Noemie Gutkowski'),
(120, 'Hassie Osinski'),
(121, 'Creola Jaskolski'),
(122, 'Lane Walter'),
(123, 'Marcella Sauer'),
(124, 'Quinten Gutkowski'),
(125, 'Gus Kuhlman'),
(126, 'Orion Harris'),
(127, 'Cruz Schamberger'),
(128, 'Brycen Raynor'),
(129, 'Rudolph Hoppe'),
(130, 'Sydni Stark'),
(131, 'Monty Wolf'),
(132, 'Lesly Hoppe'),
(133, 'Tremaine Gorczany'),
(134, 'Elwin Runolfsson'),
(135, 'Rene Corwin'),
(136, 'Ericka Ziemann'),
(137, 'Sister West'),
(138, 'Anita Bergstrom'),
(139, 'Harley Blanda'),
(140, 'Marcia Olson'),
(141, 'Harvey Jaskolski'),
(142, 'Alexanne Hoppe'),
(143, 'Gerda Metz'),
(144, 'Dustin Kohler'),
(145, 'Abby Parisian'),
(146, 'Nathen Walsh'),
(147, 'Drake Fay'),
(148, 'Khalid Mitchell'),
(149, 'Llewellyn Carter'),
(150, 'Ivy Yost');

-- --------------------------------------------------------

--
-- Structure de la table `actors_movies`
--

CREATE TABLE `actors_movies` (
  `actors_id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`) VALUES
(115, NULL, 'Nouveautés', 'nouveautes'),
(116, NULL, 'Tendances', 'tendances'),
(117, NULL, 'action et aventure', 'action-et-aventure'),
(118, NULL, 'Comédies', 'comedies'),
(119, NULL, 'Documentaires', 'documentaires'),
(120, NULL, 'Drames', 'drames'),
(121, NULL, 'Horreur', 'horreur'),
(122, NULL, 'Romance', 'romance'),
(123, NULL, 'SF', 'sf'),
(124, NULL, 'Fantastique', 'fantastique'),
(125, NULL, 'Sport', 'sport'),
(126, NULL, 'Thrillers', 'thrillers'),
(127, NULL, 'Policier', 'policier'),
(128, NULL, 'Films', 'films'),
(129, 128, 'Films de BD et super-héros', '10118'),
(130, 128, 'Films de gangsters', '30140'),
(131, 128, 'Films de guerre', '3373'),
(132, 128, 'Films post-apocalyptiques', '21076'),
(133, 128, 'Films westerns', '7700'),
(134, 128, 'Films français', '58807'),
(135, 128, 'Films d’horreur déjantés', '1155'),
(136, 128, 'Films de monstres', '947'),
(137, 128, 'Films gore', '615'),
(138, 128, 'Films de zombies', '75421'),
(139, 128, 'Films de slashers et de tueurs en série', '8646'),
(140, 128, 'Films pour ados', '2340'),
(141, 128, 'Films jeunesse et famille', '783'),
(142, 128, 'Films fantastiques', '9744'),
(143, 128, 'Films sur les arts martiaux', '8985'),
(144, 128, 'nom', 'slug'),
(145, NULL, 'Séries', 'series'),
(146, 145, 'Séries absurdes', '77205'),
(147, 145, 'Séries d’action et d’aventure', '10673'),
(148, 145, 'Séries aisatiques', '85543'),
(149, 145, 'Séries de super-héros', '53717'),
(150, 145, 'Séries bonne humeur', '16688'),
(151, 145, 'Séries de complots', '27607'),
(152, 145, 'Séries dramatiques', '26018'),
(153, 145, 'Séries effrayantes', '25989'),
(154, 145, 'Séries émotion', '25833'),
(155, 145, 'Séries françaises', '62041'),
(156, 145, 'Séries judiciaires', '25801'),
(157, 145, 'Séries nostalgie', '2008977'),
(158, 145, 'Séries pour ados', '60951'),
(159, 145, 'Séries psychologiques', '26127'),
(160, 145, 'Séries avec voyage dans le temps', '75435'),
(161, NULL, 'Animes', 'animes'),
(162, 161, 'Animation inspirée d’un jeu vidéo', '93081'),
(163, 161, 'Animation pour adultes', '11881'),
(164, 161, 'Anime comique', '9302'),
(165, 161, 'Anime d’action', '2653'),
(166, 161, 'Anime dramatique', '452'),
(167, 161, 'Anime fantastique', '11146'),
(168, 161, 'Anime d’horreur', '10695'),
(169, 161, 'Anime SF', '2729'),
(170, 161, 'Séries d’animation japonaise', '6721'),
(171, 161, 'Autres séries d’animation', '7424');

-- --------------------------------------------------------

--
-- Structure de la table `categories_movies`
--

CREATE TABLE `categories_movies` (
  `categories_id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230410155524', '2023-04-10 17:55:37', 1515);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `poster` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `director` varchar(255) NOT NULL,
  `productor` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playlists_movies`
--

CREATE TABLE `playlists_movies` (
  `playlists_id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playlists_users`
--

CREATE TABLE `playlists_users` (
  `playlists_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) NOT NULL,
  `hashed_token` varchar(100) NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `profil_pic` varchar(255) NOT NULL DEFAULT 'public\\images\\profil\\default.png',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users_movies`
--

CREATE TABLE `users_movies` (
  `users_id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `actors_movies`
--
ALTER TABLE `actors_movies`
  ADD PRIMARY KEY (`actors_id`,`movies_id`),
  ADD KEY `IDX_B3012DC07168CF59` (`actors_id`),
  ADD KEY `IDX_B3012DC053F590A4` (`movies_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3AF34668727ACA70` (`parent_id`);

--
-- Index pour la table `categories_movies`
--
ALTER TABLE `categories_movies`
  ADD PRIMARY KEY (`categories_id`,`movies_id`),
  ADD KEY `IDX_CE77D308A21214B7` (`categories_id`),
  ADD KEY `IDX_CE77D30853F590A4` (`movies_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5E06116FB03A8386` (`created_by_id`);

--
-- Index pour la table `playlists_movies`
--
ALTER TABLE `playlists_movies`
  ADD PRIMARY KEY (`playlists_id`,`movies_id`),
  ADD KEY `IDX_2ECB6AB09F70CF56` (`playlists_id`),
  ADD KEY `IDX_2ECB6AB053F590A4` (`movies_id`);

--
-- Index pour la table `playlists_users`
--
ALTER TABLE `playlists_users`
  ADD PRIMARY KEY (`playlists_id`,`users_id`),
  ADD KEY `IDX_79D016AE9F70CF56` (`playlists_id`),
  ADD KEY `IDX_79D016AE67B3B43D` (`users_id`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`);

--
-- Index pour la table `users_movies`
--
ALTER TABLE `users_movies`
  ADD PRIMARY KEY (`users_id`,`movies_id`),
  ADD KEY `IDX_C9F963A067B3B43D` (`users_id`),
  ADD KEY `IDX_C9F963A053F590A4` (`movies_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actors_movies`
--
ALTER TABLE `actors_movies`
  ADD CONSTRAINT `FK_B3012DC053F590A4` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B3012DC07168CF59` FOREIGN KEY (`actors_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_3AF34668727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `categories_movies`
--
ALTER TABLE `categories_movies`
  ADD CONSTRAINT `FK_CE77D30853F590A4` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CE77D308A21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `FK_5E06116FB03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `playlists_movies`
--
ALTER TABLE `playlists_movies`
  ADD CONSTRAINT `FK_2ECB6AB053F590A4` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2ECB6AB09F70CF56` FOREIGN KEY (`playlists_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `playlists_users`
--
ALTER TABLE `playlists_users`
  ADD CONSTRAINT `FK_79D016AE67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_79D016AE9F70CF56` FOREIGN KEY (`playlists_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `users_movies`
--
ALTER TABLE `users_movies`
  ADD CONSTRAINT `FK_C9F963A053F590A4` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C9F963A067B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
