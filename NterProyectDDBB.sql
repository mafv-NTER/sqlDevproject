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

-- Crear tabla Oficina
CREATE TABLE Oficina (
    ID_oficina VARCHAR2(20) PRIMARY KEY,
    Direccion VARCHAR2(255) NOT NULL,
    Edificio VARCHAR2(40),
    Ciudad VARCHAR2(20) NOT NULL,
    Codigo_postal VARCHAR2(20) NOT NULL
);

-- Crear tabla Info_Empleado_Personal
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

-- Crear tabla Info_Empleado_Contacto
CREATE TABLE Info_Empleado_Contacto (
    ID_empleado VARCHAR2(20),
    Telefono VARCHAR2(20) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Direccion VARCHAR2(255) NOT NULL,
    Codigo_postal VARCHAR2(20) NOT NULL
);

ALTER TABLE Info_Empleado_Contacto
ADD CONSTRAINT FK_Info_Empleado_Contacto_Personal FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal (ID_empleado) ON DELETE CASCADE;

ALTER TABLE Info_Empleado_Contacto
ADD CONSTRAINT ck_telefono_contacto CHECK (REGEXP_LIKE(Telefono, '^\+\d{1,3}\s?\d{1,10}$'));

ALTER TABLE Info_Empleado_Contacto
ADD CONSTRAINT ck_email_contacto CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));

-- Crear tabla Departamento
CREATE TABLE Departamento (
    ID_departamento VARCHAR2(20) PRIMARY KEY,
    Nombre VARCHAR2(100) NOT NULL,
    ID_TechLead VARCHAR2(20)
);

ALTER TABLE Departamento
ADD CONSTRAINT FK_Departamento_TechLead FOREIGN KEY (ID_TechLead) REFERENCES Info_Empleado_Personal(ID_empleado);

-- Crear tabla Info_Empleado_Localizacion
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

-- Crear tabla Info_Empleado_Laboral
CREATE TABLE Info_Empleado_Laboral (
    ID_empleado VARCHAR2(20),
    Rol VARCHAR2(100),
    AniosExperiencia NUMBER(3,1),
    TipoEmpleado VARCHAR2(50) NOT NULL CHECK (TipoEmpleado IN ('ALUMNO', 'GENERAL')),
    Cargo VARCHAR2(100)
);

ALTER TABLE Info_Empleado_Laboral
ADD CONSTRAINT FK_Info_Empleado_Laboral_Personal FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal (ID_empleado) ON DELETE CASCADE;

-- Crear tabla Contrato
CREATE TABLE Contrato (
    ID_contrato VARCHAR2(125) PRIMARY KEY,
    ID_empleado VARCHAR2(20),
    descripcion VARCHAR2(255),
    fecha_inicio DATE DEFAULT SYSDATE NOT NULL,
    fecha_fin DATE,
    tipo VARCHAR2(100) NOT NULL,
    salario NUMBER(7,2) NOT NULL -- este salario se expresa en año
);

ALTER TABLE Contrato
ADD CONSTRAINT FK_empleado_contrato FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

-- Crear tabla Nomina
CREATE TABLE Nomina (
    ID_nomina VARCHAR2(20) PRIMARY KEY,
    ID_empleado VARCHAR2(20),
    fecha DATE NOT NULL,
    salario_base NUMBER(6,2) NOT NULL, -- el salario base se expresa en meses
    Remuneracion_variable NUMBER(5,2)
);

ALTER TABLE Nomina
ADD CONSTRAINT FK_empleado_nomina FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

-- Crear tabla Vacaciones
CREATE TABLE Vacaciones (
    ID_vacaciones VARCHAR2(20) PRIMARY KEY,
    ID_empleado VARCHAR2(20),
    fecha_inicio DATE DEFAULT SYSDATE NOT NULL,
    fecha_fin DATE NOT NULL
);

ALTER TABLE Vacaciones
ADD CONSTRAINT FK_empleado_vacaciones FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

-- Crear tabla Tecnologia
CREATE TABLE Tecnologia (
    ID_tecnologia VARCHAR2(20) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(255)
);

-- Crear tabla Formacion
CREATE TABLE Formacion(
    ID_Formacion VARCHAR2(20) PRIMARY KEY,
    ID_Tecnologia VARCHAR2(20),
    ID_Departamento VARCHAR2(20),
    Fecha_Inicio DATE DEFAULT SYSDATE NOT NULL,
    Fecha_fin DATE,
    ID_empleado VARCHAR2(20)
);

ALTER TABLE Formacion
ADD CONSTRAINT FK_formacion_empleado FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

ALTER TABLE Formacion
ADD CONSTRAINT FK_formacion_Tecnologia FOREIGN KEY (ID_Tecnologia) REFERENCES Tecnologia(ID_tecnologia);

ALTER TABLE Formacion
ADD CONSTRAINT FK_formacion_Departamento FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_departamento);

-- Crear tabla Evaluacion
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


-- En esta tabla se registra las empresas que colabioran o trabajan con Nter(ejemplo: centros educativos u otras empresas)
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

-- Crear tabla Afiliados
CREATE TABLE Afiliados (
    CIF_empresa VARCHAR2(40) PRIMARY KEY,
    Nombre VARCHAR2(255) NOT NULL,
    Descripcion VARCHAR2(255),
    Localizacion VARCHAR2(255),
    Telefono NUMBER(15) NOT NULL,
    Email VARCHAR2(40) NOT NULL
);

ALTER TABLE Afiliados
ADD CONSTRAINT ck_telefono_afiliados CHECK (REGEXP_LIKE(Telefono, '^\+\d{1,3}\s?\d{1,10}$'));

ALTER TABLE Afiliados
ADD CONSTRAINT ck_email_afiliados CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));

-- Crear tabla Cliente
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
ADD CONSTRAINT FK_afiliados_cliente FOREIGN KEY (CIF_empresa) REFERENCES Afiliados(CIF_empresa);

-- Crear tabla Proyecto
CREATE TABLE Proyecto (
    ID_proyecto VARCHAR2(40) PRIMARY KEY,
    ID_cliente VARCHAR2(40) NOT NULL,
    Nombre VARCHAR2(255) NOT NULL,
    Descripcion VARCHAR2(255),
    Fecha_inicio DATE DEFAULT SYSDATE NOT NULL,
    Fecha_fin DATE
);

ALTER TABLE Proyecto
ADD CONSTRAINT FK_proyecto_cliente FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente);

-- Crear tabla Empleado_Proyecto
CREATE TABLE Empleado_Proyecto (
    ID_empleado VARCHAR2(20),
    ID_proyecto VARCHAR2(40),
    Rol VARCHAR2(100)
);

ALTER TABLE Empleado_Proyecto
ADD CONSTRAINT FK_Empleado_Proyecto_Empleado FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

ALTER TABLE Empleado_Proyecto
ADD CONSTRAINT FK_Empleado_Proyecto_Proyecto FOREIGN KEY (ID_proyecto) REFERENCES Proyecto(ID_proyecto);


-- Crear tabla Proyecto_Tecnologia
CREATE TABLE Proyecto_Tecnologia (
    ID_proyecto VARCHAR2(40),
    ID_tecnologia VARCHAR2(20)
);

ALTER TABLE Proyecto_Tecnologia
ADD CONSTRAINT FK_Proyecto_Tecnologia_Proyecto FOREIGN KEY (ID_proyecto) REFERENCES Proyecto(ID_proyecto);

ALTER TABLE Proyecto_Tecnologia
ADD CONSTRAINT FK_Proyecto_Tecnologia_Tecnologia FOREIGN KEY (ID_tecnologia) REFERENCES Tecnologia(ID_tecnologia);

-- Crear tabla Material
CREATE TABLE Material (
    ID_material VARCHAR2(20) PRIMARY KEY,
    Nombre VARCHAR2(255) NOT NULL,
    Descripcion VARCHAR2(255),
    Tipo VARCHAR2(100) NOT NULL,
    Cantidad_disponible NUMBER
);



-- Crear tabla Material_Empleado
CREATE TABLE Material_Empleado (
    ID_material VARCHAR2(20),
    ID_empleado VARCHAR2(20),
    Fecha_asignacion DATE DEFAULT SYSDATE NOT NULL,
    Fecha_devolucion DATE
);

ALTER TABLE Material_Empleado
ADD CONSTRAINT FK_Material_Empleado_Material FOREIGN KEY (ID_material) REFERENCES Material(ID_material);

ALTER TABLE Material_Empleado
ADD CONSTRAINT FK_Material_Empleado_Empleado FOREIGN KEY (ID_empleado) REFERENCES Info_Empleado_Personal(ID_empleado);

--(Re)Generación de las secuencias para triggers

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

CREATE SEQUENCE seq_oficina_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_empleado_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_departamento_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_contrato_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_nomina_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_vacaciones_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_tecnologia_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_formacion_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_evaluacion_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_cliente_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_proyecto_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_material_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

--Generación de triggers
-- Trigger para la tabla Oficina
CREATE OR REPLACE TRIGGER trg_oficina_id
BEFORE INSERT ON Oficina
FOR EACH ROW
BEGIN
    SELECT 'OFI-' || LPAD(seq_oficina_id.NEXTVAL, 5, '0') INTO :NEW.ID_oficina FROM dual;
END;
/

-- Trigger para la tabla Info_Empleado_Personal
CREATE OR REPLACE TRIGGER trg_info_empleado_personal_id
BEFORE INSERT ON Info_Empleado_Personal
FOR EACH ROW
BEGIN
    SELECT 'EMP-' || LPAD(seq_empleado_id.NEXTVAL, 5, '0') INTO :NEW.ID_empleado FROM dual;
END;
/

-- Trigger para la tabla Departamento
CREATE OR REPLACE TRIGGER trg_departamento_id
BEFORE INSERT ON Departamento
FOR EACH ROW
BEGIN
    SELECT 'DEP-' || LPAD(seq_departamento_id.NEXTVAL, 5, '0') INTO :NEW.ID_departamento FROM dual;
END;
/

-- Trigger para la tabla Contrato
CREATE OR REPLACE TRIGGER trg_contrato_id
BEFORE INSERT ON Contrato
FOR EACH ROW
BEGIN
    SELECT 'CON-' || LPAD(seq_contrato_id.NEXTVAL, 5, '0') INTO :NEW.ID_contrato FROM dual;
END;
/

-- Trigger para la tabla Nomina
CREATE OR REPLACE TRIGGER trg_nomina_id
BEFORE INSERT ON Nomina
FOR EACH ROW
BEGIN
    SELECT 'NOM-' || LPAD(seq_nomina_id.NEXTVAL, 5, '0') INTO :NEW.ID_nomina FROM dual;
END;
/

-- Trigger para la tabla Vacaciones
CREATE OR REPLACE TRIGGER trg_vacaciones_id
BEFORE INSERT ON Vacaciones
FOR EACH ROW
BEGIN
    SELECT 'VAC-' || LPAD(seq_vacaciones_id.NEXTVAL, 5, '0') INTO :NEW.ID_vacaciones FROM dual;
END;
/

-- Trigger para la tabla Tecnologia
CREATE OR REPLACE TRIGGER trg_tecnologia_id
BEFORE INSERT ON Tecnologia
FOR EACH ROW
BEGIN
    SELECT 'TEC-' || LPAD(seq_tecnologia_id.NEXTVAL, 5, '0') INTO :NEW.ID_tecnologia FROM dual;
END;
/

-- Trigger para la tabla Formacion
CREATE OR REPLACE TRIGGER trg_formacion_id
BEFORE INSERT ON Formacion
FOR EACH ROW
BEGIN
    SELECT 'FOR-' || LPAD(seq_formacion_id.NEXTVAL, 5, '0') INTO :NEW.ID_Formacion FROM dual;
END;
/

-- Trigger para la tabla Evaluacion
CREATE OR REPLACE TRIGGER trg_evaluacion_id
BEFORE INSERT ON Evaluacion
FOR EACH ROW
BEGIN
    SELECT 'EVA-' || LPAD(seq_evaluacion_id.NEXTVAL, 5, '0') INTO :NEW.ID_evaluacion FROM dual;
END;
/

-- Trigger para la tabla Cliente
CREATE OR REPLACE TRIGGER trg_cliente_id
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
    SELECT 'CLI-' || LPAD(seq_cliente_id.NEXTVAL, 5, '0') INTO :NEW.ID_cliente FROM dual;
END;
/

-- Trigger para la tabla Proyecto
CREATE OR REPLACE TRIGGER trg_proyecto_id
BEFORE INSERT ON Proyecto
FOR EACH ROW
BEGIN
    SELECT 'PRO-' || LPAD(seq_proyecto_id.NEXTVAL, 5, '0') INTO :NEW.ID_proyecto FROM dual;
END;
/

-- Trigger para la tabla Material
CREATE OR REPLACE TRIGGER trg_material_id
BEFORE INSERT ON Material
FOR EACH ROW
BEGIN
    SELECT 'MAT-' || LPAD(seq_material_id.NEXTVAL, 5, '0') INTO :NEW.ID_material FROM dual;
END;
/