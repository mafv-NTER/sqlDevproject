CREATE OR REPLACE PACKAGE FormacionPkg IS
    -- Registrar Nueva Formación
    PROCEDURE RegistrarNuevaFormacion(
        p_id_formacion  IN VARCHAR2,
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
    PROCEDURE RegistrarEvaluacion(
        p_id_evaluacion     IN VARCHAR2,
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
    PROCEDURE RegistrarNuevaTecnologia(
        p_id_tecnologia IN VARCHAR2,
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
    PROCEDURE RegistrarNuevaFormacion(
        p_id_formacion  IN VARCHAR2,
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
    
        INSERT INTO Formacion (id_formacion, id_tecnologia, id_departamento, fecha_inicio, fecha_fin, id_empleado)
        VALUES (p_id_formacion, p_tecnologia, p_departamento, p_fecha_inicio, p_fecha_fin, p_id_formador);
        
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('error al registrar la nueva formación');
    END RegistrarNuevaFormacion;

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
    END ActualizarFormacion;

    PROCEDURE RegistrarEvaluacion(
        p_id_evaluacion     IN VARCHAR2,
        p_id_formacion      IN VARCHAR2,
        p_nota              IN NUMBER,
        p_fecha_evaluacion  IN DATE,
        p_observaciones     IN VARCHAR2,
        p_id_empleado       IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Evaluacion (id_evaluacion, id_formacion, nota, fecha_evaluacion, observaciones, id_empleado)
        VALUES (p_id_evaluacion, p_id_formacion, p_nota, p_fecha_evaluacion, p_observaciones, p_id_empleado);
    END RegistrarEvaluacion;

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
    END ObtenerEvaluacionesPorEmpleado;

    PROCEDURE RegistrarNuevaTecnologia(
        p_id_tecnologia IN VARCHAR2,
        p_nombre        IN VARCHAR2,
        p_descripcion   IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Tecnologia (id_tecnologia, nombre, descripcion)
        VALUES (p_id_tecnologia, p_nombre, p_descripcion);
    END RegistrarNuevaTecnologia;

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
    END ActualizarTecnologia;

    PROCEDURE ObtenerTecnologiaPorNombre(
        p_nombre    IN VARCHAR2,
        p_resultado OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_resultado FOR
        SELECT * FROM Tecnologia WHERE nombre = p_nombre;
    END ObtenerTecnologiaPorNombre;

    PROCEDURE ObtenerFormacionesPorDepartamento(
        p_id_departamento IN VARCHAR2,
        p_resultado       OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_resultado FOR
        SELECT * FROM Formacion WHERE id_departamento = p_id_departamento;
    END ObtenerFormacionesPorDepartamento;
END FormacionPkg;
/

EXEC formacionpkg.registrarnuevaformacion('FOR-00001', 'TEC-00001', 'DEP-00001', SYSDATE, SYSDATE, 'EMP-00001');