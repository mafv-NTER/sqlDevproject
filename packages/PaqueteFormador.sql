CREATE OR REPLACE PACKAGE FormacionPkg IS
    -- Registrar Nueva Formación
    PROCEDURE RegFormacion(
        p_tecnologia    IN VARCHAR2,
        p_departamento  IN VARCHAR2,
        p_fecha_inicio  IN DATE,
        p_fecha_fin     IN DATE,
        p_id_formador   IN VARCHAR2
    );

    -- Actualizar Formación
    PROCEDURE ActualizarFormacion(
        p_id_formacion  IN VARCHAR2,
        p_tecnologia    IN VARCHAR2,
        p_departamento  IN VARCHAR2,
        p_fecha_inicio  IN DATE,
        p_fecha_fin     IN DATE,
        p_id_formador   IN VARCHAR2
    );

    -- Registrar Evaluación
    PROCEDURE RegEvaluacion(
        p_id_formacion      IN VARCHAR2,
        p_nota              IN NUMBER,
        p_fecha_evaluacion  IN DATE,
        p_observaciones     IN VARCHAR2,
        p_id_empleado       IN VARCHAR2
    );

    -- Actualizar Evaluación
    PROCEDURE ActualizarEvaluacion(
        p_id_evaluacion     IN VARCHAR2,
        p_id_formacion      IN VARCHAR2,
        p_nota              IN NUMBER,
        p_fecha_evaluacion  IN DATE,
        p_observaciones     IN VARCHAR2,
        p_id_empleado       IN VARCHAR2
    );

    -- Obtener Evaluaciones por Formación
    PROCEDURE ObtenerEvaluacionesPorFormacion(
        p_id_formacion  IN VARCHAR2,
        p_resultado     OUT SYS_REFCURSOR
    );

    -- Obtener Evaluaciones por Empleado
    PROCEDURE ObtenerEvaluacionesPorEmpleado(
        p_id_empleado   IN VARCHAR2,
        p_resultado     OUT SYS_REFCURSOR
    );

    -- Registrar Nueva Tecnología
    PROCEDURE RegTecnologia(
        p_nombre        IN VARCHAR2,
        p_descripcion   IN VARCHAR2
    );

    -- Actualizar Tecnología
    PROCEDURE ActualizarTecnologia(
        p_id_tecnologia IN VARCHAR2,
        p_nombre        IN VARCHAR2,
        p_descripcion   IN VARCHAR2
    );

    -- Obtener Tecnología por Nombre
    PROCEDURE ObtenerTecnologiaPorNombre(
        p_nombre    IN VARCHAR2,
        p_resultado OUT SYS_REFCURSOR
    );

    -- Obtener Formaciones por Departamento
    PROCEDURE ObtenerFormacionesPorDepartamento(
        p_id_departamento IN VARCHAR2,
        p_resultado       OUT SYS_REFCURSOR
    );
END FormacionPkg;
/

CREATE OR REPLACE PACKAGE BODY FormacionPkg IS

    FUNCTION formacion_existe(id_form IN VARCHAR2) RETURN BOOLEAN IS
        BEGIN
            FOR i IN (SELECT ID_FORMACION FROM FORMACION WHERE ID_FORMACION = id_form) LOOP
                RETURN TRUE;
            END LOOP;
            
            RETURN FALSE;
        END formacion_existe;
        
    PROCEDURE RegFormacion(
        p_tecnologia    IN VARCHAR2,
        p_departamento  IN VARCHAR2,
        p_fecha_inicio  IN DATE,
        p_fecha_fin     IN DATE,
        p_id_formador   IN VARCHAR2
    ) IS
    BEGIN
        IF (p_fecha_inicio >= p_fecha_fin) THEN
            RAISE_APPLICATION_ERROR(-21000, 'ERROR DE REGISTRO DE FORMACIÓN! La fecha de inicio no puede ser posterior ó igual a la fecha de Fin');
        END IF;
    
        --Se usan IDs a número 00000, ya que gracias al Trigger correspondiente se introducirá un ID autogenerado con secuencias propias.
        INSERT INTO Formacion (id_formacion, id_tecnologia, id_departamento, fecha_inicio, fecha_fin, id_empleado)
        VALUES ('FOR-00000', p_tecnologia, p_departamento, p_fecha_inicio, p_fecha_fin, p_id_formador);
        
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('error al registrar la nueva formación indicada');
    END RegFormacion;

    PROCEDURE ActualizarFormacion(
        p_id_formacion  IN VARCHAR2,
        p_tecnologia    IN VARCHAR2,
        p_departamento  IN VARCHAR2,
        p_fecha_inicio  IN DATE,
        p_fecha_fin     IN DATE,
        p_id_formador   IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Formacion
        SET id_tecnologia = p_tecnologia,
            id_departamento = p_departamento,
            fecha_inicio = p_fecha_inicio,
            fecha_fin = p_fecha_fin,
            id_empleado = p_id_formador
        WHERE id_formacion = p_id_formacion;
        
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('error al actualizar la formación indicada:');
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLERRM));
    END ActualizarFormacion;

    PROCEDURE RegEvaluacion(
        p_id_formacion      IN VARCHAR2,
        p_nota              IN NUMBER,
        p_fecha_evaluacion  IN DATE,
        p_observaciones     IN VARCHAR2,
        p_id_empleado       IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Evaluacion (id_evaluacion, id_formacion, nota, fecha_evaluacion, observaciones, id_empleado)
        VALUES ('EVA-00000', p_id_formacion, p_nota, p_fecha_evaluacion, p_observaciones, p_id_empleado);
        
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('error al registrar la nueva evaluación indicada');
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLERRM));
    END RegEvaluacion;

    PROCEDURE ActualizarEvaluacion(
        p_id_evaluacion     IN VARCHAR2,
        p_id_formacion      IN VARCHAR2,
        p_nota              IN NUMBER,
        p_fecha_evaluacion  IN DATE,
        p_observaciones     IN VARCHAR2,
        p_id_empleado       IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Evaluacion
        SET id_formacion = p_id_formacion,
            nota = p_nota,
            fecha_evaluacion = p_fecha_evaluacion,
            observaciones = p_observaciones,
            id_empleado = p_id_empleado
        WHERE id_evaluacion = p_id_evaluacion;
        
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('error al actualizar la evaluación indicada');
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLERRM));
    END ActualizarEvaluacion;

    PROCEDURE ObtenerEvaluacionesPorFormacion(
        p_id_formacion  IN VARCHAR2,
        p_resultado     OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_resultado FOR
        SELECT * FROM Evaluacion WHERE id_formacion = p_id_formacion;
    END ObtenerEvaluacionesPorFormacion;

    PROCEDURE ObtenerEvaluacionesPorEmpleado(
        p_id_empleado   IN VARCHAR2,
        p_resultado     OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_resultado FOR
        SELECT * FROM Evaluacion WHERE id_empleado = p_id_empleado;
        
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('error al obtener la evaluación para el empleado ' || TO_CHAR(p_id_empleado));
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLERRM));
    END ObtenerEvaluacionesPorEmpleado;

    PROCEDURE RegTecnologia(
        p_nombre        IN VARCHAR2,
        p_descripcion   IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Tecnologia (id_tecnologia, nombre, descripcion)
        VALUES ('TEC-00000', p_nombre, p_descripcion);
        
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('error al registrar la tecnología indicada');
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLERRM));
    END RegTecnologia;

    PROCEDURE ActualizarTecnologia(
        p_id_tecnologia IN VARCHAR2,
        p_nombre        IN VARCHAR2,
        p_descripcion   IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Tecnologia
        SET nombre = p_nombre,
            descripcion = p_descripcion
        WHERE id_tecnologia = p_id_tecnologia;
        
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('error al actualizar la tecnología indicada (' || p_id_tecnologia || ')');
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLERRM));
    END ActualizarTecnologia;

    PROCEDURE ObtenerTecnologiaPorNombre(
        p_nombre    IN VARCHAR2,
        p_resultado OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_resultado FOR
        SELECT * FROM Tecnologia WHERE nombre = p_nombre;
        
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('error al seleccionar la tecnología con nombre "' || p_nombre || '"');
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLERRM));
    END ObtenerTecnologiaPorNombre;

    PROCEDURE ObtenerFormacionesPorDepartamento(
        p_id_departamento IN VARCHAR2,
        p_resultado       OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_resultado FOR
        SELECT * FROM Formacion WHERE id_departamento = p_id_departamento;
        
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('error al obtener la formación indicada (' || p_id_departamento || ')');
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLERRM));
    END ObtenerFormacionesPorDepartamento;
END FormacionPkg;
/