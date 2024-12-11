CREATE DATABASE Proyecto;

USE Proyecto;


-- Crear la tabla de programas académicos
CREATE TABLE programas_academicos (
    codigo_programa INT PRIMARY KEY,
    nombre_programa VARCHAR(255)
);

-- Crear la tabla de estudiantes
CREATE TABLE estudiantes (
    estudiante_id INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    fecha_nacimiento DATE,
    correo VARCHAR(255),
    cedula INT,
    codigo_programa INT,
    CONSTRAINT fk_estudiantes_programa FOREIGN KEY (codigo_programa)
        REFERENCES programas_academicos(codigo_programa)
);

-- Crear la tabla de cursos
CREATE TABLE cursos (
    codigo_curso VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    maximo_estudiantes INT,
    numero_semestre INT
);

-- Crear la tabla de calificaciones de los estudiantes
CREATE TABLE estudiantes_calificacion (
    estudiante_id INT,
    codigo_curso VARCHAR(50),
    calificacion INT,
    fecha_asignada DATE,
    PRIMARY KEY (estudiante_id, codigo_curso),
    CONSTRAINT fk_estudiantes_calificacion FOREIGN KEY (estudiante_id)
        REFERENCES estudiantes(estudiante_id),
    CONSTRAINT fk_cursos_calificacion FOREIGN KEY (codigo_curso)
        REFERENCES cursos(codigo_curso)
);

-- Crear la tabla de semestre
CREATE TABLE semestre (
    numero_semestre INT,
    año INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY (numero_semestre, año)
);

-- Crear la tabla de inscripciones
CREATE TABLE inscripciones (
    estudiante_id INT,
    codigo_curso VARCHAR(50),
    fecha_inscripcion DATE,
    PRIMARY KEY (estudiante_id, codigo_curso),
    CONSTRAINT fk_inscripciones_estudiante FOREIGN KEY (estudiante_id)
        REFERENCES estudiantes(estudiante_id),
    CONSTRAINT fk_inscripciones_curso FOREIGN KEY (codigo_curso)
        REFERENCES cursos(codigo_curso)
);

-- Crear la tabla de materia_prerequisito
CREATE TABLE materia_prerequisito (
    codigo_curso VARCHAR(50),
    codigo_prerequisito VARCHAR(50),
    PRIMARY KEY (codigo_curso, codigo_prerequisito),
    CONSTRAINT fk_materia_prerequisito_curso FOREIGN KEY (codigo_curso)
        REFERENCES cursos(codigo_curso),
    CONSTRAINT fk_materia_prerequisito_prerequisito FOREIGN KEY (codigo_prerequisito)
        REFERENCES cursos(codigo_curso)
);

-- Crear la tabla de profesores
CREATE TABLE profesores (
    profesor_id INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    fecha_fin DATE
);

-- Crear la tabla de catedras
CREATE TABLE catedra (
    catedra_id INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    profesor_id INT,
    CONSTRAINT fk_catedra_profesor FOREIGN KEY (profesor_id)
        REFERENCES profesores(profesor_id)
);

-- Crear la tabla de aulas
CREATE TABLE aulas (
    aula_id INT PRIMARY KEY,
    equipamiento VARCHAR(255),
    numero_aula INT,
    edificio VARCHAR(255),
    capacidad INT
);

-- Crear la tabla de aula_curso (relaciona cursos con aulas)
CREATE TABLE aula_curso (
    aula_id INT,
    codigo_curso VARCHAR(50),
    PRIMARY KEY (aula_id, codigo_curso),
    CONSTRAINT fk_aula_curso_aula FOREIGN KEY (aula_id)
        REFERENCES aulas(aula_id),
    CONSTRAINT fk_aula_curso_curso FOREIGN KEY (codigo_curso)
        REFERENCES cursos(codigo_curso)
);

-- Insercion de data

INSERT INTO programas_academicos (codigo_programa, nombre_programa)
VALUES
(1, 'Ingeniería en Sistemas'),
(2, 'Medicina'),
(3, 'Arquitectura'),
(4, 'Psicología'),
(5, 'Derecho'),
(6, 'Administración de Empresas'),
(7, 'Biotecnología'),
(8, 'Ingeniería Civil'),
(9, 'Diseño Gráfico'),
(10, 'Filosofía'),
(11, 'Matemáticas Aplicadas'),
(12, 'Química'),
(13, 'Ingeniería Mecánica'),
(14, 'Antropología'),
(15, 'Relaciones Internacionales');



INSERT INTO estudiantes (estudiante_id, nombre, apellidos, fecha_nacimiento, correo, cedula, codigo_programa)
VALUES
(1, 'Juan', 'Pérez', '1999-04-01', 'juan.perez@mail.com', 12345678, 1),
(2, 'Ana', 'González', '2000-05-12', 'ana.gonzalez@mail.com', 23456789, 2),
(3, 'Carlos', 'Ramírez', '1998-08-22', 'carlos.ramirez@mail.com', 34567890, 3),
(4, 'Lucía', 'Martínez', '1997-11-15', 'lucia.martinez@mail.com', 45678901, 4),
(5, 'Pedro', 'Lopez', '1999-12-05', 'pedro.lopez@mail.com', 56789012, 5),
(6, 'María', 'Hernández', '1998-07-19', 'maria.hernandez@mail.com', 67890123, 6),
(7, 'Luis', 'Rodríguez', '1996-10-25', 'luis.rodriguez@mail.com', 78901234, 7),
(8, 'Carmen', 'Sánchez', '1997-03-18', 'carmen.sanchez@mail.com', 89012345, 8),
(9, 'Pablo', 'Jiménez', '1995-09-09', 'pablo.jimenez@mail.com', 90123456, 9),
(10, 'Laura', 'Vargas', '2000-06-15', 'laura.vargas@mail.com', 10123456, 10),
(11, 'Jorge', 'Ortiz', '1999-11-30', 'jorge.ortiz@mail.com', 11234567, 11),
(12, 'Valeria', 'Castro', '1998-02-28', 'valeria.castro@mail.com', 12234567, 12),
(13, 'Miguel', 'Díaz', '1997-05-10', 'miguel.diaz@mail.com', 13234567, 13),
(14, 'Daniela', 'Ríos', '1996-08-21', 'daniela.rios@mail.com', 14234567, 14),
(15, 'Andrés', 'Mendoza', '2000-12-12', 'andres.mendoza@mail.com', 15234567, 15),
(16, 'Fernanda', 'Paredes', '1999-03-04', 'fernanda.paredes@mail.com', 16234567, 1),
(17, 'Sergio', 'Navarro', '1998-07-22', 'sergio.navarro@mail.com', 17234567, 1),
(18, 'Isabel', 'Guzmán', '1997-01-14', 'isabel.guzman@mail.com', 18234567, 1),
(19, 'Ramón', 'Salazar', '1996-04-03', 'ramon.salazar@mail.com', 19234567, 1),
(20, 'Carolina', 'Morales', '1999-08-29', 'carolina.morales@mail.com', 20234567, 2),
(21, 'Roberto', 'Rivera', '1998-10-07', 'roberto.rivera@mail.com', 21234567, 1),
(22, 'Paula', 'Muñoz', '1997-12-25', 'paula.munoz@mail.com', 22234567, 2),
(23, 'Antonio', 'Aguilar', '1996-03-13', 'antonio.aguilar@mail.com', 23234567, 2),
(24, 'Natalia', 'Flores', '2000-01-09', 'natalia.flores@mail.com', 24234567, 2),
(25, 'Martín', 'Luna', '1999-06-17', 'martin.luna@mail.com', 25234567, 2),
(26, 'Elena', 'Delgado', '1998-05-23', 'elena.delgado@mail.com', 26234567, 2),
(27, 'Alberto', 'Cruz', '1997-11-11', 'alberto.cruz@mail.com', 27234567, 2),
(28, 'Gabriela', 'Chávez', '1996-10-05', 'gabriela.chavez@mail.com', 28234567, 2),
(29, 'Victor', 'Escobar', '1998-01-30', 'victor.escobar@mail.com', 29234567, 9),
(30, 'Julia', 'Campos', '1999-04-26', 'julia.campos@mail.com', 30234567, 3),
(31, 'Ángel', 'Rojas', '1997-09-08', 'angel.rojas@mail.com', 31234567, 3),
(32, 'Fátima', 'Peña', '1996-12-19', 'fatima.pena@mail.com', 32234567, 3),
(33, 'Diego', 'Molina', '1998-02-06', 'diego.molina@mail.com', 33234567, 3),
(34, 'Claudia', 'Vega', '1997-07-24', 'claudia.vega@mail.com', 34234567, 4),
(35, 'Raúl', 'Herrera', '1996-08-18', 'raul.herrera@mail.com', 35234567, 5),
(36, 'Patricia', 'Blanco', '1999-01-15', 'patricia.blanco@mail.com', 36234567, 6),
(37, 'Gonzalo', 'Ortiz', '1998-05-07', 'gonzalo.ortiz@mail.com', 37234567, 7),
(38, 'Teresa', 'Soto', '1997-10-02', 'teresa.soto@mail.com', 38234567, 8),
(39, 'Manuel', 'Alvarado', '1996-09-27', 'manuel.alvarado@mail.com', 39234567, 9),
(40, 'Silvia', 'Fuentes', '1998-04-12', 'silvia.fuentes@mail.com', 40234567, 6),
(41, 'Francisco', 'Medina', '1999-06-10', 'francisco.medina@mail.com', 41234567, 4),
(42, 'Clara', 'Carrillo', '1997-02-22', 'clara.carrillo@mail.com', 42234567, 4),
(43, 'Mario', 'Padilla', '1996-07-31', 'mario.padilla@mail.com', 43234567, 4),
(44, 'Luisa', 'Cortés', '1998-03-20', 'luisa.cortes@mail.com', 44234567, 4),
(45, 'Eduardo', 'Palacios', '1999-09-05', 'eduardo.palacios@mail.com', 45234567, 4),
(46, 'Sara', 'Bravo', '1997-05-28', 'sara.bravo@mail.com', 46234567, 6),
(47, 'Ernesto', 'Campos', '1996-10-10', 'ernesto.campos@mail.com', 47234567, 7),
(48, 'Monica', 'Galeano', '1998-08-02', 'monica.galeano@mail.com', 48234567, 8),
(49, 'Ricardo', 'Reyes', '1999-02-16', 'ricardo.reyes@mail.com', 49234567, 9),
(50, 'Sofía', 'Moreno', '2000-01-10', 'sofia.moreno@mail.com', 12389012, 5),
(51, 'Esteban', 'Villalobos', '1999-03-12', 'esteban.villalobos@mail.com', 50234567, 10),
(52, 'Renata', 'Zamora', '1998-06-21', 'renata.zamora@mail.com', 51234567, 11),
(53, 'Alejandro', 'Fuentes', '1997-04-14', 'alejandro.fuentes@mail.com', 52234567, 12),
(54, 'Marisol', 'Acosta', '1996-11-29', 'marisol.acosta@mail.com', 53234567, 13),
(55, 'Jaime', 'Torres', '1998-12-08', 'jaime.torres@mail.com', 54234567, 14),
(56, 'Camila', 'Mejía', '1999-01-03', 'camila.mejia@mail.com', 55234567, 15),
(57, 'Hugo', 'Vargas', '1996-02-18', 'hugo.vargas@mail.com', 56234567, 1),
(58, 'Valentina', 'Ortega', '1998-07-30', 'valentina.ortega@mail.com', 57234567, 2),
(59, 'David', 'Ávila', '1997-09-25', 'david.avila@mail.com', 58234567, 3),
(60, 'Mariana', 'Barrios', '1996-04-20', 'mariana.barrios@mail.com', 59234567, 4),
(61, 'Rodrigo', 'Pérez', '1999-05-15', 'rodrigo.perez@mail.com', 60234567, 5),
(62, 'Gabriela', 'Varela', '1998-03-06', 'gabriela.varela@mail.com', 61234567, 6),
(63, 'Sebastián', 'Navarrete', '1997-10-13', 'sebastian.navarrete@mail.com', 62234567, 7),
(64, 'Irene', 'Romero', '1996-08-17', 'irene.romero@mail.com', 63234567, 8),
(65, 'Álvaro', 'González', '1999-07-12', 'alvaro.gonzalez@mail.com', 64234567, 9),
(66, 'Carla', 'Valdés', '1998-12-04', 'carla.valdes@mail.com', 65234567, 10),
(67, 'Mateo', 'León', '1997-05-18', 'mateo.leon@mail.com', 66234567, 11),
(68, 'Victoria', 'Mora', '1996-11-03', 'victoria.mora@mail.com', 67234567, 12),
(69, 'Enrique', 'Solís', '1999-01-27', 'enrique.solis@mail.com', 68234567, 13),
(70, 'Claudia', 'Estrada', '1998-02-22', 'claudia.estrada@mail.com', 69234567, 14),
(71, 'Tomás', 'Ramírez', '1997-03-03', 'tomas.ramirez@mail.com', 70234567, 15),
(72, 'Luciana', 'López', '1996-06-24', 'luciana.lopez@mail.com', 71234567, 1),
(73, 'Andrés', 'Fajardo', '1999-09-07', 'andres.fajardo@mail.com', 72234567, 2),
(74, 'Paola', 'Hernández', '1998-10-01', 'paola.hernandez@mail.com', 73234567, 3),
(75, 'Esther', 'Rivas', '1997-04-17', 'esther.rivas@mail.com', 74234567, 4),
(76, 'Ricardo', 'Maldonado', '1996-07-22', 'ricardo.maldonado@mail.com', 75234567, 5),
(77, 'Natalia', 'Cano', '1999-11-02', 'natalia.cano@mail.com', 76234567, 6),
(78, 'Adrián', 'Reyes', '1998-05-25', 'adrian.reyes@mail.com', 77234567, 7),
(79, 'Sofía', 'Fernández', '1997-01-09', 'sofia.fernandez@mail.com', 78234567, 8),
(80, 'Ángela', 'Guzmán', '1996-08-14', 'angela.guzman@mail.com', 79234567, 9),
(81, 'Félix', 'Peña', '1999-02-11', 'felix.pena@mail.com', 80234567, 10),
(82, 'Lorena', 'Blanco', '1998-06-30', 'lorena.blanco@mail.com', 81234567, 11),
(83, 'Eduardo', 'Cruz', '1997-12-18', 'eduardo.cruz@mail.com', 82234567, 12),
(84, 'Melissa', 'Quiroz', '1996-01-05', 'melissa.quiroz@mail.com', 83234567, 13),
(85, 'Julián', 'Delgado', '1999-04-23', 'julian.delgado@mail.com', 84234567, 14),
(86, 'Laura', 'Salas', '1998-07-15', 'laura.salas@mail.com', 85234567, 15),
(87, 'Rafael', 'Alonso', '1997-09-11', 'rafael.alonso@mail.com', 86234567, 1),
(88, 'Cecilia', 'García', '1996-10-20', 'cecilia.garcia@mail.com', 87234567, 2),
(89, 'Ignacio', 'Ibáñez', '1998-02-10', 'ignacio.ibanez@mail.com', 88234567, 3),
(90, 'Julieta', 'Pacheco', '1997-11-14', 'julieta.pacheco@mail.com', 89234567, 4),
(91, 'Diego', 'Montero', '1996-03-19', 'diego.montero@mail.com', 90234567, 5),
(92, 'Alejandra', 'Lara', '1999-08-03', 'alejandra.lara@mail.com', 91234567, 6),
(93, 'Martín', 'Palma', '1998-01-16', 'martin.palma@mail.com', 92234567, 7),
(94, 'Carmen', 'Silva', '1997-10-06', 'carmen.silva@mail.com', 93234567, 8),
(95, 'Fernando', 'Lemus', '1996-05-12', 'fernando.lemus@mail.com', 94234567, 9),
(96, 'Natalia', 'Zúñiga', '1998-03-28', 'natalia.zuniga@mail.com', 95234567, 10),
(97, 'Adriana', 'Cárdenas', '1997-06-02', 'adriana.cardenas@mail.com', 96234567, 11),
(98, 'Luis', 'Nieto', '1996-09-26', 'luis.nieto@mail.com', 97234567, 12),
(99, 'Daniel', 'Cabrera', '1999-04-11', 'daniel.cabrera@mail.com', 98234567, 13),
(100, 'Elena', 'Pinto', '1998-05-30', 'elena.pinto@mail.com', 99234567, 14);



INSERT INTO cursos (codigo_curso, nombre, descripcion, maximo_estudiantes, numero_semestre)
VALUES
('C001', 'Algoritmos', 'Curso sobre estructuras y algoritmos', 30, 1),
('C002', 'Física I', 'Introducción a la física', 40, 1),
('C003', 'Matemáticas Discretas', 'Fundamentos matemáticos para la informática', 35, 1),
('C004', 'Programación Avanzada', 'Desarrollo en lenguajes de bajo nivel', 25, 2),
('C005', 'Ética Profesional', 'Estudio de la ética en el ámbito profesional', 40, 2),
('C006', 'Bases de Datos', 'Diseño y consulta de bases de datos relacionales', 30, 2),
('C007', 'Cálculo I', 'Fundamentos de cálculo diferencial e integral', 50, 1),
('C008', 'Introducción a la Química', 'Conceptos básicos de química general', 35, 1),
('C009', 'Análisis de Sistemas', 'Modelado y análisis de sistemas de información', 30, 3),
('C010', 'Desarrollo Web', 'Diseño y programación de aplicaciones web', 25, 3),
('C011', 'Redes de Computadoras', 'Principios de redes y comunicaciones', 30, 4),
('C012', 'Inteligencia Artificial', 'Conceptos básicos de IA', 20, 4),
('C013', 'Ingeniería de Software', 'Desarrollo de software basado en metodologías ágiles', 40, 3),
('C014', 'Física II', 'Física aplicada en sistemas dinámicos', 40, 2),
('C015', 'Optimización', 'Métodos y algoritmos para optimización matemática', 30, 4),
('C016', 'Programación en Python', 'Introducción a la programación con Python', 50, 1),
('C017', 'Sistemas Operativos', 'Gestión de sistemas operativos modernos', 25, 3),
('C018', 'Análisis Numérico', 'Métodos numéricos para resolución de problemas', 30, 4),
('C019', 'Seguridad Informática', 'Fundamentos de ciberseguridad y criptografía', 20, 5),
('C020', 'Electrónica Digital', 'Diseño de circuitos digitales', 35, 2),
('C021', 'Arquitectura de Computadoras', 'Estudio de hardware y componentes', 30, 3),
('C022', 'Gestión de Proyectos', 'Planificación y ejecución de proyectos tecnológicos', 40, 5),
('C023', 'Física III', 'Electromagnetismo y sus aplicaciones', 25, 4),
('C024', 'Probabilidad y Estadística', 'Fundamentos estadísticos para análisis de datos', 50, 2),
('C025', 'Lenguajes de Programación', 'Estudio comparativo de paradigmas de programación', 35, 3),
('C026', 'Modelado de Datos', 'Creación de modelos de datos para sistemas complejos', 40, 3),
('C027', 'Compiladores', 'Introducción al diseño y desarrollo de compiladores', 20, 4),
('C028', 'Minería de Datos', 'Técnicas de análisis de grandes volúmenes de datos', 30, 5),
('C029', 'Robótica', 'Fundamentos y aplicaciones de la robótica', 25, 5),
('C030', 'Desarrollo Móvil', 'Creación de aplicaciones para dispositivos móviles', 30, 4);




INSERT INTO estudiantes_calificacion (estudiante_id, codigo_curso, calificacion, fecha_asignada)
VALUES
(1, 'C001', 85, '2024-11-01'),
(2, 'C002', 92, '2024-11-02'),
(3, 'C003', 78, '2024-11-03'),
(4, 'C004', 88, '2024-11-04'),
(5, 'C005', 90, '2024-11-05'),
(6, 'C006', 75, '2024-11-06'),
(7, 'C007', 82, '2024-11-07'),
(8, 'C008', 89, '2024-11-08'),
(9, 'C009', 95, '2024-11-09'),
(10, 'C010', 80, '2024-11-10'),
(11, 'C011', 87, '2024-11-11'),
(12, 'C012', 93, '2024-11-12'),
(13, 'C013', 76, '2024-11-13'),
(14, 'C014', 88, '2024-11-14'),
(15, 'C015', 91, '2024-11-15'),
(16, 'C016', 79, '2024-11-16'),
(17, 'C017', 84, '2024-11-17'),
(18, 'C018', 86, '2024-11-18'),
(19, 'C019', 90, '2024-11-19'),
(20, 'C020', 81, '2024-11-20'),
(21, 'C021', 94, '2024-11-21'),
(22, 'C022', 77, '2024-11-22'),
(23, 'C023', 89, '2024-11-23'),
(24, 'C024', 83, '2024-11-24'),
(25, 'C025', 92, '2024-11-25'),
(26, 'C026', 78, '2024-11-26'),
(27, 'C027', 85, '2024-11-27'),
(28, 'C028', 88, '2024-11-28'),
(29, 'C029', 91, '2024-11-29'),
(30, 'C030', 87, '2024-11-30'),
(31, 'C001', 80, '2024-12-01'),
(32, 'C002', 84, '2024-12-02'),
(33, 'C003', 89, '2024-12-03'),
(34, 'C004', 92, '2024-12-04'),
(35, 'C005', 75, '2024-12-05'),
(36, 'C006', 86, '2024-12-06'),
(37, 'C007', 79, '2024-12-07'),
(38, 'C008', 93, '2024-12-08'),
(39, 'C009', 88, '2024-12-09'),
(40, 'C010', 90, '2024-12-10'),
(41, 'C011', 82, '2024-12-11'),
(42, 'C012', 85, '2024-12-12'),
(43, 'C013', 89, '2024-12-13'),
(44, 'C014', 91, '2024-12-14'),
(45, 'C015', 80, '2024-12-15'),
(46, 'C016', 88, '2024-12-16'),
(47, 'C017', 94, '2024-12-17'),
(48, 'C018', 77, '2024-12-18'),
(49, 'C019', 90, '2024-12-19'),
(50, 'C020', 83, '2024-12-20');




INSERT INTO inscripciones (estudiante_id, codigo_curso, fecha_inscripcion)
VALUES
(1, 'C001', '2024-01-15'),
(2, 'C002', '2024-01-16'),
(3, 'C003', '2024-01-17'),
(4, 'C004', '2024-01-18'),
(5, 'C005', '2024-01-19'),
(6, 'C006', '2024-01-20'),
(7, 'C007', '2024-01-21'),
(8, 'C008', '2024-01-22'),
(9, 'C009', '2024-01-23'),
(10, 'C010', '2024-01-24'),
(11, 'C011', '2024-01-25'),
(12, 'C012', '2024-01-26'),
(13, 'C013', '2024-01-27'),
(14, 'C014', '2024-01-28'),
(15, 'C015', '2024-01-29'),
(16, 'C016', '2024-01-30'),
(17, 'C017', '2024-01-31'),
(18, 'C018', '2024-02-01'),
(19, 'C019', '2024-02-02'),
(20, 'C020', '2024-02-03'),
(21, 'C021', '2024-02-04'),
(22, 'C022', '2024-02-05'),
(23, 'C023', '2024-02-06'),
(24, 'C024', '2024-02-07'),
(25, 'C025', '2024-02-08'),
(26, 'C026', '2024-02-09'),
(27, 'C027', '2024-02-10'),
(28, 'C028', '2024-02-11'),
(29, 'C029', '2024-02-12'),
(30, 'C030', '2024-02-13'),
(31, 'C001', '2024-02-14'),
(32, 'C002', '2024-02-15'),
(33, 'C003', '2024-02-16'),
(34, 'C004', '2024-02-17'),
(35, 'C005', '2024-02-18'),
(36, 'C006', '2024-02-19'),
(37, 'C007', '2024-02-20'),
(38, 'C008', '2024-02-21'),
(39, 'C009', '2024-02-22'),
(40, 'C010', '2024-02-23'),
(41, 'C011', '2024-02-24'),
(42, 'C012', '2024-02-25'),
(43, 'C013', '2024-02-26'),
(44, 'C014', '2024-02-27'),
(45, 'C015', '2024-02-28'),
(46, 'C016', '2024-03-01'),
(47, 'C017', '2024-03-02'),
(48, 'C018', '2024-03-03'),
(49, 'C019', '2024-03-04'),
(50, 'C020', '2024-03-05'),
(51, 'C021', '2024-03-06'),
(52, 'C022', '2024-03-07'),
(53, 'C023', '2024-03-08'),
(54, 'C024', '2024-03-09'),
(55, 'C025', '2024-03-10'),
(56, 'C026', '2024-03-11'),
(57, 'C027', '2024-03-12'),
(58, 'C028', '2024-03-13'),
(59, 'C029', '2024-03-14'),
(60, 'C030', '2024-03-15'),
(61, 'C001', '2024-03-16'),
(62, 'C002', '2024-03-17'),
(63, 'C003', '2024-03-18'),
(64, 'C004', '2024-03-19'),
(65, 'C005', '2024-03-20'),
(66, 'C006', '2024-03-21'),
(67, 'C007', '2024-03-22'),
(68, 'C008', '2024-03-23'),
(69, 'C009', '2024-03-24'),
(70, 'C010', '2024-03-25'),
(71, 'C011', '2024-03-26'),
(72, 'C012', '2024-03-27'),
(73, 'C013', '2024-03-28'),
(74, 'C014', '2024-03-29'),
(75, 'C015', '2024-03-30'),
(76, 'C016', '2024-03-31'),
(77, 'C017', '2024-04-01'),
(78, 'C018', '2024-04-02'),
(79, 'C019', '2024-04-03'),
(80, 'C020', '2024-04-04'),
(81, 'C021', '2024-04-05'),
(82, 'C022', '2024-04-06'),
(83, 'C023', '2024-04-07'),
(84, 'C024', '2024-04-08'),
(85, 'C025', '2024-04-09'),
(86, 'C026', '2024-04-10'),
(87, 'C027', '2024-04-11'),
(88, 'C028', '2024-04-12'),
(89, 'C029', '2024-04-13'),
(90, 'C030', '2024-04-14');


INSERT INTO materia_prerequisito (codigo_curso, codigo_prerequisito)
VALUES
('C002', 'C001'),
('C003', 'C001'),
('C004', 'C003'),
('C005', 'C003'),
('C006', 'C002'),
('C007', 'C005'),
('C008', 'C006'),
('C009', 'C007'),
('C010', 'C009'),
('C011', 'C010'),
('C012', 'C011'),
('C013', 'C011'),
('C014', 'C012'),
('C015', 'C012'),
('C016', 'C013'),
('C017', 'C015'),
('C018', 'C016'),
('C019', 'C017'),
('C020', 'C019'),
('C021', 'C020'),
('C022', 'C021'),
('C023', 'C022'),
('C024', 'C023'),
('C025', 'C024'),
('C026', 'C025'),
('C027', 'C026'),
('C028', 'C027'),
('C029', 'C028'),
('C030', 'C029');






INSERT INTO profesores (profesor_id, nombre, apellidos, fecha_fin)
VALUES
(1, 'Alberto', 'Gómez', '2030-12-31'),
(2, 'Laura', 'Sánchez', '2035-11-30'),
(3, 'Carlos', 'Fernández', '2040-10-01'),
(4, 'Marta', 'López', '2032-06-15'),
(5, 'Ricardo', 'Hernández', '2040-05-10'),
(6, 'Silvia', 'Ramírez', '2035-07-20'),
(7, 'Jorge', 'Pérez', '2038-08-25'),
(8, 'Elena', 'Martínez', '2042-09-30'),
(9, 'Juan', 'Ruiz', '2045-03-01'),
(10, 'Gabriela', 'Castro', '2033-04-18');





INSERT INTO catedra (catedra_id, nombre, descripcion, profesor_id)
VALUES
(1, 'Introducción a Algoritmos', 'Cátedra sobre fundamentos algorítmicos', 1),
(2, 'Física Básica', 'Cátedra enfocada en principios físicos básicos', 2),
(3, 'Matemáticas Avanzadas', 'Cátedra sobre álgebra y cálculo avanzado', 3),
(4, 'Programación Orientada a Objetos', 'Cátedra de lenguajes OOP', 4),
(5, 'Gestión de Proyectos', 'Cátedra en dirección de proyectos', 5),
(6, 'Inteligencia Artificial', 'Cátedra sobre redes neuronales y machine learning', 6),
(7, 'Cálculo Diferencial', 'Fundamentos de derivadas e integrales', 7),
(8, 'Redes de Computadoras', 'Cátedra de conexión y comunicación entre dispositivos', 8),
(9, 'Sistemas Operativos', 'Diseño y arquitectura de sistemas operativos', 9),
(10, 'Bases de Datos', 'Cátedra sobre modelado y optimización de bases de datos', 10);



INSERT INTO aulas (aula_id, equipamiento, numero_aula, edificio, capacidad)
VALUES
(1, 'Proyector, Pizarra', 101, 'Edificio A', 30),
(2, 'Computadoras, Pizarra', 102, 'Edificio A', 25),
(3, 'Proyector, Mesas', 103, 'Edificio B', 40),
(4, 'Pizarra Electrónica', 104, 'Edificio B', 35),
(5, 'Laboratorio de Ciencias', 105, 'Edificio C', 20),
(6, 'Computadoras, Proyector', 201, 'Edificio C', 50),
(7, 'Pizarra, Mesas', 202, 'Edificio D', 45),
(8, 'Laboratorio de Química', 203, 'Edificio D', 30),
(9, 'Mesas y Sillas', 204, 'Edificio E', 25),
(10, 'Proyector, Sillas', 301, 'Edificio E', 40),
(11, 'Pizarra Interactiva', 302, 'Edificio F', 35),
(12, 'Sala de Conferencias', 303, 'Edificio F', 20),
(13, 'Laboratorio de Física', 304, 'Edificio G', 50),
(14, 'Proyector, Computadoras', 401, 'Edificio G', 45),
(15, 'Aula de Música', 402, 'Edificio H', 30);




INSERT INTO semestre (numero_semestre, año, fecha_inicio, fecha_fin)
VALUES
(1, 2024, '2024-01-15', '2024-06-30'),
(2, 2024, '2024-07-01', '2024-12-15'),
(1, 2025, '2025-01-15', '2025-06-30'),
(2, 2025, '2025-07-01', '2025-12-15'),
(1, 2026, '2026-01-15', '2026-06-30'),
(2, 2026, '2026-07-01', '2026-12-15'),
(1, 2027, '2027-01-15', '2027-06-30'),
(2, 2027, '2027-07-01', '2027-12-15'),
(1, 2028, '2028-01-15', '2028-06-30'),
(2, 2028, '2028-07-01', '2028-12-15');




INSERT INTO aula_curso (aula_id, codigo_curso)
VALUES
(1, 'C001'),
(2, 'C002'),
(3, 'C003'),
(4, 'C004'),
(5, 'C005'),
(6, 'C006'),
(7, 'C007'),
(8, 'C008'),
(9, 'C009'),
(10, 'C010'),
(11, 'C011'),
(12, 'C012'),
(13, 'C013'),
(14, 'C014'),
(15, 'C015'),
(1, 'C016'),
(2, 'C017'),
(3, 'C018'),
(4, 'C019'),
(5, 'C020'),
(6, 'C021'),
(7, 'C022'),
(8, 'C023'),
(9, 'C024'),
(10, 'C025');


-- Procedimientos Almacenados

-- Registro de Inscripciones

CREATE PROCEDURE RegistrarInscripcion
    @EstudianteID INT,
    @CursoID INT,
    @FechaInscripcion DATE
AS
BEGIN
    INSERT INTO inscripciones (estudiante_id, codigo_curso, fecha_inscripcion)
    VALUES (@EstudianteID, @CursoID, @FechaInscripcion);
END;


-- Actualizar Calificaciones

CREATE PROCEDURE ActualizarCalificacion
    @EstudianteID INT,
    @CursoID INT,
    @NuevaCalificacion DECIMAL(5, 2)
AS
BEGIN
    UPDATE estudiantes_calificacion
    SET Calificacion = @NuevaCalificacion,
        fecha_asignada = GETDATE()
    WHERE estudiante_id = @EstudianteID AND codigo_curso = @CursoID;
END;


-- Obtener listado de cursos para un estudiante (sin prerequisitos pendientes)

CREATE PROCEDURE ObtenerCursosDisponibles
    @EstudianteID INT
AS
BEGIN
    SELECT C.codigo_curso, C.Nombre, C.Descripcion
    FROM Cursos C
    WHERE NOT EXISTS (
        SELECT 1
        FROM Materia_Prerequisito MP
        WHERE MP.codigo_curso = C.codigo_curso
          AND NOT EXISTS (
              SELECT 1
              FROM estudiantes_calificacion CA
              WHERE CA.estudiante_id = @EstudianteID
                AND CA.codigo_curso = MP.codigo_prerequisito
                AND CA.Calificacion >= 70 -- Aprobado
          )
    );
END;


-- Vistas


-- Cursos con mayor inscripcion

CREATE VIEW CursosMayorInscripcion AS
SELECT 
    C.Nombre AS NombreCurso,
    COUNT(I.estudiante_id) AS TotalInscritos
FROM 
    Inscripciones I
JOIN 
    Cursos C ON I.codigo_curso = C.codigo_curso
GROUP BY 
    C.Nombre;

-- Estudiantes inscritos por programa academico


CREATE VIEW EstudiantesPorPrograma AS
SELECT 
    PA.nombre_programa AS NombrePrograma,
    COUNT(E.estudiante_id) AS TotalEstudiantes
FROM 
    Programas_Academicos PA
JOIN 
    Estudiantes E ON E.codigo_programa = PA.codigo_programa
GROUP BY 
    PA.nombre_programa;


-- Triggers

-- Actualizacion de fecha al modificar calificacion

CREATE TRIGGER TriggerActualizacionCalificacion
ON estudiantes_calificacion
AFTER UPDATE
AS
BEGIN
    UPDATE estudiantes_calificacion
    SET fecha_asignada = GETDATE()
    WHERE estudiante_id IN (SELECT estudiante_id FROM inserted);
END;

-- Indices

-- Índice para búsqueda rápida de estudiantes por ID
CREATE INDEX IDX_EstudianteID ON Estudiantes(estudiante_id);

-- Índice para búsqueda rápida de cursos por código
CREATE INDEX IDX_CursoCodigo ON Cursos(codigo_curso);

-- Indice para optimizar busqueda de calificaciones por estudiante y curso
CREATE INDEX IDX_Calificaciones_EstudianteCurso
ON estudiantes_calificacion (estudiante_id, codigo_curso);

-- Indice para optimizar consultas de semestres por numero y anio
CREATE INDEX IDX_Semestre_NumeroAno
ON Semestre (Numero_Semestre, Año);


-- Ejecucion de ejemplos

-- Procedimientos

EXEC RegistrarInscripcion @EstudianteID = 101, @CursoID = 202, @FechaInscripcion = '2024-12-01';

EXEC ActualizarCalificacion @EstudianteID = 101, @CursoID = 202, @NuevaCalificacion = 95.5;

EXEC ObtenerCursosDisponibles @EstudianteID = 101;

-- Vistas

SELECT * FROM CursosMayorInscripcion;

SELECT * FROM EstudiantesPorPrograma;

-- Indices

SELECT * FROM Estudiantes WHERE estudiante_id = 11;

SELECT * FROM Cursos WHERE codigo_curso = 'C011';

SELECT * FROM estudiantes_calificacion WHERE estudiante_id = 11 AND codigo_curso = 'C011';

SELECT * FROM semestre WHERE numero_semestre = 2 AND Año = 2024;