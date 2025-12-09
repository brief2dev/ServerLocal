-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 09-12-2025 a las 14:24:27
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
-- Base de datos: `zkke`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Abonos`
--

CREATE TABLE `Abonos` (
  `ID_Abono` int NOT NULL,
  `ID_Caja` int DEFAULT NULL,
  `Monto` double DEFAULT NULL COMMENT 'Abono',
  `Sald_ant` double DEFAULT NULL COMMENT 'Saldo anteriror antes del abono',
  `Saldo_pen` double DEFAULT NULL COMMENT 'Saldo actual despues del abono',
  `ID_Cliente` int NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Medio` int DEFAULT NULL,
  `Estado` int DEFAULT '0' COMMENT '0=abierto, 1 cerrado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Banner`
--

CREATE TABLE `Banner` (
  `ID_Banner` int NOT NULL,
  `imagen` varchar(900) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Banner`
--

INSERT INTO `Banner` (`ID_Banner`, `imagen`, `createdAt`) VALUES
(14, 'https://blitzc0de.com/assets/images/2.jpg', '2024-04-29 10:04:55'),
(18, 'https://blitzc0de.com/assets/images/3.jpg', '2024-04-29 10:32:56'),
(36, 'https://sys.powersports.top/lib/Online/banners/67c7949415a65_w2.jpg', '2025-03-05 06:02:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caja`
--

CREATE TABLE `Caja` (
  `ID_Caja` int NOT NULL,
  `ID_Personal` int DEFAULT NULL,
  `ID_Caja_T` int DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  `Descripcion` varchar(160) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Monto` double NOT NULL,
  `Abono` decimal(8,2) DEFAULT NULL,
  `Efectivo` decimal(8,2) DEFAULT NULL,
  `Tarjeta` decimal(8,2) DEFAULT NULL,
  `Gastos` decimal(8,2) DEFAULT NULL,
  `S_Inicial` decimal(8,2) DEFAULT NULL,
  `T_Ventas` int DEFAULT NULL,
  `Comprobante` mediumblob,
  `Saldo` decimal(10,0) DEFAULT NULL,
  `Cort` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Saldo_Inicial` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Tip` int DEFAULT NULL COMMENT '1=efectivo 2=banco',
  `idcorte` int DEFAULT NULL,
  `ms` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Caja`
--

INSERT INTO `Caja` (`ID_Caja`, `ID_Personal`, `ID_Caja_T`, `ID_Sucursal`, `Descripcion`, `Fecha`, `Monto`, `Abono`, `Efectivo`, `Tarjeta`, `Gastos`, `S_Inicial`, `T_Ventas`, `Comprobante`, `Saldo`, `Cort`, `Saldo_Inicial`, `Tip`, `idcorte`, `ms`) VALUES
(1, 7, 1, 1, 'Saldo inicial', '2023-05-31 14:04:07', 550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 8, NULL),
(2, 7, 1, 1, 'Dinero para renta del local', '2023-06-19 11:21:20', 3000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 8, NULL),
(3, 7, 2, 1, 'Internet del local ', '2023-06-19 13:02:30', 350, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 8, NULL),
(4, 7, 1, 1, 'Abono del Credito con folio: 1 del Cliente: Mariel', '2023-06-20 12:18:05', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 2, 8, NULL),
(5, 7, 1, 1, 'Abono del Credito con folio: 1 del Cliente: Mariel', '2023-06-24 11:46:12', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 8, NULL),
(6, 13, 1, 1, 'Recarga 9971112778 - $200', '2023-06-25 10:49:00', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 8, NULL),
(7, 7, 2, 1, 'Transferencia a Cta MP', '2023-06-25 11:28:56', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 8, NULL),
(8, 13, 2, 1, 'Retito y corte de caja ', '2023-06-25 11:51:36', 6192.96, 3220.00, 3522.96, 1774.60, 550.00, NULL, 3, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(9, 13, 1, 1, 'Saldo para cambio ', '2023-06-25 12:34:21', 550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 21, NULL),
(10, 7, 1, 1, 'Abono del Credito con folio: 2 del Cliente: Isabel ', '2023-06-28 20:56:24', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 21, NULL),
(11, 7, 1, 1, 'Abono del Credito con folio: 1 del Cliente: Mariel', '2023-07-03 13:39:02', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 21, NULL),
(12, 7, 1, 1, 'Abono del Credito con folio: 2 del Cliente: Isabel ', '2023-07-10 11:54:35', 425, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 21, NULL),
(13, 13, 1, 1, 'Abono del Credito con folio: 1 del Cliente: Mariel', '2023-07-19 12:09:34', 230, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 2, 21, NULL),
(15, 7, 1, 1, 'Abono del Credito con folio: 6 del Cliente: Mariel', '2024-10-16 08:10:17', 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 21, NULL),
(16, 7, 1, 1, 'sddsxg ', '2025-03-10 21:26:01', 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 21, NULL),
(17, 7, 1, 1, 'initi', '2025-03-10 21:26:22', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 21, NULL),
(18, 7, 1, 1, 'teste', '2025-05-03 20:29:47', 140.55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 21, NULL),
(19, 7, 1, 1, 'wqd2wdswed', '2025-05-05 16:23:01', 11.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 21, NULL),
(20, 7, 2, 1, 'jdwefjedwkk', '2025-05-05 16:30:42', 450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 21, NULL),
(21, 7, 2, 1, 'Retito y corte de caja ', '2025-05-05 16:50:05', 1072.05, 1022.05, 500.00, 0.00, 450.00, NULL, 6, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(22, 7, 1, 1, 'Caja ', '2025-05-05 17:04:47', 670, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 32, NULL),
(23, 7, 2, 1, 'desayuno', '2025-05-05 17:10:24', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 32, NULL),
(24, 13, 1, 1, 'deuda', '2025-05-05 17:37:28', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 32, NULL),
(25, 13, 1, 1, 'eeeee', '2025-05-05 17:38:12', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 32, NULL),
(26, 7, 1, 1, 'wwu', '2025-05-05 18:02:38', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 32, NULL),
(27, 13, 2, 1, 'coca', '2025-05-05 18:03:32', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 32, NULL),
(32, 7, 2, 1, 'Retito y corte de caja ', '2025-06-23 18:32:13', 8930.17, 1094.42, 7888.75, 0.00, 53.00, NULL, 13, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(36, 7, 2, 1, 'Retito y corte de caja ', '2025-08-04 21:32:47', 3309.42, 1009.13, 2300.29, 0.00, 0.00, NULL, 4, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(37, 7, 1, 1, 'caja', '2025-08-04 21:37:16', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 42, NULL),
(38, 7, 1, 1, 'deuda refresco', '2025-08-04 21:38:00', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 42, NULL),
(39, 7, 1, 1, 'sdssd', '2025-08-04 21:59:08', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 42, NULL),
(40, 7, 1, 1, 'no se', '2025-08-04 22:01:58', 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 42, NULL),
(41, 7, 2, 1, 'cerillo', '2025-08-04 22:02:43', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 42, NULL),
(46, 7, 1, 1, 'dsfds', '2025-11-03 23:30:07', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 49, NULL),
(47, 7, 1, 1, 'fdgdfg', '2025-11-03 23:31:55', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 49, NULL),
(48, 7, 2, 1, 'gbgfbg', '2025-11-03 23:32:09', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 49, NULL),
(49, 7, 2, 1, 'Retito y corte de caja ', '2025-11-03 23:38:18', 707.71, 150.00, 0.00, 0.00, 5.00, NULL, 2, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(50, 7, 1, 1, '3', '2025-11-03 23:59:56', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 54, NULL),
(51, 7, 1, 1, 'r', '2025-11-04 00:00:03', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 54, NULL),
(52, 7, 2, 1, 'edd', '2025-11-04 00:00:11', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 54, NULL),
(54, 7, 2, 1, 'Retito y corte de caja ', '2025-11-04 00:10:03', 577.71, 20.00, 562.71, 37.29, 5.00, NULL, 2, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(59, 7, 1, 1, 'Abono del Credito con folio: 13 del Cliente: Mariel', '2025-11-04 17:38:05', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 60, NULL),
(60, 7, 2, 1, 'Retito y corte de caja ', '2025-11-04 17:44:10', 39.29, 2.00, 37.29, 0.00, 0.00, NULL, 1, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(61, 7, 1, 1, 'Liquidación del Apartado del Cliente: Mariel', '2025-11-04 18:14:20', 598, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 63, NULL),
(62, 7, 1, 1, 'Liquidación del Apartado del Cliente: Publico', '2025-11-05 13:32:18', 560.71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 63, NULL),
(63, 7, 2, 1, 'Retito y corte de caja ', '2025-11-05 14:09:49', 2284.13, 1158.71, 1125.42, 0.00, 0.00, NULL, 2, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(64, 7, 1, 1, 'Liquidación del Apartado del Cliente: Mariel', '2025-11-05 22:18:21', -14.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 66, NULL),
(65, 7, 1, 1, 'Liquidación del Apartado del Cliente: Mariel', '2025-11-05 22:19:39', 512.71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 2, 66, NULL),
(66, 7, 2, 1, 'Retito y corte de caja ', '2025-11-05 22:19:49', 681.71, -14.57, 696.28, 0.00, 0.00, NULL, 5, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(67, 7, 1, 1, 'Abono del Credito con folio: 19 del Cliente: Isabel ', '2025-11-05 22:24:59', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 70, NULL),
(68, 7, 2, 1, 'coca', '2025-11-05 22:25:48', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 70, NULL),
(69, 7, 1, 1, 'Abono del Credito con folio: 19 del Cliente: Isabel ', '2025-11-05 22:26:45', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 2, 70, NULL),
(70, 7, 2, 1, 'Retito y corte de caja ', '2025-11-05 23:13:58', 568.3, 100.00, 478.30, 37.29, 10.00, NULL, 2, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(71, 7, 1, 1, 'Abono del Credito con folio: 19 del Cliente: Isabel ', '2025-11-06 13:58:38', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caja_T`
--

CREATE TABLE `Caja_T` (
  `ID_Caja_T` int NOT NULL,
  `Motivo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Caja_T`
--

INSERT INTO `Caja_T` (`ID_Caja_T`, `Motivo`) VALUES
(1, 'Ingreso'),
(2, 'Retiro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE `Categorias` (
  `ID_Categoria` int NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `Descripcion` varchar(750) DEFAULT NULL,
  `Importado` varchar(30) DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Categorias`
--

INSERT INTO `Categorias` (`ID_Categoria`, `Nombre`, `Descripcion`, `Importado`, `ID_Sucursal`) VALUES
(1, 'BLUSAS', 'Damas', NULL, 1),
(2, 'PANTALONES', 'Dama', NULL, 1),
(3, 'CALZADO', 'Éngloba los zapatos de distintas marcas', NULL, 1),
(4, 'ACCESORIOS ', '', NULL, 1),
(5, 'ROPA ', '', NULL, 1),
(6, 'SNACK', 'Refescos, Papitas etc.', NULL, 1),
(7, 'qqqq', 'sssssss', NULL, 1),
(8, 'JD KAS ', 'BKJS CBLJBALJVCBBLJABVKLJBDSKJL P;OHBCVKJSBND', NULL, 1),
(9, 'DETALLES DE CAT', 'DKD', NULL, 1),
(10, 'CTTEGORRIASS', 'DEMOSTRATIVA', NULL, 1),
(11, 'SDSQQQQWQWQWQWQ', 'SDDSCS', NULL, 1),
(12, 'EWE', 'WEWWE', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `ID_Cliente` int NOT NULL,
  `Nombres` varchar(120) NOT NULL,
  `Apellidos` varchar(120) DEFAULT NULL,
  `Correo` varchar(40) DEFAULT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Direccion` varchar(40) DEFAULT NULL,
  `CP` int DEFAULT NULL,
  `Fecha_Registro` date DEFAULT NULL,
  `visible` int DEFAULT '1',
  `SLD` double DEFAULT '0' COMMENT 'Credito que debe',
  `Credito` double DEFAULT NULL COMMENT 'Credito restante',
  `Tope_Credito` double DEFAULT NULL COMMENT 'Limite de credito',
  `Premium` int DEFAULT NULL COMMENT '0=NO,1=SI',
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`ID_Cliente`, `Nombres`, `Apellidos`, `Correo`, `Telefono`, `Direccion`, `CP`, `Fecha_Registro`, `visible`, `SLD`, `Credito`, `Tope_Credito`, `Premium`, `ID_Sucursal`) VALUES
(1, 'Publico', 'General', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1),
(2, 'Mariel', 'Santos', NULL, '9971135089', 'C 43 x 24a y 26', NULL, '2022-10-22', 1, 26, 2300, 2300, 1, 1),
(3, 'Laura', 'Segura Canul', NULL, '9991110212', 'C 17 x 24 y 26 Ticul', NULL, '2023-06-21', 0, 0, 0, 0, 0, 1),
(4, 'Isabel ', 'May Salazar', NULL, '9971112778', 'C 43 x 24a y 26', NULL, '2023-06-21', 1, 0, 0, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigos`
--

CREATE TABLE `codigos` (
  `idCodigo` int NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descuento` int DEFAULT '0',
  `ID_Sucursal` int DEFAULT NULL,
  `FechaLimite` date DEFAULT NULL,
  `Estatus` int DEFAULT NULL COMMENT '0=Vencido, 1=Activo	',
  `Usos` int DEFAULT NULL,
  `Limite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `codigos`
--

INSERT INTO `codigos` (`idCodigo`, `codigo`, `descuento`, `ID_Sucursal`, `FechaLimite`, `Estatus`, `Usos`, `Limite`) VALUES
(1, 'were', 20, NULL, '2025-11-11', 1, 299, 500),
(2, 'fin', 50, NULL, '2025-11-20', 0, 15, 20),
(3, 'tryyhtr', 80, NULL, '2025-11-20', 1, 0, 20),
(4, 'QWERTY', 90, NULL, '2025-11-20', 0, 0, 12),
(5, 'were', 20, NULL, '2025-11-11', 1, 299, 500),
(6, 'fin', 50, NULL, '2025-11-20', 0, 15, 20),
(7, 'tryyhtr', 80, NULL, '2025-11-20', 1, 0, 20),
(8, 'QWERTY', 90, NULL, '2025-11-20', 0, 0, 12),
(9, 'were', 20, NULL, '2025-11-11', 1, 299, 500),
(10, 'fin', 50, NULL, '2025-11-20', 0, 15, 20),
(11, 'tryyhtr', 80, NULL, '2025-11-20', 1, 0, 20),
(12, 'QWERTY', 90, NULL, '2025-11-20', 0, 0, 12),
(13, 'were', 20, NULL, '2025-11-11', 1, 299, 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cuentas_Prove`
--

CREATE TABLE `Cuentas_Prove` (
  `ID_Cuentas` int NOT NULL,
  `ID_Proveedor` int NOT NULL,
  `Banco` varchar(30) NOT NULL,
  `Numero` varchar(16) NOT NULL,
  `Targeta` varchar(16) NOT NULL,
  `Clabe` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cupon`
--

CREATE TABLE `Cupon` (
  `ID_Cupon` int NOT NULL,
  `ID_Venta` bigint UNSIGNED DEFAULT NULL,
  `Fecha_Gen` date DEFAULT NULL,
  `Fecha_Exp` date DEFAULT NULL,
  `Valor` int DEFAULT NULL,
  `Usado` int DEFAULT '0',
  `ID_MD` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Cupon`
--

INSERT INTO `Cupon` (`ID_Cupon`, `ID_Venta`, `Fecha_Gen`, `Fecha_Exp`, `Valor`, `Usado`, `ID_MD`) VALUES
(1, 48, '2025-08-04', '2025-09-04', 675, 1, NULL),
(2, 66, '2025-11-05', '2025-12-05', 488, 1, NULL),
(3, 67, '2025-11-05', '2025-12-05', 525, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Historial_Pagos`
--

CREATE TABLE `Historial_Pagos` (
  `ID_HistPagos` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  `ID_Financiado` int DEFAULT NULL COMMENT 'ID de la venta finaciada(credito o apartado)',
  `ID_Personal` int DEFAULT NULL,
  `Anterior` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Pendiente` double DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Medio` int DEFAULT NULL COMMENT '1=Efectivo, 2=Tarjeta',
  `estatus` int DEFAULT NULL COMMENT '0=deuda, 1=liquidado',
  `Tipo` int DEFAULT NULL COMMENT '2= venta, 3 = credito'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Historial_Pagos`
--

INSERT INTO `Historial_Pagos` (`ID_HistPagos`, `ID_Cliente`, `ID_Financiado`, `ID_Personal`, `Anterior`, `Abono`, `Pendiente`, `Fecha`, `ID_Medio`, `estatus`, `Tipo`) VALUES
(9, 2, NULL, 7, 512.71, 512.71, 0, '2025-06-21 17:21:09', 2, 1, NULL),
(10, 1, NULL, 7, 442.71, 442.71, 0, '2025-06-23 18:12:38', 1, 1, NULL),
(11, 2, NULL, 7, 502.71, 502.71, 0, '2025-06-23 18:26:36', 2, 1, NULL),
(12, 2, NULL, 7, 562.71, 562.71, 0, '2025-06-23 18:31:41', 1, 1, NULL),
(13, 2, 11, 7, 562.71, NULL, 562.71, '2025-06-23 19:05:29', 1, NULL, NULL),
(14, 2, 11, 7, 562.71, NULL, 562.71, '2025-06-23 19:06:06', 1, NULL, NULL),
(15, 2, 11, 7, 562.71, 2.71, 560, '2025-06-23 19:08:32', 1, NULL, NULL),
(16, 2, 11, 7, 560, 10, 550, '2025-06-23 19:18:05', 2, NULL, NULL),
(17, 2, 11, 7, 550, 1, 549, '2025-07-05 18:03:00', 1, NULL, NULL),
(18, 2, 11, 7, 549, 1, 548, '2025-11-04 00:40:15', 1, NULL, NULL),
(19, 2, NULL, 7, 548, 548, 0, '2025-11-04 00:40:52', 2, 1, NULL),
(20, 2, 13, 7, 562.71, 2, 560.71, '2025-11-04 17:38:05', 1, NULL, NULL),
(21, 2, NULL, 7, 598, 598, 0, '2025-11-04 18:14:20', 1, 1, NULL),
(22, 1, NULL, 7, 560.71, 560.71, 0, '2025-11-05 13:32:18', 1, 1, NULL),
(23, 2, NULL, 7, -14.57, -14.57, 0, '2025-11-05 22:18:21', 1, 1, NULL),
(24, 2, NULL, 7, 512.71, 512.71, 0, '2025-11-05 22:19:39', 2, 1, NULL),
(25, 4, 19, 7, 324.58, 100, 224.58, '2025-11-05 22:24:59', 1, NULL, NULL),
(26, 4, 19, 7, 224.58, 50, 174.58, '2025-11-05 22:26:45', 2, NULL, NULL),
(27, 4, 19, 7, 174.58, 4, 170.58, '2025-11-06 13:58:38', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medio_Pago`
--

CREATE TABLE `Medio_Pago` (
  `ID_Medio` int NOT NULL,
  `Tipo` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Medio_Pago`
--

INSERT INTO `Medio_Pago` (`ID_Medio`, `Tipo`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta / SPEI'),
(3, 'Creditos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `M_Abonos`
--

CREATE TABLE `M_Abonos` (
  `ID_Abono` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Monto` decimal(10,0) DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `ID_Mutualista` int DEFAULT NULL COMMENT 'ID_Detalles Mutualista',
  `Finalizado` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `M_MDetalles`
--

CREATE TABLE `M_MDetalles` (
  `ID_Detalle` int NOT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `ID_Mutualista` int DEFAULT NULL,
  `Cantidad` int DEFAULT '0',
  `Tiempo_Pago` varchar(11) DEFAULT NULL COMMENT '7=Semanal, 14=catorsenal,\r\n30 = mensual',
  `Numero` int DEFAULT NULL,
  `ID_Cupon` int DEFAULT NULL,
  `Entregado` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `M_MDetalles`
--

INSERT INTO `M_MDetalles` (`ID_Detalle`, `ID_Cliente`, `ID_Mutualista`, `Cantidad`, `Tiempo_Pago`, `Numero`, `ID_Cupon`, `Entregado`) VALUES
(1, 0, 1, 0, '0', NULL, NULL, 0),
(2, 0, 1, 0, '0', NULL, NULL, 0),
(3, 0, 1, 0, '0', NULL, NULL, 0),
(4, 0, 1, 0, '0', NULL, NULL, 0),
(5, 0, 1, 0, '0', NULL, NULL, 0),
(6, 0, 1, 0, '0', NULL, NULL, 0),
(7, 0, 1, 0, '0', NULL, NULL, 0),
(8, 0, 1, 0, '0', NULL, NULL, 0),
(9, 0, 1, 0, '0', NULL, NULL, 0),
(10, 0, 1, 0, '0', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `M_Mutualista`
--

CREATE TABLE `M_Mutualista` (
  `ID_Mutualista` int NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `ID_Personal` int DEFAULT NULL,
  `Finalizado` int DEFAULT '0' COMMENT '0=NO, 1= SI',
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `M_Mutualista`
--

INSERT INTO `M_Mutualista` (`ID_Mutualista`, `Nombre`, `Fecha_Inicio`, `Fecha_Fin`, `ID_Personal`, `Finalizado`, `ID_Sucursal`) VALUES
(1, NULL, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedidos`
--

CREATE TABLE `Pedidos` (
  `ID_Pedido` int NOT NULL,
  `ID_Shein` varchar(50) DEFAULT NULL,
  `Abono` decimal(10,2) DEFAULT NULL COMMENT 'Abono',
  `Fecha_Abono` datetime DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL COMMENT 'Saldo',
  `Monto_Orig` decimal(10,2) DEFAULT NULL,
  `Saldo_Pendiente` decimal(10,2) DEFAULT NULL COMMENT 'Pendiente',
  `ID_Personal` int DEFAULT NULL,
  `Estado` int DEFAULT '0' COMMENT '0=Abierto, 1=Cerrado, 2=Cancelado',
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedidos_Abonos`
--

CREATE TABLE `Pedidos_Abonos` (
  `ID_Abono` int NOT NULL,
  `ID_Pedido` int DEFAULT NULL,
  `ID_Personal` int DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Saldo` decimal(8,2) DEFAULT NULL,
  `Abono` decimal(8,2) DEFAULT NULL,
  `Pendiente` decimal(8,2) DEFAULT NULL,
  `MedioPago` int DEFAULT NULL,
  `Estado` int DEFAULT '0',
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Personal`
--

CREATE TABLE `Personal` (
  `ID_Personal` int NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Usuario` varchar(60) DEFAULT NULL,
  `Bio` varchar(80) DEFAULT NULL,
  `Comentarios` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Colonia` varchar(90) DEFAULT NULL,
  `CP` int DEFAULT NULL,
  `Correo` varchar(35) DEFAULT NULL,
  `Pass` varchar(10) NOT NULL,
  `Contrasena` varchar(100) NOT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Foto` varchar(254) DEFAULT NULL,
  `ID_Sucursal` int NOT NULL,
  `ID_Puesto` int NOT NULL,
  `rol` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Fecha_Registro` timestamp NULL DEFAULT NULL,
  `Baja` int DEFAULT '0' COMMENT '0=No, 1=Si',
  `visible` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Personal`
--

INSERT INTO `Personal` (`ID_Personal`, `Nombre`, `Apellido`, `Usuario`, `Bio`, `Comentarios`, `Colonia`, `CP`, `Correo`, `Pass`, `Contrasena`, `Telefono`, `Foto`, `ID_Sucursal`, `ID_Puesto`, `rol`, `Fecha_Registro`, `Baja`, `visible`) VALUES
(7, 'Mariel', 'Santos', 'mariel.santos', NULL, 'Encargado del dep de Sistema', NULL, NULL, '', '12', '$2b$12$rASdhSBwLC.stNOJx2Gh7uyHm6UTJ8ZEsIQA0dPlMdQkEUWX.NLEC', '5586673337', 'lib/Personal/img/IMG_0920.jpeg', 1, 1, '', '2023-03-20 06:00:00', 0, 1),
(13, 'Isabel', 'May Salazar', NULL, NULL, 'dsfsdf', NULL, NULL, NULL, '12', '', '9971112771', 'lib/Personal/img/cd.png', 1, 3, '', '2023-05-21 06:00:00', 0, 1),
(14, 'laura', 'Segura', NULL, NULL, '', NULL, NULL, NULL, '0794', '', '9991110212', 'lib/Personal/img/blitz_SN.png', 1, 3, '', '2023-06-21 06:00:00', 0, 1),
(15, 'mariel', 'santos', 'mariel.santos2', NULL, '', NULL, NULL, NULL, '8210', '$2y$12$v7ze.mpL9MyspRIAqp8Zcu29qUsElbB31N4GHhaSnm77fWQbXOdpm', '5586673337', 'lib/Personal/img/blitz_SN.png', 1, 3, NULL, '2025-11-10 00:00:00', 0, 1),
(16, 'mariel', 'santos', 'mariel.santos3', NULL, '', NULL, NULL, NULL, '9362', '$2y$12$JUf63J3Y1jWVmdlGpQdvz.8fA5eUmxSxfqzn1X26GchZ1Gl1vv/km', '5586673337', 'lib/Personal/img/blitz_SN.png', 9, 3, NULL, '2025-11-11 00:00:00', 0, 1),
(17, 'mariel', 'santos', 'mariel.santos4', NULL, '', NULL, NULL, NULL, '3180', '$2y$12$seAe4JUjBpJkmltI9SZY5uKRIfOB6Yb5zr6k/ovWEX3nZoPNUNqim', '5586673337', 'lib/Personal/img/blitz_SN.png', 1, 3, NULL, '2025-11-11 00:00:00', 0, 1),
(18, 'mariel', 'santos', 'mariel.santos5', NULL, '', NULL, NULL, NULL, '9507', '$2y$12$vvjZ7V0yxfjGZlTP0CD6p.bag8qqGkSmx3yN/zmmRPhPLafBlpW/.', '5586673337', 'lib/Personal/img/blitz_SN.png', 1, 3, NULL, '2025-11-11 00:00:00', 0, 1),
(19, 'mariel', 'santos', 'mariel.santos6', NULL, '', NULL, NULL, NULL, '6531', '$2y$12$ajFe8USg/OeLTdoh3KGFAOHUpAHO3KMoTWBq5/KKp2rJL.pO2DngO', '5586673337', 'lib/Personal/img/blitz_SN.png', 1, 3, NULL, '2025-11-11 00:00:00', 0, 1),
(20, 'eleazar', 'santos', 'eleazar.santos', NULL, '', NULL, NULL, NULL, '6513', '$2y$12$48afmaZrlAOmocmPErRTbejwJOhBW95GE8Dfkh1pNtuiK3DshLkFy', '9971135089', 'lib/Personal/img/blitz_SN.png', 1, 4, NULL, '2025-11-16 00:00:00', 0, 1),
(21, 'eleazar', 'santos', 'eleazar.santos2', NULL, '', NULL, NULL, NULL, '4187', '$2y$12$IFlru1WNQNCwFAWYhc/XteBer96ojM4tPq/gf3CGqUmuw/L7Nimb2', '5586673337', 'lib/Personal/img/blitz_SN.png', 1, 4, NULL, '2025-11-16 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `ID_Producto` bigint UNSIGNED NOT NULL,
  `Codigo` varchar(255) NOT NULL,
  `Nombre` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `N_Calzado` varchar(20) DEFAULT NULL,
  `Marca` varchar(40) DEFAULT NULL,
  `Foto1` varchar(355) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Foto2` varchar(355) DEFAULT NULL,
  `Foto3` varchar(355) DEFAULT NULL,
  `Foto4` varchar(355) DEFAULT NULL,
  `Foto5` varchar(355) DEFAULT NULL,
  `item1` varchar(100) DEFAULT NULL,
  `item2` varchar(100) DEFAULT NULL,
  `item3` varchar(100) DEFAULT NULL,
  `item4` varchar(100) DEFAULT NULL,
  `item5` varchar(100) DEFAULT NULL,
  `item6` varchar(100) DEFAULT NULL,
  `item7` varchar(100) DEFAULT NULL,
  `item8` varchar(100) DEFAULT NULL,
  `item9` varchar(100) DEFAULT NULL,
  `item10` varchar(100) DEFAULT NULL,
  `PrecioVenta` decimal(8,2) DEFAULT NULL,
  `PrecioCompra` decimal(8,2) DEFAULT NULL,
  `Precio_Tachado` decimal(8,2) DEFAULT NULL,
  `Existencia` double NOT NULL,
  `ID_Sucursal` int NOT NULL,
  `ID_Categoria` int DEFAULT NULL,
  `ID_SubCat` int DEFAULT NULL,
  `Fecha_Ingreso` timestamp NULL DEFAULT NULL,
  `ID_Proveedor` int DEFAULT NULL,
  `Importado` varchar(50) DEFAULT NULL,
  `visto` int DEFAULT '1',
  `Destacado` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT 'Indica si esta promociónado 0=NO, 1=SI',
  `Online` int DEFAULT '0' COMMENT 'Indica si esta en WebApp 0=NO, 1=SI',
  `can` int DEFAULT '0' COMMENT '0=NO, 1=SI Indica si el producto esta dado de baja',
  `cant` int DEFAULT NULL COMMENT 'Indica la cantidad agregada al resurtir el usuario',
  `Calzado` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT 'indica si es calzado o otros productos 1 = SI, 0 = NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`ID_Producto`, `Codigo`, `Nombre`, `Descripcion`, `N_Calzado`, `Marca`, `Foto1`, `Foto2`, `Foto3`, `Foto4`, `Foto5`, `item1`, `item2`, `item3`, `item4`, `item5`, `item6`, `item7`, `item8`, `item9`, `item10`, `PrecioVenta`, `PrecioCompra`, `Precio_Tachado`, `Existencia`, `ID_Sucursal`, `ID_Categoria`, `ID_SubCat`, `Fecha_Ingreso`, `ID_Proveedor`, `Importado`, `visto`, `Destacado`, `Online`, `can`, `cant`, `Calzado`) VALUES
(5, '0767274250', 'Producto 1', 'TENNIS BASKET NGO/PTA', '25', NULL, 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 970.00, 510.00, NULL, 6, 1, 3, 6, '2025-03-11 05:15:15', 2, NULL, 1, 'SI', 1, 0, NULL, '1'),
(6, '1301966260', 'Producto 2', 'TENIS USO RUDO GRIS OXFORD', '26', NULL, 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.44, NULL, 1, 1, 3, 6, '2023-06-01 04:54:50', 2, NULL, 1, 'SI', 1, 0, NULL, '1'),
(7, '1301966265', 'Producto 3', 'CALZADO USO RUDO GRIS OXFORD', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.55, NULL, 1, 1, 3, 6, '2023-06-01 05:00:18', 2, NULL, 1, 'SI', 1, 0, NULL, '1'),
(8, '1301966270', 'Producto 4', 'CALZADO USO RUDO GRIS OXFORD', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.44, NULL, 1, 1, 3, 6, '2023-06-01 05:01:58', 2, NULL, 1, 'NO', 0, 0, NULL, '1'),
(9, '1301966275', 'Producto 5', 'CALZADO USO RUDO GRIS OXFORD', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.44, NULL, 1, 1, 3, 6, '2023-06-01 05:03:05', 2, NULL, 1, 'NO', 0, 0, NULL, '1'),
(10, '1301966280', NULL, 'CALZADO USO RUDO GRIS OXFORD', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.44, NULL, 0, 1, 3, 6, '2023-06-01 05:04:12', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(11, '1301966285', NULL, 'CALZADO USO RUDO GRIS OXFORD', '28.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.44, NULL, 1, 1, 3, 6, '2023-06-01 05:11:19', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(12, '0795041280', NULL, 'TENIS DE BASKETBALL NEGRO RJO ', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 975.00, 492.89, NULL, 1, 1, 3, 6, '2023-06-01 17:24:24', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(13, '0795041250', NULL, 'TENIS DE BASKETBALL NEGRO RJO ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 975.00, 492.89, NULL, 1, 1, 3, 6, '2023-06-01 17:26:37', 2, NULL, 1, 'NO', NULL, 0, NULL, '1'),
(14, '0795041260', NULL, 'TENIS DE BASKETBALL NEGRO RJO ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 975.00, 492.89, NULL, 1, 1, 3, 6, '2023-06-01 17:29:37', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(15, '0795041265', NULL, 'TENIS DE BASKETBALL NEGRO RJO ', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 975.00, 492.89, NULL, 1, 1, 3, 6, '2023-06-01 17:31:34', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(16, '0795041270', NULL, 'TENIS DE BASKETBALL NEGRO RJO ', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 975.00, 492.89, NULL, 1, 1, 3, 6, '2023-06-01 17:33:21', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(17, '0795041275', NULL, 'TENIS DE BASKETBALL NEGRO RJO ', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 975.00, 492.89, NULL, 1, 1, 3, 6, '2023-06-01 17:34:17', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(18, '5002001275', NULL, 'TENIS URBANO BLANCO TOTAL ', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 785.00, 391.88, NULL, 1, 1, 3, 6, '2023-06-01 17:36:29', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(19, '5002001250', NULL, 'TENIS URBANO BLANCO TOTAL ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 785.00, 391.88, NULL, 1, 1, 3, 6, '2023-06-01 17:37:10', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(20, '5002001260', NULL, 'TENIS URBANO BLANCO TOTAL ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 785.00, 391.88, NULL, 1, 1, 3, 6, '2023-06-01 17:37:54', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(21, '5002001265', NULL, 'TENIS URBANO BLANCO TOTAL ', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 785.00, 391.88, NULL, 1, 1, 3, 6, '2023-06-01 17:38:42', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(22, '5002001270', NULL, 'TENIS URBANO BLANCO TOTAL ', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 785.00, 391.88, NULL, 1, 1, 3, 6, '2023-06-01 17:39:29', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(23, '5002001280', NULL, 'TENIS URBANO BLANCO TOTAL ', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 768.39, 391.88, NULL, 1, 1, 3, 6, '2023-06-01 17:40:41', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(24, '0501058265', NULL, 'TACOS NEGRO BCO ', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 795.00, 397.92, NULL, 1, 1, 3, 6, '2023-06-01 17:43:54', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(25, '0501058250', NULL, 'TACOS NEGRO BCO ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 795.00, 397.92, NULL, 1, 1, 3, 6, '2023-06-01 17:45:26', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(26, '0501058260', NULL, 'TACOS NEGRO BCO ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 780.24, 397.92, NULL, 1, 1, 3, 6, '2023-06-01 17:46:06', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(27, '0501058270', NULL, 'TACOS NEGRO BCO ', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 795.00, 397.92, NULL, 1, 1, 3, 6, '2023-06-01 17:48:46', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(28, '0501058275', NULL, 'TACOS NEGRO BCO ', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 795.00, 397.92, NULL, 1, 1, 3, 6, '2023-06-01 17:49:28', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(29, '130415250', NULL, 'TENIS NEGRO GRIS ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 885.00, 446.43, NULL, 1, 1, 3, 6, '2023-06-01 17:51:31', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(30, '1304015260', NULL, 'TENIS NEGRO GRIS ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 885.00, 446.43, NULL, 0, 1, 3, 6, '2023-06-01 17:53:06', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(31, '1304015265', NULL, 'TENIS NEGRO GRIS ', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 885.00, 446.43, NULL, 1, 1, 3, 6, '2023-06-01 17:53:57', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(32, '1304015270', NULL, 'TENIS NEGRO GRIS ', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 885.00, 446.43, NULL, 1, 1, 3, 6, '2023-06-01 17:55:04', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(33, '1304015275', NULL, 'TENIS NEGRO GRIS ', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 885.00, 446.43, NULL, 1, 1, 3, 6, '2023-06-01 17:55:53', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(34, '1304015280', NULL, 'TENIS NEGRO GRIS ', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 885.00, 446.43, NULL, 1, 1, 3, 6, '2023-06-01 17:56:41', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(35, '3010189280', NULL, 'TACOS BLANCO PLATA ', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 414.10, NULL, 1, 1, 3, 6, '2023-06-01 17:58:17', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(36, '3010189250', NULL, 'TACOS BLANCO PLATA ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 414.10, NULL, 1, 1, 3, 6, '2023-06-01 17:59:32', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(37, '3010189260', NULL, 'TACOS BLANCO PLATA ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 414.10, NULL, 1, 1, 3, 6, '2023-06-01 18:00:16', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(38, '3010189265', NULL, 'TACOS BLANCO PLATA ', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 414.10, NULL, 1, 1, 3, 6, '2023-06-01 18:00:53', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(39, '3010189270', NULL, 'TACOS BLANCO PLATA ', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 414.10, NULL, 1, 1, 3, 6, '2023-06-01 18:01:38', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(40, '3010189275', NULL, 'TACOS BLANCO PLATA ', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 414.10, NULL, 1, 1, 3, 6, '2023-06-01 18:02:19', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(41, '3005279250', NULL, 'TACOS NEGRO CABALLERO ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 413.09, NULL, 1, 1, 3, 6, '2023-06-01 18:05:42', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(42, '3005279255', NULL, 'TACOS BLANCO PLATA ', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 413.09, NULL, 1, 1, 3, 6, '2023-06-01 18:06:41', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(43, '3005279260', NULL, 'TACOS BLANCO PLATA ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 413.09, NULL, 1, 1, 3, 6, '2023-06-01 18:07:18', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(44, '3005279265', NULL, 'TACOS BLANCO PLATA ', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 413.09, NULL, 2, 1, 3, 6, '2023-06-01 18:08:38', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(45, '3005279275', NULL, 'TACOS BLANCO PLATA ', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 413.09, NULL, 1, 1, 3, 6, '2023-06-01 18:19:52', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(46, '5049188250', NULL, 'TENIS URBAN BCO NEGRO ROJO', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 855.00, 431.90, NULL, 1, 1, 3, 6, '2023-06-01 18:23:37', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(47, '5049188260', NULL, 'TENIS URBAN BCO NEGRO ROJO', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 855.00, 431.90, NULL, 1, 1, 3, 6, '2023-06-01 18:24:41', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(48, '5049188265', NULL, 'TENIS URBAN BCO NEGRO ROJO', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 855.00, 431.90, NULL, 1, 1, 3, 6, '2023-06-01 18:25:29', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(49, '5049188270', NULL, 'TENIS URBAN BCO NEGRO ROJO', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 855.00, 431.90, NULL, 1, 1, 3, 6, '2023-06-01 18:26:15', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(50, '5049188275', NULL, 'TENIS URBAN BCO NEGRO ROJO', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 855.00, 431.90, NULL, 1, 1, 3, 6, '2023-06-01 18:26:55', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(51, '5049188280', NULL, 'TENIS URBAN BCO NEGRO ROJO', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 855.00, 431.90, NULL, 1, 1, 3, 6, '2023-06-01 18:27:30', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(52, '8008259250', NULL, 'TENIS TRAINING NEGRO BLANCO ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 720.00, 359.56, NULL, 0, 1, 3, 6, '2023-06-24 20:00:00', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(53, '8008259255', NULL, 'TENIS URBAN BCO NEGRO ROJO', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 720.00, 359.56, NULL, 1, 1, 3, 6, '2023-06-01 18:37:10', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(54, '8008259260', NULL, 'TENIS URBAN BCO NEGRO ROJO', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 720.00, 359.56, NULL, 1, 1, 3, 6, '2023-06-01 18:38:48', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(55, '8008259265', NULL, 'TENIS URBAN BCO NEGRO ROJO', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 720.00, 359.56, NULL, 1, 1, 3, 6, '2023-06-01 18:40:59', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(56, '8000442260', NULL, 'TENIS NEGRO BLANCO CABALLERO  ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625.00, 308.05, NULL, 1, 1, 3, 6, '2023-06-01 18:48:11', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(57, '8000442265', NULL, 'TENIS URBAN BCO NEGRO ROJO', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625.00, 308.05, NULL, 1, 1, 3, 6, '2023-06-01 18:49:14', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(58, '8000442270', NULL, 'TENIS URBAN BCO NEGRO ROJO', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625.00, 308.05, NULL, 1, 1, 3, 6, '2023-06-01 18:50:00', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(59, '8000442275', NULL, 'TENIS URBAN BCO NEGRO ROJO', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625.00, 308.05, NULL, 1, 1, 3, 6, '2023-06-01 18:51:19', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(60, '8000442280', NULL, 'TENIS URBAN BCO NEGRO ROJO', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625.00, 308.05, NULL, 0, 1, 3, 6, '2023-06-01 18:51:59', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(61, '0102259260', NULL, 'VULGANIZADO NEGRO BLANCO ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 735.00, 365.62, NULL, 1, 1, 3, 6, '2023-06-01 18:53:36', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(62, '0102259270', NULL, 'VULGANIZADO NEGRO BLANCO ', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 735.00, 365.62, NULL, 2, 1, 3, 6, '2023-06-01 18:55:10', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(63, '0102259280', NULL, 'VULGANIZADO NEGRO BLANCO ', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 735.00, 365.62, NULL, 1, 1, 3, 6, '2023-06-01 18:56:12', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(64, '0099581250', NULL, 'VULGANIZADO MNO CAFE ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 735.00, 365.64, NULL, 1, 1, 3, 6, '2023-06-01 18:58:07', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(65, '0099581260', NULL, 'VULGANIZADO MNO CAFE ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 735.00, 365.64, NULL, 1, 1, 3, 6, '2023-06-01 18:59:39', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(66, '0099581270', NULL, 'VULGANIZADO MNO CAFE ', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 735.00, 365.64, NULL, 2, 1, 3, 6, '2023-06-01 19:00:22', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(67, '0099581280', NULL, 'VULGANIZADO MNO CAFE ', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 735.00, 365.64, NULL, 1, 1, 3, 6, '2023-06-01 19:01:01', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(68, '0099581290', NULL, 'VULGANIZADO MNO CAFE ', '29', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 735.00, 365.64, NULL, 1, 1, 3, 6, '2023-06-01 19:01:44', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(69, '1306756250', NULL, 'VERDE MILITAR ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 978.00, 494.88, NULL, 1, 1, 3, 6, '2023-06-01 19:03:46', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(70, '1306756260', NULL, 'VERDE MIL,ITAR ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 978.00, 494.88, NULL, 1, 1, 3, 6, '2023-06-01 19:05:58', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(71, '1306756265', NULL, 'VERDE MILITAR', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 978.00, 494.88, NULL, 1, 1, 3, 6, '2023-06-01 19:07:13', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(72, '1306756270', NULL, 'VERDE MILITAR', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 978.00, 494.88, NULL, 1, 1, 3, 6, '2023-06-01 19:08:50', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(73, '1306756275', NULL, 'VERDE MILITAR', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 978.00, 494.88, NULL, 1, 1, 3, 6, '2023-06-01 19:09:56', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(74, '1306756280', NULL, 'VERDE MILITAR', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 978.00, 494.88, NULL, 0, 1, 3, 6, '2023-06-01 19:10:52', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(75, '3045040220', NULL, 'TENIS TURF BLANCO AZUL ', '22', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 880.00, 444.40, NULL, 1, 1, 3, 6, '2023-06-01 19:20:43', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(76, '30450402250', NULL, 'TURF BLANCO AZUL JOVEN ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 708.00, 353.50, NULL, 1, 1, 3, 6, '2023-06-01 19:26:18', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(77, '3045040230', NULL, 'TURF BLANCO AZUL JOVEN ', '23', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 708.00, 353.29, NULL, 1, 1, 3, 6, '2023-06-01 19:29:25', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(78, '3045040235', NULL, 'TURF BLANCO AZUL JOVEN ', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 708.00, 353.50, NULL, 1, 1, 3, 6, '2023-06-01 19:30:20', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(79, '3045040240', NULL, 'TURF BLANCO AZUL JOVEN ', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 708.00, 353.50, NULL, 1, 1, 3, 6, '2023-06-01 19:31:51', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(80, '3045040245', NULL, 'TURF BLANCO AZUL JOVEN ', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 709.00, 353.50, NULL, 1, 1, 3, 6, '2023-06-01 19:32:45', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(81, '3044040250', NULL, 'CABALLERO TURF BLANCO AZUL', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-01 19:38:09', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(82, '3044040260', NULL, 'SOCCER JOVEN BLANCO AZUL', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-01 19:39:46', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(83, '3044040265', NULL, 'SOCCER JOVEN BLANCO AZUL', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-01 19:41:12', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(84, '3044040270', NULL, 'SOCCER JOVEN BLANCO AZUL', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 845.68, 431.29, NULL, 1, 1, 3, 6, '2023-06-01 19:42:11', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(85, '3044040275', NULL, 'SOCCER JOVEN BLANCO AZUL', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-01 19:42:41', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(86, '3044040280', NULL, 'SOCCER JOVEN BLANCO AZUL', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-01 19:43:18', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(87, '8500442220', NULL, 'TENIS NEGRO NEGRO ', '22', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625.00, 308.05, NULL, 1, 1, 3, 6, '2023-06-01 19:52:04', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(88, '8500442230', NULL, 'TENIS NEGRO NEGRO ', '23', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625.00, 308.05, NULL, 1, 1, 3, 6, '2023-06-01 19:52:55', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(89, '8500442235', NULL, 'NEGRO NEGRO', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625.00, 308.05, NULL, 1, 1, 3, 6, '2023-06-01 19:58:03', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(90, '8500442240', NULL, 'NEGRO NEGRO', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625.00, 308.05, NULL, 1, 1, 3, 6, '2023-06-01 19:58:49', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(91, '8500442245', NULL, 'NEGRO NEGRO', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625.00, 308.05, NULL, 1, 1, 3, 6, '2023-06-01 19:59:33', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(92, '5002001230', NULL, 'BLANCO TOTALO', '23', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 750.00, 374.69, NULL, 1, 1, 3, 6, '2023-06-01 20:06:37', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(93, '5002001235', NULL, 'BLANCO TOTAL', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 750.00, 374.69, NULL, 1, 1, 3, 6, '2023-06-01 20:08:31', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(94, '5002001240', NULL, 'BLANCO TOTAL', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 750.00, 374.69, NULL, 2, 1, 3, 6, '2023-06-01 20:09:20', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(95, '5002001245', NULL, 'BLANCO TOTAL', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 750.00, 374.69, NULL, 1, 1, 3, 6, '2023-06-01 20:10:11', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(96, '3045709220', NULL, 'TURF AMARILLO', '22', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 708.00, 353.50, NULL, 1, 1, 3, 6, '2023-06-01 20:11:27', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(97, '3045709225', NULL, 'SOCCER JOVEN BLANCO AZUL', '22.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 708.00, 353.50, NULL, 1, 1, 3, 6, '2023-06-01 20:12:46', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(98, '3045709230', NULL, 'SOCCER JOVEN BLANCO AZUL', '23', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 708.00, 353.50, NULL, 1, 1, 3, 6, '2023-06-01 20:13:33', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(99, '3045709235', NULL, 'SOCCER JOVEN BLANCO AZUL', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 708.00, 353.50, NULL, 1, 1, 3, 6, '2023-06-01 20:14:12', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(100, '3045709240', NULL, 'SOCCER JOVEN BLANCO AZUL', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 708.00, 353.50, NULL, 1, 1, 3, 6, '2023-06-01 20:14:48', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(101, '3045709245', NULL, 'SOCCER JOVEN BLANCO AZUL', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 708.00, 353.50, NULL, 1, 1, 3, 6, '2023-06-01 20:15:37', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(102, '6503707230', NULL, 'VULGANIZADO LILA', '23', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 845.00, 424.17, NULL, 2, 1, 3, 6, '2023-06-01 20:17:52', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(103, '6503707240', NULL, 'VULGANIZADO LILA', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 845.00, 424.17, NULL, 2, 1, 3, 6, '2023-06-01 20:18:47', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(104, '6503707250', NULL, 'VULGANIZADO LILA', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 845.00, 424.17, NULL, 1, 1, 3, 6, '2023-06-01 20:19:22', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(105, '6503707260', NULL, 'VULGANIZADO LILA', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 845.00, 424.17, NULL, 1, 1, 3, 6, '2023-06-01 20:19:57', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(106, '8508979230', NULL, 'tenis deportivo maquillaje ', '23', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-01 23:59:48', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(107, '8508979235', NULL, 'TENIS DEPORTIVO MAQUILLAJE ', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-02 00:01:40', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(108, '8508979240', NULL, 'TENIS DEPORTIVO MAQUILLAJE ', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-02 00:09:49', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(109, '8508979245', NULL, 'TENIS DEPORTIVO MAQUILLAJE ', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-02 00:10:38', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(110, '8508979250', NULL, 'TENIS DEPORTIVO MAQUILLAJE ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-02 00:11:23', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(111, '8508979255', NULL, 'TENIS DEPORTIVO MAQUILLAJE ', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 860.00, 431.29, NULL, 1, 1, 3, 6, '2023-06-02 00:12:02', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(112, '3044040220', NULL, 'SOCCER BLANCO AZUL ', '22', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 675.00, 335.29, NULL, 1, 1, 3, 6, '2023-06-02 00:13:42', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(113, '3044040230', NULL, 'SOCCER BLANCO AZUL ', '23', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 675.00, 335.29, NULL, 1, 1, 3, 6, '2023-06-02 00:15:09', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(114, '3044040235', NULL, 'SOCCER BLANCO AZUL ', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 675.00, 335.29, NULL, 1, 1, 3, 6, '2023-06-02 00:15:58', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(115, '3044040240', NULL, 'SOCCER BLANCO AZUL ', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 675.00, 335.29, NULL, 1, 1, 3, 6, '2023-06-02 00:17:09', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(116, '3044040245', NULL, 'SOCCER BLANCO AZUL ', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 675.00, 335.29, NULL, 1, 1, 3, 6, '2023-06-02 00:17:47', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
(123, '002235', NULL, 'AIR MAX LILA ', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 1, 1, 3, 6, '2023-06-02 00:36:10', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(124, '002240', NULL, 'AIR MAX LILA ', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 2, 1, 3, 6, '2023-06-24 20:44:16', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(125, '002245', NULL, 'AIR MAX LILA ', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 1, 1, 3, 6, '2023-06-24 20:42:05', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(126, '002250', NULL, 'AIR MAX LILA ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 2, 1, 3, 6, '2023-06-24 20:42:37', 9, NULL, 0, NULL, NULL, 0, NULL, '1'),
(127, '002255', NULL, 'AIR MAX LILA ', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 2, 1, 3, 6, '2023-06-24 20:42:24', 9, NULL, 0, NULL, NULL, 0, NULL, '1'),
(128, '002260', NULL, 'AIR MAX LILA ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 1, 1, 3, 6, '2023-06-02 00:39:37', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(129, '003235', NULL, 'PUMA ROSA LILA ', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 470.00, 235.00, NULL, 0, 1, 3, 6, '2023-06-02 00:40:45', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(130, '003240', NULL, 'PUMA ROSA LILA ', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 470.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 00:41:25', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(131, '003245', NULL, 'PUMA ROSA LILA ', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 470.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 00:41:59', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(132, '003250', NULL, 'PUMA ROSA LILA ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 470.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 00:42:38', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(133, '003255', NULL, 'PUMA ROSA LILA ', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 470.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 00:43:18', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(134, '003260', NULL, 'PUMA ROSA LILA ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 470.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 00:44:07', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(135, '004235', NULL, 'LAZER ROSA TURQUEZA ', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 420.00, 210.00, NULL, 1, 1, 3, 6, '2023-06-02 00:45:10', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(136, '004240', NULL, 'LAZER ROSA TURQUEZA ', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 420.00, 210.00, NULL, 1, 1, 3, 6, '2023-06-02 00:45:55', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(137, '004245', NULL, 'LAZER ROSA TURQUEZA ', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 420.00, 210.00, NULL, 1, 1, 3, 6, '2023-06-02 00:46:31', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(138, '004250', NULL, 'LAZER ROSA TURQUEZA ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 420.00, 210.00, NULL, 1, 1, 3, 6, '2023-06-02 00:47:17', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(139, '004255', NULL, 'LAZER ROSA TURQUEZA ', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 420.00, 210.00, NULL, 1, 1, 3, 6, '2023-06-02 00:47:56', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(140, '004265', NULL, 'LAZER ROSA TURQUEZA ', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 420.00, 210.00, NULL, 1, 1, 3, 6, '2023-06-02 00:48:42', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(141, '005235', NULL, 'NIKE AIR BLANCO TOTAL ', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 395.00, 195.00, NULL, 1, 1, 3, 6, '2023-06-24 20:30:44', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(142, '005240', NULL, 'NIKE AIR BLANCO TOTAL ', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 395.00, 195.00, NULL, 1, 1, 3, 6, '2023-06-24 20:31:07', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(143, '005245', NULL, 'NIKE AIR BLANCO TOTAL ', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 395.00, 195.00, NULL, 1, 1, 3, 6, '2023-06-24 20:31:35', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(144, '005250', NULL, 'NIKE AIR BLANCO TOTAL ', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 395.00, 195.00, NULL, 1, 1, 3, 6, '2023-06-24 20:31:51', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(145, '005255', NULL, 'NIKE AIR BLANCO TOTAL ', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 395.00, 195.00, NULL, 1, 1, 3, 6, '2023-06-24 20:32:07', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(146, '005260', NULL, 'LAZER ROSA TURQUEZA ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 420.00, 195.00, NULL, 1, 1, 3, 6, '2023-06-02 00:55:16', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(147, '006235', NULL, 'NIKE BLANCO FIUSHA MENTA', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 1, 1, 3, 6, '2023-06-02 00:56:40', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(148, '006240', NULL, 'NIKE BLANCO FIUSHA MENTA', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 1, 1, 3, 6, '2023-06-02 00:58:01', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(149, '006245', NULL, 'NIKE BLANCO FIUSHA MENTA', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 1, 1, 3, 6, '2023-06-02 01:03:57', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(150, '006250', NULL, 'NIKE BLANCO FIUSHA MENTA', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 1, 1, 3, 6, '2023-06-02 01:04:31', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(151, '006255', NULL, 'NIKE BLANCO FIUSHA MENTA', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 1, 1, 3, 6, '2023-06-02 01:05:19', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(152, '006260', NULL, 'NIKE BLANCO FIUSHA MENTA', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 1, 1, 3, 6, '2023-06-02 01:05:48', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(153, '007235', NULL, 'NEGRO BLANCO 229', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 01:09:28', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(154, '007240', NULL, 'NEGRO BLANCO 229', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 01:10:42', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(155, '007245', NULL, 'NEGRO BLANCO 229', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 01:11:12', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(156, '007250', NULL, 'NEGRO BLANCO 229', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 01:13:20', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(157, '007255', NULL, 'NEGRO BLANCO 229', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 01:13:50', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(158, '007265', NULL, 'NEGRO BLANCO 229', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 01:14:24', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(159, '008235', NULL, '515 BLANCO NEGRO', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 0, 1, 3, 6, '2023-06-02 01:16:27', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(160, '008240', NULL, '515 BLANCO NEGRO', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:17:08', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(161, '008245', NULL, '515 BLANCO NEGRO', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:17:34', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(162, '008250', NULL, '515 BLANCO NEGRO', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:18:00', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(163, '008255', NULL, '515 BLANCO NEGRO', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:18:31', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(164, '008260', NULL, '515 BLANCO NEGRO', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:19:10', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(165, '009235', NULL, '515 BLANCO TOTAL', '23.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:19:50', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(166, '009240', NULL, '515 BLANCO TOTAL', '24', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:20:18', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(167, '009245', NULL, '515 BLANCO TOTAL', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:20:52', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(168, '009250', NULL, '515 BLANCO TOTAL', '25', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:21:26', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(169, '009255', NULL, '515 BLANCO TOTAL', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:21:50', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(170, '009265', NULL, '515 BLANCO TOTAL', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 440.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:22:20', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(171, '715260', NULL, 'YORDAN BLANCO NEGRO', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:30:56', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(172, '715270', NULL, 'YORDAN BLANCO NEGRO', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 220.00, NULL, 1270, 1, 3, 6, '2023-06-02 01:32:20', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(173, '715275', NULL, 'YORDAN BLANCO NEGRO', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:33:35', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(174, '715280', NULL, 'YORDAN BLANCO NEGRO', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:34:24', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(175, '715285', NULL, 'YORDAN BLANCO NEGRO', '28.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:35:12', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(176, '715295', NULL, 'YORDAN BLANCO NEGRO', '29.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 220.00, NULL, 1, 1, 3, 6, '2023-06-02 01:36:47', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(177, '001265', NULL, 'NEGRO BLANCO', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 370.00, 185.00, NULL, 1, 1, 3, 6, '2023-06-02 01:38:08', 12, NULL, 1, NULL, NULL, 0, NULL, '1'),
(178, '001270', NULL, 'NEGRO BLANCO', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 370.00, 185.00, NULL, 1, 1, 3, 6, '2023-06-02 01:39:10', 12, NULL, 1, NULL, NULL, 0, NULL, '1'),
(179, '001275', NULL, 'NEGRO BLANCO', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 370.00, 185.00, NULL, 1, 1, 3, 6, '2023-06-02 01:41:04', 12, NULL, 1, NULL, NULL, 0, NULL, '1'),
(180, '001280', NULL, 'NEGRO BLANCO', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 370.00, 185.00, NULL, 1, 1, 3, 6, '2023-06-02 01:41:46', 12, NULL, 1, NULL, NULL, 0, NULL, '1'),
(181, '001285', NULL, 'NEGRO BLANCO', '28.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 370.00, 185.00, NULL, 1, 1, 3, 6, '2023-06-02 01:42:37', 12, NULL, 1, NULL, NULL, 0, NULL, '1'),
(182, '001295', NULL, 'NEGRO BLANCO', '29.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 370.00, 185.00, NULL, 1, 1, 3, 6, '2023-06-02 01:43:18', 12, NULL, 1, NULL, NULL, 0, NULL, '1'),
(184, '0010270', NULL, 'PUMA REY', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 13, 1, 3, 6, '2025-05-06 23:02:26', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(185, '0010275', NULL, 'PUMA REY', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 01:48:39', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(186, '0010280', NULL, 'PUMA REY', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 01:49:26', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(187, '0010285', NULL, 'PUMA REY', '28.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 01:50:18', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(188, '0010290', NULL, 'PUMA REY', '29', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 01:51:00', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(189, '0011260', NULL, 'TOMY BLANCO TOTAL ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 01:55:55', 11, NULL, 1, NULL, NULL, 0, NULL, '1'),
(190, '0011270', NULL, 'TOMY BLANCO TOTAL', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 01:57:17', 11, NULL, 1, NULL, NULL, 0, NULL, '1'),
(191, '0011275', NULL, 'TOMY BLANCO TOTAL', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 02:03:09', 11, NULL, 1, NULL, NULL, 0, NULL, '1'),
(192, '0011280', NULL, 'TOMY BLANCO TOTAL', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 02:04:02', 11, NULL, 1, NULL, NULL, 0, NULL, '1');
INSERT INTO `Productos` (`ID_Producto`, `Codigo`, `Nombre`, `Descripcion`, `N_Calzado`, `Marca`, `Foto1`, `Foto2`, `Foto3`, `Foto4`, `Foto5`, `item1`, `item2`, `item3`, `item4`, `item5`, `item6`, `item7`, `item8`, `item9`, `item10`, `PrecioVenta`, `PrecioCompra`, `Precio_Tachado`, `Existencia`, `ID_Sucursal`, `ID_Categoria`, `ID_SubCat`, `Fecha_Ingreso`, `ID_Proveedor`, `Importado`, `visto`, `Destacado`, `Online`, `can`, `cant`, `Calzado`) VALUES
(193, '0011285', NULL, 'TOMY BLANCO TOTAL', '28.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 02:04:38', 11, NULL, 1, NULL, NULL, 0, NULL, '1'),
(194, '011295', NULL, 'TOMY BLANCO TOTAL', '29.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 02:05:37', 11, NULL, 1, NULL, NULL, 0, NULL, '1'),
(195, '351255', NULL, 'BLANCO BLANCO', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 225.00, NULL, 1, 1, 3, 6, '2023-06-02 02:07:30', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(196, '351260', NULL, 'BLANCO BLANCO', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 225.00, NULL, 1, 1, 3, 6, '2023-06-02 02:08:11', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(197, '351265', NULL, 'BLANCO BLANCO', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 225.00, NULL, 1, 1, 3, 6, '2023-06-02 02:09:32', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(198, '351270', NULL, 'BLANCO BLANCO', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 225.00, NULL, 1, 1, 3, 6, '2023-06-02 02:11:44', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(199, '351275', NULL, 'BLANCO BLANCO', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 225.00, NULL, 1, 1, 3, 6, '2023-06-02 02:12:39', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(200, '351285', NULL, 'BLANCO BLANCO', '28.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 225.00, NULL, 1, 1, 3, 6, '2023-06-02 02:13:42', 7, NULL, 1, NULL, NULL, 0, NULL, '1'),
(201, '0012255', NULL, 'YORDAN ROJO', '25.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 460.00, 230.00, NULL, 1, 1, 3, 6, '2023-06-02 02:21:48', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(202, '0012260', NULL, 'YORDAN ROJO', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 460.00, 230.00, NULL, 1, 1, 3, 6, '2023-06-02 02:22:52', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(203, '0012265', NULL, 'YORDAN ROJO', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 460.00, 230.00, NULL, 1, 1, 3, 6, '2023-06-02 02:23:28', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(204, '0012270', NULL, 'YORDAN ROJO', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 460.00, 230.00, NULL, 1, 1, 3, 6, '2023-06-02 02:24:05', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(205, '0012275', NULL, 'YORDAN ROJO', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 460.00, 230.00, NULL, 1, 1, 3, 6, '2023-06-02 02:24:50', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(206, '0012280', NULL, 'YORDAN ROJO', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 460.00, 230.00, NULL, 1, 1, 3, 6, '2023-06-02 02:25:27', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(207, '505260', NULL, 'NIKE BLANCO', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 410.00, 200.00, NULL, 1, 1, 3, 6, '2023-06-02 02:26:25', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(209, '505270', NULL, 'NIKE BLANCO', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 410.00, 200.00, NULL, 1, 1, 3, 6, '2023-06-02 02:27:43', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(210, '505275', NULL, 'NIKE BLANCO', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 410.00, 200.00, NULL, 1, 1, 3, 6, '2023-06-02 02:28:15', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(211, '505280', NULL, 'NIKE BLANCO', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 410.00, 200.00, NULL, 1, 1, 3, 6, '2023-06-02 02:29:10', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(212, '505285', NULL, 'NIKE BLANCO', '28.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 410.00, 200.00, NULL, 1, 1, 3, 6, '2023-06-02 02:29:44', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(213, '505290', NULL, 'NIKE BLANCO', '29', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 410.00, 200.00, NULL, 0, 1, 3, 6, '2023-06-02 02:30:24', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
(215, '191', NULL, 'PANTALON LICRA NEGRO SPORT T M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 153.00, NULL, 1, 1, 2, 6, '2023-06-02 02:49:53', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(216, '315', NULL, 'PLAYERA NEGRO MANGA LARGA T.M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 435.00, 215.00, NULL, 1, 1, 1, 6, '2023-06-02 02:53:42', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(217, '180', NULL, 'PANTALON LICRA BLANCO T.S', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 290.20, 148.00, NULL, 1, 1, 2, 6, '2023-06-02 02:54:57', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(218, '280', NULL, 'CAMISA BLANCO T.S', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 370.00, 191.00, NULL, 1, 1, 1, 6, '2023-06-02 02:55:54', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(219, '1800', 'Ptoducto muestra', 'BLUSA NEGRO GRIS TALLA S', NULL, NULL, 'lib/Productos/img/219/4u36ktors1la1.png', 'lib/Productos/img/219/cd.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 123.00, 455.00, 1, 1, 1, 3, '2023-06-02 17:31:53', 5, NULL, 1, 'SI', 1, 0, NULL, '1'),
(220, '253', NULL, 'SHORTS VERDE MILITAR TALLA S ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 355.00, 203.00, NULL, 1, 1, 2, 6, '2023-06-02 17:33:28', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(221, '232', NULL, 'PANTALON LICRA CAMUFLAJE TALLA S', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 315.00, 158.00, NULL, 1, 1, 2, 6, '2023-06-02 17:34:42', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(222, '383', NULL, 'SUETER GRIS TALLA MEDIANA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 470.00, 261.00, NULL, 1, 1, 1, 6, '2023-06-02 17:36:03', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(223, '181', NULL, 'BLUSA TURQUESA TALLA S ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 123.00, NULL, 1, 1, 1, 6, '2023-06-02 17:37:34', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(224, '254', NULL, 'CAMISA NEGRA MANGA CORTA TALLA M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350.00, 173.00, NULL, 1, 1, 2, 6, '2023-06-02 17:38:57', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(225, '182', NULL, 'SHORTS CAMUFLAJE TALLA M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250.00, 153.00, NULL, 1, 1, 2, 6, '2023-06-02 17:40:25', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(226, '272', NULL, 'CAMISA MANGA LARGA, MANGA TIPO CAMUFLAJE TALLA M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350.00, 185.00, NULL, 1, 1, 2, 6, '2023-06-02 17:42:19', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(227, '217', NULL, 'SHORTS GRIS TALLA S', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350.00, 148.00, NULL, 1, 1, 2, 6, '2023-06-02 17:45:26', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(228, '190', NULL, 'PANTALON NEGRO ROJO LICRA TALLA MEDIANA', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 153.00, NULL, 1, 1, 2, 6, '2023-06-02 17:47:23', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(229, '147', NULL, 'SHORTS ROJO TALLA M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250.00, 118.00, NULL, 0, 1, 2, 6, '2023-06-02 17:48:28', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(230, '200', NULL, 'TOBILLERA NEGRO MEDIANO ', '20', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 195.00, 125.00, NULL, 1, 1, 3, 6, '2023-06-02 17:50:12', 5, NULL, 1, NULL, NULL, 0, NULL, '1'),
(231, '240', NULL, 'TOBILLERA SENCILLO MEDIANO', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150.00, 95.00, NULL, 1, 1, 4, 6, '2023-06-02 18:04:58', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(232, 'PS0912001', '', 'BANDA ELASTICA ECONOMICA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 11.00, 0.00, 5, 1, 4, 6, '2023-06-02 18:17:12', 5, NULL, 1, '', NULL, 0, NULL, '0'),
(233, 'PS0912002', NULL, 'BANDAS ELASTICAS GRUESAS ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 30.00, NULL, 3, 1, 4, 6, '2023-06-02 18:18:32', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(234, 'PS0912003', NULL, 'CALCETINES DE OREJITAS ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 7.50, NULL, 12, 1, 4, 6, '2023-06-02 18:19:43', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(235, 'PS0912004', NULL, 'CALCETINES LISOS ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35.00, 7.50, NULL, 12, 1, 4, 6, '2023-06-02 18:20:38', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(236, 'PS0912005', NULL, 'MAYON MORADO TALLA S ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 272.00, NULL, 1, 1, 5, 6, '2023-06-02 18:22:03', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(237, 'PS0912006', NULL, 'MAYONES LISOS ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 226.00, NULL, 3, 1, 5, 6, '2023-06-02 18:29:28', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(238, 'PS0912007', NULL, 'CONJUNTO LEGIS Y BLUSA FASHION NEGRO', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 550.00, 422.00, NULL, 1, 1, 5, 6, '2023-06-02 18:30:29', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(239, 'PS0912008', NULL, 'LEGIS DEGRADADO COLORES ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 335.00, 277.00, NULL, 2, 1, 5, 6, '2023-06-02 18:31:29', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(240, 'PS0912009', NULL, 'CONJUNTO DEPORTIVO MARIHUANA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450.00, 330.00, NULL, 1, 1, 5, 6, '2023-06-02 18:32:25', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(241, 'PS0912010', NULL, 'SHORTS BLANCO CHICO ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 215.00, 183.00, NULL, 1, 1, 5, 6, '2023-06-02 18:33:34', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(242, 'PS0912011', NULL, 'VESTIDO VERDE TALLA CH', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 420.00, 339.00, NULL, 1, 1, 5, 6, '2023-06-02 18:34:24', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(243, 'PS0912012', NULL, 'FALDA SHORTS  BLANCO VERDE ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 271.00, NULL, 1, 1, 5, 6, '2023-06-02 18:35:40', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(244, 'PS0912013', NULL, 'SHORTS GRIS TALLA S', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 160.00, 113.00, NULL, 1, 1, 5, 6, '2023-06-02 18:36:46', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(245, 'PS0912014', NULL, 'BLUSA ROJA POSTAL ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 195.00, 181.00, NULL, 1, 1, 5, 6, '2023-06-02 18:37:36', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(246, 'PS0912015', NULL, 'FAJA BLANCA DELGADA', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 30.00, NULL, 1, 1, 4, 6, '2023-06-02 18:39:14', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(247, 'PS0912016', NULL, 'MAYON GRIS OBSCURO', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 265.00, 224.00, NULL, 0, 1, 5, 6, '2023-06-02 18:40:14', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(248, 'PS0912017', NULL, 'BLUSA VERDE MILITAR ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 195.00, 177.00, NULL, 1, 1, 5, 6, '2023-06-02 18:41:39', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(249, 'PS0912018', NULL, 'CONJUNTO SHORT ROSA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350.00, 280.00, NULL, 1, 1, 5, 6, '2023-06-02 18:42:58', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(250, 'PS0912019', NULL, 'SHORTS PIRMA AZUL', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350.00, 275.00, NULL, 1, 1, 5, 6, '2023-06-02 18:43:56', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(251, 'PS0912020', NULL, 'BULTO ROJO SPORTS ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 395.00, 195.00, NULL, 1, 1, 4, 6, '2023-06-02 18:44:56', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(252, 'PS0912021', NULL, 'BULTO ROSA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 395.00, 195.00, NULL, 1, 1, 4, 6, '2023-06-02 18:45:42', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(253, 'PS0912023', NULL, 'BULTO NEGRO', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 395.00, 195.00, NULL, 1, 1, 4, 6, '2023-06-02 18:46:26', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(254, 'PS0912024', NULL, 'BULTO GRIS ESCOLAR ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 399.00, 199.00, NULL, 1, 1, 4, 6, '2023-06-02 18:47:15', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(255, 'PS0912025', NULL, 'MAYON SERPIENTE ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135.00, 80.00, NULL, 1, 1, 5, 6, '2023-06-02 18:48:12', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(256, 'PS0912026', NULL, 'CALCETIN FUTBOL', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 125.00, 95.00, NULL, 3, 1, 4, 6, '2023-06-02 18:49:02', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(257, 'PS0912027', NULL, 'CALCETIN OJITOS ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40.00, 21.00, NULL, 4, 1, 4, 6, '2023-06-02 18:50:08', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(258, 'PS0912028', NULL, 'BLUSA NEGRO ROSA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 195.00, 169.00, NULL, 1, 1, 5, 6, '2023-06-02 18:51:52', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(259, 'PS0912029', NULL, 'CALCETIN ROJO', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 130.00, 0.00, NULL, 1, 1, 4, 6, '2023-06-02 18:53:43', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(260, 'PS0912030', NULL, 'CALCETINES LISOS COLORES ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40.00, 28.00, NULL, 5, 1, 4, 6, '2023-06-02 18:54:53', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(261, 'PS0912031', NULL, 'GUANTES MEDIO DEDO ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 165.00, 120.00, NULL, 1, 1, 4, 6, '2023-06-02 18:56:00', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(262, 'PS0912032', NULL, 'GUANTES CAMUFLAJE ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 165.00, 120.00, NULL, 1, 1, 4, 6, '2023-06-02 18:56:52', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(263, 'PS0912033', NULL, 'GUANTES NEGRO NARANJA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 165.00, 120.00, NULL, 1, 1, 4, 6, '2023-06-02 18:57:47', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(264, 'PS0912034', NULL, 'CALCETIN BLANCO FUTBOL', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120.00, 86.00, NULL, 1, 1, 4, 6, '2023-06-02 19:01:16', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(265, 'PS0912035', NULL, 'FAJAS DE DAMA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 45.00, NULL, 4, 1, 4, 6, '2023-06-02 19:02:27', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(266, 'PS0912036', NULL, 'CALCETIN DE FUTBOL NEGRO', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120.00, 86.00, NULL, 1, 1, 4, 6, '2023-06-02 19:03:09', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(267, 'PS0912037', NULL, 'RODILLERA NEGRO CONTACTEL', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 75.00, NULL, 1, 1, 4, 6, '2023-06-02 19:04:08', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(268, 'PS0912038', NULL, 'GUANTES ESTAMPADO DAMA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150.00, 110.00, NULL, 1, 1, 4, 6, '2023-06-02 19:04:55', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(269, 'PS0912039', NULL, 'GUANTES GYM DEPORTIVO DE DAMA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170.00, 135.00, NULL, 3, 1, 4, 6, '2023-06-02 19:05:53', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(270, 'PS0912040', NULL, 'RODILLERA GRIS ROSA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150.00, 109.00, NULL, 1, 1, 4, 6, '2023-06-02 19:06:50', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(271, 'PS0912041', NULL, 'ESPINILLERA NEGRO NINO ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135.00, 111.00, NULL, 2, 1, 4, 6, '2023-06-02 19:07:40', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(272, '4064044403100', NULL, 'T-Shirt Adidas deportivo rojo Talla G', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 650.00, 399.00, NULL, 1, 1, 5, 6, '2023-06-19 17:58:43', 6, NULL, 1, NULL, NULL, 0, NULL, '0'),
(273, '4064044161994', NULL, 'T-Shirt Adidas deportivo rojo Talla EG', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 650.00, 399.00, NULL, 0, 1, 5, 6, '2023-06-19 18:00:28', 6, NULL, 1, NULL, NULL, 0, NULL, '0'),
(274, '4066747990727', NULL, 'T-Shirt Adidas deportivo Naranja T-M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 650.00, 399.00, NULL, 1, 1, 5, 6, '2023-06-19 18:02:41', 6, NULL, 1, NULL, NULL, 0, NULL, '0'),
(275, '4066745333335', NULL, 'T-Shirt Adidas Cotton Azul T-M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 590.00, 468.00, NULL, 1, 1, 5, 6, '2023-06-19 18:04:40', 6, NULL, 1, NULL, NULL, 0, NULL, '0'),
(276, '5205572236481', NULL, 'T-Shirt Reebok deportivo NGRO T-EG', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 599.00, 299.00, NULL, 1, 1, 5, 6, '2023-06-19 18:07:41', 8, NULL, 1, NULL, NULL, 0, NULL, '0'),
(277, '4065423762948', NULL, 'T-Shirt Adidas deportivo Limon T-M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 790.00, 419.00, NULL, 1, 1, 5, 6, '2023-06-19 18:10:36', 6, NULL, 1, NULL, NULL, 0, NULL, '0'),
(278, '7501022013885', NULL, 'Refresco 7UP 400 ml', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12.00, 7.00, NULL, 14, 1, 6, 6, '2025-05-06 22:08:47', 7, NULL, 0, 'NO', 0, 13, NULL, '0'),
(279, '7501031302802', 'Chesco', 'Refresco Manzanita sol 400ml', NULL, NULL, 'https://sys.powersports.top/lib/Productos/img/279/cd.png', 'https://sys.powersports.top/lib/Productos/img/279/w2.jpg', NULL, NULL, '1', NULL, '8', NULL, '87', '5', NULL, '07', NULL, NULL, NULL, 12.00, 800.00, 545.00, 6, 1, 6, 5, '2023-06-20 16:51:59', 7, NULL, 1, '0', 0, 1, NULL, '0'),
(281, '002265', NULL, 'AIR MAX LILA #26.5', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 1, 1, 3, 6, '2023-06-24 20:48:14', 9, NULL, 0, NULL, NULL, 0, NULL, '1'),
(282, '2000', NULL, 'mayon azul marino talla s ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 168.00, NULL, 0, 1, 5, 6, '2023-06-28 21:30:59', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(283, 'FS170', NULL, 'FALDAS SHORTS T MY S ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 170.00, NULL, 2, 1, 5, 6, '2023-07-04 22:29:04', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(284, 'bc85', NULL, 'BLUSA CHAMPIONS ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170.00, 85.00, NULL, 4, 1, 5, 6, '2023-07-04 22:34:05', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(285, 'bR85', NULL, 'BLUSA ROSA FUSHA L ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170.00, 85.00, NULL, 1, 1, 5, 6, '2023-07-04 22:35:36', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(286, 'br68', NULL, 'BLUSA ROSA MANCHAS XXL ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135.00, 68.00, NULL, 1, 1, 5, 6, '2023-07-04 22:36:49', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(287, 'SV68', NULL, 'SHORTS VERDE L DAMA ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135.00, 68.00, NULL, 1, 1, 5, 6, '2023-07-04 22:38:47', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(288, 'MR85', NULL, 'MAYON ROSA XL ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170.00, 85.00, NULL, 1, 1, 5, 6, '2023-07-04 22:39:56', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(289, 'MN85', NULL, 'MAYON NARANJA XL ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170.00, 85.00, NULL, 1, 1, 5, 6, '2023-07-04 22:48:24', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(290, 'SD68', NULL, 'SHORTS DAMA NARANJA XL', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135.00, 68.00, NULL, 1, 1, 4, 6, '2023-07-04 22:49:52', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(291, 'BRT68', NULL, 'BLUSA ROSA TIRANTES ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135.00, 68.00, NULL, 1, 1, 5, 6, '2023-07-04 22:53:26', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(292, 'MF85', NULL, 'MAYON FUSHA BLANCO L', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170.00, 85.00, NULL, 1, 1, 5, 6, '2023-07-04 22:54:50', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(293, 'BRV85', NULL, 'BLUSA ROSA VERDE ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170.00, 85.00, NULL, 1, 1, 5, 6, '2023-07-04 22:56:07', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(294, 'BF85', NULL, 'BLUSA FIUSHA SOSTEN ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170.00, 85.00, NULL, 3, 1, 5, 6, '2023-07-04 22:57:08', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(295, 'PG187', NULL, 'PANTALONES DE MEZCLILLA VARIOS ', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 285.00, 187.00, NULL, 8, 1, 5, 6, '2023-07-04 22:58:30', 13, NULL, 1, NULL, NULL, 0, NULL, '0'),
(296, 'mariel', 'DemoProduc', 'Producto demostravito t45', '0', NULL, 'lib/Productos/img/Recurso 9.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 272.73, 150.00, NULL, 20, 1, 3, 6, '2024-10-16 13:23:15', 8, NULL, 1, NULL, NULL, 0, NULL, '1'),
(297, 'MARIEL285', 'TENIS ', 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. #28.5', '28.5', NULL, 'https://sys.powersports.top/lib/Productos/img/MARIEL285/41f5EJ939aL._AC_SY1000_.jpg', 'https://sys.powersports.top/lib/Productos/img/MARIEL285/categorias-casual-caballero-Florsheim-confort-gris.png', 'https://sys.powersports.top/lib/Productos/img/MARIEL285/fc010c5f0249a2b72075013b6bff8b7d.jpeg', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 584.75, 345.00, 645.00, 28, 1, 3, 1, '2024-10-21 11:36:52', 2, NULL, 1, '1', 0, 0, NULL, '1'),
(298, 'MARIEL290', 'ZAPATOS ', 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. #29', '29', NULL, 'https://sys.powersports.top/lib/Productos/img/MARIEL290/categorias-casual-caballero-Florsheim-confort-gris.png', 'https://sys.powersports.top/lib/Productos/img/MARIEL290/fc010c5f0249a2b72075013b6bff8b7d.jpeg', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', NULL, NULL, '55', NULL, NULL, NULL, '7', NULL, '4', NULL, NULL, 203.39, 120.00, 205.00, 13, 1, 3, 2, '2024-10-21 11:41:19', 5, NULL, 1, 'SI', 1, 0, NULL, '1'),
(299, 'MARIEL243', 'ROPA', 'DEWDWDWEDEWDWDEWD', NULL, NULL, 'https://sys.powersports.top/lib/Productos/img/MARIEL243/categorias-casual-caballero-Florsheim-confort-gris.png', 'https://sys.powersports.top/lib/Productos/img/MARIEL243/fc010c5f0249a2b72075013b6bff8b7d.jpeg', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/MARIEL243/41f5EJ939aL._AC_SY1000_.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20.34, 12.00, 50.00, 13, 1, 5, 5, '2024-10-21 11:48:30', 5, NULL, 1, '0', 0, 0, NULL, '0'),
(300, 'IZATCH', 'PANTALON', 'DEFEFEFEFE TCH', 'TCH', NULL, 'https://sys.powersports.top/lib/Productos/img/IZATCH/fc010c5f0249a2b72075013b6bff8b7d.jpeg', 'https://sys.powersports.top/lib/Productos/img/IZATCH/41f5EJ939aL._AC_SY1000_.jpg', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/IZATCH/images-3.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59.32, 35.00, 60.00, 24, 1, 2, 4, '2024-10-21 12:05:22', 2, NULL, 1, '0', 0, 0, NULL, '0'),
(305, 'ew23', '3wewrw', 'producto demostrativo solo para uso de desarrollo', NULL, '', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 562.71, 332.00, NULL, 46, 1, 4, 2, '2025-05-18 16:55:06', 2, NULL, 1, NULL, 0, 0, NULL, NULL),
(306, 'wewe', 'fe', 'producto demostrativo solo para uso de desarrollo', NULL, '', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37.29, 22.00, NULL, 32, 1, 1, 4, '2025-05-18 16:57:00', 2, NULL, 1, NULL, 0, 0, NULL, NULL),
(307, 'qwewqeaa', '4334e', 'producto demostrativo solo para uso de desarrollo', NULL, '', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37.29, 22.00, NULL, 333, 1, 2, 1, '2025-05-18 17:20:23', 2, NULL, 1, NULL, 0, 0, NULL, NULL),
(308, 'aqwsqqq', '1212', 'producto demostrativo solo para uso de desarrollo', NULL, '', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 374.58, 221.00, NULL, 22, 1, 5, 4, '2025-05-18 17:21:12', 2, NULL, 1, NULL, 0, 0, NULL, NULL),
(309, 'qwertyu', 'ss', 'producto demostrativo solo para uso de desarrollo', NULL, '', 'https://midominio.com/lib/Productos/img/blitz_SN.png', 'https://midominio.com/lib/Productos/img/blitz_SN.png', 'https://midominio.com/lib/Productos/img/blitz_SN.png', 'https://midominio.com/lib/Productos/img/blitz_SN.png', 'https://midominio.com/lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37.29, 22.00, NULL, 22, 1, 2, 2, '2025-05-18 17:33:22', 2, NULL, 1, NULL, 0, 0, NULL, NULL),
(310, 'asdf', 'ewew', 'producto demostrativo solo para uso de desarrollo', NULL, '', 'https://midominio.com/lib/Productos/img/asdf/1747590003_0.png', 'https://midominio.com/lib/Productos/img/asdf/1747590003_1.jpg', 'https://midominio.com/lib/Productos/img/asdf/1747590003_2.png', 'https://midominio.com/lib/Productos/img/asdf/1747590003_3.png', 'https://midominio.com/lib/Productos/img/asdf/1747590003_4.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.93, 33.00, NULL, 33, 1, 2, 4, '2025-05-18 17:40:03', 2, NULL, 1, NULL, 0, 0, NULL, NULL),
(311, '00419225', 'zapato ', 'producto para de4sarrollo  #22.5', '22.5', '', 'https://sys.powersports.top/lib/Productos/img/0419225/1762457146_0.jpg', 'https://sys.powersports.top/lib/Productos/img/0419225/1762457146_1.jpg', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 466.10, 275.00, NULL, 419, 1, 3, 3, '2025-11-06 19:25:46', NULL, NULL, 1, NULL, 0, 0, NULL, '1'),
(312, '0419225', 'zapato ', 'producto para de4sarrollo  #22.5', '22.5', '', 'https://sys.powersports.top/lib/Productos/img/0419225/1762457265_0.jpg', 'https://sys.powersports.top/lib/Productos/img/0419225/1762457265_1.jpg', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 466.10, 275.00, NULL, 419, 1, 3, 3, '2025-11-06 19:27:45', NULL, NULL, 1, NULL, 0, 0, NULL, '1'),
(313, 'producto1', '1qw', 'cdcscd  ds', NULL, '', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37.29, 22.00, NULL, 2, 1, 2, 2, '2025-11-06 19:35:33', NULL, NULL, 1, NULL, 0, 0, NULL, NULL),
(314, 'pp2', 'destacado pero no el linea', 'asd', NULL, '', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.69, 1.00, NULL, 3, 1, 6, 4, '2025-11-06 19:37:58', NULL, NULL, 1, '0', 0, 0, NULL, NULL),
(315, '0123285', 'producto en linea pero no destacada', 'retyertyeryherty', NULL, '', 'https://sys.powersports.top/lib/Productos/img/0123285/1762525170_0.jpg', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74.58, 44.00, 200.00, 4, 1, 3, 2, '2025-11-07 14:19:30', NULL, NULL, 1, '1', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos_Sucursales`
--

CREATE TABLE `Productos_Sucursales` (
  `ID` int NOT NULL,
  `ID_Producto` bigint UNSIGNED NOT NULL,
  `ID_Sucursal` int UNSIGNED NOT NULL,
  `Cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Productos_Sucursales`
--

INSERT INTO `Productos_Sucursales` (`ID`, `ID_Producto`, `ID_Sucursal`, `Cantidad`) VALUES
(1, 5, 1, 5),
(2, 6, 1, 0),
(3, 7, 1, 1),
(4, 8, 1, 1),
(5, 9, 1, 1),
(6, 10, 1, 1),
(7, 11, 1, 1),
(8, 12, 1, 1),
(9, 13, 1, 1),
(10, 14, 1, 1),
(11, 15, 1, 1),
(12, 16, 1, 1),
(13, 17, 1, 1),
(14, 18, 1, 1),
(15, 19, 1, 1),
(16, 20, 1, 1),
(17, 21, 1, 1),
(18, 22, 1, 1),
(19, 23, 1, 1),
(20, 24, 1, 1),
(21, 25, 1, 1),
(22, 26, 1, 1),
(23, 27, 1, 1),
(24, 28, 1, 1),
(25, 29, 1, 1),
(26, 30, 1, 0),
(27, 31, 1, 1),
(28, 32, 1, 1),
(29, 33, 1, 1),
(30, 34, 1, 1),
(31, 35, 1, 1),
(32, 36, 1, 1),
(33, 37, 1, 1),
(34, 38, 1, 1),
(35, 39, 1, 1),
(36, 40, 1, 1),
(37, 41, 1, 1),
(38, 42, 1, 1),
(39, 43, 1, 1),
(40, 44, 1, 0),
(41, 45, 1, 1),
(42, 46, 1, 1),
(43, 47, 1, 1),
(44, 48, 1, 1),
(45, 49, 1, 1),
(46, 50, 1, 1),
(47, 51, 1, 1),
(48, 52, 1, 0),
(49, 53, 1, 1),
(50, 54, 1, 1),
(51, 55, 1, 1),
(52, 56, 1, 1),
(53, 57, 1, 1),
(54, 58, 1, 1),
(55, 59, 1, 1),
(56, 60, 1, 0),
(57, 61, 1, 1),
(58, 62, 1, 2),
(59, 63, 1, 1),
(60, 64, 1, 1),
(61, 65, 1, 1),
(62, 66, 1, 2),
(63, 67, 1, 1),
(64, 68, 1, 1),
(65, 69, 1, 1),
(66, 70, 1, 1),
(67, 71, 1, 1),
(68, 72, 1, 1),
(69, 73, 1, 1),
(70, 74, 1, 0),
(71, 75, 1, 1),
(72, 76, 1, 1),
(73, 77, 1, 1),
(74, 78, 1, 1),
(75, 79, 1, 1),
(76, 80, 1, 1),
(77, 81, 1, 1),
(78, 82, 1, 1),
(79, 83, 1, 1),
(80, 84, 1, 1),
(81, 85, 1, 1),
(82, 86, 1, 1),
(83, 87, 1, 1),
(84, 88, 1, 1),
(85, 89, 1, 1),
(86, 90, 1, 1),
(87, 91, 1, 1),
(88, 92, 1, 1),
(89, 93, 1, 1),
(90, 94, 1, 2),
(91, 95, 1, -1),
(92, 96, 1, 1),
(93, 97, 1, 1),
(94, 98, 1, 0),
(95, 99, 1, 1),
(96, 100, 1, 1),
(97, 101, 1, 1),
(98, 102, 1, 2),
(99, 103, 1, 2),
(100, 104, 1, 1),
(101, 105, 1, 1),
(102, 106, 1, 1),
(103, 107, 1, 1),
(104, 108, 1, 1),
(105, 109, 1, 1),
(106, 110, 1, 1),
(107, 111, 1, 1),
(108, 112, 1, 1),
(109, 113, 1, 1),
(110, 114, 1, 1),
(111, 115, 1, 1),
(112, 116, 1, 1),
(113, 123, 1, 1),
(114, 124, 1, 2),
(115, 125, 1, 2),
(116, 126, 1, 2),
(117, 127, 1, 1),
(118, 128, 1, 1),
(119, 129, 1, 0),
(120, 130, 1, 1),
(121, 131, 1, 1),
(122, 132, 1, 1),
(123, 133, 1, 1),
(124, 134, 1, 1),
(125, 135, 1, 1),
(126, 136, 1, 1),
(127, 137, 1, 1),
(128, 138, 1, 1),
(129, 139, 1, 1),
(130, 140, 1, 1),
(131, 141, 1, 1),
(132, 142, 1, 1),
(133, 143, 1, 1),
(134, 144, 1, 1),
(135, 145, 1, 1),
(136, 146, 1, 1),
(137, 147, 1, 1),
(138, 148, 1, 1),
(139, 149, 1, 1),
(140, 150, 1, 1),
(141, 151, 1, 1),
(142, 152, 1, 1),
(143, 153, 1, 1),
(144, 154, 1, 1),
(145, 155, 1, 1),
(146, 156, 1, 1),
(147, 157, 1, 1),
(148, 158, 1, 1),
(149, 159, 1, 0),
(150, 160, 1, 0),
(151, 161, 1, 1),
(152, 162, 1, 0),
(153, 163, 1, -2),
(154, 164, 1, 1),
(155, 165, 1, 1),
(156, 166, 1, 1),
(157, 167, 1, 1),
(158, 168, 1, 1),
(159, 169, 1, 1),
(160, 170, 1, 1),
(161, 171, 1, 1),
(162, 172, 1, 1270),
(163, 173, 1, 1),
(164, 174, 1, 1),
(165, 175, 1, 1),
(166, 176, 1, 1),
(167, 177, 1, 1),
(168, 178, 1, 1),
(169, 179, 1, 1),
(170, 180, 1, 1),
(171, 181, 1, 1),
(172, 182, 1, 1),
(173, 184, 1, 13),
(174, 185, 1, 1),
(175, 186, 1, 1),
(176, 187, 1, 1),
(177, 188, 1, 1),
(178, 189, 1, 1),
(179, 190, 1, 1),
(180, 191, 1, 1),
(181, 192, 1, 1),
(182, 193, 1, 1),
(183, 194, 1, 1),
(184, 195, 1, 1),
(185, 196, 1, 1),
(186, 197, 1, 1),
(187, 198, 1, 1),
(188, 199, 1, 1),
(189, 200, 1, 1),
(190, 201, 1, 1),
(191, 202, 1, 1),
(192, 203, 1, 1),
(193, 204, 1, 1),
(194, 205, 1, 1),
(195, 206, 1, 1),
(196, 207, 1, 1),
(197, 209, 1, 1),
(198, 210, 1, 1),
(199, 211, 1, 1),
(200, 212, 1, 1),
(201, 213, 1, 0),
(202, 215, 1, 1),
(203, 216, 1, 1),
(204, 217, 1, 1),
(205, 218, 1, 1),
(206, 219, 1, 113),
(207, 220, 1, 1),
(208, 221, 1, 1),
(209, 222, 1, 1),
(210, 223, 1, 1),
(211, 224, 1, 1),
(212, 225, 1, 1),
(213, 226, 1, 1),
(214, 227, 1, 1),
(215, 228, 1, 1),
(216, 229, 1, 0),
(217, 230, 1, 1),
(218, 231, 1, 1),
(219, 232, 1, 5),
(220, 233, 1, 3),
(221, 234, 1, 12),
(222, 235, 1, 12),
(223, 236, 1, 1),
(224, 237, 1, 3),
(225, 238, 1, 1),
(226, 239, 1, 2),
(227, 240, 1, 1),
(228, 241, 1, 1),
(229, 242, 1, 1),
(230, 243, 1, 1),
(231, 244, 1, 1),
(232, 245, 1, 1),
(233, 246, 1, 1),
(234, 247, 1, 0),
(235, 248, 1, 1),
(236, 249, 1, 1),
(237, 250, 1, 1),
(238, 251, 1, 1),
(239, 252, 1, 1),
(240, 253, 1, 1),
(241, 254, 1, 1),
(242, 255, 1, 1),
(243, 256, 1, 2),
(244, 257, 1, 4),
(245, 258, 1, 1),
(246, 259, 1, 1),
(247, 260, 1, 5),
(248, 261, 1, 1),
(249, 262, 1, 1),
(250, 263, 1, 1),
(251, 264, 1, 1),
(252, 265, 1, 4),
(253, 266, 1, 1),
(254, 267, 1, 1),
(255, 268, 1, 1),
(256, 269, 1, 3),
(257, 270, 1, 1),
(258, 271, 1, 2),
(259, 272, 1, 1),
(260, 273, 1, 0),
(261, 274, 1, 1),
(262, 275, 1, 1),
(263, 276, 1, 1),
(264, 277, 1, 1),
(265, 278, 1, 13),
(266, 279, 1, 5),
(268, 281, 1, 1),
(269, 282, 1, 0),
(270, 283, 1, 2),
(271, 284, 1, 4),
(272, 285, 1, 1),
(273, 286, 1, 1),
(274, 287, 1, 1),
(275, 288, 1, 1),
(276, 289, 1, 1),
(277, 290, 1, 1),
(278, 291, 1, 1),
(279, 292, 1, 1),
(280, 293, 1, 1),
(281, 294, 1, 3),
(282, 295, 1, 8),
(283, 296, 1, 20),
(284, 297, 1, 28),
(285, 298, 1, 13),
(286, 299, 1, 13),
(287, 300, 1, 24),
(288, 305, 1, 32),
(289, 306, 1, 21),
(290, 307, 1, 329),
(291, 308, 1, 21),
(292, 309, 1, 22),
(293, 310, 1, 33),
(294, 5, 9, 1),
(295, 312, 1, 419),
(296, 313, 1, 2),
(297, 314, 1, 3),
(298, 315, 1, 1),
(300, 315, 9, 3),
(301, 6, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedores`
--

CREATE TABLE `Proveedores` (
  `ID_Proveedor` int NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Correo` varchar(40) DEFAULT NULL,
  `Telefono` varchar(40) DEFAULT NULL,
  `Foto` varchar(254) DEFAULT NULL,
  `NEmpresa` varchar(25) DEFAULT NULL,
  `NCorreo` varchar(30) DEFAULT NULL,
  `NDireccion` varchar(80) DEFAULT NULL,
  `NTel` varchar(13) DEFAULT NULL,
  `NCiudad` varchar(40) DEFAULT NULL,
  `NCP` varchar(10) DEFAULT NULL,
  `NLogo` varchar(254) DEFAULT NULL,
  `Fecha_Registro` date NOT NULL,
  `Beneficiario` varchar(60) DEFAULT NULL,
  `Clabe` varchar(30) DEFAULT NULL,
  `Banco` varchar(50) DEFAULT NULL,
  `Bio` varchar(300) DEFAULT NULL,
  `NBio` varchar(300) DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  `Importado` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Proveedores`
--

INSERT INTO `Proveedores` (`ID_Proveedor`, `Nombre`, `Correo`, `Telefono`, `Foto`, `NEmpresa`, `NCorreo`, `NDireccion`, `NTel`, `NCiudad`, `NCP`, `NLogo`, `Fecha_Registro`, `Beneficiario`, `Clabe`, `Banco`, `Bio`, `NBio`, `ID_Sucursal`, `Importado`) VALUES
(2, 'dfgvdgd', NULL, '', NULL, 'PIRMA', '', '', '8848484', '', '', 'lib/Productos/img/blitz_SN.png', '2023-05-31', '', '', '', 'gfbfgnbswerg w ewrg erwg', '', 1, NULL),
(5, '', '', '', 'lib/Productos/img/blitz_SN.png', 'SHEIN', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2023-06-01', '', '', '', NULL, NULL, 1, NULL),
(6, '', '', '', 'lib/Productos/img/blitz_SN.png', 'ADIDAS', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2023-06-01', '', '', '', NULL, NULL, 1, NULL),
(7, '', '', '', 'lib/Productos/img/blitz_SN.png', 'NKG', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2023-06-11', '', '', '', NULL, NULL, 1, NULL),
(8, '', '', '', 'lib/Productos/img/blitz_SN.png', 'REEBOK', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2023-06-19', '', '', '', NULL, NULL, 1, NULL),
(9, '', '', '', 'lib/Productos/img/blitz_SN.png', 'NIKE', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2023-06-19', '', '', '', NULL, NULL, 1, NULL),
(10, '', '', '', 'lib/Productos/img/blitz_SN.png', 'PUMA', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2023-06-19', '', '', '', NULL, NULL, 1, NULL),
(11, '', '', '', 'lib/Productos/img/blitz_SN.png', 'TOMY', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2023-06-19', '', '', '', NULL, NULL, 1, NULL),
(12, '', '', '', 'lib/Productos/img/blitz_SN.png', 'VANS', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2023-06-19', '', '', '', NULL, NULL, 1, NULL),
(13, 'CHAMPIONS', '', '', 'lib/Productos/img/blitz_SN.png', 'CHAMPIONS', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2023-07-04', '', '', '', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Puestos`
--

CREATE TABLE `Puestos` (
  `ID_Puesto` int NOT NULL,
  `Cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Puestos`
--

INSERT INTO `Puestos` (`ID_Puesto`, `Cargo`) VALUES
(1, 'Sistemas'),
(2, 'Administrador'),
(3, 'Encargado'),
(4, 'Vendedor'),
(5, 'Cliente'),
(6, 'Proveedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcat`
--

CREATE TABLE `subcat` (
  `idSubCategoria` int NOT NULL,
  `subcategoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `subcat`
--

INSERT INTO `subcat` (`idSubCategoria`, `subcategoria`, `Descripcion`, `ID_Sucursal`) VALUES
(1, 'DEPORTEzzzz', 'khs h hsh hjbjkbckj bc    dbvhdhdhdbc k.[juoc cjbc', 1),
(2, 'PANTALONES', 'Dama', 1),
(3, 'NIÑOS', NULL, 1),
(4, 'DAMA', NULL, 1),
(5, 'CABALLERO', NULL, 1),
(6, 'OTROS', NULL, 1),
(7, 'Celulares', 'venta de tiempo aire y moviles', 1),
(8, 'prueba ', 'categoría demostrativa', 1),
(9, 'asas', 'ddfdvcd dc s', 1),
(10, 'SUBCATEGORIA DE PRUEBAsss', 'EWE JDASKJSDK SCDFEBNsss', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sucursales`
--

CREATE TABLE `Sucursales` (
  `ID_Sucursal` int NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `RFC` varchar(40) DEFAULT NULL,
  `Municipio` varchar(90) DEFAULT NULL,
  `Estado` varchar(40) DEFAULT NULL,
  `Direccion` varchar(80) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Colonia` varchar(65) DEFAULT NULL,
  `Cp` int DEFAULT NULL,
  `Latitud` varchar(40) DEFAULT NULL,
  `Longitud` varchar(40) DEFAULT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Logo` varchar(254) DEFAULT NULL,
  `Tipo` varchar(40) DEFAULT NULL,
  `Gerente` varchar(35) DEFAULT NULL,
  `Whats` varchar(13) DEFAULT NULL,
  `instagram` varchar(355) DEFAULT NULL,
  `facebook` varchar(355) DEFAULT NULL,
  `Color` varchar(16) DEFAULT NULL,
  `ColorDark` varchar(16) DEFAULT NULL,
  `Clabe` varchar(50) DEFAULT NULL,
  `Banco` varchar(50) DEFAULT NULL,
  `Beneficiario` varchar(50) DEFAULT NULL,
  `Utilidad` double DEFAULT NULL COMMENT 'porcentaje de utilidad',
  `visible` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Sucursales`
--

INSERT INTO `Sucursales` (`ID_Sucursal`, `Nombre`, `RFC`, `Municipio`, `Estado`, `Direccion`, `Correo`, `Colonia`, `Cp`, `Latitud`, `Longitud`, `Telefono`, `Logo`, `Tipo`, `Gerente`, `Whats`, `instagram`, `facebook`, `Color`, `ColorDark`, `Clabe`, `Banco`, `Beneficiario`, `Utilidad`, `visible`) VALUES
(1, 'PowerSports', 'PAAV630203VDA', 'Ticul', 'Yucatan', 'C-24 x 29 y 27', 'contacto@powersports.top', 'Centro', 97880, NULL, NULL, '5660436605', 'lib/Empresa/img/PM.jpg', NULL, 'Virginia Paredes', '5649562263', NULL, NULL, '#b8b8b8', '#383838', '', '', '', 41, 1),
(9, 'carn Eleazar', 'SAPM900328CG9', 'Ticul', NULL, 'C 43 x 24 y 26', '', 'Vivah 1', 97860, NULL, NULL, '9971135089', 'lib/Empresa/img/Blitzc0de.gif', NULL, 'Eleazar Santos', '928839', NULL, NULL, NULL, NULL, '', '', '', 30, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ventas`
--

CREATE TABLE `Ventas` (
  `ID_Venta` bigint UNSIGNED NOT NULL,
  `ID_Personal` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  `Caja` int NOT NULL,
  `ID_Medio` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Descuento_efect` decimal(8,2) DEFAULT NULL,
  `Descuento_porcent` double DEFAULT NULL,
  `Subtotal` decimal(8,2) DEFAULT NULL,
  `IVA` double DEFAULT NULL,
  `Total` decimal(8,2) DEFAULT NULL,
  `Efectivo` decimal(8,2) DEFAULT NULL,
  `Cambio` decimal(8,2) DEFAULT NULL,
  `ID_Destino` int NOT NULL,
  `Comentarios` varchar(200) DEFAULT NULL,
  `Cort` int DEFAULT NULL,
  `idcorte` int DEFAULT NULL,
  `Liquidar` int DEFAULT '0' COMMENT 'si ya liquido la deuda lleva "1" de valor	',
  `ID_Sucursal` int DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Ventas`
--

INSERT INTO `Ventas` (`ID_Venta`, `ID_Personal`, `ID_Cliente`, `Caja`, `ID_Medio`, `Cantidad`, `Fecha`, `Hora`, `Descuento_efect`, `Descuento_porcent`, `Subtotal`, `IVA`, `Total`, `Efectivo`, `Cambio`, `ID_Destino`, `Comentarios`, `Cort`, `idcorte`, `Liquidar`, `ID_Sucursal`, `Fecha_Fin`) VALUES
(1, 7, 1, 7, 1, 0, '2023-06-18', '12:27:02', 62.50, 10, 625.00, 90, 562.50, 600.00, 37.50, 1, '', 1, 8, 0, 1, NULL),
(2, 7, 1, 7, 1, 0, '2023-06-18', '12:29:23', 88.50, 10, 885.00, 127.44, 796.50, 1000.00, 203.50, 1, '', 1, 8, 0, 1, NULL),
(3, 7, 1, 7, 1, 0, '2023-06-18', '12:59:26', 43.00, 10, 430.00, 61.92, 387.00, 400.00, 13.00, 1, '', 1, 8, 0, 1, NULL),
(5, 7, 2, 7, 2, 0, '2023-06-20', '12:13:58', 0.00, 0, 650.00, 104, 650.00, 0.00, -650.00, 3, '', 1, 8, 1, 1, '2023-07-20'),
(6, 13, 1, 13, 1, 0, '2023-06-21', '19:34:48', 47.00, 10, 470.00, 67.68, 423.00, 500.00, 77.00, 1, '', 1, 8, 0, 1, NULL),
(7, 14, 3, 14, 2, 0, '2023-06-21', '19:42:34', 93.40, 5, 1868.00, 283.936, 1774.60, 0.00, -1774.60, 1, '', 1, 8, 0, 1, NULL),
(8, 13, 1, 13, 1, 0, '2023-06-21', '19:44:10', 0.00, 0, 410.00, 65.6, 410.00, 410.00, 0.00, 1, '', 1, 8, 0, 1, NULL),
(9, 7, 4, 7, 1, 0, '2023-06-23', '17:46:54', 0.00, 0, 250.00, 40, 250.00, 250.00, 0.00, 1, '', 1, 8, 0, 1, NULL),
(11, 7, 1, 7, 1, 0, '2023-06-24', '14:01:27', 72.00, 10, 720.00, 103.68, 648.00, 648.00, 0.00, 1, '', 1, 8, 0, 1, NULL),
(13, 7, 1, 7, 1, 0, '2023-06-27', '12:53:25', 0.00, 0, 12.00, 1.92, 12.00, 20.00, 8.00, 1, '', 1, 21, 0, 1, NULL),
(14, 13, 1, 13, 1, 0, '2023-06-28', '14:23:52', 0.00, 0, 12.00, 1.92, 12.00, 12.00, 0.00, 1, '', 1, 21, 0, 1, NULL),
(15, 13, 1, 13, 1, 0, '2023-06-28', '15:34:51', 0.00, 0, 545.00, 87.2, 545.00, 0.00, -545.00, 3, '', 1, 21, 1, 1, '2023-07-28'),
(16, 7, 2, 7, 1, 0, '2023-06-29', '12:01:22', 0.00, 0, 12.00, 1.92, 12.00, 20.00, 8.00, 1, '', 1, 21, 0, 1, NULL),
(17, 7, 2, 7, 1, 0, '2023-07-03', '13:45:57', 0.00, 0, 12.00, 1.92, 12.00, 12.00, 0.00, 1, '', 1, 21, 0, 1, NULL),
(19, 7, 2, 7, 1, 0, '2023-07-03', '15:47:42', 0.00, 0, 780.00, 124.8, 780.00, 0.00, -780.00, 3, '', 1, 21, 1, 1, '2023-08-03'),
(20, 7, 2, 7, 1, 0, '2023-07-05', '11:03:10', 0.00, 0, 12.00, 1.92, 12.00, 12.00, 0.00, 1, '', 1, 21, 0, 1, NULL),
(21, 7, 4, 7, 1, 0, '2023-07-07', '13:24:25', 0.00, 0, 395.00, 63.2, 395.00, 0.00, -395.00, 3, '', 1, 21, 1, 1, '2023-08-07'),
(23, 7, 2, 7, 1, 0, '2024-10-16', '07:52:40', 0.00, 0, 272.73, 43.6368, 272.73, 0.00, -272.73, 3, 'aprt', 1, 21, 1, 1, '2024-11-16'),
(24, 7, 1, 7, 1, 0, '2025-02-27', '01:05:23', 0.00, 0, 440.00, 70.4, 440.00, 500.00, 60.00, 1, '', 1, 21, 0, 1, NULL),
(25, 7, 1, 7, 1, 2, '2025-06-15', '22:43:26', 0.00, 10, 1325.00, 190.8, 1192.50, 1200.00, 7.50, 1, '', 1, 32, 0, 1, NULL),
(26, 7, 1, 7, 1, 1, '2025-06-16', '14:02:47', 0.00, 10, 562.71, 81.0304, 506.44, 520.00, 13.56, 1, 'dddffdfdfdfdfdfdf=======', 1, 32, 0, 1, NULL),
(27, 7, 1, 7, 1, 1, '2025-06-16', '14:24:27', 0.00, 0, 562.71, 90.0336, 562.71, 600.00, 37.29, 1, '', 1, 32, 0, 1, NULL),
(28, 7, 2, 7, 1, 1, '2025-06-17', '14:47:09', 0.00, 0, 562.71, 90.0336, 562.71, 50.00, -512.71, 3, 'apartado 1', 1, 32, 1, 1, '2025-07-17'),
(29, 7, 1, 7, 1, 1, '2025-06-21', '17:20:19', 0.00, 0, 562.71, 90.0336, 562.71, 510.00, 7.29, 1, 'sdsdsdsdsd////', 1, 32, 0, 1, NULL),
(30, 7, 1, 7, 1, 1, '2025-06-21', '17:57:34', 0.00, 0, 562.71, 90.0336, 562.71, 570.00, 7.29, 1, 'cererer', 1, 32, 0, 1, NULL),
(31, 7, 1, 7, 1, 1, '2025-06-23', '14:40:31', 0.00, 0, 562.71, 90.0336, 562.71, 500.00, -62.71, 1, 'zzzzaazazazazzaza', 1, 32, 0, 1, NULL),
(32, 7, 1, 7, 1, 1, '2025-06-23', '14:43:10', 0.00, 0, 562.71, 90.0336, 562.71, 600.00, 37.29, 1, 'ppppoopooopopopp', 1, 32, 0, 1, NULL),
(33, 7, 1, 7, 1, 1, '2025-06-23', '14:48:37', 0.00, 0, 562.71, 90.0336, 562.71, 600.00, 37.29, 1, '123', 1, 32, 0, 1, NULL),
(34, 7, 1, 7, 1, 1, '2025-06-23', '15:03:42', 0.00, 0, 562.71, 90.0336, 562.71, 600.00, 37.29, 1, '', 1, 32, 0, 1, NULL),
(35, 7, 1, 7, 1, 1, '2025-06-23', '15:33:46', 0.00, 0, 562.71, 90.0336, 562.71, 600.00, 37.29, 1, '', 1, 32, 0, 1, NULL),
(36, 7, 1, 7, 1, 1, '2025-06-23', '15:37:26', 0.00, 0, 562.71, 90.0336, 562.71, 600.00, 37.29, 1, '', 1, 32, 0, 1, NULL),
(37, 7, 1, 7, 1, 1, '2025-06-23', '15:39:26', 0.00, 0, 562.71, 90.0336, 562.71, 600.00, 37.29, 1, '', 1, 32, 0, 1, NULL),
(38, 7, 1, 7, 1, 1, '2025-06-23', '15:44:35', 0.00, 0, 562.71, 90.0336, 562.71, 600.00, 37.29, 1, '', 1, 32, 0, 1, NULL),
(39, 7, 1, 7, 1, 1, '2025-06-23', '15:56:54', 0.00, 0, 562.71, 90.0336, 562.71, 120.00, -442.71, 3, 'apartado', 1, 32, 1, 1, '2025-07-23'),
(40, 7, 2, 7, 1, 1, '2025-06-23', '18:24:42', 0.00, 0, 562.71, 90.0336, 562.71, 60.00, -502.71, 3, 'apartado 2', 1, 32, 1, 1, '2025-07-23'),
(41, 7, 2, 7, 1, 1, '2025-06-23', '18:29:43', 0.00, 0, 562.71, 90.0336, 562.71, 0.00, -562.71, 3, '', 1, 32, 1, 1, '2025-07-23'),
(42, 7, 2, 7, 1, 1, '2025-06-23', '18:38:04', 0.00, 0, 562.71, 90.0336, 562.71, 0.00, -562.71, 3, '', 1, 36, 1, 1, '2025-07-23'),
(43, 7, 1, 7, 1, 1, '2025-07-05', '19:24:21', 0.00, 0, -132.71, NULL, -132.71, 0.00, 132.71, 4, 'Cambios de Producto', 1, 36, 0, 1, '2025-08-05'),
(44, 7, 1, 7, 1, 1, '2025-08-04', '15:46:35', 0.00, 0, 402.71, NULL, 402.71, 403.00, 0.29, 4, 'Cambios de Producto', 1, 36, 0, 1, '2025-09-04'),
(45, 7, 1, 7, 1, 1, '2025-08-04', '15:53:15', 0.00, 0, 402.71, 0, 402.71, 410.00, 7.29, 4, 'Cambios de Producto', 1, 36, 0, 1, '2025-09-04'),
(46, 7, 1, 7, 1, 2, '2025-08-04', '16:04:54', 0.00, 0, 365.42, 0, 365.42, 400.00, 34.58, 4, 'Cambios de Producto', 1, 36, 0, 1, '2025-09-04'),
(47, 7, 1, 7, 1, 1, '2025-08-04', '16:08:28', 0.00, 0, 712.71, 0, 712.71, 800.00, 87.29, 4, 'Cambios de Producto', 1, 36, 0, 1, '2025-09-04'),
(48, 7, 1, 7, 1, 1, '2025-08-04', '16:09:04', 0.00, 0, -712.71, 0, -712.71, 0.00, 712.71, 4, 'Cambios de Producto', 1, 36, 0, 1, '2025-09-04'),
(49, 7, 1, 7, 1, 3, '2025-08-04', '16:43:33', 675.00, 0, 824.58, 131.9328, 824.58, 200.00, 50.42, 1, 'Aplicado descuento por: $675.00, vale con folio: 1.', 1, 36, 0, 1, NULL),
(50, 7, 1, 7, 1, 1, '2025-08-04', '17:00:25', 675.00, 0, 562.71, 90.0336, 562.71, 0.00, 112.29, 1, 'Aplicado descuento por: $675.00, vale con folio: 1.', 1, 36, 0, 1, NULL),
(52, 7, 1, 7, 1, 1, '2025-08-04', '17:15:34', 675.00, 0, 708.00, 113.28, 708.00, 50.00, 17.00, 1, 'Aplicado descuento por: $675.00, vale con folio: 1.', 1, 36, 0, 1, NULL),
(53, 7, 1, 7, 1, 2, '2025-08-04', '17:29:26', 675.00, 0, 880.00, 0, 205.00, 210.00, 5.00, 1, 'Aplicado descuento por: $675.00, vale con folio: 1.', 1, 36, 0, 1, NULL),
(54, 7, 1, 7, 1, 1, '2025-11-03', '23:33:41', 0.00, 0, 562.71, 0, 562.71, 600.00, 37.29, 1, 'pppe', 1, 49, 0, 1, NULL),
(55, 7, 1, 7, 2, 1, '2025-11-03', '23:34:34', 0.00, 0, 37.29, 0, 37.29, 40.00, 2.71, 1, 'apart', 1, 49, 0, 1, NULL),
(56, 7, 1, 7, 1, 1, '2025-11-04', '00:00:59', 0.00, 0, 562.71, 0, 562.71, 600.00, 37.29, 1, '', NULL, NULL, 0, 1, NULL),
(57, 7, 1, 7, 2, 1, '2025-11-04', '00:03:55', 0.00, 0, 37.29, 0, 37.29, 50.00, 12.71, 1, '', 1, 54, 0, 1, NULL),
(58, 7, 1, 7, 1, 1, '2025-11-04', '00:08:43', 0.00, 0, 562.71, 0, 562.71, 600.00, 37.29, 1, '', 1, 54, 0, 1, NULL),
(59, 7, 2, 7, 1, 1, '2025-11-04', '00:47:05', 0.00, 0, 562.71, 0, 562.71, 0.00, -562.71, 3, '', 1, 58, 1, 1, '2025-12-04'),
(60, 7, 2, 7, 1, 1, '2025-11-04', '00:48:23', 0.00, 0, 562.71, 0, 562.71, 0.00, -562.71, 3, 'prueba de apartadp', 1, 58, 1, 1, '2025-12-04'),
(61, 7, 1, 7, 1, 1, '2025-11-04', '17:02:12', 0.00, 10, 562.71, 90.0336, 562.71, 0.00, -506.44, 3, 'jjjjjljlj;ljnj', 1, 58, 1, 1, '2025-12-04'),
(62, 7, 2, 7, 1, 1, '2025-11-04', '17:18:11', 0.00, 0, 37.29, 5.9664, 37.29, 0.00, -37.29, 3, '', 1, 58, 1, 1, '2025-12-04'),
(63, 7, 1, 7, 1, 1, '2025-11-04', '17:37:30', 0.00, 0, 37.29, 5.9664, 37.29, 40.00, 2.71, 1, '', 1, 60, 0, 1, NULL),
(64, 7, 1, 7, 1, 1, '2025-11-05', '13:30:52', 0.00, 0, 562.71, 90.0336, 562.71, 2.00, -560.71, 3, '', 1, 63, 1, 1, '2025-12-05'),
(65, 7, 2, 7, 1, 1, '2025-11-05', '13:33:39', 0.00, 0, 562.71, 90.0336, 562.71, 600.00, 37.29, 1, '', 1, 63, 0, 1, NULL),
(66, 7, 2, 7, 1, 1, '2025-11-05', '13:54:59', 0.00, 0, -525.42, 0, -525.42, 0.00, 525.42, 4, 'Cambios de Producto', 1, 63, 0, 1, '2025-12-05'),
(67, 7, 1, 7, 1, 1, '2025-11-05', '14:06:10', 0.00, 0, -525.42, 0, -525.42, 0.00, 525.42, 4, 'Cambios de Producto', 1, 63, 0, 1, '2025-12-05'),
(68, 7, 1, 7, 1, 1, '2025-11-05', '14:09:27', 488.00, 0, 562.71, 90.0336, 562.71, 100.00, 25.29, 1, 'Aplicado descuento por: $488.00, vale con folio: 2.', 1, 63, 0, 1, NULL),
(69, 7, 1, 7, 1, 1, '2025-11-05', '14:40:02', 0.00, 0, 562.71, 90.0336, 562.71, 600.00, 37.29, 1, 'cobro normal', 1, 66, 0, 1, NULL),
(70, 7, 1, 7, 1, 1, '2025-11-05', '14:40:32', 0.00, 5, 37.29, 5.6688, 35.43, 50.00, 14.57, 1, 'cobro con 5% de desc', 1, 66, 0, 1, NULL),
(71, 7, 2, 7, 1, 1, '2025-11-05', '15:05:29', 3.73, 10, 37.29, 5.3696, 33.56, 50.00, 16.44, 1, 'descuento de 10%', 1, 66, 0, 1, NULL),
(72, 7, 1, 7, 1, 1, '2025-11-05', '15:07:09', 10.00, 0, 37.29, 5.9664, 37.29, 30.00, 2.71, 1, '', 1, 66, 0, 1, NULL),
(73, 7, 1, 7, 1, 1, '2025-11-05', '18:04:33', 10.00, 0, 37.29, 4.3664, 27.29, 50.00, 22.71, 1, 'descuento de 10 pesos', 1, 66, 0, 1, NULL),
(74, 7, 2, 7, 1, 1, '2025-11-05', '22:02:37', 1.86, 5, 37.29, 5.6688, 35.43, 50.00, 14.57, 3, '', 1, 66, 1, 1, '2025-12-05'),
(75, 7, 2, 7, 1, 1, '2025-11-05', '22:19:21', 0.00, 0, 562.71, 90.0336, 562.71, 50.00, -512.71, 3, '', 1, 66, 1, 1, '2025-12-05'),
(76, 7, 1, 7, 1, 1, '2025-11-05', '22:20:53', 84.41, 15, 562.71, 76.528, 478.30, 500.00, 21.70, 1, '', 1, 70, 0, 1, NULL),
(77, 7, 1, 7, 2, 1, '2025-11-05', '22:23:14', 0.00, 0, 37.29, 5.9664, 37.29, 37.29, 0.00, 1, '', 1, 70, 0, 1, NULL),
(78, 7, 4, 7, 1, 1, '2025-11-05', '22:24:21', 0.00, 0, 374.58, 59.9328, 374.58, 50.00, -324.58, 3, '', 1, 70, 1, 1, '2025-12-05'),
(79, 7, 1, 7, 1, 1, '2025-11-10', '23:12:11', 0.00, 0, 125.00, 20, 125.00, 150.00, 25.00, 1, '', 0, NULL, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venta_Detalle`
--

CREATE TABLE `Venta_Detalle` (
  `ID_Detalle` bigint UNSIGNED NOT NULL,
  `ID_Producto` bigint UNSIGNED NOT NULL,
  `Cantidad` bigint UNSIGNED NOT NULL,
  `ID_Venta` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Venta_Detalle`
--

INSERT INTO `Venta_Detalle` (`ID_Detalle`, `ID_Producto`, `Cantidad`, `ID_Venta`) VALUES
(1, 60, 1, 1),
(2, 30, 1, 2),
(5, 273, 1, 5),
(6, 129, 1, 6),
(7, 74, 1, 7),
(8, 90, 1, 7),
(9, 247, 1, 7),
(10, 213, 1, 8),
(11, 229, 1, 9),
(13, 52, 1, 11),
(16, 278, 1, 13),
(17, 278, 1, 14),
(19, 282, 1, 15),
(20, 278, 1, 16),
(21, 279, 1, 17),
(24, 207, 1, 19),
(25, 181, 1, 19),
(26, 279, 1, 20),
(27, 142, 1, 21),
(31, 296, 1, 23),
(32, 159, 1, 24),
(33, 125, 1, 25),
(34, 10, 1, 25),
(35, 305, 1, 26),
(36, 305, 1, 27),
(37, 305, 1, 28),
(38, 305, 1, 29),
(39, 305, 1, 30),
(40, 305, 1, 31),
(41, 305, 1, 32),
(42, 305, 1, 33),
(43, 305, 1, 34),
(44, 305, 1, 35),
(45, 305, 1, 36),
(46, 305, 1, 37),
(47, 305, 1, 38),
(48, 305, 1, 39),
(49, 305, 1, 40),
(50, 305, 1, 41),
(51, 305, 1, 42),
(52, 127, 1, 43),
(53, 163, 1, 44),
(54, 163, 1, 45),
(55, 163, 1, 46),
(56, 95, 1, 47),
(57, 307, 1, 48),
(58, 306, 1, 49),
(59, 307, 1, 49),
(60, 95, 1, 49),
(61, 305, 1, 50),
(63, 98, 1, 52),
(64, 160, 1, 53),
(65, 162, 1, 53),
(66, 305, 1, 54),
(67, 306, 1, 55),
(68, 305, 1, 56),
(69, 306, 1, 57),
(70, 305, 1, 58),
(71, 305, 1, 59),
(72, 305, 1, 60),
(73, 305, 1, 61),
(74, 307, 1, 62),
(75, 307, 1, 63),
(76, 305, 1, 64),
(77, 305, 1, 65),
(78, 306, 1, 66),
(79, 306, 1, 67),
(80, 305, 1, 68),
(81, 305, 1, 69),
(82, 306, 1, 70),
(83, 306, 1, 71),
(84, 306, 1, 72),
(85, 306, 1, 73),
(86, 306, 1, 74),
(87, 305, 1, 75),
(88, 305, 1, 76),
(89, 306, 1, 77),
(90, 308, 1, 78),
(91, 256, 1, 79);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venta_T`
--

CREATE TABLE `Venta_T` (
  `ID_Destino` int NOT NULL,
  `Destino` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Venta_T`
--

INSERT INTO `Venta_T` (`ID_Destino`, `Destino`) VALUES
(1, 'Venta'),
(2, 'Credito'),
(3, 'Apartado'),
(4, 'Cambio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vFinanciados`
--

CREATE TABLE `vFinanciados` (
  `ID_Abono` int NOT NULL,
  `ID_Venta` int DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Saldo_Ant` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Saldo_Pend` double DEFAULT NULL,
  `Estatus` int DEFAULT NULL COMMENT '1=Fianlizado, 0 Pendiente',
  `ID_Medio` int DEFAULT NULL COMMENT '1=Venta,2=Credito,3=Apartado',
  `Fecha_Final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `vFinanciados`
--

INSERT INTO `vFinanciados` (`ID_Abono`, `ID_Venta`, `ID_Cliente`, `Fecha`, `Saldo_Ant`, `Abono`, `Saldo_Pend`, `Estatus`, `ID_Medio`, `Fecha_Final`) VALUES
(1, 5, 2, '2023-06-20 12:13:58', 650, 0, 0, 1, 3, '2023-07-20'),
(2, 15, 4, '2023-06-28 15:34:51', 545, 0, 0, 1, 3, '2023-07-28'),
(3, 19, 2, '2023-07-03 15:47:42', 780, 0, 0, 1, 3, '2023-08-03'),
(4, 21, 4, '2023-07-07 13:24:25', 395, 0, 395, 1, 3, '2023-08-07'),
(6, 23, 2, '2024-10-16 07:52:40', 272.73, 0, 0, 1, 3, '2024-11-16'),
(7, 28, 2, '2025-06-17 14:47:09', 562.71, 50, 0, 1, 3, '2025-07-17'),
(8, 39, 1, '2025-06-23 15:56:54', 562.71, 120, 0, 1, 3, '2025-07-23'),
(9, 40, 2, '2025-06-23 18:24:42', 562.71, 60, 0, 1, 3, '2025-07-23'),
(10, 41, 2, '2025-06-23 18:29:43', 562.71, 0, 0, 1, 3, '2025-07-23'),
(11, 42, 2, '2025-06-23 18:38:04', 562.71, 0, 0, 1, 3, '2025-07-23'),
(12, 59, 2, '2025-11-04 00:47:05', 562.71, 0, 0, 1, 3, '2025-12-04'),
(13, 60, 2, '2025-11-04 00:48:23', 562.71, 0, 0, 1, 3, '2025-12-04'),
(15, 62, 2, '2025-11-04 17:18:11', 37.29, 0, 0, 1, 3, '2025-12-04'),
(16, 64, 1, '2025-11-05 13:30:52', 562.71, 2, 0, 1, 3, '2025-12-05'),
(17, 74, 2, '2025-11-05 22:02:37', 35.43, 50, 0, 1, 3, '2025-12-05'),
(18, 75, 2, '2025-11-05 22:19:21', 562.71, 50, 0, 1, 3, '2025-12-05'),
(19, 78, 4, '2025-11-05 22:24:21', 374.58, 50, 170.58, 0, 3, '2025-12-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ZConfig`
--

CREATE TABLE `ZConfig` (
  `ID_C` int NOT NULL,
  `Tiempo` varchar(10) NOT NULL,
  `Interes` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ZConfig`
--

INSERT INTO `ZConfig` (`ID_C`, `Tiempo`, `Interes`) VALUES
(3, '33', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ZMisc`
--

CREATE TABLE `ZMisc` (
  `ID_Misc` int NOT NULL,
  `ID_Sucursal` int NOT NULL,
  `ID_Personal` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Corte` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `ZMisc`
--

INSERT INTO `ZMisc` (`ID_Misc`, `ID_Sucursal`, `ID_Personal`, `Fecha`, `Corte`) VALUES
(1, 1, 7, '2023-05-31', 0),
(2, 1, 7, '2023-06-02', 0),
(3, 1, 7, '2023-06-05', 0),
(4, 1, 7, '2023-06-11', 0),
(5, 1, 7, '2023-06-12', 0),
(6, 1, 7, '2023-06-18', 0),
(7, 1, 7, '2023-06-19', 0),
(8, 1, 7, '2023-06-20', 0),
(9, 1, 13, '2023-06-21', 0),
(10, 1, 7, '2023-06-23', 0),
(11, 1, 7, '2023-06-24', 0),
(12, 1, 13, '2023-06-25', 0),
(13, 1, 7, '2023-06-27', 0),
(14, 1, 13, '2023-06-28', 0),
(15, 1, 7, '2023-06-29', 0),
(16, 1, 7, '2023-07-03', 0),
(17, 1, 13, '2023-07-04', 0),
(18, 1, 7, '2023-07-05', 0),
(19, 1, 7, '2023-07-07', 0),
(20, 1, 7, '2023-07-08', 0),
(21, 1, 7, '2023-07-10', 0),
(22, 1, 13, '2023-07-19', 0),
(23, 1, 7, '2023-10-01', 0),
(24, 1, 13, '2023-10-27', 0),
(25, 1, 13, '2023-11-08', 0),
(26, 1, 7, '2023-11-17', 0),
(27, 1, 7, '2023-11-21', 0),
(28, 1, 13, '2023-12-07', 0),
(29, 1, 7, '2024-10-16', 0),
(30, 1, 7, '2024-10-18', 0),
(31, 1, 7, '2024-10-19', 0),
(32, 1, 7, '2024-10-20', 0),
(33, 1, 7, '2024-11-09', 0),
(34, 1, 7, '2024-11-11', 0),
(35, 1, 7, '2024-11-19', 0),
(36, 1, 7, '2025-02-22', 0),
(37, 1, 7, '2025-02-23', 0),
(38, 1, 7, '2025-02-25', 0),
(39, 1, 7, '2025-02-26', 0),
(40, 1, 7, '2025-03-02', 0),
(41, 1, 7, '2025-03-04', 0),
(42, 1, 7, '2025-03-05', 0),
(43, 1, 7, '2025-03-10', 0),
(44, 1, 7, '2025-03-11', 0),
(45, 1, 7, '2025-04-23', 0),
(46, 1, 7, '2025-04-24', 0),
(47, 1, 7, '2025-04-25', 0),
(48, 1, 7, '2025-04-26', 0),
(49, 1, 7, '2025-04-28', 0),
(50, 1, 7, '2025-04-30', 0),
(51, 1, 7, '2025-05-03', 0),
(52, 1, 7, '2025-05-04', 0),
(53, 1, 7, '2025-05-05', 0),
(54, 1, 7, '2025-05-06', 0),
(55, 1, 7, '2025-05-09', 0),
(56, 1, 7, '2025-05-13', 0),
(57, 1, 7, '2025-05-18', 0),
(58, 1, 7, '2025-05-24', 0),
(59, 1, 7, '2025-05-26', 0),
(60, 1, 7, '2025-05-27', 0),
(61, 1, 7, '2025-06-01', 0),
(62, 1, 7, '2025-06-14', 0),
(63, 1, 7, '2025-06-16', 0),
(64, 1, 7, '2025-06-17', 0),
(65, 1, 7, '2025-06-21', 0),
(66, 1, 7, '2025-06-23', 0),
(67, 1, 7, '2025-07-05', 0),
(68, 1, 7, '2025-07-14', 0),
(69, 1, 7, '2025-07-16', 0),
(70, 1, 7, '2025-08-04', 0),
(71, 1, 7, '2025-11-03', 0),
(72, 1, 7, '2025-11-08', 0),
(73, 1, 7, '2025-11-10', 0),
(74, 1, 7, '2025-11-11', 0),
(75, 1, 7, '2025-11-16', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Abonos`
--
ALTER TABLE `Abonos`
  ADD PRIMARY KEY (`ID_Abono`);

--
-- Indices de la tabla `Banner`
--
ALTER TABLE `Banner`
  ADD PRIMARY KEY (`ID_Banner`);

--
-- Indices de la tabla `Caja`
--
ALTER TABLE `Caja`
  ADD PRIMARY KEY (`ID_Caja`),
  ADD KEY `ID_Caja_T` (`ID_Caja_T`),
  ADD KEY `ID_Personal` (`ID_Personal`);

--
-- Indices de la tabla `Caja_T`
--
ALTER TABLE `Caja_T`
  ADD PRIMARY KEY (`ID_Caja_T`);

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `codigos`
--
ALTER TABLE `codigos`
  ADD PRIMARY KEY (`idCodigo`);

--
-- Indices de la tabla `Cuentas_Prove`
--
ALTER TABLE `Cuentas_Prove`
  ADD PRIMARY KEY (`ID_Cuentas`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `Cupon`
--
ALTER TABLE `Cupon`
  ADD PRIMARY KEY (`ID_Cupon`),
  ADD KEY `ID_Venta` (`ID_Venta`);

--
-- Indices de la tabla `Historial_Pagos`
--
ALTER TABLE `Historial_Pagos`
  ADD PRIMARY KEY (`ID_HistPagos`);

--
-- Indices de la tabla `Medio_Pago`
--
ALTER TABLE `Medio_Pago`
  ADD PRIMARY KEY (`ID_Medio`);

--
-- Indices de la tabla `M_Abonos`
--
ALTER TABLE `M_Abonos`
  ADD PRIMARY KEY (`ID_Abono`);

--
-- Indices de la tabla `M_MDetalles`
--
ALTER TABLE `M_MDetalles`
  ADD PRIMARY KEY (`ID_Detalle`);

--
-- Indices de la tabla `M_Mutualista`
--
ALTER TABLE `M_Mutualista`
  ADD PRIMARY KEY (`ID_Mutualista`);

--
-- Indices de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`ID_Pedido`);

--
-- Indices de la tabla `Pedidos_Abonos`
--
ALTER TABLE `Pedidos_Abonos`
  ADD PRIMARY KEY (`ID_Abono`);

--
-- Indices de la tabla `Personal`
--
ALTER TABLE `Personal`
  ADD PRIMARY KEY (`ID_Personal`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`),
  ADD KEY `ID_Puesto` (`ID_Puesto`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`,`ID_Categoria`),
  ADD KEY `ID_Categoria` (`ID_Categoria`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`),
  ADD KEY `ID_Proveedor_2` (`ID_Proveedor`);

--
-- Indices de la tabla `Productos_Sucursales`
--
ALTER TABLE `Productos_Sucursales`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Producto` (`ID_Producto`,`ID_Sucursal`);

--
-- Indices de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `Puestos`
--
ALTER TABLE `Puestos`
  ADD PRIMARY KEY (`ID_Puesto`);

--
-- Indices de la tabla `subcat`
--
ALTER TABLE `subcat`
  ADD PRIMARY KEY (`idSubCategoria`);

--
-- Indices de la tabla `Sucursales`
--
ALTER TABLE `Sucursales`
  ADD PRIMARY KEY (`ID_Sucursal`);

--
-- Indices de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `ID_Personal` (`ID_Personal`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `Caja` (`Caja`),
  ADD KEY `ID_Medio` (`ID_Medio`),
  ADD KEY `ID_Venta_T` (`ID_Destino`);

--
-- Indices de la tabla `Venta_Detalle`
--
ALTER TABLE `Venta_Detalle`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_Venta` (`ID_Venta`);

--
-- Indices de la tabla `Venta_T`
--
ALTER TABLE `Venta_T`
  ADD PRIMARY KEY (`ID_Destino`);

--
-- Indices de la tabla `vFinanciados`
--
ALTER TABLE `vFinanciados`
  ADD PRIMARY KEY (`ID_Abono`),
  ADD KEY `ID_Venta` (`ID_Venta`);

--
-- Indices de la tabla `ZConfig`
--
ALTER TABLE `ZConfig`
  ADD PRIMARY KEY (`ID_C`);

--
-- Indices de la tabla `ZMisc`
--
ALTER TABLE `ZMisc`
  ADD PRIMARY KEY (`ID_Misc`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Abonos`
--
ALTER TABLE `Abonos`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Banner`
--
ALTER TABLE `Banner`
  MODIFY `ID_Banner` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `Caja`
--
ALTER TABLE `Caja`
  MODIFY `ID_Caja` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `Caja_T`
--
ALTER TABLE `Caja_T`
  MODIFY `ID_Caja_T` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `ID_Categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `ID_Cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `codigos`
--
ALTER TABLE `codigos`
  MODIFY `idCodigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `Cuentas_Prove`
--
ALTER TABLE `Cuentas_Prove`
  MODIFY `ID_Cuentas` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cupon`
--
ALTER TABLE `Cupon`
  MODIFY `ID_Cupon` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Historial_Pagos`
--
ALTER TABLE `Historial_Pagos`
  MODIFY `ID_HistPagos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `Medio_Pago`
--
ALTER TABLE `Medio_Pago`
  MODIFY `ID_Medio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `M_Abonos`
--
ALTER TABLE `M_Abonos`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `M_MDetalles`
--
ALTER TABLE `M_MDetalles`
  MODIFY `ID_Detalle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `M_Mutualista`
--
ALTER TABLE `M_Mutualista`
  MODIFY `ID_Mutualista` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  MODIFY `ID_Pedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Pedidos_Abonos`
--
ALTER TABLE `Pedidos_Abonos`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Personal`
--
ALTER TABLE `Personal`
  MODIFY `ID_Personal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `ID_Producto` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT de la tabla `Productos_Sucursales`
--
ALTER TABLE `Productos_Sucursales`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  MODIFY `ID_Proveedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `Puestos`
--
ALTER TABLE `Puestos`
  MODIFY `ID_Puesto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `subcat`
--
ALTER TABLE `subcat`
  MODIFY `idSubCategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Sucursales`
--
ALTER TABLE `Sucursales`
  MODIFY `ID_Sucursal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `ID_Venta` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `Venta_Detalle`
--
ALTER TABLE `Venta_Detalle`
  MODIFY `ID_Detalle` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `Venta_T`
--
ALTER TABLE `Venta_T`
  MODIFY `ID_Destino` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vFinanciados`
--
ALTER TABLE `vFinanciados`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `ZConfig`
--
ALTER TABLE `ZConfig`
  MODIFY `ID_C` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ZMisc`
--
ALTER TABLE `ZMisc`
  MODIFY `ID_Misc` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Caja`
--
ALTER TABLE `Caja`
  ADD CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`ID_Personal`) REFERENCES `Personal` (`ID_Personal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Caja_ibfk_3` FOREIGN KEY (`ID_Caja_T`) REFERENCES `Caja_T` (`ID_Caja_T`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `Cuentas_Prove`
--
ALTER TABLE `Cuentas_Prove`
  ADD CONSTRAINT `Cuentas_Prove_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `Proveedores` (`ID_Proveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `Cupon`
--
ALTER TABLE `Cupon`
  ADD CONSTRAINT `cupon_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `Ventas` (`ID_Venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Personal`
--
ALTER TABLE `Personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `Sucursales` (`ID_Sucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Personal_ibfk_2` FOREIGN KEY (`ID_Puesto`) REFERENCES `Puestos` (`ID_Puesto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `Sucursales` (`ID_Sucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Productos_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `Categorias` (`ID_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Productos_Sucursales`
--
ALTER TABLE `Productos_Sucursales`
  ADD CONSTRAINT `fk_producto` FOREIGN KEY (`ID_Producto`) REFERENCES `Productos` (`ID_Producto`);

--
-- Filtros para la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `Clientes` (`ID_Cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_2` FOREIGN KEY (`ID_Personal`) REFERENCES `Personal` (`ID_Personal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_3` FOREIGN KEY (`ID_Medio`) REFERENCES `Medio_Pago` (`ID_Medio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_4` FOREIGN KEY (`ID_Destino`) REFERENCES `Venta_T` (`ID_Destino`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_5` FOREIGN KEY (`Caja`) REFERENCES `Personal` (`ID_Personal`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `Venta_Detalle`
--
ALTER TABLE `Venta_Detalle`
  ADD CONSTRAINT `Venta_Detalle_ibfk_2` FOREIGN KEY (`ID_Venta`) REFERENCES `Ventas` (`ID_Venta`) ON DELETE CASCADE,
  ADD CONSTRAINT `Venta_Detalle_ibfk_3` FOREIGN KEY (`ID_Producto`) REFERENCES `Productos` (`ID_Producto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
