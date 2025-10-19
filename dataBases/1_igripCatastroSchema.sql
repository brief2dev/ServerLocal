-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 19-10-2025 a las 17:16:58
-- Versión del servidor: 9.2.0
-- Versión de PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `SE_Catastro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `SE_Catastro`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cdl_Motiv`
--

CREATE TABLE `Cdl_Motiv` (
  `ID_Motivo` int NOT NULL,
  `Nombre` varchar(125) DEFAULT NULL,
  `Descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cedulas`
--

CREATE TABLE `Cedulas` (
  `ID_Cedula` int NOT NULL,
  `ID_Propiedad` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Motivo` int DEFAULT NULL,
  `ID_Personal` int DEFAULT NULL,
  `Observ` varchar(850) DEFAULT NULL,
  `ID_Administracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cobros`
--

CREATE TABLE `Cobros` (
  `ID_Cobro` int NOT NULL,
  `ID_Personal` int DEFAULT NULL COMMENT 'ID del personal que genero el cobro',
  `ID_Propiedad` int DEFAULT NULL,
  `Fecha_Gen` datetime DEFAULT NULL COMMENT 'Fecha de generacion',
  `Fecha_Cobro` datetime DEFAULT NULL COMMENT 'Fecha que se cobro',
  `Subtotal` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `Desc_Porc` decimal(10,2) DEFAULT NULL COMMENT 'Descuento en porcentaje',
  `Desc_Peso` decimal(10,2) DEFAULT NULL COMMENT 'Descuento en pesos',
  `ID_Cobrador` int DEFAULT NULL,
  `Comentarios` varchar(850) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tipo_Pago` int DEFAULT NULL COMMENT '1=Efectivo, 3=Tarjeta',
  `Efectivo` int DEFAULT NULL COMMENT 'efectivo entregado',
  `Cambio` int DEFAULT NULL COMMENT 'cambio devuelto',
  `Corte` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `ID_Corte` int DEFAULT NULL,
  `Origen` int DEFAULT NULL COMMENT '1=app,2=web,3=ventanilla,4=comercios,5=domicilio',
  `Verificado` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `ID_Administracion` int DEFAULT NULL,
  `ID_Movimiento` int DEFAULT NULL COMMENT 'Constancia, predial, verificacion, etc',
  `ManualC` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '0=NO, 1=SI'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CobrosDetalle`
--

CREATE TABLE `CobrosDetalle` (
  `ID_Detalle` int NOT NULL,
  `ID_Servicio` int NOT NULL,
  `Cantidad` int NOT NULL,
  `ID_Cobro` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cuadrante`
--

CREATE TABLE `Cuadrante` (
  `ID_Cuadrante` int NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CuadranteRusticos`
--

CREATE TABLE `CuadranteRusticos` (
  `ID_Cuadrante` int NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Movimientos`
--

CREATE TABLE `Movimientos` (
  `ID_Movimiento` int NOT NULL,
  `ID_Propiedad` int DEFAULT NULL,
  `Anio` varchar(20) DEFAULT NULL COMMENT 'Solo aplicable a predial',
  `CantidadAnios` int DEFAULT NULL COMMENT 'solo si es predial',
  `Fecha` datetime DEFAULT NULL,
  `Tipo` int DEFAULT NULL COMMENT 'Tipo de tramite',
  `Comentarios` varchar(850) DEFAULT NULL,
  `Observacion` varchar(300) DEFAULT NULL COMMENT 'comentarios de la propiedad si es fundo legar se pone los detalles y nimbre de la persona',
  `Estatus` int DEFAULT NULL COMMENT '1=Pendiente, 2=Finalizado, 3=Pospuesto ',
  `Migrado` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Pagado` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `ID_Administracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Oficios`
--

CREATE TABLE `Oficios` (
  `ID_Oficio` int NOT NULL,
  `FechaOficio` timestamp NULL DEFAULT NULL,
  `FechaSolicitud` timestamp NULL DEFAULT NULL,
  `ID_Propiedad` int DEFAULT NULL,
  `ID_Colaborador` int DEFAULT NULL,
  `Tipo` int DEFAULT NULL COMMENT '1=Asignacion, 2=Division, 3=Rectificacion',
  `Frente` decimal(15,2) DEFAULT NULL,
  `Fondo` decimal(15,2) DEFAULT NULL,
  `Area` decimal(15,2) DEFAULT NULL,
  `Construcc` decimal(15,2) DEFAULT NULL,
  `valCata` decimal(15,2) DEFAULT NULL,
  `FrenteNew` decimal(15,2) DEFAULT NULL,
  `FondoNew` decimal(15,2) DEFAULT NULL,
  `AreaNew` decimal(15,2) DEFAULT NULL,
  `ConstruccNew` decimal(15,2) DEFAULT NULL,
  `valCataNew` decimal(15,2) DEFAULT NULL,
  `Visible` int DEFAULT '1',
  `Titulo` varchar(170) DEFAULT NULL,
  `ID_Administracion` varchar(15) DEFAULT NULL,
  `Destinatario` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo1` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo2` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo3` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo4` varchar(640) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Oficio_tipo`
--

CREATE TABLE `Oficio_tipo` (
  `ID_TipOficio` int NOT NULL,
  `Nombre` varchar(720) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo1` varchar(720) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo2` varchar(720) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo3` varchar(720) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo4` varchar(720) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Propiedades`
--

CREATE TABLE `Propiedades` (
  `ID_Propiedad` int NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `Numero` varchar(13) DEFAULT NULL,
  `Cruzamientos` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Seccion` varchar(6) DEFAULT NULL,
  `Manzana` varchar(6) DEFAULT NULL,
  `Municipio` varchar(85) DEFAULT NULL,
  `Estado` varchar(85) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Latitud` decimal(11,7) DEFAULT NULL COMMENT 'coordenadas promedio del predio',
  `Longitud` decimal(11,7) DEFAULT NULL,
  `Colonia` int DEFAULT NULL,
  `Propietarios` varchar(450) DEFAULT NULL,
  `Clase` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '0=urbano, 1=rustico etc',
  `Uso` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ejem. solar, vivienda,csa, habitacion, etc',
  `Tipo` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '3=Tablaje, 2=Fundo Legal, 1=Propiedad',
  `NumeroTablaje` varchar(11) DEFAULT NULL,
  `Area` decimal(13,2) DEFAULT NULL,
  `Perimetro` decimal(13,2) DEFAULT NULL,
  `ValorCata` decimal(13,2) DEFAULT NULL,
  `PadreDiv` int DEFAULT NULL,
  `Especial` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '1=SI, 0=NO',
  `ValorTerreno` decimal(12,2) DEFAULT NULL,
  `Construccion` int DEFAULT NULL COMMENT 'Tipo de material si teiene construccion',
  `AreaConst` decimal(12,2) DEFAULT NULL,
  `ValConstr` decimal(12,2) DEFAULT NULL,
  `ID_Cuadrante` int DEFAULT NULL,
  `Frente` decimal(15,2) DEFAULT NULL,
  `Fondo` decimal(15,2) DEFAULT NULL,
  `Distancia` decimal(15,2) DEFAULT NULL,
  `CN` varchar(60) DEFAULT NULL,
  `CS` varchar(60) DEFAULT NULL,
  `CE` varchar(60) DEFAULT NULL,
  `CO` varchar(60) DEFAULT NULL,
  `Estatus` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '1=Activo, 0 inactivo, 2 en verificacion',
  `DivisionActiva` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Solo para divisiones 0 = No Activa, 1= Activa',
  `Fecha` date DEFAULT NULL,
  `Folio_Electronico` varchar(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Planos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Link de ultimos planos en libro',
  `Cedula` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Link de Ultima Cedula',
  `Foto1` varchar(255) DEFAULT NULL COMMENT 'Link de Foto de predio',
  `Foto2` varchar(255) DEFAULT NULL COMMENT 'Link de Foto de predio',
  `Foto3` varchar(255) DEFAULT NULL COMMENT 'Link de Foto de predio',
  `Foto4` varchar(255) DEFAULT NULL COMMENT 'Link de Foto de predio',
  `Foto5` varchar(125) DEFAULT NULL,
  `Foto6` varchar(125) DEFAULT NULL,
  `Observaciones` varchar(950) DEFAULT NULL,
  `Actualizado` varchar(10) DEFAULT NULL,
  `Irregular` int NOT NULL DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Visible` int DEFAULT '1' COMMENT '0=NO, 1=SI',
  `Importado` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Solicitudes`
--

CREATE TABLE `Solicitudes` (
  `ID_Solicitud` int NOT NULL,
  `Solicitante` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Correo` varchar(90) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Descripcion` varchar(650) DEFAULT NULL,
  `Archivos` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tarifas`
--

CREATE TABLE `Tarifas` (
  `ID_Tarifa` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(450) DEFAULT NULL,
  `Categoría` int DEFAULT NULL COMMENT '1=Copias, 2=Copias Certificadas, 3= Oficios, 4=Oficios Revalidacion, 5=Planos, 6=VisitasVefic, 7=Topografia, 8=ImpresionSatelital, 9=PlanosManzanerosOseccion, 10= ReferenciaGrograf, 11=ServicosExternos, 12=PlanoMunicipalNG, 13=Nomeclaturas, 14= RevisionPlanos, 15=MejoraPredios',
  `Calculable` int DEFAULT '0' COMMENT 'Indica si se calcula en base a medidas 0=NO, 1=SI',
  `RangoInicio` varchar(20) DEFAULT NULL,
  `RangoFin` varchar(20) DEFAULT NULL,
  `Precio` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipoConstruccion`
--

CREATE TABLE `TipoConstruccion` (
  `ID_Construccion` int NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Calidad` varchar(30) DEFAULT NULL,
  `Tipo` int DEFAULT NULL COMMENT '0=Habitacion, 1=Industrial',
  `Descrip` varchar(50) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tramite`
--

CREATE TABLE `Tramite` (
  `ID_Tramite` int NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Requisitos` varchar(850) DEFAULT NULL,
  `Descripcion` varchar(640) DEFAULT NULL,
  `Tiempo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Icono` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Verificaciones`
--

CREATE TABLE `Verificaciones` (
  `ID_Medicion` int NOT NULL,
  `ID_Propiedad` int DEFAULT NULL,
  `Fecha_Solicitud` date DEFAULT NULL,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Fecha_Pospuesto` date DEFAULT NULL,
  `Pagado` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Direccion` varchar(90) DEFAULT NULL,
  `Estatus` int DEFAULT '0' COMMENT '0=PENDIENTE, 1=FINALIZADO, 3=PROCESO',
  `Fecha_Programada` date DEFAULT NULL,
  `Latitud` decimal(11,7) DEFAULT NULL,
  `Longitud` decimal(11,7) DEFAULT NULL,
  `Comentario` varchar(850) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'comentarios después de verificar',
  `Observacion` varchar(850) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'comentarios antes de verificar',
  `Foto_Terreno1` varchar(255) DEFAULT NULL,
  `Foto_Terreno2` varchar(255) DEFAULT NULL,
  `Foto_Terreno3` varchar(255) DEFAULT NULL,
  `Foto_Construc1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Foto_Construc2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Foto_Construc3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `superTerreno` decimal(15,2) DEFAULT NULL,
  `Cuadrante` int DEFAULT NULL,
  `valorTerreno` decimal(15,2) DEFAULT NULL,
  `tipoConst` int DEFAULT NULL COMMENT 'Tipo de Construcción',
  `superConst` decimal(14,2) DEFAULT NULL,
  `valorConst` decimal(15,2) DEFAULT NULL,
  `vCat` decimal(15,2) DEFAULT NULL,
  `Frente` decimal(15,2) DEFAULT NULL,
  `Fondo` decimal(15,2) DEFAULT NULL,
  `Distancia` decimal(15,2) DEFAULT NULL,
  `CN` varchar(60) DEFAULT NULL,
  `CS` varchar(60) DEFAULT NULL,
  `CE` varchar(60) DEFAULT NULL,
  `CO` varchar(60) DEFAULT NULL,
  `ID_Colaborador` int DEFAULT NULL,
  `Nombre_Solicitante` varchar(120) DEFAULT NULL,
  `Tel_Solicitante` varchar(13) DEFAULT NULL,
  `Asigna` int DEFAULT NULL COMMENT 'PERSONAL QUE AGENDA',
  `Motivo` int DEFAULT NULL COMMENT '1=Rectificacion, 2=Planos',
  `Destino` int NOT NULL DEFAULT '0' COMMENT '0=Municipal, 1=Particular',
  `Activo` int NOT NULL DEFAULT '0' COMMENT '0=NO, 1=SI',
  `ID_Administracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VerificacionesDetalle`
--

CREATE TABLE `VerificacionesDetalle` (
  `ID_Lectura` int NOT NULL,
  `ID_Propiedad` int DEFAULT NULL,
  `ID_Medicion` int DEFAULT NULL,
  `Latitud` decimal(11,7) DEFAULT NULL,
  `Longitud` decimal(11,7) DEFAULT NULL,
  `Punto` varchar(3) DEFAULT NULL,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Tipo` int DEFAULT NULL COMMENT 'Tipo por el cual se mide',
  `Activo` int DEFAULT NULL COMMENT '0=NO, 1=SI'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Cdl_Motiv`
--
ALTER TABLE `Cdl_Motiv`
  ADD PRIMARY KEY (`ID_Motivo`);

--
-- Indices de la tabla `Cedulas`
--
ALTER TABLE `Cedulas`
  ADD PRIMARY KEY (`ID_Cedula`);

--
-- Indices de la tabla `Cobros`
--
ALTER TABLE `Cobros`
  ADD PRIMARY KEY (`ID_Cobro`);

--
-- Indices de la tabla `CobrosDetalle`
--
ALTER TABLE `CobrosDetalle`
  ADD PRIMARY KEY (`ID_Detalle`);

--
-- Indices de la tabla `Cuadrante`
--
ALTER TABLE `Cuadrante`
  ADD PRIMARY KEY (`ID_Cuadrante`);

--
-- Indices de la tabla `CuadranteRusticos`
--
ALTER TABLE `CuadranteRusticos`
  ADD PRIMARY KEY (`ID_Cuadrante`);

--
-- Indices de la tabla `Movimientos`
--
ALTER TABLE `Movimientos`
  ADD PRIMARY KEY (`ID_Movimiento`),
  ADD KEY `ID_Propiedad` (`ID_Propiedad`);

--
-- Indices de la tabla `Oficios`
--
ALTER TABLE `Oficios`
  ADD PRIMARY KEY (`ID_Oficio`);

--
-- Indices de la tabla `Oficio_tipo`
--
ALTER TABLE `Oficio_tipo`
  ADD PRIMARY KEY (`ID_TipOficio`);

--
-- Indices de la tabla `Propiedades`
--
ALTER TABLE `Propiedades`
  ADD PRIMARY KEY (`ID_Propiedad`);

--
-- Indices de la tabla `Solicitudes`
--
ALTER TABLE `Solicitudes`
  ADD PRIMARY KEY (`ID_Solicitud`);

--
-- Indices de la tabla `Tarifas`
--
ALTER TABLE `Tarifas`
  ADD PRIMARY KEY (`ID_Tarifa`);

--
-- Indices de la tabla `TipoConstruccion`
--
ALTER TABLE `TipoConstruccion`
  ADD PRIMARY KEY (`ID_Construccion`);

--
-- Indices de la tabla `Tramite`
--
ALTER TABLE `Tramite`
  ADD PRIMARY KEY (`ID_Tramite`);

--
-- Indices de la tabla `Verificaciones`
--
ALTER TABLE `Verificaciones`
  ADD PRIMARY KEY (`ID_Medicion`);

--
-- Indices de la tabla `VerificacionesDetalle`
--
ALTER TABLE `VerificacionesDetalle`
  ADD PRIMARY KEY (`ID_Lectura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Cdl_Motiv`
--
ALTER TABLE `Cdl_Motiv`
  MODIFY `ID_Motivo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cedulas`
--
ALTER TABLE `Cedulas`
  MODIFY `ID_Cedula` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cobros`
--
ALTER TABLE `Cobros`
  MODIFY `ID_Cobro` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CobrosDetalle`
--
ALTER TABLE `CobrosDetalle`
  MODIFY `ID_Detalle` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cuadrante`
--
ALTER TABLE `Cuadrante`
  MODIFY `ID_Cuadrante` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CuadranteRusticos`
--
ALTER TABLE `CuadranteRusticos`
  MODIFY `ID_Cuadrante` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Movimientos`
--
ALTER TABLE `Movimientos`
  MODIFY `ID_Movimiento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Oficios`
--
ALTER TABLE `Oficios`
  MODIFY `ID_Oficio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Oficio_tipo`
--
ALTER TABLE `Oficio_tipo`
  MODIFY `ID_TipOficio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Propiedades`
--
ALTER TABLE `Propiedades`
  MODIFY `ID_Propiedad` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Solicitudes`
--
ALTER TABLE `Solicitudes`
  MODIFY `ID_Solicitud` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Tarifas`
--
ALTER TABLE `Tarifas`
  MODIFY `ID_Tarifa` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TipoConstruccion`
--
ALTER TABLE `TipoConstruccion`
  MODIFY `ID_Construccion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Tramite`
--
ALTER TABLE `Tramite`
  MODIFY `ID_Tramite` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Verificaciones`
--
ALTER TABLE `Verificaciones`
  MODIFY `ID_Medicion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `VerificacionesDetalle`
--
ALTER TABLE `VerificacionesDetalle`
  MODIFY `ID_Lectura` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Movimientos`
--
ALTER TABLE `Movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`ID_Propiedad`) REFERENCES `Propiedades` (`ID_Propiedad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
