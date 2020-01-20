-- --------------------------------------------------------
-- Server:                       127.0.0.1
-- Versiune server:              10.3.16-MariaDB - mariadb.org binary distribution
-- SO server:                    Win64
-- HeidiSQL Versiune:            9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Descarcă structura bazei de date pentru slotify
CREATE DATABASE IF NOT EXISTS `slotify` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `slotify`;

-- Descarcă structura pentru tabelă slotify.albums
CREATE TABLE IF NOT EXISTS `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '0',
  `artist` int(11) NOT NULL DEFAULT 0,
  `genre` int(11) NOT NULL DEFAULT 0,
  `artworkPath` varchar(500) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Descarcă datele pentru tabela slotify.albums: ~3 rows (aproximativ)
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` (`id`, `title`, `artist`, `genre`, `artworkPath`) VALUES
	(1, 'Black Album', 1, 1, 'assets/images/artwork/BlackAlbum.jpg'),
	(2, 'BlackInBlack', 2, 1, 'assets/images/artwork/BlackInBlack.jpg'),
	(3, 'Human', 3, 1, 'assets/images/artwork/Human.jpg');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;

-- Descarcă structura pentru tabelă slotify.artists
CREATE TABLE IF NOT EXISTS `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Descarcă datele pentru tabela slotify.artists: ~2 rows (aproximativ)
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` (`id`, `name`) VALUES
	(1, 'Metallica'),
	(2, 'AC/DC'),
	(3, 'Three Days Grace');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;

-- Descarcă structura pentru tabelă slotify.genres
CREATE TABLE IF NOT EXISTS `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Descarcă datele pentru tabela slotify.genres: ~4 rows (aproximativ)
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` (`id`, `name`) VALUES
	(1, 'Rock'),
	(2, 'Pop'),
	(3, 'Hip-Hop'),
	(4, 'Rap'),
	(5, 'Jazz');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;

-- Descarcă structura pentru tabelă slotify.playlist
CREATE TABLE IF NOT EXISTS `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `owner` varchar(50) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Descarcă datele pentru tabela slotify.playlist: ~1 rows (aproximativ)
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` (`id`, `name`, `owner`, `dateCreated`) VALUES
	(4, 'Rock', 'OvidiuCotei', '2020-01-07 00:00:00');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;

-- Descarcă structura pentru tabelă slotify.playlistsongs
CREATE TABLE IF NOT EXISTS `playlistsongs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `songId` int(11) NOT NULL DEFAULT 0,
  `playlistId` int(11) NOT NULL DEFAULT 0,
  `playlistOrder` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Descarcă datele pentru tabela slotify.playlistsongs: ~4 rows (aproximativ)
/*!40000 ALTER TABLE `playlistsongs` DISABLE KEYS */;
INSERT INTO `playlistsongs` (`id`, `songId`, `playlistId`, `playlistOrder`) VALUES
	(2, 1, 4, 0),
	(3, 2, 4, 1),
	(5, 3, 4, 2),
	(9, 4, 4, 3);
/*!40000 ALTER TABLE `playlistsongs` ENABLE KEYS */;

-- Descarcă structura pentru tabelă slotify.songs
CREATE TABLE IF NOT EXISTS `songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '0',
  `artist` int(11) NOT NULL DEFAULT 0,
  `album` int(11) NOT NULL DEFAULT 0,
  `genre` int(11) NOT NULL DEFAULT 0,
  `duration` varchar(8) NOT NULL DEFAULT '0',
  `path` varchar(500) NOT NULL DEFAULT '0',
  `albumOrder` int(11) NOT NULL DEFAULT 0,
  `plays` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Descarcă datele pentru tabela slotify.songs: ~4 rows (aproximativ)
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` (`id`, `title`, `artist`, `album`, `genre`, `duration`, `path`, `albumOrder`, `plays`) VALUES
	(1, 'Nothing Else Matters', 1, 1, 1, '6:25', 'assets/music/Nothing Else Matters.mp3', 1, 89),
	(2, 'The Unforgiven', 1, 1, 1, '6:23', 'assets/music/The Unforgiven.mp3', 2, 68),
	(3, 'Back In Black', 2, 2, 1, '4:13', 'assets/music/Back In Black.mp3', 1, 57),
	(4, 'Human Race', 3, 3, 1, '4:09', 'assets/music/Human Race.mp3', 1, 47);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;

-- Descarcă structura pentru tabelă slotify.users
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(25) NOT NULL DEFAULT '0',
  `firstName` varchar(50) NOT NULL DEFAULT '0',
  `lastName` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(200) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '0',
  `signUpDate` datetime NOT NULL DEFAULT current_timestamp(),
  `profilePicture` varchar(500) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Descarcă datele pentru tabela slotify.users: ~2 rows (aproximativ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`Id`, `userName`, `firstName`, `lastName`, `email`, `password`, `signUpDate`, `profilePicture`) VALUES
	(1, 'OvyKode', 'Ovy', 'Kode', 'Ovykode@gmail.com', '5b02abbdfce828259db9c77be400986f', '2019-12-23 10:50:50', 'assets/images/profile-pics/head_emerald.png'),
	(2, 'OvidiuCotei', 'Cotei', 'Ovidiu', 'Ovidiu_metallica@yahoo.com', '5b02abbdfce828259db9c77be400986f', '2019-12-23 10:56:50', 'assets/images/profile-pics/head_emerald.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
