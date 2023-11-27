SELECT
    D.DescDepto,
    P.DescProducto,
    P.Precio,
    P.Cantidad
FROM
    Departamentos D
    INNER JOIN ProductoDepto PD ON D.IdDepto = PD.IdDepto
    INNER JOIN Productos P ON PD.IdProducto = P.IdProducto
WHERE
    D.DescDepto = 'Frutas'
    AND P.Activo = 1
    AND P.Cantidad > 0;
