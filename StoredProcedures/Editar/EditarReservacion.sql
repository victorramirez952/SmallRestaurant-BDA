DELIMITER //

CREATE PROCEDURE EditarReservacion(
    IN p_idReserva INT,
    IN p_CantidadPersonas INT,
    IN p_Comentarios TEXT,
    IN p_idHorario INT,
    IN p_idCliente INT,
    IN p_Confirmada BOOLEAN
)
BEGIN
    DECLARE num_rows INT;

    -- Verificar si la tupla idHorario-idCliente ya existe en la tabla (excepto para idReserva)
    SELECT COUNT(*) INTO num_rows FROM Reservaciones WHERE idHorario = p_idHorario AND idCliente = p_idCliente AND idReserva <> p_idReserva;

    IF num_rows > 0 THEN
        SELECT 'La combinación de idHorario e idCliente ya existe en la tabla.' AS mensaje;
    ELSE
        -- Verificar si idReserva existe
        SELECT COUNT(*) INTO num_rows FROM Reservaciones WHERE idReserva = p_idReserva;

        IF num_rows > 0 THEN
            -- Validar si los parámetros tienen los mismos datos que el registro de idReserva
            IF (p_CantidadPersonas, p_Comentarios, p_idHorario, p_idCliente, p_Confirmada) <> (SELECT CantidadPersonas, Comentarios, idHorario, idCliente, Confirmada FROM Reservaciones WHERE idReserva = p_idReserva) THEN
                -- Actualizar el registro existente
                UPDATE Reservaciones SET CantidadPersonas = p_CantidadPersonas, Comentarios = p_Comentarios, idHorario = p_idHorario, idCliente = p_idCliente, Confirmada = p_Confirmada WHERE idReserva = p_idReserva;
                SELECT 'Registro actualizado correctamente.' AS mensaje;
            ELSE
                SELECT 'Los parámetros tienen los mismos datos que el registro existente.' AS mensaje;
            END IF;
        ELSE
            SELECT 'No se encontró ningún registro con el id buscado.' AS mensaje;
        END IF;
    END IF;
END //

DELIMITER ;
