-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 19-10-2025 a las 18:21:38
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
-- Base de datos: `SE_Tesoreria`
--
CREATE DATABASE IF NOT EXISTS `SE_Tesoreria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `SE_Tesoreria`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caja`
--

CREATE TABLE `Caja` (
  `ID_Caja` int NOT NULL,
  `ID_Personal` int NOT NULL,
  `ID_Caja_T` int NOT NULL,
  `Descripcion` varchar(300) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Monto` decimal(14,2) DEFAULT NULL COMMENT 'Cantidad que debe tener en caja y que debe ser igual a la suma de efectivo y spei menos los gastos',
  `Abono` decimal(14,2) DEFAULT NULL,
  `Efectivo` decimal(14,2) DEFAULT NULL,
  `Tarjeta` decimal(14,2) DEFAULT NULL,
  `Gastos` decimal(14,2) DEFAULT NULL,
  `Ecologia` decimal(14,2) DEFAULT '0.00',
  `Catastro` decimal(14,2) DEFAULT '0.00',
  `Seguridad` decimal(14,2) DEFAULT '0.00',
  `Cementerio` decimal(14,2) DEFAULT '0.00',
  `PC` decimal(14,2) DEFAULT '0.00',
  `BanosP` decimal(14,2) DEFAULT '0.00',
  `Constancias` decimal(14,2) DEFAULT '0.00',
  `Licencias` decimal(14,2) DEFAULT '0.00',
  `S_Inicial` decimal(12,2) DEFAULT NULL,
  `Saldo` decimal(12,2) DEFAULT NULL,
  `Corte` int DEFAULT NULL COMMENT '0=NO, 1=SI',
  `Tip` int DEFAULT NULL COMMENT '1=Efectivo, 2=SPEI',
  `ID_Corte` int DEFAULT NULL,
  `ms` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caja_T`
--

CREATE TABLE `Caja_T` (
  `ID_Caja_T` int NOT NULL,
  `Motivo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Solicitudes`
--

CREATE TABLE `Solicitudes` (
  `ID_Solicitud` int NOT NULL,
  `Fecha_Solicitud` date DEFAULT NULL,
  `Fecha_Creacion` date DEFAULT NULL,
  `Fecha_Aceptado` datetime DEFAULT NULL,
  `Asunto` varchar(125) DEFAULT NULL,
  `ID_Colaborador` int DEFAULT NULL COMMENT 'Solicitante',
  `ID_Departamento` int DEFAULT NULL,
  `ID_Autoriza` int DEFAULT NULL COMMENT 'Autoriza',
  `Comentario` varchar(830) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Respuesta` varchar(830) DEFAULT NULL,
  `Solventacion1` varchar(255) DEFAULT NULL,
  `ID_Salida` int DEFAULT NULL COMMENT 'No es Foraneo porque si no tiene solicitud lleva 0',
  `Estatus` int DEFAULT NULL,
  `ID_Administracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Teso_Inv_Productos`
--

CREATE TABLE `Teso_Inv_Productos` (
  `ID_Producto` int NOT NULL,
  `Codigo` varchar(10) NOT NULL,
  `Nombre` varchar(350) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Descripcion` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `Fecha_Ingreso` datetime DEFAULT NULL,
  `ID_Departamento` int DEFAULT NULL,
  `Fecha_Vacio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Teso_Inv_Salida`
--

CREATE TABLE `Teso_Inv_Salida` (
  `ID_Salida` int NOT NULL,
  `ID_Colaborador` int DEFAULT NULL COMMENT 'Solicita',
  `Autoriza` int DEFAULT NULL COMMENT 'Entrega',
  `ID_Reporte` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Fecha_solicitud` datetime DEFAULT NULL,
  `Fecha_Entrega` datetime DEFAULT NULL,
  `Comentario` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Observaciones` varchar(500) DEFAULT NULL,
  `ID_Departamento` int DEFAULT NULL,
  `Evidencia` varchar(250) DEFAULT NULL,
  `Estatus` int NOT NULL,
  `Insumos` int DEFAULT NULL COMMENT '0=materiales, 1=insumos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Teso_Inv_Salida_Detalle`
--

CREATE TABLE `Teso_Inv_Salida_Detalle` (
  `ID_Salida_Detalle` int NOT NULL,
  `ID_Producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `ID_Salida` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Teso_Licencias`
--

CREATE TABLE `Teso_Licencias` (
  `ID_licencia` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Teso_Lic_Tarifa`
--

CREATE TABLE `Teso_Lic_Tarifa` (
  `ID_Lic` int NOT NULL,
  `Giro` varchar(350) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Nombre',
  `Expedicion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Nuevo',
  `Renovacion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Revalida',
  `importado` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Caja`
--
ALTER TABLE `Caja`
  ADD PRIMARY KEY (`ID_Caja`);

--
-- Indices de la tabla `Caja_T`
--
ALTER TABLE `Caja_T`
  ADD PRIMARY KEY (`ID_Caja_T`);

--
-- Indices de la tabla `Solicitudes`
--
ALTER TABLE `Solicitudes`
  ADD PRIMARY KEY (`ID_Solicitud`),
  ADD KEY `ID_personal` (`ID_Colaborador`),
  ADD KEY `ID_Autoriza` (`ID_Autoriza`),
  ADD KEY `Estatus` (`Estatus`);

--
-- Indices de la tabla `Teso_Inv_Productos`
--
ALTER TABLE `Teso_Inv_Productos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `ID_Departamento` (`ID_Departamento`);

--
-- Indices de la tabla `Teso_Inv_Salida`
--
ALTER TABLE `Teso_Inv_Salida`
  ADD PRIMARY KEY (`ID_Salida`),
  ADD KEY `ID_Colaborador` (`ID_Colaborador`,`ID_Departamento`),
  ADD KEY `ID_Departamento` (`ID_Departamento`),
  ADD KEY `Estatus` (`Estatus`),
  ADD KEY `Autoriza` (`Autoriza`);

--
-- Indices de la tabla `Teso_Inv_Salida_Detalle`
--
ALTER TABLE `Teso_Inv_Salida_Detalle`
  ADD PRIMARY KEY (`ID_Salida_Detalle`),
  ADD KEY `ID_Producto` (`ID_Producto`,`ID_Salida`),
  ADD KEY `ID_Salida` (`ID_Salida`);

--
-- Indices de la tabla `Teso_Licencias`
--
ALTER TABLE `Teso_Licencias`
  ADD PRIMARY KEY (`ID_licencia`);

--
-- Indices de la tabla `Teso_Lic_Tarifa`
--
ALTER TABLE `Teso_Lic_Tarifa`
  ADD PRIMARY KEY (`ID_Lic`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Caja`
--
ALTER TABLE `Caja`
  MODIFY `ID_Caja` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Caja_T`
--
ALTER TABLE `Caja_T`
  MODIFY `ID_Caja_T` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Solicitudes`
--
ALTER TABLE `Solicitudes`
  MODIFY `ID_Solicitud` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Teso_Inv_Productos`
--
ALTER TABLE `Teso_Inv_Productos`
  MODIFY `ID_Producto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Teso_Inv_Salida`
--
ALTER TABLE `Teso_Inv_Salida`
  MODIFY `ID_Salida` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Teso_Inv_Salida_Detalle`
--
ALTER TABLE `Teso_Inv_Salida_Detalle`
  MODIFY `ID_Salida_Detalle` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Teso_Licencias`
--
ALTER TABLE `Teso_Licencias`
  MODIFY `ID_licencia` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Teso_Lic_Tarifa`
--
ALTER TABLE `Teso_Lic_Tarifa`
  MODIFY `ID_Lic` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
