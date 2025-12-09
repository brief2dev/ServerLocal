-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 19-10-2025 a las 18:20:57
-- Versión del servidor: 9.2.0
-- Versión de PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `SE_SYS`
--
CREATE DATABASE IF NOT EXISTS `SE_SYS` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `SE_SYS`;

--
-- Volcado de datos para la tabla `InventarioEquipos`
--

INSERT INTO `InventarioEquipos` (`ID_Equipo`, `Nombre`, `Descrip`, `Marca`, `Modelo`, `Serie`, `ID_Dept`, `Comentario`, `Estado`, `Baja`, `Fecha_Baja`, `Ult_Coment`, `Fecha_ulti`, `Fecha_Ingreso`, `Ram`, `Disco`, `Memoria`, `Administracion`) VALUES
(2, 'Macbook air', 'comnputadora de escritorio portatil de la marca apple', 'apple', 'air 13', 'SN', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla facilisi morbi tempus iaculis urna id volutpat lacus', 1, 1, '2024-05-30', 'Facilisi etiam dignissim diam quis enim lobortis scelerisque. Eleifend quam adipiscing vitae proin sagittis. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit.', '2024-05-30', '2024-05-01', '8GB', 'SSD', '256', 2);

--
-- Volcado de datos para la tabla `VersionesAppCliente`
--

INSERT INTO `VersionesAppCliente` (`ID_Version`, `Version`, `descripcion`) VALUES
(1, '1.9.1', ''),
(2, '1.9.1', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
