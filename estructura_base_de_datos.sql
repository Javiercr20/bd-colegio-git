-- Script SQL de estructura de base de datos para colegio


-- Crear tabla de Padres
CREATE TABLE Padres (
    id_padre INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    telefono NVARCHAR(20),
    correo NVARCHAR(100)
);

-- Crear tabla de Aulas
CREATE TABLE Aulas (
    id_aula INT PRIMARY KEY,
    nombre_aula NVARCHAR(100) NOT NULL,
    capacidad INT NOT NULL
);

-- Crear tabla de Cursos
CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY,
    nombre_curso NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX)
);

-- Crear tabla de Estudiantes
CREATE TABLE Estudiantes (
    id_estudiante INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    cui NVARCHAR(20) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion NVARCHAR(255),
    edad INT,
    correo_personal NVARCHAR(100),
    correo_institucional NVARCHAR(100),
    id_padre INT,
    id_aula INT,
    FOREIGN KEY (id_padre) REFERENCES Padres(id_padre),
    FOREIGN KEY (id_aula) REFERENCES Aulas(id_aula)
);

-- Crear tabla de Calificaciones
CREATE TABLE Calificaciones (
    id_calificacion INT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    calificacion DECIMAL(5,2),
    fecha DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Crear tabla de Asistencia
CREATE TABLE Asistencia (
    id_asistencia INT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha DATE,
    estado NVARCHAR(10) CHECK(estado IN ('Presente', 'Ausente')),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Crear tabla de Inscripciones
CREATE TABLE Inscripciones (
    id_inscripcion INT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    estado NVARCHAR(15) CHECK(estado IN ('Inscrito', 'No Inscrito')),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Crear tabla de Libros
CREATE TABLE Libros (
    id_libro INT PRIMARY KEY,
    titulo NVARCHAR(255) NOT NULL,
    autor NVARCHAR(100) NOT NULL,
    id_estudiante INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante)
);

-- Crear tabla Institucion
CREATE TABLE Institucion (
    id_institucion INT PRIMARY KEY,
    nombre_institucion NVARCHAR(255) NOT NULL
);

-- Crear tabla Nivel Academico
CREATE TABLE Nivel_Academico (
    id_nivel_academico INT PRIMARY KEY,
    nombre_nivel NVARCHAR(100) NOT NULL
);

-- Crear tabla Grado
CREATE TABLE Grado (
    id_grado INT PRIMARY KEY,
    nombre_grado NVARCHAR(100) NOT NULL,
    id_nivel_academico INT,
    FOREIGN KEY (id_nivel_academico) REFERENCES Nivel_Academico(id_nivel_academico)
);

-- Crear tabla Seccion
CREATE TABLE Seccion (
    id_seccion INT PRIMARY KEY,
    nombre_seccion NVARCHAR(100) NOT NULL,
    id_grado INT,
    FOREIGN KEY (id_grado) REFERENCES Grado(id_grado)
);

-- Crear tabla Curso Temas
CREATE TABLE Curso_Temas (
    id_curso_tema INT PRIMARY KEY,
    nombre_tema NVARCHAR(255) NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Crear tabla Maestros
CREATE TABLE Maestros (
    id_maestro INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    correo NVARCHAR(100),
    telefono NVARCHAR(20)
);

-- Crear tabla Grado Maestro
CREATE TABLE Grado_Maestro (
    id_grado_maestro INT PRIMARY KEY,
    id_maestro INT,
    id_grado INT,
    FOREIGN KEY (id_maestro) REFERENCES Maestros(id_maestro),
    FOREIGN KEY (id_grado) REFERENCES Grado(id_grado)
);

-- Crear tabla Historial Medico
CREATE TABLE Historial_Medico (
    id_historial_medico INT PRIMARY KEY,
    id_estudiante INT,
    fecha DATE,
    descripcion NVARCHAR(MAX),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante)
);

-- Crear tabla Encargados
CREATE TABLE Encargados (
    id_encargado INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    telefono NVARCHAR(20),
    correo NVARCHAR(100),
    id_estudiante INT,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante)
);

-- Crear tabla Institucion_Nivel_Academico
CREATE TABLE Institucion_Nivel_Academico (
    id_institucion_nivel INT PRIMARY KEY,
    id_institucion INT,
    id_nivel_academico INT,
    FOREIGN KEY (id_institucion) REFERENCES Institucion(id_institucion),
    FOREIGN KEY (id_nivel_academico) REFERENCES Nivel_Academico(id_nivel_academico)
);
