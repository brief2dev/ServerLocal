SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `Equipos` (
  `ID_Equipo` int NOT NULL,
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
  `EsPc` int DEFAULT NULL COMMENT '0=no, 1=si',
  `Folio` varchar(30) DEFAULT NULL,
  `Ram` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Disco` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TipoMemoria` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CpuType` varchar(20) DEFAULT NULL,
  `ID_Administracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Equipos` (`ID_Equipo`, `Nombre`, `Descrip`, `Marca`, `Modelo`, `Serie`, `ID_Dept`, `Comentario`, `Estado`, `Baja`, `Fecha_Baja`, `Ult_Coment`, `Fecha_ulti`, `Fecha_Ingreso`, `EsPc`, `Folio`, `Ram`, `Disco`, `TipoMemoria`, `CpuType`, `ID_Administracion`) VALUES
(2, 'Macbook air', 'comnputadora de escritorio portatil de la marca apple', 'apple', 'air 13', 'SN', 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla facilisi morbi tempus iaculis urna id volutpat lacus', 1, 0, '2024-05-30', 'Facilisi etiam dignissim diam quis enim lobortis scelerisque. Eleifend quam adipiscing vitae proin sagittis. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit.', '2024-05-30', '2024-05-01', NULL, 'msey-se-8374', '8GB', 'SSD', '256', NULL, 3),
(5, 'pc escritorio', 'uyhsi  ikunb skvb ikkasv klaoieiuhkvhakv ; ', 'asus', 'prime a520', 'uwb2839hbg', 2, NULL, 2, 0, NULL, NULL, NULL, '2026-02-27', NULL, 'msey-se-8372', '32', '480', 'NVMe', 'ryzen 5 5600g', 3);

CREATE TABLE `Soporte` (
  `ID_Ticket` int NOT NULL,
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
  `ID_Administracion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Soporte` (`ID_Ticket`, `ID_Dispo`, `ID_Sistemas`, `ID_Dept`, `ID_Colaborador`, `Telefono`, `Fecha_Ingreso`, `Fecha_Pendiente`, `Fecha_Entrega`, `Estatus`, `Tipo`, `Detalles`, `Comentarios`, `Foto_Reporte`, `Foto_Eviden`, `ID_Administracion`) VALUES
(1, 5, NULL, 2, 1, NULL, '2026-02-27', NULL, NULL, 1, 'Chequeo', 'jmd kj ck skdbks iukhkwehf ksdkasd h ', NULL, '/cdn/iGrip/iDept/Soporte/Desconocido/Ticket-1/Report-1_fantastic-mountains-digital-art_3840x2160_xtrafondos.com.jpg', NULL, 3),
(2, 5, NULL, 2, 16, NULL, '2026-02-27', NULL, NULL, 1, 'Chequeo', 'kjhbskd khbl;kv;svnoshhiodhknv;snv nvksfjbslvhlsdfkldfhnvjksdhv;lsvkdsv kdfsdhfvk s;vksfjdjfklvsvfhnv;vh kdjvn;avhdkjelkowq\'cod,s;a,slxclc/al,is.hfa<>SIdfoswcf,safjhasl ', NULL, '/cdn/iGrip/iDept/Soporte/Desconocido/Ticket-2/Report-2_forest-river-digital-illustration_3840x2160_xtrafondos.com.jpg', NULL, 3),
(3, 5, NULL, 2, 16, NULL, '2026-02-27', NULL, NULL, 1, 'Chequeo', 'hud jh gwkjbckjqbsljkbaskjcdjh jhbqcm/.ca;c;aosjvlkanfv\';a;lo>jvaslkd,lddi,kik,ik,ik,,ik,,ik,ii,,ik,', NULL, '/cdn/iGrip/iDept/Soporte/Desconocido/Ticket-3/Report-3_forest-river-digital-illustration_3840x2160_xtrafondos.com.jpg', NULL, 3),
(4, 5, NULL, 2, 16, NULL, '2026-02-27', NULL, NULL, 1, 'Chequeo', 'hud jh gwkjbckjqbsljkbaskjcdjh jhbqcm/.ca;c;aosjvlkanfv\';a;lo>jvaslkd,lddi,kik,ik,ik,,ik,,ik,ii,,ik,', NULL, '/cdn/iGrip/iDept/Soporte/Tesoreria/Ticket-4/Report-4_forest-river-digital-illustration_3840x2160_xtrafondos.com.jpg', NULL, 3),
(5, 5, NULL, 2, 16, NULL, '2026-02-27', NULL, NULL, 1, 'Chequeo', 'hud jh gwkjbckjqbsljkbaskjcdjh jhbqcm/.ca;c;aosjvlkanfv\';a;lo>jvaslkd,lddi,kik,ik,ik,,ik,,ik,ii,,ik,', NULL, '/cdn/iGrip/iDept/Soporte/Tesoreria/Ticket-5/Report-5_forest-river-digital-illustration_3840x2160_xtrafondos.com.jpg', NULL, 3),
(6, 5, NULL, 2, 16, NULL, '2026-02-27', NULL, NULL, 1, 'Chequeo', 'hud jh gwkjbckjqbsljkbaskjcdjh jhbqcm/.ca;c;aosjvlkanfv\';a;lo>jvaslkd,lddi,kik,ik,ik,,ik,,ik,ii,,ik,', NULL, '/cdn/iGrip/iDept/Soporte/Tesoreria/Ticket-6/Report-6_forest-river-digital-illustration_3840x2160_xtrafondos.com.jpg', NULL, 3),
(7, 5, NULL, 2, 16, NULL, '2026-02-27', NULL, NULL, 1, 'Chequeo', 'hud jh gwkjbckjqbsljkbaskjcdjh jhbqcm/.ca;c;aosjvlkanfv\';a;lo>jvaslkd,lddi,kik,ik,ik,,ik,,ik,ii,,ik,', NULL, '/cdn/iGrip/iDept/Soporte/Tesoreria/Ticket-7/Report-7_forest-river-digital-illustration_3840x2160_xtrafondos.com.jpg', NULL, 3),
(8, 5, NULL, 2, 16, NULL, '2026-02-27', NULL, NULL, 1, 'Chequeo', 'hud jh gwkjbckjqbsljkbaskjcdjh jhbqcm/.ca;c;aosjvlkanfv\';a;lo>jvaslkd,lddi,kik,ik,ik,,ik,,ik,ii,,ik,', NULL, '/cdn/iGrip/iDept/Soporte/Tesoreria/Ticket-8/Report-8_forest-river-digital-illustration_3840x2160_xtrafondos.com.jpg', NULL, 3),
(9, 5, NULL, 2, 16, NULL, '2026-02-27', NULL, NULL, 1, 'Chequeo', 'hud jh gwkjbckjqbsljkbaskjcdjh jhbqcm/.ca;c;aosjvlkanfv\';a;lo>jvaslkd,lddi,kik,ik,ik,,ik,,ik,ii,,ik,', NULL, '/cdn/iGrip/iDept/Soporte/Tesoreria/Ticket-9/Report-9_forest-river-digital-illustration_3840x2160_xtrafondos.com.jpg', NULL, 3),
(10, 5, NULL, 2, 16, NULL, '2026-02-27', NULL, NULL, 1, 'Chequeo', 'hud jh gwkjbckjqbsljkbaskjcdjh jhbqcm/.ca;c;aosjvlkanfv\';a;lo>jvaslkd,lddi,kik,ik,ik,,ik,,ik,ii,,ik,', NULL, '/cdn/iGrip/iDept/Soporte/Tesoreria/Ticket-10/Report-10_forest-river-digital-illustration_3840x2160_xtrafondos.com.jpg', NULL, 3);

CREATE TABLE `VersionesAppCliente` (
  `ID_Version` int NOT NULL,
  `Version` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `VersionesAppCliente` (`ID_Version`, `Version`, `descripcion`) VALUES
(1, '1.9.1', ''),
(2, '1.9.1', '');

CREATE TABLE `WebBannerADS` (
  `ID_Banner` int NOT NULL,
  `Titulo` varchar(125) DEFAULT NULL,
  `Logo` varchar(400) DEFAULT NULL,
  `Descripcion` varchar(900) DEFAULT NULL,
  `Link` varchar(400) DEFAULT NULL,
  `Visible` int DEFAULT '1',
  `Fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebEventos` (
  `ID_Evento` int NOT NULL,
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
  `Tipo` int DEFAULT NULL COMMENT '1=noti,2=event,3=prog'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebGacetas` (
  `ID_Gaceta` int NOT NULL,
  `Nombre` varchar(65) NOT NULL,
  `Contenido` varchar(1200) NOT NULL,
  `Link` varchar(250) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebImg` (
  `ID_Img` int NOT NULL,
  `Logo` varchar(250) NOT NULL,
  `Tipo` int NOT NULL COMMENT '1=banner, 2=call',
  `Titulo` varchar(500) DEFAULT NULL,
  `Visible` int DEFAULT '1' COMMENT '0=no, 1=si'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebIndex` (
  `ID_Index` int NOT NULL,
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
  `Call_Link` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebNoticias` (
  `ID_Noticia` int NOT NULL,
  `Logo1` varchar(250) DEFAULT NULL,
  `Titulo` varchar(150) DEFAULT NULL,
  `Descrip1` varchar(1800) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Descrip2` varchar(1800) DEFAULT NULL,
  `Fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `WebProgramSocial` (
  `ID_Program` int NOT NULL,
  `Logo1` varchar(250) DEFAULT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Dirigido` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Descripcion` varchar(750) DEFAULT NULL,
  `Logo2` varchar(250) DEFAULT NULL,
  `Requisitos` varchar(250) DEFAULT NULL,
  `Bases` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


ALTER TABLE `Equipos`
  ADD PRIMARY KEY (`ID_Equipo`);

ALTER TABLE `Soporte`
  ADD PRIMARY KEY (`ID_Ticket`);

ALTER TABLE `VersionesAppCliente`
  ADD PRIMARY KEY (`ID_Version`);

ALTER TABLE `WebBannerADS`
  ADD PRIMARY KEY (`ID_Banner`);

ALTER TABLE `WebEventos`
  ADD PRIMARY KEY (`ID_Evento`);

ALTER TABLE `WebGacetas`
  ADD PRIMARY KEY (`ID_Gaceta`);

ALTER TABLE `WebImg`
  ADD PRIMARY KEY (`ID_Img`);

ALTER TABLE `WebIndex`
  ADD PRIMARY KEY (`ID_Index`);

ALTER TABLE `WebNoticias`
  ADD PRIMARY KEY (`ID_Noticia`);

ALTER TABLE `WebProgramSocial`
  ADD PRIMARY KEY (`ID_Program`);


ALTER TABLE `Equipos`
  MODIFY `ID_Equipo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `Soporte`
  MODIFY `ID_Ticket` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `VersionesAppCliente`
  MODIFY `ID_Version` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `WebBannerADS`
  MODIFY `ID_Banner` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `WebEventos`
  MODIFY `ID_Evento` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `WebGacetas`
  MODIFY `ID_Gaceta` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `WebImg`
  MODIFY `ID_Img` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `WebIndex`
  MODIFY `ID_Index` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `WebNoticias`
  MODIFY `ID_Noticia` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `WebProgramSocial`
  MODIFY `ID_Program` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
