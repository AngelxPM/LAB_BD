CREATE VIEW [MayorVenta] AS
SELECT Venta.idVenta, Venta.idCaja, Venta.idEmpleado, (SELECT MAX(Venta.Total)FROM Venta) as 'Maxima Venta'
FROM Venta
WHERE Venta.Total = (SELECT MAX(Venta.Total)FROM Venta) 


CREATE VIEW [MayorVentaNombre] AS
SELECT Venta.idVenta, Venta.idCaja, Empleado.Nombre as NombreEmpleado, (SELECT MAX(Venta.Total)FROM Venta) as 'Maxima Venta'
FROM Venta
JOIN Empleado ON Empleado.idEmpleado = Venta.idEmpleado
WHERE Venta.Total = (SELECT MAX(Venta.Total)FROM Venta) 


CREATE VIEW [VentasEmpleadoTipoPago] AS
SELECT Venta.idVenta, Venta.idCaja, Empleado.Nombre as NombreEmpleado, Venta.Total, TipoPago.Pago as 'Pagado' 
FROM Venta
JOIN Empleado ON Empleado.idEmpleado = Venta.idEmpleado
JOIN TipoPago ON TipoPago.idTipoPago = Venta.idTipoPago



CREATE VIEW [Apartados] AS
SELECT SistemaApartado.idApartado, (Cliente.Nombre + ' ' + Cliente.ApPaterno) as 'Nombre', SistemaApartado.Debe
FROM SistemaApartado
JOIN Cliente ON Cliente.idCliente = SistemaApartado.idCliente


CREATE VIEW [ProductoProvedor] AS
SELECT Inventario.IdProducto, Inventario.CantidadExistente, Proveedores.Nombre
FROM Inventario
JOIN Proveedores ON Proveedores.idProvedor = Inventario.IdProveedor





