DELIMITER //

CREATE PROCEDURE EditarMetodoPago(
    IN p_idMetodoPago INT,
    IN p_MetodoPago VARCHAR(50)
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idMetodoPago existe
    SELECT COUNT(*) INTO num_rows FROM MetodosPagos WHERE idMetodoPago = p_idMetodoPago;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE MetodosPagos SET MetodoPago = p_MetodoPago WHERE idMetodoPago = p_idMetodoPago;
    ELSE
        SELECT 'No se encontró ningún registro con el idMetodoPago buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
