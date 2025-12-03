-- DATA EXPORT: SE_Municipio

USE `SE_Municipio`;

DELETE FROM `API_Comisarias`;
INSERT INTO `API_Comisarias` (`ID_Comisaria`,`Nombre`) VALUES ('1','Santa Elena');
INSERT INTO `API_Comisarias` (`ID_Comisaria`,`Nombre`) VALUES ('2','San Simon');

DELETE FROM `Administraciones`;
INSERT INTO `Administraciones` (`ID_Administracion`,`Nombre`,`Partido`,`Alcalde`,`Suplente`,`Secretario`,`Direccion`,`RFC`,`CP`,`FotoAlcalde`,`Logo`,`Portada`,`Licencia`,`Prefijo`,`PreUser`,`Web`,`Tel`,`Color`,`ColorDark`,`Fecha_Admin`,`Fecha_Inicio`,`Fecha_Termino`,`Concluido`) VALUES ('2','MUNICIPIO DE SANTA ELENA','PAN','Galdino Poot Moreno','0','','','','','','','','0','','','https://santaelena.gob.mx','','#078ed6','#046091','2021-2024','2021-09-01','2024-09-01','1');
INSERT INTO `Administraciones` (`ID_Administracion`,`Nombre`,`Partido`,`Alcalde`,`Suplente`,`Secretario`,`Direccion`,`RFC`,`CP`,`FotoAlcalde`,`Logo`,`Portada`,`Licencia`,`Prefijo`,`PreUser`,`Web`,`Tel`,`Color`,`ColorDark`,`Fecha_Admin`,`Fecha_Inicio`,`Fecha_Termino`,`Concluido`) VALUES ('3','MUNICIPIO DE SANTA ELENA','PAN','Galdino Poot Moreno','Jose Tec Koyoc','Luis Antonio Kauil Cetina','PALACIO MUNICIPAL COL. CENTRO','MSE850101IT1','97890','','','','0','Santa Elena','SE','https://santaelena.gob.mx','','','','2024-2027','2024-09-01','','0');

DELETE FROM `Api_Boleano`;
INSERT INTO `Api_Boleano` (`ID_Boleano`,`Nombre`) VALUES ('1','NO');
INSERT INTO `Api_Boleano` (`ID_Boleano`,`Nombre`) VALUES ('2','SI');

DELETE FROM `Api_Colonias`;
INSERT INTO `Api_Colonias` (`ID_Colonia`,`Nombre`) VALUES ('1','San Juan');
INSERT INTO `Api_Colonias` (`ID_Colonia`,`Nombre`) VALUES ('2','Centro');
INSERT INTO `Api_Colonias` (`ID_Colonia`,`Nombre`) VALUES ('3','Santa Barbara');

DELETE FROM `Api_Estatus`;
INSERT INTO `Api_Estatus` (`ID_Estatus`,`Nombre`) VALUES ('1','Pendiente');
INSERT INTO `Api_Estatus` (`ID_Estatus`,`Nombre`) VALUES ('2','Proceso');
INSERT INTO `Api_Estatus` (`ID_Estatus`,`Nombre`) VALUES ('3','Finalizado');
INSERT INTO `Api_Estatus` (`ID_Estatus`,`Nombre`) VALUES ('4','Aceptado');
INSERT INTO `Api_Estatus` (`ID_Estatus`,`Nombre`) VALUES ('5','Cancelado');
INSERT INTO `Api_Estatus` (`ID_Estatus`,`Nombre`) VALUES ('6','Pospuesto');

DELETE FROM `Api_Pago`;
INSERT INTO `Api_Pago` (`ID_Tipo_Pago`,`Nombre`) VALUES ('1','Efectivo');
INSERT INTO `Api_Pago` (`ID_Tipo_Pago`,`Nombre`) VALUES ('3','Tarjeta/SPEI');
INSERT INTO `Api_Pago` (`ID_Tipo_Pago`,`Nombre`) VALUES ('5','Otro');

DELETE FROM `Ciudadanos`;
INSERT INTO `Ciudadanos` (`ID_Ciudadano`,`Nombres`,`ApellidoP`,`ApellidoM`,`Direccion`,`NCasa`,`ID_Colonia`,`Latitud`,`Longitud`,`Telefono`,`Correo`,`Foto`,`FechaRegistro`,`FechaNacimiento`,`ClaveElector`,`RFC`,`Curp`,`Foraneo`,`ID_Sexo`,`ID_Facebook`,`ID_Firebase`,`Importado`) VALUES ('1','Mariel Eleazar','Santos','Paredes','C43 x 24A 26','203-Q','2','0.0','0.0','5660436605','m.santos@blitzc0de.com','','2022-12-09 06:20:18','1990-03-28','SAPM900328H','SAPM900328CG9','SAPM900328HYNNRR01','2','1','','','');
INSERT INTO `Ciudadanos` (`ID_Ciudadano`,`Nombres`,`ApellidoP`,`ApellidoM`,`Direccion`,`NCasa`,`ID_Colonia`,`Latitud`,`Longitud`,`Telefono`,`Correo`,`Foto`,`FechaRegistro`,`FechaNacimiento`,`ClaveElector`,`RFC`,`Curp`,`Foraneo`,`ID_Sexo`,`ID_Facebook`,`ID_Firebase`,`Importado`) VALUES ('2','Miguel Misael','Escamilla','Valle','C19 x 22 y 24','SN','2','20.329502639085977','-89.64492436834794','9971298353','','','2025-01-21 01:59:56','','ESVM890129','','ESVM890129','2','1','','','');
INSERT INTO `Ciudadanos` (`ID_Ciudadano`,`Nombres`,`ApellidoP`,`ApellidoM`,`Direccion`,`NCasa`,`ID_Colonia`,`Latitud`,`Longitud`,`Telefono`,`Correo`,`Foto`,`FechaRegistro`,`FechaNacimiento`,`ClaveElector`,`RFC`,`Curp`,`Foraneo`,`ID_Sexo`,`ID_Facebook`,`ID_Firebase`,`Importado`) VALUES ('3','Maritza','Escamilla','Valle','C29 x 16 y 18','','1','20.395070971674173','-89.52605478453532','9971164526','','','2025-01-21 03:26:48','','ESVM871218MY','','ESVM871218MY','2','2','','','');
INSERT INTO `Ciudadanos` (`ID_Ciudadano`,`Nombres`,`ApellidoP`,`ApellidoM`,`Direccion`,`NCasa`,`ID_Colonia`,`Latitud`,`Longitud`,`Telefono`,`Correo`,`Foto`,`FechaRegistro`,`FechaNacimiento`,`ClaveElector`,`RFC`,`Curp`,`Foraneo`,`ID_Sexo`,`ID_Facebook`,`ID_Firebase`,`Importado`) VALUES ('4','Jose Asuncion','Tec','Koyoc','C19 x 18 y 16','','2','20.328762044827535','-89.6414340286244','9971054812','','','2025-01-21 03:31:31','','TEKJ850815HY','','TEKJ850815HY','1','1','','','');
INSERT INTO `Ciudadanos` (`ID_Ciudadano`,`Nombres`,`ApellidoP`,`ApellidoM`,`Direccion`,`NCasa`,`ID_Colonia`,`Latitud`,`Longitud`,`Telefono`,`Correo`,`Foto`,`FechaRegistro`,`FechaNacimiento`,`ClaveElector`,`RFC`,`Curp`,`Foraneo`,`ID_Sexo`,`ID_Facebook`,`ID_Firebase`,`Importado`) VALUES ('5','Pamela','Puch','Cohuo','C25 x 22 y 24','','2','20.325965176399766','-89.64618690299883','9971076298','','','2025-01-21 03:35:45','','PUCP021122MY','','PUCP021122MY','1','2','','','');
INSERT INTO `Ciudadanos` (`ID_Ciudadano`,`Nombres`,`ApellidoP`,`ApellidoM`,`Direccion`,`NCasa`,`ID_Colonia`,`Latitud`,`Longitud`,`Telefono`,`Correo`,`Foto`,`FechaRegistro`,`FechaNacimiento`,`ClaveElector`,`RFC`,`Curp`,`Foraneo`,`ID_Sexo`,`ID_Facebook`,`ID_Firebase`,`Importado`) VALUES ('6','Carlos Guillermo','Chulim','Jimenez','','','2','','','9971042132','','','2025-07-03 12:08:21','','CHJC980507XX','','CHJC980507XX','2','1','','','');
INSERT INTO `Ciudadanos` (`ID_Ciudadano`,`Nombres`,`ApellidoP`,`ApellidoM`,`Direccion`,`NCasa`,`ID_Colonia`,`Latitud`,`Longitud`,`Telefono`,`Correo`,`Foto`,`FechaRegistro`,`FechaNacimiento`,`ClaveElector`,`RFC`,`Curp`,`Foraneo`,`ID_Sexo`,`ID_Facebook`,`ID_Firebase`,`Importado`) VALUES ('7','Israel','Huchim','','23 x ','','2','','','9971453741','','','2025-07-04 10:12:40','','HXIIXXXX','','HXIIXXXX','2','1','','','');

DELETE FROM `Ciudadanos_Card`;
INSERT INTO `Ciudadanos_Card` (`ID_Card`,`Numero`,`Mes`,`Ano`,`CVV`,`Tipo`,`ID_Ciudadano`,`Direccion`) VALUES ('2','5064510000300020','12','23','874','','1','');
INSERT INTO `Ciudadanos_Card` (`ID_Card`,`Numero`,`Mes`,`Ano`,`CVV`,`Tipo`,`ID_Ciudadano`,`Direccion`) VALUES ('3','1234567890123456','22','99','543','','151','');

DELETE FROM `Colaboradores`;
INSERT INTO `Colaboradores` (`ID_Colaborador`,`ID_Ciudadano`,`ID_Departamento`,`ID_Puesto`,`Usuario`,`Pass`,`PsD`,`FechaRegistro`,`Acceso`,`Baja`,`FechaBaja`,`Comentario`,`Escolaridad`,`Cedula`,`Correo`,`Foto`,`FB`,`TW`,`INST`,`Sueldo`,`ID_Administracion`) VALUES ('1','1','4','1','mariel.santos','gDYQkb4xnY1lXDka2QZhQA==','12','2024-09-01','2','1','','555','','','','','','','','1200','3');
INSERT INTO `Colaboradores` (`ID_Colaborador`,`ID_Ciudadano`,`ID_Departamento`,`ID_Puesto`,`Usuario`,`Pass`,`PsD`,`FechaRegistro`,`Acceso`,`Baja`,`FechaBaja`,`Comentario`,`Escolaridad`,`Cedula`,`Correo`,`Foto`,`FB`,`TW`,`INST`,`Sueldo`,`ID_Administracion`) VALUES ('5','1','1','1','system','gDYQkb4xnY1lXDka2QZhQA==','12','2024-09-01','2','1','','555','','','','','','','','1200','3');
INSERT INTO `Colaboradores` (`ID_Colaborador`,`ID_Ciudadano`,`ID_Departamento`,`ID_Puesto`,`Usuario`,`Pass`,`PsD`,`FechaRegistro`,`Acceso`,`Baja`,`FechaBaja`,`Comentario`,`Escolaridad`,`Cedula`,`Correo`,`Foto`,`FB`,`TW`,`INST`,`Sueldo`,`ID_Administracion`) VALUES ('9','2','4','95','miguel.escamilla','Yeq8c3lh82kwYwNXaOb7Nw==','8xIT','2025-07-04','2','1','','','Lic','','','','','','','0','3');
INSERT INTO `Colaboradores` (`ID_Colaborador`,`ID_Ciudadano`,`ID_Departamento`,`ID_Puesto`,`Usuario`,`Pass`,`PsD`,`FechaRegistro`,`Acceso`,`Baja`,`FechaBaja`,`Comentario`,`Escolaridad`,`Cedula`,`Correo`,`Foto`,`FB`,`TW`,`INST`,`Sueldo`,`ID_Administracion`) VALUES ('10','7','4','1','israel.huchim','zb7HuIoxEXtsTEiCcinyFw==','1uED','2025-07-04','2','1','','','Lic','','','','','','','0','3');
INSERT INTO `Colaboradores` (`ID_Colaborador`,`ID_Ciudadano`,`ID_Departamento`,`ID_Puesto`,`Usuario`,`Pass`,`PsD`,`FechaRegistro`,`Acceso`,`Baja`,`FechaBaja`,`Comentario`,`Escolaridad`,`Cedula`,`Correo`,`Foto`,`FB`,`TW`,`INST`,`Sueldo`,`ID_Administracion`) VALUES ('11','6','4','96','carlos.chulim','lMPUc0vXNl+kZDdTBhsHAQ==','UpRK','2025-07-04','2','1','','','Lic','','','','','','','0','3');
INSERT INTO `Colaboradores` (`ID_Colaborador`,`ID_Ciudadano`,`ID_Departamento`,`ID_Puesto`,`Usuario`,`Pass`,`PsD`,`FechaRegistro`,`Acceso`,`Baja`,`FechaBaja`,`Comentario`,`Escolaridad`,`Cedula`,`Correo`,`Foto`,`FB`,`TW`,`INST`,`Sueldo`,`ID_Administracion`) VALUES ('12','3','4','1','maritza.escamilla','DlFYXARdwY2goPpTfWcC+A==','EU2b','2025-08-19','2','1','','','Lic','','','','','','','0','3');

DELETE FROM `Departamentos`;
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('1','Sistemas','SYS','2','','','Descripción Sistemas','Descripción Sistemas','ING. Mariel Eleazar Santos Paredes','app-support@blitzc0de.com','','','','','0');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('2','Tesoreria','','2','','','Como Dirección de Finanzas y Tesorería Municipal somos la instancia inmediata de las oficinas fiscales del Municipio y responsables de los valores y sus cuidados.

Nuestra Misión es: Administrar y fortalecer las finanzas municipales para satisfacer las necesidades de nuestra Mérida, con eficiencia, honestidad y transparencia. 
Nuestra Visión es: Ser una dirección innovadora e incluyente que permita ser un referente nacional e internacional por el manejo eficiente de las finanzas públicas municipales, así como por el establecimiento de las mejores prácticas en materia de transparencia y rendición de cuentas. ','Gestionar Ingresos','Margarita Kauil Moreno','tesoreria@santaelena.gob.mx','Teso202*','Facebook.com','instagram.com','twitter.com','0');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('3','Protección Civil','','1','https://igrip.ticul.gob.mx/logos/8protc.png','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/proteccion-civil-1.jpg','Prevé la coordinación
y concertación de los sectores público, privado
y social en el marco del Sistema Nacional de
Protección Civil, con el fin de crear un conjunto
de disposiciones, planes, programas, estrategias,
mecanismos y recursos para que de manera
corresponsable; privilegiando la Gestión Integral
de Riesgos y la Continuidad de Operaciones, se apliquen las medidas y acciones que sean necesarias para salvaguardar la vida, integridad y salud de la población, así como sus bienes; la infraestructura, la planta productiva y el medio ambiente.','','Luis Sosa Medina','proteccioncivil@ticul.gob.mx','Cilvil202*','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('4','Catastro','CAT','2','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/3ctastro.png','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/catastro.png','El catastro, en términos generales, es el censo analítico de la propiedad inmobiliaria, que tiene el propósito de ubicar, describir y registrar las características físicas de cada bien inmueble con el fin de detectar sus particularidades intrínsecas que lo definen tanto material como especialmente.
La administración pública del catastro, tiene por objeto detectar las características de los bienes inmuebles ubicados en el territorio del municipio, conocer quiénes son los propietarios de dichos bienes y registrar su situación jurídica-económica para fines tanto legales como impositivos.','','LIC. Maritza Escamilla Valle','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('5','Ecología','','1','','','','','','','','','','','0');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('7','Presidencia','','2','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/perfil-11.png','','Presidencia','','ZIRA NATALLY GONZALEZ SANTOS','','','','','','0');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('8','Cabildo','','2','','','','','','','','','','','0');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('9','Obras Públicas','','1','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/4obras.png','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/obraslo.jpeg','edificaciones, mobiliario, equipamiento e infraestructuras que, con motivo de hacer un uso común por parte de los ciudadanos, construye y promueve un gobierno en un territorio. Este tipo de obras se financian con fondos públicos, así como posibles donantes privados, con motivo de uso público y general. 
La obra pública es presupuestada y promovida por el gobierno de un territorio. Sin embargo, en diversos territorios, los gobiernos no poseen de empresas constructoras para ejecutar dicha obra. Para ello, este requiere de una empresa privada que ejecute la obra, siendo contratada por el gobierno para la realización de la obra.','','Gilmer Xicum Gonzalez','obraspublicas@ticul.gob.mx','Obras202*','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('10','Alumbrado Público','','1','https://igrip.ticul.gob.mx/Dept/Presidencia/lib/Web/Depts/9alumbra.png','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/al.jpg','La iluminación en vialidades y espacios públicos es una medida indispensable de seguridad, que se utiliza tanto para prevenir accidentes como para impedir actos delictivos. En ocasiones, el alumbrado público también es empleado con fines de ornamento; por ejemplo, para resaltar edificios emblemáticos o para adornar plazas y parques durante la noche. Las señalizaciones viales luminosas, tales como tableros y semáforos, a pesar de cumplir una función de seguridad y formar parte de los espacios públicos, no se consideran sistemas de alumbrado público.','','Gerardo Rodriguez Perez','alumbrado@ticul.gob.mx','Alpb202*','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('11','Agua Potable','','1','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/1agua.png','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/ag.jpg','El proceso del suministro de agua potable comprende, de manera general, la captación, conducción, tratamiento, almacenamiento de agua tratada y distribución del recurso hídrico. Los sistemas convencionales de abastecimiento de agua utilizan para su captación aguas superficiales o aguas subterráneas. Las superficiales se refieren a fuentes visibles, como son ríos, arroyos, lagos y lagunas, mientras las subterráneas, a fuentes que se encuentran confinadas en el subsuelo, como pozos y galerías filtrantes.

La segunda etapa consiste en la conducción del agua desde el punto de captación hasta la planta de tratamiento o el sitio de consumo; puede ser un canal abierto o red de tuberías. La siguiente etapa se refiere a la necesidad de almacenar agua en alguna reserva cuando la fuente no presenta un caudal suficiente durante el año para satisfac','','Eduardo Maldonado Vega','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('13','DIF','','2','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/6Dif.png','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/ddif.jpg','El Sistema Nacional DIF es el organismo público descentralizado encargado de coordinar el Sistema Nacional de Asistencia Social Pública y Privada; promotor de la protección integral de los derechos de las niñas, niños y adolescentes, bajo el imperativo constitucional del interés superior de la niñez, así como del desarrollo integral del individuo, de la familia y de la comunidad, principalmente de quienes por su condición física, mental o social enfrentan una situación de vulnerabilidad, hasta lograr su incorporación a una vida plena y productiva.','','Teresa Canche Chable','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('14','Comunicación Social','','2','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/2comuni.png','https://ticul.blitzc0de.com/Presidencia/lib/Web/Depts/cs.jpg','La Unidad de Comunicación Social ejecutará estrategias de comunicación pública y fortalecimiento de la imagen institucional, y mantendrá contacto con los medios de comunicación para la realización de ruedas de prensa y comunicados oficiales.

La Unidad tendrá como actividad principal difundir a través de los distintos medios de comunicación, las obras, acciones, planes, programas y proyectos de la Administración Pública Municipal, así como fomentar y mantener las relaciones con las instituciones, asociaciones, entidades públicas y privadas, instituciones civiles, militares y los actores sociales y políticos del Municipio.','','Carlos Santamaria Martin','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('15','Cultura','','2','','','','','','cultura@ticul.gob.mx','CulT*202','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('16','Secretaria','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('17','Equidad','','','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('18','Salud','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('19','Oficialia','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('20','Gobernación','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('21','Turismo','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('22','Transporte','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('23','Desarrollo Social','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('24','Desarrollo Urbano','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('25','Yotholin','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('26','Pustunich','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('27','Calles','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('28','Aseo Urbano','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('29','Cementerio','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('30','Rastro','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('31','Mercado','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('32','Seguridad','','2','','','','','','','','','','','1');
INSERT INTO `Departamentos` (`ID_Departamento`,`Nombre`,`Prefijo`,`Interno`,`Logo1`,`Logo2`,`Descripcion`,`Funciones`,`Servidor`,`Mail`,`Pass_Mail`,`Facebook`,`Insta`,`Twitter`,`Visible`) VALUES ('33','Otros','','2','','','','','','','','','','','1');

DELETE FROM `Puestos`;
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('1','Admin');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('2','Presidente');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('3','Cobrador');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('4','Secretario(a)');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('5','Chofer B');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('6','Regidor');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('7','Sindico');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('8','Secretario(a) Municipal');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('9','Secretario(a) A');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('10','Secretario(a) B');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('11','Secretario(a) C');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('12','Chofer A');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('13','Coordinador');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('14','Diligenciero A');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('15','Diligenciero B');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('16','Diligenciero C');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('17','Auxiliar A');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('18','Auxiliar B');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('19','Auxiliar C');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('20','Vigilante A');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('21','Vigilante B');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('22','Vigilante C');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('23','Limpieza');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('24','Atención');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('25','Director');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('26','Tesorero');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('27','Bacheo A');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('28','Bacheo B');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('29','Jefe de Albañil');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('30','Recepción');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('31','Psicologo');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('32','Talleres');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('33','Mecanico');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('34','Asistente');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('35','Promotor');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('36','Nutricion');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('37','Cocineros');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('38','Terapeuta');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('39','Subdirector');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('40','Enfermeria');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('41','Doctor');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('42','Brigada A');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('43','Brigada B');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('44','Inapan');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('45','Radiologo');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('46','Trabajadora Social');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('47','Autismo');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('48','Controlador');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('49','Oficialia');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('50','Capacitador');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('51','Asuntos Religiosos');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('52','Archivos');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('53','Comisionado');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('54','Juridico');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('55','Juez Calificador');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('56','Juez de Paz');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('57','Enlace');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('58','Fotografo');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('59','Diseñador');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('60','Jefe de Prensa');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('61','Mantenimiento');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('63','Lengua Maya');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('64','Eventos');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('65','Entrenador');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('66','Logistica');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('67','Fontanero');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('68','Electrico');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('69','Sepulturero');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('70','Recolector');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('71','Oficial');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('72','Sub-Oficial');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('73','Comandante A');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('74','Comandante B');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('75','Policia A');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('76','Policia B');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('77','Policia C');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('78','Capitan');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('79','Paramedico');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('80','Policia Tercero');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('81','Chapeo');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('82','Desbrozador');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('83','Barrido de Parques');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('84','Podador');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('85','Veterinario');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('86','Abatizador A');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('87','Abatizador B');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('88','Abatizador C');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('89','Filtro');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('90','Jefe de Cuadrilla');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('91','Baños');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('92','Velador');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('93','Presidente Interino');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('94','Presidente Suplente');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('95','Perito');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('96','Cedulista');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('97','Otros');
INSERT INTO `Puestos` (`ID_Puesto`,`Nombre`) VALUES ('98','No listado');

DELETE FROM `Sexo`;
INSERT INTO `Sexo` (`ID_Sexo`,`Nombre`) VALUES ('1','Hombre');
INSERT INTO `Sexo` (`ID_Sexo`,`Nombre`) VALUES ('2','Mujer');
INSERT INTO `Sexo` (`ID_Sexo`,`Nombre`) VALUES ('3','Indefinido');
INSERT INTO `Sexo` (`ID_Sexo`,`Nombre`) VALUES ('4','Otro');

