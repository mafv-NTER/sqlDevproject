

-- Trigger para controlar fecha de las nóminas con respecto a la fecha de inicio del contrato asociado
CREATE OR REPLACE TRIGGER trg_nomina_fecha
BEFORE INSERT OR UPDATE ON Nomina
FOR EACH ROW
DECLARE
    v_fecha_inicio DATE;
BEGIN
    SELECT fecha_inicio INTO v_fecha_inicio
    FROM Contrato
    WHERE ID_empleado = :NEW.ID_empleado
    AND fecha_inicio <= :NEW.fecha;
    
    IF :NEW.fecha < v_fecha_inicio THEN
        RAISE_APPLICATION_ERROR(-20004, 'La fecha de la nómina no puede ser menor que la fecha de inicio del contrato asociado.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20005, 'No se encontró un contrato válido para este empleado.');
END;
/
-- Trigger para actualizar la cantidad_disponible cuando se asigne un material a un empleado
CREATE OR REPLACE TRIGGER trg_update_cantidad_disponible
AFTER INSERT OR DELETE ON Material_Empleado
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE Material
        SET Cantidad_disponible = Cantidad_disponible - 1
        WHERE ID_material = :NEW.ID_material;
    ELSIF DELETING THEN
        UPDATE Material
        SET Cantidad_disponible = Cantidad_disponible + 1
        WHERE ID_material = :OLD.ID_material;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER check_vacaciones_dates
BEFORE INSERT OR UPDATE ON Vacaciones
FOR EACH ROW
DECLARE
    v_fecha_inicio DATE;
    v_fecha_fin DATE;
BEGIN
    SELECT c.fecha_inicio, c.fecha_fin
    INTO v_fecha_inicio, v_fecha_fin
    FROM Contrato c
    WHERE c.ID_empleado = :NEW.ID_empleado
    AND c.fecha_inicio <= :NEW.fecha_inicio
    AND (c.fecha_fin IS NULL OR c.fecha_fin >= :NEW.fecha_fin);

    IF :NEW.fecha_inicio < v_fecha_inicio OR
       (v_fecha_fin IS NOT NULL AND :NEW.fecha_fin > v_fecha_fin) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Las fechas de vacaciones están fuera del rango del contrato.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se encontró un contrato válido para el empleado en las fechas especificadas.');
END;
/
