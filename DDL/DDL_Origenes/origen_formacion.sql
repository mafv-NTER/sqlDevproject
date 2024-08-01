DROP TABLE Evaluacion;
DROP TABLE Formacion;
DROP TABLE Tecnologia;

CREATE TABLE Tecnologia (
    ID_tecnologia VARCHAR2(20),
    nombre VARCHAR2(255),
    descripcion VARCHAR2(255)
);

CREATE TABLE Formacion (
    ID_tecnologia VARCHAR2(20),
    ID_departamento VARCHAR2(20),
    fecha_inicio DATE,
    fecha_fin DATE,
    ID_empleado VARCHAR2(20)
);

CREATE TABLE Evaluacion (
    ID_tecnologia VARCHAR2(20),
    ID_departamento VARCHAR2(20),
    nota NUMBER,
    fecha_evaluacion DATE,
    observaciones VARCHAR2(255),
    ID_empleado VARCHAR2(20)
);
