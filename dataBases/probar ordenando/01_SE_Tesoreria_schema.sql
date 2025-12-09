-- SCHEMA EXPORT: SE_Tesoreria

DROP DATABASE IF EXISTS `SE_Tesoreria`;
CREATE DATABASE `SE_Tesoreria`;
USE `SE_Tesoreria`;

CREATE TABLE `Caja` (
  `ID_Caja` int NOT NULL AUTO_INCREMENT,
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
  `ms` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_Caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Caja_T` (
  `ID_Caja_T` int NOT NULL AUTO_INCREMENT,
  `Motivo` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_Caja_T`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Solicitudes` (
  `ID_Solicitud` int NOT NULL AUTO_INCREMENT,
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
  `ID_Administracion` int DEFAULT NULL,
  PRIMARY KEY (`ID_Solicitud`),
  KEY `ID_personal` (`ID_Colaborador`),
  KEY `ID_Autoriza` (`ID_Autoriza`),
  KEY `Estatus` (`Estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Teso_Inv_Productos` (
  `ID_Producto` int NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(10) NOT NULL,
  `Nombre` varchar(350) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Descripcion` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `Fecha_Ingreso` datetime DEFAULT NULL,
  `ID_Departamento` int DEFAULT NULL,
  `Fecha_Vacio` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Producto`),
  KEY `ID_Departamento` (`ID_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Teso_Inv_Salida` (
  `ID_Salida` int NOT NULL AUTO_INCREMENT,
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
  `Insumos` int DEFAULT NULL COMMENT '0=materiales, 1=insumos',
  PRIMARY KEY (`ID_Salida`),
  KEY `ID_Colaborador` (`ID_Colaborador`,`ID_Departamento`),
  KEY `ID_Departamento` (`ID_Departamento`),
  KEY `Estatus` (`Estatus`),
  KEY `Autoriza` (`Autoriza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Teso_Inv_Salida_Detalle` (
  `ID_Salida_Detalle` int NOT NULL AUTO_INCREMENT,
  `ID_Producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `ID_Salida` int NOT NULL,
  PRIMARY KEY (`ID_Salida_Detalle`),
  KEY `ID_Producto` (`ID_Producto`,`ID_Salida`),
  KEY `ID_Salida` (`ID_Salida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Teso_Lic_Tarifa` (
  `ID_Lic` int NOT NULL AUTO_INCREMENT,
  `Giro` varchar(350) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Nombre',
  `Expedicion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Nuevo',
  `Renovacion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Revalida',
  `importado` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_Lic`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Teso_Licencias` (
  `ID_licencia` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_licencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

