/*Se creo entre dos personas por falta de computadora en clase, 
Jose Julio Mancha Hdz 1727375 
Angel Adolfo Pacheco Mazuca 1656991*/ 


CREATE DATABASE[CinepolisChafa]
GO

USE [CinepolisChafa]
GO
/****** Object:  Table [dbo].[Actores]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actores](
	[IdActor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidosPaterno] [varchar](50) NOT NULL,
	[ApellidosMaterno] [varchar](50) NOT NULL,
	[FechaDeNan] [date] NOT NULL,
	[Edad]  AS (datediff(year,[FechaDeNan],getdate())),
PRIMARY KEY CLUSTERED 
(
	[IdActor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supervisor]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supervisor](
	[IdSupervisor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidosPaterno] [varchar](50) NOT NULL,
	[ApellidosMaterno] [varchar](50) NOT NULL,
	[SueldoQuincenal] [money] NOT NULL,
	[FechaEntrada] [date] NOT NULL,
	[DiasAntiguedad]  AS (datediff(day,[FechaEntrada],getdate())),
PRIMARY KEY CLUSTERED 
(
	[IdSupervisor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Director]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Director](
	[IdDirector] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidosPaterno] [varchar](50) NOT NULL,
	[ApellidosMaterno] [varchar](50) NOT NULL,
	[FechaDeNan] [date] NOT NULL,
	[Edad]  AS (datediff(year,[FechaDeNan],getdate())),
PRIMARY KEY CLUSTERED 
(
	[IdDirector] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [uniqueidentifier] NOT NULL,
	[NombreCliente] [varchar](50) NOT NULL,
	[ApellidosPaterno] [varchar](50) NOT NULL,
	[ApellidosMaterno] [varchar](50) NOT NULL,
	[Correo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cine]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cine](
	[IdCine] [int] IDENTITY(1,1) NOT NULL,
	[NombreCine] [varchar](50) NOT NULL,
	[Dirreccion] [varchar](100) NOT NULL,
	[NumeroSalas] [int] NOT NULL,
	[IdSupervisor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCine] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Peliculas](
	[IdPelicula] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaDePublicacion] [date] NOT NULL,
	[Genero] [varchar](30) NOT NULL,
	[IdDirector] [int] NOT NULL,
	[Productoras] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPelicula] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RelCineSalas]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RelCineSalas](
	[RelCineSalas] [uniqueidentifier] NOT NULL,
	[IdCine] [int] NOT NULL,
	[NombreSala] [varchar](50) NOT NULL,
	[Capacidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RelCineSalas] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RelCinePeli]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelCinePeli](
	[RelCinePeli] [uniqueidentifier] NOT NULL,
	[IdCine] [int] NOT NULL,
	[IdPelicula] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RelCinePeli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReAct]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReAct](
	[IdReAct] [uniqueidentifier] NOT NULL,
	[IdPelicula] [uniqueidentifier] NOT NULL,
	[IdActor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdReAct] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidosPaterno] [varchar](50) NOT NULL,
	[ApellidosMaterno] [varchar](50) NOT NULL,
	[SueldoQuincenal] [money] NOT NULL,
	[IdCine] [int] NOT NULL,
	[FechaEntrada] [date] NOT NULL,
	[DiasAntiguedad]  AS (datediff(day,[FechaEntrada],getdate())),
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 09/08/2017 23:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[IdTicket] [uniqueidentifier] NOT NULL,
	[IdCliente] [uniqueidentifier] NOT NULL,
	[IdPelicula] [uniqueidentifier] NOT NULL,
	[RelCineSalas] [uniqueidentifier] NOT NULL,
	[CantidadBoletos] [int] NOT NULL,
	[FechaVenta] [timestamp] NOT NULL,
	[Total]  AS ((50)*[CantidadBoletos]),
PRIMARY KEY CLUSTERED 
(
	[IdTicket] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Cine_Supervisor]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[Cine]  WITH CHECK ADD  CONSTRAINT [FK_Cine_Supervisor] FOREIGN KEY([IdSupervisor])
REFERENCES [dbo].[Supervisor] ([IdSupervisor])
GO
ALTER TABLE [dbo].[Cine] CHECK CONSTRAINT [FK_Cine_Supervisor]
GO
/****** Object:  ForeignKey [FK_Empleado_Cine]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Cine] FOREIGN KEY([IdCine])
REFERENCES [dbo].[Cine] ([IdCine])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Cine]
GO
/****** Object:  ForeignKey [FK_Peliculas_Director]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Director] FOREIGN KEY([IdDirector])
REFERENCES [dbo].[Director] ([IdDirector])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Director]
GO
/****** Object:  ForeignKey [FK_ReAct_Actores]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[ReAct]  WITH CHECK ADD  CONSTRAINT [FK_ReAct_Actores] FOREIGN KEY([IdActor])
REFERENCES [dbo].[Actores] ([IdActor])
GO
ALTER TABLE [dbo].[ReAct] CHECK CONSTRAINT [FK_ReAct_Actores]
GO
/****** Object:  ForeignKey [FK_ReAct_Peliculas]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[ReAct]  WITH CHECK ADD  CONSTRAINT [FK_ReAct_Peliculas] FOREIGN KEY([IdReAct])
REFERENCES [dbo].[Peliculas] ([IdPelicula])
GO
ALTER TABLE [dbo].[ReAct] CHECK CONSTRAINT [FK_ReAct_Peliculas]
GO
/****** Object:  ForeignKey [FK_RelCinePeli_Cine]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[RelCinePeli]  WITH CHECK ADD  CONSTRAINT [FK_RelCinePeli_Cine] FOREIGN KEY([IdCine])
REFERENCES [dbo].[Cine] ([IdCine])
GO
ALTER TABLE [dbo].[RelCinePeli] CHECK CONSTRAINT [FK_RelCinePeli_Cine]
GO
/****** Object:  ForeignKey [FK_RelCinePeli_Peliculas]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[RelCinePeli]  WITH CHECK ADD  CONSTRAINT [FK_RelCinePeli_Peliculas] FOREIGN KEY([IdPelicula])
REFERENCES [dbo].[Peliculas] ([IdPelicula])
GO
ALTER TABLE [dbo].[RelCinePeli] CHECK CONSTRAINT [FK_RelCinePeli_Peliculas]
GO
/****** Object:  ForeignKey [FK_RelCineSalas_Cine]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[RelCineSalas]  WITH CHECK ADD  CONSTRAINT [FK_RelCineSalas_Cine] FOREIGN KEY([IdCine])
REFERENCES [dbo].[Cine] ([IdCine])
GO
ALTER TABLE [dbo].[RelCineSalas] CHECK CONSTRAINT [FK_RelCineSalas_Cine]
GO
/****** Object:  ForeignKey [FK_Ticket_Cliente]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Cliente]
GO
/****** Object:  ForeignKey [FK_Ticket_Peliculas]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Peliculas] FOREIGN KEY([IdPelicula])
REFERENCES [dbo].[Peliculas] ([IdPelicula])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Peliculas]
GO
/****** Object:  ForeignKey [FK_Ticket_RelCineSalas]    Script Date: 09/08/2017 23:22:47 ******/
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_RelCineSalas] FOREIGN KEY([RelCineSalas])
REFERENCES [dbo].[RelCineSalas] ([RelCineSalas])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_RelCineSalas]
GO
