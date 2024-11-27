use finca_agricola_LL;

insert into tipo_producto (nombre) values ('fruta'),('verdura');

INSERT INTO producto (nombre, cantidad_kg, id_tipo) VALUES
('Manzana', 5, 1), 
('Banana', 7, 1), 
('Naranja', 3, 1),
('Pera', 4, 1),   
('Fresa', 6, 1),
('Zanahoria', 8, 2),
('Lechuga', 3, 2),
('Tomate', 9, 2),
('Pepino', 2, 2),
('Brócoli', 5, 2);

INSERT INTO presentacion_producto (id_producto, presentacion, cantidad_kg, precio) VALUES
(1, 'Bulto', 50, 75000),
(1, 'Unidad', 1, 1500),
(2, 'Bulto', 50, 60000),
(2, 'Unidad', 1, 1200),
(3, 'Bulto', 50, 45000),
(3, 'Unidad', 1, 900),
(4, 'Bulto', 50, 55000),
(4, 'Unidad', 1, 1100),
(5, 'Bulto', 50, 40000),
(5, 'Unidad', 1, 800),
(6, 'Bulto', 50, 50000),
(6, 'Unidad', 1, 1000),
(7, 'Bulto', 50, 35000),
(7, 'Unidad', 1, 700),
(8, 'Bulto', 50, 45000),
(8, 'Unidad', 1, 900),
(9, 'Bulto', 50, 42500),
(9, 'Unidad', 1, 850),
(10, 'Bulto', 50, 65000),
(10, 'Unidad', 1, 1300);

-- Inserts para la tabla login
INSERT INTO login (usuario, contraseña, rol) VALUES
('juan.perez', 'contraseña123', 'Proveedor'),
('maria.gomez', 'segura2023', 'Proveedor'),
('pedro.lopez', 'clave321', 'Proveedor'),
('ana.moreno', 'abc12345', 'Proveedor'),
('carlos.ruiz', 'pass123', 'Proveedor'),
('sofia.diaz', 'secure987', 'Proveedor'),
('julian.sanchez', 'clave567', 'Proveedor'),
('luisa.ortega', 'pass789', 'Proveedor'),
('fernando.rios', 'secure456', 'Proveedor'),
('paula.rodriguez', 'pass654', 'Proveedor'),
('jorge.velasquez', 'clave234', 'Proveedor'),
('andrea.martinez', 'secure890', 'Proveedor'),
('felipe.santos', 'abc45678', 'Proveedor'),
('camila.gutierrez', 'clave876', 'Proveedor'),
('daniel.ramirez', 'secure012', 'Proveedor'),
('laura.castro', 'clave001', 'Proveedor'),
('oscar.alvarez', 'pass222', 'Proveedor'),
('natalia.meza', 'secure333', 'Proveedor'),
('pablo.garcia', 'clave555', 'Proveedor'),
('monica.silva', 'pass999', 'Proveedor');
INSERT INTO login (usuario, contraseña, rol) VALUES
('JuanCarlos100001', 'password100001', 'empleado'),
('MariaFernanda100002', 'password100002', 'empleado'),
('Carlos100003', 'password100003', 'empleado'),
('LuisaAndrea100004', 'password100004', 'empleado'),
('AndresFelipe100005', 'password100005', 'empleado'),
('CamilaSofia100006', 'password100006', 'empleado'),
('JorgeAlberto100007', 'password100007', 'empleado'),
('PaulaXimena100008', 'password100008', 'empleado'),
('FelipeAndres100009', 'password100009', 'empleado'),
('DianaCarolina100010', 'password100010', 'empleado'),
('OscarIvan100011', 'password100011', 'empleado'),
('Santiago100012', 'password100012', 'empleado'),
('NataliaMarcela100013', 'password100013', 'empleado'),
('Fernando100014', 'password100014', 'empleado'),
('AlejandraTatiana100015', 'password100015', 'empleado'),
('Laura100016', 'password100016', 'empleado'),
('LuisEnrique100017', 'password100017', 'empleado'),
('GloriaPatricia100018', 'password100018', 'empleado'),
('PabloEmilio100019', 'password100019', 'empleado'),
('SofiaValentina100020', 'password100020', 'empleado'),
('AndreaPatricia100021', 'password100021', 'empleado'),
('DavidEsteban100022', 'password100022', 'empleado'),
('SebastianJulian100023', 'password100023', 'empleado'),
('CarolinaMarcela100024', 'password100024', 'empleado'),
('Gabriel100025', 'password100025', 'empleado'),
('MonicaSusana100026', 'password100026', 'empleado'),
('JulianMateo100027', 'password100027', 'empleado'),
('Laura100028', 'password100028', 'empleado'),
('AngelaLuz100029', 'password100029', 'empleado'),
('RodrigoEnrique100030', 'password100030', 'empleado'),
('IsabelaSofia100031', 'password100031', 'empleado'),
('RicardoFernando100032', 'password100032', 'empleado'),
('Cecilia100033', 'password100033', 'empleado'),
('MauricioAntonio100034', 'password100034', 'empleado'),
('JulianaCristina100035', 'password100035', 'empleado'),
('FabioHumberto100036', 'password100036', 'empleado'),
('Camilo100037', 'password100037', 'empleado'),
('SandraMilena100038', 'password100038', 'empleado'),
('ManuelJose100039', 'password100039', 'empleado'),
('BeatrizLina100040', 'password100040', 'empleado'),
('Leonardo100041', 'password100041', 'empleado'),
('DianaEsther100042', 'password100042', 'empleado'),
('AlexanderEdwin100043', 'password100043', 'empleado'),
('LorenaViviana100044', 'password100044', 'empleado'),
('RafaelAlfonso100045', 'password100045', 'empleado'),
('Esteban100046', 'password100046', 'empleado'),
('NataliaMariana100047', 'password100047', 'empleado'),
('FelipeIvan100048', 'password100048', 'empleado'),
('LilianaMaribel100049', 'password100049', 'empleado'),
('TomasGuillermo100050', 'password100050', 'empleado');
INSERT INTO login (id, usuario, contraseña, rol) VALUES
(71, 'juan.perez', 'password1', 'cliente'),
(72, 'maria.rodriguez', 'password2', 'cliente'),
(73, 'luis.martinez', 'password3', 'cliente'),
(74, 'ana.hernandez', 'password4', 'cliente'),
(75, 'pedro.garcia', 'password5', 'cliente'),
(76, 'laura.torres', 'password6', 'cliente'),
(77, 'carlos.vargas', 'password7', 'cliente'),
(78, 'lucia.rios', 'password8', 'cliente'),
(79, 'fernando.diaz', 'password9', 'cliente'),
(80, 'paula.jimenez', 'password10', 'cliente'),
(81, 'jorge.mendoza', 'password11', 'cliente'),
(82, 'carolina.ortiz', 'password12', 'cliente'),
(83, 'ricardo.guzman', 'password13', 'cliente'),
(84, 'andrea.romero', 'password14', 'cliente'),
(85, 'diego.navarro', 'password15', 'cliente'),
(86, 'valentina.rojas', 'password16', 'cliente'),
(87, 'santiago.moreno', 'password17', 'cliente'),
(88, 'diana.cortes', 'password18', 'cliente'),
(89, 'miguel.reyes', 'password19', 'cliente'),
(90, 'sofia.luna', 'password20', 'cliente'),
(91, 'camilo.barrios', 'password21', 'cliente'),
(92, 'natalia.zapata', 'password22', 'cliente'),
(93, 'samuel.pacheco', 'password23', 'cliente'),
(94, 'juliana.pena', 'password24', 'cliente'),
(95, 'manuel.ruiz', 'password25', 'cliente'),
(96, 'sara.alvarez', 'password26', 'cliente'),
(97, 'esteban.vega', 'password27', 'cliente'),
(98, 'eliana.lopez', 'password28', 'cliente'),
(99, 'angel.santos', 'password29', 'cliente'),
(100, 'isabella.castano', 'password30', 'cliente'),
(101, 'tomas.marquez', 'password31', 'cliente'),
(102, 'gabriela.herrera', 'password32', 'cliente'),
(103, 'cristian.galeano', 'password33', 'cliente'),
(104, 'daniela.carrillo', 'password34', 'cliente'),
(105, 'andres.espinosa', 'password35', 'cliente'),
(106, 'mariana.salazar', 'password36', 'cliente'),
(107, 'emilio.cabrera', 'password37', 'cliente'),
(108, 'luisa.bermudez', 'password38', 'cliente'),
(109, 'ivan.trujillo', 'password39', 'cliente'),
(110, 'veronica.chaparro', 'password40', 'cliente'),
(111, 'pablo.osorio', 'password41', 'cliente'),
(112, 'carmen.roldan', 'password42', 'cliente'),
(113, 'felipe.munoz', 'password43', 'cliente'),
(114, 'marcela.delgado', 'password44', 'cliente'),
(115, 'oscar.vallejo', 'password45', 'cliente'),
(116, 'silvia.molina', 'password46', 'cliente'),
(117, 'javier.lemos', 'password47', 'cliente'),
(118, 'cristina.castillo', 'password48', 'cliente'),
(119, 'rafael.serrano', 'password49', 'cliente'),
(120, 'rosa.nieto', 'password50', 'cliente');


INSERT INTO cargo (nombre, dias_trabajo, sueldo_mensual) VALUES 
('Administrador de finca', 26, 2000000),
('Supervisor de cultivo', 24, 1500000),
('Jornalero', 22, 1000000),
('Encargado de maquinaria', 24, 1300000),
('Responsable de cosecha', 26, 1400000),
('Control de calidad', 24, 1600000),
('Encargado de bodega', 22, 1200000),
('Vigilante de finca', 26, 900000),
('Asistente administrativo', 22, 1300000);

INSERT INTO empleado (nombre1, nombre2, apellido1, apellido2, cedula, id_cargo, id_login) VALUES
('Juan', 'Carlos', 'Martínez', 'Gómez', 100001, 1, 21),
('María', 'Fernanda', 'López', 'Rodríguez', 100002, 2, 22),
('Carlos', NULL, 'Pérez', 'Hernández', 100003, 3, 23),
('Luisa', 'Andrea', 'González', 'Morales', 100004, 4, 24),
('Andrés', 'Felipe', 'Ramírez', 'Torres', 100005, 5, 25),
('Camila', 'Sofía', 'Díaz', 'Jiménez', 100006, 6, 26),
('Jorge', 'Alberto', 'Ortiz', 'Cruz', 100007, 7, 27),
('Paula', 'Ximena', 'Rojas', 'Vargas', 100008, 8, 28),
('Felipe', 'Andrés', 'Castro', 'Muñoz', 100009, 9, 29),
('Diana', 'Carolina', 'Moreno', 'Ríos', 100010, 1, 30),
('Oscar', 'Iván', 'Cortés', 'Navarro', 100011, 2, 31),
('Santiago', NULL, 'Sánchez', 'Quintero', 100012, 3, 32),
('Natalia', 'Marcela', 'Guzmán', 'Mejía', 100013, 4, 33),
('Fernando', NULL, 'Navarro', 'García', 100014, 5, 34),
('Alejandra', 'Tatiana', 'Herrera', 'Chacón', 100015, 6, 35),
('Laura', NULL, 'Mendoza', 'Valencia', 100016, 7, 36),
('Luis', 'Enrique', 'Bermúdez', 'Ospina', 100017, 8, 37),
('Gloria', 'Patricia', 'Salazar', 'Zapata', 100018, 9, 38),
('Pablo', 'Emilio', 'Vargas', 'Castaño', 100019, 1, 39),
('Sofía', 'Valentina', 'Ruiz', 'Cardona', 100020, 2, 40),
('Andrea', 'Patricia', 'Velásquez', 'Gómez', 100021, 3, 41),
('David', 'Esteban', 'Lara', 'Montoya', 100022, 4, 42),
('Sebastián', 'Julián', 'Arango', 'Giraldo', 100023, 1, 43),
('Carolina', 'Marcela', 'Osorio', 'Mejía', 100024, 2, 44),
('Gabriel', NULL, 'Álvarez', 'Restrepo', 100025, 5, 45),
('Mónica', 'Susana', 'Valencia', 'Rendón', 100026, 6, 46),
('Julián', 'Mateo', 'Pineda', 'Toro', 100027, 7, 47),
('Laura', NULL, 'Cardona', 'Serna', 100028, 8, 48),
('Ángela', 'Luz', 'Rendón', 'Marín', 100029, 9, 49),
('Rodrigo', 'Enrique', 'Molina', 'Henao', 100030, 3, 50),
('Isabela', 'Sofía', 'Castaño', 'Hoyos', 100031, 4, 51),
('Ricardo', 'Fernando', 'Morales', 'Quintero', 100032, 1, 52),
('Cecilia', NULL, 'García', 'Villa', 100033, 2, 53),
('Mauricio', 'Antonio', 'Ángel', 'Duque', 100034, 5, 54),
('Juliana', 'Cristina', 'Cano', 'Ramírez', 100035, 6, 55),
('Fabio', 'Humberto', 'Trujillo', 'Ortega', 100036, 7, 56),
('Camilo', NULL, 'Montes', 'Vargas', 100037, 8, 57),
('Sandra', 'Milena', 'Zapata', 'Castañeda', 100038, 9, 58),
('Manuel', 'José', 'Pérez', 'Cardona', 100039, 3, 59),
('Beatriz', 'Lina', 'Ramírez', 'Gómez', 100040, 4, 60),
('Leonardo', NULL, 'Giraldo', 'Arbeláez', 100041, 1, 61),
('Diana', 'Esther', 'Hernández', 'Salazar', 100042, 2, 62),
('Alexander', 'Edwin', 'Toro', 'Villegas', 100043, 5, 63),
('Lorena', 'Viviana', 'Quintero', 'Muñoz', 100044, 6, 64),
('Rafael', 'Alfonso', 'Tamayo', 'Zapata', 100045, 7, 65),
('Esteban', NULL, 'Buitrago', 'Córdoba', 100046, 8, 66),
('Natalia', 'Mariana', 'Mendoza', 'Agudelo', 100047, 9, 67),
('Felipe', 'Iván', 'Jaramillo', 'López', 100048, 3, 68),
('Liliana', 'Maribel', 'Restrepo', 'Sierra', 100049, 4, 69),
('Tomás', 'Guillermo', 'Moreno', 'Gómez', 100050, 1, 70);



INSERT INTO salarios (id_empleado, dias_trabajados, pago_final, inicio_mes_pagado, fin_mes_pagado) VALUES
(1, 25, NULL, '2024-10-01', '2024-10-31'),
(2, 22, NULL, '2024-10-01', '2024-10-31'),
(3, 20, NULL, '2024-10-01', '2024-10-31'),
(4, 24, NULL, '2024-10-01', '2024-10-31'),
(5, 26, NULL, '2024-10-01', '2024-10-31'),
(6, 23, NULL, '2024-10-01', '2024-10-31'),
(7, 20, NULL, '2024-10-01', '2024-10-31'),
(8, 22, NULL, '2024-10-01', '2024-10-31'),
(9, 25, NULL, '2024-10-01', '2024-10-31'),
(10, 21, NULL, '2024-10-01', '2024-10-31'),
(11, 26, NULL, '2024-10-01', '2024-10-31'),
(12, 24, NULL, '2024-10-01', '2024-10-31'),
(13, 22, NULL, '2024-10-01', '2024-10-31'),
(14, 20, NULL, '2024-10-01', '2024-10-31'),
(15, 25, NULL, '2024-10-01', '2024-10-31'),
(16, 22, NULL, '2024-10-01', '2024-10-31'),
(17, 24, NULL, '2024-10-01', '2024-10-31'),
(18, 21, NULL, '2024-10-01', '2024-10-31'),
(19, 26, NULL, '2024-10-01', '2024-10-31'),
(20, 23, NULL, '2024-10-01', '2024-10-31');
INSERT INTO salarios (id_empleado, dias_trabajados, pago_final, inicio_mes_pagado, fin_mes_pagado) VALUES
(21, 20, NULL, '2024-10-01', '2024-10-31'),
(22, 24, NULL, '2024-10-01', '2024-10-31'),
(23, 26, NULL, '2024-10-01', '2024-10-31'),
(24, 21, NULL, '2024-10-01', '2024-10-31'),
(25, 25, NULL, '2024-10-01', '2024-10-31'),
(26, 22, NULL, '2024-10-01', '2024-10-31'),
(27, 23, NULL, '2024-10-01', '2024-10-31'),
(28, 20, NULL, '2024-10-01', '2024-10-31'),
(29, 24, NULL, '2024-10-01', '2024-10-31'),
(30, 26, NULL, '2024-10-01', '2024-10-31'),
(31, 22, NULL, '2024-10-01', '2024-10-31'),
(32, 25, NULL, '2024-10-01', '2024-10-31'),
(33, 20, NULL, '2024-10-01', '2024-10-31'),
(34, 24, NULL, '2024-10-01', '2024-10-31'),
(35, 26, NULL, '2024-10-01', '2024-10-31'),
(36, 21, NULL, '2024-10-01', '2024-10-31'),
(37, 23, NULL, '2024-10-01', '2024-10-31'),
(38, 24, NULL, '2024-10-01', '2024-10-31'),
(39, 22, NULL, '2024-10-01', '2024-10-31'),
(40, 25, NULL, '2024-10-01', '2024-10-31'),
(41, 20, NULL, '2024-10-01', '2024-10-31'),
(42, 26, NULL, '2024-10-01', '2024-10-31'),
(43, 23, NULL, '2024-10-01', '2024-10-31'),
(44, 24, NULL, '2024-10-01', '2024-10-31'),
(45, 22, NULL, '2024-10-01', '2024-10-31'),
(46, 25, NULL, '2024-10-01', '2024-10-31'),
(47, 26, NULL, '2024-10-01', '2024-10-31'),
(48, 21, NULL, '2024-10-01', '2024-10-31'),
(49, 20, NULL, '2024-10-01', '2024-10-31'),
(50, 24, NULL, '2024-10-01', '2024-10-31');

insert into metodo_pago (metodo) values ('efectivo'),('tarjeta'),('transferencia');

INSERT INTO cliente (nombre1, nombre2, apellido1, apellido2, cedula, id_login) VALUES
('Juan', 'Carlos', 'Pérez', 'Gómez', 1001001001, 71),
('María', 'Fernanda', 'Rodríguez', 'López', 1002002002, 72),
('Luis', 'Alberto', 'Martínez', 'Sánchez', 1003003003, 73),
('Ana', 'Lucía', 'Hernández', 'Ramírez', 1004004004, 74),
('Pedro', 'Javier', 'García', 'Morales', 1005005005, 75),
('Laura', 'Sofía', 'Torres', 'Ortiz', 1006006006, 76),
('Carlos', 'Andrés', 'Vargas', 'Mendoza', 1007007007, 77),
('Lucía', 'Gabriela', 'Ríos', 'Castro', 1008008008, 78),
('Fernando', 'José', 'Díaz', 'Guerrero', 1009009009, 79),
('Paula', 'Andrea', 'Jiménez', 'Navarro', 1010010010, 80),
('Jorge', 'Armando', 'Mendoza', 'Vega', 1011011011, 81),
('Carolina', 'Mariana', 'Ortiz', 'Campos', 1012012012, 82),
('Ricardo', 'Daniel', 'Guzmán', 'Flores', 1013013013, 83),
('Andrea', 'Paola', 'Romero', 'Silva', 1014014014, 84),
('Diego', 'Alejandro', 'Navarro', 'Espinoza', 1015015015, 85),
('Valentina', 'Isabel', 'Rojas', 'Barrera', 1016016016, 86),
('Santiago', 'Esteban', 'Moreno', 'Quintero', 1017017017, 87),
('Diana', 'Marcela', 'Cortés', 'Villalobos', 1018018018, 88),
('Miguel', 'Ángel', 'Reyes', 'Palacios', 1019019019, 89),
('Sofía', 'Alejandra', 'Luna', 'Rincón', 1020010020, 90),
('Camilo', 'Adrián', 'Barrios', 'Valencia', 1021011021, 91),
('Natalia', 'María', 'Zapata', 'Nieves', 1022012022, 92),
('Samuel', 'Iván', 'Pacheco', 'Bautista', 1023013023, 93),
('Juliana', 'Lorena', 'Peña', 'Chávez', 1024014024, 94),
('Manuel', 'Felipe', 'Ruiz', 'Mejía', 1025015025, 95),
('Sara', 'Elena', 'Álvarez', 'Villanueva', 1026016026, 96),
('Esteban', 'Mauricio', 'Vega', 'González', 1027017027, 97),
('Eliana', 'Carolina', 'López', 'Campos', 1028018028, 98),
('Ángel', 'Ricardo', 'Santos', 'Vallejo', 1029019029, 99),
('Isabella', 'Luciana', 'Castaño', 'Pineda', 1030010030, 100),
('Tomás', 'Sebastián', 'Márquez', 'Cáceres', 1031011031, 101),
('Gabriela', 'Luisa', 'Herrera', 'Hernández', 1032012032, 102),
('Cristian', 'David', 'Galeano', 'Ortiz', 1033013033, 103),
('Daniela', 'Florencia', 'Carrillo', 'Pérez', 1034014034, 104),
('Andrés', 'Camilo', 'Espinosa', 'Castellanos', 1035015035, 105),
('Mariana', 'Beatriz', 'Salazar', 'Martínez', 1036016036, 106),
('Emilio', 'Álvaro', 'Cabrera', 'Suárez', 1037017037, 107),
('Luisa', 'Cristina', 'Bermúdez', 'Patiño', 1038018038, 108),
('Iván', 'Eduardo', 'Trujillo', 'Montoya', 1039019039, 109),
('Verónica', 'Mónica', 'Chaparro', 'Zambrano', 1040010040, 110),
('Pablo', 'César', 'Osorio', 'Cárdenas', 1041011041, 111),
('Carmen', 'María', 'Roldán', 'Prado', 1042012042, 112),
('Felipe', 'Antonio', 'Muñoz', 'Guerrero', 1043013043, 113),
('Marcela', 'Patricia', 'Delgado', 'Naranjo', 1044014044, 114),
('Oscar', 'Rubén', 'Vallejo', 'Sandoval', 1045015045, 115),
('Silvia', 'Victoria', 'Molina', 'Arce', 1046016046, 116),
('Javier', 'Enrique', 'Lemos', 'Moreno', 1047017047, 117),
('Cristina', 'Liliana', 'Castillo', 'Camacho', 1048018048, 118),
('Rafael', 'Julián', 'Serrano', 'Beltrán', 1049019049, 119),
('Rosa', 'Mercedes', 'Nieto', 'Padilla', 1050010050, 120);



INSERT INTO venta (fecha_venta, id_cliente, precio_total, id_metodo_pago) VALUES
('2024-11-01', 1, NULL, 1),
('2024-11-02', 2, NULL, 2),
('2024-11-03', 3, NULL, 3),
('2024-11-04', 4, NULL, 1),
('2024-11-05', 5, NULL, 2),
('2024-11-06', 6, NULL, 3),
('2024-11-07', 7, NULL, 1),
('2024-11-08', 8, NULL, 2),
('2024-11-09', 9, NULL, 3),
('2024-11-10', 10, NULL, 1),
('2024-11-11', 11, NULL, 2),
('2024-11-12', 12, NULL, 3),
('2024-11-13', 13, NULL, 1),
('2024-11-14', 14, NULL, 2),
('2024-11-15', 15, NULL, 3),
('2024-11-16', 16, NULL, 1),
('2024-11-17', 17, NULL, 2),
('2024-11-18', 18, NULL, 3),
('2024-11-19', 19, NULL, 1),
('2024-11-20', 20, NULL, 2),
('2024-11-21', 21, NULL, 3),
('2024-11-22', 22, NULL, 1),
('2024-11-23', 23, NULL, 2),
('2024-11-24', 24, NULL, 3),
('2024-11-25', 25, NULL, 1),
('2024-11-26', 26, NULL, 2),
('2024-11-27', 27, NULL, 3),
('2024-11-28', 28, NULL, 1),
('2024-11-29', 29, NULL, 2),
('2024-11-30', 30, NULL, 3),
('2024-11-01', 31, NULL, 1),
('2024-11-02', 32, NULL, 2),
('2024-11-03', 33, NULL, 3),
('2024-11-04', 34, NULL, 1),
('2024-11-05', 35, NULL, 2),
('2024-11-06', 36, NULL, 3),
('2024-11-07', 37, NULL, 1),
('2024-11-08', 38, NULL, 2),
('2024-11-09', 39, NULL, 3),
('2024-11-10', 40, NULL, 1),
('2024-11-11', 41, NULL, 2),
('2024-11-12', 42, NULL, 3),
('2024-11-13', 43, NULL, 1),
('2024-11-14', 44, NULL, 2),
('2024-11-15', 45, NULL, 3),
('2024-11-16', 46, NULL, 1),
('2024-11-17', 47, NULL, 2),
('2024-11-18', 48, NULL, 3),
('2024-11-19', 49, NULL, 1),
('2024-11-20', 50, NULL, 2);

INSERT INTO venta_producto (id_venta, id_presentacion_producto, cantidad) VALUES
(1, 1, 5),
(2, 2, 3),
(3, 3, 7),
(4, 4, 2),
(5, 5, 10),
(6, 6, 1),
(7, 7, 4),
(8, 8, 8),
(9, 9, 6),
(10, 10, 12),
(11, 11, 3),
(12, 12, 9),
(13, 13, 2),
(14, 14, 7),
(15, 15, 5),
(16, 16, 4),
(17, 17, 6),
(18, 18, 3),
(19, 19, 8),
(20, 20, 9),
(21, 1, 2),
(22, 2, 7),
(23, 3, 5),
(24, 4, 1),
(25, 5, 10),
(26, 6, 3),
(27, 7, 6),
(28, 8, 4),
(29, 9, 9),
(30, 10, 11),
(31, 11, 7),
(32, 12, 2),
(33, 13, 8),
(34, 14, 3),
(35, 15, 6),
(36, 16, 5),
(37, 17, 10),
(38, 18, 9),
(39, 19, 12),
(40, 20, 4),
(41, 1, 7),
(42, 2, 8),
(43, 3, 5),
(44, 4, 3),
(45, 5, 2),
(46, 6, 1),
(47, 7, 4),
(48, 8, 6),
(49, 9, 8),
(50, 10, 7);
INSERT INTO venta_producto (id_venta, id_presentacion_producto, cantidad) VALUES
(1, 1, 5),
(1, 2, 3),
(2, 3, 7),
(2, 4, 2),
(3, 5, 10),
(3, 6, 1),
(4, 7, 4),
(4, 8, 8),
(5, 9, 6),
(5, 10, 12),
(6, 11, 3),
(6, 12, 9),
(7, 13, 2),
(7, 14, 7),
(8, 15, 5),
(8, 16, 4),
(9, 17, 6),
(9, 18, 3),
(10, 19, 8),
(10, 20, 9),
(11, 1, 2),
(11, 2, 7),
(12, 3, 5),
(12, 4, 1),
(13, 5, 10),
(13, 6, 3),
(14, 7, 6),
(14, 8, 4),
(15, 9, 9),
(15, 10, 11),
(16, 11, 7),
(16, 12, 2),
(17, 13, 8),
(17, 14, 3),
(18, 15, 6),
(18, 16, 5),
(19, 17, 10),
(19, 18, 9),
(20, 19, 12),
(20, 20, 4),
(21, 1, 7),
(21, 2, 8),
(22, 3, 5),
(22, 4, 3),
(23, 5, 2),
(23, 6, 1),
(24, 7, 4),
(24, 8, 6),
(25, 9, 8),
(25, 10, 7),
(26, 11, 4),
(26, 12, 6),
(27, 13, 3),
(27, 14, 8),
(28, 15, 5),
(28, 16, 7),
(29, 17, 2),
(29, 18, 9),
(30, 19, 10),
(30, 20, 11),
(31, 1, 6),
(31, 2, 8),
(32, 3, 4),
(32, 4, 7),
(33, 5, 3),
(33, 6, 5),
(34, 7, 2),
(34, 8, 9),
(35, 9, 8),
(35, 10, 12),
(36, 11, 5),
(36, 12, 6),
(37, 13, 4),
(37, 14, 3),
(38, 15, 7),
(38, 16, 8),
(39, 17, 9),
(39, 18, 10),
(40, 19, 2),
(40, 20, 5),
(41, 1, 4),
(41, 2, 3),
(42, 3, 7),
(42, 4, 6),
(43, 5, 8),
(43, 6, 9),
(44, 7, 2),
(44, 8, 5),
(45, 9, 11),
(45, 10, 6),
(46, 11, 3),
(46, 12, 7),
(47, 13, 8),
(47, 14, 4),
(48, 15, 5),
(48, 16, 12),
(49, 17, 9),
(49, 18, 2),
(50, 19, 6),
(50, 20, 8);

INSERT INTO terreno (coordenadas, tamaño, hectareas_libres) VALUES
('Lat: 4.5890, Long: -74.0780', 20, 5),
('Lat: 4.6012, Long: -74.0915', 15, 3),
('Lat: 4.5633, Long: -74.0722', 18, 4),
('Lat: 4.5798, Long: -74.0810', 12, 2),
('Lat: 4.5910, Long: -74.0650', 17, 0),
('Lat: 4.5805, Long: -74.0995', 20, 0),
('Lat: 4.5624, Long: -74.0803', 20, 5),
('Lat: 4.5887, Long: -74.0824', 10, 2),
('Lat: 4.5903, Long: -74.0705', 15, 2),
('Lat: 4.5982, Long: -74.0930', 19, 2);

INSERT INTO cultivo (id_producto, id_terreno, hectareas_usadas) VALUES
(1, 1, 10),
(2, 2, 7), 
(3, 3, 8), 
(4, 4, 6), 
(5, 5, 8), 
(6, 6, 10),
(7, 7, 10), 
(8, 8, 5), 
(9, 9, 7),  
(10, 10, 9),
(1, 1, 5),
(2, 2, 5), 
(3, 3, 6),
(4, 4, 4),  
(5, 5, 9), 
(6, 6, 10),
(7, 7, 5), 
(8, 8, 3), 
(9, 9, 6), 
(10, 10, 8); 

INSERT INTO cosecha (fecha_inicio, fecha_fin, id_cultivo, cantidad_total_kg, cantidad_cosechada_kg, cantidad_perdida) VALUES
('2024-01-01', '2024-01-10', 1, 5000, 4800, 200),
('2024-01-05', '2024-01-15', 2, 4500, 4300, 200),
('2024-01-10', '2024-01-20', 3, 3000, 2900, 100),
('2024-01-15', '2024-01-25', 4, 2000, 1950, 50),
('2024-01-20', '2024-01-30', 5, 5500, 5400, 100),
('2024-01-25', '2024-02-05', 6, 6500, 6400, 100),
('2024-02-01', '2024-02-10', 7, 3000, 2900, 100),
('2024-02-05', '2024-02-15', 8, 5000, 4900, 100),
('2024-02-10', '2024-02-20', 9, 4000, 3900, 100),
('2024-02-15', '2024-02-25', 10, 4500, 4400, 100),
('2024-02-20', '2024-03-01', 11, 7000, 6900, 100),
('2024-02-25', '2024-03-05', 12, 3500, 3400, 100),
('2024-03-01', '2024-03-10', 13, 5500, 5400, 100),
('2024-03-05', '2024-03-15', 14, 4500, 4400, 100),
('2024-03-10', '2024-03-20', 15, 6000, 5900, 100),
('2024-03-15', '2024-03-25', 16, 4000, 3900, 100),
('2024-03-20', '2024-03-30', 17, 6500, 6400, 100),
('2024-03-25', '2024-04-05', 18, 5500, 5400, 100),
('2024-04-01', '2024-04-10', 19, 3000, 2900, 100),
('2024-04-05', '2024-04-15', 20, 5000, 4900, 100);

-- Inserts en la tabla estados_mh
INSERT INTO estados_mh(nombre) VALUES('En uso'),('Libre'),('Dañado');

-- Inserts en la tabla tipo_mh
INSERT INTO tipo_mh(nombre) VALUES('Maquinaria'),('Herramienta');

-- Inserts en la tabla bodega
INSERT INTO bodega (nombre, ubicacion) VALUES
('Bodega Principal', 'Cerca de la entrada'),
('Bodega Secundaria', 'Junto al establo'),
('Bodega del Huerto', 'Detrás del huerto'),
('Bodega de Fertilizantes', 'Cerca del tanque de agua'),
('Bodega de Repuestos', 'Frente al taller');

-- Inserts en la tabla maquinaria_herrmienta
INSERT INTO maquinaria_herramienta (nombre, id_tipo, id_estado, id_bodega) VALUES
('Tractor John Deere', 1, 1, 1),
('Machete', 2, 2, 1),
('Machete', 2, 1, 2),
('Machete', 2, 1, 3),
('Machete', 2, 3, 4),
('Machete', 2, 2, 5),
('Pala', 2, 1, 1),
('Pala', 2, 2, 2),
('Pala', 2, 2, 3),
('Pala', 2, 1, 4),
('Pala', 2, 3, 5),
('Motocultor Honda', 1, 1, 2),
('Azada metálica', 2, 2, 3),
('Azada metálica', 2, 1, 4),
('Azada metálica', 2, 3, 5),
('Podadora eléctrica', 2, 3, 1),
('Podadora eléctrica', 2, 1, 2),
('Podadora eléctrica', 2, 2, 3),
('Rastrillo', 2, 2, 4),
('Rastrillo', 2, 1, 5),
('Rastrillo', 2, 1, 1),
('Tractor Massey Ferguson', 1, 2, 2),
('Carretilla', 2, 1, 3),
('Carretilla', 2, 2, 4),
('Carretilla', 2, 1, 5),
('Carretilla', 2, 2, 1),
('Carretilla', 2, 3, 2),
('Motobomba', 2, 1, 3),
('Motobomba', 2, 2, 4),
('Motobomba', 2, 3, 5),
('Sierra circular', 2, 2, 1),
('Sierra circular', 2, 1, 2),
('Sierra circular', 2, 1, 3),
('Motosierra Stihl', 2, 3, 4),
('Motosierra Stihl', 2, 1, 5),
('Motosierra Stihl', 2, 1, 1),
('Soplador de hojas', 2, 2, 2),
('Soplador de hojas', 2, 2, 3),
('Soplador de hojas', 2, 3, 4),
('Pulverizador', 2, 1, 5),
('Pulverizador', 2, 2, 1),
('Pulverizador', 2, 3, 2),
('Pulverizador', 2, 2, 3),
('Pulverizador', 2, 1, 4),
('Pulverizador', 2, 3, 5),
('Tractor Kubota', 1, 1, 1),
('Tractor Kubota', 1, 2, 2),
('Arado reversible', 2, 2, 3),
('Arado reversible', 2, 3, 4);

-- Inserts en la tabla tipo_insumo
INSERT INTO tipo_insumo(nombre) VALUES('Abono'),('Herbicida'),('Insecticida');

-- Inserts en la tabla insumos
INSERT INTO insumos (nombre, id_tipo_insumo, cantidad, id_bodega) VALUES
('Abono Orgánico', 1, 50, 1),
('Abono Orgánico', 1, 30, 2),
('Abono Orgánico', 1, 40, 3),
('Abono Químico', 1, 25, 4),
('Abono Químico', 1, 60, 5),
('Abono de Compost', 1, 20, 1),
('Abono de Compost', 1, 35, 2),
('Herbicida Selectivo', 2, 10, 1),
('Herbicida Selectivo', 2, 15, 3),
('Herbicida Total', 2, 12, 4),
('Herbicida Total', 2, 20, 5),
('Insecticida Orgánico', 3, 18, 2),
('Insecticida Orgánico', 3, 10, 3),
('Insecticida Químico', 3, 25, 4),
('Insecticida Químico', 3, 30, 5),
('Insecticida Multiuso', 3, 15, 1),
('Insecticida Multiuso', 3, 20, 2),
('Abono de Lombriz', 1, 50, 3),
('Abono de Lombriz', 1, 40, 4),
('Abono Foliar', 1, 60, 5),
('Abono Foliar', 1, 25, 1),
('Abono Foliar', 1, 35, 2);


-- Inserts para la tabla proveedor
INSERT INTO preveedor (nombre1, nombre2, apellido1, apellido2, cedula, direccion, id_login) VALUES
('Juan', NULL, 'Perez', 'Gomez', 1012345678, 'Calle 1', 1),
('Maria', 'Jose', 'Gomez', NULL, 1023456789, 'Calle 2', 2),
('Pedro', NULL, 'Lopez', 'Rodriguez', 1034567890, 'Calle 3', 3),
('Ana', 'Lucia', 'Moreno', 'Sanchez', 1045678901, 'Calle 4', 4),
('Carlos', 'Alberto', 'Ruiz', NULL, 1056789012, 'Calle 5', 5),
('Sofia', NULL, 'Diaz', 'Martinez', 1067890123, 'Calle 6', 6),
('Julian', 'Andres', 'Sanchez', 'Ruiz', 1078901234, 'Calle 7', 7),
('Luisa', NULL, 'Ortega', 'Castro', 1089012345, 'Calle 8', 8),
('Fernando', 'Jose', 'Rios', NULL, 1090123456, 'Calle 9', 9),
('Paula', NULL, 'Rodriguez', 'Velasquez', 1101234567, 'Calle 10', 10),
('Jorge', 'Luis', 'Velasquez', 'Mejia', 1112345678, 'Calle 11', 11),
('Andrea', NULL, 'Martinez', 'Castro', 1123456789, 'Calle 12', 12),
('Felipe', 'Andres', 'Santos', 'Alvarez', 1134567890, 'Calle 13', 13),
('Camila', NULL, 'Gutierrez', 'Rojas', 1145678901, 'Calle 14', 14),
('Daniel', 'Felipe', 'Ramirez', NULL, 1156789012, 'Calle 15', 15),
('Laura', NULL, 'Castro', 'Gonzalez', 1167890123, 'Calle 16', 16),
('Oscar', 'Alberto', 'Alvarez', 'Jimenez', 1178901234, 'Calle 17', 17),
('Natalia', NULL, 'Meza', 'Garcia', 1189012345, 'Calle 18', 18),
('Pablo', 'Antonio', 'Garcia', 'Luna', 1190123456, 'Calle 19', 19),
('Monica', NULL, 'Silva', 'Cruz', 1201234567, 'Calle 20', 20);


-- Inserts para la tabla compras
INSERT INTO compra (id_proveedor, fecha_compra, precio_total, id_metodo_pago) VALUES
(1, '2024-10-01', 55000, 1),
(2, '2024-10-02', 586000, 2),
(3, '2024-10-03', 46000, 3),
(4, '2024-10-04', 175000, 1),
(5, '2024-10-05', 135000, 2),
(6, '2024-10-06', 640000, 3),
(7, '2024-10-07', 398000, 1),
(8, '2024-10-08', 260000, 2),
(9, '2024-10-09', 790000, 3),
(10, '2024-10-10', 170000, 1);

-- Inserts para la tabla compra_producto
INSERT INTO compra_producto (id_compra, precio_unitario, cantidad, producto, tipo) VALUES
(1, 15000, 2, 'Machete', 'Herramienta'),
(1, 20000, 1, 'Aspiradora de polvo', 'Maquinaria'),
(1, 5000, 1, 'Herbicida A', 'Insumo'),
(2, 12000, 3, 'Machete', 'Herramienta'),
(2, 250000, 2, 'Tractor', 'Maquinaria'),
(2, 10000, 5, 'Insecticida A', 'Insumo'),
(3, 12000, 1, 'Aspiradora de polvo', 'Maquinaria'),
(3, 10000, 2, 'Pala', 'Herramienta'),
(3, 7000, 2, 'Herbicida B', 'Insumo'),
(4, 30000, 3, 'Machete', 'Herramienta'),
(4, 40000, 1, 'Generador', 'Maquinaria'),
(4, 15000, 3, 'Insecticida C', 'Insumo'),
(5, 35000, 1, 'Tractor', 'Maquinaria'),
(5, 15000, 4, 'Pico', 'Herramienta'),
(5, 8000, 5, 'Herbicida C', 'Insumo'),
(6, 45000, 2, 'Pala', 'Herramienta'),
(6, 500000, 1, 'Motocultor', 'Maquinaria'),
(6, 25000, 2, 'Insecticida D', 'Insumo'),
(7, 300000, 1, 'Generador', 'Maquinaria'),
(7, 25000, 2, 'Machete', 'Herramienta'),
(7, 12000, 4, 'Herbicida D', 'Insumo'),
(8, 35000, 3, 'Aspiradora de polvo', 'Maquinaria'),
(8, 40000, 2, 'Pico', 'Herramienta'),
(8, 15000, 5, 'Insecticida E', 'Insumo'),
(9, 30000, 1, 'Machete', 'Herramienta'),
(9, 350000, 2, 'Motocultor', 'Maquinaria'),
(9, 20000, 3, 'Herbicida E', 'Insumo'),
(10, 20000, 3, 'Generador', 'Maquinaria'),
(10, 25000, 2, 'Pala', 'Herramienta'),
(10, 15000, 4, 'Insecticida F', 'Insumo');

-- Insertar cultivo_empleado
INSERT INTO cultivo_empleado (id_cosecha, id_empleado) VALUES
(1, 3),
(1, 5),
(1, 12),
(1, 14),
(1, 21),
(1, 25),
(1, 30),
(1, 34),
(1, 39),
(1, 43),
(1, 48),
(2, 3),
(2, 5),
(2, 12),
(2, 14),
(2, 21),
(2, 25),
(2, 30),
(2, 34),
(2, 39),
(2, 43),
(2, 48),
(3, 3),
(3, 5),
(3, 12),
(3, 14),
(3, 21),
(3, 25),
(3, 30),
(3, 34),
(3, 39),
(3, 43),
(3, 48),
(4, 3),
(4, 5),
(4, 12),
(4, 14),
(4, 21),
(4, 25),
(4, 30),
(4, 34),
(4, 39),
(4, 43),
(4, 48),
(5, 3),
(5, 5),
(5, 12),
(5, 14),
(5, 21),
(5, 25),
(5, 30),
(5, 34),
(5, 39),
(5, 43),
(5, 48),
(6, 3),
(6, 5),
(6, 12),
(6, 14),
(6, 21),
(6, 25),
(6, 30),
(6, 34),
(6, 39),
(6, 43),
(6, 48),
(7, 3),
(7, 5),
(7, 12),
(7, 14),
(7, 21),
(7, 25),
(7, 30),
(7, 34),
(7, 39),
(7, 43),
(7, 48),
(8, 3),
(8, 5),
(8, 12),
(8, 14),
(8, 21),
(8, 25),
(8, 30),
(8, 34),
(8, 39),
(8, 43),
(8, 48),
(9, 3),
(9, 5),
(9, 12),
(9, 14),
(9, 21),
(9, 25),
(9, 30),
(9, 34),
(9, 39),
(9, 43),
(9, 48),
(10, 3),
(10, 5),
(10, 12),
(10, 14),
(10, 21),
(10, 25),
(10, 30),
(10, 34),
(10, 39),
(10, 43),
(10, 48),
(11, 3),
(11, 5),
(11, 12),
(11, 14),
(11, 21),
(11, 25),
(11, 30),
(11, 34),
(11, 39),
(11, 43),
(11, 48),
(12, 3),
(12, 5),
(12, 12),
(12, 14),
(12, 21),
(12, 25),
(12, 30),
(12, 34),
(12, 39),
(12, 43),
(12, 48),
(13, 3),
(13, 5),
(13, 12),
(13, 14),
(13, 21),
(13, 25),
(13, 30),
(13, 34),
(13, 39),
(13, 43),
(13, 48),
(14, 3),
(14, 5),
(14, 12),
(14, 14),
(14, 21),
(14, 25),
(14, 30),
(14, 34),
(14, 39),
(14, 43),
(14, 48),
(15, 3),
(15, 5),
(15, 12),
(15, 14),
(15, 21),
(15, 25),
(15, 30),
(15, 34),
(15, 39),
(15, 43),
(15, 48),
(16, 3),
(16, 5),
(16, 12),
(16, 14),
(16, 21),
(16, 25),
(16, 30),
(16, 34),
(16, 39),
(16, 43),
(16, 48),
(17, 3),
(17, 5),
(17, 12),
(17, 14),
(17, 21),
(17, 25),
(17, 30),
(17, 34),
(17, 39),
(17, 43),
(17, 48),
(18, 3),
(18, 5),
(18, 12),
(18, 14),
(18, 21),
(18, 25),
(18, 30),
(18, 34),
(18, 39),
(18, 43),
(18, 48),
(19, 3),
(19, 5),
(19, 12),
(19, 14),
(19, 21),
(19, 25),
(19, 30),
(19, 34),
(19, 39),
(19, 43),
(19, 48),
(20, 3),
(20, 5),
(20, 12),
(20, 14),
(20, 21),
(20, 25),
(20, 30),
(20, 34),
(20, 39),
(20, 43),
(20, 48);

INSERT INTO ingresos_gastos_mensuales (id, inicio_mes, fin_mes, ingresos, gastos, ganancia_final)
VALUES (1, '2024-10-01', '2024-10-31', 0, 69474293, -69474293);