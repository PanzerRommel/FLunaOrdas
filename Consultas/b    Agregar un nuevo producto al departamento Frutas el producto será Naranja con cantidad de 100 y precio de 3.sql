
IF NOT EXISTS (SELECT 1 FROM Departamentos WHERE DescDepto = 'Frutas')
BEGIN
    INSERT INTO Departamentos (DescDepto, Activo)
    VALUES ('Frutas', 1);
END;

-- Insertar el nuevo producto
INSERT INTO Productos (DescProducto, Precio, Cantidad, Activo)
VALUES ('Naranja', 3.00, 100, 1);

-- Obtener el IdProducto del nuevo producto insertado
DECLARE @IdNuevoProducto INT;
SET @IdNuevoProducto = SCOPE_IDENTITY();

-- Obtener el IdDepto del departamento "Frutas"
DECLARE @IdDeptoFrutas INT;
SET @IdDeptoFrutas = (SELECT IdDepto FROM Departamentos WHERE DescDepto = 'Frutas');

-- Asociar el nuevo producto al departamento "Frutas"
INSERT INTO ProductoDepto (IdProducto, IdDepto)
VALUES (@IdNuevoProducto, @IdDeptoFrutas);
