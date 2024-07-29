INSERT INTO Departamento (ID_departamento, Nombre, ID_TechLead) VALUES ('DEP-00001', 'Desarrollo', 'EMP-00001');
INSERT INTO Departamento (ID_departamento, Nombre, ID_TechLead) VALUES ('DEP-00002', 'Soporte', 'EMP-00002');
INSERT INTO Departamento (ID_departamento, Nombre, ID_TechLead) VALUES ('DEP-00003', 'Recursos Humanos', 'EMP-00003');
INSERT INTO Departamento (ID_departamento, Nombre, ID_TechLead) VALUES ('DEP-00004', 'Marketing', 'EMP-00004');
INSERT INTO Departamento (ID_departamento, Nombre, ID_TechLead) VALUES ('DEP-00005', 'Ventas', 'EMP-00005');
INSERT INTO Departamento (ID_departamento, Nombre, ID_TechLead) VALUES ('DEP-00006', 'Finanzas', 'EMP-00006');

INSERT INTO Tecnologia (ID_tecnologia, nombre, descripcion) VALUES ('TEC-00001', 'Java', 'Lenguaje de programación orientado a objetos');
INSERT INTO Tecnologia (ID_tecnologia, nombre, descripcion) VALUES ('TEC-00002', 'Python', 'Lenguaje de programación interpretado, interactivo');
INSERT INTO Tecnologia (ID_tecnologia, nombre, descripcion) VALUES ('TEC-00003', 'JavaScript', 'Lenguaje de programación interpretado, basado en prototipos');
INSERT INTO Tecnologia (ID_tecnologia, nombre, descripcion) VALUES ('TEC-00004', 'C#', 'Lenguaje de programación orientado a objetos desarrollado por Microsoft');
INSERT INTO Tecnologia (ID_tecnologia, nombre, descripcion) VALUES ('TEC-00005', 'Ruby', 'Lenguaje de programación interpretado, reflexivo');
INSERT INTO Tecnologia (ID_tecnologia, nombre, descripcion) VALUES ('TEC-00006', 'PHP', 'Lenguaje de programación del lado del servidor');
INSERT INTO Tecnologia (ID_tecnologia, nombre, descripcion) VALUES ('TEC-00007', 'Swift', 'Lenguaje de programación para iOS y macOS');
INSERT INTO Tecnologia (ID_tecnologia, nombre, descripcion) VALUES ('TEC-00008', 'Kotlin', 'Lenguaje de programación interoperable con Java');
INSERT INTO Tecnologia (ID_tecnologia, nombre, descripcion) VALUES ('TEC-00009', 'Go', 'Lenguaje de programación desarrollado por Google');

INSERT INTO Formacion (ID_Formacion, ID_Tecnologia, ID_Departamento, Fecha_Inicio, Fecha_fin, ID_empleado) VALUES ('FOR-00001', 'TEC-00001', 'DEP-00001', TO_DATE('2023-01-10', 'YYYY-MM-DD'), TO_DATE('2023-02-10', 'YYYY-MM-DD'), 'EMP-00001');
INSERT INTO Formacion (ID_Formacion, ID_Tecnologia, ID_Departamento, Fecha_Inicio, Fecha_fin, ID_empleado) VALUES ('FOR-00002', 'TEC-00002', 'DEP-00002', TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-03-15', 'YYYY-MM-DD'), 'EMP-00002');
INSERT INTO Formacion (ID_Formacion, ID_Tecnologia, ID_Departamento, Fecha_Inicio, Fecha_fin, ID_empleado) VALUES ('FOR-00003', 'TEC-00003', 'DEP-00003', TO_DATE('2023-03-20', 'YYYY-MM-DD'), TO_DATE('2023-04-20', 'YYYY-MM-DD'), 'EMP-00003');
INSERT INTO Formacion (ID_Formacion, ID_Tecnologia, ID_Departamento, Fecha_Inicio, Fecha_fin, ID_empleado) VALUES ('FOR-00004', 'TEC-00004', 'DEP-00004', TO_DATE('2023-04-25', 'YYYY-MM-DD'), TO_DATE('2023-05-25', 'YYYY-MM-DD'), 'EMP-00004');
INSERT INTO Formacion (ID_Formacion, ID_Tecnologia, ID_Departamento, Fecha_Inicio, Fecha_fin, ID_empleado) VALUES ('FOR-00005', 'TEC-00005', 'DEP-00005', TO_DATE('2023-05-30', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 'EMP-00005');
INSERT INTO Formacion (ID_Formacion, ID_Tecnologia, ID_Departamento, Fecha_Inicio, Fecha_fin, ID_empleado) VALUES ('FOR-00006', 'TEC-00006', 'DEP-00006', TO_DATE('2023-07-05', 'YYYY-MM-DD'), TO_DATE('2023-08-05', 'YYYY-MM-DD'), 'EMP-00006');
INSERT INTO Formacion (ID_Formacion, ID_Tecnologia, ID_Departamento, Fecha_Inicio, Fecha_fin, ID_empleado) VALUES ('FOR-00007', 'TEC-00007', 'DEP-00001', TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), 'EMP-00007');
INSERT INTO Formacion (ID_Formacion, ID_Tecnologia, ID_Departamento, Fecha_Inicio, Fecha_fin, ID_empleado) VALUES ('FOR-00008', 'TEC-00008', 'DEP-00002', TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'EMP-00008');
INSERT INTO Formacion (ID_Formacion, ID_Tecnologia, ID_Departamento, Fecha_Inicio, Fecha_fin, ID_empleado) VALUES ('FOR-00009', 'TEC-00009', 'DEP-00003', TO_DATE('2023-10-20', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'EMP-00009');

INSERT INTO Evaluacion (ID_evaluacion, ID_formacion, ID_empleado, Fecha_evaluacion, Fichero_Evaluacion, Nota, Observaciones) VALUES ('EVA-00001', 'FOR-00001', 'EMP-00001', TO_DATE('2023-02-11', 'YYYY-MM-DD'), NULL, 8.5, 'Buen desempeño');
INSERT INTO Evaluacion (ID_evaluacion, ID_formacion, ID_empleado, Fecha_evaluacion, Fichero_Evaluacion, Nota, Observaciones) VALUES ('EVA-00002', 'FOR-00002', 'EMP-00002', TO_DATE('2023-03-16', 'YYYY-MM-DD'), NULL, 7.0, 'Necesita mejorar en algunos aspectos');
INSERT INTO Evaluacion (ID_evaluacion, ID_formacion, ID_empleado, Fecha_evaluacion, Fichero_Evaluacion, Nota, Observaciones) VALUES ('EVA-00003', 'FOR-00003', 'EMP-00003', TO_DATE('2023-04-21', 'YYYY-MM-DD'), NULL, 9.0, 'Excelente desempeño');
INSERT INTO Evaluacion (ID_evaluacion, ID_formacion, ID_empleado, Fecha_evaluacion, Fichero_Evaluacion, Nota, Observaciones) VALUES ('EVA-00004', 'FOR-00004', 'EMP-00004', TO_DATE('2023-05-26', 'YYYY-MM-DD'), NULL, 6.5, 'Puede mejorar');
INSERT INTO Evaluacion (ID_evaluacion, ID_formacion, ID_empleado, Fecha_evaluacion, Fichero_Evaluacion, Nota, Observaciones) VALUES ('EVA-00005', 'FOR-00005', 'EMP-00005', TO_DATE('2023-07-01', 'YYYY-MM-DD'), NULL, 7.8, 'Buen desempeño');
INSERT INTO Evaluacion (ID_evaluacion, ID_formacion, ID_empleado, Fecha_evaluacion, Fichero_Evaluacion, Nota, Observaciones) VALUES ('EVA-00006', 'FOR-00006', 'EMP-00006', TO_DATE('2023-08-06', 'YYYY-MM-DD'), NULL, 8.2, 'Buen desempeño');
INSERT INTO Evaluacion (ID_evaluacion, ID_formacion, ID_empleado, Fecha_evaluacion, Fichero_Evaluacion, Nota, Observaciones) VALUES ('EVA-00007', 'FOR-00007', 'EMP-00007', TO_DATE('2023-09-11', 'YYYY-MM-DD'), NULL, 7.5, 'Desempeño aceptable');
INSERT INTO Evaluacion (ID_evaluacion, ID_formacion, ID_empleado, Fecha_evaluacion, Fichero_Evaluacion, Nota, Observaciones) VALUES ('EVA-00008', 'FOR-00008', 'EMP-00008', TO_DATE('2023-10-16', 'YYYY-MM-DD'), NULL, 8.0, 'Buen desempeño');
INSERT INTO Evaluacion (ID_evaluacion, ID_formacion, ID_empleado, Fecha_evaluacion, Fichero_Evaluacion, Nota, Observaciones) VALUES ('EVA-00009', 'FOR-00009', 'EMP-00009', TO_DATE('2023-11-21', 'YYYY-MM-DD'), NULL, 9.2, 'Excelente desempeño');
