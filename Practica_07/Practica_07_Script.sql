USE [master]
GO
/****** Object:  Database [ConsulSimi]    Script Date: 11/06/2017 18:42:31 ******/
CREATE DATABASE [ConsulSimi] ON  PRIMARY 
( NAME = N'ConsulSimi', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ConsulSimi.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ConsulSimi_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ConsulSimi_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ConsulSimi] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConsulSimi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConsulSimi] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ConsulSimi] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ConsulSimi] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ConsulSimi] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ConsulSimi] SET ARITHABORT OFF
GO
ALTER DATABASE [ConsulSimi] SET AUTO_CLOSE ON
GO
ALTER DATABASE [ConsulSimi] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ConsulSimi] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ConsulSimi] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ConsulSimi] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ConsulSimi] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ConsulSimi] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ConsulSimi] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ConsulSimi] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ConsulSimi] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ConsulSimi] SET  ENABLE_BROKER
GO
ALTER DATABASE [ConsulSimi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ConsulSimi] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ConsulSimi] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ConsulSimi] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ConsulSimi] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ConsulSimi] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ConsulSimi] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ConsulSimi] SET  READ_WRITE
GO
ALTER DATABASE [ConsulSimi] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ConsulSimi] SET  MULTI_USER
GO
ALTER DATABASE [ConsulSimi] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ConsulSimi] SET DB_CHAINING OFF
GO
USE [ConsulSimi]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 11/06/2017 18:42:34 ******/
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
SET IDENTITY_INSERT [dbo].[Medico] ON
INSERT [dbo].[Medico] ([IdMedico], [IdEmpleado], [Cedula]) VALUES (1, N'b7c35eff-3e36-43fc-b654-2825e8a149f5', N'NOMESELAESTRUCTURADELACEDULA')
SET IDENTITY_INSERT [dbo].[Medico] OFF
/****** Object:  Table [dbo].[MedicamentoBorrado]    Script Date: 11/06/2017 18:42:34 ******/
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
/****** Object:  Table [dbo].[Medicamento]    Script Date: 11/06/2017 18:42:34 ******/
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
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'ccec63fe-313d-4fb4-8e9c-032ca3446326', N'Rosel', N'Fiebre, estornudos y cuerpo cortado, 500mg', 1, 6, 4, N'Clorfenamina, Anamtadina, Paracetamol', 28)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'c5367b46-6dcc-4df3-9fc1-15bedab7f024', N'Paracetamol', N'Dolor de cabeza y fiebre, 500mg', 1, 5, 3, N'Paracetamol', 7)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'c576a7b2-099d-4a6f-9f76-a8c8656f435c', N'Clonacepam', N'Para dormir, 2mg', 3, 6, 4, N'Ribotrilp', 81)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'8e22cc6d-7860-480a-81b6-ad0f41327474', N'Clamoxin', N'Infecciones respiratorias, 875/125mg', 2, 5, 3, N'Amoxicilina / acido clabulanico', 98)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'66e60bf8-203e-4a4f-b912-b146fe03d8f5', N'Ibuprofeno', N'Dolo de cabeza, 500mg', 4, 6, 4, N'Ibuprofeno', 55)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'ed796c91-f6b0-4e72-88e3-bc4b53138ba0', N'Metformina', N'Diabetes, 850mg', 4, 6, 4, N'Glucobance', 55)
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 11/06/2017 18:42:34 ******/
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
/****** Object:  Table [dbo].[Estatus]    Script Date: 11/06/2017 18:42:34 ******/
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
SET IDENTITY_INSERT [dbo].[Estatus] ON
INSERT [dbo].[Estatus] ([IdEstatus], [Descripcion]) VALUES (1, N'Pendiente')
INSERT [dbo].[Estatus] ([IdEstatus], [Descripcion]) VALUES (2, N'Activa')
INSERT [dbo].[Estatus] ([IdEstatus], [Descripcion]) VALUES (3, N'Terminada')
SET IDENTITY_INSERT [dbo].[Estatus] OFF
/****** Object:  Table [dbo].[Estado]    Script Date: 11/06/2017 18:42:34 ******/
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
SET IDENTITY_INSERT [dbo].[Estado] ON
INSERT [dbo].[Estado] ([IdDireccion], [Estado]) VALUES (1, N'Nuevo Leon')
SET IDENTITY_INSERT [dbo].[Estado] OFF
/****** Object:  Table [dbo].[Empresa]    Script Date: 11/06/2017 18:42:34 ******/
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
SET IDENTITY_INSERT [dbo].[Empresa] ON
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre]) VALUES (1, N'Missalvacion')
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre]) VALUES (2, N'LabCorp')
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre]) VALUES (3, N'TransDrugs')
SET IDENTITY_INSERT [dbo].[Empresa] OFF
/****** Object:  Table [dbo].[Empleado]    Script Date: 11/06/2017 18:42:34 ******/
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
INSERT [dbo].[Empleado] ([IdEmpleado], [IdPersona], [Sueldo], [Encargado], [Contraseña], [PuestoEmpleado]) VALUES (N'b7c35eff-3e36-43fc-b654-2825e8a149f5', N'cb6ffff7-04d5-4ec4-a899-e6a096810c67', 10000, N'CB6FFFF7-04D5-4EC4-A899-E6A096810C67', N'123asdf', 3)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdPersona], [Sueldo], [Encargado], [Contraseña], [PuestoEmpleado]) VALUES (N'e9e724a4-ffc3-4d1d-9c25-cbd46f4a4bb2', N'127d6cf2-97db-4ccf-8c09-edb230e50e63', 5000, N'CB6FFFF7-04D5-4EC4-A899-E6A096810C67', N'123asdf', 2)
/****** Object:  Table [dbo].[DireccionSucursales]    Script Date: 11/06/2017 18:42:34 ******/
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
SET IDENTITY_INSERT [dbo].[DireccionSucursales] ON
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (1, 1, N'Privada Famosa 102', N'San Nicolas', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (2, 2, N'Privada Famosa 103', N'San Nicolas', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (3, 3, N'San Nicolas 1102', N'San Nicolas', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (4, 4, N'Estanzuela 103', N'Estanzuela', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (5, 5, N'Monterrey 2102', N'Monterrey', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (6, 6, N'Juarez 1033', N'Juarez', N'1')
SET IDENTITY_INSERT [dbo].[DireccionSucursales] OFF
/****** Object:  Table [dbo].[DireccionPersona]    Script Date: 11/06/2017 18:42:34 ******/
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
SET IDENTITY_INSERT [dbo].[DireccionPersona] ON
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (1, N'0f441dcb-643d-4d56-b9ba-17b40f4885ee', N'San Sebastian 304', N'Juarez', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (2, N'76f51205-9938-4076-a004-3bcbf929c28e', N'San Jorge 324', N'Juarez', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (3, N'a738a865-a13a-4167-af8b-403efd85d57a', N'Santa Cecilia', N'Juarez', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (4, N'60ef99dc-b7c1-4795-b470-62f0545ad3dc', N'Tepeyac 615', N'Independencia', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (5, N'a3e4e040-36ba-45ed-a0b8-997e5c57f50b', N'Pablo ll', N'Independencia', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (6, N'93ce6098-5da4-44e0-aa1b-a292ed3c52b1', N'Jimenez 403', N'Guadalupe', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (7, N'953ae812-a5fe-4e51-a4ec-befed6dd01cd', N'Agistin Melgar 304', N'Guadalupe', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (8, N'c213ba90-cf82-4a0f-aaf6-c47b09041750', N'Jose Agustin Melgar 304', N'Monterrey', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (9, N'cb6ffff7-04d5-4ec4-a899-e6a096810c67', N'Av. Guerrero 105', N'San Nicolas', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (10, N'127d6cf2-97db-4ccf-8c09-edb230e50e63', N'Privada Famosa 102', N'San Nicolas', N'1')
SET IDENTITY_INSERT [dbo].[DireccionPersona] OFF
/****** Object:  Table [dbo].[ContactoSucursal]    Script Date: 11/06/2017 18:42:34 ******/
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
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'b17de1e1-5612-464c-8b9e-17757153af5a', 1, 8123654852, N'Missalvacion@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'fabe0da5-d5d7-4fe4-a292-3917088a168b', 3, 8123544852, N'San_Nicolas@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'33c6abea-a461-4517-8e6c-841392beb6f8', 6, 8133331885, N'TransDrugs_Juarez@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'c7d4105d-a602-4a6d-b35d-8e68f849130a', 5, 8123453352, N'TransDrugs_Monterrey@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'2a6859e2-3449-4fcf-8ae7-af85314ae19a', 4, 8143231285, N'Lab_Estanzuela@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'bd1411e7-0eef-4299-9fbd-dc0b1727aa64', 2, 8123651885, N'LasTorres@gmail.com')
/****** Object:  Table [dbo].[ContactoPersona]    Script Date: 11/06/2017 18:42:34 ******/
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
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'f4ebe999-b454-48ed-865f-208df6acb95d', N'953ae812-a5fe-4e51-a4ec-befed6dd01cd', 81124512475, N'Dinora@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'96b8a2fa-bb7b-4304-9548-275c9ae2f160', N'0f441dcb-643d-4d56-b9ba-17b40f4885ee', 8125649525, N'nancy@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'3ee92d83-2266-46d2-87d0-3eca651e82f2', N'60ef99dc-b7c1-4795-b470-62f0545ad3dc', 8112361254, N'Angelica@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'2907824f-ca15-46d4-a4f5-75f30d4af10a', N'76f51205-9938-4076-a004-3bcbf929c28e', 8145256574, N'Mau@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'e7cc05d0-7bab-46cd-bfd3-7b338008a9d0', N'127d6cf2-97db-4ccf-8c09-edb230e50e63', 86197219726, N'Brandon@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'3b4bfa06-9d57-46a2-9864-8bb0edc3a5a2', N'c213ba90-cf82-4a0f-aaf6-c47b09041750', 81461237516, N'Fatima@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'9c7ddcbd-e8fe-44a0-ac94-93f729e1564e', N'a3e4e040-36ba-45ed-a0b8-997e5c57f50b', 8116421527, N'Angel@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'28baa62b-4766-469e-85c4-b74f11f14601', N'a738a865-a13a-4167-af8b-403efd85d57a', 8165754295, N'Karla@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'b0300bd8-97b1-4d2d-b5c3-c03c2cf910d4', N'93ce6098-5da4-44e0-aa1b-a292ed3c52b1', 8136491546, N'Jesus@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'f36c3217-554e-4a33-946d-fe4c93c84edb', N'cb6ffff7-04d5-4ec4-a899-e6a096810c67', 81367619754, N'Hilder@gmail.com')
/****** Object:  Table [dbo].[Consultorio]    Script Date: 11/06/2017 18:42:34 ******/
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
SET IDENTITY_INSERT [dbo].[Consultorio] ON
INSERT [dbo].[Consultorio] ([IdConsultorio], [IdSucursal], [NumConsultorio]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[Consultorio] OFF
/****** Object:  Table [dbo].[Prescripcion]    Script Date: 11/06/2017 18:42:34 ******/
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
INSERT [dbo].[Prescripcion] ([IdPrescripcion], [IdConsulta], [IdMedicamento], [Cantidad], [Indicaciones]) VALUES (N'f651ceb1-4d6b-4b3c-8157-6b6c37ab9af6', N'225bb75b-01a7-4cfd-a834-14b20b30e3c2', N'c5367b46-6dcc-4df3-9fc1-15bedab7f024', 2, N'Casa 6 horas por 3 dias')
/****** Object:  Table [dbo].[Persona]    Script Date: 11/06/2017 18:42:34 ******/
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
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'0f441dcb-643d-4d56-b9ba-17b40f4885ee', N'Nancy', N'Rodulfo', N'Mazuca', CAST(0x83210B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'76f51205-9938-4076-a004-3bcbf929c28e', N'Mau', N'A.K.A.', N'Aczecino', CAST(0xC8170B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'a738a865-a13a-4167-af8b-403efd85d57a', N'Karla', N'Gomez', N'Ortiz', CAST(0xEF250B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'60ef99dc-b7c1-4795-b470-62f0545ad3dc', N'Angelica', N'Mazuca', N'Cortez', CAST(0x49FB0A00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'a3e4e040-36ba-45ed-a0b8-997e5c57f50b', N'Angel', N'Pacheco', N'Mazuca', CAST(0x0F210B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'93ce6098-5da4-44e0-aa1b-a292ed3c52b1', N'Jesus', N'Pacheco', N'Mazuca', CAST(0x0D250B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'953ae812-a5fe-4e51-a4ec-befed6dd01cd', N'Dinora', N'Mazuca', N'Cortez', CAST(0x31000B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'c213ba90-cf82-4a0f-aaf6-c47b09041750', N'Fatima', N'Garcia', N'Campos', CAST(0x67210B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'cb6ffff7-04d5-4ec4-a899-e6a096810c67', N'Hilder', N'Pacheco', N'Navarro', CAST(0xA0FF0A00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'127d6cf2-97db-4ccf-8c09-edb230e50e63', N'Brandon', N'Torres', N'Lopez', CAST(0xC9260B00 AS Date))
/****** Object:  Table [dbo].[Paciente]    Script Date: 11/06/2017 18:42:34 ******/
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
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'1ed752ed-8c91-4263-baeb-2b8898fb6461', N'76f51205-9938-4076-a004-3bcbf929c28e', 95, 1.72)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'6e634df6-19a6-48c3-bea9-3f683c8b451c', N'c213ba90-cf82-4a0f-aaf6-c47b09041750', 68, 1.62)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'ea148232-9491-4457-aa2a-488d5aeeabed', N'0f441dcb-643d-4d56-b9ba-17b40f4885ee', 52, 1.51)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'e0920ee9-b1cc-4b4a-9857-741c9c2fe448', N'80de71f7-6575-4554-8c6e-804546324896', 105, 1.73)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'b93ebc94-7bd9-40dc-a830-94992c8229fa', N'60ef99dc-b7c1-4795-b470-62f0545ad3dc', 64, 1.5)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'0a5c14be-4059-43e4-8c30-bc548c6dcdec', N'a738a865-a13a-4167-af8b-403efd85d57a', 60, 1.6)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'df9c0e5b-26cf-46ed-a69a-bea5bf26890f', N'a3e4e040-36ba-45ed-a0b8-997e5c57f50b', 100, 1.7)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'ed1693cf-097c-4cae-8ce4-e8ec45d7b0b1', N'953ae812-a5fe-4e51-a4ec-befed6dd01cd', 91, 1.56)
/****** Object:  Table [dbo].[OIEmpleados]    Script Date: 11/06/2017 18:42:34 ******/
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
INSERT [dbo].[OIEmpleados] ([IdOIEmpleados], [IdEmpleado], [FechaEntrada], [FechaSalida]) VALUES (N'561e0330-6f42-41d8-b3ff-a0644e5eb8c0', N'b7c35eff-3e36-43fc-b654-2825e8a149f5', CAST(0x793D0B00 AS Date), NULL)
INSERT [dbo].[OIEmpleados] ([IdOIEmpleados], [IdEmpleado], [FechaEntrada], [FechaSalida]) VALUES (N'bfa1c0db-0692-41e2-8394-199f655f7de4', N'e9e724a4-ffc3-4d1d-9c25-cbd46f4a4bb2', CAST(0x793D0B00 AS Date), NULL)
/****** Object:  Table [dbo].[Consulta]    Script Date: 11/06/2017 18:42:34 ******/
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
INSERT [dbo].[Consulta] ([IdConsulta], [IdPaciente], [IdMedico], [FechaHora], [IdConsultorio], [IdEstatus], [Notas], [Costo]) VALUES (N'225bb75b-01a7-4cfd-a834-14b20b30e3c2', N'6e634df6-19a6-48c3-bea9-3f683c8b451c', 1, CAST(0x0000A770007B98A0 AS DateTime), 1, N'3', N'Dolor de cabeza izzi', 300)
/****** Object:  Table [dbo].[Categoria]    Script Date: 11/06/2017 18:42:34 ******/
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
SET IDENTITY_INSERT [dbo].[Categoria] ON
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (1, N'VentaLibre')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (2, N'Antibioticos')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (3, N'Pscotropicos')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (4, N'Cronico')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
/****** Object:  UserDefinedFunction [dbo].[Total]    Script Date: 11/06/2017 18:42:37 ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 11/06/2017 18:42:37 ******/
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
SET IDENTITY_INSERT [dbo].[Sucursal] ON
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (1, N'Missalvacion', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (2, N'Las Torres', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (3, N'San Nicolas', 2)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (4, N'Lab Estanzuela', 2)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (5, N'TransDrugs Monterrey', 3)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (6, N'TransDrugs Juarez', 3)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
/****** Object:  Table [dbo].[PuestoEmpleado]    Script Date: 11/06/2017 18:42:37 ******/
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
SET IDENTITY_INSERT [dbo].[PuestoEmpleado] ON
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (1, N'Secretaria')
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (2, N'Almacen')
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (3, N'Medico')
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (4, N'Sistemas')
SET IDENTITY_INSERT [dbo].[PuestoEmpleado] OFF
/****** Object:  Table [dbo].[Proveedor]    Script Date: 11/06/2017 18:42:37 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductosProvedorLaboratorio]    Script Date: 11/06/2017 18:42:49 ******/
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
/****** Object:  StoredProcedure [dbo].[NombrePaciente]    Script Date: 11/06/2017 18:42:49 ******/
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
/****** Object:  StoredProcedure [dbo].[NombreEmpleado]    Script Date: 11/06/2017 18:42:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultasMedico]    Script Date: 11/06/2017 18:42:49 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultaEstatusPaciente]    Script Date: 11/06/2017 18:42:49 ******/
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
