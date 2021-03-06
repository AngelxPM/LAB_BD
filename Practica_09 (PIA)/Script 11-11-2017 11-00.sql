USE [master]
GO
/****** Object:  Database [ConsulSimi]    Script Date: 11/11/2017 10:56:21 ******/
CREATE DATABASE [ConsulSimi] 
GO
USE [ConsulSimi]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medico](
	[IdMedico] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [uniqueidentifier] NULL,
	[Cedula] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedicamentoBorrado]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MedicamentoBorrado](
	[IdMedicamentoBorrado] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdLaboratorio] [int] NOT NULL,
	[NombreGen] [varchar](50) NOT NULL,
	[PrecioBase] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedicamentoBorrado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medicamento](
	[IdMedicamento] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdLaboratorio] [int] NOT NULL,
	[NombreGen] [varchar](50) NOT NULL,
	[PrecioBase] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedicamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Laboratorio](
	[IdLaboratiorio] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[LicenciaLaboratorio] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLaboratiorio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estatus]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estatus](
	[IdEstatus] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Sueldo] [float] NOT NULL,
	[Encargado] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[PuestoEmpleado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DireccionSucursales]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DireccionSucursales](
	[IdDireccionSucursal] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[CalleNum] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[IdEstado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccionSucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DireccionPersona]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DireccionPersona](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[CalleNum] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[IdEstado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactoSucursal]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactoSucursal](
	[IdContactoSucursal] [uniqueidentifier] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Telefono] [float] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdContactoSucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactoPersona]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactoPersona](
	[IdContactoPersona] [uniqueidentifier] NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Telefono] [float] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdContactoPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultorio](
	[IdConsultorio] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[NumConsultorio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsultorio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescripcion]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prescripcion](
	[IdPrescripcion] [uniqueidentifier] NOT NULL,
	[IdConsulta] [uniqueidentifier] NOT NULL,
	[IdMedicamento] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Indicaciones] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPrescripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApPaterno] [varchar](50) NOT NULL,
	[ApMaterno] [varchar](50) NOT NULL,
	[FechaNac] [date] NOT NULL,
	[Edad]  AS (datediff(year,[FechaNac],getdate())),
PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Peso] [float] NOT NULL,
	[Altura] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OIEmpleados]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OIEmpleados](
	[IdOIEmpleados] [uniqueidentifier] NOT NULL,
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[FechaEntrada] [date] NOT NULL,
	[FechaSalida] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Consulta](
	[IdConsulta] [uniqueidentifier] NOT NULL,
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[IdMedico] [int] NULL,
	[FechaHora] [datetime] NOT NULL,
	[IdConsultorio] [int] NULL,
	[IdEstatus] [varchar](50) NOT NULL,
	[Notas] [varchar](300) NULL,
	[Costo] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsulta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 11/11/2017 10:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[Total]    Script Date: 11/11/2017 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Total](@SubTotal float) 
	returns float 
	as 
	begin
		Return @SubTotal * 1.15 
	end
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 11/11/2017 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdEmpresa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PuestoEmpleado]    Script Date: 11/11/2017 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PuestoEmpleado](
	[IdNivelEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Puesto] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNivelEmpleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 11/11/2017 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[LicenciaProveedor] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ProductosProvedorLaboratorio]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductosProvedorLaboratorio]
	@Medicamento uniqueidentifier
	as
	begin 

		SELECT Medicamento.IdMedicamento, SucursalProveedor.Nombre as 'Proveedor', SucursalLaboratorio.Nombre as 'Laboratorio'
		FROM Medicamento
		JOIN Sucursal as SucursalProveedor
		ON  Medicamento.IdProveedor = SucursalProveedor.IdSucursal
		JOIN Sucursal as SucursalLaboratorio
		ON  Medicamento.IdLaboratorio = SucursalLaboratorio.IdSucursal
		WHERE Medicamento.IdMedicamento = @Medicamento

	end
GO
/****** Object:  StoredProcedure [dbo].[NuevoProveedor]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevoProveedor]
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
GO
/****** Object:  StoredProcedure [dbo].[NuevoMedicamento]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevoMedicamento]
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
GO
/****** Object:  StoredProcedure [dbo].[NuevoLaboratorio]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevoLaboratorio]
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
GO
/****** Object:  StoredProcedure [dbo].[NuevoEstatus]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevoEstatus]
@Estatus varchar(50)
as
begin
	INSERT INTO Estatus(Descripcion)
	VALUES (@Estatus)
end
GO
/****** Object:  StoredProcedure [dbo].[NuevoEstado]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevoEstado]
@Estado varchar(50)
as
begin
	INSERT INTO Estado(Estado)
	VALUES (@Estado)
end
GO
/****** Object:  StoredProcedure [dbo].[NuevoEmpleado]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevoEmpleado]
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
GO
/****** Object:  StoredProcedure [dbo].[NuevoConsultorio]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevoConsultorio]
@IdSucursal int,
@Numconsultorio int

as
begin

	INSERT INTO Consultorio(IdSucursal,NumConsultorio)
	VALUES (@IdSucursal,@Numconsultorio )

end
GO
/****** Object:  StoredProcedure [dbo].[NuevaPersona]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevaPersona]
@Nombre varchar(50),
@ApPaterno varchar(50),
@ApMaterno varchar(50),
@FechaNacimiento date
as
begin
	INSERT INTO Persona(IdPersona,Nombre,ApPaterno,ApMaterno,FechaNac)
	VALUES (NEWID(),@Nombre,@ApPaterno,@ApMaterno,@FechaNacimiento)

end
GO
/****** Object:  StoredProcedure [dbo].[NuevaConsulta]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevaConsulta]

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
GO
/****** Object:  StoredProcedure [dbo].[NuevaCategoria]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevaCategoria]
@Descripcion varchar(50)
as 
begin

	INSERT INTO Categoria(Descripcion)
	VALUES (@Descripcion)

end
GO
/****** Object:  StoredProcedure [dbo].[NombrePaciente]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NombrePaciente]
@IdPaciente uniqueidentifier
as
begin 

SELECT Persona.IdPersona, Persona.Nombre
FROM Paciente 
JOIN Persona ON 
Paciente.IdPersona = Persona.IdPersona
WHERE Paciente.IdPaciente = @IdPaciente

end
GO
/****** Object:  StoredProcedure [dbo].[NombreEmpleado]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NombreEmpleado]
	@Empleados uniqueidentifier
	as
	begin 

		SELECT Persona.IdPersona, Persona.Nombre
		FROM Empleado 
		JOIN Persona ON 
		Empleado.IdPersona = Persona.IdPersona
		WHERE Empleado.IdEmpleado = @Empleados

	end
GO
/****** Object:  StoredProcedure [dbo].[ConsultasMedico]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultasMedico]
	@Medico int
	as
	begin 
	
	Select Consulta.IdConsulta, Persona.Nombre as 'Paciente', Consulta.FechaHora
	FROM Consulta
	JOIN Paciente ON 
	Consulta.IdPaciente = Paciente.IdPaciente
	JOIN Persona ON
	Paciente.IdPersona = Persona.IdPersona	
	WHERE Consulta.IdMedico = @Medico

	end
GO
/****** Object:  StoredProcedure [dbo].[ConsultaEstatusPaciente]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaEstatusPaciente]
	@IdConsulta uniqueidentifier
	as
	begin 
	
		Select Consulta.IdConsulta, Persona.Nombre as 'Paciente', Estatus.Descripcion as 'Estatus'
		FROM Consulta
		JOIN Paciente ON 
		Consulta.IdPaciente = Paciente.IdPaciente
		JOIN Persona ON
		Paciente.IdPersona = Persona.IdPersona
		JOIN Estatus ON
		Consulta.IdEstatus = Estatus.IdEstatus
		WHERE Consulta.IdConsulta = IdConsulta

	end
GO
/****** Object:  StoredProcedure [dbo].[ConsultaEmpleadoPass]    Script Date: 11/11/2017 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaEmpleadoPass]
@IdEmpleado uniqueidentifier,
@Contraseña varchar(50)
as
begin
	SELECT COUNT(IdEmpleado) as Valido
	FROM Empleado
	WHERE IdEmpleado = @IdEmpleado AND Contraseña = @Contraseña
end
GO
