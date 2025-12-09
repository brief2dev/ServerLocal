-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 09-12-2025 a las 14:23:49
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

--
-- Volcado de datos para la tabla `Caja_T`
--

INSERT INTO `Caja_T` (`ID_Caja_T`, `Motivo`) VALUES
(1, 'Ingreso'),
(2, 'Retiro');

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

--
-- Volcado de datos para la tabla `Solicitudes`
--

INSERT INTO `Solicitudes` (`ID_Solicitud`, `Fecha_Solicitud`, `Fecha_Creacion`, `Fecha_Aceptado`, `Asunto`, `ID_Colaborador`, `ID_Departamento`, `ID_Autoriza`, `Comentario`, `Respuesta`, `Solventacion1`, `ID_Salida`, `Estatus`, `ID_Administracion`) VALUES
(1, '2025-07-14', '2025-07-14', NULL, 'Solicitud de materiales', 1, 4, NULL, 'Por medio de la presente, la que suscribe Licda. Maritza de Jesus Escamilla Valle, Directora del departamento de Catastro de Santa Elena, se dirige a usted con el debido respeto para solicitar materiales mismos que servirán para desempeñar las labores del departamento y su correcto orden le solicito la sig. lista de materiales:\r\n\r\n•	3 Postick\r\n•	3 Cajas Clip pequeños\r\n•	1 Paquete de Lapiceros (Color azul)\r\n•	3 Paquete de hojas tamaño carta\r\n•	1 Bote de pintura Roja en aerosol\r\n•	1 Bote de pintura Negro en aerosol\r\n•	1 Paquete de marcadores para pintaron\r\n•	1 Cinta para medir de 100m\r\n•	1 Trapeador y jalador\r\n•	1 Pinol\r\n•	1 Paquete de carpetas Verde', NULL, NULL, NULL, 1, 3),
(2, '2025-10-20', '2025-10-14', NULL, 'nueva computadora', 1, 4, NULL, 'erjhery djh jhdbj jerjuhyg', NULL, NULL, NULL, 1, 3);

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
-- Volcado de datos para la tabla `Teso_Lic_Tarifa`
--

INSERT INTO `Teso_Lic_Tarifa` (`ID_Lic`, `Giro`, `Expedicion`, `Renovacion`, `importado`) VALUES
(1, 'Agencia de vehiculos compra/venta', '12224', '10688', 'by <⚡︎> Blitzc0de'),
(2, 'Agencia de viajes', '9359', '2924', 'by <⚡︎> Blitzc0de'),
(3, 'Alfarerías Taller y Expendios', '1359', '406', 'by <⚡︎> Blitzc0de'),
(4, 'Antenas repetidoras de señal', '105288', '46794', 'by <⚡︎> Blitzc0de'),
(5, 'Aseguradoras de vehiculos(campañias aseguradoras)', '2924', '1754', 'by <⚡︎> Blitzc0de'),
(6, 'Bancos', '92126', '27624', 'by <⚡︎> Blitzc0de'),
(7, 'Bisuterías', '3439', '1033', 'by <⚡︎> Blitzc0de'),
(8, 'Bodegas de almacenamiento (por M2)', '8', '4', 'by <⚡︎> Blitzc0de'),
(9, 'cajas de ahorro ', '9448', '2362', 'by <⚡︎> Blitzc0de'),
(10, 'Carnicería mayorista', '7476', '2492', 'by <⚡︎> Blitzc0de'),
(11, 'Carnicerías, pollerías, pescaderías', '5897', '1769', 'by <⚡︎> Blitzc0de'),
(12, 'Carpinterías', '1228', '369', 'by <⚡︎> Blitzc0de'),
(13, 'Casas de empeño', '42993', '12898', 'by <⚡︎> Blitzc0de'),
(14, 'Casinos', '22110', '3791', 'by <⚡︎> Blitzc0de'),
(15, 'Centro de distribución, almacenamiento, venta, embotellamiento o empaquetamineto de bebidas embotelladas.', '87740', '35096', 'by <⚡︎> Blitzc0de'),
(16, 'Centro de distribución, almacenamiento, venta, embotellamiento o empaquetamiento de productos comerciales.', '87740', '26907', 'by <⚡︎> Blitzc0de'),
(17, 'Centro de distribución, almacenamiento, venta, embotellamiento empaquetamiento de bebidas alchólicas embotelladas', '116985', '40945', 'by <⚡︎> Blitzc0de'),
(18, 'Centro de bordado computarizado y/o personalizado', '4679', '2339', 'by <⚡︎> Blitzc0de'),
(19, 'Centro de distribución y venta de Acero', '52644', '11699', 'by <⚡︎> Blitzc0de'),
(20, 'Centro de cómputo y/o ciber/ciber café', '640', '296', 'by <⚡︎> Blitzc0de'),
(21, 'Centro de distribución de bebidas embotelladas', '128977', '38693', 'by <⚡︎> Blitzc0de'),
(22, 'Centros de foto estudio y grabación', '2212', '664', 'by <⚡︎> Blitzc0de'),
(23, 'Centro de radiología y ultrasonido', '22750', '6819', 'by <⚡︎> Blitzc0de'),
(24, 'Cinemas', '42993', '20882', 'by <⚡︎> Blitzc0de'),
(25, 'Clínicas', '17197', '5162', 'by <⚡︎> Blitzc0de'),
(26, 'Cocina económica', '983', '308', 'by <⚡︎> Blitzc0de'),
(27, 'Consultorio médico', '8599', '2580', 'by <⚡︎> Blitzc0de'),
(28, 'Despachos contables y jurídicos', '3070', '922', 'by <⚡︎> Blitzc0de'),
(29, 'Distribución de telefonías y medios de comunicación', '4387', '1828', 'by <⚡︎> Blitzc0de'),
(30, 'Distribución de televisión de paga satelital', '39308', '11793', 'by <⚡︎> Blitzc0de'),
(31, 'Empresas generadoras, comercializadoras, distribuidoras y transmisoras de energía eléctrica', '29246464', '17547878', 'by <⚡︎> Blitzc0de'),
(32, 'Empresas generadoras, comercializadoras, distribuidoras y transmisoras de energía eléctrica renovable (eólica, fotovoltaica)', '29264464', '17547878', 'by <⚡︎> Blitzc0de'),
(33, 'Equipos médicos y aparatos órtopedicos compra/venta', '5849', '2339', 'by <⚡︎> Blitzc0de'),
(34, 'Escuela y academias', '12283', '3685', 'by <⚡︎> Blitzc0de'),
(35, 'Estableciminetos que impartan clases de aeróbicas y otros ', '3510', '1687', 'by <⚡︎> Blitzc0de'),
(36, 'Establecimientos que renten consolas de video juegos', '4679', '2339', 'by <⚡︎> Blitzc0de'),
(37, 'Estancias infantiles', '36858', '2211', 'by <⚡︎> Blitzc0de'),
(38, 'Esteticas unisex y peluquerías', '615', '369', 'by <⚡︎> Blitzc0de'),
(39, 'Expendio de hielo', '1228', '369', 'by <⚡︎> Blitzc0de'),
(40, 'Expendio de llenado de agua purificada', '4867', '1655', 'by <⚡︎> Blitzc0de'),
(41, 'Expendio de refrescos naturales', '1106', '333', 'by <⚡︎> Blitzc0de'),
(42, 'Expendio de alimentos balanceados', '3070', '922', 'by <⚡︎> Blitzc0de'),
(43, 'Expendio de refrescos ', '2212', '664', 'by <⚡︎> Blitzc0de'),
(44, 'Fabrica de suelas y tacones', '39370', '17548', 'by <⚡︎> Blitzc0de'),
(45, 'Fabrica de cajsa de cartón', '1228', '431', 'by <⚡︎> Blitzc0de'),
(46, 'Fábrica de jugos y saborines embolsados', '458', '275', 'by <⚡︎> Blitzc0de'),
(47, 'Farmacias, boticas y similares', '18425', '5528', 'by <⚡︎> Blitzc0de'),
(48, 'Financieras de créditos', '55276', '16583', 'by <⚡︎> Blitzc0de'),
(49, 'Florerías, funerarias', '3318', '1228', 'by <⚡︎> Blitzc0de'),
(50, 'Fondas', '983', '308', 'by <⚡︎> Blitzc0de'),
(51, 'Fruterías y legumbres compra/venta', '1843', '553', 'by <⚡︎> Blitzc0de'),
(52, 'Gaseras', '82300', '24691', 'by <⚡︎> Blitzc0de'),
(53, 'Gasolineras', '263010', '81071', 'by <⚡︎> Blitzc0de'),
(54, 'Gimnasios', '4094', '2339', 'by <⚡︎> Blitzc0de'),
(55, 'Hoteles, hospedajes, posdos', '22110', '3791', 'by <⚡︎> Blitzc0de'),
(56, 'Imprentas y agencias publicitarias', '5849', '2924', 'by <⚡︎> Blitzc0de'),
(57, 'Instituciones educativas del sector privado', '12283', '3685', 'by <⚡︎> Blitzc0de'),
(58, 'Joyería compra/venta de oro y plata', '4669', '1401', 'by <⚡︎> Blitzc0de'),
(59, 'Laboratorio de análisis clínicos', '12898', '3871', 'by <⚡︎> Blitzc0de'),
(60, 'Lavadero de vehículos (automóviles, motocicletas, otros)', '1828', '914', 'by <⚡︎> Blitzc0de'),
(61, 'Lavanderías', '1462', '381', 'by <⚡︎> Blitzc0de'),
(62, 'Llanteras', '548', '365', 'by <⚡︎> Blitzc0de'),
(63, 'Loncherías', '983', '308', 'by <⚡︎> Blitzc0de'),
(64, 'Materiales para construcción compra y venta', '6756', '2028', 'by <⚡︎> Blitzc0de'),
(65, 'Materiales, telas y textiles compra/venta', '5849', '2924', 'by <⚡︎> Blitzc0de'),
(66, 'Mudanzas y paqueterías', '7984', '2398', 'by <⚡︎> Blitzc0de'),
(67, 'Oficinas administrativas', '1462', '731', 'by <⚡︎> Blitzc0de'),
(68, 'Paleterías, nevería y dulcerías', '1843', '922', 'by <⚡︎> Blitzc0de'),
(69, 'Panaderías, tortillerías', '3076', '922', 'by <⚡︎> Blitzc0de'),
(70, 'Papelerías y cerntro de copiado', '6633', '1967', 'by <⚡︎> Blitzc0de'),
(71, 'Peleterías compra/venta de sínteticos y/o pieles', '12402', '3943', 'by <⚡︎> Blitzc0de'),
(72, 'Pizzería sin venta de cerveza', '2456', '994', 'by <⚡︎> Blitzc0de'),
(73, 'Planta purificadora de agua', '93589', '33746', 'by <⚡︎> Blitzc0de'),
(74, 'Plazas de toros', '12283', '36685', 'by <⚡︎> Blitzc0de'),
(75, 'Puestos de pronósticos y lotería', '1432', '716', 'by <⚡︎> Blitzc0de'),
(76, 'Puestos de ventas de libros, revistas, periódicos y discos', '861', '257', 'by <⚡︎> Blitzc0de'),
(77, 'Radio basede telefonia celular', '110551', '33165', 'by <⚡︎> Blitzc0de'),
(78, 'Recicladora (Por M2)', '10', '7', 'by <⚡︎> Blitzc0de'),
(79, 'Refaccionaria automotriz/motos compra/venta', '6112', '1834', 'by <⚡︎> Blitzc0de'),
(80, 'Refaccionarias de bicicletas compra/venta', '3057', '1019', 'by <⚡︎> Blitzc0de'),
(81, 'Refaccionarias electrónicas', '3057', '1019', 'by <⚡︎> Blitzc0de'),
(82, 'Restaurante sin venta de cervaza', '3076', '922', 'by <⚡︎> Blitzc0de'),
(83, 'Rosticerías y asaderos', '983', '308', 'by <⚡︎> Blitzc0de'),
(84, 'Salas de fiestas Tipo A (capacidad mayor de 200 personas)', '12283', '3685', 'by <⚡︎> Blitzc0de'),
(85, 'Sala de fiestas Tipos B (capcidad menor de 200 personas)', '6024', '2007', 'by <⚡︎> Blitzc0de'),
(86, 'Servicio de sistemas de televisión por cable', '2983139', '17548', 'by <⚡︎> Blitzc0de'),
(87, 'Supermercado (cadenas) sin venta de bebidas alcohólicas', '15473', '6141', 'by <⚡︎> Blitzc0de'),
(88, 'Taller de maquila de ropa, satrerías y confección', '5439', '1498', 'by <⚡︎> Blitzc0de'),
(89, 'Taller de reparación de celulares, tablet y laptops', '1771', '553', 'by <⚡︎> Blitzc0de'),
(90, 'Tallerres de automóviles', '4299', '1843', 'by <⚡︎> Blitzc0de'),
(91, 'Taller de bicicletas y triciclos', '612', '203', 'by <⚡︎> Blitzc0de'),
(92, 'Talleres de motocicletas', '1371', '640', 'by <⚡︎> Blitzc0de'),
(93, 'Talleres de reparaciones eléctricas', '1228', '680', 'by <⚡︎> Blitzc0de'),
(94, 'Talleres de torno y herrería en general', '431', '234', 'by <⚡︎> Blitzc0de'),
(95, 'Talleres mecánicos y/u hojalatería', '4299', '1843', 'by <⚡︎> Blitzc0de'),
(96, 'Taquerías', '983', '308', 'by <⚡︎> Blitzc0de'),
(97, 'Telefonías celulares compra/venta', '3685', '1106', 'by <⚡︎> Blitzc0de'),
(98, 'Terminales o sitios de taxis, autobuses', '23397', '11249', 'by <⚡︎> Blitzc0de'),
(99, 'Tienda de abarrotes, supermercados (gama media)', '7748', '3070', 'by <⚡︎> Blitzc0de'),
(100, 'Tienda de línea blanca', '10528', '2866', 'by <⚡︎> Blitzc0de'),
(101, 'Tienda de ventas de pinturas', '7369', '2106', 'by <⚡︎> Blitzc0de'),
(102, 'Tiendas departamentales', '36850', '11055', 'by <⚡︎> Blitzc0de'),
(103, 'Tiendas de ropa y almacenes', '8599', '3318', 'by <⚡︎> Blitzc0de'),
(104, 'Tiendas, tendejones y misceláneas', '799', '246', 'by <⚡︎> Blitzc0de'),
(105, 'Tlapalerías - Ferretería', '7369', '2211', 'by <⚡︎> Blitzc0de'),
(106, 'Veterrinarias', '1096', '641', 'by <⚡︎> Blitzc0de'),
(107, 'Videoclubes en general', '2456', '737', 'by <⚡︎> Blitzc0de'),
(108, 'Zapaterías taller y expendios', '4299', '1299', 'by <⚡︎> Blitzc0de');

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
  MODIFY `ID_Caja_T` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Solicitudes`
--
ALTER TABLE `Solicitudes`
  MODIFY `ID_Solicitud` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `ID_Lic` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
