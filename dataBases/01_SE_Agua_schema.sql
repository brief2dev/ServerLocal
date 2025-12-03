-- SCHEMA EXPORT: SE_Agua

DROP DATABASE IF EXISTS `SE_Agua`;
CREATE DATABASE `SE_Agua`;
USE `SE_Agua`;

CREATE TABLE `Anomalias` (
  `ID_Anomalia` int NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Importacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Caja` (
  `ID_ACaja` int NOT NULL AUTO_INCREMENT,
  `ID_Personal` int DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Tipo` int DEFAULT NULL COMMENT 'Retiro, ingreso ',
  `Descripcion` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Medio` int DEFAULT NULL COMMENT 'Efectivo/Spei',
  `Corte` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `ID_Corte` int DEFAULT NULL,
  PRIMARY KEY (`ID_ACaja`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Cargos` (
  `ID_Cargo` int NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Precio` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Insidencia` (
  `ID_Incidencia` int NOT NULL AUTO_INCREMENT,
  `Num_Servicio` int DEFAULT NULL,
  `ID_Anomalia` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Fecha_fin` date DEFAULT NULL,
  `ID_Colaborador` int DEFAULT NULL,
  PRIMARY KEY (`ID_Incidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Lecturas` (
  `ID_Lectura` int NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int NOT NULL,
  `Lectura` varchar(20) NOT NULL DEFAULT '0',
  `Fecha_Lectura` date NOT NULL,
  `ID_Colaborador` int NOT NULL,
  PRIMARY KEY (`ID_Lectura`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Pagos` (
  `ID_Cobro` int NOT NULL AUTO_INCREMENT,
  `ID_Personal` int DEFAULT NULL,
  `Fecha_Cobro` date DEFAULT NULL,
  `Referencia` varchar(50) DEFAULT NULL,
  `Subtotal` double DEFAULT NULL,
  `Descuento_Porc` double DEFAULT NULL,
  `Descuento_Pesos` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Comentario` varchar(200) DEFAULT NULL,
  `Medio_Pago` int DEFAULT NULL COMMENT '1=Efectivo. 3=tarjeta, etc',
  `Efectivo` double DEFAULT NULL,
  `Cambio` double DEFAULT NULL,
  `Corte` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `ID_Corte` int DEFAULT NULL,
  `Usuario` varchar(20) DEFAULT NULL,
  `Tipo_Pago` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '1=Abono, 2=Pago',
  `Origen` int DEFAULT NULL COMMENT '1=app,2=web,3=ventanilla,4=comercios',
  `Verificado` int DEFAULT NULL,
  PRIMARY KEY (`ID_Cobro`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Recibos` (
  `ID_Recibo` int NOT NULL,
  `Num_Servicio` int NOT NULL COMMENT 'ID_Uauario_Agua',
  `Fecha_Limite` date NOT NULL,
  `DeudaActual` double NOT NULL,
  `Referencia` varchar(25) NOT NULL,
  `Adeudo_Ant` double DEFAULT NULL,
  `Tarifa` double DEFAULT NULL,
  `Lectura_Ant` int DEFAULT NULL,
  `Lectura_Actual` int DEFAULT NULL,
  `Logo_Agua` varchar(250) NOT NULL,
  `Logo_Banner` varchar(250) NOT NULL,
  `Logo_Sat` varchar(250) NOT NULL,
  `Pagado` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Vencido` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Impreso` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `SolicitudesContrato` (
  `ID_Solicitud` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `ApellidoP` varchar(45) DEFAULT NULL,
  `ApellidoM` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ID_Ciudadano` int DEFAULT NULL,
  `ID_Colonia` int DEFAULT NULL,
  `Latitud` double DEFAULT NULL,
  `Longitud` double DEFAULT NULL,
  `ID_Personal` int DEFAULT NULL COMMENT 'Personal que guardo la solicitud',
  `ID_Fontanero` int DEFAULT NULL COMMENT 'Personal que visito',
  `FechaSolicitud` date DEFAULT NULL,
  `FechaInspeccion` date DEFAULT NULL,
  `Pagado` int DEFAULT NULL COMMENT '0=no, 1=si',
  `Estado` int DEFAULT NULL COMMENT '1=Solicitud nueva, 2=En inspección, 3=Pendiente de pago, 4=Rechazada, 5=Instalacion, 6=Contrato Activo',
  `Referencias` varchar(350) DEFAULT NULL,
  `Comentarios` varchar(450) DEFAULT NULL,
  `Observaciones` varchar(550) DEFAULT NULL,
  PRIMARY KEY (`ID_Solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Tarifa` (
  `ID_Tarifa` int NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Costo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Usuarios` (
  `Num_Servicio` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `ApellidoP` varchar(40) DEFAULT NULL,
  `ApellidoM` varchar(40) DEFAULT NULL,
  `Direccion` varchar(70) DEFAULT NULL,
  `NumCasa` varchar(22) DEFAULT NULL,
  `Sector` varchar(20) DEFAULT NULL,
  `Ruta` varchar(20) DEFAULT NULL,
  `Progresivo` varchar(20) DEFAULT NULL,
  `ID_Colonia` int DEFAULT NULL,
  `Referencia` varchar(460) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Medidor` varchar(20) DEFAULT NULL,
  `ID_Tarifa` int DEFAULT NULL,
  `Fecha_Registro` date DEFAULT NULL,
  `Latitud` varchar(30) DEFAULT NULL,
  `Longitud` varchar(30) DEFAULT NULL,
  `ID_Ciudadano` int DEFAULT NULL,
  `DeudaActual` double DEFAULT '0',
  `ReciboDigital` int DEFAULT NULL COMMENT '1=NO, 2=SI',
  `ID_Estatus` int DEFAULT NULL COMMENT '0=aceptado,1-cancelado,2-bajatemp,3reactivo,4excento',
  `Comentarios` varchar(700) DEFAULT NULL,
  `Migro_Digital` int DEFAULT NULL COMMENT '1=NO, 2=SI',
  `Suspencion` int DEFAULT NULL COMMENT '0=N=, 1=SI',
  `Up_date` int DEFAULT NULL COMMENT '0=N=, 1=SI',
  `Link_QR` varchar(500) DEFAULT NULL,
  `Importado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Num_Servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=59709 DEFAULT CHARSET=utf8mb3;

