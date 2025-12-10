SET FOREIGN_KEY_CHECKS = 0;

USE `SE_SYS`;

INSERT INTO `InventarioEquipos` (`ID_Equipo`, `Nombre`, `Descrip`, `Marca`, `Modelo`, `Serie`, `ID_Dept`, `Comentario`, `Estado`, `Baja`, `Fecha_Baja`, `Ult_Coment`, `Fecha_ulti`, `Fecha_Ingreso`, `Ram`, `Disco`, `Memoria`, `Administracion`) VALUES
(2, 'Macbook air', 'comnputadora de escritorio portatil de la marca apple', 'apple', 'air 13', 'SN', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla facilisi morbi tempus iaculis urna id volutpat lacus', 1, 1, '2024-05-30', 'Facilisi etiam dignissim diam quis enim lobortis scelerisque. Eleifend quam adipiscing vitae proin sagittis. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit.', '2024-05-30', '2024-05-01', '8GB', 'SSD', '256', 2);;
INSERT INTO `VersionesAppCliente` (`ID_Version`, `Version`, `descripcion`) VALUES
(1, '1.9.1', ''),
(2, '1.9.1', '');;

SET FOREIGN_KEY_CHECKS = 1;
