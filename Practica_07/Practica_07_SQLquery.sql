/*

------------------------------------------------------------------


	CREATE FUNCTION Total(@SubTotal float) 
	returns float 
	as 
	begin
		Return @SubTotal * 1.15 
	end
	
	
	select dbo.Total (100)


------------------------------------------------------------------


	CREATE PROCEDURE NombrePaciente
	@IdPaciente uniqueidentifier
	as
	begin 

		SELECT Persona.IdPersona, Persona.Nombre
		FROM Paciente 
		JOIN Persona ON 
		Paciente.IdPersona = Persona.IdPersona
		WHERE Paciente.IdPaciente = @IdPaciente

	end
	
	exec NombrePaciente 'B93EBC94-7BD9-40DC-A830-94992C8229FA'
	
	
------------------------------------------------------------------


	CREATE PROCEDURE ConsultasMedico
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
	
	exec ConsultasMedico 1


------------------------------------------------------------------


	CREATE PROCEDURE NombreEmpleado
	@Empleados uniqueidentifier
	as
	begin 

		SELECT Persona.IdPersona, Persona.Nombre
		FROM Empleado 
		JOIN Persona ON 
		Empleado.IdPersona = Persona.IdPersona
		WHERE Empleado.IdEmpleado = @Empleados

	end
	
	
	exec NombreEmpleado 'E9E724A4-FFC3-4D1D-9C25-CBD46F4A4BB2'
	
	
------------------------------------------------------------------


	CREATE PROCEDURE ProductosProvedorLaboratorio
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
	

	exec ProductosProvedorLaboratorio 'CCEC63FE-313D-4FB4-8E9C-032CA3446326'
	

------------------------------------------------------------------


	CREATE PROCEDURE ConsultaEstatusPaciente
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
	
	exec ConsultaEstatusPaciente '225BB75B-01A7-4CFD-A834-14B20B30E3C2'
	
	
------------------------------------------------------------------


	create trigger tr_InsertMedicamentos
	on Medicamento
	after INSERT --delete/*instead*/
	as begin

		Select * 
		FROM Medicamento

	end


	INSERT INTO Medicamento ([IdMedicamento],[Nombre],[Descripcion],[IdCategoria],[IdProveedor],[IdLaboratorio],[NombreGen],[PrecioBase] )
	VALUES (NEWID(), 'Ibuprofeno', 'Dolo de cabeza, 500mg',4,6,4,'Ibuprofeno', 55 )


-----------------------------------------------------------------


	create trigger tr_InsertMedicamentos
	on Sucursal
	INSTEAD OF Delete 
	as begin
		
		 PRINT N'Nel, no se puede borrar /n/n ';  
		
	end
	
	
	Delete Sucursal

*/
