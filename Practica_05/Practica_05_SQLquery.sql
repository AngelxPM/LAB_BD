SELECT COUNT(Modelo) As 'NumDeModelos', Inventario.Color
FROM Inventario
GROUP BY Inventario.Color

SELECT SUM(Inventario.CantidadExistente) AS 'TotalInventario'
FROM Inventario

SELECT MIN(Inventario.PrecioVenta) as 'PrecioMasBajo'
FROM Inventario

SELECT AVG(Inventario.PrecioVenta) as 'PromedioPrecioVenta'
FROM Inventario

SELECT AVG(Inventario.PrecioVenta) as 'PromedioPrecioVenta-ColorNegro'
FROM Inventario
WHERE Inventario.Color = 'Negro'

SELECT AVG(Inventario.PrecioVenta) as 'PromedioPrecioVenta-ConProveedor1'
FROM Inventario
WHERE Inventario.IdProveedor = 1

SELECT MIN(Inventario.PrecioVenta) as 'PrecioMasBajo-DeMaterialPiel'
FROM Inventario
WHERE Inventario.Material = 'Piel'

SELECT COUNT(Inventario.Modelo) as 'NumProductosMayorA5', Inventario.Material
FROM Inventario
GROUP BY Inventario.Material
HAVING COUNT(Inventario.Modelo) > 5

SELECT TOP 10 *
FROM Inventario

SELECT  *
FROM Inventario
WHERE Inventario.Material = 'Piel'
ORDER BY IdProveedor DESC