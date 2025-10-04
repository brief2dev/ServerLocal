-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
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

--
-- Base de datos: `SE_SYS`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `InventarioEquipos`
--

CREATE TABLE `InventarioEquipos` (
  `ID_Equipo` int NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descrip` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Serie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ID_Dept` int DEFAULT NULL,
  `Comentario` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Estado` int DEFAULT '1' COMMENT '0=malo, 1=bueno,',
  `Baja` int DEFAULT '0' COMMENT '0=no, 1=si',
  `Fecha_Baja` date DEFAULT NULL,
  `Ult_Coment` varchar(800) DEFAULT NULL,
  `Fecha_ulti` date DEFAULT NULL COMMENT 'Fecha de ultimo chequeo',
  `Fecha_Ingreso` date DEFAULT NULL,
  `Ram` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Disco` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Memoria` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Administracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `InventarioEquipos`
--

INSERT INTO `InventarioEquipos` (`ID_Equipo`, `Nombre`, `Descrip`, `Marca`, `Modelo`, `Serie`, `ID_Dept`, `Comentario`, `Estado`, `Baja`, `Fecha_Baja`, `Ult_Coment`, `Fecha_ulti`, `Fecha_Ingreso`, `Ram`, `Disco`, `Memoria`, `Administracion`) VALUES
(2, 'Macbook air', 'comnputadora de escritorio portatil de la marca apple', 'apple', 'air 13', 'SN', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla facilisi morbi tempus iaculis urna id volutpat lacus', 1, 1, '2024-05-30', 'Facilisi etiam dignissim diam quis enim lobortis scelerisque. Eleifend quam adipiscing vitae proin sagittis. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit.', '2024-05-30', '2024-05-01', '8GB', 'SSD', '256', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Soporte`
--

CREATE TABLE `Soporte` (
  `ID_Ticket` int NOT NULL,
  `ID_Dispo` int DEFAULT NULL COMMENT 'ID del equipo',
  `ID_Sistemas` int DEFAULT NULL COMMENT 'ID colaborador de sistemas',
  `ID_Dept` int DEFAULT NULL,
  `ID_Colaborador` int DEFAULT NULL COMMENT 'ID del colaborador que reporto',
  `Telefono` varchar(13) DEFAULT NULL,
  `Fecha_Ingreso` date DEFAULT NULL COMMENT 'Fecha en que se solicito',
  `Fecha_Pendiente` date DEFAULT NULL COMMENT 'Fecha en que se esta tarbajando',
  `Fecha_Entrega` date DEFAULT NULL COMMENT 'Fecha de entregado',
  `Estatus` int DEFAULT '1' COMMENT '0=cerrado, 1=abierto, 2=Proceso, 4 = Cancelado',
  `Tipo` varchar(25) DEFAULT NULL,
  `Detalles` varchar(800) DEFAULT NULL COMMENT 'Detalles o problema reportado',
  `Comentarios` varchar(800) DEFAULT NULL COMMENT 'Coment. finales sobe el equipo',
  `Foto_Reporte` varchar(255) DEFAULT NULL,
  `Foto_Eviden` varchar(255) DEFAULT NULL,
  `ID_Administracion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VersionesAppCliente`
--

CREATE TABLE `VersionesAppCliente` (
  `ID_Version` int NOT NULL,
  `Version` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `VersionesAppCliente`
--

INSERT INTO `VersionesAppCliente` (`ID_Version`, `Version`, `descripcion`) VALUES
(1, '1.9.1', ''),
(2, '1.9.1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WebBannerADS`
--

CREATE TABLE `WebBannerADS` (
  `ID_Banner` int NOT NULL,
  `Titulo` varchar(125) DEFAULT NULL,
  `Logo` varchar(400) DEFAULT NULL,
  `Descripcion` varchar(900) DEFAULT NULL,
  `Link` varchar(400) DEFAULT NULL,
  `Visible` int DEFAULT '1',
  `Fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WebEventos`
--

CREATE TABLE `WebEventos` (
  `ID_Evento` int NOT NULL,
  `Logo1` varchar(250) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Logo3` varchar(250) DEFAULT NULL,
  `Titulo` varchar(125) DEFAULT NULL,
  `Descrip1` varchar(850) DEFAULT NULL,
  `Descrip2` varchar(850) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Objetivo` varchar(60) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Link` varchar(250) DEFAULT NULL,
  `Tipo` int DEFAULT NULL COMMENT '1=noti,2=event,3=prog'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WebGacetas`
--

CREATE TABLE `WebGacetas` (
  `ID_Gaceta` int NOT NULL,
  `Nombre` varchar(65) NOT NULL,
  `Contenido` varchar(1200) NOT NULL,
  `Link` varchar(250) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WebImg`
--

CREATE TABLE `WebImg` (
  `ID_Img` int NOT NULL,
  `Logo` varchar(250) NOT NULL,
  `Tipo` int NOT NULL COMMENT '1=banner, 2=call',
  `Titulo` varchar(500) DEFAULT NULL,
  `Visible` int DEFAULT '1' COMMENT '0=no, 1=si'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WebIndex`
--

CREATE TABLE `WebIndex` (
  `ID_Index` int NOT NULL,
  `Logo1` varchar(250) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Logo3` varchar(250) DEFAULT NULL,
  `Logo4` varchar(250) DEFAULT NULL,
  `Logo5` varchar(250) DEFAULT NULL,
  `Mision` varchar(850) DEFAULT NULL,
  `Vision` varchar(850) DEFAULT NULL,
  `Call_Titulo` varchar(35) DEFAULT NULL,
  `Call_Sub` varchar(35) DEFAULT NULL,
  `Call_Logo` varchar(250) DEFAULT NULL,
  `Call_Link` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WebNoticias`
--

CREATE TABLE `WebNoticias` (
  `ID_Noticia` int NOT NULL,
  `Logo1` varchar(250) DEFAULT NULL,
  `Titulo` varchar(150) DEFAULT NULL,
  `Descrip1` varchar(1800) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Descrip2` varchar(1800) DEFAULT NULL,
  `Fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `WebProgramSocial`
--

CREATE TABLE `WebProgramSocial` (
  `ID_Program` int NOT NULL,
  `Logo1` varchar(250) DEFAULT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Dirigido` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Descripcion` varchar(750) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Requisitos` varchar(250) DEFAULT NULL,
  `Bases` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `InventarioEquipos`
--
ALTER TABLE `InventarioEquipos`
  ADD PRIMARY KEY (`ID_Equipo`);

--
-- Indices de la tabla `Soporte`
--
ALTER TABLE `Soporte`
  ADD PRIMARY KEY (`ID_Ticket`);

--
-- Indices de la tabla `VersionesAppCliente`
--
ALTER TABLE `VersionesAppCliente`
  ADD PRIMARY KEY (`ID_Version`);

--
-- Indices de la tabla `WebBannerADS`
--
ALTER TABLE `WebBannerADS`
  ADD PRIMARY KEY (`ID_Banner`);

--
-- Indices de la tabla `WebEventos`
--
ALTER TABLE `WebEventos`
  ADD PRIMARY KEY (`ID_Evento`);

--
-- Indices de la tabla `WebGacetas`
--
ALTER TABLE `WebGacetas`
  ADD PRIMARY KEY (`ID_Gaceta`);

--
-- Indices de la tabla `WebImg`
--
ALTER TABLE `WebImg`
  ADD PRIMARY KEY (`ID_Img`);

--
-- Indices de la tabla `WebIndex`
--
ALTER TABLE `WebIndex`
  ADD PRIMARY KEY (`ID_Index`);

--
-- Indices de la tabla `WebNoticias`
--
ALTER TABLE `WebNoticias`
  ADD PRIMARY KEY (`ID_Noticia`);

--
-- Indices de la tabla `WebProgramSocial`
--
ALTER TABLE `WebProgramSocial`
  ADD PRIMARY KEY (`ID_Program`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `InventarioEquipos`
--
ALTER TABLE `InventarioEquipos`
  MODIFY `ID_Equipo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Soporte`
--
ALTER TABLE `Soporte`
  MODIFY `ID_Ticket` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `VersionesAppCliente`
--
ALTER TABLE `VersionesAppCliente`
  MODIFY `ID_Version` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `WebBannerADS`
--
ALTER TABLE `WebBannerADS`
  MODIFY `ID_Banner` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `WebEventos`
--
ALTER TABLE `WebEventos`
  MODIFY `ID_Evento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `WebGacetas`
--
ALTER TABLE `WebGacetas`
  MODIFY `ID_Gaceta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `WebImg`
--
ALTER TABLE `WebImg`
  MODIFY `ID_Img` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `WebIndex`
--
ALTER TABLE `WebIndex`
  MODIFY `ID_Index` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `WebNoticias`
--
ALTER TABLE `WebNoticias`
  MODIFY `ID_Noticia` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `WebProgramSocial`
--
ALTER TABLE `WebProgramSocial`
  MODIFY `ID_Program` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
