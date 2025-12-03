-- SCHEMA EXPORT: SE_SYS

DROP DATABASE IF EXISTS `SE_SYS`;
CREATE DATABASE `SE_SYS`;
USE `SE_SYS`;

CREATE TABLE `InventarioEquipos` (
  `ID_Equipo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descrip` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Serie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ID_Dept` int DEFAULT NULL,
  `Comentario` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Estado` int DEFAULT '1' COMMENT '0=malo, 1=bueno,',
  `Baja` int DEFAULT '0' COMMENT '0=no, 1=si',
  `Fecha_Baja` date DEFAULT NULL,
  `Ult_Coment` varchar(800) DEFAULT NULL,
  `Fecha_ulti` date DEFAULT NULL COMMENT 'Fecha de ultimo chequeo',
  `Fecha_Ingreso` date DEFAULT NULL,
  `Ram` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Disco` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Memoria` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Administracion` int DEFAULT NULL,
  PRIMARY KEY (`ID_Equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Soporte` (
  `ID_Ticket` int NOT NULL AUTO_INCREMENT,
  `ID_Dispo` int DEFAULT NULL COMMENT 'ID del equipo',
  `ID_Sistemas` int DEFAULT NULL COMMENT 'ID colaborador de sistemas',
  `ID_Dept` int DEFAULT NULL,
  `ID_Colaborador` int DEFAULT NULL COMMENT 'ID del colaborador que reporto',
  `Telefono` varchar(13) DEFAULT NULL,
  `Fecha_Ingreso` date DEFAULT NULL COMMENT 'Fecha en que se solicito',
  `Fecha_Pendiente` date DEFAULT NULL COMMENT 'Fecha en que se esta tarbajando',
  `Fecha_Entrega` date DEFAULT NULL COMMENT 'Fecha de entregado',
  `Estatus` int DEFAULT '1' COMMENT '0=cerrado, 1=abierto, 2=Proceso, 4 = Cancelado',
  `Tipo` varchar(25) DEFAULT NULL,
  `Detalles` varchar(800) DEFAULT NULL COMMENT 'Detalles o problema reportado',
  `Comentarios` varchar(800) DEFAULT NULL COMMENT 'Coment. finales sobe el equipo',
  `Foto_Reporte` varchar(255) DEFAULT NULL,
  `Foto_Eviden` varchar(255) DEFAULT NULL,
  `ID_Administracion` int NOT NULL,
  PRIMARY KEY (`ID_Ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `VersionesAppCliente` (
  `ID_Version` int NOT NULL AUTO_INCREMENT,
  `Version` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Version`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `WebBannerADS` (
  `ID_Banner` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(125) DEFAULT NULL,
  `Logo` varchar(400) DEFAULT NULL,
  `Descripcion` varchar(900) DEFAULT NULL,
  `Link` varchar(400) DEFAULT NULL,
  `Visible` int DEFAULT '1',
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`ID_Banner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebEventos` (
  `ID_Evento` int NOT NULL AUTO_INCREMENT,
  `Logo1` varchar(250) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Logo3` varchar(250) DEFAULT NULL,
  `Titulo` varchar(125) DEFAULT NULL,
  `Descrip1` varchar(850) DEFAULT NULL,
  `Descrip2` varchar(850) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Objetivo` varchar(60) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Link` varchar(250) DEFAULT NULL,
  `Tipo` int DEFAULT NULL COMMENT '1=noti,2=event,3=prog',
  PRIMARY KEY (`ID_Evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebGacetas` (
  `ID_Gaceta` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(65) NOT NULL,
  `Contenido` varchar(1200) NOT NULL,
  `Link` varchar(250) NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`ID_Gaceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebImg` (
  `ID_Img` int NOT NULL AUTO_INCREMENT,
  `Logo` varchar(250) NOT NULL,
  `Tipo` int NOT NULL COMMENT '1=banner, 2=call',
  `Titulo` varchar(500) DEFAULT NULL,
  `Visible` int DEFAULT '1' COMMENT '0=no, 1=si',
  PRIMARY KEY (`ID_Img`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebIndex` (
  `ID_Index` int NOT NULL AUTO_INCREMENT,
  `Logo1` varchar(250) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Logo3` varchar(250) DEFAULT NULL,
  `Logo4` varchar(250) DEFAULT NULL,
  `Logo5` varchar(250) DEFAULT NULL,
  `Mision` varchar(850) DEFAULT NULL,
  `Vision` varchar(850) DEFAULT NULL,
  `Call_Titulo` varchar(35) DEFAULT NULL,
  `Call_Sub` varchar(35) DEFAULT NULL,
  `Call_Logo` varchar(250) DEFAULT NULL,
  `Call_Link` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_Index`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebNoticias` (
  `ID_Noticia` int NOT NULL AUTO_INCREMENT,
  `Logo1` varchar(250) DEFAULT NULL,
  `Titulo` varchar(150) DEFAULT NULL,
  `Descrip1` varchar(1800) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Descrip2` varchar(1800) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`ID_Noticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebProgramSocial` (
  `ID_Program` int NOT NULL AUTO_INCREMENT,
  `Logo1` varchar(250) DEFAULT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Dirigido` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Descripcion` varchar(750) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Requisitos` varchar(250) DEFAULT NULL,
  `Bases` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_Program`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

