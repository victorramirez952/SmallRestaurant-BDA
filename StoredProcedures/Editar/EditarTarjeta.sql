DELIMITER //

CREATE PROCEDURE EditarTarjeta(
    IN p_idTarjeta INT,
    IN p_NumeroTarjeta VARCHAR(16),
    IN p_FechaVencimiento DATE,
    IN p_Titular VARCHAR(255)
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idTarjeta existe
    SELECT COUNT(*) INTO num_rows FROM Tarjetas WHERE idTarjeta = p_idTarjeta;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE Tarjetas SET NumeroTarjeta = p_NumeroTarjeta, FechaVencimiento = p_FechaVencimiento, Titular = p_Titular WHERE idTarjeta = p_idTarjeta;
    ELSE
        SELECT 'No se encontró ningún registro con el idTarjeta buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
