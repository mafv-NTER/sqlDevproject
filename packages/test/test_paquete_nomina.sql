/*
*   Este fichero se encarga de testear las diferentes funcionalidades
    del paquete para la gestión de nóminas, contratos y vacaciones
    de la base de datos.
    Para cada procedimiento, hay un test y su salida esperada (la salida
    expresada mediante un comentario justo debajo de la última línea
    de cada test).
*/
SET SERVEROUTPUT ON;

-- Pruebas para los procedimientos del paquete_nomina

-- Registrar nueva nómina
EXEC paquete_nomina.registrar_nueva_nomina('NOM-00001', 'EMP-00001', SYSDATE, 3000, 500); 
-- Procedimiento PL/SQL terminado correctamente

-- Actualizar nómina
EXEC paquete_nomina.actualizar_nomina('NOM-00001', 'EMP-00001', SYSDATE, 3200, 600);
-- Procedimiento PL/SQL terminado correctamente

-- Obtener nóminas por empleado
DECLARE
    v_nominas SYS_REFCURSOR;
    v_id_nomina VARCHAR2(125);
    v_id_empleado VARCHAR2(125);
    v_fecha DATE;
    v_salario_base NUMBER;
    v_rem_variable NUMBER;
BEGIN
    paquete_nomina.obtener_nominas_por_empleado('EMP-00001', v_nominas);
    LOOP
        FETCH v_nominas INTO v_id_nomina, v_id_empleado, v_fecha, v_salario_base, v_rem_variable;
        EXIT WHEN v_nominas%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Nómina: ' || v_id_nomina || ', ID Empleado: ' || v_id_empleado || ', Fecha: ' || v_fecha || ', Salario Base: ' || v_salario_base || ', Rem. Variable: ' || v_rem_variable);
    END LOOP;
    CLOSE v_nominas;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener nóminas por empleado: ' || SQLERRM);
END;
/
-- ID Nómina: NOM-00001, ID Empleado: EMP-00001, Fecha: <fecha>, Salario Base: 3200, Rem. Variable: 600

-- Registrar nuevo contrato
EXEC paquete_nomina.registrar_nuevo_contrato('CON-00001', 'EMP-00001', 'Contrato indefinido', SYSDATE, ADD_MONTHS(SYSDATE, 12), 'Indefinido', 3000);
-- Procedimiento PL/SQL terminado correctamente

-- Actualizar contrato
EXEC paquete_nomina.actualizar_contrato('CON-00001', 'EMP-00001', 'Contrato temporal', SYSDATE, ADD_MONTHS(SYSDATE, 6), 'Temporal', 3200);
-- Procedimiento PL/SQL terminado correctamente

-- Obtener contratos por empleado
DECLARE
    v_contratos SYS_REFCURSOR;
    v_id_contrato VARCHAR2(125);
    v_id_empleado VARCHAR2(125);
    v_descripcion VARCHAR2(255);
    v_fecha_inicio DATE;
    v_fecha_fin DATE;
    v_tipo VARCHAR2(50);
    v_salario NUMBER;
BEGIN
    paquete_nomina.obtener_contratos_por_empleado('EMP-00001', v_contratos);
    LOOP
        FETCH v_contratos INTO v_id_contrato, v_id_empleado, v_descripcion, v_fecha_inicio, v_fecha_fin, v_tipo, v_salario;
        EXIT WHEN v_contratos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Contrato: ' || v_id_contrato || ', ID Empleado: ' || v_id_empleado || ', Descripción: ' || v_descripcion || ', Fecha Inicio: ' || v_fecha_inicio || ', Fecha Fin: ' || v_fecha_fin || ', Tipo: ' || v_tipo || ', Salario: ' || v_salario);
    END LOOP;
    CLOSE v_contratos;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener contratos por empleado: ' || SQLERRM);
END;
/
-- ID Contrato: CON-00001, ID Empleado: EMP-00001, Descripción: Contrato temporal, Fecha Inicio: <fecha>, Fecha Fin: <fecha>, Tipo: Temporal, Salario: 3200

-- Registrar vacaciones
EXEC paquete_nomina.registrar_vacaciones('VAC-00001', 'EMP-00001', SYSDATE, ADD_MONTHS(SYSDATE, 1));
-- Procedimiento PL/SQL terminado correctamente

-- Actualizar vacaciones
EXEC paquete_nomina.actualizar_vacaciones('VAC-00001', 'EMP-00001', SYSDATE, ADD_MONTHS(SYSDATE, 2));
-- Procedimiento PL/SQL terminado correctamente

-- Obtener vacaciones por empleado
DECLARE
    v_vacaciones SYS_REFCURSOR;
    v_id_vacaciones VARCHAR2(125);
    v_id_empleado VARCHAR2(125);
    v_fecha_inicio DATE;
    v_fecha_fin DATE;
BEGIN
    paquete_nomina.obtener_vacaciones_por_empleado('EMP-00001', v_vacaciones);
    LOOP
        FETCH v_vacaciones INTO v_id_vacaciones, v_id_empleado, v_fecha_inicio, v_fecha_fin;
        EXIT WHEN v_vacaciones%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Vacaciones: ' || v_id_vacaciones || ', ID Empleado: ' || v_id_empleado || ', Fecha Inicio: ' || v_fecha_inicio || ', Fecha Fin: ' || v_fecha_fin);
    END LOOP;
    CLOSE v_vacaciones;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener vacaciones por empleado: ' || SQLERRM);
END;
/
-- ID Vacaciones: VAC-00001, ID Empleado: EMP-00001, Fecha Inicio: <fecha>, Fecha Fin: <fecha>

-- Calcular salario total por empleado
DECLARE
    v_salario_total NUMBER;
BEGIN
    paquete_nomina.calcular_salario_total_por_empleado('EMP-00001', v_salario_total);
    DBMS_OUTPUT.PUT_LINE('Salario Total: ' || v_salario_total);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al calcular el salario total por empleado: ' || SQLERRM);
END;
/
-- Salario Total: 3200
