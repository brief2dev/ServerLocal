-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 19-10-2025 a las 18:37:05
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
-- Base de datos: `iZeek_PS`
--
CREATE DATABASE IF NOT EXISTS `iZeek_PS` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `iZeek_PS`;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Banner`
--

CREATE TABLE `Banner` (
  `ID_Banner` int NOT NULL,
  `imagen` varchar(900) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caja_T`
--

CREATE TABLE `Caja_T` (
  `ID_Caja_T` int NOT NULL,
  `Motivo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medio_Pago`
--

CREATE TABLE `Medio_Pago` (
  `ID_Medio` int NOT NULL,
  `Tipo` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Puestos`
--

CREATE TABLE `Puestos` (
  `ID_Puesto` int NOT NULL,
  `Cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venta_T`
--

CREATE TABLE `Venta_T` (
  `ID_Destino` int NOT NULL,
  `Destino` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ZConfig`
--

CREATE TABLE `ZConfig` (
  `ID_C` int NOT NULL,
  `Tiempo` varchar(10) NOT NULL,
  `Interes` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Banner`
--
ALTER TABLE `Banner`
  MODIFY `ID_Banner` int NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `ID_Categoria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `ID_Cliente` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `ID_Deuda` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Medio_Pago`
--
ALTER TABLE `Medio_Pago`
  MODIFY `ID_Medio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `M_Abonos`
--
ALTER TABLE `M_Abonos`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `M_MDetalles`
--
ALTER TABLE `M_MDetalles`
  MODIFY `ID_Detalle` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `ID_Personal` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `ID_Producto` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  MODIFY `ID_Proveedor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Puestos`
--
ALTER TABLE `Puestos`
  MODIFY `ID_Puesto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcat`
--
ALTER TABLE `subcat`
  MODIFY `idSubCategoria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Sucursales`
--
ALTER TABLE `Sucursales`
  MODIFY `ID_Sucursal` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `ID_Venta` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Venta_Detalle`
--
ALTER TABLE `Venta_Detalle`
  MODIFY `ID_Detalle` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Venta_T`
--
ALTER TABLE `Venta_T`
  MODIFY `ID_Destino` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ZConfig`
--
ALTER TABLE `ZConfig`
  MODIFY `ID_C` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ZMisc`
--
ALTER TABLE `ZMisc`
  MODIFY `ID_Misc` int NOT NULL AUTO_INCREMENT;

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
