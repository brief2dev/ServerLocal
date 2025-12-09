-- SCHEMA EXPORT: zkke

DROP DATABASE IF EXISTS `zkke`;
CREATE DATABASE `zkke`;
USE `zkke`;

CREATE TABLE `Abonos` (
  `ID_Abono` int NOT NULL AUTO_INCREMENT,
  `ID_Caja` int DEFAULT NULL,
  `Monto` double DEFAULT NULL COMMENT 'Abono',
  `Sald_ant` double DEFAULT NULL COMMENT 'Saldo anteriror antes del abono',
  `Saldo_pen` double DEFAULT NULL COMMENT 'Saldo actual despues del abono',
  `ID_Cliente` int NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Medio` int DEFAULT NULL,
  `Estado` int DEFAULT '0' COMMENT '0=abierto, 1 cerrado',
  PRIMARY KEY (`ID_Abono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Banner` (
  `ID_Banner` int NOT NULL AUTO_INCREMENT,
  `imagen` varchar(900) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Banner`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Caja` (
  `ID_Caja` int NOT NULL AUTO_INCREMENT,
  `ID_Personal` int DEFAULT NULL,
  `ID_Caja_T` int DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  `Descripcion` varchar(160) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Monto` double NOT NULL,
  `Abono` decimal(8,2) DEFAULT NULL,
  `Efectivo` decimal(8,2) DEFAULT NULL,
  `Tarjeta` decimal(8,2) DEFAULT NULL,
  `Gastos` decimal(8,2) DEFAULT NULL,
  `S_Inicial` decimal(8,2) DEFAULT NULL,
  `T_Ventas` int DEFAULT NULL,
  `Comprobante` mediumblob,
  `Saldo` decimal(10,0) DEFAULT NULL,
  `Cort` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Saldo_Inicial` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Tip` int DEFAULT NULL COMMENT '1=efectivo 2=banco',
  `idcorte` int DEFAULT NULL,
  `ms` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Caja`),
  KEY `ID_Caja_T` (`ID_Caja_T`),
  KEY `ID_Personal` (`ID_Personal`),
  CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`ID_Personal`) REFERENCES `Personal` (`ID_Personal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Caja_ibfk_3` FOREIGN KEY (`ID_Caja_T`) REFERENCES `Caja_T` (`ID_Caja_T`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Caja_T` (
  `ID_Caja_T` int NOT NULL AUTO_INCREMENT,
  `Motivo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Caja_T`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Categorias` (
  `ID_Categoria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Descripcion` varchar(750) DEFAULT NULL,
  `Importado` varchar(30) DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Clientes` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(120) NOT NULL,
  `Apellidos` varchar(120) DEFAULT NULL,
  `Correo` varchar(40) DEFAULT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Direccion` varchar(40) DEFAULT NULL,
  `CP` int DEFAULT NULL,
  `Fecha_Registro` date DEFAULT NULL,
  `visible` int DEFAULT '1',
  `SLD` double DEFAULT '0' COMMENT 'Credito que debe',
  `Credito` double DEFAULT NULL COMMENT 'Credito restante',
  `Tope_Credito` double DEFAULT NULL COMMENT 'Limite de credito',
  `Premium` int DEFAULT NULL COMMENT '0=NO,1=SI',
  `ID_Sucursal` int DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Cuentas_Prove` (
  `ID_Cuentas` int NOT NULL AUTO_INCREMENT,
  `ID_Proveedor` int NOT NULL,
  `Banco` varchar(30) NOT NULL,
  `Numero` varchar(16) NOT NULL,
  `Targeta` varchar(16) NOT NULL,
  `Clabe` varchar(18) NOT NULL,
  PRIMARY KEY (`ID_Cuentas`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  CONSTRAINT `Cuentas_Prove_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `Proveedores` (`ID_Proveedor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Cupon` (
  `ID_Cupon` int NOT NULL AUTO_INCREMENT,
  `ID_Venta` bigint unsigned DEFAULT NULL,
  `Fecha_Gen` date DEFAULT NULL,
  `Fecha_Exp` date DEFAULT NULL,
  `Valor` int DEFAULT NULL,
  `Usado` int DEFAULT '0',
  `ID_MD` int DEFAULT NULL,
  PRIMARY KEY (`ID_Cupon`),
  KEY `ID_Venta` (`ID_Venta`),
  CONSTRAINT `cupon_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `Ventas` (`ID_Venta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Historial_Pagos` (
  `ID_HistPagos` int NOT NULL AUTO_INCREMENT,
  `ID_Cliente` int NOT NULL,
  `ID_Financiado` int DEFAULT NULL COMMENT 'ID de la venta finaciada(credito o apartado)',
  `ID_Personal` int DEFAULT NULL,
  `Anterior` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Pendiente` double DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Medio` int DEFAULT NULL COMMENT '1=Efectivo, 2=Tarjeta',
  `estatus` int DEFAULT NULL COMMENT '0=deuda, 1=liquidado',
  `Tipo` int DEFAULT NULL COMMENT '2= venta, 3 = credito',
  PRIMARY KEY (`ID_HistPagos`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `M_Abonos` (
  `ID_Abono` int NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Monto` decimal(10,0) DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `ID_Mutualista` int DEFAULT NULL COMMENT 'ID_Detalles Mutualista',
  `Finalizado` int DEFAULT '0',
  PRIMARY KEY (`ID_Abono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `M_MDetalles` (
  `ID_Detalle` int NOT NULL AUTO_INCREMENT,
  `ID_Cliente` int DEFAULT NULL,
  `ID_Mutualista` int DEFAULT NULL,
  `Cantidad` int DEFAULT '0',
  `Tiempo_Pago` varchar(11) DEFAULT NULL COMMENT '7=Semanal, 14=catorsenal,\r\n30 = mensual',
  `Numero` int DEFAULT NULL,
  `ID_Cupon` int DEFAULT NULL,
  `Entregado` int DEFAULT '0',
  PRIMARY KEY (`ID_Detalle`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `M_Mutualista` (
  `ID_Mutualista` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(40) DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `ID_Personal` int DEFAULT NULL,
  `Finalizado` int DEFAULT '0' COMMENT '0=NO, 1= SI',
  `ID_Sucursal` int DEFAULT NULL,
  PRIMARY KEY (`ID_Mutualista`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Medio_Pago` (
  `ID_Medio` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(55) NOT NULL,
  PRIMARY KEY (`ID_Medio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Pedidos` (
  `ID_Pedido` int NOT NULL AUTO_INCREMENT,
  `ID_Shein` varchar(50) DEFAULT NULL,
  `Abono` decimal(10,2) DEFAULT NULL COMMENT 'Abono',
  `Fecha_Abono` datetime DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL COMMENT 'Saldo',
  `Monto_Orig` decimal(10,2) DEFAULT NULL,
  `Saldo_Pendiente` decimal(10,2) DEFAULT NULL COMMENT 'Pendiente',
  `ID_Personal` int DEFAULT NULL,
  `Estado` int DEFAULT '0' COMMENT '0=Abierto, 1=Cerrado, 2=Cancelado',
  `ID_Sucursal` int DEFAULT NULL,
  PRIMARY KEY (`ID_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Pedidos_Abonos` (
  `ID_Abono` int NOT NULL AUTO_INCREMENT,
  `ID_Pedido` int DEFAULT NULL,
  `ID_Personal` int DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Saldo` decimal(8,2) DEFAULT NULL,
  `Abono` decimal(8,2) DEFAULT NULL,
  `Pendiente` decimal(8,2) DEFAULT NULL,
  `MedioPago` int DEFAULT NULL,
  `Estado` int DEFAULT '0',
  `ID_Sucursal` int DEFAULT NULL,
  PRIMARY KEY (`ID_Abono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Personal` (
  `ID_Personal` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Usuario` varchar(60) DEFAULT NULL,
  `Bio` varchar(80) DEFAULT NULL,
  `Comentarios` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Colonia` varchar(90) DEFAULT NULL,
  `CP` int DEFAULT NULL,
  `Correo` varchar(35) DEFAULT NULL,
  `Pass` varchar(10) NOT NULL,
  `Contrasena` varchar(100) NOT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Foto` varchar(254) DEFAULT NULL,
  `ID_Sucursal` int NOT NULL,
  `ID_Puesto` int NOT NULL,
  `rol` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Fecha_Registro` timestamp NULL DEFAULT NULL,
  `Baja` int DEFAULT '0' COMMENT '0=No, 1=Si',
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Personal`),
  KEY `ID_Sucursal` (`ID_Sucursal`),
  KEY `ID_Puesto` (`ID_Puesto`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `Sucursales` (`ID_Sucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Personal_ibfk_2` FOREIGN KEY (`ID_Puesto`) REFERENCES `Puestos` (`ID_Puesto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Productos` (
  `ID_Producto` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(255) NOT NULL,
  `Nombre` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `N_Calzado` varchar(20) DEFAULT NULL,
  `Marca` varchar(40) DEFAULT NULL,
  `Foto1` varchar(355) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Foto2` varchar(355) DEFAULT NULL,
  `Foto3` varchar(355) DEFAULT NULL,
  `Foto4` varchar(355) DEFAULT NULL,
  `Foto5` varchar(355) DEFAULT NULL,
  `item1` varchar(100) DEFAULT NULL,
  `item2` varchar(100) DEFAULT NULL,
  `item3` varchar(100) DEFAULT NULL,
  `item4` varchar(100) DEFAULT NULL,
  `item5` varchar(100) DEFAULT NULL,
  `item6` varchar(100) DEFAULT NULL,
  `item7` varchar(100) DEFAULT NULL,
  `item8` varchar(100) DEFAULT NULL,
  `item9` varchar(100) DEFAULT NULL,
  `item10` varchar(100) DEFAULT NULL,
  `PrecioVenta` decimal(8,2) DEFAULT NULL,
  `PrecioCompra` decimal(8,2) DEFAULT NULL,
  `Precio_Tachado` decimal(8,2) DEFAULT NULL,
  `Existencia` double NOT NULL,
  `ID_Sucursal` int NOT NULL,
  `ID_Categoria` int DEFAULT NULL,
  `ID_SubCat` int DEFAULT NULL,
  `Fecha_Ingreso` timestamp NULL DEFAULT NULL,
  `ID_Proveedor` int DEFAULT NULL,
  `Importado` varchar(50) DEFAULT NULL,
  `visto` int DEFAULT '1',
  `Destacado` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT 'Indica si esta promociónado 0=NO, 1=SI',
  `Online` int DEFAULT '0' COMMENT 'Indica si esta en WebApp 0=NO, 1=SI',
  `can` int DEFAULT '0' COMMENT '0=NO, 1=SI Indica si el producto esta dado de baja',
  `cant` int DEFAULT NULL COMMENT 'Indica la cantidad agregada al resurtir el usuario',
  `Calzado` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT 'indica si es calzado o otros productos 1 = SI, 0 = NO',
  PRIMARY KEY (`ID_Producto`),
  KEY `ID_Sucursal` (`ID_Sucursal`,`ID_Categoria`),
  KEY `ID_Categoria` (`ID_Categoria`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  KEY `ID_Proveedor_2` (`ID_Proveedor`),
  CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `Sucursales` (`ID_Sucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Productos_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `Categorias` (`ID_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Productos_Sucursales` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Producto` bigint unsigned NOT NULL,
  `ID_Sucursal` int unsigned NOT NULL,
  `Cantidad` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_Producto` (`ID_Producto`,`ID_Sucursal`),
  CONSTRAINT `fk_producto` FOREIGN KEY (`ID_Producto`) REFERENCES `Productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Proveedores` (
  `ID_Proveedor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(40) DEFAULT NULL,
  `Correo` varchar(40) DEFAULT NULL,
  `Telefono` varchar(40) DEFAULT NULL,
  `Foto` varchar(254) DEFAULT NULL,
  `NEmpresa` varchar(25) DEFAULT NULL,
  `NCorreo` varchar(30) DEFAULT NULL,
  `NDireccion` varchar(80) DEFAULT NULL,
  `NTel` varchar(13) DEFAULT NULL,
  `NCiudad` varchar(40) DEFAULT NULL,
  `NCP` varchar(10) DEFAULT NULL,
  `NLogo` varchar(254) DEFAULT NULL,
  `Fecha_Registro` date NOT NULL,
  `Beneficiario` varchar(60) DEFAULT NULL,
  `Clabe` varchar(30) DEFAULT NULL,
  `Banco` varchar(50) DEFAULT NULL,
  `Bio` varchar(300) DEFAULT NULL,
  `NBio` varchar(300) DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  `Importado` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Puestos` (
  `ID_Puesto` int NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Sucursales` (
  `ID_Sucursal` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `RFC` varchar(40) DEFAULT NULL,
  `Municipio` varchar(90) DEFAULT NULL,
  `Estado` varchar(40) DEFAULT NULL,
  `Direccion` varchar(80) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Colonia` varchar(65) DEFAULT NULL,
  `Cp` int DEFAULT NULL,
  `Latitud` varchar(40) DEFAULT NULL,
  `Longitud` varchar(40) DEFAULT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Logo` varchar(254) DEFAULT NULL,
  `Tipo` varchar(40) DEFAULT NULL,
  `Gerente` varchar(35) DEFAULT NULL,
  `Whats` varchar(13) DEFAULT NULL,
  `instagram` varchar(355) DEFAULT NULL,
  `facebook` varchar(355) DEFAULT NULL,
  `Color` varchar(16) DEFAULT NULL,
  `ColorDark` varchar(16) DEFAULT NULL,
  `Clabe` varchar(50) DEFAULT NULL,
  `Banco` varchar(50) DEFAULT NULL,
  `Beneficiario` varchar(50) DEFAULT NULL,
  `Utilidad` double DEFAULT NULL COMMENT 'porcentaje de utilidad',
  `visible` int DEFAULT NULL,
  PRIMARY KEY (`ID_Sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Venta_Detalle` (
  `ID_Detalle` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ID_Producto` bigint unsigned NOT NULL,
  `Cantidad` bigint unsigned NOT NULL,
  `ID_Venta` bigint unsigned NOT NULL,
  PRIMARY KEY (`ID_Detalle`),
  KEY `ID_Producto` (`ID_Producto`),
  KEY `ID_Venta` (`ID_Venta`),
  CONSTRAINT `Venta_Detalle_ibfk_2` FOREIGN KEY (`ID_Venta`) REFERENCES `Ventas` (`ID_Venta`) ON DELETE CASCADE,
  CONSTRAINT `Venta_Detalle_ibfk_3` FOREIGN KEY (`ID_Producto`) REFERENCES `Productos` (`ID_Producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Venta_T` (
  `ID_Destino` int NOT NULL AUTO_INCREMENT,
  `Destino` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_Destino`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Ventas` (
  `ID_Venta` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ID_Personal` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  `Caja` int NOT NULL,
  `ID_Medio` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Descuento_efect` decimal(8,2) DEFAULT NULL,
  `Descuento_porcent` double DEFAULT NULL,
  `Subtotal` decimal(8,2) DEFAULT NULL,
  `IVA` double DEFAULT NULL,
  `Total` decimal(8,2) DEFAULT NULL,
  `Efectivo` decimal(8,2) DEFAULT NULL,
  `Cambio` decimal(8,2) DEFAULT NULL,
  `ID_Destino` int NOT NULL,
  `Comentarios` varchar(200) DEFAULT NULL,
  `Cort` int DEFAULT NULL,
  `idcorte` int DEFAULT NULL,
  `Liquidar` int DEFAULT '0' COMMENT 'si ya liquido la deuda lleva "1" de valor	',
  `ID_Sucursal` int DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  PRIMARY KEY (`ID_Venta`),
  KEY `ID_Personal` (`ID_Personal`),
  KEY `ID_Cliente` (`ID_Cliente`),
  KEY `Caja` (`Caja`),
  KEY `ID_Medio` (`ID_Medio`),
  KEY `ID_Venta_T` (`ID_Destino`),
  CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `Clientes` (`ID_Cliente`) ON UPDATE CASCADE,
  CONSTRAINT `Ventas_ibfk_2` FOREIGN KEY (`ID_Personal`) REFERENCES `Personal` (`ID_Personal`) ON UPDATE CASCADE,
  CONSTRAINT `Ventas_ibfk_3` FOREIGN KEY (`ID_Medio`) REFERENCES `Medio_Pago` (`ID_Medio`) ON UPDATE CASCADE,
  CONSTRAINT `Ventas_ibfk_4` FOREIGN KEY (`ID_Destino`) REFERENCES `Venta_T` (`ID_Destino`) ON UPDATE CASCADE,
  CONSTRAINT `Ventas_ibfk_5` FOREIGN KEY (`Caja`) REFERENCES `Personal` (`ID_Personal`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `ZConfig` (
  `ID_C` int NOT NULL AUTO_INCREMENT,
  `Tiempo` varchar(10) NOT NULL,
  `Interes` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID_C`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ZMisc` (
  `ID_Misc` int NOT NULL AUTO_INCREMENT,
  `ID_Sucursal` int NOT NULL,
  `ID_Personal` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Corte` int DEFAULT NULL,
  PRIMARY KEY (`ID_Misc`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `codigos` (
  `idCodigo` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `descuento` int DEFAULT '0',
  `ID_Sucursal` int DEFAULT NULL,
  `FechaLimite` date DEFAULT NULL,
  `Estatus` int DEFAULT NULL COMMENT '0=Vencido, 1=Activo	',
  `Usos` int DEFAULT NULL,
  `Limite` int DEFAULT NULL,
  PRIMARY KEY (`idCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `subcat` (
  `idSubCategoria` int NOT NULL AUTO_INCREMENT,
  `subcategoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  PRIMARY KEY (`idSubCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vFinanciados` (
  `ID_Abono` int NOT NULL AUTO_INCREMENT,
  `ID_Venta` int DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Saldo_Ant` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Saldo_Pend` double DEFAULT NULL,
  `Estatus` int DEFAULT NULL COMMENT '1=Fianlizado, 0 Pendiente',
  `ID_Medio` int DEFAULT NULL COMMENT '1=Venta,2=Credito,3=Apartado',
  `Fecha_Final` date DEFAULT NULL,
  PRIMARY KEY (`ID_Abono`),
  KEY `ID_Venta` (`ID_Venta`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

