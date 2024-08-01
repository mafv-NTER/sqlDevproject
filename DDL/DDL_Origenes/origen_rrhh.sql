DROP TABLE Nomina;
DROP TABLE Vacaciones;
DROP TABLE Contrato;
DROP TABLE Info_Empleado_Personal;
DROP TABLE Info_Empleado_Laboral;
DROP TABLE Info_Empleado_Localizacion;
DROP TABLE Info_Empleado_Contacto;
DROP TABLE Oficina;
DROP TABLE Departamento;


CREATE TABLE Departamento (
    ID_departamento VARCHAR2(20),
    Nombre VARCHAR2(255),
    ID_TechLead VARCHAR2(20)
);

CREATE TABLE Oficina (
    ID_oficina VARCHAR2(20),
    Direccion VARCHAR2(255),
    edificio VARCHAR2(40),
    ciudad VARCHAR2(20),
    codigo_postal VARCHAR2(20)
);

CREATE TABLE Info_Empleado_Contacto (
    ID_empleado VARCHAR2(20),
    telefono VARCHAR2(20),
    email VARCHAR2(255),
    direccion VARCHAR2(255),
    codigo_postal VARCHAR2(20)
);

CREATE TABLE Info_Empleado_Localizacion (
    ID_empleado VARCHAR2(20),
    ID_departamento VARCHAR2(20),
    ID_oficina VARCHAR2(20),
    Ubicacion_oficina VARCHAR2(255)
);

CREATE TABLE Info_Empleado_Laboral (
    ID_empleado VARCHAR2(20),
    rol VARCHAR2(255),
    añosExperiencia NUMBER,
    tipoEmpleado VARCHAR2(255),
    cargo VARCHAR2(255)
);

CREATE TABLE Info_Empleado_Personal (
    ID_empleado VARCHAR2(20),
    DNI VARCHAR2(20),
    Nombre VARCHAR2(255),
    Apellido1 VARCHAR2(255),
    Apellido2 VARCHAR2(255),
    Fecha_nacimiento DATE,
    ID_mentor VARCHAR2(20),
    profesion VARCHAR2(255)
);

CREATE TABLE Contrato (
    ID_contrato VARCHAR2(20),
    ID_empleado VARCHAR2(20),
    descripcion VARCHAR2(255),
    fecha_inicio DATE,
    fecha_fin DATE,
    tipo VARCHAR2(255),
    salario NUMBER
);

CREATE TABLE Vacaciones (
    ID_vacaciones VARCHAR2(20),
    ID_empleado VARCHAR2(20),
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE Nomina (
    ID_nomina VARCHAR2(20),
    ID_empleado VARCHAR2(20),
    fecha DATE,
    salario NUMBER
);
