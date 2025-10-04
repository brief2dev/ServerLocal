-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-09-2025 a las 10:04:20
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


INSERT INTO `Administraciones` (`ID_Administracion`, `Nombre`, `Partido`, `Alcalde`, `Suplente`, `Secretario`, `Direccion`, `RFC`, `CP`, `FotoAlcalde`, `Logo`, `Portada`, `Licencia`, `Prefijo`, `PreUser`, `Web`, `Tel`, `Color`, `ColorDark`, `Fecha_Admin`, `Fecha_Inicio`, `Fecha_Termino`, `Concluido`) VALUES
(2, 'MUNICIPIO DE SANTA ELENA', 'PAN', 'Galdino Poot Moreno', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'https://santaelena.gob.mx', NULL, '#078ed6', '#046091', '2021-2024', '2021-09-01', '2024-09-01', 1),
(3, 'MUNICIPIO DE SANTA ELENA', 'PAN', 'Galdino Poot Moreno', 'Jose Tec Koyoc', 'Luis Antonio Kauil Cetina', 'PALACIO MUNICIPAL COL. CENTRO', 'MSE850101IT1', '97890', NULL, NULL, NULL, 0, 'Santa Elena', 'SE', 'https://santaelena.gob.mx', NULL, '#078ed6', '#046091', '2024-2027', '2024-09-01', NULL, 0);


INSERT INTO `Api_Boleano` (`ID_Boleano`, `Nombre`) VALUES
(1, 'NO'),
(2, 'SI');


INSERT INTO `Api_Colonias` (`ID_Colonia`, `Nombre`) VALUES
(1, 'Centro');


INSERT INTO `Api_Estatus` (`ID_Estatus`, `Nombre`) VALUES
(1, 'Pendiente'),
(2, 'Proceso'),
(3, 'Finalizado'),
(4, 'Aceptado'),
(5, 'Cancelado'),
(6, 'Pospuesto');

INSERT INTO `Api_Pago` (`ID_Tipo_Pago`, `Nombre`) VALUES
(1, 'Efectivo'),
(3, 'Tarjeta/SPEI'),
(5, 'Otro');

INSERT INTO `Ciudadanos` (`ID_Ciudadano`, `Nombres`, `ApellidoP`, `ApellidoM`, `Direccion`, `NCasa`, `ID_Colonia`, `Latitud`, `Longitud`, `Telefono`, `Correo`, `Foto`, `FechaRegistro`, `FechaNacimiento`, `ClaveElector`, `RFC`, `Curp`, `Foraneo`, `ID_Sexo`, `ID_Facebook`, `ID_Firebase`, `Importado`) VALUES
(1, 'Mariel Eleazar', 'Santos', 'Paredes', 'C43 x 24A 26', '203-Q', 2, '0.0', '0.0', '5660436605', 'm.santos@blitzc0de.com', NULL, '2022-12-09 06:20:18', '1990-03-28', 'SAPM900328H', 'SAPM900328CG9', 'SAPM900328HYNNRR01', 2, 1, NULL, NULL, NULL);

INSERT INTO `Ciudadanos_Card` (`ID_Card`, `Numero`, `Mes`, `Ano`, `CVV`, `Tipo`, `ID_Ciudadano`, `Direccion`) VALUES
(2, '5064510000300020', 12, 23, 874, NULL, 1, NULL),
(3, '1234567890123456', 22, 99, 543, NULL, 151, NULL);

INSERT INTO `Colaboradores` (`ID_Colaborador`, `ID_Ciudadano`, `ID_Departamento`, `ID_Puesto`, `Usuario`, `Pass`, `PsD`, `FechaRegistro`, `Acceso`, `Baja`, `FechaBaja`, `Comentario`, `Escolaridad`, `Cedula`, `Correo`, `Foto`, `FB`, `TW`, `INST`, `Sueldo`, `ID_Administracion`) VALUES
(1, 1, 4, 1, 'strong.sys', 'gDYQkb4xnY1lXDka2QZhQA==', '12', '2024-09-01', 2, 1, NULL, '555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1200, 3);

INSERT INTO `Departamentos` (`ID_Departamento`, `Nombre`, `Prefijo`, `Interno`, `Logo1`, `Logo2`, `Descripcion`, `Funciones`, `Servidor`, `Mail`, `Pass_Mail`, `Facebook`, `Insta`, `Twitter`, `Visible`) VALUES
(1, 'Sistemas', 'SYS', 2, '', '', 'Descripción Sistemas', 'Descripción Sistemas', 'ING. Mariel Eleazar Santos Paredes', 'app-support@blitzc0de.com', NULL, NULL, NULL, NULL, 0),
(2, 'Tesoreria', NULL, 2, '', '', 'Como Dirección de Finanzas y Tesorería Municipal somos la instancia inmediata de las oficinas fiscales del Municipio y responsables de los valores y sus cuidados.\r\n\r\nNuestra Misión es: Administrar y fortalecer las finanzas municipales para satisfacer las necesidades de nuestra Mérida, con eficiencia, honestidad y transparencia. \r\nNuestra Visión es: Ser una dirección innovadora e incluyente que permita ser un referente nacional e internacional por el manejo eficiente de las finanzas públicas municipales, así como por el establecimiento de las mejores prácticas en materia de transparencia y rendición de cuentas. ', 'Gestionar Ingresos', 'Margarita Kauil Moreno', '', '', 'Facebook.com', 'instagram.com', 'twitter.com', 0),
(3, 'Protección Civil', NULL, 1, '', '', 'Prevé la coordinación\r\ny concertación de los sectores público, privado\r\ny social en el marco del Sistema Nacional de\r\nProtección Civil, con el fin de crear un conjunto\r\nde disposiciones, planes, programas, estrategias,\r\nmecanismos y recursos para que de manera\r\ncorresponsable; privilegiando la Gestión Integral\r\nde Riesgos y la Continuidad de Operaciones, se apliquen las medidas y acciones que sean necesarias para salvaguardar la vida, integridad y salud de la población, así como sus bienes; la infraestructura, la planta productiva y el medio ambiente.', NULL, 'Luis Sosa Medina', 'proteccioncivil@ticul.gob.mx', 'Cilvil202*', '', '', '', 1),
(4, 'Catastro', 'CAT', 2, '', '', 'El catastro, en términos generales, es el censo analítico de la propiedad inmobiliaria, que tiene el propósito de ubicar, describir y registrar las características físicas de cada bien inmueble con el fin de detectar sus particularidades intrínsecas que lo definen tanto material como especialmente.\r\nLa administración pública del catastro, tiene por objeto detectar las características de los bienes inmuebles ubicados en el territorio del municipio, conocer quiénes son los propietarios de dichos bienes y registrar su situación jurídica-económica para fines tanto legales como impositivos.', NULL, 'LIC. Maritza Escamilla Valle', NULL, NULL, '', '', '', 1),
(5, 'Ecología', NULL, 1, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 'Presidencia', NULL, 2, '', NULL, 'Presidencia', NULL, '', NULL, NULL, '', '', '', 0),
(8, 'Cabildo', NULL, 2, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 'Obras Públicas', NULL, 1, '', '', 'edificaciones, mobiliario, equipamiento e infraestructuras que, con motivo de hacer un uso común por parte de los ciudadanos, construye y promueve un gobierno en un territorio. Este tipo de obras se financian con fondos públicos, así como posibles donantes privados, con motivo de uso público y general. \r\nLa obra pública es presupuestada y promovida por el gobierno de un territorio. Sin embargo, en diversos territorios, los gobiernos no poseen de empresas constructoras para ejecutar dicha obra. Para ello, este requiere de una empresa privada que ejecute la obra, siendo contratada por el gobierno para la realización de la obra.', NULL, '', '', '', '', '', '', 1),
(10, 'Alumbrado Público', NULL, 1, '', '', 'La iluminación en vialidades y espacios públicos es una medida indispensable de seguridad, que se utiliza tanto para prevenir accidentes como para impedir actos delictivos. En ocasiones, el alumbrado público también es empleado con fines de ornamento; por ejemplo, para resaltar edificios emblemáticos o para adornar plazas y parques durante la noche. Las señalizaciones viales luminosas, tales como tableros y semáforos, a pesar de cumplir una función de seguridad y formar parte de los espacios públicos, no se consideran sistemas de alumbrado público.', NULL, 'Gerardo Rodriguez Perez', '', '', '', '', '', 1),
(11, 'Agua Potable', NULL, 1, '', '', 'El proceso del suministro de agua potable comprende, de manera general, la captación, conducción, tratamiento, almacenamiento de agua tratada y distribución del recurso hídrico. Los sistemas convencionales de abastecimiento de agua utilizan para su captación aguas superficiales o aguas subterráneas. Las superficiales se refieren a fuentes visibles, como son ríos, arroyos, lagos y lagunas, mientras las subterráneas, a fuentes que se encuentran confinadas en el subsuelo, como pozos y galerías filtrantes.\r\n\r\nLa segunda etapa consiste en la conducción del agua desde el punto de captación hasta la planta de tratamiento o el sitio de consumo; puede ser un canal abierto o red de tuberías. La siguiente etapa se refiere a la necesidad de almacenar agua en alguna reserva cuando la fuente no presenta un caudal suficiente durante el año para satisfac', NULL, '', NULL, NULL, '', '', '', 1),
(13, 'DIF', NULL, 2, '', '', 'El Sistema Nacional DIF es el organismo público descentralizado encargado de coordinar el Sistema Nacional de Asistencia Social Pública y Privada; promotor de la protección integral de los derechos de las niñas, niños y adolescentes, bajo el imperativo constitucional del interés superior de la niñez, así como del desarrollo integral del individuo, de la familia y de la comunidad, principalmente de quienes por su condición física, mental o social enfrentan una situación de vulnerabilidad, hasta lograr su incorporación a una vida plena y productiva.', NULL, 'Teresa Canche Chable', NULL, NULL, '', '', '', 1),
(14, 'Comunicación Social', NULL, 2, '', '', 'La Unidad de Comunicación Social ejecutará estrategias de comunicación pública y fortalecimiento de la imagen institucional, y mantendrá contacto con los medios de comunicación para la realización de ruedas de prensa y comunicados oficiales.\r\n\r\nLa Unidad tendrá como actividad principal difundir a través de los distintos medios de comunicación, las obras, acciones, planes, programas y proyectos de la Administración Pública Municipal, así como fomentar y mantener las relaciones con las instituciones, asociaciones, entidades públicas y privadas, instituciones civiles, militares y los actores sociales y políticos del Municipio.', NULL, '', NULL, NULL, '', '', '', 1),
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
(26, 'Tesorero'),
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

INSERT INTO `Sexo` (`ID_Sexo`, `Nombre`) VALUES
(1, 'Hombre'),
(2, 'Mujer'),
(3, 'Indefinido'),
(4, 'Otro');
COMMIT;