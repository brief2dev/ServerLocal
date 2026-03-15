SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `Abonos` (
  `ID_Abono` int NOT NULL,
  `ID_Caja` int DEFAULT NULL,
  `Monto` double DEFAULT NULL COMMENT 'Abono',
  `Sald_ant` double DEFAULT NULL COMMENT 'Saldo anteriror antes del abono',
  `Saldo_pen` double DEFAULT NULL COMMENT 'Saldo actual despues del abono',
  `ID_Cliente` int NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Medio` int DEFAULT NULL,
  `Estado` int DEFAULT '0' COMMENT '0=abierto, 1 cerrado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Banner` (
  `ID_Banner` int NOT NULL,
  `imagen` varchar(900) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Banner` (`ID_Banner`, `imagen`, `createdAt`) VALUES
(14, 'https://blitzc0de.com/assets/images/2.jpg', '2024-04-29 10:04:55'),
(18, 'https://blitzc0de.com/assets/images/3.jpg', '2024-04-29 10:32:56'),
(36, 'https://sys.powersports.top/lib/Online/banners/67c7949415a65_w2.jpg', '2025-03-05 06:02:28');

CREATE TABLE `Caja` (
  `ID_Caja` int NOT NULL,
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
  `ms` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Caja_T` (
  `ID_Caja_T` int NOT NULL,
  `Motivo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Caja_T` (`ID_Caja_T`, `Motivo`) VALUES
(1, 'Ingreso'),
(2, 'Retiro');

CREATE TABLE `Categorias` (
  `ID_Categoria` int NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `Descripcion` varchar(750) DEFAULT NULL,
  `Importado` varchar(30) DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Categorias` (`ID_Categoria`, `Nombre`, `Descripcion`, `Importado`, `ID_Sucursal`) VALUES
(1, 'PANTALONES', 'Dama', NULL, 1),
(2, 'CALZADO', 'Éngloba los zapatos de distintas marcas', NULL, 1),
(3, 'ACCESORIOS ', '', NULL, 1),
(4, 'ROPA ', '', NULL, 1),
(5, 'SNACK', 'Refescos, Papitas etc.', NULL, 1);

CREATE TABLE `Clientes` (
  `ID_Cliente` int NOT NULL,
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
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Clientes` (`ID_Cliente`, `Nombres`, `Apellidos`, `Correo`, `Telefono`, `Direccion`, `CP`, `Fecha_Registro`, `visible`, `SLD`, `Credito`, `Tope_Credito`, `Premium`, `ID_Sucursal`) VALUES
(1, 'Publico', 'General', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1),
(2, 'Mariel', 'Santos', NULL, '9971135089', 'C 43 x 24a y 26', NULL, '2022-10-22', 1, 26, 2300, 2300, 1, 1);

CREATE TABLE `codigos` (
  `idCodigo` int NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descuento` int DEFAULT '0',
  `ID_Sucursal` int DEFAULT NULL,
  `FechaLimite` date DEFAULT NULL,
  `Estatus` int DEFAULT NULL COMMENT '0=Vencido, 1=Activo	',
  `Usos` int DEFAULT NULL,
  `Limite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Cuentas_Prove` (
  `ID_Cuentas` int NOT NULL,
  `ID_Proveedor` int NOT NULL,
  `Banco` varchar(30) NOT NULL,
  `Numero` varchar(16) NOT NULL,
  `Targeta` varchar(16) NOT NULL,
  `Clabe` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Cupon` (
  `ID_Cupon` int NOT NULL,
  `ID_Venta` bigint UNSIGNED DEFAULT NULL,
  `Fecha_Gen` date DEFAULT NULL,
  `Fecha_Exp` date DEFAULT NULL,
  `Valor` int DEFAULT NULL,
  `Usado` int DEFAULT '0',
  `ID_MD` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Historial_Pagos` (
  `ID_HistPagos` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  `ID_Financiado` int DEFAULT NULL COMMENT 'ID de la venta finaciada(credito o apartado)',
  `ID_Personal` int DEFAULT NULL,
  `Anterior` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Pendiente` double DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Medio` int DEFAULT NULL COMMENT '1=Efectivo, 2=Tarjeta',
  `estatus` int DEFAULT NULL COMMENT '0=deuda, 1=liquidado',
  `Tipo` int DEFAULT NULL COMMENT '2= venta, 3 = credito'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Medio_Pago` (
  `ID_Medio` int NOT NULL,
  `Tipo` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Medio_Pago` (`ID_Medio`, `Tipo`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta / SPEI'),
(3, 'Creditos');

CREATE TABLE `M_Abonos` (
  `ID_Abono` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Monto` decimal(10,0) DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `ID_Mutualista` int DEFAULT NULL COMMENT 'ID_Detalles Mutualista',
  `Finalizado` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `M_MDetalles` (
  `ID_Detalle` int NOT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `ID_Mutualista` int DEFAULT NULL,
  `Cantidad` int DEFAULT '0',
  `Tiempo_Pago` varchar(11) DEFAULT NULL COMMENT '7=Semanal, 14=catorsenal,\r\n30 = mensual',
  `Numero` int DEFAULT NULL,
  `ID_Cupon` int DEFAULT NULL,
  `Entregado` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `M_Mutualista` (
  `ID_Mutualista` int NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `ID_Personal` int DEFAULT NULL,
  `Finalizado` int DEFAULT '0' COMMENT '0=NO, 1= SI',
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Pedidos` (
  `ID_Pedido` int NOT NULL,
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
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Pedidos_Abonos` (
  `ID_Abono` int NOT NULL,
  `ID_Pedido` int DEFAULT NULL,
  `ID_Personal` int DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Saldo` decimal(8,2) DEFAULT NULL,
  `Abono` decimal(8,2) DEFAULT NULL,
  `Pendiente` decimal(8,2) DEFAULT NULL,
  `MedioPago` int DEFAULT NULL,
  `Estado` int DEFAULT '0',
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Personal` (
  `ID_Personal` int NOT NULL,
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
  `visible` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Personal` (`ID_Personal`, `Nombre`, `Apellido`, `Usuario`, `Bio`, `Comentarios`, `Colonia`, `CP`, `Correo`, `Pass`, `Contrasena`, `Telefono`, `Foto`, `ID_Sucursal`, `ID_Puesto`, `rol`, `Fecha_Registro`, `Baja`, `visible`) VALUES
(1, 'Mariel', 'Santos', 'mariel.santos', NULL, 'Encargado del dep de Sistema', NULL, NULL, '', '12', '$2b$12$rASdhSBwLC.stNOJx2Gh7uyHm6UTJ8ZEsIQA0dPlMdQkEUWX.NLEC', '5586673337', 'lib/Personal/img/IMG_0920.jpeg', 1, 1, '', '2023-03-20 06:00:00', 0, 1);

CREATE TABLE `Productos` (
  `ID_Producto` bigint UNSIGNED NOT NULL,
  `Codigo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Nombre` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `N_Calzado` varchar(20) DEFAULT NULL,
  `Marca` varchar(40) DEFAULT NULL,
  `PrecioVenta` decimal(8,2) DEFAULT NULL,
  `PrecioCompra` decimal(8,2) DEFAULT NULL,
  `Precio_Tachado` decimal(8,2) DEFAULT NULL,
  `Existencia` double DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  `ID_Categoria` int DEFAULT NULL,
  `ID_SubCat` int DEFAULT NULL,
  `Fecha_Ingreso` timestamp NULL DEFAULT NULL,
  `ID_Proveedor` int DEFAULT NULL,
  `Activo` tinyint DEFAULT NULL COMMENT '0=Oculto, 1=Visible',
  `Destacado` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT 'Indica si esta promociónado 0=NO, 1=SI',
  `Online` int DEFAULT '0' COMMENT 'Indica si esta en WebApp 0=NO, 1=SI',
  `Calzado` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT 'indica si es calzado o otros productos 1 = SI, 0 = NO',
  `Estado` int DEFAULT NULL COMMENT 'determina si tiene variantes 0=Inactivo, 1=Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Productos` (`ID_Producto`, `Codigo`, `Nombre`, `Descripcion`, `N_Calzado`, `Marca`, `PrecioVenta`, `PrecioCompra`, `Precio_Tachado`, `Existencia`, `ID_Sucursal`, `ID_Categoria`, `ID_SubCat`, `Fecha_Ingreso`, `ID_Proveedor`, `Activo`, `Destacado`, `Online`, `Calzado`, `Estado`) VALUES
(1, NULL, 'Calcetines NK', 'CALCETAS DE COLOR AZUL NIKE', NULL, 'Nike', NULL, NULL, NULL, NULL, NULL, 4, 4, '2026-01-18 04:30:01', NULL, 1, '1', 1, '0', 1),
(2, NULL, 'Tenis', 'sas', NULL, 'Blitzc0de', NULL, NULL, NULL, NULL, NULL, 3, 4, '2026-01-23 03:29:40', NULL, 1, '1', 0, '1', 1),
(3, NULL, 'var2', 'asd', NULL, 'c0de', NULL, NULL, NULL, NULL, NULL, 3, 5, '2026-01-23 03:33:35', NULL, 1, '0', 0, '0', 0);

CREATE TABLE `Productos_Sucursales` (
  `ID` int NOT NULL,
  `ID_Producto` bigint UNSIGNED NOT NULL,
  `ID_Sucursal` int UNSIGNED NOT NULL,
  `Cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Producto_Fotos` (
  `ID_Foto` bigint UNSIGNED NOT NULL,
  `ID_Variante` bigint UNSIGNED NOT NULL,
  `URL` varchar(255) NOT NULL,
  `Orden` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Producto_Fotos` (`ID_Foto`, `ID_Variante`, `URL`, `Orden`) VALUES
(1, 1, 'https://media.istockphoto.com/id/1127245421/es/foto/manos-de-mujer-pidiendo-la-bendici%C3%B3n-de-dios-sobre-fondo-puesta-de-sol.jpg?s=1024x1024&w=is&k=20&c=rckoeBloyLTsIHQabNQRzxtgKAzZrakd4IIlKDU3nRw=', 1),
(2, 1, 'https://media.istockphoto.com/id/1413735503/es/foto/redes-sociales-social-medios-marketing-tailandia-redes-sociales-compromiso-post-estructura.jpg?s=1024x1024&w=is&k=20&c=KenA_63Odltn9Gs5vf1kI_FDiomv3VSUuZqcw6JL4yI=', 1),
(3, 1, 'https://media.gettyimages.com/id/2149530993/es/foto/concepto-de-cabeza-humana-digital-para-ia-metaverso-y-tecnolog%C3%ADa-de-reconocimiento-facial.jpg?s=612x612&w=0&k=20&c=LgJwbozlsJTJgJ-XMPCK9Ntl8H_FO0iLI5wmakXyWZw=', 1),
(4, 2, 'https://media.gettyimages.com/id/1385970223/es/foto/gran-idea-de-un-plan-de-estrategia-de-marketing-en-una-oficina-creativa.jpg?s=612x612&w=gi&k=20&c=48O0PrmqRjpCxOWiM2xUIgSxF4_lCLaYZ6pTe2QQfac=', 1);

CREATE TABLE `Producto_Variantes` (
  `ID_Variante` bigint UNSIGNED NOT NULL,
  `ID_Producto` bigint UNSIGNED NOT NULL,
  `Talla` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `SKU` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PrecioVenta` decimal(10,2) NOT NULL,
  `PrecioCompra` decimal(10,2) DEFAULT NULL,
  `Precio_Tachado` decimal(10,2) DEFAULT NULL,
  `Online` tinyint DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1' COMMENT '0=Oculto, 1=Visible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Producto_Variantes` (`ID_Variante`, `ID_Producto`, `Talla`, `Color`, `SKU`, `PrecioVenta`, `PrecioCompra`, `Precio_Tachado`, `Online`, `Activo`) VALUES
(1, 1, 'UNITALLA', 'AZUL', '01', 36.23, 25.00, 55.00, 1, 1),
(2, 1, 'TCH', 'VERDER', '011', 37.23, 26.00, 56.00, 1, 1),
(3, 2, '12', '', 'Var1', 1.45, 1.00, NULL, 0, 1);

CREATE TABLE `Producto_Variante_Sucursales` (
  `ID` bigint UNSIGNED NOT NULL,
  `ID_Variante` bigint UNSIGNED NOT NULL,
  `ID_Sucursal` bigint UNSIGNED NOT NULL,
  `Cantidad` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Producto_Variante_Sucursales` (`ID`, `ID_Variante`, `ID_Sucursal`, `Cantidad`) VALUES
(1, 1, 1, 2),
(2, 2, 1, 4),
(3, 3, 1, 11);

CREATE TABLE `Proveedores` (
  `ID_Proveedor` int NOT NULL,
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
  `Importado` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Puestos` (
  `ID_Puesto` int NOT NULL,
  `Cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Puestos` (`ID_Puesto`, `Cargo`) VALUES
(1, 'Sistemas'),
(2, 'Administrador'),
(3, 'Encargado'),
(4, 'Vendedor'),
(5, 'Cliente'),
(6, 'Proveedor');

CREATE TABLE `subcat` (
  `idSubCategoria` int NOT NULL,
  `subcategoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `subcat` (`idSubCategoria`, `subcategoria`, `Descripcion`, `ID_Sucursal`) VALUES
(1, 'PANTALONES', 'Dama', 1),
(2, 'NIÑOS', NULL, 1),
(3, 'DAMA', NULL, 1),
(4, 'CABALLERO', NULL, 1),
(5, 'OTROS', NULL, 1),
(6, 'DEPORTE', NULL, 1),
(7, 'TENIS', NULL, 1),
(8, 'BOTIN', NULL, 1);

CREATE TABLE `Sucursales` (
  `ID_Sucursal` int NOT NULL,
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
  `visible` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Sucursales` (`ID_Sucursal`, `Nombre`, `RFC`, `Municipio`, `Estado`, `Direccion`, `Correo`, `Colonia`, `Cp`, `Latitud`, `Longitud`, `Telefono`, `Logo`, `Tipo`, `Gerente`, `Whats`, `instagram`, `facebook`, `Color`, `ColorDark`, `Clabe`, `Banco`, `Beneficiario`, `Utilidad`, `visible`) VALUES
(1, 'PowerSports', 'PAAV630203VDA', 'Ticul', 'Yucatan', 'C-24 x 29 y 27', 'contacto@powersports.top', 'Centro', 97880, NULL, NULL, '5660436605', 'assets/images/companies/PS.png', NULL, 'Isabel May Salazar', '5649562263', NULL, NULL, '#32a852', '#1f7837', '', '', '', 31, 1);

CREATE TABLE `Ventas` (
  `ID_Venta` bigint UNSIGNED NOT NULL,
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
  `Fecha_Fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Ventas` (`ID_Venta`, `ID_Personal`, `ID_Cliente`, `Caja`, `ID_Medio`, `Cantidad`, `Fecha`, `Hora`, `Descuento_efect`, `Descuento_porcent`, `Subtotal`, `IVA`, `Total`, `Efectivo`, `Cambio`, `ID_Destino`, `Comentarios`, `Cort`, `idcorte`, `Liquidar`, `ID_Sucursal`, `Fecha_Fin`) VALUES
(1, 1, 1, 1, 1, 1, '2026-01-23', '04:17:26', 0.00, 0, 1.45, 0.232, 1.45, 2.00, 0.55, 1, '', 0, NULL, 0, 1, NULL);

CREATE TABLE `Venta_Detalle` (
  `ID_Detalle` bigint UNSIGNED NOT NULL,
  `ID_Producto` bigint UNSIGNED DEFAULT NULL COMMENT 'ahora se guarda ID_Variante ',
  `Cantidad` bigint UNSIGNED NOT NULL,
  `PrecioUnitario` decimal(10,2) NOT NULL,
  `ID_Venta` bigint UNSIGNED NOT NULL,
  `ID_Variante` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Venta_Detalle` (`ID_Detalle`, `ID_Producto`, `Cantidad`, `PrecioUnitario`, `ID_Venta`, `ID_Variante`) VALUES
(1, NULL, 1, 1.45, 1, 3);

CREATE TABLE `Venta_T` (
  `ID_Destino` int NOT NULL,
  `Destino` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Venta_T` (`ID_Destino`, `Destino`) VALUES
(1, 'Venta'),
(2, 'Credito'),
(3, 'Apartado'),
(4, 'Cambio');

CREATE TABLE `vFinanciados` (
  `ID_Abono` int NOT NULL,
  `ID_Venta` int DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Saldo_Ant` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Saldo_Pend` double DEFAULT NULL,
  `Estatus` int DEFAULT NULL COMMENT '1=Fianlizado, 0 Pendiente',
  `ID_Medio` int DEFAULT NULL COMMENT '1=Venta,2=Credito,3=Apartado',
  `Fecha_Final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `ZConfig` (
  `ID_C` int NOT NULL,
  `Tiempo` varchar(10) NOT NULL,
  `Interes` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ZConfig` (`ID_C`, `Tiempo`, `Interes`) VALUES
(1, '30', 20);

CREATE TABLE `ZMisc` (
  `ID_Misc` int NOT NULL,
  `ID_Sucursal` int NOT NULL,
  `ID_Personal` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Corte` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `ZMisc` (`ID_Misc`, `ID_Sucursal`, `ID_Personal`, `Fecha`, `Corte`) VALUES
(1, 1, 1, '2026-01-18', 0),
(2, 1, 1, '2026-01-22', 0),
(3, 1, 1, '2026-01-23', 0);


ALTER TABLE `Abonos`
  ADD PRIMARY KEY (`ID_Abono`);

ALTER TABLE `Banner`
  ADD PRIMARY KEY (`ID_Banner`);

ALTER TABLE `Caja`
  ADD PRIMARY KEY (`ID_Caja`),
  ADD KEY `ID_Caja_T` (`ID_Caja_T`),
  ADD KEY `ID_Personal` (`ID_Personal`);

ALTER TABLE `Caja_T`
  ADD PRIMARY KEY (`ID_Caja_T`);

ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

ALTER TABLE `codigos`
  ADD PRIMARY KEY (`idCodigo`);

ALTER TABLE `Cuentas_Prove`
  ADD PRIMARY KEY (`ID_Cuentas`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`);

ALTER TABLE `Cupon`
  ADD PRIMARY KEY (`ID_Cupon`),
  ADD KEY `ID_Venta` (`ID_Venta`);

ALTER TABLE `Historial_Pagos`
  ADD PRIMARY KEY (`ID_HistPagos`);

ALTER TABLE `Medio_Pago`
  ADD PRIMARY KEY (`ID_Medio`);

ALTER TABLE `M_Abonos`
  ADD PRIMARY KEY (`ID_Abono`);

ALTER TABLE `M_MDetalles`
  ADD PRIMARY KEY (`ID_Detalle`);

ALTER TABLE `M_Mutualista`
  ADD PRIMARY KEY (`ID_Mutualista`);

ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`ID_Pedido`);

ALTER TABLE `Pedidos_Abonos`
  ADD PRIMARY KEY (`ID_Abono`);

ALTER TABLE `Personal`
  ADD PRIMARY KEY (`ID_Personal`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`),
  ADD KEY `ID_Puesto` (`ID_Puesto`);

ALTER TABLE `Productos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`,`ID_Categoria`),
  ADD KEY `ID_Categoria` (`ID_Categoria`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`),
  ADD KEY `ID_Proveedor_2` (`ID_Proveedor`);

ALTER TABLE `Productos_Sucursales`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Producto` (`ID_Producto`,`ID_Sucursal`);

ALTER TABLE `Producto_Fotos`
  ADD PRIMARY KEY (`ID_Foto`),
  ADD KEY `fk_foto_variante` (`ID_Variante`);

ALTER TABLE `Producto_Variantes`
  ADD PRIMARY KEY (`ID_Variante`),
  ADD UNIQUE KEY `SKU` (`SKU`),
  ADD KEY `fk_variante_producto` (`ID_Producto`);

ALTER TABLE `Producto_Variante_Sucursales`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `uk_variante_sucursal` (`ID_Variante`,`ID_Sucursal`);

ALTER TABLE `Proveedores`
  ADD PRIMARY KEY (`ID_Proveedor`);

ALTER TABLE `Puestos`
  ADD PRIMARY KEY (`ID_Puesto`);

ALTER TABLE `subcat`
  ADD PRIMARY KEY (`idSubCategoria`);

ALTER TABLE `Sucursales`
  ADD PRIMARY KEY (`ID_Sucursal`);

ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `ID_Personal` (`ID_Personal`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `Caja` (`Caja`),
  ADD KEY `ID_Medio` (`ID_Medio`),
  ADD KEY `ID_Venta_T` (`ID_Destino`);

ALTER TABLE `Venta_Detalle`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Venta` (`ID_Venta`);

ALTER TABLE `Venta_T`
  ADD PRIMARY KEY (`ID_Destino`);

ALTER TABLE `vFinanciados`
  ADD PRIMARY KEY (`ID_Abono`),
  ADD KEY `ID_Venta` (`ID_Venta`);

ALTER TABLE `ZConfig`
  ADD PRIMARY KEY (`ID_C`);

ALTER TABLE `ZMisc`
  ADD PRIMARY KEY (`ID_Misc`);


ALTER TABLE `Abonos`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Banner`
  MODIFY `ID_Banner` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

ALTER TABLE `Caja`
  MODIFY `ID_Caja` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Caja_T`
  MODIFY `ID_Caja_T` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `Categorias`
  MODIFY `ID_Categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `Clientes`
  MODIFY `ID_Cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `codigos`
  MODIFY `idCodigo` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Cuentas_Prove`
  MODIFY `ID_Cuentas` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Cupon`
  MODIFY `ID_Cupon` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Historial_Pagos`
  MODIFY `ID_HistPagos` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Medio_Pago`
  MODIFY `ID_Medio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `M_Abonos`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `M_MDetalles`
  MODIFY `ID_Detalle` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `M_Mutualista`
  MODIFY `ID_Mutualista` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Pedidos`
  MODIFY `ID_Pedido` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Pedidos_Abonos`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Personal`
  MODIFY `ID_Personal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `Productos`
  MODIFY `ID_Producto` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `Productos_Sucursales`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Producto_Fotos`
  MODIFY `ID_Foto` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `Producto_Variantes`
  MODIFY `ID_Variante` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `Producto_Variante_Sucursales`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `Proveedores`
  MODIFY `ID_Proveedor` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `Puestos`
  MODIFY `ID_Puesto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `subcat`
  MODIFY `idSubCategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `Sucursales`
  MODIFY `ID_Sucursal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `Ventas`
  MODIFY `ID_Venta` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `Venta_Detalle`
  MODIFY `ID_Detalle` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `Venta_T`
  MODIFY `ID_Destino` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `vFinanciados`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `ZConfig`
  MODIFY `ID_C` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `ZMisc`
  MODIFY `ID_Misc` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `Caja`
  ADD CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`ID_Personal`) REFERENCES `Personal` (`ID_Personal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Caja_ibfk_3` FOREIGN KEY (`ID_Caja_T`) REFERENCES `Caja_T` (`ID_Caja_T`) ON UPDATE CASCADE;

ALTER TABLE `Cuentas_Prove`
  ADD CONSTRAINT `Cuentas_Prove_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `Proveedores` (`ID_Proveedor`) ON UPDATE CASCADE;

ALTER TABLE `Cupon`
  ADD CONSTRAINT `cupon_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `Ventas` (`ID_Venta`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `Sucursales` (`ID_Sucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Personal_ibfk_2` FOREIGN KEY (`ID_Puesto`) REFERENCES `Puestos` (`ID_Puesto`) ON UPDATE CASCADE;

ALTER TABLE `Productos`
  ADD CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `Sucursales` (`ID_Sucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Productos_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `Categorias` (`ID_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Productos_Sucursales`
  ADD CONSTRAINT `fk_producto` FOREIGN KEY (`ID_Producto`) REFERENCES `Productos` (`ID_Producto`);

ALTER TABLE `Producto_Fotos`
  ADD CONSTRAINT `fk_foto_variante` FOREIGN KEY (`ID_Variante`) REFERENCES `Producto_Variantes` (`ID_Variante`) ON DELETE CASCADE;

ALTER TABLE `Producto_Variantes`
  ADD CONSTRAINT `fk_variante_producto` FOREIGN KEY (`ID_Producto`) REFERENCES `Productos` (`ID_Producto`) ON DELETE CASCADE;

ALTER TABLE `Producto_Variante_Sucursales`
  ADD CONSTRAINT `fk_pvs_variante` FOREIGN KEY (`ID_Variante`) REFERENCES `Producto_Variantes` (`ID_Variante`) ON DELETE CASCADE;

ALTER TABLE `Ventas`
  ADD CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `Clientes` (`ID_Cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_2` FOREIGN KEY (`ID_Personal`) REFERENCES `Personal` (`ID_Personal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_3` FOREIGN KEY (`ID_Medio`) REFERENCES `Medio_Pago` (`ID_Medio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_4` FOREIGN KEY (`ID_Destino`) REFERENCES `Venta_T` (`ID_Destino`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_5` FOREIGN KEY (`Caja`) REFERENCES `Personal` (`ID_Personal`) ON UPDATE CASCADE;

ALTER TABLE `Venta_Detalle`
  ADD CONSTRAINT `Venta_Detalle_ibfk_2` FOREIGN KEY (`ID_Venta`) REFERENCES `Ventas` (`ID_Venta`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
