<<<<<<< HEAD
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

INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('TOYOTA-ESP', 'Toyota España', 'Distribuidor de vehículos en España', 'España', '+34 911234567', 'espana@toyota.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('TOYOTA-ASIA', 'Toyota Asia', 'Distribuidor de vehículos en Asia', 'Asia', '+81 123456789', 'asia@toyota.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('TOYOTA-USA', 'Toyota USA', 'Distribuidor de vehículos en USA', 'Estados Unidos', '+1 800123456', 'usa@toyota.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('MSFT-EUR', 'Microsoft Europa', 'Operaciones en Europa', 'Europa', '+44 2079460000', 'europe@microsoft.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('GOOGLE-IND', 'Google India', 'Oficina de Google en India', 'India', '+91 2267218000', 'india@google.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('APPLE-CHN', 'Apple China', 'Operaciones en China', 'China', '+86 1082384500', 'china@apple.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('SAMSUNG-UK', 'Samsung UK', 'Operaciones en Reino Unido', 'Reino Unido', '+44 2074940000', 'uk@samsung.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('AMZN-CAN', 'Amazon Canadá', 'Operaciones en Canadá', 'Canadá', '+1 8002025555', 'canada@amazon.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('IBM-AUS', 'IBM Australia', 'Operaciones en Australia', 'Australia', '+61 293820000', 'australia@ibm.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('HUAWEI-EUR', 'Huawei Europa', 'Operaciones en Europa', 'Europa', '+44 2078460000', 'europe@huawei.com');

INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00001', 'TOYOTA-ESP', 'Cliente 1 de Toyota España', 'Cliente corporativo', 'Madrid, España', '+34 911234111', 'cliente1@toyotaesp.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00002', 'TOYOTA-ESP', 'Cliente 2 de Toyota España', 'Cliente corporativo', 'Barcelona, España', '+34 933456222', 'cliente2@toyotaesp.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00003', 'GOOGLE-IND', 'Cliente 1 de Google India', 'Cliente corporativo', 'Mumbai, India', '+91 2267218222', 'cliente1@googleind.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00004', 'MSFT-EUR', 'Cliente 1 de Microsoft Europa', 'Cliente corporativo', 'Londres, Reino Unido', '+44 2079461111', 'cliente1@msfteur.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00005', 'APPLE-CHN', 'Cliente 1 de Apple China', 'Cliente corporativo', 'Beijing, China', '+86 1082384511', 'cliente1@applechn.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00006', 'SAMSUNG-UK', 'Cliente 1 de Samsung UK', 'Cliente corporativo', 'Londres, Reino Unido', '+44 2074941111', 'cliente1@samsunguk.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00007', 'AMZN-CAN', 'Cliente 1 de Amazon Canadá', 'Cliente corporativo', 'Toronto, Canadá', '+1 8002025556', 'cliente1@amzncan.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00008', 'IBM-AUS', 'Cliente 1 de IBM Australia', 'Cliente corporativo', 'Sydney, Australia', '+61 293820111', 'cliente1@ibmaus.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00009', 'HUAWEI-EUR', 'Cliente 1 de Huawei Europa', 'Cliente corporativo', 'París, Francia', '+33 142468111', 'cliente1@huaweieur.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00010', 'TOYOTA-USA', 'Cliente 1 de Toyota USA', 'Cliente corporativo', 'Nueva York, USA', '+1 800123457', 'cliente1@toyotausa.com');

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
=======
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

INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('TOYOTA-ESP', 'Toyota España', 'Distribuidor de vehículos en España', 'España', '+34 911234567', 'espana@toyota.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('TOYOTA-ASIA', 'Toyota Asia', 'Distribuidor de vehículos en Asia', 'Asia', '+81 123456789', 'asia@toyota.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('TOYOTA-USA', 'Toyota USA', 'Distribuidor de vehículos en USA', 'Estados Unidos', '+1 800123456', 'usa@toyota.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('MSFT-EUR', 'Microsoft Europa', 'Operaciones en Europa', 'Europa', '+44 2079460000', 'europe@microsoft.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('GOOGLE-IND', 'Google India', 'Oficina de Google en India', 'India', '+91 2267218000', 'india@google.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('APPLE-CHN', 'Apple China', 'Operaciones en China', 'China', '+86 1082384500', 'china@apple.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('SAMSUNG-UK', 'Samsung UK', 'Operaciones en Reino Unido', 'Reino Unido', '+44 2074940000', 'uk@samsung.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('AMZN-CAN', 'Amazon Canadá', 'Operaciones en Canadá', 'Canadá', '+1 8002025555', 'canada@amazon.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('IBM-AUS', 'IBM Australia', 'Operaciones en Australia', 'Australia', '+61 293820000', 'australia@ibm.com');
INSERT INTO Afiliados (CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('HUAWEI-EUR', 'Huawei Europa', 'Operaciones en Europa', 'Europa', '+44 2078460000', 'europe@huawei.com');

INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00001', 'TOYOTA-ESP', 'Cliente 1 de Toyota España', 'Cliente corporativo', 'Madrid, España', '+34 911234111', 'cliente1@toyotaesp.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00002', 'TOYOTA-ESP', 'Cliente 2 de Toyota España', 'Cliente corporativo', 'Barcelona, España', '+34 933456222', 'cliente2@toyotaesp.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00003', 'GOOGLE-IND', 'Cliente 1 de Google India', 'Cliente corporativo', 'Mumbai, India', '+91 2267218222', 'cliente1@googleind.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00004', 'MSFT-EUR', 'Cliente 1 de Microsoft Europa', 'Cliente corporativo', 'Londres, Reino Unido', '+44 2079461111', 'cliente1@msfteur.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00005', 'APPLE-CHN', 'Cliente 1 de Apple China', 'Cliente corporativo', 'Beijing, China', '+86 1082384511', 'cliente1@applechn.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00006', 'SAMSUNG-UK', 'Cliente 1 de Samsung UK', 'Cliente corporativo', 'Londres, Reino Unido', '+44 2074941111', 'cliente1@samsunguk.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00007', 'AMZN-CAN', 'Cliente 1 de Amazon Canadá', 'Cliente corporativo', 'Toronto, Canadá', '+1 8002025556', 'cliente1@amzncan.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00008', 'IBM-AUS', 'Cliente 1 de IBM Australia', 'Cliente corporativo', 'Sydney, Australia', '+61 293820111', 'cliente1@ibmaus.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00009', 'HUAWEI-EUR', 'Cliente 1 de Huawei Europa', 'Cliente corporativo', 'París, Francia', '+33 142468111', 'cliente1@huaweieur.com');
INSERT INTO Cliente (ID_cliente, CIF_empresa, Nombre, Descripcion, Localizacion, Telefono, Email) VALUES ('CLI-00010', 'TOYOTA-USA', 'Cliente 1 de Toyota USA', 'Cliente corporativo', 'Nueva York, USA', '+1 800123457', 'cliente1@toyotausa.com');

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
>>>>>>> d51809d15aeb865a5a0f539ea226840c70b115ab
INSERT INTO Proyecto_Tecnologia (ID_proyecto, ID_tecnologia) VALUES ('PRO-00010', 'TEC-00001');