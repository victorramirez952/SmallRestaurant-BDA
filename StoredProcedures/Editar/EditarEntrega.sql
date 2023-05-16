DELIMITER //

CREATE PROCEDURE EditarEntrega(
    IN p_idEntrega INT,
    IN p_EstadoEntrega VARCHAR(50),
    IN p_idPedido INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idEntrega existe
    SELECT COUNT(*) INTO num_rows FROM Entregas WHERE idEntrega = p_idEntrega;

    IF num_rows > 0 THEN
        -- Validar que la tupla idPedido no exista (excepto para idEntrega)
        SELECT COUNT(*) INTO num_rows FROM Entregas WHERE idPedido = p_idPedido AND idEntrega != p_idEntrega;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Entregas SET EstadoEntrega = p_EstadoEntrega, idPedido = p_idPedido WHERE idEntrega = p_idEntrega;
        ELSE
            SELECT 'La combinación de idPedido ya existe en otra entrega.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idEntrega buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
