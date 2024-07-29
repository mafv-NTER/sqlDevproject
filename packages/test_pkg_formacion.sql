/*
*   Este fichero se encarga de testear las diferentes funcionalidades
    del paquete para el bloque de FORMACI�N de la base de datos.
    Para cada procedure, hay un test y su salida esperada (la salida
    expresada mediante un comentario justo debajo de la �ltima l�nea
    de cada test).
*/
SET SERVEROUTPUT ON;

EXEC formacionpkg.RegFormacion('TEC-00001', 'DEP-006', SYSDATE, SYSDATE+3, 'EMP-00001'); 
-- Procedimiento PL/SQL terminado correctamente
EXEC formacionpkg.actualizarformacion('FOR-00001', 'TEC-00002', 'DEP-006', ADD_MONTHS(DATE '2024-06-28', 1), ADD_MONTHS(SYSDATE, 3), 'EMP-00002');
-- Procedimiento PL/SQL terminado correctamente

BEGIN
    FormacionPkg.RegEvaluacion(
        p_id_formacion => 'FOR-00001',
        p_nota => 8,
        p_fecha_evaluacion => TO_DATE('2023-12-15', 'YYYY-MM-DD'),
        p_observaciones => 'Buen rendimiento',
        p_id_empleado => 'EMP-00001'
    );
    DBMS_OUTPUT.PUT_LINE('Evaluaci�n registrada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al registrar evaluaci�n: ' || SQLERRM);
END;
/
-- Evaluacion registrada correctamente.


BEGIN
    FormacionPkg.ActualizarEvaluacion(
        p_id_evaluacion => 'EVA-00001',
        p_id_formacion => 'FOR-00002',
        p_nota => 9,
        p_fecha_evaluacion => TO_DATE('2023-12-20', 'YYYY-MM-DD'),
        p_observaciones => 'Excelente rendimiento',
        p_id_empleado => 'EMP-00002'
    );
    DBMS_OUTPUT.PUT_LINE('Evaluaci�n actualizada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar evaluaci�n: ' || SQLERRM);
END;
/
-- Evaluacion actualizada correctamente.

--SELECT * FROM USER_CONSTRAINTS WHERE table_name='EVALUACION'

DECLARE
    v_resultado SYS_REFCURSOR;
    v_id_formacion VARCHAR2(125) := 'FOR-00001';
    v_id_evaluacion VARCHAR2(125);
    v_id_empleado VARCHAR2(125);
    v_fichero_eval BLOB;
    v_nota NUMBER;
    v_fecha_evaluacion DATE;
    v_observaciones VARCHAR2(200);
BEGIN
    FormacionPkg.ObtenerEvaluacionesPorFormacion(p_id_formacion => v_id_formacion, p_resultado => v_resultado);
    LOOP
        FETCH v_resultado INTO v_id_evaluacion, v_id_formacion, v_id_empleado, v_fecha_evaluacion, v_fichero_eval, v_nota, v_observaciones;
        EXIT WHEN v_resultado%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Evaluaci�n: ' || v_id_evaluacion || ', ID Formaci�n: ' || v_id_formacion || ', ID Empleado: ' || v_id_empleado || ', Nota: ' || v_nota || ', Fecha Evaluaci�n: ' || v_fecha_evaluacion || ', Observaciones: ' || v_observaciones);
    END LOOP;
    CLOSE v_resultado;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener evaluaciones por formaci�n: ' || SQLERRM);
END;
/
-- ID EValuacion: EVA-00000, ID Formaci�n: FOR-00001, ID Empleado: EMP-00001, Nota: 8, Fecha Evaluaci�n: 15/12/23, Observaciones: Buen rendimiento


DECLARE
    v_resultado SYS_REFCURSOR;
    v_id_empleado VARCHAR2(125) := 'EMP-00001';
    v_id_evaluacion VARCHAR2(125);
    v_id_formacion VARCHAR2(125);
    v_nota NUMBER;
    v_fichero_eval BLOB;
    v_fecha_evaluacion DATE;
    v_observaciones VARCHAR2(200);
BEGIN
    FormacionPkg.ObtenerEvaluacionesPorEmpleado(p_id_empleado => v_id_empleado, p_resultado => v_resultado);
    LOOP
        FETCH v_resultado INTO v_id_evaluacion, v_id_formacion, v_id_empleado, v_fecha_evaluacion, v_fichero_eval, v_nota, v_observaciones;
        EXIT WHEN v_resultado%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Evaluaci�n: ' || v_id_evaluacion || ', ID Formaci�n: ' || v_id_formacion || ', ID Empleado: ' || v_id_empleado || ', Nota: ' || v_nota || ', Fecha Evaluaci�n: ' || v_fecha_evaluacion || ', Observaciones: ' || v_observaciones);
    END LOOP;
    CLOSE v_resultado;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener evaluaciones por empleado: ' || SQLERRM);
END;
/
-- ID Evaluaci�n: EVA-00000, ID Formaci�n: FOR-00001, ID Empleado: EMP-00001, Nota: 8, Fecha Evaluaci�n: 15/12/23, Observaciones: Buen rendimiento

BEGIN
    FormacionPkg.RegTecnologia(
        p_nombre => 'Inteligencia Artificial',
        p_descripcion => 'Uso de modelos preparados para an�lisis de datos en constante cambio'
    );
    DBMS_OUTPUT.PUT_LINE('Nueva tecnolog�a registrada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al registrar nueva tecnolog�a: ' || SQLERRM);
END;
/
--Nueva tecnologia registrada correctamente

BEGIN
    FormacionPkg.ActualizarTecnologia(
        p_id_tecnologia => 'TEC-00001',
        p_nombre => 'Machine Learning',
        p_descripcion => 'Actualizaci�n de tecnolog�a de Machine Learning'
    );
    DBMS_OUTPUT.PUT_LINE('Tecnolog�a actualizada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar tecnolog�a: ' || SQLERRM);
END;
/
--Tecnologia actualizada correctamente

DECLARE
    v_resultado SYS_REFCURSOR;
    v_nombre VARCHAR2(255) := 'Machine Learning';
    v_id_tecnologia VARCHAR2(125);
    v_descripcion VARCHAR2(255);
BEGIN
    FormacionPkg.ObtenerTecnologiaPorNombre(p_nombre => v_nombre, p_resultado => v_resultado);
    LOOP
        FETCH v_resultado INTO v_id_tecnologia, v_nombre, v_descripcion;
        EXIT WHEN v_resultado%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Tecnolog�a: ' || v_id_tecnologia || ', Nombre: ' || v_nombre || ', Descripci�n: ' || v_descripcion);
    END LOOP;
    CLOSE v_resultado;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener tecnolog�a por nombre: ' || SQLERRM);
END;
/
--ID Tecnolog�a: TEC-00001, Nombre: Machine Learning, Descripci�n: Actualizaci�n de tecnolog�a de Machine Learning

DECLARE
    v_resultado SYS_REFCURSOR;
    v_id_departamento VARCHAR2(125) := 'DEP-00003';
    v_id_formacion VARCHAR2(125);
    v_tecnologia VARCHAR2(125);
    v_fecha_inicio DATE;
    v_fecha_fin DATE;
    v_id_formador VARCHAR2(125);
BEGIN
    FormacionPkg.ObtenerFormacionesPorDepartamento(p_id_departamento => v_id_departamento, p_resultado => v_resultado);
    LOOP
        FETCH v_resultado INTO v_id_formacion, v_tecnologia, v_id_departamento, v_fecha_inicio, v_fecha_fin, v_id_formador;
        EXIT WHEN v_resultado%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Formaci�n: ' || v_id_formacion || ', Tecnolog�a: ' || v_tecnologia || ', Departamento: ' || v_id_departamento || ', Fecha Inicio: ' || v_fecha_inicio || ', Fecha Fin: ' || v_fecha_fin || ', ID Formador: ' || v_id_formador);
    END LOOP;
    CLOSE v_resultado;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener formaciones por departamento: ' || SQLERRM);
END;
/
-- ID Formaci�n: FOR-00003, Tecnolog�a: TEC-00003, Departamento: DEP-00003, Fecha Inicio: 20/03/23, Fecha Fin: 20/04/23, ID Formador: EMP-00003
-- ID Formaci�n: FOR-00009, Tecnolog�a: TEC-00009, Departamento: DEP-00003, Fecha Inicio: 20/10/23, Fecha Fin: 20/11/23, ID Formador: EMP-00009