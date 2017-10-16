USE [master]
GO
/****** Object:  Database [Consultorio]    Script Date: 10/15/2017 21:34:09 ******/
CREATE DATABASE [Consultorio] ON  PRIMARY 
( NAME = N'Consultorio', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Consultorio.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Consultorio_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Consultorio_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Consultorio] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultorio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultorio] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Consultorio] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Consultorio] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Consultorio] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Consultorio] SET ARITHABORT OFF
GO
ALTER DATABASE [Consultorio] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Consultorio] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Consultorio] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Consultorio] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Consultorio] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Consultorio] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Consultorio] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Consultorio] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Consultorio] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Consultorio] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Consultorio] SET  DISABLE_BROKER
GO
ALTER DATABASE [Consultorio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Consultorio] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Consultorio] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Consultorio] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Consultorio] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Consultorio] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Consultorio] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Consultorio] SET  READ_WRITE
GO
ALTER DATABASE [Consultorio] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Consultorio] SET  MULTI_USER
GO
ALTER DATABASE [Consultorio] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Consultorio] SET DB_CHAINING OFF
GO
USE [Consultorio]
GO
/****** Object:  StoredProcedure [dbo].[procedimiento]    Script Date: 10/15/2017 21:34:16 ******/
DROP PROCEDURE [dbo].[procedimiento]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 10/15/2017 21:34:14 ******/
DROP TABLE [dbo].[Proveedor]
GO
/****** Object:  Table [dbo].[SucGrandes]    Script Date: 10/15/2017 21:34:14 ******/
DROP TABLE [dbo].[SucGrandes]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 10/15/2017 21:34:13 ******/
DROP TABLE [dbo].[Sucursal]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 10/15/2017 21:34:13 ******/
DROP TABLE [dbo].[Clientes]
GO
/****** Object:  Table [dbo].[ClientesAngel]    Script Date: 10/15/2017 21:34:13 ******/
DROP TABLE [dbo].[ClientesAngel]
GO
/****** Object:  Table [dbo].[ClientesSobrepeso]    Script Date: 10/15/2017 21:34:13 ******/
DROP TABLE [dbo].[ClientesSobrepeso]
GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 10/15/2017 21:34:13 ******/
DROP TABLE [dbo].[Consultorio]
GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 10/15/2017 21:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Consultorio](
	[IdConsultorio] [int] NULL,
	[IdSucursal] [int] NULL,
	[Descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientesSobrepeso]    Script Date: 10/15/2017 21:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientesSobrepeso](
	[IdCliente] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientesAngel]    Script Date: 10/15/2017 21:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientesAngel](
	[IdCliente] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Altura] [float] NULL,
	[Peso] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ClientesAngel] ([IdCliente], [Nombre], [Apellidos], [FechaNacimiento], [Altura], [Peso]) VALUES (1, N'Angel', N'Pacheco', CAST(0x683D0B00 AS Date), 1.67, 100.5)
/****** Object:  Table [dbo].[Clientes]    Script Date: 10/15/2017 21:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Altura] [float] NULL,
	[Peso] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellidos], [FechaNacimiento], [Altura], [Peso]) VALUES (1, N'Alfredo', N'Pacheco', CAST(0x683D0B00 AS Date), 1.67, 100.5)
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellidos], [FechaNacimiento], [Altura], [Peso]) VALUES (1, N'Jesus', N'Pacheco', CAST(0x683D0B00 AS Date), 1.87, 110.5)
/****** Object:  Table [dbo].[Sucursal]    Script Date: 10/15/2017 21:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[NumConsultorios] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sucursal] ON
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Direccion], [NumConsultorios]) VALUES (1, N'Sucursal01', N'Direccion de sucursal', 5)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
/****** Object:  Table [dbo].[SucGrandes]    Script Date: 10/15/2017 21:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SucGrandes](
	[IdSucursal] [int] NULL,
	[Nomber] [varchar](50) NULL,
	[NumConsultorios] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SucGrandes] ([IdSucursal], [Nomber], [NumConsultorios]) VALUES (1, N'Sucursal01', 5)
/****** Object:  Table [dbo].[Proveedor]    Script Date: 10/15/2017 21:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[RFC] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[procedimiento]    Script Date: 10/15/2017 21:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREAMOS EL PROCEDIMIENTO ALMACENADO
CREATE PROC [dbo].[procedimiento]
 @valor AS int
AS
 SELECT IdSucursal, Nombre, NumConsultorios
 FROM Sucursal
 WHERE NumConsultorios = @valor ;
GO
