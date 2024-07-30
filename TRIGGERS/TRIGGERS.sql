

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

DECLARE
    CURSOR c_contratos IS
        SELECT ID_contrato, ID_empleado, fecha_inicio, fecha_fin, tipo
        FROM Contrato;

    v_fecha_inicio DATE;
    v_fecha_fin DATE;
    v_duracion NUMBER;
    v_num_periodos NUMBER;
    v_id_vacaciones VARCHAR2(20);
    v_counter NUMBER := 1;

BEGIN
    FOR contrato IN c_contratos LOOP
        v_num_periodos := ROUND(DBMS_RANDOM.VALUE(1, 4));

        FOR i IN 1..v_num_periodos LOOP
            v_duracion := ROUND(DBMS_RANDOM.VALUE(1, 6));

            IF contrato.tipo = 'Indefinido' THEN
                -- Para contratos indefinidos, la fecha de inicio de vacaciones debe ser mayor a la fecha de inicio del contrato
                v_fecha_inicio := contrato.fecha_inicio + TRUNC(DBMS_RANDOM.VALUE(1, 366));
                v_fecha_fin := v_fecha_inicio + v_duracion - 1;
            ELSE
                -- Para contratos formativos, la fecha de inicio de vacaciones debe estar dentro del rango del contrato
                IF contrato.fecha_fin - contrato.fecha_inicio >= v_duracion THEN
                    v_fecha_inicio := contrato.fecha_inicio + TRUNC(DBMS_RANDOM.VALUE(0, contrato.fecha_fin - contrato.fecha_inicio - v_duracion + 1));
                    v_fecha_fin := v_fecha_inicio + v_duracion - 1;
                ELSE
                    v_fecha_inicio := NULL;
                    v_fecha_fin := NULL;
                END IF;
            END IF;

            -- Verificar que las fechas generadas sean válidas y cumplan con el rango del contrato
            IF v_fecha_inicio IS NOT NULL AND v_fecha_fin IS NOT NULL AND
               v_fecha_inicio <= v_fecha_fin AND
               (contrato.tipo = 'Indefinido' OR (v_fecha_inicio >= contrato.fecha_inicio AND v_fecha_fin <= contrato.fecha_fin)) THEN
                v_id_vacaciones := 'VAC-' || LPAD(v_counter, 5, '0');

                INSERT INTO Vacaciones (ID_vacaciones, ID_empleado, fecha_inicio, fecha_fin)
                VALUES (v_id_vacaciones, contrato.ID_empleado, v_fecha_inicio, v_fecha_fin);
                v_counter := v_counter + 1;
            END IF;
        END LOOP;
    END LOOP;
END;
