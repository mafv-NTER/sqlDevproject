CREATE OR REPLACE PACKAGE GestionEmpleados AS
    -- Procedimiento para registrar un nuevo empleado
    PROCEDURE RegistrarEmpleado(
        p_ID_empleado         IN Info_Empleado_Personal.ID_empleado%TYPE,
        p_DNI                 IN Info_Empleado_Personal.DNI%TYPE,
        p_Nombre              IN Info_Empleado_Personal.Nombre%TYPE,
        p_Apellido1           IN Info_Empleado_Personal.Apellido1%TYPE,
        p_Apellido2           IN Info_Empleado_Personal.Apellido2%TYPE,
        p_Fecha_nacimiento    IN Info_Empleado_Personal.Fecha_nacimiento%TYPE,
        p_Sexo                IN Info_Empleado_Personal.Sexo%TYPE,
        p_ID_mentor           IN Info_Empleado_Personal.ID_mentor%TYPE,
        p_Profesion           IN Info_Empleado_Personal.profesion%TYPE,
        p_Rol                 IN Info_Empleado_Laboral.rol%TYPE,
        p_AniosExperiencia    IN Info_Empleado_Laboral.aniosExperiencia%TYPE,
        p_TipoEmpleado        IN Info_Empleado_Laboral.tipoEmpleado%TYPE,
        p_Cargo               IN Info_Empleado_Laboral.cargo%TYPE,
        p_Telefono            IN Info_Empleado_Contacto.telefono%TYPE,
        p_Email               IN Info_Empleado_Contacto.email%TYPE,
        p_Direccion           IN Info_Empleado_Contacto.direccion%TYPE,
        p_Codigo_postal       IN Info_Empleado_Contacto.codigo_postal%TYPE,
        p_ID_departamento     IN Info_Empleado_Localizacion.ID_departamento%TYPE,
        p_ID_oficina          IN Info_Empleado_Localizacion.ID_oficina%TYPE,
        p_Ubicacion_oficina   IN Info_Empleado_Localizacion.Ubicacion_oficina%TYPE
    );

    -- Procedimiento para actualizar los datos personales de un empleado
    PROCEDURE ActualizarDatosPersonales(
        p_ID_empleado      IN Info_Empleado_Personal.ID_empleado%TYPE,
        p_Nombre           IN Info_Empleado_Personal.Nombre%TYPE,
        p_Apellido1        IN Info_Empleado_Personal.Apellido1%TYPE,
        p_Apellido2        IN Info_Empleado_Personal.Apellido2%TYPE,
        p_DNI              IN Info_Empleado_Personal.DNI%TYPE,
        p_Fecha_nacimiento IN Info_Empleado_Personal.Fecha_nacimiento%TYPE,
        p_Profesion        IN Info_Empleado_Personal.profesion%TYPE
    );

    -- Función para obtener la información de contacto de un empleado
    FUNCTION ObtenerContactoEmpleado(p_ID_empleado IN Info_Empleado_Contacto.ID_empleado%TYPE)
        RETURN Info_Empleado_Contacto%ROWTYPE;

    -- Procedimiento para actualizar la información de contacto de un empleado
    PROCEDURE ActualizarContactoEmpleado(
        p_ID_empleado    IN Info_Empleado_Contacto.ID_empleado%TYPE,
        p_Telefono       IN Info_Empleado_Contacto.telefono%TYPE,
        p_Email          IN Info_Empleado_Contacto.email%TYPE,
        p_Direccion      IN Info_Empleado_Contacto.direccion%TYPE,
        p_Codigo_postal  IN Info_Empleado_Contacto.codigo_postal%TYPE
    );

    -- Procedimiento para asignar un mentor a un empleado
    PROCEDURE AsignarMentor(
        p_ID_empleado IN Info_Empleado_Personal.ID_empleado%TYPE,
        p_ID_mentor   IN Info_Empleado_Personal.ID_mentor%TYPE
    );

    -- Función para obtener la información laboral de un empleado
    FUNCTION ObtenerInformacionLaboral(p_ID_empleado IN Info_Empleado_Laboral.ID_empleado%TYPE)
        RETURN Info_Empleado_Laboral%ROWTYPE;

    -- Procedimiento para actualizar la información laboral de un empleado
    PROCEDURE ActualizarInformacionLaboral(
        p_ID_empleado      IN Info_Empleado_Laboral.ID_empleado%TYPE,
        p_Rol              IN Info_Empleado_Laboral.rol%TYPE,
        p_AniosExperiencia IN Info_Empleado_Laboral.aniosExperiencia%TYPE,
        p_TipoEmpleado     IN Info_Empleado_Laboral.tipoEmpleado%TYPE,
        p_Cargo            IN Info_Empleado_Laboral.cargo%TYPE
    );

    -- Procedimiento para actualizar la localización del empleado
    PROCEDURE ActualizarLocalizacion(
        p_ID_empleado       IN Info_Empleado_Localizacion.ID_empleado%TYPE,
        p_ID_departamento   IN Info_Empleado_Localizacion.ID_departamento%TYPE,
        p_ID_oficina        IN Info_Empleado_Localizacion.ID_oficina%TYPE,
        p_Ubicacion_oficina IN Info_Empleado_Localizacion.Ubicacion_oficina%TYPE
    );

    -- Función para obtener la información completa de un empleado
    FUNCTION ObtenerInformacionCompleta(p_ID_empleado IN Info_Empleado_Personal.ID_empleado%TYPE)
        RETURN SYS_REFCURSOR;

    -- Función para comprobar la existencia de un empleado por DNI
    FUNCTION ExisteEmpleadoPorDNI(p_DNI IN Info_Empleado_Personal.DNI%TYPE) RETURN BOOLEAN;

    -- Función para comprobar la existencia de un empleado por ID
    FUNCTION ExisteEmpleadoPorID(p_ID_empleado IN Info_Empleado_Personal.ID_empleado%TYPE) RETURN BOOLEAN;

    -- Función para comprobar la existencia de una oficina por ID
    FUNCTION ExisteOficinaPorID(p_ID_oficina IN Oficina.ID_oficina%TYPE) RETURN BOOLEAN;

    -- Función para comprobar la existencia de un departamento por ID
    FUNCTION ExisteDepartamentoPorID(p_ID_departamento IN Departamento.ID_departamento%TYPE) RETURN BOOLEAN;

END GestionEmpleados;
/
CREATE OR REPLACE PACKAGE BODY GestionEmpleados AS

    PROCEDURE RegistrarEmpleado(
        p_ID_empleado         IN Info_Empleado_Personal.ID_empleado%TYPE,
        p_DNI                 IN Info_Empleado_Personal.DNI%TYPE,
        p_Nombre              IN Info_Empleado_Personal.Nombre%TYPE,
        p_Apellido1           IN Info_Empleado_Personal.Apellido1%TYPE,
        p_Apellido2           IN Info_Empleado_Personal.Apellido2%TYPE,
        p_Fecha_nacimiento    IN Info_Empleado_Personal.Fecha_nacimiento%TYPE,
        p_Sexo                IN Info_Empleado_Personal.Sexo%TYPE,
        p_ID_mentor           IN Info_Empleado_Personal.ID_mentor%TYPE,
        p_Profesion           IN Info_Empleado_Personal.profesion%TYPE,
        p_Rol                 IN Info_Empleado_Laboral.rol%TYPE,
        p_AniosExperiencia    IN Info_Empleado_Laboral.aniosExperiencia%TYPE,
        p_TipoEmpleado        IN Info_Empleado_Laboral.tipoEmpleado%TYPE,
        p_Cargo               IN Info_Empleado_Laboral.cargo%TYPE,
        p_Telefono            IN Info_Empleado_Contacto.telefono%TYPE,
        p_Email               IN Info_Empleado_Contacto.email%TYPE,
        p_Direccion           IN Info_Empleado_Contacto.direccion%TYPE,
        p_Codigo_postal       IN Info_Empleado_Contacto.codigo_postal%TYPE,
        p_ID_departamento     IN Info_Empleado_Localizacion.ID_departamento%TYPE,
        p_ID_oficina          IN Info_Empleado_Localizacion.ID_oficina%TYPE,
        p_Ubicacion_oficina   IN Info_Empleado_Localizacion.Ubicacion_oficina%TYPE
    ) IS
    BEGIN
        IF NOT ExisteEmpleadoPorDNI(p_DNI) THEN
            IF NOT ExisteDepartamentoPorID(p_ID_departamento) THEN
                RAISE_APPLICATION_ERROR(-20002, 'El departamento no existe.');
            ELSIF NOT ExisteOficinaPorID(p_ID_oficina) THEN
                RAISE_APPLICATION_ERROR(-20003, 'La oficina no existe.');
            ELSE
                INSERT INTO Info_Empleado_Personal (
                    ID_empleado, DNI, Nombre, Apellido1, Apellido2, Fecha_nacimiento, Sexo, ID_mentor, profesion
                ) VALUES (
                    p_ID_empleado, p_DNI, p_Nombre, p_Apellido1, p_Apellido2, p_Fecha_nacimiento, p_Sexo, p_ID_mentor, p_Profesion
                );

                INSERT INTO Info_Empleado_Laboral (
                    ID_empleado, rol, aniosExperiencia, tipoEmpleado, cargo
                ) VALUES (
                    p_ID_empleado, p_Rol, p_AniosExperiencia, p_TipoEmpleado, p_Cargo
                );

                INSERT INTO Info_Empleado_Contacto (
                    ID_empleado, telefono, email, direccion, codigo_postal
                ) VALUES (
                    p_ID_empleado, p_Telefono, p_Email, p_Direccion, p_Codigo_postal
                );

                INSERT INTO Info_Empleado_Localizacion (
                    ID_empleado, ID_departamento, ID_oficina, Ubicacion_oficina
                ) VALUES (
                    p_ID_empleado, p_ID_departamento, p_ID_oficina, p_Ubicacion_oficina
                );
            END IF;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'El empleado con este DNI ya existe.');
        END IF;
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END RegistrarEmpleado;

    PROCEDURE ActualizarDatosPersonales(
        p_ID_empleado      IN Info_Empleado_Personal.ID_empleado%TYPE,
        p_Nombre           IN Info_Empleado_Personal.Nombre%TYPE,
        p_Apellido1        IN Info_Empleado_Personal.Apellido1%TYPE,
        p_Apellido2        IN Info_Empleado_Personal.Apellido2%TYPE,
        p_DNI              IN Info_Empleado_Personal.DNI%TYPE,
        p_Fecha_nacimiento IN Info_Empleado_Personal.Fecha_nacimiento%TYPE,
        p_Profesion        IN Info_Empleado_Personal.profesion%TYPE
    ) IS
    BEGIN
        IF NOT ExisteEmpleadoPorID(p_ID_empleado) THEN
            RAISE_APPLICATION_ERROR(-20004, 'El empleado no existe.');
        ELSE
            UPDATE Info_Empleado_Personal
            SET Nombre = p_Nombre,
                Apellido1 = p_Apellido1,
                Apellido2 = p_Apellido2,
                DNI = p_DNI,
                Fecha_nacimiento = p_Fecha_nacimiento,
                profesion = p_Profesion
            WHERE ID_empleado = p_ID_empleado;
        END IF;
    END ActualizarDatosPersonales;

    FUNCTION ObtenerContactoEmpleado(p_ID_empleado IN Info_Empleado_Contacto.ID_empleado%TYPE)
        RETURN Info_Empleado_Contacto%ROWTYPE IS
        v_contacto Info_Empleado_Contacto%ROWTYPE;
    BEGIN
        IF NOT ExisteEmpleadoPorID(p_ID_empleado) THEN
            RAISE_APPLICATION_ERROR(-20004, 'El empleado no existe.');
        ELSE
            SELECT *
            INTO v_contacto
            FROM Info_Empleado_Contacto
            WHERE ID_empleado = p_ID_empleado;
        
            RETURN v_contacto;
        END IF;
    END ObtenerContactoEmpleado;

    PROCEDURE ActualizarContactoEmpleado(
        p_ID_empleado    IN Info_Empleado_Contacto.ID_empleado%TYPE,
        p_Telefono       IN Info_Empleado_Contacto.telefono%TYPE,
        p_Email          IN Info_Empleado_Contacto.email%TYPE,
        p_Direccion      IN Info_Empleado_Contacto.direccion%TYPE,
        p_Codigo_postal  IN Info_Empleado_Contacto.codigo_postal%TYPE
    ) IS
    BEGIN
        IF NOT ExisteEmpleadoPorID(p_ID_empleado) THEN
            RAISE_APPLICATION_ERROR(-20004, 'El empleado no existe.');
        ELSE
            UPDATE Info_Empleado_Contacto
            SET telefono = p_Telefono,
                email = p_Email,
                direccion = p_Direccion,
                codigo_postal = p_Codigo_postal
            WHERE ID_empleado = p_ID_empleado;
        END IF;
    END ActualizarContactoEmpleado;

    PROCEDURE AsignarMentor(
        p_ID_empleado IN Info_Empleado_Personal.ID_empleado%TYPE,
        p_ID_mentor   IN Info_Empleado_Personal.ID_mentor%TYPE
    ) IS
    BEGIN
        IF NOT ExisteEmpleadoPorID(p_ID_empleado) THEN
            RAISE_APPLICATION_ERROR(-20004, 'El empleado no existe.');
        ELSE
            UPDATE Info_Empleado_Personal
            SET ID_mentor = p_ID_mentor
            WHERE ID_empleado = p_ID_empleado;
        END IF;
    END AsignarMentor;

    FUNCTION ObtenerInformacionLaboral(p_ID_empleado IN Info_Empleado_Laboral.ID_empleado%TYPE)
        RETURN Info_Empleado_Laboral%ROWTYPE IS
        v_laboral Info_Empleado_Laboral%ROWTYPE;
    BEGIN
        IF NOT ExisteEmpleadoPorID(p_ID_empleado) THEN
            RAISE_APPLICATION_ERROR(-20004, 'El empleado no existe.');
        ELSE
            SELECT *
            INTO v_laboral
            FROM Info_Empleado_Laboral
            WHERE ID_empleado = p_ID_empleado;
        
            RETURN v_laboral;
        END IF;
    END ObtenerInformacionLaboral;

    PROCEDURE ActualizarInformacionLaboral(
        p_ID_empleado      IN Info_Empleado_Laboral.ID_empleado%TYPE,
        p_Rol              IN Info_Empleado_Laboral.rol%TYPE,
        p_AniosExperiencia IN Info_Empleado_Laboral.aniosExperiencia%TYPE,
        p_TipoEmpleado     IN Info_Empleado_Laboral.tipoEmpleado%TYPE,
        p_Cargo            IN Info_Empleado_Laboral.cargo%TYPE
    ) IS
    BEGIN
        IF NOT ExisteEmpleadoPorID(p_ID_empleado) THEN
            RAISE_APPLICATION_ERROR(-20004, 'El empleado no existe.');
        ELSE
            UPDATE Info_Empleado_Laboral
            SET rol = p_Rol,
                aniosExperiencia = p_AniosExperiencia,
                tipoEmpleado = p_TipoEmpleado,
                cargo = p_Cargo
            WHERE ID_empleado = p_ID_empleado;
        END IF;
    END ActualizarInformacionLaboral;

    PROCEDURE ActualizarLocalizacion(
        p_ID_empleado       IN Info_Empleado_Localizacion.ID_empleado%TYPE,
        p_ID_departamento   IN Info_Empleado_Localizacion.ID_departamento%TYPE,
        p_ID_oficina        IN Info_Empleado_Localizacion.ID_oficina%TYPE,
        p_Ubicacion_oficina IN Info_Empleado_Localizacion.Ubicacion_oficina%TYPE
    ) IS
    BEGIN
        IF NOT ExisteEmpleadoPorID(p_ID_empleado) THEN
            RAISE_APPLICATION_ERROR(-20004, 'El empleado no existe.');
        ELSIF NOT ExisteDepartamentoPorID(p_ID_departamento) THEN
            RAISE_APPLICATION_ERROR(-20002, 'El departamento no existe.');
        ELSIF NOT ExisteOficinaPorID(p_ID_oficina) THEN
            RAISE_APPLICATION_ERROR(-20003, 'La oficina no existe.');
        ELSE
            UPDATE Info_Empleado_Localizacion
            SET ID_departamento = p_ID_departamento,
                ID_oficina = p_ID_oficina,
                Ubicacion_oficina = p_Ubicacion_oficina
            WHERE ID_empleado = p_ID_empleado;
        END IF;
    END ActualizarLocalizacion;

    FUNCTION ObtenerInformacionCompleta(p_ID_empleado IN Info_Empleado_Personal.ID_empleado%TYPE)
        RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        IF NOT ExisteEmpleadoPorID(p_ID_empleado) THEN
            RAISE_APPLICATION_ERROR(-20004, 'El empleado no existe.');
        ELSE
            OPEN v_cursor FOR
            SELECT p.*, c.*, l.*, lo.*
            FROM Info_Empleado_Personal p
            LEFT JOIN Info_Empleado_Contacto c ON p.ID_empleado = c.ID_empleado
            LEFT JOIN Info_Empleado_Laboral l ON p.ID_empleado = l.ID_empleado
            LEFT JOIN Info_Empleado_Localizacion lo ON p.ID_empleado = lo.ID_empleado
            WHERE p.ID_empleado = p_ID_empleado;

            RETURN v_cursor;
        END IF;
    END ObtenerInformacionCompleta;

    FUNCTION ExisteEmpleadoPorDNI(p_DNI IN Info_Empleado_Personal.DNI%TYPE) RETURN BOOLEAN IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM Info_Empleado_Personal
        WHERE DNI = p_DNI;
        
        RETURN v_count > 0;
    END ExisteEmpleadoPorDNI;

    FUNCTION ExisteEmpleadoPorID(p_ID_empleado IN Info_Empleado_Personal.ID_empleado%TYPE) RETURN BOOLEAN IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM Info_Empleado_Personal
        WHERE ID_empleado = p_ID_empleado;
        
        RETURN v_count > 0;
    END ExisteEmpleadoPorID;

    FUNCTION ExisteOficinaPorID(p_ID_oficina IN Oficina.ID_oficina%TYPE) RETURN BOOLEAN IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM Oficina
        WHERE ID_oficina = p_ID_oficina;
        
        RETURN v_count > 0;
    END ExisteOficinaPorID;

    FUNCTION ExisteDepartamentoPorID(p_ID_departamento IN Departamento.ID_departamento%TYPE) RETURN BOOLEAN IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM Departamento
        WHERE ID_departamento = p_ID_departamento;
        
        RETURN v_count > 0;
    END ExisteDepartamentoPorID;

END GestionEmpleados;
/



