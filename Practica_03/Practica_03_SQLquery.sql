CREATE DATABASE [Practica03]
GO
USE [Practica03]
GO


CREATE TABLE [Empleados] 
( 
	[Id][uniqueidentifier] NOT NULL PRIMARY KEY, 
	[NumeroEmpleado][int] NOT NULL, 
	[Nombre][varchar](50) NOT NULL, 
	[ApellidosPaterno][varchar](50) NOT NULL, 
	[ApellidosMaterno][varchar](50) NOT NULL, 
	[FechaNacimiento][date] NOT NULL, 
	[Edad] AS (datediff(year, [FechaNacimiento], getDate())) , 
	[FechaIngreso][date] NOT NULL, 
	[DiasAntiguedad] AS (datediff(day, [FechaIngreso], getDate())) 
) 

CREATE TABLE [Ventas] 
( 
	[Id][uniqueidentifier] NOT NULL PRIMARY KEY, 
	[IdVenta][int] NOT NULL, 
	[IdEmpleado][uniqueidentifier] NOT NULL, 
	[IdEstatus][uniqueidentifier] NOT NULL, 
	[Folio][int] NOT NULL, 
	[SubTotal][float] NOT NULL, 
	[IVA] AS (SubTotal*(0.16)), 
	[Total] AS (SubTotal + (SubTotal*(0.16))), 
	[FechaHora][smalldatetime] NOT NULL 
) 

CREATE TABLE [EstatusVenta] 
( 
	[Id][uniqueidentifier] NOT NULL PRIMARY KEY,
	[Nombre][varchar](50) NOT NULL 
) 

CREATE TABLE [DetalleVentaIAP] 
( 
	[Id][uniqueidentifier] NOT NULL PRIMARY KEY,
	[IdVenta][uniqueidentifier] NOT NULL,
	[IdIAP][uniqueidentifier] NOT NULL,
	[Cantidad][int] NOT NULL, 
	[PrecioUnitario][float] NOT NULL, 
	[SubTotalDetalle] AS (Cantidad + PrecioUnitario) 
) 

CREATE TABLE [InventarioAP] 
( 
	[Id][uniqueidentifier] NOT NULL PRIMARY KEY,
	[IdAlmacen][uniqueidentifier] NOT NULL, 
	[IdProducto][uniqueidentifier] NOT NULL,
	[Cantidad][int] NOT NULL
) 

CREATE TABLE [Almacen] 
( 
	[Id][uniqueidentifier] NOT NULL PRIMARY KEY, 
	[Nombre][varchar](50) NOT NULL 
) 

CREATE TABLE [Producto] 
( 
	[Id][uniqueidentifier] NOT NULL PRIMARY KEY, 
	[Nombre][varchar](50) NOT NULL, 
	[PrecioBase][float]NOT NULL, 
	[CodigoBarras][varchar](50) NOT NULL
)