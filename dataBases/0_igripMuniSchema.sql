-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 19-10-2025 a las 18:19:27
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
-- Base de datos: `SE_Municipio`
--
CREATE DATABASE IF NOT EXISTS `SE_Municipio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `SE_Municipio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Administraciones`
--

CREATE TABLE `Administraciones` (
  `ID_Administracion` int NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Partido` varchar(80) DEFAULT NULL,
  `Alcalde` varchar(80) DEFAULT NULL,
  `Suplente` varchar(60) DEFAULT NULL,
  `Secretario` varchar(80) DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `RFC` varchar(30) DEFAULT NULL,
  `CP` varchar(6) DEFAULT NULL,
  `FotoAlcalde` varchar(550) DEFAULT NULL,
  `Logo` varchar(550) DEFAULT NULL,
  `Portada` varchar(550) DEFAULT NULL,
  `Licencia` int DEFAULT '0' COMMENT 'Licencia de ausencia 0=no, 1=SI',
  `Prefijo` varchar(20) DEFAULT NULL,
  `PreUser` varchar(10) DEFAULT NULL,
  `Web` varchar(125) DEFAULT NULL,
  `Tel` varchar(15) DEFAULT NULL,
  `Color` varchar(15) DEFAULT NULL,
  `ColorDark` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Fecha_Admin` varchar(40) DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Termino` date DEFAULT NULL,
  `Concluido` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Api_Boleano`
--

CREATE TABLE `Api_Boleano` (
  `ID_Boleano` int NOT NULL,
  `Nombre` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Api_Colonias`
--

CREATE TABLE `Api_Colonias` (
  `ID_Colonia` int NOT NULL,
  `Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `API_Comisarias`
--

CREATE TABLE `API_Comisarias` (
  `ID_Comisaria` int NOT NULL,
  `Nombre` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Api_Estatus`
--

CREATE TABLE `Api_Estatus` (
  `ID_Estatus` int NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Api_Pago`
--

CREATE TABLE `Api_Pago` (
  `ID_Tipo_Pago` int NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciudadanos`
--

CREATE TABLE `Ciudadanos` (
  `ID_Ciudadano` int NOT NULL,
  `Nombres` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ApellidoP` varchar(40) DEFAULT NULL,
  `ApellidoM` varchar(40) DEFAULT NULL,
  `Direccion` varchar(70) DEFAULT NULL,
  `NCasa` varchar(30) DEFAULT NULL,
  `ID_Colonia` int DEFAULT NULL,
  `Latitud` varchar(30) DEFAULT NULL,
  `Longitud` varchar(30) DEFAULT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Correo` varchar(70) DEFAULT NULL,
  `Foto` varchar(500) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `ClaveElector` varchar(30) DEFAULT NULL,
  `RFC` varchar(15) DEFAULT NULL,
  `Curp` varchar(30) DEFAULT NULL,
  `Foraneo` int DEFAULT NULL,
  `ID_Sexo` int DEFAULT NULL,
  `ID_Facebook` varchar(500) DEFAULT NULL,
  `ID_Firebase` varchar(300) DEFAULT NULL,
  `Importado` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciudadanos_Card`
--

CREATE TABLE `Ciudadanos_Card` (
  `ID_Card` int NOT NULL,
  `Numero` varchar(17) DEFAULT NULL,
  `Mes` int DEFAULT NULL,
  `Ano` int DEFAULT NULL,
  `CVV` int DEFAULT NULL,
  `Tipo` varchar(30) DEFAULT NULL COMMENT 'VISA, Master, AMEX',
  `ID_Ciudadano` int DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Colaboradores`
--

CREATE TABLE `Colaboradores` (
  `ID_Colaborador` int NOT NULL,
  `ID_Ciudadano` int DEFAULT NULL,
  `ID_Departamento` int DEFAULT NULL,
  `ID_Puesto` int DEFAULT NULL,
  `Usuario` varchar(40) DEFAULT NULL,
  `Pass` varchar(65) DEFAULT NULL,
  `PsD` varchar(10) DEFAULT NULL,
  `FechaRegistro` date DEFAULT NULL,
  `Acceso` int DEFAULT NULL COMMENT 'Indica si tendra acceso 1=NO, 2=SI',
  `Baja` int NOT NULL,
  `FechaBaja` date DEFAULT NULL,
  `Comentario` varchar(500) DEFAULT NULL,
  `Escolaridad` varchar(50) DEFAULT NULL,
  `Cedula` varchar(20) DEFAULT NULL,
  `Correo` varchar(250) DEFAULT NULL,
  `Foto` varchar(350) DEFAULT NULL,
  `FB` varchar(250) DEFAULT NULL,
  `TW` varchar(250) DEFAULT NULL,
  `INST` varchar(250) DEFAULT NULL,
  `Sueldo` double DEFAULT NULL,
  `ID_Administracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamentos`
--

CREATE TABLE `Departamentos` (
  `ID_Departamento` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Prefijo` varchar(20) DEFAULT NULL,
  `Interno` int DEFAULT NULL,
  `Logo1` varchar(250) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Descripcion` varchar(850) DEFAULT NULL,
  `Funciones` varchar(600) DEFAULT NULL,
  `Servidor` varchar(100) DEFAULT NULL,
  `Mail` varchar(40) DEFAULT NULL,
  `Pass_Mail` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Facebook` varchar(350) DEFAULT NULL,
  `Insta` varchar(350) DEFAULT NULL,
  `Twitter` varchar(350) DEFAULT NULL,
  `Visible` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Puestos`
--

CREATE TABLE `Puestos` (
  `ID_Puesto` int NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reportes_Ciudadanos`
--

CREATE TABLE `Reportes_Ciudadanos` (
  `ID_Reporte` int NOT NULL,
  `ID_Ciudadano` int NOT NULL,
  `ID_Estatus` int NOT NULL,
  `ID_Departamento` int NOT NULL,
  `ID_Colaborador` int DEFAULT NULL COMMENT 'debe ser id de colaborador pero se guarda el id del ciudadano que es colaborador',
  `ID_Colonia` int DEFAULT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Latitud` varchar(40) NOT NULL,
  `Longitud` varchar(40) NOT NULL,
  `Fecha_Recepcion` date DEFAULT NULL,
  `Fecha_Proceso` date DEFAULT NULL,
  `Fecha_Final` date DEFAULT NULL,
  `Foto` varchar(600) DEFAULT NULL,
  `Evidencia` varchar(600) DEFAULT NULL,
  `Comentario` varchar(450) DEFAULT NULL,
  `ID_Administracion` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sexo`
--

CREATE TABLE `Sexo` (
  `ID_Sexo` int NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ZMisc`
--

CREATE TABLE `ZMisc` (
  `ID_Misc` int NOT NULL,
  `ID_Dep` int NOT NULL,
  `ID_Colaborador` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Corte` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Administraciones`
--
ALTER TABLE `Administraciones`
  ADD PRIMARY KEY (`ID_Administracion`);

--
-- Indices de la tabla `Api_Boleano`
--
ALTER TABLE `Api_Boleano`
  ADD PRIMARY KEY (`ID_Boleano`);

--
-- Indices de la tabla `Api_Colonias`
--
ALTER TABLE `Api_Colonias`
  ADD PRIMARY KEY (`ID_Colonia`);

--
-- Indices de la tabla `API_Comisarias`
--
ALTER TABLE `API_Comisarias`
  ADD PRIMARY KEY (`ID_Comisaria`);

--
-- Indices de la tabla `Api_Estatus`
--
ALTER TABLE `Api_Estatus`
  ADD PRIMARY KEY (`ID_Estatus`);

--
-- Indices de la tabla `Api_Pago`
--
ALTER TABLE `Api_Pago`
  ADD PRIMARY KEY (`ID_Tipo_Pago`);

--
-- Indices de la tabla `Ciudadanos`
--
ALTER TABLE `Ciudadanos`
  ADD PRIMARY KEY (`ID_Ciudadano`),
  ADD KEY `ID_Colonia` (`ID_Colonia`),
  ADD KEY `ID_Sexo` (`ID_Sexo`),
  ADD KEY `Foraneo` (`Foraneo`);

--
-- Indices de la tabla `Ciudadanos_Card`
--
ALTER TABLE `Ciudadanos_Card`
  ADD PRIMARY KEY (`ID_Card`),
  ADD KEY `ID_Ciudadano` (`ID_Ciudadano`);

--
-- Indices de la tabla `Colaboradores`
--
ALTER TABLE `Colaboradores`
  ADD PRIMARY KEY (`ID_Colaborador`),
  ADD KEY `ID_Ciudadano` (`ID_Ciudadano`),
  ADD KEY `ID_Departamento` (`ID_Departamento`),
  ADD KEY `ID_Puesto` (`ID_Puesto`),
  ADD KEY `Baja` (`Baja`),
  ADD KEY `Acceso` (`Acceso`);

--
-- Indices de la tabla `Departamentos`
--
ALTER TABLE `Departamentos`
  ADD PRIMARY KEY (`ID_Departamento`),
  ADD KEY `Interno` (`Interno`);

--
-- Indices de la tabla `Puestos`
--
ALTER TABLE `Puestos`
  ADD PRIMARY KEY (`ID_Puesto`);

--
-- Indices de la tabla `Reportes_Ciudadanos`
--
ALTER TABLE `Reportes_Ciudadanos`
  ADD PRIMARY KEY (`ID_Reporte`),
  ADD KEY `ID_Ciudadano` (`ID_Ciudadano`),
  ADD KEY `ID_Estatus` (`ID_Estatus`),
  ADD KEY `ID_Departamento` (`ID_Departamento`),
  ADD KEY `ID_Colaborador` (`ID_Colaborador`),
  ADD KEY `ID_Colonia` (`ID_Colonia`);

--
-- Indices de la tabla `Sexo`
--
ALTER TABLE `Sexo`
  ADD PRIMARY KEY (`ID_Sexo`);

--
-- Indices de la tabla `ZMisc`
--
ALTER TABLE `ZMisc`
  ADD PRIMARY KEY (`ID_Misc`),
  ADD KEY `ID_Dep` (`ID_Dep`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Administraciones`
--
ALTER TABLE `Administraciones`
  MODIFY `ID_Administracion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Api_Boleano`
--
ALTER TABLE `Api_Boleano`
  MODIFY `ID_Boleano` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Api_Colonias`
--
ALTER TABLE `Api_Colonias`
  MODIFY `ID_Colonia` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `API_Comisarias`
--
ALTER TABLE `API_Comisarias`
  MODIFY `ID_Comisaria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Api_Estatus`
--
ALTER TABLE `Api_Estatus`
  MODIFY `ID_Estatus` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Api_Pago`
--
ALTER TABLE `Api_Pago`
  MODIFY `ID_Tipo_Pago` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Ciudadanos`
--
ALTER TABLE `Ciudadanos`
  MODIFY `ID_Ciudadano` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Ciudadanos_Card`
--
ALTER TABLE `Ciudadanos_Card`
  MODIFY `ID_Card` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Colaboradores`
--
ALTER TABLE `Colaboradores`
  MODIFY `ID_Colaborador` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Departamentos`
--
ALTER TABLE `Departamentos`
  MODIFY `ID_Departamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Puestos`
--
ALTER TABLE `Puestos`
  MODIFY `ID_Puesto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Reportes_Ciudadanos`
--
ALTER TABLE `Reportes_Ciudadanos`
  MODIFY `ID_Reporte` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Sexo`
--
ALTER TABLE `Sexo`
  MODIFY `ID_Sexo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ZMisc`
--
ALTER TABLE `ZMisc`
  MODIFY `ID_Misc` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Ciudadanos`
--
ALTER TABLE `Ciudadanos`
  ADD CONSTRAINT `ciudadanos_ibfk_1` FOREIGN KEY (`ID_Colonia`) REFERENCES `Api_Colonias` (`ID_Colonia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ciudadanos_ibfk_2` FOREIGN KEY (`ID_Sexo`) REFERENCES `Sexo` (`ID_Sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ciudadanos_ibfk_3` FOREIGN KEY (`Foraneo`) REFERENCES `Api_Boleano` (`ID_Boleano`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Colaboradores`
--
ALTER TABLE `Colaboradores`
  ADD CONSTRAINT `colaboradores_ibfk_1` FOREIGN KEY (`ID_Ciudadano`) REFERENCES `Ciudadanos` (`ID_Ciudadano`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_ibfk_2` FOREIGN KEY (`ID_Departamento`) REFERENCES `Departamentos` (`ID_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_ibfk_3` FOREIGN KEY (`ID_Puesto`) REFERENCES `Puestos` (`ID_Puesto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_ibfk_4` FOREIGN KEY (`Baja`) REFERENCES `Api_Boleano` (`ID_Boleano`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_ibfk_5` FOREIGN KEY (`Acceso`) REFERENCES `Api_Boleano` (`ID_Boleano`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
