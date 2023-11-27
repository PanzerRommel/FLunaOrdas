DELETE FROM Productos
WHERE
    IdProducto IN (
        SELECT P.IdProducto
        FROM Departamentos D
        INNER JOIN ProductoDepto PD ON D.IdDepto = PD.IdDepto
        INNER JOIN Productos P ON PD.IdProducto = P.IdProducto
        WHERE D.DescDepto = 'Frutas' AND P.Cantidad = 0 AND P.Precio > 50.00
    );
