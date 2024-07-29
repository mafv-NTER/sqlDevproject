CREATE OR REPLACE PACKAGE paquete_nomina IS

  -- Procedimientos para gestionar nóminas
  PROCEDURE registrar_nueva_nomina(
    ID_nomina       IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    fecha           IN DATE,
    salario_base    IN NUMBER,
    rem_variable    IN NUMBER
  );

  PROCEDURE actualizar_nomina(
    ID_nomina       IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    fecha           IN DATE,
    salario_base    IN NUMBER,
    rem_variable    IN NUMBER
  );

  PROCEDURE obtener_nominas_por_empleado(
    ID_empleado     IN VARCHAR2,
    nominas         OUT SYS_REFCURSOR
  );

  -- Procedimientos para gestionar contratos
  PROCEDURE registrar_nuevo_contrato(
    ID_contrato     IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    descripcion     IN VARCHAR2,
    fecha_inicio    IN DATE,
    fecha_fin       IN DATE,
    tipo            IN VARCHAR2,
    salario         IN NUMBER
  );

  PROCEDURE actualizar_contrato(
    ID_contrato     IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    descripcion     IN VARCHAR2,
    fecha_inicio    IN DATE,
    fecha_fin       IN DATE,
    tipo            IN VARCHAR2,
    salario         IN NUMBER
  );

  PROCEDURE obtener_contratos_por_empleado(
    ID_empleado     IN VARCHAR2,
    contratos       OUT SYS_REFCURSOR
  );

  -- Procedimientos para gestionar vacaciones
  PROCEDURE registrar_vacaciones(
    ID_vacaciones   IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    fecha_inicio    IN DATE,
    fecha_fin       IN DATE
  );

  PROCEDURE actualizar_vacaciones(
    ID_vacaciones   IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    fecha_inicio    IN DATE,
    fecha_fin       IN DATE
  );

  PROCEDURE obtener_vacaciones_por_empleado(
    ID_empleado     IN VARCHAR2,
    vacaciones      OUT SYS_REFCURSOR
  );

  -- Procedimiento para calcular el salario total por empleado
  PROCEDURE calcular_salario_total_por_empleado(
    ID_empleado     IN VARCHAR2,
    salario_total   OUT NUMBER
  );

END paquete_nomina;
/

CREATE OR REPLACE PACKAGE BODY paquete_nomina IS

  PROCEDURE registrar_nueva_nomina(
    ID_nomina       IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    fecha           IN DATE,
    salario_base    IN NUMBER,
    rem_variable    IN NUMBER
  ) IS
  BEGIN
    INSERT INTO Nomina (ID_nomina, ID_empleado, fecha, salario_base, Remuneracion_variable)
    VALUES (ID_nomina, ID_empleado, fecha, salario_base, rem_variable);
  END registrar_nueva_nomina;

  PROCEDURE actualizar_nomina(
    ID_nomina       IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    fecha           IN DATE,
    salario_base    IN NUMBER,
    rem_variable    IN NUMBER
  ) IS
  BEGIN
    UPDATE Nomina
    SET ID_empleado = ID_empleado,
        fecha = fecha,
        salario_base = salario_base,
        Remuneracion_variable = rem_variable
    WHERE ID_nomina = ID_nomina;
  END actualizar_nomina;

  PROCEDURE obtener_nominas_por_empleado(
    ID_empleado     IN VARCHAR2,
    nominas         OUT SYS_REFCURSOR
  ) IS
  BEGIN
    OPEN nominas FOR
      SELECT * FROM Nomina
      WHERE ID_empleado = ID_empleado;
  END obtener_nominas_por_empleado;

  PROCEDURE registrar_nuevo_contrato(
    ID_contrato     IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    descripcion     IN VARCHAR2,
    fecha_inicio    IN DATE,
    fecha_fin       IN DATE,
    tipo            IN VARCHAR2,
    salario         IN NUMBER
  ) IS
  BEGIN
    INSERT INTO Contrato (ID_contrato, ID_empleado, descripcion, fecha_inicio, fecha_fin, tipo, salario)
    VALUES (ID_contrato, ID_empleado, descripcion, fecha_inicio, fecha_fin, tipo, salario);
  END registrar_nuevo_contrato;

  PROCEDURE actualizar_contrato(
    ID_contrato     IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    descripcion     IN VARCHAR2,
    fecha_inicio    IN DATE,
    fecha_fin       IN DATE,
    tipo            IN VARCHAR2,
    salario         IN NUMBER
  ) IS
  BEGIN
    UPDATE Contrato
    SET ID_empleado = ID_empleado,
        descripcion = descripcion,
        fecha_inicio = fecha_inicio,
        fecha_fin = fecha_fin,
        tipo = tipo,
        salario = salario
    WHERE ID_contrato = ID_contrato;
  END actualizar_contrato;

  PROCEDURE obtener_contratos_por_empleado(
    ID_empleado     IN VARCHAR2,
    contratos       OUT SYS_REFCURSOR
  ) IS
  BEGIN
    OPEN contratos FOR
      SELECT * FROM Contrato
      WHERE ID_empleado = ID_empleado;
  END obtener_contratos_por_empleado;

  PROCEDURE registrar_vacaciones(
    ID_vacaciones   IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    fecha_inicio    IN DATE,
    fecha_fin       IN DATE
  ) IS
  BEGIN
    INSERT INTO Vacaciones (ID_vacaciones, ID_empleado, fecha_inicio, fecha_fin)
    VALUES (ID_vacaciones, ID_empleado, fecha_inicio, fecha_fin);
  END registrar_vacaciones;

  PROCEDURE actualizar_vacaciones(
    ID_vacaciones   IN VARCHAR2,
    ID_empleado     IN VARCHAR2,
    fecha_inicio    IN DATE,
    fecha_fin       IN DATE
  ) IS
  BEGIN
    UPDATE Vacaciones
    SET ID_empleado = ID_empleado,
        fecha_inicio = fecha_inicio,
        fecha_fin = fecha_fin
    WHERE ID_vacaciones = ID_vacaciones;
  END actualizar_vacaciones;

  PROCEDURE obtener_vacaciones_por_empleado(
    ID_empleado     IN VARCHAR2,
    vacaciones      OUT SYS_REFCURSOR
  ) IS
  BEGIN
    OPEN vacaciones FOR
      SELECT * FROM Vacaciones
      WHERE ID_empleado = ID_empleado;
  END obtener_vacaciones_por_empleado;

  PROCEDURE calcular_salario_total_por_empleado(
    ID_empleado     IN VARCHAR2,
    salario_total   OUT NUMBER
  ) IS
  BEGIN
    SELECT SUM(salario_base + NVL(Remuneracion_variable, 0))
    INTO salario_total
    FROM Nomina
    WHERE ID_empleado = ID_empleado;
  END calcular_salario_total_por_empleado;

END paquete_nomina;
/

-- Trigger para validar fechas de contrato
CREATE OR REPLACE TRIGGER trg_validar_fechas_contrato
BEFORE INSERT OR UPDATE ON Contrato
FOR EACH ROW
BEGIN
  IF :NEW.fecha_inicio > :NEW.fecha_fin THEN
    RAISE_APPLICATION_ERROR(-20001, 'La fecha de inicio no puede ser posterior a la fecha de fin.');
  END IF;
END;
/
