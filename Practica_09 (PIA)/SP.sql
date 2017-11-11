
CREATE PROCEDURE NuevoProveedor
@NombreEmpresa varchar(50),
@NombreSucursal varchar(50),
-- -------------- DIRECCION 
@CalleNum	varchar(50),
@Municipio	varchar(50),
@Estado	int,
-- -------------- CONTACTO
@Telefono float,
@Correo varchar(50),
-- -------------- PROVEEDOR
@Licencia varchar(50)
as
begin 
	INSERT INTO Empresa ([Nombre])
	VALUES (@NombreEmpresa)
	INSERT INTO Sucursal ([Nombre], [IdEmpresa] ) -- Los IDENTITY se omiten en la lista
	VALUES (@NombreSucursal, (SELECT IdEmpresa from Empresa where Nombre = @NombreEmpresa) )
	INSERT INTO DireccionSucursales([IdSucursal],[CalleNum],[Municipio],[IdEstado])
	VALUES ((SELECT IdSucursal from Sucursal JOIN Empresa ON Sucursal.IdEmpresa = Empresa.IdEmpresa where Sucursal.Nombre = @NombreSucursal AND Empresa.Nombre = @NombreEmpresa ) , @CalleNum,@Municipio,@Estado	)
	INSERT INTO ContactoSucursal ([IdContactoSucursal],[IdSucursal],[Telefono],[Correo])
	VALUES(NEWID(), (SELECT IdSucursal from Sucursal JOIN Empresa ON Sucursal.IdEmpresa = Empresa.IdEmpresa where Sucursal.Nombre = @NombreSucursal AND Empresa.Nombre = @NombreEmpresa ), @Telefono, @Correo)
	INSERT INTO Proveedor(IdSucursal, LicenciaProveedor)
	VALUES((SELECT IdSucursal from Sucursal JOIN Empresa ON Sucursal.IdEmpresa = Empresa.IdEmpresa where Sucursal.Nombre = @NombreSucursal AND Empresa.Nombre = @NombreEmpresa ), @Licencia)
end

exec NuevoProveedor 'Laboratorios Stark' , 'Las Lomas', 'Las lomas 330', 'Juarez', 1, 8121964406, 'stark_lasLomas@gmail.com' , 'La licencia'


CREATE PROCEDURE NuevoLaboratorio
@NombreEmpresa varchar(50),
@NombreSucursal varchar(50),
-- -------------- DIRECCION 
@CalleNum	varchar(50),
@Municipio	varchar(50),
@Estado	int,
-- -------------- CONTACTO
@Telefono float,
@Correo varchar(50),
-- -------------- PROVEEDOR
@Licencia varchar(50)
as
begin 
	INSERT INTO Empresa ([Nombre])
	VALUES (@NombreEmpresa)
	INSERT INTO Sucursal ([Nombre], [IdEmpresa] ) -- Los IDENTITY se omiten en la lista
	VALUES (@NombreSucursal, (SELECT IdEmpresa from Empresa where Nombre = @NombreEmpresa) )
	INSERT INTO DireccionSucursales([IdSucursal],[CalleNum],[Municipio],[IdEstado])
	VALUES ((SELECT IdSucursal from Sucursal JOIN Empresa ON Sucursal.IdEmpresa = Empresa.IdEmpresa where Sucursal.Nombre = @NombreSucursal AND Empresa.Nombre = @NombreEmpresa ) , @CalleNum,@Municipio,@Estado	)
	INSERT INTO ContactoSucursal ([IdContactoSucursal],[IdSucursal],[Telefono],[Correo])
	VALUES(NEWID(), (SELECT IdSucursal from Sucursal JOIN Empresa ON Sucursal.IdEmpresa = Empresa.IdEmpresa where Sucursal.Nombre = @NombreSucursal AND Empresa.Nombre = @NombreEmpresa ), @Telefono, @Correo)
	INSERT INTO Laboratorio(IdSucursal, LicenciaLaboratorio)
	VALUES((SELECT IdSucursal from Sucursal JOIN Empresa ON Sucursal.IdEmpresa = Empresa.IdEmpresa where Sucursal.Nombre = @NombreSucursal AND Empresa.Nombre = @NombreEmpresa ), @Licencia)
end
exec NuevoLaboratorio 'Laboratorios Q' , 'Las Lermas', 'Las Lermas 330', 'Lermas', 1, 8121365206, 'stark_laslermas@gmail.com' , 'La licencia'


-- Solo funciona cuando es nuevo empresa  NuevoLaboratorio | NuevoProveedor


CREATE PROCEDURE NuevoMedicamento
@Nombre varchar(50),
@Descripcion varchar(50),
@IdCategoria int, 
@IdProvedor int, 
@IdLaboratorio int,
@NombreGenerico  varchar(50),
@PrecioBase float
as
begin 
	INSERT INTO Medicamento ([IdMedicamento],[Nombre],[Descripcion],[IdCategoria],[IdProveedor],[IdLaboratorio],[NombreGen],[PrecioBase] )
	VALUES (NEWID(), @Nombre, @Descripcion,@IdCategoria,@IdProvedor,@IdLaboratorio ,@NombreGenerico, @PrecioBase )
end


CREATE PROCEDURE NuevoEmpleado
@IdPersona uniqueidentifier,
@Sueldo float, 
@Encargado uniqueidentifier, 
@Contraseña varchar(50),
@PuestoEmpleado int
as
begin 
	INSERT INTO Empleado (IdEmpleado, IdPersona, Sueldo, Encargado, Contraseña, PuestoEmpleado )
	VALUES (NEWID(),@IdPersona,@Sueldo,@Encargado,@Contraseña,@PuestoEmpleado  )
	INSERT INTO OIEmpleados(IdOIEmpleados,IdEmpleado,FechaEntrada )
	VALUES (NEWID(), (SELECT IdEmpleado FROM Empleado JOIN Persona ON Empleado.IdPersona = Persona.IdPersona WHERE Empleado.IdPersona = @IdPersona), GETDATE())
end


CREATE PROCEDURE NuevaCategoria
@Descripcion varchar(50)
as 
begin
	INSERT INTO Categoria(Descripcion)
	VALUES (@Descripcion)
end


CREATE PROCEDURE NuevaConsulta
@IdPaciente uniqueidentifier,
@IdMedico int,
@IdConsultorio int,
@IdEstatus int,
@Notas varchar(300),
@Costo float
as
begin
	INSERT INTO Consulta(IdConsulta,IdPaciente,IdMedico,FechaHora,IdConsultorio,IdEstatus,Notas,Costo)
	VALUES(NEWID(),@IdPaciente,@IdMedico,GETDATE(),@IdConsultorio,@IdEstatus,@Notas,@Costo)
end


CREATE PROCEDURE NuevoConsultorio
@IdSucursal int,
@Numconsultorio int
as
begin
	INSERT INTO Consultorio(IdSucursal,NumConsultorio)
	VALUES (@IdSucursal,@Numconsultorio )
end


CREATE PROCEDURE NuevoEstado
@Estado varchar(50)
as
begin
	INSERT INTO Estado(Estado)
	VALUES (@Estado)
end


CREATE PROCEDURE NuevoEstatus
@Estatus varchar(50)
as
begin
	INSERT INTO Estatus(Descripcion)
	VALUES (@Estatus)
end


CREATE PROCEDURE NuevaPersona
@Nombre varchar(50),
@ApPaterno varchar(50),
@ApMaterno varchar(50),
@FechaNacimiento date
as
begin
	INSERT INTO Persona(IdPersona,Nombre,ApPaterno,ApMaterno,FechaNac)
	VALUES (NEWID(),@Nombre,@ApPaterno,@ApMaterno,@FechaNacimiento)
end



CREATE PROCEDURE ConsultaEmpleadoPass
@IdEmpleado uniqueidentifier,
@Contraseña varchar(50)
as
begin
	SELECT COUNT(IdEmpleado) as Valido
	FROM Empleado
	WHERE IdEmpleado = @IdEmpleado AND Contraseña = @Contraseña
end

