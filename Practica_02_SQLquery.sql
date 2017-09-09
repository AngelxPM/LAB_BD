/*Se creo entre dos personas por falta de computadora en clase, 
Jose Julio Mancha Hdz 1727375 
Angel Adolfo Pacheco Mazuca 1656991*/ 


CREATE DATABASE[CinepolisChafa]
GO

CREATE TABLE [Peliculas] 
( 
	[IdPelicula][uniqueidentifier] NOT NULL PRIMARY KEY, 
	[Nombre][varchar](50) NOT NULL, 
	[FechaDePublicacion][date] NOT NULL, 
	[Genero][varchar](30) NOT NULL, 
	[IdDirector][int] NOT NULL, 
	[Productoras][varchar](50) NOT NULL
) 

CREATE TABLE [Actores] 
( 
	[IdActor][int]IDENTITY(1,1) NOT NULL  PRIMARY KEY, 
	[Nombre][varchar](50) NOT NULL, 
	[ApellidosPaterno][varchar](50) NOT NULL, 
	[ApellidosMaterno][varchar](50) NOT NULL, 
	[FechaDeNan][date] NOT NULL, 
	[Edad] AS (datediff(year, [FechaDeNan], getDate())) 
)

CREATE TABLE [Director] 
( 
	[IdDirector][int]IDENTITY(1,1) NOT NULL  PRIMARY KEY, 
	[Nombre][varchar](50) NOT NULL, 
	[ApellidosPaterno][varchar](50) NOT NULL, 
	[ApellidosMaterno][varchar](50) NOT NULL, 
	[FechaDeNan][date] NOT NULL, 
	[Edad] AS (datediff(year, [FechaDeNan], getDate())) 
) 

CREATE TABLE [ReAct] 
( 
	[IdReAct][uniqueidentifier] NOT NULL PRIMARY KEY, 
	[IdPelicula][uniqueidentifier] NOT NULL, 
	[IdActor][int] NOT NULL
) 

CREATE TABLE [Cliente] 
( 
	[IdCliente][uniqueidentifier] NOT NULL PRIMARY KEY, 
	[NombreCliente][varchar](50) NOT NULL, 
	[ApellidosPaterno][varchar](50) NOT NULL, 
	[ApellidosMaterno][varchar](50) NOT NULL, 
	[Correo][varchar](100)
) 

CREATE TABLE [Ticket] 
( 
	[IdTicket][uniqueidentifier] NOT NULL PRIMARY KEY,
	[IdCliente][uniqueidentifier] NOT NULL,
	[IdPelicula][uniqueidentifier] NOT NULL,
	[RelCineSalas][uniqueidentifier] NOT NULL,
	[CantidadBoletos][int] NOT NULL, 
	[FechaVenta][Timestamp] NOT NULL, 
	[Total] AS (50*([CantidadBoletos])) 
) 

CREATE TABLE [Empleado] 
( 
	[IdEmpleado][uniqueidentifier] NOT NULL PRIMARY KEY, 
	[Nombre][varchar](50) NOT NULL, 
	[ApellidosPaterno][varchar](50) NOT NULL, 
	[ApellidosMaterno][varchar](50) NOT NULL, 
	[SueldoQuincenal][money] NOT NULL, 
	[IdCine][int] NOT NULL,
	[FechaEntrada][date] NOT NULL, 
	[DiasAntiguedad] AS (datediff(day, [FechaEntrada], getDate())) 
)

CREATE TABLE [Supervisor] 
( 
	[IdSupervisor][int]IDENTITY(1,1) NOT NULL  PRIMARY KEY, 
	[Nombre][varchar](50) NOT NULL, 
	[ApellidosPaterno][varchar](50) NOT NULL, 
	[ApellidosMaterno][varchar](50) NOT NULL, 
	[SueldoQuincenal][money] NOT NULL,
	[FechaEntrada][date] NOT NULL, 
	[DiasAntiguedad] AS (datediff(day, [FechaEntrada], getDate())) 
) 

CREATE TABLE [Cine] 
( 
	[IdCine][int]IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	[NombreCine][varchar](50) NOT NULL, 
	[Dirreccion][varchar](100) NOT NULL, 
	[NumeroSalas][int] NOT NULL,
	[IdSupervisor][int] NOT NULL
)

CREATE TABLE [RelCinePeli] 
( 
	[RelCinePeli][uniqueidentifier] NOT NULL PRIMARY KEY, 
	[IdCine][int] NOT NULL , 
	[IdPelicula][uniqueidentifier] NOT NULL
)

CREATE TABLE [RelCineSalas] 
( 
	[RelCineSalas][uniqueidentifier] NOT NULL PRIMARY KEY, 
	[IdCine][int] NOT NULL , 
	[NombreSala][varchar](50) NOT NULL,
	[Capacidad][int] NOT NULL
)
