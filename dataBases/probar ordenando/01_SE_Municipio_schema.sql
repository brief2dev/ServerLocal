-- SCHEMA EXPORT: SE_Municipio

DROP DATABASE IF EXISTS `SE_Municipio`;
CREATE DATABASE `SE_Municipio`;
USE `SE_Municipio`;

CREATE TABLE `API_Comisarias` (
  `ID_Comisaria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(110) NOT NULL,
  PRIMARY KEY (`ID_Comisaria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Administraciones` (
  `ID_Administracion` int NOT NULL AUTO_INCREMENT,
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
  `Concluido` int NOT NULL,
  PRIMARY KEY (`ID_Administracion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Api_Boleano` (
  `ID_Boleano` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(5) NOT NULL,
  PRIMARY KEY (`ID_Boleano`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Api_Colonias` (
  `ID_Colonia` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Colonia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Api_Estatus` (
  `ID_Estatus` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Api_Pago` (
  `ID_Tipo_Pago` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Pago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Ciudadanos` (
  `ID_Ciudadano` int NOT NULL AUTO_INCREMENT,
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
  `Importado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_Ciudadano`),
  KEY `ID_Colonia` (`ID_Colonia`),
  KEY `ID_Sexo` (`ID_Sexo`),
  KEY `Foraneo` (`Foraneo`),
  CONSTRAINT `ciudadanos_ibfk_1` FOREIGN KEY (`ID_Colonia`) REFERENCES `Api_Colonias` (`ID_Colonia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ciudadanos_ibfk_2` FOREIGN KEY (`ID_Sexo`) REFERENCES `Sexo` (`ID_Sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ciudadanos_ibfk_3` FOREIGN KEY (`Foraneo`) REFERENCES `Api_Boleano` (`ID_Boleano`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Ciudadanos_Card` (
  `ID_Card` int NOT NULL AUTO_INCREMENT,
  `Numero` varchar(17) DEFAULT NULL,
  `Mes` int DEFAULT NULL,
  `Ano` int DEFAULT NULL,
  `CVV` int DEFAULT NULL,
  `Tipo` varchar(30) DEFAULT NULL COMMENT 'VISA, Master, AMEX',
  `ID_Ciudadano` int DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Card`),
  KEY `ID_Ciudadano` (`ID_Ciudadano`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Colaboradores` (
  `ID_Colaborador` int NOT NULL AUTO_INCREMENT,
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
  `ID_Administracion` int DEFAULT NULL,
  PRIMARY KEY (`ID_Colaborador`),
  KEY `ID_Ciudadano` (`ID_Ciudadano`),
  KEY `ID_Departamento` (`ID_Departamento`),
  KEY `ID_Puesto` (`ID_Puesto`),
  KEY `Baja` (`Baja`),
  KEY `Acceso` (`Acceso`),
  CONSTRAINT `colaboradores_ibfk_1` FOREIGN KEY (`ID_Ciudadano`) REFERENCES `Ciudadanos` (`ID_Ciudadano`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `colaboradores_ibfk_2` FOREIGN KEY (`ID_Departamento`) REFERENCES `Departamentos` (`ID_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `colaboradores_ibfk_3` FOREIGN KEY (`ID_Puesto`) REFERENCES `Puestos` (`ID_Puesto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `colaboradores_ibfk_4` FOREIGN KEY (`Baja`) REFERENCES `Api_Boleano` (`ID_Boleano`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `colaboradores_ibfk_5` FOREIGN KEY (`Acceso`) REFERENCES `Api_Boleano` (`ID_Boleano`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Departamentos` (
  `ID_Departamento` int NOT NULL AUTO_INCREMENT,
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
  `Visible` int DEFAULT '1',
  PRIMARY KEY (`ID_Departamento`),
  KEY `Interno` (`Interno`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Puestos` (
  `ID_Puesto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Reportes_Ciudadanos` (
  `ID_Reporte` int NOT NULL AUTO_INCREMENT,
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
  `ID_Administracion` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_Reporte`),
  KEY `ID_Ciudadano` (`ID_Ciudadano`),
  KEY `ID_Estatus` (`ID_Estatus`),
  KEY `ID_Departamento` (`ID_Departamento`),
  KEY `ID_Colaborador` (`ID_Colaborador`),
  KEY `ID_Colonia` (`ID_Colonia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Sexo` (
  `ID_Sexo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `ZMisc` (
  `ID_Misc` int NOT NULL AUTO_INCREMENT,
  `ID_Dep` int NOT NULL,
  `ID_Colaborador` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Corte` int DEFAULT NULL,
  PRIMARY KEY (`ID_Misc`),
  KEY `ID_Dep` (`ID_Dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

