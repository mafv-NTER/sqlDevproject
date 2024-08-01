DROP TABLE Empleado_Proyecto;
DROP TABLE Proyecto_Tecnologia;
DROP TABLE Proyecto;
DROP TABLE Cliente;
DROP TABLE Empresa;
DROP TABLE Afiliados;



CREATE TABLE Afiliados (
    CIF_empresa VARCHAR2(20),
    nombre VARCHAR2(255),
    descripcion VARCHAR2(255),
    localizacion VARCHAR2(255),
    telefono VARCHAR2(20),
    email VARCHAR2(255)
);

CREATE TABLE Empresa (
    CIF_empresa VARCHAR2(20),
    nombre VARCHAR2(255),
    descripcion VARCHAR2(255),
    telefono VARCHAR2(20),
    email VARCHAR2(255),
    localizacion VARCHAR2(255)
);

CREATE TABLE Cliente (
    ID_cliente VARCHAR2(20),
    CIF_empresa VARCHAR2(20),
    nom_representante VARCHAR2(255),
    apellidos_repr VARCHAR2(255),
    telefono VARCHAR2(20)
);

CREATE TABLE Proyecto (
    ID_proyecto VARCHAR2(20),
    ID_dpto VARCHAR2(20),
    ID_cliente VARCHAR2(20),
    nombre VARCHAR2(255),
    descripcion VARCHAR2(255)

);

CREATE TABLE Proyecto_Tecnologia (
    ID_tecnologia VARCHAR2(20),
    ID_proyecto VARCHAR2(20),
    observaciones VARCHAR2(255)
);

CREATE TABLE Empleado_Proyecto (
    ID_proyecto VARCHAR2(20),
    ID_empleado VARCHAR2(20),
    fecha_inicio DATE,
    categoria VARCHAR2(255)
);
