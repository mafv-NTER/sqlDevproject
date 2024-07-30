-- Eliminar tablas si existen para evitar conflictos
DROP TABLE Oficina CASCADE CONSTRAINTS;
DROP TABLE Info_Empleado_Personal CASCADE CONSTRAINTS;
DROP TABLE Info_Empleado_Contacto CASCADE CONSTRAINTS;
DROP TABLE Departamento CASCADE CONSTRAINTS;
DROP TABLE Info_Empleado_Localizacion CASCADE CONSTRAINTS;
DROP TABLE Info_Empleado_Laboral CASCADE CONSTRAINTS;
DROP TABLE Contrato CASCADE CONSTRAINTS;
DROP TABLE Nomina CASCADE CONSTRAINTS;
DROP TABLE Vacaciones CASCADE CONSTRAINTS;
DROP TABLE Tecnologia CASCADE CONSTRAINTS;
DROP TABLE Formacion CASCADE CONSTRAINTS;
DROP TABLE Evaluacion CASCADE CONSTRAINTS;
DROP TABLE Empresa CASCADE CONSTRAINTS;
DROP TABLE Afiliados CASCADE CONSTRAINTS;
DROP TABLE Cliente CASCADE CONSTRAINTS;
DROP TABLE Proyecto CASCADE CONSTRAINTS;
DROP TABLE Empleado_Proyecto CASCADE CONSTRAINTS;
DROP TABLE Proyecto_Tecnologia CASCADE CONSTRAINTS;
DROP TABLE Material CASCADE CONSTRAINTS;
DROP TABLE Material_Empleado CASCADE CONSTRAINTS;

DROP SEQUENCE seq_oficina_id;
DROP SEQUENCE seq_empleado_id;
DROP SEQUENCE seq_departamento_id;
DROP SEQUENCE seq_contrato_id;
DROP SEQUENCE seq_nomina_id;
DROP SEQUENCE seq_vacaciones_id;
DROP SEQUENCE seq_tecnologia_id;
DROP SEQUENCE seq_formacion_id;
DROP SEQUENCE seq_evaluacion_id;
DROP SEQUENCE seq_cliente_id;
DROP SEQUENCE seq_proyecto_id;
DROP SEQUENCE seq_material_id;

CREATE TABLE Oficina (
    ID_oficina VARCHAR2(20) PRIMARY KEY,
    Direccion VARCHAR2(255) NOT NULL,
    Edificio VARCHAR2(40),
    Ciudad VARCHAR2(20) NOT NULL,
    Codigo_postal VARCHAR2(20) NOT NULL
);

ALTER TABLE oficina
ADD CONSTRAINT ck_cp_oficina CHECK (REGEXP_LIKE(codigo_postal, '^\d{5}$'));

ALTER TABLE oficina
ADD CONSTRAINT ck_ciudad_oficina CHECK (REGEXP_LIKE(ciudad, '[A-Za-z]$'));

CREATE TABLE Info_Empleado_Personal (
    ID_empleado VARCHAR2(20) PRIMARY KEY,
    DNI VARCHAR2(20) NOT NULL UNIQUE,
    Nombre VARCHAR2(100) NOT NULL,
    Apellido1 VARCHAR2(100) NOT NULL,
    Apellido2 VARCHAR2(100),
    Foto BLOB,
    Fecha_nacimiento DATE NOT NULL,
    SEXO VARCHAR2(10) CHECK (SEXO IN ('H', 'M', 'OTRO')),
    ID_mentor VARCHAR2(20),
    Profesion VARCHAR2(100)
);

ALTER TABLE Info_Empleado_Personal
ADD CONSTRAINT ck_apellido1_empleado CHECK (REGEXP_LIKE(Apellido1, '^[A-Za-z ]+$'));

ALTER TABLE Info_Empleado_Personal
ADD CONSTRAINT ck_apellido2_empleado CHECK (REGEXP_LIKE(Apellido2, '^[A-Za-z ]*$'));

ALTER TABLE Info_Empleado_Personal
ADD CONSTRAINT ck_profesion_empleado CHECK (REGEXP_LIKE(Profesion, '^[A-Za-z ]+$'));

CREATE TABLE Info_Empleado_Contacto (
    ID_empleado VARCHAR2(20),
    Telefono VARCHAR2(20) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Direccion VARCHAR2(255) NOT NULL,
    Codigo_postal VARCHAR2(5) NOT NULL --Cambiado a longitud maxima de 5 porque CP tiene 5 numeros
);

ALTER TABLE Info_Empleado_Contacto
ADD CONSTRAINT FK_Info_Empleado_Contacto_Personal FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal (ID_empleado) ON DELETE CASCADE;

ALTER TABLE Info_Empleado_Contacto
ADD CONSTRAINT ck_cp_empleado  CHECK (REGEXP_LIKE(codigo_postal, '^\d{5}$'));

ALTER TABLE Info_Empleado_Contacto
ADD CONSTRAINT ck_telefono_contacto CHECK (REGEXP_LIKE(Telefono, '^\+\d{1,3}\s?\d{1,10}$'));

ALTER TABLE Info_Empleado_Contacto
ADD CONSTRAINT ck_email_contacto CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));

CREATE TABLE Departamento (
    ID_departamento VARCHAR2(20) PRIMARY KEY,
    Nombre VARCHAR2(100) NOT NULL,
    ID_TechLead VARCHAR2(20)
);

ALTER TABLE Departamento
ADD CONSTRAINT ck_nombre_departamento CHECK (REGEXP_LIKE(Nombre, '^[A-Za-z ]+$'));

ALTER TABLE Departamento
ADD CONSTRAINT FK_Departamento_TechLead FOREIGN KEY (ID_TechLead) REFERENCES Info_Empleado_Personal(ID_empleado);

CREATE TABLE Info_Empleado_Localizacion (
    ID_empleado VARCHAR2(20),
    ID_departamento VARCHAR2(20),
    ID_oficina VARCHAR2(20),
    Ubicacion_oficina VARCHAR2(50)
);

ALTER TABLE Info_Empleado_Localizacion
ADD CONSTRAINT FK_Info_Empleado_Localizacion_Personal FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal (ID_empleado) ON DELETE CASCADE;

ALTER TABLE Info_Empleado_Localizacion
ADD CONSTRAINT FK_Info_Empleado_Localizacion_Departamento FOREIGN KEY (ID_departamento) REFERENCES Departamento(ID_departamento);

ALTER TABLE Info_Empleado_Localizacion
ADD CONSTRAINT FK_Info_Empleado_Localizacion_Oficina FOREIGN KEY (ID_oficina) REFERENCES Oficina(ID_oficina);

CREATE TABLE Info_Empleado_Laboral (
    ID_empleado VARCHAR2(20),
    Rol VARCHAR2(100),
    AniosExperiencia NUMBER(3,1),
    TipoEmpleado VARCHAR2(50) NOT NULL CHECK (TipoEmpleado IN ('ALUMNO', 'GENERAL')),
    Cargo VARCHAR2(100)
);

ALTER TABLE Info_Empleado_Laboral
ADD CONSTRAINT FK_Info_Empleado_Laboral_Personal FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal (ID_empleado) ON DELETE CASCADE;

ALTER TABLE Info_Empleado_Laboral
ADD CONSTRAINT ck_rol_laboral CHECK (REGEXP_LIKE(Rol, '^[A-Za-z ]+$'));

ALTER TABLE Info_Empleado_Laboral
ADD CONSTRAINT ck_cargo_laboral CHECK (REGEXP_LIKE(Cargo, '^[A-Za-z ]+$'));

CREATE TABLE Contrato (
    ID_contrato VARCHAR2(125) PRIMARY KEY,
    ID_empleado VARCHAR2(20),
    descripcion VARCHAR2(255),
    fecha_inicio DATE DEFAULT SYSDATE NOT NULL,
    fecha_fin DATE,
    tipo VARCHAR2(100) NOT NULL CHECK (UPPER(tipo)  IN ('INDEFINIDO', 'FORMATIVO')),
    salario NUMBER(8,2) NOT NULL, -- este salario se expresa en año
    CONSTRAINT ck_fecha_contrato CHECK (fecha_fin IS NULL OR fecha_inicio <= fecha_fin)
);

ALTER TABLE Contrato
ADD CONSTRAINT FK_empleado_contrato FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

CREATE TABLE Nomina (
    ID_nomina VARCHAR2(20) PRIMARY KEY,
    ID_empleado VARCHAR2(20),
    fecha DATE NOT NULL,
    salario_base NUMBER(8,2) NOT NULL, -- el salario base se expresa en meses
    Remuneracion_variable NUMBER(8,2)
);

ALTER TABLE Nomina
ADD CONSTRAINT FK_empleado_nomina FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

CREATE TABLE Vacaciones (
    ID_vacaciones VARCHAR2(20) PRIMARY KEY,
    ID_empleado VARCHAR2(20),
    fecha_inicio DATE DEFAULT SYSDATE NOT NULL,
    fecha_fin DATE NOT NULL,
    CONSTRAINT ck_fecha_vacaciones CHECK (fecha_inicio <= fecha_fin)
);

ALTER TABLE Vacaciones
ADD CONSTRAINT FK_empleado_vacaciones FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

CREATE TABLE Tecnologia (
    ID_tecnologia VARCHAR2(20) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(255)
);

ALTER TABLE Tecnologia
ADD CONSTRAINT ck_nombre_tecnologia CHECK (REGEXP_LIKE(nombre, '^[A-Za-z ]+$'));

CREATE TABLE Formacion(
    ID_Formacion VARCHAR2(20) PRIMARY KEY,
    ID_Tecnologia VARCHAR2(20),
    ID_Departamento VARCHAR2(20),
    Fecha_Inicio DATE DEFAULT SYSDATE NOT NULL,
    Fecha_fin DATE,
    ID_empleado VARCHAR2(20),
    CONSTRAINT ck_fecha_formacion CHECK (Fecha_fin IS NULL OR Fecha_Inicio <= Fecha_fin)
);

ALTER TABLE Formacion
ADD CONSTRAINT FK_formacion_empleado FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

ALTER TABLE Formacion
ADD CONSTRAINT FK_formacion_Tecnologia FOREIGN KEY (ID_Tecnologia) REFERENCES Tecnologia(ID_tecnologia);

ALTER TABLE Formacion
ADD CONSTRAINT FK_formacion_Departamento FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_departamento);

CREATE TABLE Evaluacion (
    ID_evaluacion VARCHAR2(20) PRIMARY KEY,
    ID_formacion VARCHAR2(20),
    ID_empleado VARCHAR2(20),
    Fecha_evaluacion DATE DEFAULT SYSDATE NOT NULL,
    Fichero_Evaluacion BLOB,
    Nota NUMBER(4,2) NOT NULL CHECK ( Nota BETWEEN 0 AND 10 ),
    Observaciones VARCHAR2(255)
);

ALTER TABLE Evaluacion
ADD CONSTRAINT FK_Evaluacion_Formacion FOREIGN KEY (ID_formacion) REFERENCES Formacion(ID_Formacion);

ALTER TABLE Evaluacion
ADD CONSTRAINT FK_Evaluacion_Empleado FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

CREATE TABLE Empresa (
    Nombre VARCHAR2(255) PRIMARY KEY,
    Descripcion VARCHAR2(255),
    Telefono VARCHAR2(15) NOT NULL,
    Email VARCHAR2(255) NOT NULL,
    Localizacion VARCHAR2(255)
);

ALTER TABLE Empresa
ADD CONSTRAINT ck_telefono_empresa CHECK (REGEXP_LIKE(Telefono, '^\+\d{1,3}\s?\d{1,10}$'));

ALTER TABLE Empresa
ADD CONSTRAINT ck_email_empresa CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));

ALTER TABLE Empresa
ADD CONSTRAINT ck_nombre_empresa CHECK (REGEXP_LIKE(Nombre, '^[A-Za-z ]+$'));

ALTER TABLE Empresa
ADD CONSTRAINT ck_localizacion_empresa CHECK (REGEXP_LIKE(Localizacion, '^[A-Za-z ]+$'));

CREATE TABLE Afiliados (
    CIF_empresa VARCHAR2(40) PRIMARY KEY,
    Nombre VARCHAR2(255) NOT NULL,
    Descripcion VARCHAR2(255),
    Localizacion VARCHAR2(255),
    Telefono VARCHAR(20) NOT NULL,
    Email VARCHAR2(40) NOT NULL
);

ALTER TABLE Afiliados
ADD CONSTRAINT ck_telefono_afiliados CHECK (REGEXP_LIKE(Telefono, '^\+\d{1,3}\s?\d{1,10}$'));

ALTER TABLE Afiliados
ADD CONSTRAINT ck_email_afiliados CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));

ALTER TABLE Afiliados
ADD CONSTRAINT ck_nombre_afiliados CHECK (REGEXP_LIKE(Nombre, '^[A-Za-z ]+$'));

ALTER TABLE Afiliados
ADD CONSTRAINT ck_localizacion_afiliados CHECK (REGEXP_LIKE(Localizacion, '^[A-Za-z ]+$'));

CREATE TABLE Cliente (
    ID_cliente VARCHAR2(40) PRIMARY KEY,
    CIF_empresa VARCHAR2(40),
    Nombre VARCHAR2(255) NOT NULL,
    Descripcion VARCHAR2(255),
    Localizacion VARCHAR2(255),
    Telefono VARCHAR2(15) NOT NULL,
    Email VARCHAR2(40) NOT NULL
);

ALTER TABLE Cliente
ADD CONSTRAINT ck_telefono_cliente CHECK (REGEXP_LIKE(Telefono, '^\+\d{1,3}\s?\d{1,10}$'));

ALTER TABLE Cliente
ADD CONSTRAINT ck_email_cliente CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));

ALTER TABLE Cliente
ADD CONSTRAINT FK_proyecto_cliente FOREIGN KEY (CIF_empresa) REFERENCES Afiliados(CIF_empresa);

ALTER TABLE Cliente
ADD CONSTRAINT ck_nombre_cliente CHECK (REGEXP_LIKE(Nombre, '^[A-Za-z ]+$'));


CREATE TABLE Proyecto (
    ID_proyecto VARCHAR2(40) PRIMARY KEY,
    ID_cliente VARCHAR2(40) NOT NULL,
    Nombre VARCHAR2(255) NOT NULL,
    Descripcion VARCHAR2(255),
    Fecha_inicio DATE DEFAULT SYSDATE NOT NULL,
    Fecha_fin DATE,
    CONSTRAINT ck_fecha_proyecto CHECK (Fecha_fin IS NULL OR Fecha_inicio <= Fecha_fin)
);

ALTER TABLE Proyecto
ADD CONSTRAINT FK_cliente_proyecto FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente);

ALTER TABLE Proyecto
ADD CONSTRAINT ck_nombre_proyecto CHECK (REGEXP_LIKE(Nombre, '^[A-Za-z ]+$'));

CREATE TABLE Empleado_Proyecto (
    ID_empleado VARCHAR2(20),
    ID_proyecto VARCHAR2(40),
    Rol VARCHAR2(100)
);

ALTER TABLE Empleado_Proyecto
ADD CONSTRAINT FK_Empleado_Proyecto_Empleado FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

ALTER TABLE Empleado_Proyecto
ADD CONSTRAINT ck_rol_empleado_proyecto CHECK (REGEXP_LIKE(Rol, '^[A-Za-z ]+$'));

ALTER TABLE Empleado_Proyecto
ADD CONSTRAINT FK_Empleado_Proyecto_Proyecto FOREIGN KEY (ID_proyecto) REFERENCES Proyecto(ID_proyecto);

CREATE TABLE Proyecto_Tecnologia (
    ID_proyecto VARCHAR2(40),
    ID_tecnologia VARCHAR2(20)
);

ALTER TABLE Proyecto_Tecnologia
ADD CONSTRAINT FK_Proyecto_Tecnologia_Proyecto FOREIGN KEY (ID_proyecto) REFERENCES Proyecto(ID_proyecto);

ALTER TABLE Proyecto_Tecnologia
ADD CONSTRAINT FK_Proyecto_Tecnologia_Tecnologia FOREIGN KEY (ID_tecnologia) REFERENCES Tecnologia(ID_tecnologia);

CREATE TABLE Material (
    ID_material VARCHAR2(20) PRIMARY KEY,
    Nombre VARCHAR2(255) NOT NULL,
    Descripcion VARCHAR2(255),
    Tipo VARCHAR2(12) NOT NULL CHECK (Tipo IN ('Hardware', 'Software', 'Accesorios', 'Licencia')),
    Cantidad_disponible NUMBER
);

ALTER TABLE Material
ADD CONSTRAINT ck_nombre_material CHECK (REGEXP_LIKE(Nombre, '^[A-Za-z -]+$'));

CREATE TABLE Material_Empleado (
    ID_material VARCHAR2(20),
    ID_empleado VARCHAR2(20),
    Fecha_asignacion DATE DEFAULT SYSDATE NOT NULL,
    Fecha_devolucion DATE,
    CONSTRAINT ck_fecha_material_empleado CHECK (Fecha_devolucion IS NULL OR Fecha_asignacion <= Fecha_devolucion)
);

ALTER TABLE Material_Empleado
ADD CONSTRAINT FK_Material_Empleado_Material FOREIGN KEY (ID_material) REFERENCES Material(ID_material);

ALTER TABLE Material_Empleado
ADD CONSTRAINT FK_Material_Empleado_Empleado FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);



