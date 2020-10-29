-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 29. Okt 2020 um 19:59
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `leichtathletik_wm`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `arena`
--

CREATE TABLE `arena` (
  `arena_id` int(11) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `arena`
--

INSERT INTO `arena` (`arena_id`, `address`, `city`) VALUES
(1, 'Froschberg 16', 'Linz');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `athlet`
--

CREATE TABLE `athlet` (
  `athlet_id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `nation` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `athlet`
--

INSERT INTO `athlet` (`athlet_id`, `name`, `nation`) VALUES
(1, 'Dagmar Graf', 'AUT');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `competition`
--

CREATE TABLE `competition` (
  `competition_id` int(11) NOT NULL,
  `athlet_id` int(11) NOT NULL,
  `result` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `competition`
--

INSERT INTO `competition` (`competition_id`, `athlet_id`, `result`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `event_name` varchar(20) DEFAULT NULL,
  `arena_id` int(11) NOT NULL,
  `competition_id` int(11) NOT NULL,
  `helper_event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `helper`
--

CREATE TABLE `helper` (
  `helper_id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `function` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `helper`
--

INSERT INTO `helper` (`helper_id`, `name`, `function`) VALUES
(1, 'Wolfgang Reinthaler', 'Schiedsrichter');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `helpers_event`
--

CREATE TABLE `helpers_event` (
  `helper_event_id` int(11) NOT NULL,
  `helper_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `arena`
--
ALTER TABLE `arena`
  ADD PRIMARY KEY (`arena_id`);

--
-- Indizes für die Tabelle `athlet`
--
ALTER TABLE `athlet`
  ADD PRIMARY KEY (`athlet_id`);

--
-- Indizes für die Tabelle `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`competition_id`),
  ADD KEY `athlet_id` (`athlet_id`);

--
-- Indizes für die Tabelle `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `competition_id` (`competition_id`),
  ADD KEY `arena_id` (`arena_id`);

--
-- Indizes für die Tabelle `helper`
--
ALTER TABLE `helper`
  ADD PRIMARY KEY (`helper_id`);

--
-- Indizes für die Tabelle `helpers_event`
--
ALTER TABLE `helpers_event`
  ADD PRIMARY KEY (`helper_event_id`),
  ADD KEY `helper_id` (`helper_id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `arena`
--
ALTER TABLE `arena`
  MODIFY `arena_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `athlet`
--
ALTER TABLE `athlet`
  MODIFY `athlet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `competition`
--
ALTER TABLE `competition`
  MODIFY `competition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `helper`
--
ALTER TABLE `helper`
  MODIFY `helper_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `helpers_event`
--
ALTER TABLE `helpers_event`
  MODIFY `helper_event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `competition`
--
ALTER TABLE `competition`
  ADD CONSTRAINT `competition_ibfk_1` FOREIGN KEY (`athlet_id`) REFERENCES `athlet` (`athlet_id`);

--
-- Constraints der Tabelle `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competition` (`competition_id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`arena_id`) REFERENCES `arena` (`arena_id`);

--
-- Constraints der Tabelle `helpers_event`
--
ALTER TABLE `helpers_event`
  ADD CONSTRAINT `helpers_event_ibfk_1` FOREIGN KEY (`helper_id`) REFERENCES `helper` (`helper_id`),
  ADD CONSTRAINT `helpers_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
