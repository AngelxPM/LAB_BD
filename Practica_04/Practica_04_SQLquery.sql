/*	
	INSERT VALUES
	Es posible insertar una fila o varias filas a nuestra tabla destino
*/
	
/* Se pone el nombre de la tabla y a los atibutos que afectaremos */
INSERT INTO Clientes( IdCliente, Apellidos, Nombre, FechaNacimiento, Altura, Peso  )
VALUES( 1 , 'Pacheco' , 'Angel', '2017/10/15', 1.67, 100.5 )

/* Se pone el nombre de la tabla y los datos en value, deben de estar en orden */
INSERT INTO Clientes
VALUES( 1 , 'Jesus' , 'Pacheco', '2017/10/15', 1.87, 110.5 )

/* Si la tabla contiene un IDENTITY no se especifica en la lista */
INSERT INTO Sucursal(Nombre, Direccion, NumConsultorios)
VALUES('Sucursal01', 'Direccion de sucursal', 5)



/*
	INSERT SELECT
	Inserta los valores que resultan de la ejecución de una consulta.
	Características:
		* Es posible omitir la lista de columnas destino 
		  al igual que tipo de INSERT anterior.
		* También integra la posibilidad de ingresar 
		  valores en una columna IDENTITY si antes se 
		  especifica SET IDENTITY <nombreTabla> ON.
		  
*/

IF OBJECT_ID( 'dbo.ClientesSobrepeso' ) IS NOT NULL
DROP TABLE dbo.tablaDestino ;

CREATE TABLE dbo.ClientesSobrepeso(
	IdCliente  int not null,
	Nombre varchar (50) not null
)
INSERT INTO dbo.ClientesSobrepeso
SELECT IdCliente , Nombre
FROM Clientes

/*	
	INSERT EXEC
	Tenemos la posibilidad de ingresar el resultado de la ejecución de 
	un procedimiento almacenado a una tabla, respetando la cantidad de 
	columnas, el tipo de datos y el orden en el que fueron creados en 
	la tabla.
*/

--ELIMINAMOS LA TABLA SI YA EXISTE.
IF OBJECT_ID( 'dbo.SucGrandes' ) IS NOT NULL
 DROP TABLE dbo.SucGrandes 

--CREAMOS LA TABLA
CREATE TABLE dbo.SucGrandes(
 IdSucursal int,
 Nomber varchar(50),
 NumConsultorios int
);

--ELIMINAMOS EL PROCEDIMIENTO, SI ES QUE YA EXISTE.
IF OBJECT_ID('dbo.procedimiento', 5) IS NOT NULL
 DROP PROC dbo.procedimiento;
GO

--CREAMOS EL PROCEDIMIENTO ALMACENADO
CREATE PROC dbo.procedimiento
 @valor AS int
AS
 SELECT IdSucursal, Nombre, NumConsultorios
 FROM Sucursal
 WHERE NumConsultorios = @valor ;
GO

--INSERTAMOS EN LA TABLA UTILIZANDO EXEC
INSERT INTO dbo.SucGrandes
EXEC dbo.procedimiento 5

--VERIFICAMOS LOS DATOS INSERTADOS
SELECT * FROM dbo.SucGrandes;

/*		
	SELECT INTO
	También utiliza una consulta para tomar los valores e insertarlos 
	en una tabla, solo que creará una nueva tabla para este fin, si ya 
	existe la tabla, marcará error.
*/
--ELIMINAMOS LA TABLA SI YA EXISTE.
IF OBJECT_ID( 'dbo.ClientesAngel' ) IS NOT NULL
 DROP TABLE dbo.ClientesAngel 

--CREAMOS LA TABLA
SELECT *
INTO dbo.ClientesAngel
FROM Clientes
WHERE Nombre = 'Angel' ;
GO

--VERIFICAMOS LOS DATOS INSERTADOS
SELECT * FROM dbo.ClientesAngel;


/* TABLA TEMPORAL */
CREATE TABLE #ProvedorSucursal
(  
    IdProvedorSucursal int not null, 
    IdProvedor int not null, 
    IdSucursal int not null
)
-- Verificamos que existe se gurda den tempdb y 
-- se usan de manera similar, solo agregamos el #
Select *
from #ProvedorSucursal


/* UPDATE CON WHERE */

UPDATE Clientes
SET Nombre = 'Alfredo'
WHERE Nombre = 'Angel';

Select *
from Clientes

/* DELETE */

DELETE ClientesSobrepeso

-- AngelxPM