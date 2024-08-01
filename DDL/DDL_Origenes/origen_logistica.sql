DROP TABLE Material_Empleado;
DROP TABLE Material;


CREATE TABLE Material (
    ID_material VARCHAR2(20),
    nombre VARCHAR2(255),
    descripcion VARCHAR2(255),
    categoria VARCHAR2(255),
    cantidad_disponible NUMBER
);

CREATE TABLE Material_Empleado (
    ID_material VARCHAR2(20),
    ID_empleado VARCHAR2(20),
    Fecha_entrega DATE,
    fecha_devolucion DATE
);
