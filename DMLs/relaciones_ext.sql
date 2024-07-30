
INSERT INTO Empresa (Nombre, Descripcion, Telefono, Email, Localizacion) VALUES ('Toyota', 'Empresa automotriz global', '+81 1234567890', 'contact@toyota.com', 'Japón');
INSERT INTO Empresa (Nombre, Descripcion, Telefono, Email, Localizacion) VALUES ('Microsoft', 'Empresa de tecnología y software', '+1 9876543210', 'info@microsoft.com', 'Estados Unidos');
INSERT INTO Empresa (Nombre, Descripcion, Telefono, Email, Localizacion) VALUES ('Google', 'Motor de búsqueda y tecnología', '+1 5551234567', 'support@google.com', 'Estados Unidos');
INSERT INTO Empresa (Nombre, Descripcion, Telefono, Email, Localizacion) VALUES ('Apple', 'Fabricante de dispositivos electrónicos', '+1 8005550000', 'info@apple.com', 'Estados Unidos');
INSERT INTO Empresa (Nombre, Descripcion, Telefono, Email, Localizacion) VALUES ('Samsung', 'Electrónica de consumo', '+82 1029384756', 'contact@samsung.com', 'Corea del Sur');
INSERT INTO Empresa (Nombre, Descripcion, Telefono, Email, Localizacion) VALUES ('Amazon', 'Comercio electrónico y tecnología', '+1 8001234567', 'info@amazon.com', 'Estados Unidos');
INSERT INTO Empresa (Nombre, Descripcion, Telefono, Email, Localizacion) VALUES ('IBM', 'Consultoría y servicios de TI', '+1 8004264968', 'support@ibm.com', 'Estados Unidos');
INSERT INTO Empresa (Nombre, Descripcion, Telefono, Email, Localizacion) VALUES ('Huawei', 'Tecnología de información y comunicación', '+86 1082937485', 'info@huawei.com', 'China');
INSERT INTO Empresa (Nombre, Descripcion, Telefono, Email, Localizacion) VALUES ('Facebook', 'Red social y tecnología', '+1 6505434800', 'contact@facebook.com', 'Estados Unidos');
INSERT INTO Empresa (Nombre, Descripcion, Telefono, Email, Localizacion) VALUES ('Tesla', 'Fabricante de vehículos eléctricos', '+1 8885183752', 'info@tesla.com', 'Estados Unidos');

INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('B28012345C', 'Toyota España', 'Filial de Toyota en España', 'Madrid', '+34 912345678', 'contact@toyota.es');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('B33098765C', 'Toyota Asia', 'Filial de Toyota en Asia', 'Tokio', '+81 901234567', 'contact@toyota.asia');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('B50054321C', 'Microsoft Europa', 'Filial de Microsoft en Europa', 'Dublín', '+353 14567890', 'info@microsoft.eu');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('B11067890C', 'Google India', 'Oficina de Google en India', 'Nueva Delhi', '+91 9876543210', 'contact@google.in');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('B45087654C', 'Apple China', 'Operaciones en China', 'Shanghái', '+86 1234567890', 'contact@apple.cn');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('B23023456C', 'Samsung UK', 'Filial de Samsung en el Reino Unido', 'Londres', '+44 2071234567', 'contact@samsung.uk');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('B68098765C', 'Amazon Canadá', 'Filial de Amazon en Canadá', 'Toronto', '+1 4161234567', 'contact@amazon.ca');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('B33012345C', 'IBM Australia', 'Filial de IBM en Australia', 'Sídney', '+61 291234567', 'contact@ibm.au');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('B55023456C', 'Huawei Europa', 'Filial de Huawei en Europa', 'París', '+33 14567890', 'contact@huawei.eu');


INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00001', 'B28012345C', 'Cliente 1 de Toyota España', 'Cliente corporativo', 'Madrid, España', '+34 911234111', 'cliente1@toyotaesp.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00002', 'B28012345C', 'Cliente 2 de Toyota España', 'Cliente corporativo', 'Barcelona, España', '+34 933456222', 'cliente2@toyotaesp.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00003', 'B11067890C', 'Cliente 1 de Google India', 'Cliente corporativo', 'Mumbai, India', '+91 2267218222', 'cliente1@googleind.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00004', 'B50054321C', 'Cliente 1 de Microsoft Europa', 'Cliente corporativo', 'Londres, Reino Unido', '+44 2079461111', 'cliente1@msfteur.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00005', 'B45087654C', 'Cliente 1 de Apple China', 'Cliente corporativo', 'Beijing, China', '+86 1082384511', 'cliente1@applechn.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00006', 'B23023456C', 'Cliente 1 de Samsung UK', 'Cliente corporativo', 'Londres, Reino Unido', '+44 2074941111', 'cliente1@samsunguk.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00007', 'B68098765C', 'Cliente 1 de Amazon Canadá', 'Cliente corporativo', 'Toronto, Canadá', '+1 8002025556', 'cliente1@amzncan.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00008', 'B33012345C', 'Cliente 1 de IBM Australia', 'Cliente corporativo', 'Sídney, Australia', '+61 293820111', 'cliente1@ibmaus.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00009', 'B55023456C', 'Cliente 1 de Huawei Europa', 'Cliente corporativo', 'París, Francia', '+33 142468111', 'cliente1@huaweieur.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00010', 'B33098765C', 'Cliente 1 de Toyota Asia', 'Cliente corporativo', 'Tokio, Japón', '+81 901234567', 'cliente1@toyotaasia.com');


INSERT INTO Proyecto (ID_proyecto, ID_cliente, Nombre, Descripcion, Fecha_inicio, Fecha_fin) VALUES ('PRO-00001', 'CLI-00001', 'Proyecto A', 'Desarrollo de software', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO Proyecto (ID_proyecto, ID_cliente, Nombre, Descripcion, Fecha_inicio, Fecha_fin) VALUES ('PRO-00002', 'CLI-00002', 'Proyecto B', 'Implementación de infraestructura', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'));
INSERT INTO Proyecto (ID_proyecto, ID_cliente, Nombre, Descripcion, Fecha_inicio, Fecha_fin) VALUES ('PRO-00003', 'CLI-00003', 'Proyecto C', 'Análisis de datos', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Proyecto (ID_proyecto, ID_cliente, Nombre, Descripcion, Fecha_inicio, Fecha_fin) VALUES ('PRO-00004', 'CLI-00004', 'Proyecto D', 'Desarrollo de aplicación móvil', TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'));
INSERT INTO Proyecto (ID_proyecto, ID_cliente, Nombre, Descripcion, Fecha_inicio, Fecha_fin) VALUES ('PRO-00005', 'CLI-00005', 'Proyecto E', 'Mejora de sistema existente', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'));
INSERT INTO Proyecto (ID_proyecto, ID_cliente, Nombre, Descripcion, Fecha_inicio, Fecha_fin) VALUES ('PRO-00006', 'CLI-00006', 'Proyecto F', 'Desarrollo de sitio web', TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-11-01', 'YYYY-MM-DD'));
INSERT INTO Proyecto (ID_proyecto, ID_cliente, Nombre, Descripcion, Fecha_inicio, Fecha_fin) VALUES ('PRO-00007', 'CLI-00007', 'Proyecto G', 'Migración a la nube', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD'));
INSERT INTO Proyecto (ID_proyecto, ID_cliente, Nombre, Descripcion, Fecha_inicio, Fecha_fin) VALUES ('PRO-00008', 'CLI-00008', 'Proyecto H', 'Consultoría en TI', TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'));
INSERT INTO Proyecto (ID_proyecto, ID_cliente, Nombre, Descripcion, Fecha_inicio, Fecha_fin) VALUES ('PRO-00009', 'CLI-00009', 'Proyecto I', 'Desarrollo de sistema integrado', TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'));
INSERT INTO Proyecto (ID_proyecto, ID_cliente, Nombre, Descripcion, Fecha_inicio, Fecha_fin) VALUES ('PRO-00010', 'CLI-00010', 'Proyecto J', 'Investigación y desarrollo', TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'));

INSERT INTO Empleado_Proyecto (ID_empleado, ID_proyecto, Rol) VALUES ('EMP-00001', 'PRO-00001', 'Desarrollador');
INSERT INTO Empleado_Proyecto (ID_empleado, ID_proyecto, Rol) VALUES ('EMP-00002', 'PRO-00002', 'Líder de proyecto');
INSERT INTO Empleado_Proyecto (ID_empleado, ID_proyecto, Rol) VALUES ('EMP-00003', 'PRO-00003', 'Analista de datos');
INSERT INTO Empleado_Proyecto (ID_empleado, ID_proyecto, Rol) VALUES ('EMP-00004', 'PRO-00004', 'Desarrollador móvil');
INSERT INTO Empleado_Proyecto (ID_empleado, ID_proyecto, Rol) VALUES ('EMP-00005', 'PRO-00005', 'Ingeniero de sistemas');
INSERT INTO Empleado_Proyecto (ID_empleado, ID_proyecto, Rol) VALUES ('EMP-00006', 'PRO-00006', 'Desarrollador web');
INSERT INTO Empleado_Proyecto (ID_empleado, ID_proyecto, Rol) VALUES ('EMP-00007', 'PRO-00007', 'Arquitecto de nube');
INSERT INTO Empleado_Proyecto (ID_empleado, ID_proyecto, Rol) VALUES ('EMP-00008', 'PRO-00008', 'Consultor');
INSERT INTO Empleado_Proyecto (ID_empleado, ID_proyecto, Rol) VALUES ('EMP-00009', 'PRO-00009', 'Desarrollador de sistema');
INSERT INTO Empleado_Proyecto (ID_empleado, ID_proyecto, Rol) VALUES ('EMP-00010', 'PRO-00010', 'Investigador');

INSERT INTO Proyecto_Tecnologia (ID_proyecto, ID_tecnologia) VALUES ('PRO-00001', 'TEC-00001');
INSERT INTO Proyecto_Tecnologia (ID_proyecto, ID_tecnologia) VALUES ('PRO-00002', 'TEC-00002');
INSERT INTO Proyecto_Tecnologia (ID_proyecto, ID_tecnologia) VALUES ('PRO-00003', 'TEC-00003');
INSERT INTO Proyecto_Tecnologia (ID_proyecto, ID_tecnologia) VALUES ('PRO-00004', 'TEC-00004');
INSERT INTO Proyecto_Tecnologia (ID_proyecto, ID_tecnologia) VALUES ('PRO-00005', 'TEC-00005');
INSERT INTO Proyecto_Tecnologia (ID_proyecto, ID_tecnologia) VALUES ('PRO-00006', 'TEC-00006');
INSERT INTO Proyecto_Tecnologia (ID_proyecto, ID_tecnologia) VALUES ('PRO-00007', 'TEC-00007');
INSERT INTO Proyecto_Tecnologia (ID_proyecto, ID_tecnologia) VALUES ('PRO-00008', 'TEC-00008');
INSERT INTO Proyecto_Tecnologia (ID_proyecto, ID_tecnologia) VALUES ('PRO-00009', 'TEC-00009');
