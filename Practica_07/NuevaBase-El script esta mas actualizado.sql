/*	
	Yo esperaba que mi equipo de BD trabajara pero no fue asi
	quedamos que harian la base de datos y yo programaba, asi
	que decidi esperar la base de datos, por lo que use otra.
*/


-- Practica 01 "Crear la base de datos ----------------------------------------------------------------------------------



-- Practica 02 Crear tablas ---------------------------------------------------------------------------------------------

CREATE TABLE [Persona] -- Tenemos PERSONA s como usted, como yo
( 
	[IdPersona] uniqueidentifier NOT NULL PRIMARY KEY, 
	[Nombre] varchar(50) NOT NULL,
	[ApPaterno]	varchar(50) NOT NULL,
	[ApMaterno]	varchar(50) NOT NULL,
	[FechaNac] date NOT NULL,
	[Edad] AS (datediff(year, [FechaNac], getDate()))
)

CREATE TABLE [ContactoPersona] -- Debemos contactar a las PERSONA por cualquier cosa
(
	[IdContactoPersona] uniqueidentifier NOT NULL PRIMARY KEY, 
	[IdPersona] uniqueidentifier NOT NULL,
	[Telefono] float NOT NULL,
	[Correo] varchar(50) NOT NULL,
)

CREATE TABLE [DireccionPersona] -- Las PERSONA s a parte de contacto tienen una DIRECCION
(
	[IdDireccion] int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	[IdPersona] uniqueidentifier NOT NULL,
	[CalleNum] varchar(50) NOT NULL,
	[Municipio] varchar(50) NOT NULL,
	[IdEstado] varchar(50) NOT NULL
)

CREATE TABLE [Estado] -- Esa DIRECCION tiene un ESTADO, solo normalizaremos estados y no municipios
(
	[IdDireccion] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Estado] varchar(50) NOT NULL
)
	
CREATE TABLE [Paciente] -- Una PERSONA puede ser un paciente o 
( 
	[IdPaciente] uniqueidentifier NOT NULL PRIMARY KEY, 
	[IdPersona] uniqueidentifier NOT NULL,
	[Peso] float NOT NULL,
	[Altura] float NOT NULL,
)

CREATE TABLE [Empleado] -- Un EMPLEADO
( 
	[IdEmpleado] uniqueidentifier NOT NULL PRIMARY KEY, 
	[IdPersona] uniqueidentifier NOT NULL,
	[Sueldo] float NOT NULL,
	[Encargado] varchar(50) NOT NULL,
	[Contraseña] varchar(50) NOT NULL,
	[PuestoEmpleado] int NOT NULL
) 

CREATE TABLE [PuestoEmpleado] -- Cada EMPLEADO tiene un puesto diferente 
(
	[IdNivelEmpleado] int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	[Puesto] varchar(50) NOT NULL
)

CREATE TABLE [OIEmpleados] -- Registro de cada EMPLEADO cuando entra y sale del empleo
(
	[IdOIEmpleados] uniqueidentifier NOT NULL,
	[IdEmpleado] uniqueidentifier NOT NULL, 
	[FechaEntrada] date NOT NULL,
	[FechaSalida] date
)

CREATE TABLE [Medico] -- Solo EMPLEADO con cedula pueden ser medicos y/o consultar
( 
	[IdMedico] int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	[IdEmpleado] uniqueidentifier,
	[Cedula] varchar(50) NOT NULL
) 

CREATE TABLE [Consulta] -- Un MEDICO y un PACIENTE se unen en una CONSULTA que se realiza en un 
( 
	[IdConsulta]uniqueidentifier NOT NULL PRIMARY KEY,
	[IdPaciente] uniqueidentifier NOT NULL,
	[IdMedico]int, -- Puede tener nulos por que no se sabe que MEDICO atendera
	[FechaHora] datetime NOT NULL,
	[IdConsultorio] int, -- Puede tener nulos por que no se sabe en que CONSULTORIO se atendera
	[IdEstatus] varchar(50) NOT NULL,  -- Y tiene un estatus (Pendiente | Activa | Terminada) pendiente es si se agendo
	[Notas] varchar(300), -- Notas o alaraciones de la CONSULTA (Esto es aparte de la prescripcion)
	[Costo]float NOT NULL -- Cada consulta tiene un costo
)

CREATE TABLE [Consultorio] -- CONSULTORIO de los (varios) que estan en una 
(
	[IdConsultorio] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IdSucursal] int NOT NULL, 
	[NumConsultorio] int NOT NULL
)

 -- SUCURSAL que debe ser Farmacia/Consultorio (Hospital) la creacion se ve mas abajo
 

CREATE TABLE [Estatus] -- (Pendiente | Activa | Terminada) pendiente es si se agendo
(
	[IdEstatus] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Descripcion] varchar(50)
)

CREATE TABLE [Prescripcion]  -- Cada PRESCRIPCION pertenece a una CONSULTA con ESTATUS: Terminada o Activa Y tiene
(
	[IdPrescripcion] uniqueidentifier NOT NULL PRIMARY KEY,
	[IdConsulta] uniqueidentifier NOT NULL,
	[IdMedicamento] uniqueidentifier NOT NULL,
	[Cantidad] int NOT NULL, -- Esto es por cada MEDICAMENTO(Producto), cada uno tiene difententes indicaciones
	[Indicaciones] varchar(300) NOT NULL
)

CREATE TABLE [Medicamento] -- Un MEDICAMENTO que tiene una 
(
	[IdMedicamento] uniqueidentifier NOT NULL PRIMARY KEY,
	[Nombre] varchar(50) NOT NULL,
	[Descripcion] varchar(50) NOT NULL,
	[IdCategoria] int IDENTITY(1,1) NOT NULL,
	[IdProveedor] int NOT NULL,
	[IdLaboratorio] int NOT NULL,
	[NombreGen] varchar(50) NOT NULL,
	[PrecioBase] float NOT NULL
)

CREATE TABLE [Categoria] -- Un MEDICAMENTO que tiene una  CATEGORIA
(
	[IdCategoria] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Descripcion] varchar(50) NOT NULL
)

CREATE TABLE [Empresa] -- Una Empresa puede tener varias sucursales que pueden ser laboratorios consultotios o distribuidores
(
	[IdEmpresa] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nombre] varchar(50) NOT NULL
)

CREATE TABLE [Sucursal] -- Se utiliza para normalizar mas, ya que el DISTRIBUIDOR y PROVEEDOR pueden sre iguales
(
	[IdSucursal] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nombre] varchar(50) NOT NULL,
	[IdEmpresa] int
)

CREATE TABLE [DireccionSucursales] -- Las SUCURSALES tiene una DIRECCION
(
	[IdDireccionSucursal]int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	[IdSucursal] int NOT NULL,
	[CalleNum] varchar(50) NOT NULL,
	[Municipio] varchar(50) NOT NULL,
	[IdEstado] varchar(50) NOT NULL  -- El ESTADO es el mismo que DIRECCION de las personas
)

CREATE TABLE [ContactoSucursal] -- Debemos contactar a las SUCURSALES por cualquier cosa
(
	[IdContactoSucursal] uniqueidentifier NOT NULL PRIMARY KEY, 
	[IdSucursal] int NOT NULL,
	[Telefono] float NOT NULL,
	[Correo] varchar(50) NOT NULL
)

CREATE TABLE [Proveedor] -- Para ser una SUCURSAL que distribuye se debe tener una LICENCIA
(
	[IdProveedor] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IdSucursal] int NOT NULL,
	[LicenciaProveedor] varchar(50) NOT NULL
)

CREATE TABLE [Laboratorio] -- Para ser una SUCURSAL que crea MEDICAMENTO se debe tener una LICENCIA
(
	[IdLaboratiorio] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IdSucursal] int NOT NULL,
	[LicenciaLaboratorio] varchar(50) NOT NULL
)

-- Practica 03 Se crearon varais tablas, ya esta en git -----------------------------------------------------------------



-- Practica 04 INSERT DELETES UPDATES -----------------------------------------------------------------------------------


INSERT INTO Persona ([IdPersona],[Nombre],[ApPaterno],[ApMaterno],[FechaNac]) -- Los uniqueidentifier se llenan con NEWID()
VALUES (NEWID(),'Angel', 'Pacheco', 'Mazuca', '1997/12/02')

INSERT INTO Persona ([IdPersona],[Nombre],[ApPaterno],[ApMaterno],[FechaNac]) -- Los uniqueidentifier se llenan con NEWID()
VALUES (NEWID(),'Jesus', 'Pacheco', 'Mazuca', '2000/09/19')

INSERT INTO Persona ([IdPersona],[Nombre],[ApPaterno],[ApMaterno],[FechaNac]) -- Los uniqueidentifier se llenan con NEWID()
VALUES (NEWID(),'Fatima', 'Garcia', 'Campos', '1998/02/28')

INSERT INTO Persona ([IdPersona],[Nombre],[ApPaterno],[ApMaterno],[FechaNac]) -- Los uniqueidentifier se llenan con NEWID()
VALUES (NEWID(),'Dinora', 'Mazuca', 'Cortez', '1974/11/19')

INSERT INTO Persona ([IdPersona],[Nombre],[ApPaterno],[ApMaterno],[FechaNac]) -- Los uniqueidentifier se llenan con NEWID()
VALUES (NEWID(),'Angelica', 'Mazuca', 'Cortez', '1971/06/12')

INSERT INTO Persona ([IdPersona],[Nombre],[ApPaterno],[ApMaterno],[FechaNac]) -- Los uniqueidentifier se llenan con NEWID()
VALUES (NEWID(),'Nancy', 'Rodulfo', 'Mazuca', '1998/03/28')

INSERT INTO Persona ([IdPersona],[Nombre],[ApPaterno],[ApMaterno],[FechaNac]) -- Los uniqueidentifier se llenan con NEWID()
VALUES (NEWID(),'Hilder', 'Pacheco', 'Navarro', '1974/06/27')

INSERT INTO Persona ([IdPersona],[Nombre],[ApPaterno],[ApMaterno],[FechaNac]) -- Los uniqueidentifier se llenan con NEWID()
VALUES (NEWID(),'Brandon', 'Torres', 'Lopez', '2001/12/07')

INSERT INTO Persona ([IdPersona],[Nombre],[ApPaterno],[ApMaterno],[FechaNac]) -- Los uniqueidentifier se llenan con NEWID()
VALUES (NEWID(),'Karla', 'Gomez', 'Ortiz', '2001/05/03')

INSERT INTO Persona ([IdPersona],[Nombre],[ApPaterno],[ApMaterno],[FechaNac]) -- Los uniqueidentifier se llenan con NEWID()
VALUES (NEWID(),'Mau', 'A.K.A.', 'Aczecino', '1991/06/02')

--------------------------------------------------

INSERT ContactoPersona ([IdContactoPersona], [IdPersona],[Telefono],[Correo])
VALUES (NEWID(),'0F441DCB-643D-4D56-B9BA-17B40F4885EE', 8125649525 , 'nancy@gmail.com')

INSERT ContactoPersona ([IdContactoPersona], [IdPersona],[Telefono],[Correo])
VALUES (NEWID(),'76F51205-9938-4076-A004-3BCBF929C28E', 8145256574 , 'Mau@gmail.com')

INSERT ContactoPersona ([IdContactoPersona], [IdPersona],[Telefono],[Correo])
VALUES (NEWID(),'A738A865-A13A-4167-AF8B-403EFD85D57A', 8165754295 , 'Karla@gmail.com')

INSERT ContactoPersona ([IdContactoPersona], [IdPersona],[Telefono],[Correo])
VALUES (NEWID(),'60EF99DC-B7C1-4795-B470-62F0545AD3DC', 8112361254 , 'Angelica@gmail.com')

INSERT ContactoPersona ([IdContactoPersona], [IdPersona],[Telefono],[Correo])
VALUES (NEWID(),'A3E4E040-36BA-45ED-A0B8-997E5C57F50B', 8116421527 , 'Angel@gmail.com')

INSERT ContactoPersona ([IdContactoPersona], [IdPersona],[Telefono],[Correo])
VALUES (NEWID(),'93CE6098-5DA4-44E0-AA1B-A292ED3C52B1', 8136491546 , 'Jesus@gmail.com')

INSERT ContactoPersona ([IdContactoPersona], [IdPersona],[Telefono],[Correo])
VALUES (NEWID(),'953AE812-A5FE-4E51-A4EC-BEFED6DD01CD', 81124512475 , 'Dinora@gmail.com')

INSERT ContactoPersona ([IdContactoPersona], [IdPersona],[Telefono],[Correo])
VALUES (NEWID(),'C213BA90-CF82-4A0F-AAF6-C47B09041750', 81461237516 , 'Fatima@gmail.com')

INSERT ContactoPersona ([IdContactoPersona], [IdPersona],[Telefono],[Correo])
VALUES (NEWID(),'CB6FFFF7-04D5-4EC4-A899-E6A096810C67', 81367619754 , 'Hilder@gmail.com')

INSERT ContactoPersona ([IdContactoPersona], [IdPersona],[Telefono],[Correo])
VALUES (NEWID(),'127D6CF2-97DB-4CCF-8C09-EDB230E50E63', 86197219726 , 'Brandon@gmail.com')

--------------------------------------------------

INSERT Estado([Estado])
VALUES ('Nuevo Leon')

--------------------------------------------------

INSERT DireccionPersona([IdPersona],[CalleNum],[Municipio],[IdEstado])
VALUES ('0F441DCB-643D-4D56-B9BA-17B40F4885EE', 'San Sebastian 304','Juarez',1)

INSERT DireccionPersona([IdPersona],[CalleNum],[Municipio],[IdEstado])
VALUES ('76F51205-9938-4076-A004-3BCBF929C28E', 'San Jorge 324','Juarez',1)

INSERT DireccionPersona([IdPersona],[CalleNum],[Municipio],[IdEstado])
VALUES ('A738A865-A13A-4167-AF8B-403EFD85D57A', 'Santa Cecilia','Juarez',1)

INSERT DireccionPersona([IdPersona],[CalleNum],[Municipio],[IdEstado])
VALUES ('60EF99DC-B7C1-4795-B470-62F0545AD3DC', 'Tepeyac 615','Independencia',1)

INSERT DireccionPersona([IdPersona],[CalleNum],[Municipio],[IdEstado])
VALUES ('A3E4E040-36BA-45ED-A0B8-997E5C57F50B', 'Pablo ll','Independencia',1)

INSERT DireccionPersona([IdPersona],[CalleNum],[Municipio],[IdEstado])
VALUES ('93CE6098-5DA4-44E0-AA1B-A292ED3C52B1', 'Jimenez 403','Guadalupe',1)

INSERT DireccionPersona([IdPersona],[CalleNum],[Municipio],[IdEstado])
VALUES ('953AE812-A5FE-4E51-A4EC-BEFED6DD01CD', 'Agistin Melgar 304','Guadalupe',1)

INSERT DireccionPersona([IdPersona],[CalleNum],[Municipio],[IdEstado])
VALUES ('C213BA90-CF82-4A0F-AAF6-C47B09041750', 'Jose Agustin Melgar 304','Monterrey',1)

INSERT DireccionPersona([IdPersona],[CalleNum],[Municipio],[IdEstado])
VALUES ('CB6FFFF7-04D5-4EC4-A899-E6A096810C67', 'Av. Guerrero 105','San Nicolas',1)

INSERT DireccionPersona([IdPersona],[CalleNum],[Municipio],[IdEstado])
VALUES ('127D6CF2-97DB-4CCF-8C09-EDB230E50E63', 'Privada Famosa 102','San Nicolas',1)

--------------------------------------------------

INSERT INTO Paciente ([IdPaciente],[IdPersona], [Peso], [Altura])
VALUES (NEWID(),'A3E4E040-36BA-45ED-A0B8-997E5C57F50B', 100, 1.70) -- angel

INSERT INTO Paciente ([IdPaciente],[IdPersona], [Peso], [Altura])
VALUES (NEWID(),'80DE71F7-6575-4554-8C6E-804546324896', 105, 1.73) -- jeuss

INSERT INTO Paciente ([IdPaciente],[IdPersona], [Peso], [Altura])
VALUES (NEWID(),'0F441DCB-643D-4D56-B9BA-17B40F4885EE', 52, 1.51) -- nancy

INSERT INTO Paciente ([IdPaciente],[IdPersona], [Peso], [Altura])
VALUES (NEWID(),'76F51205-9938-4076-A004-3BCBF929C28E', 95, 1.72) -- mau

INSERT INTO Paciente ([IdPaciente],[IdPersona], [Peso], [Altura])
VALUES (NEWID(),'A738A865-A13A-4167-AF8B-403EFD85D57A', 60, 1.60) -- karla

INSERT INTO Paciente ([IdPaciente],[IdPersona], [Peso], [Altura])
VALUES (NEWID(),'60EF99DC-B7C1-4795-B470-62F0545AD3DC', 64, 1.50) -- angelica

INSERT INTO Paciente ([IdPaciente],[IdPersona], [Peso], [Altura])
VALUES (NEWID(),'953AE812-A5FE-4E51-A4EC-BEFED6DD01CD', 91, 1.56) -- dinora

INSERT INTO Paciente ([IdPaciente],[IdPersona], [Peso], [Altura])
VALUES (NEWID(),'C213BA90-CF82-4A0F-AAF6-C47B09041750', 68, 1.62) -- fatima

--------------------------------------------------

INSERT INTO PuestoEmpleado ([Puesto])
VALUES ('Secretaria') -- Secretaria

INSERT INTO PuestoEmpleado ([Puesto])
VALUES ('Almacen') -- Almacen

INSERT INTO PuestoEmpleado ([Puesto])
VALUES ('Medico') -- Medico

INSERT INTO PuestoEmpleado ([Puesto])
VALUES ('Sistemas') -- Sistemas

--------------------------------------------------

INSERT INTO [Empleado] ([IdEmpleado],[IdPersona],[Sueldo],[Encargado],[Contraseña],[PuestoEmpleado])
VALUES (NEWID(),'CB6FFFF7-04D5-4EC4-A899-E6A096810C67', 10000, 'CB6FFFF7-04D5-4EC4-A899-E6A096810C67', '123asdf', 3) 

INSERT INTO [Empleado] ([IdEmpleado],[IdPersona],[Sueldo],[Encargado],[Contraseña],[PuestoEmpleado])
VALUES (NEWID(),'127D6CF2-97DB-4CCF-8C09-EDB230E50E63', 5000,  'CB6FFFF7-04D5-4EC4-A899-E6A096810C67', '123asdf', 2)

--------------------------------------------------

INSERT INTO [OIEmpleados] ([IdOIEmpleados],[IdEmpleado],[FechaEntrada])
VALUES (NEWID(),'B7C35EFF-3E36-43FC-B654-2825E8A149F5', '2017/11/01')

INSERT INTO [OIEmpleados] ([IdOIEmpleados],[IdEmpleado],[FechaEntrada])
VALUES (NEWID(),'E9E724A4-FFC3-4D1D-9C25-CBD46F4A4BB2', '2017/11/01')

--------------------------------------------------

INSERT INTO [Medico] ([IdEmpleado],[Cedula])
VALUES ('B7C35EFF-3E36-43FC-B654-2825E8A149F5', 'NOMESELAESTRUCTURADELACEDULA')

--------------------------------------------------

INSERT INTO Estatus ([Descripcion])
VALUES ('Pendiente') -- Pendiente

INSERT INTO Estatus ([Descripcion])
VALUES ('Activa') -- Activa

INSERT INTO Estatus ([Descripcion])
VALUES ('Terminada') -- Terminada

--------------------------------------------------

INSERT INTO Empresa ([Nombre])	-- Los IDENTITY se omiten en la lista
VALUES ('Missalvacion' )

INSERT INTO Empresa ([Nombre])	-- Los IDENTITY se omiten en la lista
VALUES ('LabCorp' )

INSERT INTO Empresa ([Nombre])	-- Los IDENTITY se omiten en la lista
VALUES ('TransDrugs' )

--------------------------------------------------

INSERT INTO Sucursal ([Nombre], [IdEmpresa] ) -- Los IDENTITY se omiten en la lista
VALUES ('Missalvacion', 1 )

INSERT INTO Sucursal ([Nombre], [IdEmpresa] ) -- Los IDENTITY se omiten en la lista
VALUES ('Las Torres', 1 )

INSERT INTO Sucursal ([Nombre], [IdEmpresa] ) -- Los IDENTITY se omiten en la lista
VALUES ('San Nicolas', 2 )

INSERT INTO Sucursal ([Nombre], [IdEmpresa] ) -- Los IDENTITY se omiten en la lista
VALUES ('Lab Estanzuela', 2 )

INSERT INTO Sucursal ([Nombre], [IdEmpresa] ) -- Los IDENTITY se omiten en la lista
VALUES ('TransDrugs Monterrey', 3 )

INSERT INTO Sucursal ([Nombre], [IdEmpresa] ) -- Los IDENTITY se omiten en la lista
VALUES ('TransDrugs Juarez', 3 )

--------------------------------------------------

INSERT INTO Consultorio ([IdSucursal], [NumConsultorio] ) -- Los IDENTITY se omiten en la lista
VALUES (1, 1)

--------------------------------------------------

INSERT INTO DireccionSucursales([IdSucursal],[CalleNum],[Municipio],[IdEstado])
VALUES (1, 'Privada Famosa 102','San Nicolas',1)

INSERT INTO DireccionSucursales([IdSucursal],[CalleNum],[Municipio],[IdEstado])
VALUES (2, 'Privada Famosa 103','San Nicolas',1)

INSERT INTO DireccionSucursales([IdSucursal],[CalleNum],[Municipio],[IdEstado])
VALUES (3, 'San Nicolas 1102','San Nicolas',1)

INSERT INTO DireccionSucursales([IdSucursal],[CalleNum],[Municipio],[IdEstado])
VALUES (4, 'Estanzuela 103','Estanzuela',1)

INSERT INTO DireccionSucursales([IdSucursal],[CalleNum],[Municipio],[IdEstado])
VALUES (5, 'Monterrey 2102','Monterrey',1)

INSERT INTO DireccionSucursales([IdSucursal],[CalleNum],[Municipio],[IdEstado])
VALUES (6, 'Juarez 1033','Juarez',1)

--------------------------------------------------

INSERT INTO ContactoSucursal ([IdContactoSucursal],[IdSucursal],[Telefono],[Correo])
VALUES(NEWID(), 1, 8123654852, 'Missalvacion@gmail.com')

INSERT INTO ContactoSucursal ([IdContactoSucursal],[IdSucursal],[Telefono],[Correo])
VALUES(NEWID(), 2, 8123651885, 'LasTorres@gmail.com')

INSERT INTO ContactoSucursal ([IdContactoSucursal],[IdSucursal],[Telefono],[Correo])
VALUES(NEWID(), 3, 8123544852, 'San_Nicolas@gmail.com')

INSERT INTO ContactoSucursal ([IdContactoSucursal],[IdSucursal],[Telefono],[Correo])
VALUES(NEWID(), 4, 8143231285, 'Lab_Estanzuela@gmail.com')

INSERT INTO ContactoSucursal ([IdContactoSucursal],[IdSucursal],[Telefono],[Correo])
VALUES(NEWID(), 5, 8123453352, 'TransDrugs_Monterrey@gmail.com')

INSERT INTO ContactoSucursal ([IdContactoSucursal],[IdSucursal],[Telefono],[Correo])
VALUES(NEWID(), 6, 8133331885, 'TransDrugs_Juarez@gmail.com')

--------------------------------------------------

INSERT INTO Categoria ([Descripcion])
VALUES ('VentaLibre')

INSERT INTO Categoria ([Descripcion])
VALUES ('Antibioticos')

INSERT INTO Categoria ([Descripcion])
VALUES ('Pscotropicos')

INSERT INTO Categoria ([Descripcion])
VALUES ('Cronico')

--------------------------------------------------

INSERT INTO Medicamento ([IdMedicamento],[Nombre],[Descripcion],[IdCategoria],[IdProveedor],[IdLaboratorio],[NombreGen],[PrecioBase] )
VALUES (NEWID(), 'Paracetamol', 'Dolor de cabeza y fiebre, 500mg',1,5,3,'Paracetamol', 7 )

INSERT INTO Medicamento ([IdMedicamento],[Nombre],[Descripcion],[IdCategoria],[IdProveedor],[IdLaboratorio],[NombreGen],[PrecioBase] )
VALUES (NEWID(), 'Rosel', 'Fiebre, estornudos y cuerpo cortado, 500mg',1,6,4,'Clorfenamina, Anamtadina, Paracetamol', 28 )

INSERT INTO Medicamento ([IdMedicamento],[Nombre],[Descripcion],[IdCategoria],[IdProveedor],[IdLaboratorio],[NombreGen],[PrecioBase] )
VALUES (NEWID(), 'Clamoxin', 'Infecciones respiratorias, 875/125mg',2,5,3,'Amoxicilina / acido clabulanico', 98 )

INSERT INTO Medicamento ([IdMedicamento],[Nombre],[Descripcion],[IdCategoria],[IdProveedor],[IdLaboratorio],[NombreGen],[PrecioBase] )
VALUES (NEWID(), 'Clonacepam', 'Para dormir, 2mg',3,6,4,'Ribotrilp', 81 )

INSERT INTO Medicamento ([IdMedicamento],[Nombre],[Descripcion],[IdCategoria],[IdProveedor],[IdLaboratorio],[NombreGen],[PrecioBase] )
VALUES (NEWID(), 'Metformina', 'Diabetes, 850mg',4,6,4,'Glucobance', 55 )

--------------------------------------------------

INSERT INTO Consulta ([IdConsulta], [IdPaciente],[IdMedico],[FechaHora],[IdConsultorio],[IdEstatus],[Notas],[Costo])
VALUES (NEWID(),'6E634DF6-19A6-48C3-BEA9-3F683C8B451C',1, '2017-11-05 07:30:00', 1,3,'Dolor de cabeza izzi',300 )

--------------------------------------------------

INSERT INTO Prescripcion ([IdPrescripcion],[IdConsulta],[IdMedicamento],[Cantidad],[Indicaciones])
VALUES (NEWID(),'225BB75B-01A7-4CFD-A834-14B20B30E3C2', 'C5367B46-6DCC-4DF3-9FC1-15BEDAB7F024', 2, 'Casa 6 horas por 3 dias')

-- Practica 05 Funciones agregadas --------------------------------------------------------------------------------------

SELECT COUNT(Municipio) As 'Personas que viven en:',Municipio
FROM DireccionPersona
GROUP BY DireccionPersona.Municipio

SELECT SUM(Medicamento.PrecioBase) AS 'PrecioMedicamnetos'
FROM Medicamento

SELECT MIN(Medicamento.PrecioBase) as 'PrecioMasBajo'
FROM Medicamento

SELECT AVG(Medicamento.PrecioBase) as 'PromedioPrecioVenta'
FROM Medicamento

SELECT AVG(Medicamento.PrecioBase) as 'PromedioPrecioVenta-ColorNegro'
FROM Medicamento
WHERE Medicamento.IdProveedor = 5

SELECT AVG(Medicamento.PrecioBase) as 'PromedioPrecioVenta-ColorNegro'
FROM Medicamento
WHERE Medicamento.IdLaboratorio = 4


