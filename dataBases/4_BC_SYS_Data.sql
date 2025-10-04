-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
-
-- Servidor: localhost
-- Tiempo de generación: 16-09-2025 a las 10:04:36
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

INSERT INTO `InventarioEquipos` (`ID_Equipo`, `Nombre`, `Descrip`, `Marca`, `Modelo`, `Serie`, `ID_Dept`, `Comentario`, `Estado`, `Baja`, `Fecha_Baja`, `Ult_Coment`, `Fecha_ulti`, `Fecha_Ingreso`, `Ram`, `Disco`, `Memoria`, `Administracion`) VALUES
(1, 'Macbook air', 'comnputadora de escritorio portatil de la marca apple', 'apple', 'air 13', 'SN', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla facilisi morbi tempus iaculis urna id volutpat lacus', 1, 1, '2024-05-30', 'Facilisi etiam dignissim diam quis enim lobortis scelerisque. Eleifend quam adipiscing vitae proin sagittis. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit.', '2024-05-30', '2024-05-01', '8GB', 'SSD', '256', 1);

INSERT INTO `VersionesAppCliente` (`ID_Version`, `Version`, `descripcion`) VALUES
(1, '1.9.1', ''),
(2, '1.9.1', '');
COMMIT;