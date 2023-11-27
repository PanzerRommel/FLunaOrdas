CREATE PROCEDURE InsertarRangoEnTemporal
AS
BEGIN
    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;

        -- Crear una tabla temporal
        CREATE TABLE #TablaTemporal (
            Numero INT
        );

        -- Insertar el rango en la tabla temporal
        DECLARE @Numero INT = 500001;

        WHILE @Numero <= 600000
        BEGIN
            INSERT INTO #TablaTemporal (Numero) VALUES (@Numero);
            SET @Numero = @Numero + 1;
        END;

        -- Confirmar la transacción
        COMMIT;
    END TRY
    BEGIN CATCH
        -- En caso de error, realizar un rollback
        IF @@TRANCOUNT > 0
            ROLLBACK;

        -- Propagar el error
        THROW;
    END CATCH;
END;
