-- SCHEMA EXPORT: SE_Catastro

DROP DATABASE IF EXISTS `SE_Catastro`;
CREATE DATABASE `SE_Catastro`;
USE `SE_Catastro`;

CREATE TABLE `Cdl_Motiv` (
  `ID_Motivo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(125) DEFAULT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID_Motivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Cedulas` (
  `ID_Cedula` int NOT NULL AUTO_INCREMENT,
  `ID_Propiedad` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Motivo` int DEFAULT NULL,
  `ID_Personal` int DEFAULT NULL,
  `Observ` varchar(850) DEFAULT NULL,
  `ID_Administracion` int DEFAULT NULL,
  PRIMARY KEY (`ID_Cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Cobros` (
  `ID_Cobro` int NOT NULL AUTO_INCREMENT,
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
  `ManualC` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '0=NO, 1=SI',
  PRIMARY KEY (`ID_Cobro`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `CobrosDetalle` (
  `ID_Detalle` int NOT NULL AUTO_INCREMENT,
  `ID_Servicio` int NOT NULL,
  `Cantidad` int NOT NULL,
  `ID_Cobro` int NOT NULL,
  PRIMARY KEY (`ID_Detalle`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Cuadrante` (
  `ID_Cuadrante` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Cuadrante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `CuadranteRusticos` (
  `ID_Cuadrante` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Cuadrante`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Movimientos` (
  `ID_Movimiento` int NOT NULL AUTO_INCREMENT,
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
  `ID_Administracion` int DEFAULT NULL,
  PRIMARY KEY (`ID_Movimiento`),
  KEY `ID_Propiedad` (`ID_Propiedad`),
  CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`ID_Propiedad`) REFERENCES `Propiedades` (`ID_Propiedad`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Oficio_tipo` (
  `ID_TipOficio` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(720) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo1` varchar(720) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo2` varchar(720) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo3` varchar(720) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parrafo4` varchar(720) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ID_TipOficio`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Oficios` (
  `ID_Oficio` int NOT NULL AUTO_INCREMENT,
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
  `Parrafo4` varchar(640) DEFAULT NULL,
  PRIMARY KEY (`ID_Oficio`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Propiedades` (
  `ID_Propiedad` int NOT NULL AUTO_INCREMENT,
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
  `Importado` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Propiedad`)
) ENGINE=InnoDB AUTO_INCREMENT=1572 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Solicitudes` (
  `ID_Solicitud` int NOT NULL AUTO_INCREMENT,
  `Solicitante` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Correo` varchar(90) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Descripcion` varchar(650) DEFAULT NULL,
  `Archivos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Tarifas` (
  `ID_Tarifa` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(450) DEFAULT NULL,
  `Categoría` int DEFAULT NULL COMMENT '1=Copias, 2=Copias Certificadas, 3= Oficios, 4=Oficios Revalidacion, 5=Planos, 6=VisitasVefic, 7=Topografia, 8=ImpresionSatelital, 9=PlanosManzanerosOseccion, 10= ReferenciaGrograf, 11=ServicosExternos, 12=PlanoMunicipalNG, 13=Nomeclaturas, 14= RevisionPlanos, 15=MejoraPredios',
  `Calculable` int DEFAULT '0' COMMENT 'Indica si se calcula en base a medidas 0=NO, 1=SI',
  `RangoInicio` varchar(20) DEFAULT NULL,
  `RangoFin` varchar(20) DEFAULT NULL,
  `Precio` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`ID_Tarifa`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `TipoConstruccion` (
  `ID_Construccion` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `Calidad` varchar(30) DEFAULT NULL,
  `Tipo` int DEFAULT NULL COMMENT '0=Habitacion, 1=Industrial',
  `Descrip` varchar(50) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Construccion`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Tramite` (
  `ID_Tramite` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Requisitos` varchar(850) DEFAULT NULL,
  `Descripcion` varchar(640) DEFAULT NULL,
  `Tiempo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Icono` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID_Tramite`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Verificaciones` (
  `ID_Medicion` int NOT NULL AUTO_INCREMENT,
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
  `ID_Administracion` int DEFAULT NULL,
  PRIMARY KEY (`ID_Medicion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `VerificacionesDetalle` (
  `ID_Lectura` int NOT NULL AUTO_INCREMENT,
  `ID_Propiedad` int DEFAULT NULL,
  `ID_Medicion` int DEFAULT NULL,
  `Latitud` decimal(11,7) DEFAULT NULL,
  `Longitud` decimal(11,7) DEFAULT NULL,
  `Punto` varchar(3) DEFAULT NULL,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Tipo` int DEFAULT NULL COMMENT 'Tipo por el cual se mide',
  `Activo` int DEFAULT NULL COMMENT '0=NO, 1=SI',
  PRIMARY KEY (`ID_Lectura`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

