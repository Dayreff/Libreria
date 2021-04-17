-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-10-2020 a las 04:31:53
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

DROP TABLE IF EXISTS `autor`;
CREATE TABLE IF NOT EXISTS `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `nombre`) VALUES
(1, 'Stephen King'),
(3, 'Haruki Murakami'),
(6, 'Miguel de Cervantes'),
(7, 'Charles Dickens'),
(8, 'J. R. R. Tolkien'),
(9, 'Antoine de Saint-Exupéry'),
(10, 'Dan Brown'),
(11, 'Agatha Christie'),
(12, 'Lewis Carroll'),
(13, 'Henry Rider Haggard'),
(14, 'J. D. Salinger'),
(15, 'Paulo Coelho'),
(16, 'John Boyne'),
(17, 'Johanna Spyri'),
(18, 'Suzanne Collins'),
(19, 'Lucy Maud Montgomery'),
(20, 'Ana Swell'),
(21, 'Lucy Maud Montgomery”'),
(22, 'Umberto Eco'),
(23, 'Frank Baum'),
(24, 'E.B White'),
(25, 'James Dasher'),
(26, 'Carlos Cuahutemoc Sanchez'),
(27, 'Nikolai Ostrovsky'),
(28, 'Lev Tolstoi'),
(29, 'Carlo Collodi'),
(30, 'Judith Kerr'),
(31, 'E.L James'),
(32, 'Anna Frank'),
(33, 'Ernest Cline'),
(34, 'Harper Lee'),
(35, 'Rhonda Byrne'),
(36, 'Margaret Mitchell'),
(37, 'Gabriel Garcia Marquez'),
(38, 'Rick Warren'),
(39, 'Collen McCullough'),
(40, 'Julio Verne'),
(41, 'Jeff Kinney'),
(42, 'Jeff Kinney'),
(43, 'Cassandra Clare'),
(44, 'J.J Benitez'),
(45, 'Diana Wynne'),
(46, 'George Orwell'),
(47, 'C.S Lewis'),
(48, 'J.K Rowling');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
