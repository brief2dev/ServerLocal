SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


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
  `S_Inicial` decimal(12,2) DEFAULT NULL,
  `Saldo_Inicial` int DEFAULT NULL,
  `Saldo` decimal(12,2) DEFAULT NULL,
  `Corte` int DEFAULT NULL COMMENT '0=NO, 1=SI',
  `Tip` int DEFAULT NULL COMMENT '1=Efectivo, 2=SPEI',
  `ID_Corte` int DEFAULT NULL,
  `ms` varchar(10) DEFAULT NULL,
  `ID_Administracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Caja_T` (
  `ID_Caja_T` int NOT NULL,
  `Motivo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Certificados` (
  `ID_Certificados` int NOT NULL,
  `ID_Dept` int DEFAULT NULL,
  `Usuario` int DEFAULT NULL COMMENT 'es el id de la que solicita el certificado(propiedad, servicio etc)',
  `Fecha` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Cobros` (
  `ID_Cobro` int NOT NULL,
  `ID_Servicio` int DEFAULT NULL,
  `Cantidad` decimal(14,2) DEFAULT NULL,
  `ID_Dept` int DEFAULT NULL,
  `Folio` int DEFAULT NULL COMMENT 'folio dela cotizacion de pago',
  `Subtotal` int DEFAULT NULL,
  `DescPeso` int DEFAULT NULL,
  `DescPorce` int DEFAULT NULL,
  `Total` int DEFAULT NULL,
  `Entrega` int DEFAULT NULL COMMENT 'entraga',
  `Recibe` int DEFAULT NULL COMMENT 'cambio',
  `MedioDePago` int DEFAULT NULL COMMENT '1=app,2=web,3=ventanilla,4=comercios,5=domicilio',
  `TipodePago` int DEFAULT NULL COMMENT '1=Efectivo, 3=SPEI, 5=Otro',
  `Contribuyente` varchar(650) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Comentarios` varchar(450) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Corte` int DEFAULT NULL COMMENT 'indica si ya se incluyo en un corte',
  `ID_Corte` int DEFAULT NULL COMMENT 'indica el id del corte donde se regsitro',
  `Usuario` int DEFAULT NULL COMMENT 'usuario quien cobra',
  `Visible` int DEFAULT NULL COMMENT '0=n0,1=si',
  `ID_Administracion` int DEFAULT NULL COMMENT 'id de la administracion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Empresas` (
  `ID_Empresa` int NOT NULL,
  `Nombre` varchar(90) DEFAULT NULL,
  `Descripcion` varchar(450) DEFAULT NULL,
  `Direccion` varchar(120) DEFAULT NULL,
  `Responsable` varchar(90) DEFAULT NULL,
  `RFC` varchar(30) DEFAULT NULL,
  `Telefono` varchar(14) DEFAULT NULL,
  `Visible` int DEFAULT NULL,
  `Especial` int DEFAULT NULL COMMENT 'indica si vende cerveza',
  `FechaRegistro` date DEFAULT NULL,
  `Correo` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Licencias` (
  `ID_licencia` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Productos` (
  `ID_Producto` int NOT NULL,
  `Codigo` varchar(10) NOT NULL,
  `Nombre` varchar(350) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Descripcion` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `Fecha_Ingreso` datetime DEFAULT NULL,
  `ID_Departamento` int DEFAULT NULL,
  `Fecha_Vacio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Salidas` (
  `ID_Salida` int NOT NULL,
  `ID_Colaborador` int DEFAULT NULL COMMENT 'Solicita',
  `Autoriza` int DEFAULT NULL COMMENT 'Entrega',
  `ID_Reporte` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Fecha_Entrega` datetime DEFAULT NULL,
  `Comentario` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Evidencia` varchar(250) DEFAULT NULL,
  `Estatus` int NOT NULL,
  `ID_Administracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Salidas_Detalle` (
  `ID_Salida_Detalle` int NOT NULL,
  `ID_Producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `ID_Salida` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Servicios` (
  `ID_Servicio` int NOT NULL,
  `Titulo` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Descripcion` varchar(300) DEFAULT NULL,
  `Costo` int NOT NULL,
  `Calculable` int DEFAULT NULL COMMENT '0=no, 1=si',
  `Tipo` int DEFAULT NULL COMMENT '0=Porcentaje, 1=metro,2=hora',
  `Tasa` decimal(12,2) DEFAULT NULL,
  `Tiempo` date DEFAULT NULL COMMENT 'tiempo en que se finaliza',
  `Visible` int DEFAULT NULL COMMENT '0=no,1=si'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE `Tarifas_Licencia` (
  `ID_Lic` int NOT NULL,
  `Giro` varchar(350) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Nombre',
  `Expedicion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Nuevo',
  `Renovacion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Revalida',
  `importado` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


ALTER TABLE `Caja`
  ADD PRIMARY KEY (`ID_Caja`);

ALTER TABLE `Caja_T`
  ADD PRIMARY KEY (`ID_Caja_T`);

ALTER TABLE `Certificados`
  ADD PRIMARY KEY (`ID_Certificados`);

ALTER TABLE `Cobros`
  ADD PRIMARY KEY (`ID_Cobro`);

ALTER TABLE `Empresas`
  ADD PRIMARY KEY (`ID_Empresa`);

ALTER TABLE `Licencias`
  ADD PRIMARY KEY (`ID_licencia`);

ALTER TABLE `Productos`
  ADD PRIMARY KEY (`ID_Producto`);

ALTER TABLE `Salidas`
  ADD PRIMARY KEY (`ID_Salida`),
  ADD KEY `ID_Colaborador` (`ID_Colaborador`),
  ADD KEY `Estatus` (`Estatus`),
  ADD KEY `Autoriza` (`Autoriza`);

ALTER TABLE `Salidas_Detalle`
  ADD PRIMARY KEY (`ID_Salida_Detalle`),
  ADD KEY `ID_Producto` (`ID_Producto`,`ID_Salida`),
  ADD KEY `ID_Salida` (`ID_Salida`);

ALTER TABLE `Servicios`
  ADD PRIMARY KEY (`ID_Servicio`);

ALTER TABLE `Solicitudes`
  ADD PRIMARY KEY (`ID_Solicitud`),
  ADD KEY `ID_personal` (`ID_Colaborador`),
  ADD KEY `ID_Autoriza` (`ID_Autoriza`),
  ADD KEY `Estatus` (`Estatus`);

ALTER TABLE `Tarifas_Licencia`
  ADD PRIMARY KEY (`ID_Lic`);


ALTER TABLE `Caja`
  MODIFY `ID_Caja` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Caja_T`
  MODIFY `ID_Caja_T` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Certificados`
  MODIFY `ID_Certificados` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Cobros`
  MODIFY `ID_Cobro` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Empresas`
  MODIFY `ID_Empresa` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Licencias`
  MODIFY `ID_licencia` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Productos`
  MODIFY `ID_Producto` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Salidas`
  MODIFY `ID_Salida` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Salidas_Detalle`
  MODIFY `ID_Salida_Detalle` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Servicios`
  MODIFY `ID_Servicio` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Solicitudes`
  MODIFY `ID_Solicitud` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Tarifas_Licencia`
  MODIFY `ID_Lic` int NOT NULL AUTO_INCREMENT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
