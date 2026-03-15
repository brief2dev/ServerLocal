SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `Administraciones` (
  `ID_Administracion` int NOT NULL,
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
  `Concluido` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Administraciones` (`ID_Administracion`, `Nombre`, `Partido`, `Alcalde`, `Suplente`, `Secretario`, `Direccion`, `RFC`, `CP`, `FotoAlcalde`, `Logo`, `Portada`, `Licencia`, `Prefijo`, `PreUser`, `Web`, `Tel`, `Color`, `ColorDark`, `Fecha_Admin`, `Fecha_Inicio`, `Fecha_Termino`, `Concluido`) VALUES
(2, 'MUNICIPIO DE SANTA ELENA', 'PAN', 'Galdino Poot Moreno', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'https://santaelena.gob.mx', NULL, '#078ed6', '#046091', '2021-2024', '2021-09-01', '2024-09-01', 1),
(3, 'MUNICIPIO DE TICUL', 'MORENA', 'BETO PARRA', NULL, 'Luis Antonio Kauil Cetina', 'PALACIO MUNICIPAL COL. CENTRO', 'MSE850101IT1', '97860', NULL, NULL, NULL, 0, 'Ticul', 'TCL', 'https://ticul.gob.mx', NULL, '#780539', '#59032a', '2024-2027', '2024-09-01', NULL, 0);

CREATE TABLE `Api_Boleano` (
  `ID_Boleano` int NOT NULL,
  `Nombre` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Api_Boleano` (`ID_Boleano`, `Nombre`) VALUES
(1, 'NO'),
(2, 'SI');

CREATE TABLE `Api_Colonias` (
  `ID_Colonia` int NOT NULL,
  `Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Api_Colonias` (`ID_Colonia`, `Nombre`) VALUES
(1, 'San Juan'),
(2, 'Centro'),
(3, 'Santa Barbara');

CREATE TABLE `API_Comisarias` (
  `ID_Comisaria` int NOT NULL,
  `Nombre` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `API_Comisarias` (`ID_Comisaria`, `Nombre`) VALUES
(1, 'Santa Elena'),
(2, 'San Simon');

CREATE TABLE `Api_Estatus` (
  `ID_Estatus` int NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Api_Estatus` (`ID_Estatus`, `Nombre`) VALUES
(1, 'Pendiente'),
(2, 'Proceso'),
(3, 'Finalizado'),
(4, 'Aceptado'),
(5, 'Cancelado'),
(6, 'Pospuesto');

CREATE TABLE `Api_Pago` (
  `ID_Tipo_Pago` int NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Api_Pago` (`ID_Tipo_Pago`, `Nombre`) VALUES
(1, 'Efectivo'),
(3, 'Tarjeta/SPEI'),
(5, 'Otro');

CREATE TABLE `AudiApoyo` (
  `ID_AudiApoy` int NOT NULL,
  `Nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `AudiApoyo` (`ID_AudiApoy`, `Nombre`) VALUES
(1, 'Alimenticio'),
(2, 'Deportivo'),
(3, 'Economico'),
(4, 'Medico'),
(5, 'Piso'),
(6, 'Techo'),
(7, 'Transporte'),
(8, 'Vivienda'),
(9, 'Reunión'),
(10, 'Eventos'),
(11, 'Otros');

CREATE TABLE `Audiencias` (
  `ID_Audiencia` int NOT NULL,
  `ID_Ciudadano` int NOT NULL,
  `Motivo` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Cantidad` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Autorizado` int DEFAULT NULL,
  `FechaSolicitud` date DEFAULT NULL,
  `Comentarios` varchar(400) DEFAULT NULL,
  `ID_AudiDept` int DEFAULT NULL,
  `ID_AudiApoy` int DEFAULT NULL,
  `ID_Estatus` int DEFAULT NULL,
  `Corte` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `ID_Corte` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Audiencias` (`ID_Audiencia`, `ID_Ciudadano`, `Motivo`, `Cantidad`, `Autorizado`, `FechaSolicitud`, `Comentarios`, `ID_AudiDept`, `ID_AudiApoy`, `ID_Estatus`, `Corte`, `ID_Corte`) VALUES
(1, 1, 'Leche para su bebe', '450', 450, '2020-03-20', '', 2, 1, 4, 1, 3),
(2, 1, 'test aceptado', '2500', 0, '2020-03-21', 'Aceptado pase a tesoreria', 7, 6, 4, 1, 3),
(3, 1, 'test cancelado', '30000', 0, '2020-03-21', 'cancelado por falta de recursos', 7, 6, 5, 1, 3),
(4, 1, 'asjjcbsdb', '600', 0, '2021-03-26', '', 4, 3, 5, 1, 3),
(7, 1, 'qwrorewgwhgoyg', '200', 200, '2021-03-26', '', 2, 3, 5, 1, 3),
(8, 1, 'Apoyo a Colegiatura', '3800', 0, '2021-06-12', '', 3, 3, 1, 1, 3),
(9, 1, 'para TC', '6000', 5500, '2021-06-15', NULL, 7, 3, 4, 1, 3),
(10, 1, 'Junta para tratar situaciones de trabajo', '0', 0, '2021-06-15', NULL, 8, 9, 4, 1, 3),
(11, 1, 'para comprar cosas', '500', 300, '2022-06-21', '300 no hay mas', 7, 1, 4, 1, 4),
(18, 2, 'gfjhgdjg f fghj', '400', NULL, '2026-03-17', NULL, 5, 4, NULL, 0, NULL),
(19, 2, 'gfjhgdjg f fghj', '400', NULL, '2026-03-17', NULL, 5, 4, NULL, 0, NULL),
(20, 2, 'gfjhgdjg f fghj', '400', NULL, '2026-03-17', NULL, 5, 4, NULL, 0, NULL),
(21, 1, 'rgfrdgfd', '3333', NULL, '2026-03-18', NULL, 15, 9, NULL, 0, NULL),
(22, 5, 'dfgfdg fgd fdgdfg dfghd f', '22222', NULL, '2026-03-23', NULL, 14, 5, 1, 0, NULL);

CREATE TABLE `Ciudadanos` (
  `ID_Ciudadano` int NOT NULL,
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
  `Importado` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Ciudadanos` (`ID_Ciudadano`, `Nombres`, `ApellidoP`, `ApellidoM`, `Direccion`, `NCasa`, `ID_Colonia`, `Latitud`, `Longitud`, `Telefono`, `Correo`, `Foto`, `FechaRegistro`, `FechaNacimiento`, `ClaveElector`, `RFC`, `Curp`, `Foraneo`, `ID_Sexo`, `ID_Facebook`, `ID_Firebase`, `Importado`) VALUES
(1, 'Mariel Eleazar', 'Santos', 'Paredes', 'C43 x 24A 26', '203-Q', 2, '0.0', '0.0', '9971135089', 'm.santos@blitzc0de.com', NULL, '2022-12-09 06:20:18', '1990-03-28', 'SAPM900328H', 'SAPM900328CG9', 'SAPM900328HYNNRR01', 2, 1, NULL, NULL, NULL),
(2, 'Miguel Misael', 'Escamilla', 'Valle', 'C19 x 22 y 24', 'SN', 2, '20.329502639085977', '-89.64492436834794', '9971298353', '', NULL, '2025-01-21 01:59:56', NULL, 'ESVM890129', NULL, 'ESVM890129', 2, 1, NULL, NULL, NULL),
(3, 'Maritza', 'Escamilla', 'Valle', 'C29 x 16 y 18', '', 1, '20.395070971674173', '-89.52605478453532', '9971164526', '', NULL, '2025-01-21 03:26:48', NULL, 'ESVM871218MY', NULL, 'ESVM871218MY', 2, 2, NULL, NULL, NULL),
(4, 'Jose Asuncion', 'Tec', 'Koyoc', 'C19 x 18 y 16', '', 2, '20.328762044827535', '-89.6414340286244', '9971054812', '', NULL, '2025-01-21 03:31:31', NULL, 'TEKJ850815HY', NULL, 'TEKJ850815HY', 1, 1, NULL, NULL, NULL),
(5, 'Pamela', 'Puch', 'Cohuo', 'C25 x 22 y 24', '', 2, '20.325965176399766', '-89.64618690299883', '9971076298', '', NULL, '2025-01-21 03:35:45', NULL, 'PUCP021122MY', NULL, 'PUCP021122MY', 1, 2, NULL, NULL, NULL),
(6, 'Carlos Guillermo', 'Chulim', 'Jimenez', '12', '', 2, '', NULL, '9971042132', '', NULL, '2025-07-03 12:08:21', NULL, 'CHJC980507XX', NULL, 'CHJC980507XX', 2, 1, NULL, NULL, NULL),
(7, 'Israel', 'Huchim', '', '23 x ', '', 2, '', NULL, '9971453741', '', NULL, '2025-07-04 10:12:40', NULL, 'HXIIXXXX', NULL, 'HXIIXXXX', 2, 1, NULL, NULL, NULL),
(8, '3333', '44444', '55454', '24 bt 454', '332', 3, '', NULL, '66785678', '', NULL, '2026-02-23 06:28:28', NULL, NULL, NULL, 'WERWREWEWR', 2, 3, NULL, NULL, NULL);

CREATE TABLE `Ciudadanos_Card` (
  `ID_Card` int NOT NULL,
  `Numero` varchar(17) DEFAULT NULL,
  `Mes` int DEFAULT NULL,
  `Ano` int DEFAULT NULL,
  `CVV` int DEFAULT NULL,
  `Tipo` varchar(30) DEFAULT NULL COMMENT 'VISA, Master, AMEX',
  `ID_Ciudadano` int DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Ciudadanos_Card` (`ID_Card`, `Numero`, `Mes`, `Ano`, `CVV`, `Tipo`, `ID_Ciudadano`, `Direccion`) VALUES
(2, '5064510000300020', 12, 23, 874, NULL, 1, NULL),
(3, '1234567890123456', 22, 99, 543, NULL, 151, NULL);

CREATE TABLE `Colaboradores` (
  `ID_Colaborador` int NOT NULL,
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
  `ID_Administracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Colaboradores` (`ID_Colaborador`, `ID_Ciudadano`, `ID_Departamento`, `ID_Puesto`, `Usuario`, `Pass`, `PsD`, `FechaRegistro`, `Acceso`, `Baja`, `FechaBaja`, `Comentario`, `Escolaridad`, `Cedula`, `Correo`, `Foto`, `FB`, `TW`, `INST`, `Sueldo`, `ID_Administracion`) VALUES
(1, 1, 4, 1, 'mariel.santos', '$2y$10$gpDMyn7lYQrviII9kGnYEeMLgFvrOxQFE1Q4ltZfdsONDQ/eyqMK2', '12', '2024-09-01', 2, 1, NULL, '555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1200, 3),
(5, 1, 2, 1, 'system', '$2y$10$gpDMyn7lYQrviII9kGnYEeMLgFvrOxQFE1Q4ltZfdsONDQ/eyqMK2', '12', '2024-09-01', 2, 1, NULL, '555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1200, 3),
(9, 2, 4, 95, 'miguel.escamilla', '$2y$10$OeLVsx0TiY/JhHdWz7av/um6PnGHkbbK4qhN.kUQ3Kjx9rQ8Tr3SS', '8xIT', '2025-07-04', 2, 1, NULL, '', 'Lic', NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(10, 7, 4, 1, 'israel.huchim', '$2y$10$f.PloWpNQfBI798LLa4JVeQLMxmTZ3FXsDiUu3Z6hqmqjmosZK.pm', '1uED', '2025-07-04', 2, 1, NULL, '', 'Lic', NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(11, 6, 4, 96, 'carlos.chulim', '$2y$10$/.RiekVYN5xz5r2I6manXeMS3f8tvaB2xUjDuFzjnfl61WKuHwyL.', 'UpRK', '2025-07-04', 2, 1, NULL, '', 'Lic', NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(12, 3, 4, 1, 'maritza.escamilla', '$2y$10$l4JXAR6XInepJxYOaR7cs.mBQsUfwhM7u0VsTjW5BTJbKS1nptoCW', 'EU2b', '2025-08-19', 2, 1, NULL, '', 'Lic', NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(13, 1, 11, 1, 'mariel.santos', '$2y$10$gpDMyn7lYQrviII9kGnYEeMLgFvrOxQFE1Q4ltZfdsONDQ/eyqMK2', '12', '2024-09-01', 2, 1, NULL, '555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1200, 3),
(16, 1, 2, 1, 'mariel.santos2', '$2y$12$ueouiMAYTFEfpdWglrOULu8YAXCqDOVlzI2qc8Kxw1.Mlxm.AEC3S', 'unS8', '2026-02-23', 2, 1, NULL, '', 'Ing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 3);

CREATE TABLE `Departamentos` (
  `ID_Departamento` int NOT NULL,
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
  `Visible` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Departamentos` (`ID_Departamento`, `Nombre`, `Prefijo`, `Interno`, `Logo1`, `Logo2`, `Descripcion`, `Funciones`, `Servidor`, `Mail`, `Pass_Mail`, `Facebook`, `Insta`, `Twitter`, `Visible`) VALUES
(1, 'Sistemas', 'SYS', 2, '', '', 'Descripción Sistemas', 'Descripción Sistemas', 'ING. Mariel Eleazar Santos Paredes', 'app-support@blitzc0de.com', NULL, NULL, NULL, NULL, 0),
(2, 'Tesoreria', 'TES', 2, '', '', 'Como Dirección de Finanzas y Tesorería Municipal somos la instancia inmediata de las oficinas fiscales del Municipio y responsables de los valores y sus cuidados.\r\n\r\nNuestra Misión es: Administrar y fortalecer las finanzas municipales para satisfacer las necesidades de nuestra Mérida, con eficiencia, honestidad y transparencia. \r\nNuestra Visión es: Ser una dirección innovadora e incluyente que permita ser un referente nacional e internacional por el manejo eficiente de las finanzas públicas municipales, así como por el establecimiento de las mejores prácticas en materia de transparencia y rendición de cuentas. ', 'Gestionar Ingresos', 'C. Margarita Kauil Moreno', 'strong2890@gmail.com', 'Teso202*', 'Facebook.com', 'instagram.com', 'twitter.com', 0),
(3, 'Protección Civil', NULL, 1, 'https://igrip.ticul.gob.mx/logos/8protc.png', 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/proteccion-civil-1.jpg', 'Prevé la coordinación\r\ny concertación de los sectores público, privado\r\ny social en el marco del Sistema Nacional de\r\nProtección Civil, con el fin de crear un conjunto\r\nde disposiciones, planes, programas, estrategias,\r\nmecanismos y recursos para que de manera\r\ncorresponsable; privilegiando la Gestión Integral\r\nde Riesgos y la Continuidad de Operaciones, se apliquen las medidas y acciones que sean necesarias para salvaguardar la vida, integridad y salud de la población, así como sus bienes; la infraestructura, la planta productiva y el medio ambiente.', NULL, 'Luis Sosa Medina', 'proteccioncivil@ticul.gob.mx', 'Cilvil202*', '', '', '', 1),
(4, 'Catastro', 'CAT', 2, 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/3ctastro.png', 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/catastro.png', 'El catastro, en términos generales, es el censo analítico de la propiedad inmobiliaria, que tiene el propósito de ubicar, describir y registrar las características físicas de cada bien inmueble con el fin de detectar sus particularidades intrínsecas que lo definen tanto material como especialmente.\r\nLa administración pública del catastro, tiene por objeto detectar las características de los bienes inmuebles ubicados en el territorio del municipio, conocer quiénes son los propietarios de dichos bienes y registrar su situación jurídica-económica para fines tanto legales como impositivos.', NULL, 'LIC. Maritza Escamilla Valle', NULL, NULL, '', '', '', 1),
(5, 'Ecología', NULL, 1, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 'Presidencia', NULL, 2, 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/perfil-11.png', NULL, 'Presidencia', NULL, 'ZIRA NATALLY GONZALEZ SANTOS', NULL, NULL, '', '', '', 0),
(8, 'Cabildo', NULL, 2, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 'Obras Públicas', NULL, 1, 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/4obras.png', 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/obraslo.jpeg', 'edificaciones, mobiliario, equipamiento e infraestructuras que, con motivo de hacer un uso común por parte de los ciudadanos, construye y promueve un gobierno en un territorio. Este tipo de obras se financian con fondos públicos, así como posibles donantes privados, con motivo de uso público y general. \r\nLa obra pública es presupuestada y promovida por el gobierno de un territorio. Sin embargo, en diversos territorios, los gobiernos no poseen de empresas constructoras para ejecutar dicha obra. Para ello, este requiere de una empresa privada que ejecute la obra, siendo contratada por el gobierno para la realización de la obra.', NULL, 'Gilmer Xicum Gonzalez', 'obraspublicas@ticul.gob.mx', 'Obras202*', '', '', '', 1),
(10, 'Alumbrado Público', NULL, 1, 'https://igrip.ticul.gob.mx/Dept/Presidencia/lib/Web/Depts/9alumbra.png', 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/al.jpg', 'La iluminación en vialidades y espacios públicos es una medida indispensable de seguridad, que se utiliza tanto para prevenir accidentes como para impedir actos delictivos. En ocasiones, el alumbrado público también es empleado con fines de ornamento; por ejemplo, para resaltar edificios emblemáticos o para adornar plazas y parques durante la noche. Las señalizaciones viales luminosas, tales como tableros y semáforos, a pesar de cumplir una función de seguridad y formar parte de los espacios públicos, no se consideran sistemas de alumbrado público.', NULL, 'Gerardo Rodriguez Perez', 'alumbrado@ticul.gob.mx', 'Alpb202*', '', '', '', 1),
(11, 'Agua Potable', NULL, 1, 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/1agua.png', 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/ag.jpg', 'El proceso del suministro de agua potable comprende, de manera general, la captación, conducción, tratamiento, almacenamiento de agua tratada y distribución del recurso hídrico. Los sistemas convencionales de abastecimiento de agua utilizan para su captación aguas superficiales o aguas subterráneas. Las superficiales se refieren a fuentes visibles, como son ríos, arroyos, lagos y lagunas, mientras las subterráneas, a fuentes que se encuentran confinadas en el subsuelo, como pozos y galerías filtrantes.\r\n\r\nLa segunda etapa consiste en la conducción del agua desde el punto de captación hasta la planta de tratamiento o el sitio de consumo; puede ser un canal abierto o red de tuberías. La siguiente etapa se refiere a la necesidad de almacenar agua en alguna reserva cuando la fuente no presenta un caudal suficiente durante el año para satisfac', NULL, 'Eduardo Maldonado Vega', NULL, NULL, '', '', '', 1),
(13, 'DIF', NULL, 2, 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/6Dif.png', 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/ddif.jpg', 'El Sistema Nacional DIF es el organismo público descentralizado encargado de coordinar el Sistema Nacional de Asistencia Social Pública y Privada; promotor de la protección integral de los derechos de las niñas, niños y adolescentes, bajo el imperativo constitucional del interés superior de la niñez, así como del desarrollo integral del individuo, de la familia y de la comunidad, principalmente de quienes por su condición física, mental o social enfrentan una situación de vulnerabilidad, hasta lograr su incorporación a una vida plena y productiva.', NULL, 'Teresa Canche Chable', NULL, NULL, '', '', '', 1),
(14, 'Comunicación Social', NULL, 2, 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/2comuni.png', 'https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/cs.jpg', 'La Unidad de Comunicación Social ejecutará estrategias de comunicación pública y fortalecimiento de la imagen institucional, y mantendrá contacto con los medios de comunicación para la realización de ruedas de prensa y comunicados oficiales.\r\n\r\nLa Unidad tendrá como actividad principal difundir a través de los distintos medios de comunicación, las obras, acciones, planes, programas y proyectos de la Administración Pública Municipal, así como fomentar y mantener las relaciones con las instituciones, asociaciones, entidades públicas y privadas, instituciones civiles, militares y los actores sociales y políticos del Municipio.', NULL, 'Carlos Santamaria Martin', NULL, NULL, '', '', '', 1),
(15, 'Cultura', NULL, 2, NULL, NULL, NULL, NULL, NULL, 'cultura@ticul.gob.mx', 'CulT*202', NULL, NULL, NULL, 1),
(16, 'Secretaria', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(17, 'Equidad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(18, 'Salud', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(19, 'Oficialia', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(20, 'Gobernación', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(21, 'Turismo', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(22, 'Transporte', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(23, 'Desarrollo Social', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(24, 'Desarrollo Urbano', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(25, 'Yotholin', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(26, 'Pustunich', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(27, 'Calles', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(28, 'Aseo Urbano', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(29, 'Cementerio', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(30, 'Rastro', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(31, 'Mercado', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(32, 'Seguridad', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(33, 'Otros', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

CREATE TABLE `Organismo` (
  `ID_Organismo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Puestos` (
  `ID_Puesto` int NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Puestos` (`ID_Puesto`, `Nombre`) VALUES
(1, 'Admin'),
(2, 'Presidente'),
(3, 'Cobrador'),
(4, 'Secretario(a)'),
(5, 'Chofer B'),
(6, 'Regidor'),
(7, 'Sindico'),
(8, 'Secretario(a) Municipal'),
(9, 'Secretario(a) A'),
(10, 'Secretario(a) B'),
(11, 'Secretario(a) C'),
(12, 'Chofer A'),
(13, 'Coordinador'),
(14, 'Diligenciero A'),
(15, 'Diligenciero B'),
(16, 'Diligenciero C'),
(17, 'Auxiliar A'),
(18, 'Auxiliar B'),
(19, 'Auxiliar C'),
(20, 'Vigilante A'),
(21, 'Vigilante B'),
(22, 'Vigilante C'),
(23, 'Limpieza'),
(24, 'Atención'),
(25, 'Director'),
(26, 'Tesorero(a)'),
(27, 'Bacheo A'),
(28, 'Bacheo B'),
(29, 'Jefe de Albañil'),
(30, 'Recepción'),
(31, 'Psicologo'),
(32, 'Talleres'),
(33, 'Mecanico'),
(34, 'Asistente'),
(35, 'Promotor'),
(36, 'Nutricion'),
(37, 'Cocineros'),
(38, 'Terapeuta'),
(39, 'Subdirector'),
(40, 'Enfermeria'),
(41, 'Doctor'),
(42, 'Brigada A'),
(43, 'Brigada B'),
(44, 'Inapan'),
(45, 'Radiologo'),
(46, 'Trabajadora Social'),
(47, 'Autismo'),
(48, 'Controlador'),
(49, 'Oficialia'),
(50, 'Capacitador'),
(51, 'Asuntos Religiosos'),
(52, 'Archivos'),
(53, 'Comisionado'),
(54, 'Juridico'),
(55, 'Juez Calificador'),
(56, 'Juez de Paz'),
(57, 'Enlace'),
(58, 'Fotografo'),
(59, 'Diseñador'),
(60, 'Jefe de Prensa'),
(61, 'Mantenimiento'),
(63, 'Lengua Maya'),
(64, 'Eventos'),
(65, 'Entrenador'),
(66, 'Logistica'),
(67, 'Fontanero'),
(68, 'Electrico'),
(69, 'Sepulturero'),
(70, 'Recolector'),
(71, 'Oficial'),
(72, 'Sub-Oficial'),
(73, 'Comandante A'),
(74, 'Comandante B'),
(75, 'Policia A'),
(76, 'Policia B'),
(77, 'Policia C'),
(78, 'Capitan'),
(79, 'Paramedico'),
(80, 'Policia Tercero'),
(81, 'Chapeo'),
(82, 'Desbrozador'),
(83, 'Barrido de Parques'),
(84, 'Podador'),
(85, 'Veterinario'),
(86, 'Abatizador A'),
(87, 'Abatizador B'),
(88, 'Abatizador C'),
(89, 'Filtro'),
(90, 'Jefe de Cuadrilla'),
(91, 'Baños'),
(92, 'Velador'),
(93, 'Presidente Interino'),
(94, 'Presidente Suplente'),
(95, 'Perito'),
(96, 'Cedulista'),
(97, 'Otros'),
(98, 'No listado');

CREATE TABLE `Reportes_Ciudadanos` (
  `ID_Reporte` int NOT NULL,
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
  `ID_Administracion` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Sexo` (
  `ID_Sexo` int NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Sexo` (`ID_Sexo`, `Nombre`) VALUES
(1, 'Hombre'),
(2, 'Mujer'),
(3, 'Indefinido'),
(4, 'Otro');

CREATE TABLE `ZMisc` (
  `ID_Misc` int NOT NULL,
  `ID_Dep` int NOT NULL,
  `ID_Colaborador` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Corte` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


ALTER TABLE `Administraciones`
  ADD PRIMARY KEY (`ID_Administracion`);

ALTER TABLE `Api_Boleano`
  ADD PRIMARY KEY (`ID_Boleano`);

ALTER TABLE `Api_Colonias`
  ADD PRIMARY KEY (`ID_Colonia`);

ALTER TABLE `API_Comisarias`
  ADD PRIMARY KEY (`ID_Comisaria`);

ALTER TABLE `Api_Estatus`
  ADD PRIMARY KEY (`ID_Estatus`);

ALTER TABLE `Api_Pago`
  ADD PRIMARY KEY (`ID_Tipo_Pago`);

ALTER TABLE `AudiApoyo`
  ADD PRIMARY KEY (`ID_AudiApoy`);

ALTER TABLE `Audiencias`
  ADD PRIMARY KEY (`ID_Audiencia`),
  ADD KEY `ID_Ciudadano` (`ID_Ciudadano`),
  ADD KEY `ID_AudiDept` (`ID_AudiDept`),
  ADD KEY `ID_AudiApoy` (`ID_AudiApoy`),
  ADD KEY `ID_Estatus` (`ID_Estatus`);

ALTER TABLE `Ciudadanos`
  ADD PRIMARY KEY (`ID_Ciudadano`),
  ADD KEY `ID_Colonia` (`ID_Colonia`),
  ADD KEY `ID_Sexo` (`ID_Sexo`),
  ADD KEY `Foraneo` (`Foraneo`);

ALTER TABLE `Ciudadanos_Card`
  ADD PRIMARY KEY (`ID_Card`),
  ADD KEY `ID_Ciudadano` (`ID_Ciudadano`);

ALTER TABLE `Colaboradores`
  ADD PRIMARY KEY (`ID_Colaborador`),
  ADD KEY `ID_Ciudadano` (`ID_Ciudadano`),
  ADD KEY `ID_Departamento` (`ID_Departamento`),
  ADD KEY `ID_Puesto` (`ID_Puesto`),
  ADD KEY `Baja` (`Baja`),
  ADD KEY `Acceso` (`Acceso`);

ALTER TABLE `Departamentos`
  ADD PRIMARY KEY (`ID_Departamento`),
  ADD KEY `Interno` (`Interno`);

ALTER TABLE `Puestos`
  ADD PRIMARY KEY (`ID_Puesto`);

ALTER TABLE `Reportes_Ciudadanos`
  ADD PRIMARY KEY (`ID_Reporte`),
  ADD KEY `ID_Ciudadano` (`ID_Ciudadano`),
  ADD KEY `ID_Estatus` (`ID_Estatus`),
  ADD KEY `ID_Departamento` (`ID_Departamento`),
  ADD KEY `ID_Colaborador` (`ID_Colaborador`),
  ADD KEY `ID_Colonia` (`ID_Colonia`);

ALTER TABLE `Sexo`
  ADD PRIMARY KEY (`ID_Sexo`);

ALTER TABLE `ZMisc`
  ADD PRIMARY KEY (`ID_Misc`),
  ADD KEY `ID_Dep` (`ID_Dep`);


ALTER TABLE `Administraciones`
  MODIFY `ID_Administracion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `Api_Boleano`
  MODIFY `ID_Boleano` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `Api_Colonias`
  MODIFY `ID_Colonia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `API_Comisarias`
  MODIFY `ID_Comisaria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `Api_Estatus`
  MODIFY `ID_Estatus` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `Api_Pago`
  MODIFY `ID_Tipo_Pago` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `AudiApoyo`
  MODIFY `ID_AudiApoy` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `Audiencias`
  MODIFY `ID_Audiencia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

ALTER TABLE `Ciudadanos`
  MODIFY `ID_Ciudadano` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `Ciudadanos_Card`
  MODIFY `ID_Card` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `Colaboradores`
  MODIFY `ID_Colaborador` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `Departamentos`
  MODIFY `ID_Departamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

ALTER TABLE `Puestos`
  MODIFY `ID_Puesto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

ALTER TABLE `Reportes_Ciudadanos`
  MODIFY `ID_Reporte` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Sexo`
  MODIFY `ID_Sexo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `ZMisc`
  MODIFY `ID_Misc` int NOT NULL AUTO_INCREMENT;


ALTER TABLE `Audiencias`
  ADD CONSTRAINT `audiencias_ibfk_1` FOREIGN KEY (`ID_Ciudadano`) REFERENCES `Ciudadanos` (`ID_Ciudadano`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `audiencias_ibfk_2` FOREIGN KEY (`ID_AudiDept`) REFERENCES `Departamentos` (`ID_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `audiencias_ibfk_3` FOREIGN KEY (`ID_AudiApoy`) REFERENCES `AudiApoyo` (`ID_AudiApoy`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `audiencias_ibfk_4` FOREIGN KEY (`ID_Estatus`) REFERENCES `Api_Estatus` (`ID_Estatus`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Ciudadanos`
  ADD CONSTRAINT `ciudadanos_ibfk_1` FOREIGN KEY (`ID_Colonia`) REFERENCES `Api_Colonias` (`ID_Colonia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ciudadanos_ibfk_2` FOREIGN KEY (`ID_Sexo`) REFERENCES `Sexo` (`ID_Sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ciudadanos_ibfk_3` FOREIGN KEY (`Foraneo`) REFERENCES `Api_Boleano` (`ID_Boleano`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Colaboradores`
  ADD CONSTRAINT `colaboradores_ibfk_1` FOREIGN KEY (`ID_Ciudadano`) REFERENCES `Ciudadanos` (`ID_Ciudadano`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_ibfk_2` FOREIGN KEY (`ID_Departamento`) REFERENCES `Departamentos` (`ID_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_ibfk_3` FOREIGN KEY (`ID_Puesto`) REFERENCES `Puestos` (`ID_Puesto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_ibfk_4` FOREIGN KEY (`Baja`) REFERENCES `Api_Boleano` (`ID_Boleano`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_ibfk_5` FOREIGN KEY (`Acceso`) REFERENCES `Api_Boleano` (`ID_Boleano`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
