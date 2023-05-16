DELIMITER //

CREATE PROCEDURE EditarTarjetaPago(
    IN p_idTarjeta INT,
    IN p_idPago INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idPago existe
    SELECT COUNT(*) INTO num_rows FROM TarjetasPagos WHERE idPago = p_idPago;

    IF num_rows > 0 THEN
        -- Validar que la tupla idPago no exista (excepto para idPago)
        SELECT COUNT(*) INTO num_rows FROM TarjetasPagos WHERE idPago = p_idPago AND idPago != p_idPago;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE TarjetasPagos SET idTarjeta = p_idTarjeta WHERE idPago = p_idPago;
        ELSE
            SELECT 'La combinación de idTarjeta y idPago ya existe en otra asociación de tarjeta y pago.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idPago buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
