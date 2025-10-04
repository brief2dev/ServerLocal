-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-08-2025 a las 17:05:24
-- Versión del servidor: 8.0.42
-- Versión de PHP: 8.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `izeek_PS`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ABCredito`
--

CREATE TABLE `ABCredito` (
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
-- Estructura de tabla para la tabla `Abonos`
--

CREATE TABLE `Abonos` (
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
-- Volcado de datos para la tabla `Abonos`
--

INSERT INTO `Abonos` (`ID_Abono`, `ID_Venta`, `ID_Cliente`, `Fecha`, `Saldo_Ant`, `Abono`, `Saldo_Pend`, `Estatus`, `ID_Medio`, `Fecha_Final`) VALUES
(1, 5, 2, '2023-06-20 12:13:58', 650, 0, 0, 1, 3, '2023-07-20'),
(2, 15, 4, '2023-06-28 15:34:51', 545, 0, 0, 1, 3, '2023-07-28'),
(3, 19, 2, '2023-07-03 15:47:42', 780, 0, 780, 1, 3, '2023-08-03'),
(4, 21, 4, '2023-07-07 13:24:25', 395, 0, 395, 1, 3, '2023-08-07'),
(6, 23, 2, '2024-10-16 07:52:40', 272.73, 0, 202.73, 1, 3, '2024-11-16');

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
(9, 13, 1, 1, 'Saldo para cambio ', '2023-06-25 12:34:21', 550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, NULL, NULL),
(10, 7, 1, 1, 'Abono del Credito con folio: 2 del Cliente: Isabel ', '2023-06-28 20:56:24', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL),
(11, 7, 1, 1, 'Abono del Credito con folio: 1 del Cliente: Mariel', '2023-07-03 13:39:02', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL),
(12, 7, 1, 1, 'Abono del Credito con folio: 2 del Cliente: Isabel ', '2023-07-10 11:54:35', 425, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL),
(13, 13, 1, 1, 'Abono del Credito con folio: 1 del Cliente: Mariel', '2023-07-19 12:09:34', 230, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL, NULL),
(15, 7, 1, 1, 'Abono del Credito con folio: 6 del Cliente: Mariel', '2024-10-16 08:10:17', 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL),
(16, 7, 1, 1, 'sddsxg ', '2025-03-10 21:26:01', 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL, NULL),
(17, 7, 1, 1, 'initi', '2025-03-10 21:26:22', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, NULL, NULL),
(18, 7, 1, 1, 'teste', '2025-05-03 20:29:47', 140.55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL, NULL);

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
(1, 'BLUSAS', 'Damasss', NULL, 1),
(2, 'PANTALONES', 'Dama', NULL, 1),
(3, 'CALZADO', 'Éngloba los zapatos de distintas marcas', NULL, 1),
(4, 'ACCESORIOS ', '', NULL, 1),
(5, 'ROPA ', '', NULL, 1),
(6, 'SNACK', 'Refescos, Papitas etc.', NULL, 1);

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
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Deudas`
--

CREATE TABLE `Deudas` (
  `ID_Deuda` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  `ID_Credito` int DEFAULT NULL COMMENT 'ID Abono',
  `ID_Personal` int DEFAULT NULL,
  `Anterior` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Pendiente` double DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Medio` int DEFAULT NULL,
  `estatus` int DEFAULT NULL COMMENT '0=deuda, 1=liquidado',
  `Tipo` int DEFAULT NULL COMMENT '2= venta, 3 = credito'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Deudas`
--

INSERT INTO `Deudas` (`ID_Deuda`, `ID_Cliente`, `ID_Credito`, `ID_Personal`, `Anterior`, `Abono`, `Pendiente`, `Fecha`, `ID_Medio`, `estatus`, `Tipo`) VALUES
(1, 2, 1, 7, 650, 200, 450, '2023-06-20 12:18:05', 2, NULL, NULL),
(2, 2, 1, 7, 450, 20, 430, '2023-06-24 11:46:12', 1, NULL, NULL),
(3, 4, 2, 7, 545, 120, 425, '2023-06-28 20:56:24', 1, NULL, NULL),
(4, 2, 1, 7, 430, 200, 230, '2023-07-03 13:39:02', 1, NULL, NULL),
(5, 4, 2, 7, 425, 425, 0, '2023-07-10 11:54:35', 1, NULL, NULL),
(6, 2, 1, 13, 230, 230, 0, '2023-07-19 12:09:34', 2, NULL, NULL),
(8, 2, 6, 7, 272.73, 70, 202.73, '2024-10-16 08:10:17', 1, NULL, NULL);

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
  `rol` varchar(100) NOT NULL,
  `Fecha_Registro` timestamp NULL DEFAULT NULL,
  `Baja` int DEFAULT '0' COMMENT '0=No, 1=Si',
  `visible` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Personal`
--

INSERT INTO `Personal` (`ID_Personal`, `Nombre`, `Apellido`, `Usuario`, `Bio`, `Comentarios`, `Colonia`, `CP`, `Correo`, `Pass`, `Contrasena`, `Telefono`, `Foto`, `ID_Sucursal`, `ID_Puesto`, `rol`, `Fecha_Registro`, `Baja`, `visible`) VALUES
(7, 'Mariel', 'Santos', NULL, NULL, 'Encargado del dep de Sistemas', NULL, NULL, '', '12', '', '9971259967', 'lib/Personal/img/IMG_0920.jpeg', 1, 1, '', '2023-03-20 06:00:00', 0, 1),
(13, 'Isabel', 'May Salazar', NULL, NULL, 'dsfsdf', NULL, NULL, NULL, '7168', '', '9971112771', 'lib/Personal/img/cd.png', 1, 3, '', '2023-05-21 06:00:00', 0, 1),
(14, 'laura', 'Segura', NULL, NULL, '', NULL, NULL, NULL, '0794', '', '9991110212', 'lib/Personal/img/blitz_SN.png', 1, 3, '', '2023-06-21 06:00:00', 0, 1);

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
  `Destacado` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Indica si esta promociónado 0=NO, 1=SI',
  `Online` int DEFAULT '0' COMMENT 'Indica si esta en WebApp 0=NO, 1=SI',
  `can` int DEFAULT '0' COMMENT '0=NO, 1=SI Indica si el producto esta dado de baja',
  `cant` int DEFAULT NULL COMMENT 'Indica la cantidad agregada al resurtir el usuario',
  `Calzado` varchar(10) DEFAULT NULL COMMENT 'indica si es calzado o otros productos 1 = SI, 0 = NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`ID_Producto`, `Codigo`, `Nombre`, `Descripcion`, `N_Calzado`, `Marca`, `Foto1`, `Foto2`, `Foto3`, `Foto4`, `Foto5`, `item1`, `item2`, `item3`, `item4`, `item5`, `item6`, `item7`, `item8`, `item9`, `item10`, `PrecioVenta`, `PrecioCompra`, `Precio_Tachado`, `Existencia`, `ID_Sucursal`, `ID_Categoria`, `ID_SubCat`, `Fecha_Ingreso`, `ID_Proveedor`, `Importado`, `visto`, `Destacado`, `Online`, `can`, `cant`, `Calzado`) VALUES
(5, '0767274250', 'Producto 1', 'TENNIS BASKET NGO/PTA', '25', NULL, 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 970.00, 510.00, NULL, 6, 1, 3, 6, '2025-03-11 05:15:15', 2, NULL, 0, 'SI', 1, 5, NULL, '1'),
(6, '1301966260', 'Producto 2', 'TENIS USO RUDO GRIS OXFORD', '26', NULL, 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.44, NULL, 1, 1, 3, 6, '2023-06-01 04:54:50', 2, NULL, 1, 'SI', 1, 0, NULL, '1'),
(7, '1301966265', 'Producto 3', 'CALZADO USO RUDO GRIS OXFORD', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.55, NULL, 1, 1, 3, 6, '2023-06-01 05:00:18', 2, NULL, 1, 'SI', 1, 0, NULL, '1'),
(8, '1301966270', 'Producto 4', 'CALZADO USO RUDO GRIS OXFORD', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.44, NULL, 1, 1, 3, 6, '2023-06-01 05:01:58', 2, NULL, 1, 'NO', 0, 0, NULL, '1'),
(9, '1301966275', 'Producto 5', 'CALZADO USO RUDO GRIS OXFORD', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.44, NULL, 1, 1, 3, 6, '2023-06-01 05:03:05', 2, NULL, 1, 'NO', 0, 0, NULL, '1'),
(10, '1301966280', NULL, 'CALZADO USO RUDO GRIS OXFORD', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 895.00, 450.44, NULL, 1, 1, 3, 6, '2023-06-01 05:04:12', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
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
(44, '3005279265', NULL, 'TACOS BLANCO PLATA ', '26.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 825.00, 413.09, NULL, 1, 1, 3, 6, '2023-06-01 18:08:38', 2, NULL, 1, NULL, NULL, 0, NULL, '1'),
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
(125, '002245', NULL, 'AIR MAX LILA ', '24.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 430.00, 215.00, NULL, 2, 1, 3, 6, '2023-06-24 20:42:05', 9, NULL, 1, NULL, NULL, 0, NULL, '1'),
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
(183, '0010260', NULL, 'PUMA REY', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 01:46:22', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(184, '0010270', NULL, 'PUMA REY', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 01:47:42', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(185, '0010275', NULL, 'PUMA REY', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 01:48:39', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(186, '0010280', NULL, 'PUMA REY', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 01:49:26', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(187, '0010285', NULL, 'PUMA REY', '28.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 01:50:18', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(188, '0010290', NULL, 'PUMA REY', '29', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 475.00, 235.00, NULL, 1, 1, 3, 6, '2023-06-02 01:51:00', 10, NULL, 1, NULL, NULL, 0, NULL, '1'),
(189, '0011260', NULL, 'TOMY BLANCO TOTAL ', '26', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 01:55:55', 11, NULL, 1, NULL, NULL, 0, NULL, '1'),
(190, '0011270', NULL, 'TOMY BLANCO TOTAL', '27', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 01:57:17', 11, NULL, 1, NULL, NULL, 0, NULL, '1'),
(191, '0011275', NULL, 'TOMY BLANCO TOTAL', '27.5', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 02:03:09', 11, NULL, 1, NULL, NULL, 0, NULL, '1');
INSERT INTO `Productos` (`ID_Producto`, `Codigo`, `Nombre`, `Descripcion`, `N_Calzado`, `Marca`, `Foto1`, `Foto2`, `Foto3`, `Foto4`, `Foto5`, `item1`, `item2`, `item3`, `item4`, `item5`, `item6`, `item7`, `item8`, `item9`, `item10`, `PrecioVenta`, `PrecioCompra`, `Precio_Tachado`, `Existencia`, `ID_Sucursal`, `ID_Categoria`, `ID_SubCat`, `Fecha_Ingreso`, `ID_Proveedor`, `Importado`, `visto`, `Destacado`, `Online`, `can`, `cant`, `Calzado`) VALUES
(192, '0011280', NULL, 'TOMY BLANCO TOTAL', '28', NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 415.00, 205.00, NULL, 1, 1, 3, 6, '2023-06-02 02:04:02', 11, NULL, 1, NULL, NULL, 0, NULL, '1'),
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
(214, '187', NULL, 'BLUSA BLANCA TALLA S', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250.00, 127.00, NULL, 0, 1, 1, 6, '2023-06-02 02:45:36', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(215, '191', NULL, 'PANTALON LICRA NEGRO SPORT T M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 153.00, NULL, 1, 1, 2, 6, '2023-06-02 02:49:53', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(216, '315', NULL, 'PLAYERA NEGRO MANGA LARGA T.M', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 435.00, 215.00, NULL, 1, 1, 1, 6, '2023-06-02 02:53:42', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(217, '180', NULL, 'PANTALON LICRA BLANCO T.S', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 290.20, 148.00, NULL, 1, 1, 2, 6, '2023-06-02 02:54:57', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(218, '280', NULL, 'CAMISA BLANCO T.S', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 370.00, 191.00, NULL, 1, 1, 1, 6, '2023-06-02 02:55:54', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
(219, '1800', NULL, 'BLUSA NEGRO GRIS TALLA S', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 295.00, 123.00, NULL, 1, 1, 1, 6, '2023-06-02 17:31:53', 5, NULL, 1, NULL, NULL, 0, NULL, '0'),
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
(278, '7501022013885', NULL, 'Refresco 7UP 400 ml', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12.00, 7.00, NULL, 0, 1, 6, 6, '2023-06-20 16:50:52', 7, NULL, 1, 'NO', 0, 0, NULL, '0'),
(279, '7501031302802', 'Chesco', 'Refresco Manzanita sol 400ml', NULL, NULL, 'https://sys.powersports.top/lib/Productos/img/279/cd.png', 'https://sys.powersports.top/lib/Productos/img/279/w2.jpg', NULL, NULL, '1', NULL, '8', NULL, '87', '5', NULL, '07', NULL, NULL, NULL, 12.00, 800.00, 545.00, 5, 1, 6, 5, '2023-06-20 16:51:59', 7, NULL, 1, '1', 1, 1, NULL, '0'),
(280, '7501031302819', 'Producto 5', 'Refresco Mirinda 400ml', NULL, NULL, 'lib/Productos/img/blitz_SN.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12.00, 7.00, NULL, 1, 1, 6, 6, '2023-06-20 16:52:49', 7, NULL, 1, 'NO', 0, 0, NULL, '0'),
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
(300, 'IZATCH', 'PANTALON', 'DEFEFEFEFE TCH', 'TCH', NULL, 'https://sys.powersports.top/lib/Productos/img/IZATCH/fc010c5f0249a2b72075013b6bff8b7d.jpeg', 'https://sys.powersports.top/lib/Productos/img/IZATCH/41f5EJ939aL._AC_SY1000_.jpg', 'https://sys.powersports.top/lib/Productos/img/blitz_SN.png', 'https://sys.powersports.top/lib/Productos/img/IZATCH/images-3.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59.32, 35.00, 60.00, 24, 1, 2, 4, '2024-10-21 12:05:22', 2, NULL, 1, '0', 0, 0, NULL, '0');

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
(1, 'DEPORTES', 'kxkdssdkfjsdk', 1),
(2, 'PANTALONES', 'Dama', 1),
(3, 'NIÑOS', NULL, 1),
(4, 'DAMA', NULL, 1),
(5, 'CABALLERO', NULL, 1),
(6, 'OTROS', NULL, 1);

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
(1, 'PowerSports', 'PAAV630203VDA', 'Ticul', 'Yucatan', 'C-24 x 29 y 27', 'contacto@powersports.top', 'Centro', 97880, NULL, NULL, '5660436605', 'lib/Empresa/img/Recurso 6-100.jpg', NULL, 'Virginia Ake', '5649562263', NULL, NULL, '#08c287', '#00D855', '', '', '', 41, 1),
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
(4, 7, 1, 7, 1, 0, '2023-06-20', '10:54:29', 2.04, 17, 12.00, 1.5936, 9.96, 10.00, 0.04, 1, '', 1, 8, 0, 1, NULL),
(5, 7, 2, 7, 2, 0, '2023-06-20', '12:13:58', 0.00, 0, 650.00, 104, 650.00, 0.00, -650.00, 3, '', 1, 8, 1, 1, '2023-07-20'),
(6, 13, 1, 13, 1, 0, '2023-06-21', '19:34:48', 47.00, 10, 470.00, 67.68, 423.00, 500.00, 77.00, 1, '', 1, 8, 0, 1, NULL),
(7, 14, 3, 14, 2, 0, '2023-06-21', '19:42:34', 93.40, 5, 1868.00, 283.936, 1774.60, 0.00, -1774.60, 1, '', 1, 8, 0, 1, NULL),
(8, 13, 1, 13, 1, 0, '2023-06-21', '19:44:10', 0.00, 0, 410.00, 65.6, 410.00, 410.00, 0.00, 1, '', 1, 8, 0, 1, NULL),
(9, 7, 4, 7, 1, 0, '2023-06-23', '17:46:54', 0.00, 0, 250.00, 40, 250.00, 250.00, 0.00, 1, '', 1, 8, 0, 1, NULL),
(10, 7, 2, 7, 1, 0, '2023-06-24', '11:41:34', 0.00, 0, 12.00, 1.92, 12.00, 12.00, 0.00, 1, '', 1, 8, 0, 1, NULL),
(11, 7, 1, 7, 1, 0, '2023-06-24', '14:01:27', 72.00, 10, 720.00, 103.68, 648.00, 648.00, 0.00, 1, '', 1, 8, 0, 1, NULL),
(12, 13, 1, 13, 1, 0, '2023-06-25', '10:25:28', 0.00, 0, 24.00, 3.84, 24.00, 50.00, 26.00, 1, '', 1, 8, 0, 1, NULL),
(13, 7, 1, 7, 1, 0, '2023-06-27', '12:53:25', 0.00, 0, 12.00, 1.92, 12.00, 20.00, 8.00, 1, '', 0, NULL, 0, 1, NULL),
(14, 13, 1, 13, 1, 0, '2023-06-28', '14:23:52', 0.00, 0, 12.00, 1.92, 12.00, 12.00, 0.00, 1, '', 0, NULL, 0, 1, NULL),
(15, 13, 1, 13, 1, 0, '2023-06-28', '15:34:51', 0.00, 0, 545.00, 87.2, 545.00, 0.00, -545.00, 3, '', 0, NULL, 1, 1, '2023-07-28'),
(16, 7, 2, 7, 1, 0, '2023-06-29', '12:01:22', 0.00, 0, 12.00, 1.92, 12.00, 20.00, 8.00, 1, '', 0, NULL, 0, 1, NULL),
(17, 7, 2, 7, 1, 0, '2023-07-03', '13:45:57', 0.00, 0, 12.00, 1.92, 12.00, 12.00, 0.00, 1, '', 0, NULL, 0, 1, NULL),
(19, 7, 2, 7, 1, 0, '2023-07-03', '15:47:42', 0.00, 0, 780.00, 124.8, 780.00, 0.00, -780.00, 3, '', 0, NULL, 1, 1, '2023-08-03'),
(20, 7, 2, 7, 1, 0, '2023-07-05', '11:03:10', 0.00, 0, 12.00, 1.92, 12.00, 12.00, 0.00, 1, '', 0, NULL, 0, 1, NULL),
(21, 7, 4, 7, 1, 0, '2023-07-07', '13:24:25', 0.00, 0, 395.00, 63.2, 395.00, 0.00, -395.00, 3, '', 0, NULL, 1, 1, '2023-08-07'),
(23, 7, 2, 7, 1, 0, '2024-10-16', '07:52:40', 0.00, 0, 272.73, 43.6368, 272.73, 0.00, -272.73, 3, 'aprt', 0, NULL, 1, 1, '2024-11-16'),
(24, 7, 1, 7, 1, 0, '2025-02-27', '01:05:23', 0.00, 0, 440.00, 70.4, 440.00, 500.00, 60.00, 1, '', 0, NULL, 0, 1, NULL);

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
(4, 279, 1, 4),
(5, 273, 1, 5),
(6, 129, 1, 6),
(7, 74, 1, 7),
(8, 90, 1, 7),
(9, 247, 1, 7),
(10, 213, 1, 8),
(11, 229, 1, 9),
(12, 280, 1, 10),
(13, 52, 1, 11),
(14, 278, 1, 12),
(15, 280, 1, 12),
(16, 278, 1, 13),
(17, 278, 1, 14),
(18, 214, 1, 15),
(19, 282, 1, 15),
(20, 278, 1, 16),
(21, 279, 1, 17),
(24, 207, 1, 19),
(25, 181, 1, 19),
(26, 279, 1, 20),
(27, 142, 1, 21),
(31, 296, 1, 23),
(32, 159, 1, 24);

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
(51, 1, 7, '2025-05-03', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ABCredito`
--
ALTER TABLE `ABCredito`
  ADD PRIMARY KEY (`ID_Abono`);

--
-- Indices de la tabla `Abonos`
--
ALTER TABLE `Abonos`
  ADD PRIMARY KEY (`ID_Abono`),
  ADD KEY `ID_Venta` (`ID_Venta`);

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
-- Indices de la tabla `Deudas`
--
ALTER TABLE `Deudas`
  ADD PRIMARY KEY (`ID_Deuda`);

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
-- AUTO_INCREMENT de la tabla `ABCredito`
--
ALTER TABLE `ABCredito`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Abonos`
--
ALTER TABLE `Abonos`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Banner`
--
ALTER TABLE `Banner`
  MODIFY `ID_Banner` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `Caja`
--
ALTER TABLE `Caja`
  MODIFY `ID_Caja` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `Caja_T`
--
ALTER TABLE `Caja_T`
  MODIFY `ID_Caja_T` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `ID_Categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `ID_Cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `codigos`
--
ALTER TABLE `codigos`
  MODIFY `idCodigo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cuentas_Prove`
--
ALTER TABLE `Cuentas_Prove`
  MODIFY `ID_Cuentas` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cupon`
--
ALTER TABLE `Cupon`
  MODIFY `ID_Cupon` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Deudas`
--
ALTER TABLE `Deudas`
  MODIFY `ID_Deuda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `ID_Mutualista` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `ID_Personal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `ID_Producto` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

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
  MODIFY `idSubCategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Sucursales`
--
ALTER TABLE `Sucursales`
  MODIFY `ID_Sucursal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `ID_Venta` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `Venta_Detalle`
--
ALTER TABLE `Venta_Detalle`
  MODIFY `ID_Detalle` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `Venta_T`
--
ALTER TABLE `Venta_T`
  MODIFY `ID_Destino` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ZConfig`
--
ALTER TABLE `ZConfig`
  MODIFY `ID_C` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ZMisc`
--
ALTER TABLE `ZMisc`
  MODIFY `ID_Misc` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
